Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851C54B2B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 16:01:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMqqV2kwvz3dQR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mci0gdfE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMqpr4ngdz2xB1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 00:01:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mci0gdfE;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMqpn46XXz4xYC;
	Wed, 15 Jun 2022 00:01:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1655215265;
	bh=jm37to/rlw+7aKcpYlrLtBwGTwhDtqVBP2cc1UQ5Qjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mci0gdfEwp9PANDqDsvL9gdk5jXDao1BUELp4g5yA6y25rGWrB9Lc1UW+rNl5Rzht
	 gKU16fJXogdCSWYw0X0sfEfvJ40bq46Ew6g+dWMSjOOOOeKsQcCeQOZFKRcmIWVB8C
	 sR8wfoyUFIokBtsAHvmm7rsyTRLCngnXSffqctPL7GYkjjqi976YM+4gnyd9kDHkze
	 sjMcWE6fkN7qdiJjAdKv83vEyZfQiqkuHgN6mJVlUxHvcW0VgpS8d0HBlSltrLokBv
	 V4j5qeYfKPNrvdQhoGwK+NInH6XlSqhulgGG4CPjlPfx7xW95ZvqHRNfZ+GCc4em+2
	 E2cxmAW5RqNeA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: erhard_f@mailbox.org
Subject: Re: [Bug 216095] New: sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
In-Reply-To: <bug-216095-206035@https.bugzilla.kernel.org/>
References: <bug-216095-206035@https.bugzilla.kernel.org/>
Date: Wed, 15 Jun 2022 00:01:01 +1000
Message-ID: <87zgifbazm.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, tzimmermann@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Erhard,

This is presumably caused by:

  52b1b46c39ae ("of: Create platform devices for OF framebuffers")

Can you try the patch below?

cheers


diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 3507095a69f6..a70ff9df5cb9 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -556,7 +556,7 @@ static int __init of_platform_default_populate_init(void)
 			if (!of_get_property(node, "linux,opened", NULL) ||
 			    !of_get_property(node, "linux,boot-display", NULL))
 				continue;
-			dev = of_platform_device_create(node, "of-display", NULL);
+			dev = of_platform_device_create(node, NULL, NULL);
 			if (WARN_ON(!dev))
 				return -ENOMEM;
 			boot_display = node;
@@ -565,7 +565,7 @@ static int __init of_platform_default_populate_init(void)
 		for_each_node_by_type(node, "display") {
 			if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
 				continue;
-			of_platform_device_create(node, "of-display", NULL);
+			of_platform_device_create(node, NULL, NULL);
 		}
 
 	} else {


bugzilla-daemon@kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=216095
>
>             Bug ID: 216095
>            Summary: sysfs: cannot create duplicate filename
>                     '/devices/platform/of-display'
>            Product: Platform Specific/Hardware
>            Version: 2.5
>     Kernel Version: 5.19-rc1
>           Hardware: PPC-32
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: PPC-32
>           Assignee: platform_ppc-32@kernel-bugs.osdl.org
>           Reporter: erhard_f@mailbox.org
>         Regression: No
>
> Created attachment 301127
>   --> https://bugzilla.kernel.org/attachment.cgi?id=301127&action=edit
> dmesg (5.19-rc1, PowerMac G4 DP)
>
> [...]
> sysfs: cannot create duplicate filename '/devices/platform/of-display'
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc1-PMacG4+ #3
> Call Trace:
> [e9025cc0] [c05984d0] dump_stack_lvl+0x60/0x90 (unreliable)
> [e9025ce0] [c02f043c] sysfs_warn_dup+0x64/0x84
> [e9025d00] [c02f05cc] sysfs_create_dir_ns+0xfc/0x118
> [e9025d30] [c059ffa4] kobject_add_internal+0x114/0x2f0
> [e9025d60] [c05a0790] kobject_add+0x80/0xf0
> [e9025da0] [c064c3d8] device_add+0x114/0x94c
> [e9025e10] [c06f197c] of_platform_device_create_pdata+0xb8/0x144
> [e9025e40] [c0c43bb4] of_platform_default_populate_init+0x284/0x2f4
> [e9025e70] [c0007a94] do_one_initcall+0x50/0x294
> [e9025ee0] [c0c03ff0] kernel_init_freeable+0x228/0x334
> [e9025f20] [c0007efc] kernel_init+0x28/0x144
> [e9025f40] [c0019334] ret_from_kernel_thread+0x5c/0x64
> kobject_add_internal failed for of-display with -EEXIST, don't try to register
> things with the same name in the same directory.
>
> -- 
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are watching the assignee of the bug.
