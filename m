Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCCE1CD5B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 11:52:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LGSj18hjzDqgZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 19:52:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LGPW6HCjzDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 19:49:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JRukqGNP; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49LGPV31Zvz9sPF;
 Mon, 11 May 2020 19:49:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589190590;
 bh=AjMCYIZ0wEUxS7uyFWkbN71AfHjOyur8/k2vaOmwjwA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JRukqGNPZSAgwtmolKvDpK0tEpn7TEunNdLyIYyW/ao96F4SZIFjSofIxKC/k4pCW
 XYNg3m/jClG8sspNety/eStwXQhqHvaV2EqHUGN8f+U2iiWZHRX3Lwf5R2Dm3RABnN
 lNPpTy1fldrl0m6wKS0Yo4PdebF5VEyRIK9q7E5O05sTnD7vZEPzcnhFC4OOwWpVO/
 LE31vJ+cDwWEE9sk6ZexIR31eI6pfvrzkm7/7NeOzo14xuZGM7LImP2LTXug7s7icI
 6NVoszDeZqoMWCM3RSY5QLWpC8bLY5CE1bnnCLNuKNSLeOHebVf+Je00fbbSk/VDdU
 y+ESqai6JzzLQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v4 11/16] powerpc/64s: machine check interrupt update NMI
 accounting
In-Reply-To: <1589010505.dk8cddftjn.astroid@bobo.none>
References: <20200508043408.886394-12-npiggin@gmail.com>
 <202005091105.sXZ24DNr%lkp@intel.com>
 <1589010505.dk8cddftjn.astroid@bobo.none>
Date: Mon, 11 May 2020 19:50:06 +1000
Message-ID: <871rnqdcmp.fsf@mpe.ellerman.id.au>
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
Cc: kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from kbuild test robot's message of May 9, 2020 1:13 pm:
>> Hi Nicholas,
>> 
>> I love your patch! Yet something to improve:
>
> ...
>
>>   1419	#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
>>   1420			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
>>   1421	#else
>>   1422			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
>>   1423	#endif
>>   1424	#ifdef CONFIG_PPC64
>>> 1425		pr_cont("IRQMASK: %lx IN_NMI:%d IN_MCE:%d", regs->softe, (int)get_paca()->in_nmi, (int)get_paca()->in_mce);
>
> Oh I meant to get rid of that hunk, it crept back in :(
>
> mpe if you could please take it out if you're merging this.

Yep. I just came here to tell you I'd dropped that hunk :)

> It was quite useful for debugging this stuff, I might do a proper patch 
> for this, but for now not necessary (it doesn't matter for "normal" 
> crashes only crash crashes).

Yeah would be good to print more of those flags.

cheers
