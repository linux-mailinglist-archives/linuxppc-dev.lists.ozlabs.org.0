Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE0A70FB3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 18:01:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRGC819DRz3f7g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 02:01:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HSFJzRRC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRG5n5JCcz3f7j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 01:57:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HSFJzRRC;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QRG5n3LS7z4x4h;
	Thu, 25 May 2023 01:57:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684943821;
	bh=/FtYMyB7poZGUMvCE81c4lY8GXeGVKC0EWKKL9gy9gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HSFJzRRC6t+1mz+9xiS3Rf71C3a2AYali0O+P+1x7Epz6gpsOX6HGczug2tnxqi95
	 ayvei4RUBsdleHqMnfpH1LxF1hATCz1CumdxODlxM+ZetpAJfNkFiSVZDAKPzAGZqO
	 +gaIcdHCpN9tA7uL/2Qp41wa2eayO6MuJRBFx8jBF72K0Q9liUyljT6iPG8xlKQQFy
	 XrX5FO6BBBdaNFImGAnfEDtQn49Y4jyMQeF+R5xBcZ8d4ubxBswK4Wz6Bs62HLjC9M
	 H0RL0F33fWa7gP2ruGLZbacpViH7vuwAx95D/dtMEoti3ak+WFcIMV1g7q5eFhhCwW
	 KLsbCBKD+48Jg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/9] cpu/SMT: Allow enabling partial SMT states via sysfs
Date: Thu, 25 May 2023 01:56:27 +1000
Message-Id: <20230524155630.794584-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524155630.794584-1-mpe@ellerman.id.au>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support to the /sys/devices/system/cpu/smt/control interface for
enabling a specified number of SMT threads per core, including partial
SMT states where not all threads are brought online.

The current interface accepts "on" and "off", to enable either 1 or all
SMT threads per core.

This commit allows writing an integer, between 1 and the number of SMT
threads supported by the machine. Writing 1 is a synonym for "off", 2 or
more enables SMT with the specified number of threads.

When reading the file, if all threads are online "on" is returned, to
avoid changing behaviour for existing users. If some other number of
threads is online then the integer value is returned.

There is a hook which allows arch code to control how many threads per
core are supported. To retain the existing behaviour, the x86 hook only
supports 1 thread or all threads.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../ABI/testing/sysfs-devices-system-cpu      |  1 +
 kernel/cpu.c                                  | 39 ++++++++++++++++---
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index f54867cadb0f..3c4cfb59d495 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -555,6 +555,7 @@ Description:	Control Symmetric Multi Threading (SMT)
 			 ================ =========================================
 			 "on"		  SMT is enabled
 			 "off"		  SMT is disabled
+			 "<N>"		  SMT is enabled with N threads per core.
 			 "forceoff"	  SMT is force disabled. Cannot be changed.
 			 "notsupported"   SMT is not supported by the CPU
 			 "notimplemented" SMT runtime toggling is not
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 72b9a03a4fef..aca23c7b4547 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2497,7 +2497,7 @@ static ssize_t
 __store_smt_control(struct device *dev, struct device_attribute *attr,
 		    const char *buf, size_t count)
 {
-	int ctrlval, ret;
+	int ctrlval, ret, num_threads, orig_threads;
 
 	if (cpu_smt_control == CPU_SMT_FORCE_DISABLED)
 		return -EPERM;
@@ -2505,20 +2505,38 @@ __store_smt_control(struct device *dev, struct device_attribute *attr,
 	if (cpu_smt_control == CPU_SMT_NOT_SUPPORTED)
 		return -ENODEV;
 
-	if (sysfs_streq(buf, "on"))
+	if (sysfs_streq(buf, "on")) {
 		ctrlval = CPU_SMT_ENABLED;
-	else if (sysfs_streq(buf, "off"))
+		num_threads = cpu_smt_max_threads;
+	} else if (sysfs_streq(buf, "off")) {
 		ctrlval = CPU_SMT_DISABLED;
-	else if (sysfs_streq(buf, "forceoff"))
+		num_threads = 1;
+	} else if (sysfs_streq(buf, "forceoff")) {
 		ctrlval = CPU_SMT_FORCE_DISABLED;
-	else
+		num_threads = 1;
+	} else if (kstrtoint(buf, 10, &num_threads) == 0) {
+		if (num_threads == 1)
+			ctrlval = CPU_SMT_DISABLED;
+		else if (num_threads > 1 && topology_smt_threads_supported(num_threads))
+			ctrlval = CPU_SMT_ENABLED;
+		else
+			return -EINVAL;
+	} else {
 		return -EINVAL;
+	}
 
 	ret = lock_device_hotplug_sysfs();
 	if (ret)
 		return ret;
 
-	if (ctrlval != cpu_smt_control) {
+	orig_threads = cpu_smt_num_threads;
+	cpu_smt_num_threads = num_threads;
+
+	if (num_threads > orig_threads) {
+		ret = cpuhp_smt_enable();
+	} else if (num_threads < orig_threads) {
+		ret = cpuhp_smt_disable(ctrlval);
+	} else if (ctrlval != cpu_smt_control) {
 		switch (ctrlval) {
 		case CPU_SMT_ENABLED:
 			ret = cpuhp_smt_enable();
@@ -2556,6 +2574,15 @@ static ssize_t control_show(struct device *dev,
 {
 	const char *state = smt_states[cpu_smt_control];
 
+	/*
+	 * If SMT is enabled but not all threads are enabled then show the
+	 * number of threads. If all threads are enabled show "on". Otherwise
+	 * show the state name.
+	 */
+	if (cpu_smt_control == CPU_SMT_ENABLED &&
+	    cpu_smt_num_threads != cpu_smt_max_threads)
+		return sysfs_emit(buf, "%d\n", cpu_smt_num_threads);
+
 	return snprintf(buf, PAGE_SIZE - 2, "%s\n", state);
 }
 
-- 
2.40.1

