Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4028E7B2994
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 02:32:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dim-sum.org header.i=@dim-sum.org header.a=rsa-sha256 header.s=chowmein header.b=LW+N+dK0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxWX11J2Gz3cc2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 10:32:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dim-sum.org header.i=@dim-sum.org header.a=rsa-sha256 header.s=chowmein header.b=LW+N+dK0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dim-sum.org (client-ip=81.187.240.206; helo=chowmein.spicy.dim-sum.org; envelope-from=drw@dim-sum.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 355 seconds by postgrey-1.37 at boromir; Thu, 28 Sep 2023 23:00:02 AEST
Received: from chowmein.spicy.dim-sum.org (chowmein.spicy.dim-sum.org [81.187.240.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxD8y1wdMz300f
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 23:00:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dim-sum.org;
	s=chowmein; t=1695905638;
	bh=nlqMPIPQ2nk7liNiI2T4ncccE2lWWB2ZxXWUinb+ev4=;
	h=Date:From:To:Subject:From;
	b=LW+N+dK0BUu7anVf8h5vL/e2dOCa1s68aki9pyyG7LUpJ6kWMtmbaP1FH6EWJEjsp
	 oQPRFwUP5KKUietfQx5xIsQBbfRx2rU2OLXPvkLS6ai+iWn6AbQXoyGrzG+q6CUQv/
	 KURLeewI7p1NAFCDJe09swkGHTbVTScaL6iSd03WKtK7Tx4AQ/tdSP0YHkEAtf2C4w
	 Q7MsahxOlpyM5BXxe0Df90BjwgVtNX8v4vC4KA5wUTD5EcSWWxW57U/RpTcIiT+kjB
	 otB92qp6Nl7nRU2LOQd8a0gk0GlK78O/5pTZ519XPJBQksG3W75ksjodWzMvUNw/5K
	 X/WvlktSg4v+Q==
Received: from dim-sum.org (b.8.4.f.1.4.e.f.f.f.1.5.6.4.c.e.4.1.0.0.9.9.f.f.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:ff99:14:ec46:51ff:fe41:f48b])
	by chowmein.spicy.dim-sum.org (Postfix) with ESMTPS id DF6F4E00036
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 13:53:56 +0100 (BST)
Date: Thu, 28 Sep 2023 13:53:55 +0100
From: Dan Whitehouse <drw@dim-sum.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: Kernel Panic 6.5.0-1 PPC
Message-ID: <ZRV3Y3g2fTvE91Zs@dim-sum.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 29 Sep 2023 10:31:49 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, 
I'm running Debian on an old Powermac (32-bit PPC G4).
I'm seeing kernel panics with 6.5.0-1.
Everything seems to be fine with:

Linux powermac-g4 6.4.0-4-powerpc #1 Debian 6.4.13-1 (2023-08-31) ppc
GNU/Linux

 0.000000] MSR:    00009032 <EE,ME,IR,DR,RI>  CR:  48024242  XER:  00000000
    0.000000]
    0.000000] GPR00: c0b29234 c13fde60 c12f3580 c12f3580 c12f3580 c13fde74 0000
cc0 00000000
    0.000000] GPR08: 00000000 00009032 00000000 00000000 28024242 00000000 0000
000 00000004
    0.000000] GPR16: 02d159f4 00000000 02d1515c c00f6d38 00000000 00000004 0000
cc0 00000000
    0.000000] GPR24: c12f398c c0b29704 00000001 00000003 c12f3580 c1305080 c12f
5cc c12f3580
    0.000000] NIP [c0b28e4c] __schedule+0x364/0x920
    0.000000] LR [c0b29234] __schedule+0x74c/0x920
    0.000000] --- interrupt: 900
    0.000000] [c13fdeb0] [c0b29704] __cond_resched+0x40/060
    0.000000] [c13fdec0] [c0b2b5f0] mutex_lock_killable+0x24/0x74
    0.000000] [c13fdee0] [c02c3930] pcpu_alloc+0x54c/0x798
    0.000000] [c13fdf50] [c00f6d38] alloc_desc.irsa.0+0x60/0x174
    0.000000] [c13fdf80] [c1199c58] early_irq_init+0x70/0x9c
    0.000000] [c13fdfa0] [c1183abc] start_kernel+0x4e4/0x640
    0.000000] [c13fdff0] [00003540] 0x3540
    0.000000] Code: 7d2a01a4 4c00012c 4bffff28 7c0802a6 90010004 60000000 9421f
e0 7c0802a6 3d20c141 93e1001c 90010024 83e9c294 <943f1ff0> 7fe1fb78 48b24909 80
10000
    0.000000] ---[ end trace 0000000000000000 ]---
    0.000000]
    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle t
ask! ]---

-- 
Dan Whitehouse

GPG: 3AA4 369C 86E1 4939 D420  AB25 D0DC 7BDD CA92 AD2E
Telephone: +44(0)203 0955088
