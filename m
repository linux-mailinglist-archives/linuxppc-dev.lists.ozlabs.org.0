Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB1A46B944
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 11:39:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7cGs15FHz2yXv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 21:39:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gkzDgusU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gkzDgusU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7cFM28zhz2x9S
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 21:37:42 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B79MakY009045; 
 Tue, 7 Dec 2021 10:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tNKc+Ux0aQHBI0Cfg4DqvTwmWhdTzChzxsHpRP5IDSQ=;
 b=gkzDgusU1SVVQqLxEnGXhqEFHkU+I7iyIv8FVd9FR16DVH7ObAA9mlOWNv7dr08b4R0X
 YGD/aBQ6xS/Bjch9KeiZ5rslq/wbBpGUe+ggRvm9FZvy6bV5t/+sYQ8FL+jqDneNlgls
 5+b1J5vThstK0RTLUqMUlpVe/NWXwz6oTM/VRMfKZVTJhSnUgirhiGpEIxb/N/FpQpC4
 Syb9IGEp407rWqtH06KyS+6EFhSSxHqiv+nx0hmM9TGdL94Legs8z6adLz4klerJ3o/4
 TeKE7B2Uu9bHNBM3ZRtQDeKOJ/csf0yHKUynr7MR0r2fA8aJlyI2hoZ3YWLcSAwCcFRk VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4x61dup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:37:37 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79SYv4029208;
 Tue, 7 Dec 2021 10:37:37 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4x61dtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:37:37 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7ANkPU008952;
 Tue, 7 Dec 2021 10:37:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3cqykfmbv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:37:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B7AbVsk27066760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 10:37:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD7D45206D;
 Tue,  7 Dec 2021 10:37:31 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.43.54.38])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1BC735205F;
 Tue,  7 Dec 2021 10:37:28 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Subject: [PATCH v3 2/2] ppc64/fadump: fix inaccurate CPU state info in vmcore
 generated with panic
Date: Tue,  7 Dec 2021 16:07:19 +0530
Message-Id: <20211207103719.91117-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211207103719.91117-1-hbathini@linux.ibm.com>
References: <20211207103719.91117-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7Ui3CjyCYPwNPwX9nW6tO_Zet9J49bXL
X-Proofpoint-ORIG-GUID: QQNzGXly_vlvCwNR7V4RTdACmJ_zY66E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070060
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, mahesh@linux.ibm.com,
 sourabhjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In panic path, fadump is triggered via a panic notifier function.
Before calling panic notifier functions, smp_send_stop() gets called,
which stops all CPUs except the panic'ing CPU. Commit 8389b37dffdc
("powerpc: stop_this_cpu: remove the cpu from the online map.") and
again commit bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
started marking CPUs as offline while stopping them. So, if a kernel
has either of the above commits, vmcore captured with fadump via panic
path would not process register data for all CPUs except the panic'ing
CPU. Sample output of crash-utility with such vmcore:

  # crash vmlinux vmcore
  ...
        KERNEL: vmlinux
      DUMPFILE: vmcore  [PARTIAL DUMP]
          CPUS: 1
          DATE: Wed Nov 10 09:56:34 EST 2021
        UPTIME: 00:00:42
  LOAD AVERAGE: 2.27, 0.69, 0.24
         TASKS: 183
      NODENAME: XXXXXXXXX
       RELEASE: 5.15.0+
       VERSION: #974 SMP Wed Nov 10 04:18:19 CST 2021
       MACHINE: ppc64le  (2500 Mhz)
        MEMORY: 8 GB
         PANIC: "Kernel panic - not syncing: sysrq triggered crash"
           PID: 3394
       COMMAND: "bash"
          TASK: c0000000150a5f80  [THREAD_INFO: c0000000150a5f80]
           CPU: 1
         STATE: TASK_RUNNING (PANIC)

  crash> p -x __cpu_online_mask
  __cpu_online_mask = $1 = {
    bits = {0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
  }
  crash>
  crash>
  crash> p -x __cpu_active_mask
  __cpu_active_mask = $2 = {
    bits = {0xff, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
  }
  crash>

While this has been the case since fadump was introduced, the issue
was not identified for two probable reasons:

  - In general, the bulk of the vmcores analyzed were from crash
    due to exception.

  - The above did change since commit 8341f2f222d7 ("sysrq: Use
    panic() to force a crash") started using panic() instead of
    deferencing NULL pointer to force a kernel crash. But then
    commit de6e5d38417e ("powerpc: smp_send_stop do not offline
    stopped CPUs") stopped marking CPUs as offline till kernel
    commit bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
    reverted that change.

To ensure post processing register data of all other CPUs happens
as intended, let panic() function take the crash friendly path (read
crash_smp_send_stop()) with the help of crash_kexec_post_notifiers
option. Also, as register data for all CPUs is captured by f/w, skip
IPI callbacks here for fadump, to avoid any complications in finding
the right backtraces.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c |  8 ++++++++
 arch/powerpc/kernel/smp.c    | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index b7ceb041743c..60f5fc14aa23 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1641,6 +1641,14 @@ int __init setup_fadump(void)
 	else if (fw_dump.reserve_dump_area_size)
 		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
 
+	/*
+	 * In case of panic, fadump is triggered via ppc_panic_event()
+	 * panic notifier. Setting crash_kexec_post_notifiers to 'true'
+	 * lets panic() function take crash friendly path before panic
+	 * notifiers are invoked.
+	 */
+	crash_kexec_post_notifiers = true;
+
 	return 1;
 }
 subsys_initcall(setup_fadump);
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 2d33c167b438..10fb01837e6b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -61,6 +61,7 @@
 #include <asm/cpu_has_feature.h>
 #include <asm/ftrace.h>
 #include <asm/kup.h>
+#include <asm/fadump.h>
 
 #ifdef DEBUG
 #include <asm/udbg.h>
@@ -638,6 +639,15 @@ void crash_smp_send_stop(void)
 {
 	static bool stopped = false;
 
+	/*
+	 * In case of fadump, register data for all CPUs is captured by f/w
+	 * on ibm,os-term rtas call. Skip IPI callbacks to other CPUs before
+	 * this rtas call to avoid tricky post processing of those CPUs'
+	 * backtraces.
+	 */
+	if (should_fadump_crash())
+		return;
+
 	if (stopped)
 		return;
 
-- 
2.33.1

