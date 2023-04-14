Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C835E6E2453
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:34:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pycqk50sMz3fXB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:34:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LbHBWgN9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccq0VS1z3fRF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:24:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LbHBWgN9;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccp6VY6z4xKZ;
	Fri, 14 Apr 2023 23:24:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478699;
	bh=znPx9Hc0jzHizS8N/2WJ48eHjtehQcnJdaSnJfbSngs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LbHBWgN9TS42EAWb8WakbybWd21TKUEBNQ5d/PbH16JxyF4f/p8gtmK7URbsEH9o2
	 zUFOMoa7CnczASd2AbwKI9q1OUmrFfmiVLwVCIIzyzchR8zpHd5ioLZEujg2g4USmp
	 ExQvfScqSbQ4nabechz8kpS1PwgPweHS1smuqLkiAYSmMqhcSD/Qh1tKo/i+XAUSu0
	 UxwoAmnT5OXt9SCiI773xSZiZbLhKENJcssnUOBpNIcrlBrUI4tLzBBVJKI993g+If
	 qoLDCgOLjO1pENDr2up844RxzFha3N2iFF6AI+JdZDW992l2yfAVdrgEtr2lHNs9dC
	 CMK87HsBt75XA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 12/32] powerpc/configs/64s: Enable common CGROUP & related options
Date: Fri, 14 Apr 2023 23:23:55 +1000
Message-Id: <20230414132415.821564-12-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Distros enable these options.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 7e265cbbeaef..e853905c4e7e 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -19,15 +19,20 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=18
 CONFIG_LOG_CPU_MAX_BUF_SHIFT=13
 CONFIG_NUMA_BALANCING=y
-CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
-CONFIG_CGROUP_SCHED=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_HUGETLB=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_PERF=y
 CONFIG_CGROUP_BPF=y
+CONFIG_CGROUP_MISC=y
+CONFIG_USER_NS=y
+CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_PPC64=y
-- 
2.39.2

