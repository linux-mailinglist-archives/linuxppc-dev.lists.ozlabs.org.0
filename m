Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B085F22AB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Oct 2022 12:44:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgLFF64C4z3bm9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Oct 2022 21:44:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mh7NkoBo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mh7NkoBo;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgLDZ3Chzz2y2F
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Oct 2022 21:43:58 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2929ugU0017177;
	Sun, 2 Oct 2022 10:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=pIVSStzXkzMCQKu51+bqeIkE7v1EnMDNXkIa6OMrcAo=;
 b=Mh7NkoBo3UWiEvfJAcPnJxKTxnpNjog9ibGxvXBqu3vbNkhQKThGAvmSCH9FN9ywdu6o
 e/ZdGidyke1jYeGX00/xB6dEVEsDREzq9IWE/OTbESu/5T9SibzCYlosUVl9/IHnQGl9
 J0Odf23ri4VEW40Y0Onht6tHSaIF2I3rvT1HyxMuT5AUtSD6KsMOoBy6BUDclwTSWBCN
 0lT+fwEgBSqV31Gors7xFhSsz+d6WEMRbjYK6okicliqGocsg4+xUZbMNL4lPVc1uLLA
 Yxz9bP/uFqCAhPPitbMEkk1UsvsKcCBpOhArhbitoWLkDM4lX5nSJnR/uiKp3z+/l7ao +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jxxvb1j1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Oct 2022 10:43:38 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 292AhbTk023049;
	Sun, 2 Oct 2022 10:43:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jxxvb1j1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Oct 2022 10:43:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 292Aa9K6022918;
	Sun, 2 Oct 2022 10:43:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3jxd691aqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Oct 2022 10:43:34 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 292AhWSZ7733788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Oct 2022 10:43:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C469F5204F;
	Sun,  2 Oct 2022 10:43:32 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.71.20])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C78485204E;
	Sun,  2 Oct 2022 10:43:28 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 01/16] powerpc: Fix __WARN_FLAGS() for use with Objtool
Date: Sun,  2 Oct 2022 16:12:25 +0530
Message-Id: <20221002104240.1316480-2-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221002104240.1316480-1-sv@linux.ibm.com>
References: <20221002104240.1316480-1-sv@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hZN7-n3UnIU5SopE-_Nwy8nIJ5oVBSSJ
X-Proofpoint-ORIG-GUID: rFNe2r87kg1gQrg3tSZFRYC7UCEriNLl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-01_15,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=911 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210020068
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 1e688dd2a3d675 ("powerpc/bug: Provide better flexibility to
WARN_ON/__WARN_FLAGS() with asm goto") updated __WARN_FLAGS() to use asm
goto, and added a call to 'unreachable()' after the asm goto for optimal
code generation. With CONFIG_OBJTOOL enabled, 'annotate_unreachable()'
statement in 'unreachable()' tries to note down the location of the
subsequent instruction in a separate elf section to aid code flow
analysis. However, on powerpc, this results in gcc emitting a call to a
symbol of size 0. This results in objtool complaining of "unannotated
intra-function call" since the target symbol is not a valid function
call destination.

Objtool wants this annotation for code flow analysis, which we are not
yet enabling on powerpc. As such, expand the call to 'unreachable()' in
__WARN_FLAGS() without annotate_unreachable():
        barrier_before_unreachable();
        __builtin_unreachable();

This still results in optimal code generation for __WARN_FLAGS(), while
getting rid of the objtool warning.

We still need barrier_before_unreachable() to work around gcc bugs 82365
and 106751:
- https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82365
- https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106751

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/include/asm/bug.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 61a4736355c2..ef42adb44aa3 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -99,7 +99,8 @@
 	__label__ __label_warn_on;				\
 								\
 	WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_on); \
-	unreachable();						\
+	barrier_before_unreachable();				\
+	__builtin_unreachable();				\
 								\
 __label_warn_on:						\
 	break;							\
-- 
2.31.1

