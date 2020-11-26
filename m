Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC122C5BCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:15:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChmBh57FrzDrPT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:15:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q3j7970m; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm4d4VjyzDrN8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:09:53 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI2V3x060446; Thu, 26 Nov 2020 13:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=agNMQSwcWAtOgAzmyTFS+GDXbWjIfS7PKsTyOpUgFUw=;
 b=q3j7970mUxti4Vw937nV6D+2Py2JCT2h/1cWYLoIpgG4jI/h0DIXuIru/AOeT17rWro0
 XvmBBY30ofuCWW96oWDRCGBBbB+vP015XsPZqK1xe9R/iM5fZL3fZ0zcXUn8CXY4qlmb
 iwV7He08v+z4wcBDHIqhFqC3kELWMD6Wr1m+7RotbBfuOijErm0CD/AG1pWr3g5doDgJ
 62a8598pi8Zx5wKwLL5Yyz76oD7oRX6XUcHQwEqawsUY0F/8fPqMs/1i93kHM3KobZnB
 ocQB/FIMdECATAVig9z8ROXkdAGFckXamDZH4D8kACwz4TzqtDhaumCm02dbemisafPh oA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352h4frbnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:09:21 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI8jNM016127;
 Thu, 26 Nov 2020 18:09:19 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 34yy8r3b4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:09:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQI9Hw649152454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EFB6A4054;
 Thu, 26 Nov 2020 18:09:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94910A405C;
 Thu, 26 Nov 2020 18:09:14 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:14 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 01/14] ftrace: Fix updating FTRACE_FL_TRAMP
Date: Thu, 26 Nov 2020 23:38:38 +0530
Message-Id: <56c113aa9c3e10c19144a36d9684c7882bf09af5.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_08:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260112
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc, kprobe-direct.tc triggered FTRACE_WARN_ON() in
ftrace_get_addr_new() followed by the below message:
  Bad trampoline accounting at: 000000004222522f (wake_up_process+0xc/0x20) (f0000001)

The set of steps leading to this involved:
- modprobe ftrace-direct-too
- enable_probe
- modprobe ftrace-direct
- rmmod ftrace-direct <-- trigger

The problem turned out to be that we were not updating flags in the
ftrace record properly. From the above message about the trampoline
accounting being bad, it can be seen that the ftrace record still has
FTRACE_FL_TRAMP set though ftrace-direct module is going away. This
happens because we are checking if any ftrace_ops has the
FTRACE_FL_TRAMP flag set _before_ updating the filter hash.

The fix for this is to look for any _other_ ftrace_ops that also needs
FTRACE_FL_TRAMP.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 kernel/trace/ftrace.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 8185f7240095f4..9c1bba8cc51b03 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1629,6 +1629,8 @@ static bool test_rec_ops_needs_regs(struct dyn_ftrace *rec)
 static struct ftrace_ops *
 ftrace_find_tramp_ops_any(struct dyn_ftrace *rec);
 static struct ftrace_ops *
+ftrace_find_tramp_ops_any_other(struct dyn_ftrace *rec, struct ftrace_ops *op_exclude);
+static struct ftrace_ops *
 ftrace_find_tramp_ops_next(struct dyn_ftrace *rec, struct ftrace_ops *ops);
 
 static bool __ftrace_hash_rec_update(struct ftrace_ops *ops,
@@ -1778,7 +1780,7 @@ static bool __ftrace_hash_rec_update(struct ftrace_ops *ops,
 			 * to it.
 			 */
 			if (ftrace_rec_count(rec) == 1 &&
-			    ftrace_find_tramp_ops_any(rec))
+			    ftrace_find_tramp_ops_any_other(rec, ops))
 				rec->flags |= FTRACE_FL_TRAMP;
 			else
 				rec->flags &= ~FTRACE_FL_TRAMP;
@@ -2244,6 +2246,24 @@ ftrace_find_tramp_ops_any(struct dyn_ftrace *rec)
 	return NULL;
 }
 
+static struct ftrace_ops *
+ftrace_find_tramp_ops_any_other(struct dyn_ftrace *rec, struct ftrace_ops *op_exclude)
+{
+	struct ftrace_ops *op;
+	unsigned long ip = rec->ip;
+
+	do_for_each_ftrace_op(op, ftrace_ops_list) {
+
+		if (op == op_exclude || !op->trampoline)
+			continue;
+
+		if (hash_contains_ip(ip, op->func_hash))
+			return op;
+	} while_for_each_ftrace_op(op);
+
+	return NULL;
+}
+
 static struct ftrace_ops *
 ftrace_find_tramp_ops_next(struct dyn_ftrace *rec,
 			   struct ftrace_ops *op)
-- 
2.25.4

