Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 248C46A04BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 10:25:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMngT0PKhz3cJq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 20:25:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RtK2SFUc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMnfW0cQHz2yw0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 20:24:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RtK2SFUc;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PMnfV625vz4x5c;
	Thu, 23 Feb 2023 20:24:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677144274;
	bh=hFqhrt7u1WjD0sRxb0fgkvK3+Rpur1bct1FveQKjbjs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RtK2SFUch390YqXaK8RsAUngH74SLzJwAiXdlkX/eacGVfL9iaHhRMv0lAl4FEjNh
	 LfksbWPPg5AMgAM3zgVVyU0j1ptpMoGBmUP1stTMbAynR6z3Y3r2BqStqR/+IN971L
	 0O6arDFU5/UwRr5phmdEMjwZI5Psb5TGEac1tJpHm2IYDhcyeiucrpLWQt8oEb1v7y
	 DAM/APeV+PKNdGk7O2rCueI0A6JOpapKtEAh5CQBfhXuQWu+GEFO8bc0Rn59EzMXMI
	 W5SiF/zovskSMf0BPOf9Ce/40FBaJQHVZLSH3t8ojHh+6t9y5at7nACRT+cksChBAJ
	 pjYoAqfVO61NQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to  lwsync
In-Reply-To: <Y/bvClrV60CXK79G@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
 <20230222174719.GA1400185@paulmck-ThinkPad-P17-Gen-1>
 <87fsaxavk2.fsf@mpe.ellerman.id.au>
 <Y/bvClrV60CXK79G@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Date: Thu, 23 Feb 2023 20:24:34 +1100
Message-ID: <871qmgbup9.fsf@mpe.ellerman.id.au>
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
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
>  
>> You are correct, the patch is wrong because it fails to account for IO
>> accesses.
>
> Okay, I looked at the PowerPC ISA and found:
> "The memory barrier provides an ordering function for the storage accesses
> caused by Load, Store,and dcbz instructions that are executed by the processor
> executing the sync instruction and for which the specified storage location
> is in storage that is Memory Coherence Required and is neither Write Through
> Required nor Caching Inhibited.

Yep, that's the key sentence there. If you look at the definition for
"sync" it has not exceptions for different storage types.

I agree it's not very clear unless you're looking closely.

> Thanks for your time, Michael. Sorry for the noise.
>> 
>> Kautuk, I'm not sure what motivated you to look at these barriers, was
>> it just the documentation you linked to?

> I read the basic documentation. Now that I have access to the PowerISA
> document I guess I'll go through it more thoroughly.

The ISA is available publicly. There's links to most versions here:

https://wiki.raptorcs.com/wiki/Power_ISA

cheers
