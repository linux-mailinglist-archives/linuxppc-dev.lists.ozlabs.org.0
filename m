Return-Path: <linuxppc-dev+bounces-3626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 732DB9DF55C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Dec 2024 12:19:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1PZk2rMsz2xYs;
	Sun,  1 Dec 2024 22:19:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733051982;
	cv=none; b=aL8kBVo808swVKV8CYWgaixIm5i//7U+Lt4zl3rEFyrXh01ATPIjS8hHyuCTSEt93KkOaOYN3JfbVlESev3KTlt1judL7cHer76DXX0VzrSRolcQuru1WMBddY/tfsm0/PylCarw8CmaP+QUl7CSXZIUiu/SuLp8gj+pJYJPjZAcMfLuObjVBJYxZJ96aszlG6ZYSsMrQjrj5X2/xRmTzVLRcXFkF7X8idThWHptue0ltoa3JKIF3wICVbkwEiC2diPBoFnVW7ggsQcDW7XzvIqxLZkVXSyAHSK3jD7TbKv+bsOekZKb2KPAvnOoCgnt2HJqqVGm291vR+D+qb8aTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733051982; c=relaxed/relaxed;
	bh=WDyHPlNEUnQgzVFHMrpiQsLtL9Qxe5uHkWbmpd0Bcaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KfSPiPJS+GS/vW/G5CIt5f0Nz+B9Pf7wVMXAhuU/pCuvcSWs8Wj0/1/1y8PFD2+/b0vRhOQcjiGXs1p41sNvtiSuGULsUP+MRc+jsFlU0gcvfNAF7PfA9toAmxecSp22jdQ1xRonP/9VJslaxr+6bYXGcE3Y9UK5SFVmUxMmCiBSyo5HCfOsqXePOFjk3omiiRyR0P6J/i8Q0EvPntXciy2hKna2lsdKX9PBk/A+PBFQtISsqLYJ0+zWjpkG4rShS7D2Aj7TPZ0xBBIc/mAOsBA5Dj0iwS9IrXuSS0lLoDGnm/Ei25LPOiomMmTTJTKCBCEtIgrct8c4joUIrCybFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZwIwIPeW; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Qpo34jto; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZwIwIPeW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Qpo34jto;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1PZh5FW3z2xDl
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Dec 2024 22:19:40 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733051975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WDyHPlNEUnQgzVFHMrpiQsLtL9Qxe5uHkWbmpd0Bcaw=;
	b=ZwIwIPeWzc5fJpnBy3tPkmLGRBSLhA0IhvVbKfuB3pCaqDtPBSoXPSSPzHJj5lqePQJXZh
	saw2tyB35caaY1WRFOOTDakG87Rac2CiBdgcnEsVaETGUZ2LIkmO1J6YwGTSL60CTVkkH8
	UPQytJ5nue8MzA2ECyCa5/jfb7zj3bdluniKiU5Dg6qFv7r0CF0BTSTzCVR2/kbHECM+qi
	2dm1pSbgrZliexsj8Vvshwtgchh9EWLqZOT6d2lnwBtk5lNDOLeJPTs/ncJW8sQH6Q4ezl
	X9WB+Csibt8PBhXoLKo6jpbXp4JW7Odw5JyXpzF67j4AGfJ9SoYaAWroXh/eFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733051975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WDyHPlNEUnQgzVFHMrpiQsLtL9Qxe5uHkWbmpd0Bcaw=;
	b=Qpo34jtob1LbosMBtAl47/xmhuQNsC1tJXAj85I8Uxf5h6BuaXY+7PhCcNAx7cLLndI2rx
	VgnJuardsEMXGrDw==
To: "Farber, Eliav" <farbere@amazon.com>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
 <npiggin@gmail.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "naveen@kernel.org" <naveen@kernel.org>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ebiederm@xmission.com"
 <ebiederm@xmission.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>,
 "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
 "sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
 "adityag@linux.ibm.com" <adityag@linux.ibm.com>,
 "songshuaishuai@tinylab.org" <songshuaishuai@tinylab.org>,
 "takakura@valinux.co.jp" <takakura@valinux.co.jp>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "kexec@lists.infradead.org"
 <kexec@lists.infradead.org>, Marc Zyngier <maz@kernel.org>
Cc: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v4 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
In-Reply-To: <cd8809e379dc4dd089350ec2d1f8c210@amazon.com>
References: <cd8809e379dc4dd089350ec2d1f8c210@amazon.com>
Date: Sun, 01 Dec 2024 12:19:34 +0100
Message-ID: <87frn7wszd.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Nov 30 2024 at 20:08, Eliav Farber wrote:
> On 11/29/2024 3:30 PM, Thomas Gleixner wrote:
>> Looking deeper. This function actually cannot be called from this
>> context. It does:
>>
>>           irq_get_desc_buslock(irq, &flags, 0);
>>
>> which means for any interrupt which has an actual buslock implementation
>> it will end up in a sleepable function and deadlock in the worst case.
>>
>> Marc?
> I will wait for Marc's response regarding this issue.
> Regardless, if any changes are required, I believe it would be better
> to address them in a separate patch, as this behavior existed before my
> modification.

Correct.

