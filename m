Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900421CEEA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 07:44:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4szF3wjSzDqVP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 15:44:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4sXk3pYMzDqVQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 15:24:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B4sXj1c80z8tWg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 15:24:53 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B4sXj09ybz9sSJ; Mon, 13 Jul 2020 15:24:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B4sXg6w5Jz9sDX;
 Mon, 13 Jul 2020 15:24:51 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06D52NSF180904; Mon, 13 Jul 2020 01:24:48 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32771wj11j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 01:24:47 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06D5OkOI014335;
 Mon, 13 Jul 2020 05:24:46 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 327527stsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 05:24:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06D5Ohdk63832220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 05:24:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4AAA4C044;
 Mon, 13 Jul 2020 05:24:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3CB34C050;
 Mon, 13 Jul 2020 05:24:40 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.102.23.34])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 05:24:40 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v6] powerpc/fadump: fix race between pstore write and fadump
 crash trigger
Date: Mon, 13 Jul 2020 10:54:35 +0530
Message-Id: <20200713052435.183750-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_03:2020-07-10,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130034
X-Mailman-Approved-At: Mon, 13 Jul 2020 15:43:01 +1000
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
Cc: mahesh@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 hbathini@linux.ibm.com, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When we enter into fadump crash path via system reset we fail to update
the pstore.

On the system reset path we first update the pstore then we go for fadump
crash. But the problem here is when all the CPUs try to get the pstore
lock to initiate the pstore write, only one CPUs will acquire the lock
and proceed with the pstore write. Since it in NMI context CPUs that fail
to get lock do not wait for their turn to write to the pstore and simply
proceed with the next operation which is fadump crash. One of the CPU who
proceeded with fadump crash path triggers the crash and does not wait for
the CPU who gets the pstore lock to complete the pstore update.

Timeline diagram to depicts the sequence of events that leads to an
unsuccessful pstore update when we hit fadump crash path via system reset.

                 1    2     3    ...      n   CPU Threads
                 |    |     |             |
                 |    |     |             |
 Reached to   -->|--->|---->| ----------->|
 system reset    |    |     |             |
 path            |    |     |             |
                 |    |     |             |
 Try to       -->|--->|---->|------------>|
 acquire the     |    |     |             |
 pstore lock     |    |     |             |
                 |    |     |             |
                 |    |     |             |
 Got the      -->| +->|     |             |<-+
 pstore lock     | |  |     |             |  |-->  Didn't get the
                 | --------------------------+     lock and moving
                 |    |     |             |        ahead on fadump
                 |    |     |             |        crash path
                 |    |     |             |
  Begins the  -->|    |     |             |
  process to     |    |     |             |<-- Got the chance to
  update the     |    |     |             |    trigger the crash
  pstore         | -> |     |    ... <-   |
                 | |  |     |         |   |
                 | |  |     |         |   |<-- Triggers the
                 | |  |     |         |   |    crash
                 | |  |     |         |   |      ^
                 | |  |     |         |   |      |
  Writing to  -->| |  |     |         |   |      |
  pstore         | |  |     |         |   |      |
                   |                  |          |
       ^           |__________________|          |
       |               CPU Relax                 |
       |                                         |
       +-----------------------------------------+
                          |
                          v
            Race: crash triggered before pstore
                  update completes

To avoid this race condition a barrier is added on crash_fadump path, it
prevents the CPU to trigger the crash until all the online CPUs completes
their task.

A barrier is added to make sure all the secondary CPUs hit the
crash_fadump function before we initiates the crash. A timeout is kept to
ensure the primary CPU (one who initiates the crash) do not wait for
secondary CPUs indefinitely.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

---
Chanagelog:

v1 -> v3:
   - https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-April/208267.html

v3 -> v4:

   - Now the primary CPU (one who triggers dump) waits for all secondary
     CPUs to enter and then initiates the crash.

v4 -> v5:
    - Fixed a build failure reported by kernel test robot <lkp at intel.com>
      Now the cpus_in_crash variable is defined outside CONFIG_CMA
      config option.

v5 -> v6
    - Changed a variable name cpus_in_crash -> cpus_in_fadump.
---

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 78ab9a6ee6ac..1858896d6809 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -32,11 +32,20 @@
 #include <asm/fadump-internal.h>
 #include <asm/setup.h>
 
+/*
+ * The CPU who acquired the lock to trigger the fadump crash should
+ * wait for other CPUs to enter.
+ *
+ * The timeout is in milliseconds.
+ */
+#define CRASH_TIMEOUT		500
+
 static struct fw_dump fw_dump;
 
 static void __init fadump_reserve_crash_area(u64 base);
 
 struct kobject *fadump_kobj;
+static atomic_t cpus_in_fadump;
 
 #ifndef CONFIG_PRESERVE_FA_DUMP
 static DEFINE_MUTEX(fadump_mutex);
@@ -668,8 +677,11 @@ early_param("fadump_reserve_mem", early_fadump_reserve_mem);
 
 void crash_fadump(struct pt_regs *regs, const char *str)
 {
+	unsigned int msecs;
 	struct fadump_crash_info_header *fdh = NULL;
 	int old_cpu, this_cpu;
+	/* Do not include first CPU */
+	unsigned int ncpus = num_online_cpus() - 1;
 
 	if (!should_fadump_crash())
 		return;
@@ -685,6 +697,8 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 	old_cpu = cmpxchg(&crashing_cpu, -1, this_cpu);
 
 	if (old_cpu != -1) {
+		atomic_inc(&cpus_in_fadump);
+
 		/*
 		 * We can't loop here indefinitely. Wait as long as fadump
 		 * is in force. If we race with fadump un-registration this
@@ -708,6 +722,16 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 
 	fdh->online_mask = *cpu_online_mask;
 
+	/*
+	 * If we came in via system reset, wait a while for the secondary
+	 * CPUs to enter.
+	 */
+	if (TRAP(&(fdh->regs)) == 0x100) {
+		msecs = CRASH_TIMEOUT;
+		while ((atomic_read(&cpus_in_fadump) < ncpus) && (--msecs > 0))
+			mdelay(1);
+	}
+
 	fw_dump.ops->fadump_trigger(fdh, str);
 }
 
-- 
2.25.4

