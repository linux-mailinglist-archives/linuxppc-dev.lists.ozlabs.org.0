Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 742914AB590
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 08:10:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JscjS1d5Xz3cXT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 18:10:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wz+HuOXM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Wz+HuOXM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jscg83Sg0z30hm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 18:08:20 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2174HgkV024832; 
 Mon, 7 Feb 2022 07:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TDb/NXwDbRCd9nBtcg23SgJfL/NvPuEe/ewt1ArEY9g=;
 b=Wz+HuOXM+BRB1wWG8QiQYK9c2E7h2ugFPEI+djS09L17FtBQG4DlQ3Mvlyqt9cD6Rhoi
 mgBN2xvjBHF5h0zI5aWE0MrJq0w5gE20hKl1jCyy+F8b8xHLTkSma6NIbQRFLnJ2nDBn
 hWCE/UBh+lyyFE20iBEM69FhqC0l4dYFbZKjU6aEF0yiX0zlYtV8joId08wo4zFqpyfe
 eBzbufdcTnpbIFLyM8lHGyACf/pNNUQRh4582Ry+GiPEIGs04dYDPc2ctQsXYuT+qw/W
 hQfk9yKEhDyg/8f1rAmwF2xLFKQjPqHNPsGLS8Kx07990jyVfhc5VJ1875TvuVupC/R/ 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22tqcjun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 07:07:51 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2176ZiQC013481;
 Mon, 7 Feb 2022 07:07:50 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22tqcjtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 07:07:50 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21773sxm028724;
 Mon, 7 Feb 2022 07:07:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3e1ggjhf98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 07:07:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21777iHl43975082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 07:07:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E826BA4067;
 Mon,  7 Feb 2022 07:07:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53B1EA4064;
 Mon,  7 Feb 2022 07:07:41 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.33.186])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 07:07:41 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC PATCH 2/3] powerpc/ftrace: Override ftrace_location_lookup() for
 MPROFILE_KERNEL
Date: Mon,  7 Feb 2022 12:37:21 +0530
Message-Id: <fadc5f2a295d6cb9f590bbbdd71fc2f78bf3a085.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ni0EWLk3pI-liea96akWcwHrasZgQV4k
X-Proofpoint-GUID: 3CAQHVCI6PjZ_rIZpL70Qmt9cjRR4JAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_02,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070046
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
Cc: Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
 Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 bpf@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_MPROFILE_KERNEL, ftrace location is within the first 5
instructions of a function. Override ftrace_location_lookup() to search
within this range for the ftrace location.

Also convert kprobe_lookup_name() to utilize this function.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/kprobes.c      |  8 +-------
 arch/powerpc/kernel/trace/ftrace.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 9a492fdec1dfbe..03cb50e4c8c3e8 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -50,13 +50,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 	addr = (kprobe_opcode_t *)kallsyms_lookup_name(name);
 	if (addr && !offset) {
 #ifdef CONFIG_KPROBES_ON_FTRACE
-		unsigned long faddr;
-		/*
-		 * Per livepatch.h, ftrace location is always within the first
-		 * 16 bytes of a function on powerpc with -mprofile-kernel.
-		 */
-		faddr = ftrace_location_range((unsigned long)addr,
-					      (unsigned long)addr + 16);
+		unsigned long faddr = ftrace_location_lookup((unsigned long)addr);
 		if (faddr)
 			addr = (kprobe_opcode_t *)faddr;
 		else
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index b65ca87a2eacb1..5127eb65c299af 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -1137,3 +1137,14 @@ char *arch_ftrace_match_adjust(char *str, const char *search)
 		return str;
 }
 #endif /* PPC64_ELF_ABI_v1 */
+
+#ifdef CONFIG_MPROFILE_KERNEL
+unsigned long ftrace_location_lookup(unsigned long ip)
+{
+	/*
+	 * Per livepatch.h, ftrace location is always within the first
+	 * 16 bytes of a function on powerpc with -mprofile-kernel.
+	 */
+	return ftrace_location_range(ip, ip + 16);
+}
+#endif
-- 
2.34.1

