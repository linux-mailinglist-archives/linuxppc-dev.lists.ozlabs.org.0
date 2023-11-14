Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 683FC7EAB53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 09:06:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=qNjLAoEq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STzR32JCkz3d8X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 19:06:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=qNjLAoEq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STzQD1bdmz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 19:06:12 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 5829C8285720
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 02:00:28 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xtFilpDi9VzM for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 14 Nov 2023 02:00:27 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8AB1582857F5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 02:00:27 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8AB1582857F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699948827; bh=suyxsTRgUHoTupfIsnXMRC4HT7HeuMOWgcutMPwBqoI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=qNjLAoEqkW3e8uar+D5j2Y+CqYHsNSMHjy/t7xbkwigQfjSCiFpXn/spqGwTVvIcg
	 gmH5/zTD7jf5Tm7BzdTT/+UfWadULCVP53BBHaj9Bl4PWMGihd9DMprgUsIDY4l5Kx
	 DsrvUdML7KLzJQax4k79yO0Q3g1CVUW39kdlvmCo=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qeYGMQFlFWIc for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 14 Nov 2023 02:00:27 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 6FC148285720
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 02:00:27 -0600 (CST)
Date: Tue, 14 Nov 2023 02:00:27 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <1654757454.47202735.1699948827325.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] powerpc: Fix data corruption on IPI
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Index: zBeRP6MO5khiC0E4H/wkBqyzYrxO1Q==
Thread-Topic: powerpc: Fix data corruption on IPI
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

From 0b2678b7cdada1a3d9aec8626f31a988d81373fa Mon Sep 17 00:00:00 2001
From: Timothy Pearson <tpearson@raptorengineering.com>
Date: Mon, 13 Nov 2023 22:42:58 -0600
Subject: [PATCH] powerpc: Fix data corruption on IPI

On multithreaded SMP workloads such as those using io_uring, it is possible for
multiple threads to hold an inconsistent view of system memory when an IPI is
issued.  This in turn leads to userspace memory corruption with varying degrees
of probability based on workload and inter-thread timing.

io_uring provokes this bug by its use of TWA_SIGNAL during thread creation,
which is especially noticeable as significant userspace data corruption with
certain workloads such as MariaDB (bug MDEV-30728).  While using
TWA_SIGNAL_NO_IPI works around the corruption, no other architecture requires
this workaround.

Issue an lwsync barrier instruction prior to sending the IPI.  This ensures
the receiving CPU has a consistent view of system memory, in line with other
architectures.

Tested under QEMU in kvm mode, running on a Talos II workstation with dual
POWER9 DD2.2 CPUs.

Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/smp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index ab691c89d787..ba42238de518 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -369,8 +369,10 @@ static inline void do_message_pass(int cpu, int msg)
 
 void arch_smp_send_reschedule(int cpu)
 {
-	if (likely(smp_ops))
+	if (likely(smp_ops)) {
+		__smp_lwsync();
 		do_message_pass(cpu, PPC_MSG_RESCHEDULE);
+	}
 }
 EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
 
-- 
2.39.2
