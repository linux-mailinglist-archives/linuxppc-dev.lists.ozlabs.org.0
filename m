Return-Path: <linuxppc-dev+bounces-12693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ECABC1DDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 17:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgzzV6hcGz3bjb;
	Wed,  8 Oct 2025 02:08:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759849702;
	cv=none; b=RZ8+Yy15Jx9Ixhdrg9R+WmNWRUZqOHkH4yXtB8/+AXewgLBTDW2p1V8wa3JWL1Z/hjT/ulLRVCGEAOR3FgksXFOfrb2Lij5Rt8FkFSZeiY2n/B+iQHadYzq4YMvNWNj+L1rN99JgGT73CQEWouq88taW4FVKOfrkMZzvfR8yCd2oUGD7mgsj2tdVknEAP9BthCfK7CJJYot/RnoOJMTVWcZNuKRPPDR9JV2q4AtbAkc3uP/T/XP3uisvbxUdb0DFTPF4juenBsfENTfCsPLGMsl6cdjnnhF0kF2LC3xRZnbHlQ6Cqx4GuHgyeVn2MTsKn95g6k06elv9CVeD72tWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759849702; c=relaxed/relaxed;
	bh=lwuiILyNljPc/pGF/DwYzC5Yq//Ho19n9iQQGYFYzXs=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GLFLgTyUKk5MgulwkbL5o+YTkTRfHBeqnRt5xDODvoKROlxEVOVCpUZNGj61/Lek8sZiI0tyjDna+CRCuythFeC5mqRMklU1cwI/y+Ye9bNvBoQYUt1Uj2tnz8aYesb41uXXLKG3eFzQO9ZeZ2ijYFfM9W5KWBEJmsGCNVeMCVhZDGZ4OJ52W1A4wv5zHx2F9Se4xh/SpTaO1do5FcKhPliz94XAIlPwQ4z6nFAE4n+at5WnwgNFMm2pZrdkd4Touy2vz+tHCcMmjV5zJiD+WUGs0qWzdKVreUpRY/++OVn9ADgP44AY7TdZ5ecgAYktEDk9qrsv5zv6IyY+7v4+nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1xTLpEMd; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FgB82ZS7; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1xTLpEMd;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FgB82ZS7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 35019 seconds by postgrey-1.37 at boromir; Wed, 08 Oct 2025 02:08:21 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgzzV02Znz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 02:08:21 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759849695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwuiILyNljPc/pGF/DwYzC5Yq//Ho19n9iQQGYFYzXs=;
	b=1xTLpEMdJFBGqHDQkx1jHqvqyJLl9zJx3NeaVRTj2PIyEOO/4lCWjEbWL7twgB5CD02DjO
	Mn6CQLRKmsg9g8tOKWuWjX+k+tW0Tn9YoD0+eosOqO5fmKd3MHgbvH2GC6f8tE1OHkDp+/
	wFEJZc3Lw36ECQg08fa2BFKLkKBFuIBRBPScZbxhRAmzzktGOkNIpMhiHDTs5tFO+GeHhN
	8G84WynaZHuAGqcSMfFcMnJtt9dpCIsALqbcr5CPr8yWBApTXQzDqa4YKToo4RoGhtFuI4
	dIfre/2SIsneQz17QFmM4k3qHVWI0F/oMCsP6/iSAAJbY7meQPJX7wT9X2kWtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759849695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwuiILyNljPc/pGF/DwYzC5Yq//Ho19n9iQQGYFYzXs=;
	b=FgB82ZS7utrlEobQnHn3iaXSzw87eyZ9gVfWg32mGvG8miU60ovILqbg3DXR/IC7zhXrP4
	3ScuJ6ItK+I/7/Cw==
To: Ritesh Harjani <ritesh.list@gmail.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Gautam Menghani <gautam@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] powerpc/xive: Untangle xive from child interrupt
 controller drivers
In-Reply-To: <875xcrxp10.fsf@yellow.woof>
References: <cover.1754903590.git.namcao@linutronix.de>
 <83968073022a4cc211dcbd0faccd20ec05e58c3e.1754903590.git.namcao@linutronix.de>
 <68e48df8.170a0220.4b4b0.217d@mx.google.com> <875xcrxp10.fsf@yellow.woof>
Date: Tue, 07 Oct 2025 17:08:14 +0200
Message-ID: <87playvjfl.fsf@yellow.woof>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Nam Cao <namcao@linutronix.de> writes:

> Hi Ritesh,
>
> Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
>> I am facing kernel crash on host when trying to run kvm pseries guest on
>> powernv host. Looking it a bit more closely, I see that we are missing
>> conversion of xxx_irq_handler_data()) to xxx_irq_chip_data() at few other
>> places, including in powerpc KVM code. 
> [snip]
>> Here is the diff which fixed this.. 
> [snip]
>> ... However grepping for "handler_data" in arch/powerpc I see there is
>> atleast one more place where we may still need the fix.. There are few
>> more places which grep returned - but I am not sure if they all really need
>> the fix. But I guess VAS should be fixed i.e :
>>
>> arch/powerpc/platforms/powernv/vas.c:   xd = irq_get_handler_data(vinst->virq);
>>
>> Would you like to submit an official patch for converting these other places too?
>
> Thanks for the report. I didn't expect struct xive_irq_data to be used
> in multiple files while making that patch, sorry about that!
>
> Something like your patch should do the job. However, my gut feeling is
> that multiple files shouldn't share a single irq struct this way. Let me
> stare at it...

I *think* we can do a cleanup. But I don't think it would be trivial
enough for 6.18. Let's do as you suggested for now to get KVM functional
again.

Nam

