Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 423151B0240
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 09:07:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495Hnp5245zDqrT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 17:07:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495Hkd2dqGzDqnf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:04:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=noVjUuTR; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 495Hkd0tnfz9s71;
 Mon, 20 Apr 2020 17:04:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587366281;
 bh=II93fe5qoEg/RB29rgoPaGD/lALoGpYHbek7N1QOFUI=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=noVjUuTR6I+r+9Sfrw6J6YK71pkNxRHDhVg83+hze9yWb/cLeOMm+AQu5iUIDpX37
 q5Fb4ANDPCDve29VmUM4DgsHB9ysO2JZZ8HkSCDIisw/Rx5c9Sxb2bmLlUz8F2uwLM
 bcq/Qsv0K5YsZR6xu0Z6Rz299Z/bouDL1n4ziYQ89ybAPQw4oa1sNrfpKZqg872I7L
 Wiq7k6A/S2zpJwINz69j/tS8OmePSXu5/ehUi7L7ujU697a50ah0PbI4qfgPleky5P
 zbZKoYDmfPA4amHPK/8Yd3gz+R5I65FNr5lgTW3T0fO4EEvumzryikq5R4Y5KKCzO/
 dLBt2SEzlb1qg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/book3s64/kuap: SPRN_AMR modification need CSI
 instructions before and after
In-Reply-To: <1587345091.ewst0wvt61.astroid@bobo.none>
References: <20200419135359.731325-1-aneesh.kumar@linux.ibm.com>
 <1587341611.capj46kr99.astroid@bobo.none>
 <1587345091.ewst0wvt61.astroid@bobo.none>
Date: Mon, 20 Apr 2020 17:04:55 +1000
Message-ID: <87y2qqhc2w.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Nicholas Piggin's message of April 20, 2020 10:17 am:
>> Excerpts from Aneesh Kumar K.V's message of April 19, 2020 11:53 pm:
>>> As per the ISA, context synchronizing instructions is needed before and after
>>> SPRN_AMR update. Use isync before and the CSI after is implied by the rfid
>>> that we will use to switch to a new context.
>> 
>> Not entirely sure if we need this. This will restore AMR to more 
>> permissive, so if it executes ahead of a stray load from this
>> context, it won't make it fault.

I thought we'd convinced ourselves it didn't matter in practice due to
the proximity of the entry/exit.

>> That said, leaving this end open makes it harder to reason about
>> user access protection I guess, so let's add it.
>
> We probably should test whether it needs updating, like the entry 
> code does.

That will be the common case (no update), so yes I agree.

cheers
