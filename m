Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 658504863EF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 12:49:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JV4QY1rYNz3cRH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 22:49:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kqP3WwoI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kqP3WwoI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JV4Lw6n0Bz30Nb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 22:46:32 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206B1U7r028395; 
 Thu, 6 Jan 2022 11:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vPNChRcvudTNrb7UM6T93IGyor9st/nqg37tQiXtZC0=;
 b=kqP3WwoIw7ok+OAiiG+kgw35nQqOwh6fF86c99p32zpsoV97LCSAExoIE5j7SpwoKI2W
 GDHzMpIZVF4ljoyKOGAo+8a8HygPSg+c5YxndJ6jSf3X0sWdxYJojrf7gqqNMTiGRF9A
 B/f77EQXQQuReUnvp2YMG2ySsk1QUxXPHSkFQMkM0OLZQKoMCH+fYiIyPnaDd0h90QSl
 qoPa2/Q0W8a3aBQQQPtqVK0pVy1eIUziV3tBQTh8xFv0OU1stVAxhBgKHWsaH40otuB5
 CPQ+hF1rvRYxPBpvxYgydQQVsP7WxAWuRfWvmFCF2sioax4AZppuKb8+DyJD+Bk9GPBA RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddy6grqvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:13 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 206BKcdh012694;
 Thu, 6 Jan 2022 11:46:13 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddy6grquu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206BhGdv027562;
 Thu, 6 Jan 2022 11:46:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3ddmrr4s46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206Bk7vo29163936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 11:46:07 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63E7BA405F;
 Thu,  6 Jan 2022 11:46:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 827BAA4062;
 Thu,  6 Jan 2022 11:46:04 +0000 (GMT)
Received: from naverao1-tp.ibm.com (unknown [9.43.91.118])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 11:46:04 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: [PATCH 04/13] tools/bpf: Rename 'struct event' to avoid naming
 conflict
Date: Thu,  6 Jan 2022 17:15:08 +0530
Message-Id: <c13cb3767d26257ca4387b8296b632b433a58db6.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zZQDcgiBsm9mzEjgzVclVR_5U3WBabmK
X-Proofpoint-GUID: skXkiLy30zEcJxpW_1nR2ESw8pHqyLQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_04,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=718 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2112160000
 definitions=main-2201060081
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
Cc: ykaliuta@redhat.com, johan.almbladh@anyfinetworks.com,
 linuxppc-dev@lists.ozlabs.org, song@kernel.org, bpf@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On ppc64le, trying to build bpf seltests throws the below warning:
  In file included from runqslower.bpf.c:5:
  ./runqslower.h:7:8: error: redefinition of 'event'
  struct event {
	 ^
  /home/naveen/linux/tools/testing/selftests/bpf/tools/build/runqslower/vmlinux.h:156602:8:
  note: previous definition is here
  struct event {
	 ^

This happens since 'struct event' is defined in
drivers/net/ethernet/alteon/acenic.h . Rename the one in runqslower to a
more appropriate 'runq_event' to avoid the naming conflict.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 tools/bpf/runqslower/runqslower.bpf.c | 2 +-
 tools/bpf/runqslower/runqslower.c     | 2 +-
 tools/bpf/runqslower/runqslower.h     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/bpf/runqslower/runqslower.bpf.c b/tools/bpf/runqslower/runqslower.bpf.c
index ab9353f2fd46ab..9a5c1f008fe603 100644
--- a/tools/bpf/runqslower/runqslower.bpf.c
+++ b/tools/bpf/runqslower/runqslower.bpf.c
@@ -68,7 +68,7 @@ int handle__sched_switch(u64 *ctx)
 	 */
 	struct task_struct *prev = (struct task_struct *)ctx[1];
 	struct task_struct *next = (struct task_struct *)ctx[2];
-	struct event event = {};
+	struct runq_event event = {};
 	u64 *tsp, delta_us;
 	long state;
 	u32 pid;
diff --git a/tools/bpf/runqslower/runqslower.c b/tools/bpf/runqslower/runqslower.c
index d8971584495213..ff7f5e8485e937 100644
--- a/tools/bpf/runqslower/runqslower.c
+++ b/tools/bpf/runqslower/runqslower.c
@@ -100,7 +100,7 @@ static int bump_memlock_rlimit(void)
 
 void handle_event(void *ctx, int cpu, void *data, __u32 data_sz)
 {
-	const struct event *e = data;
+	const struct runq_event *e = data;
 	struct tm *tm;
 	char ts[32];
 	time_t t;
diff --git a/tools/bpf/runqslower/runqslower.h b/tools/bpf/runqslower/runqslower.h
index 9db225425e5ff9..4f70f07200c23d 100644
--- a/tools/bpf/runqslower/runqslower.h
+++ b/tools/bpf/runqslower/runqslower.h
@@ -4,7 +4,7 @@
 
 #define TASK_COMM_LEN 16
 
-struct event {
+struct runq_event {
 	char task[TASK_COMM_LEN];
 	__u64 delta_us;
 	pid_t pid;
-- 
2.34.1

