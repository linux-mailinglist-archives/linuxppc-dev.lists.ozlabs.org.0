Return-Path: <linuxppc-dev+bounces-6599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA1A4B0F3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Mar 2025 11:35:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5JJ55lsgz30RN;
	Sun,  2 Mar 2025 21:35:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=143.55.146.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740911749;
	cv=none; b=AXNgIbDEfCgRLZ8HzOFYWyojv+E33bdQghxV6ljuMCRWq+uenxAqRKeHmm5QtYUVD+/aMY7jIgTLXbf2LgifHQzuXLPnCGp5z88dU2jiAbtlkFsd5ZccDbCNSO1tCX9tvY++UslI3iYgIvhgmTfchFJNa2Zd3JoeE9gARX8X/XcylgoU8bJLX3EPsgUdCGQLV84hpJlKEKX0Vj19b527AyB89jyj8Z8v0+RmdFY5j/PFCsDty5kurF0i1tmiYxWcGNStrBvyNaEj5Gbmp5Gsn8hYSwzuWSYeI+2reY/9ddPAPKKLGoND0ZtFyBrfgcBiAZ6njoQ+idnQyE4OPTcUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740911749; c=relaxed/relaxed;
	bh=kkn/vLH3NlilP2SelQiRA/jUFHo80ukT3BrqLi/hoBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+vm2wuXCKzlT7qQ4rzyn8t5YcozIwN9oNp3SYy2qrBtbBax/nct+2YU12sjhbBKQK+u5r7eNonghosiwRak+yZHsLRw5fSv3kFCRKho06flFOaR8/KIl/svdrDWzbWQ0Ny9CswwYw3PG3dbvSKZtkU8Lzmr5lOnbjtw7LW6DQGeIGUKiV1M3rm7lUIr49os2cdn5pEWs+AburwrtwFe+SwhdplnfAF1RRTcAfOhGimU1TLOfoHS92UOXs8WZKCzTykU83Ztx1+hlXDdiYj4HZH7hkTAfinUYp07/Y/X/SqKEFbQ5a8XFIw67GTdLSWqoDLXILdnh8CBE4gOukFOFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iram.es; dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=dkim3 header.b=ln/1PATa; dkim-atps=neutral; spf=pass (client-ip=143.55.146.78; helo=mx07-006a4e02.pphosted.com; envelope-from=paubert@iram.es; receiver=lists.ozlabs.org) smtp.mailfrom=iram.es
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=dkim3 header.b=ln/1PATa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iram.es (client-ip=143.55.146.78; helo=mx07-006a4e02.pphosted.com; envelope-from=paubert@iram.es; receiver=lists.ozlabs.org)
X-Greylist: delayed 1349 seconds by postgrey-1.37 at boromir; Sun, 02 Mar 2025 21:35:47 AEDT
Received: from mx07-006a4e02.pphosted.com (mx07-006a4e02.pphosted.com [143.55.146.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5JJ317rfz2xGp
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 21:35:45 +1100 (AEDT)
Received: from pps.filterd (m0316687.ppops.net [127.0.0.1])
	by m0316687.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 52297FJ6002043;
	Sun, 2 Mar 2025 11:13:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iram.es; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=dkim3; bh=kkn/vLH3NlilP2SelQiRA/jUFHo8
	0ukT3BrqLi/hoBA=; b=ln/1PATa8sGGxqAi4tgaMb05sRP7/fcJX8jDXafWK9sq
	XDoYHCFU8wvKrdodwFWtt16+cmk4sWX2AcqBwQHydZ2C3rEaP8nN2IzQ0oBQ9lfs
	BLm7PaujKAPXs0vF6UPs4U/j3jUoztZ2+xyH0+OwOV0BqqTxmyv2EmNaWowsKkKk
	g687InpCqSJ5rtQ8VBXD+TdXSYkoRAWscnTPi6XUetrlYokDGn3TUlObreYHCc1B
	0A/bQiAEt2HxY7DNlVJSoXh91Macc76aWWVXCFoiAhb1Pvr6afOsPVFtORU822zc
	v8mLaIF2drDFv3B2VD4MEv2JBTVUal0W+2AUylAY+g==
Received: from mta-out02.sim.rediris.es (mta-out02.sim.rediris.es [130.206.24.44])
	by m0316687.ppops.net (PPS) with ESMTPS id 454e8d2js1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Mar 2025 11:13:07 +0100 (CET)
Received: from mta-out02.sim.rediris.es (localhost.localdomain [127.0.0.1])
	by mta-out02.sim.rediris.es (Postfix) with ESMTPS id DC783140098;
	Sun,  2 Mar 2025 11:13:05 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta-out02.sim.rediris.es (Postfix) with ESMTP id C267B141A67;
	Sun,  2 Mar 2025 11:13:05 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out02.sim.rediris.es
Received: from mta-out02.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out02.sim.rediris.es [127.0.0.1]) (amavis, port 10026)
 with ESMTP id hLoskbFWCYv0; Sun,  2 Mar 2025 11:13:05 +0100 (CET)
Received: from lt-gp.iram.es (haproxy02.sim.rediris.es [130.206.24.70])
	by mta-out02.sim.rediris.es (Postfix) with ESMTPA id 5F3FB140098;
	Sun,  2 Mar 2025 11:13:05 +0100 (CET)
Date: Sun, 2 Mar 2025 11:13:03 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: Segher Boessenkool <segher@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/5] Microwatt updates
Message-ID: <Z8QvLwofLv4pOyA4@lt-gp.iram.es>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <20250131161343.GY20626@gate.crashing.org>
 <Z513a_fdrtUgE0gE@thinks.paulus.ozlabs.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z513a_fdrtUgE0gE@thinks.paulus.ozlabs.org>
X-Proofpoint-ORIG-GUID: hmwBKfg0LwgJsBC5XcWpLw30N1iICr7o
X-Proofpoint-GUID: hmwBKfg0LwgJsBC5XcWpLw30N1iICr7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-02_02,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=salida_notspam policy=salida score=0 impostorscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=764 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503020082
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


[Sorry, I wanted to reply earlier, but it stayed in my drafts folder for a month]

On Sat, Feb 01, 2025 at 12:22:51PM +1100, Paul Mackerras wrote:
[snipped]
> 
> 603 was a looong time ago, I don't recall the details.
> 
> Regarding broadcast TLBIEs, the protocols and mechanisms for doing
> that are known to be complex and slow in the IBM Power processors (ask
> Derek Williams about that :).  Anton found that in fact doing only
> local TLBIEs and using IPIs gave *better* performance on IBM Power
> systems than using hardware broadcast TLBIEs in many cases (the reason
> being that software knows which other CPUs might have a given TLB
> entry, often quite a small set, whereas hardware doesn't, and has to
> send the invalidation to every CPU and wait for a response from every
> CPU).  Add to that, that most other SMP-capable CPU architectures
> don't do broadcast TLB invalidations, Intel x86 for example.

Actually it's coming to x86, at least on the AMD side:

https://lore.kernel.org/all/20250206044346.3810242-1-riel@surriel.com/

with performance numbers which look rather good.

I don't know how it looks like at the level of the hardware protocol,
but implementing it on a single chip/socket is likely relatively simple.

Gabriel

> 
> > > the kernel already has code to deal with this.  One of the patches in
> > > this series provides a config option to allow platforms to select
> > > unconditionally the behaviour where cross-CPU TLB invalidations are
> > > handled using inter-processor interrupts.
> > 
> > Are there plans to broadcast the (SMP cache invalidation) messages?
> 
> Cache (i.e. instruction and data cache) - yes, they *are* coherent.
> More precisely, the D caches are write-through, and all I and D caches
> snoop writes to memory (including DMA writes) and invalidate any cache
> lines being written to.
> 
> > Will uwatt support some real bus protocol, for example?
> 
> "Real" meaning using tri-state bus drivers, like we did in the 90s? :)
> 
> > Again, congrats on this great milestone!  Does this floating point
> > support do square roots as well (aka "gpopt"; does it do "gfxopt" for
> > that matter, fsel?)  fsqrt is kinda tricky to get to work fully
> > correctly :-)
> 
> Yes, fsqrt and fsel are implemented in hardware, and are accurate to
> the last bit.  Also, the FPU handles denormalized values in hardware
> (both input and output) and implements all exception handling as per
> the ISA, including the trap-enabled overflow cases.  Feel free to run
> whatever tests you like and report bugs.  But we're getting a bit
> off-topic from the kernel patches. :)
> 
> Paul.
> 
 


