Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0469A4E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 05:34:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHzVC09kqz3f4j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 15:34:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UGKaSfAS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UGKaSfAS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHzTD0dpYz306l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 15:33:19 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H1g17S015767;
	Fri, 17 Feb 2023 04:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=r9UUHMKURkmxKLCVwKzBEbV69SRQq+2LrZt95/O5VUY=;
 b=UGKaSfASEoaSeMZrXinF9WCQnYOlY2+1sMrmeeUNEdNwxrwsv6ybr2US4KvqcVfw+vcp
 9UaWxdH1Z5RLuunQ09IL4PCFCZY7iXRfwHzuwhI8CO7fDwKavW0LSJWhbY5kxIgGB2SW
 MZ76dpa4tFkjVstuQ5jjV+pT7ja/PlkOqzgJ1XgfX1suuxpGmk1UJPxld/6DvNqZgG/T
 zF0mBlmrlYhZAPokz7y5cKNLMgZQnpJmU2fI6UlAFHjTdhYAhYhJ8XN9UQTkX9ONzXSO
 bxgpjz1dJBE14MrqXKkBJ4GOk1W4ALPrRq3kqKa0sTXWl+GdcbMOg+MDj6IxikZibTjD 9A== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nt050tqtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 04:32:51 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31GNlE7Q002733;
	Fri, 17 Feb 2023 04:32:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3np2n6djgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 04:32:49 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31H4WlZG47514016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 04:32:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0458D20040;
	Fri, 17 Feb 2023 04:32:47 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D15F220043;
	Fri, 17 Feb 2023 04:32:44 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.2.29])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Feb 2023 04:32:44 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: Fix unannotated intra-function call warning
Date: Fri, 17 Feb 2023 10:02:26 +0530
Message-Id: <20230217043226.1020041-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qkWI472Jg-VdaCYIPjMk_PEDP8dFU0r4
X-Proofpoint-ORIG-GUID: qkWI472Jg-VdaCYIPjMk_PEDP8dFU0r4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_01,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=788 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170036
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
Cc: sfr@canb.auug.org.au, peterz@infradead.org, sv@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

objtool throws the following warning:
  arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x6128:
  unannotated intra-function call

Fix the warning by annotating start_initialization_book3s symbol with the
SYM_FUNC_START_LOCAL and SYM_FUNC_END macros.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/kernel/head_64.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 3a7266fa8a18..1febb56ebaeb 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -472,7 +472,7 @@ SYM_FUNC_START_LOCAL(__mmu_off)
 	b	.	/* prevent speculative execution */
 SYM_FUNC_END(__mmu_off)
 
-start_initialization_book3s:
+SYM_FUNC_START_LOCAL(start_initialization_book3s)
 	mflr	r25
 
 	/* Setup some critical 970 SPRs before switching MMU off */
@@ -494,6 +494,7 @@ start_initialization_book3s:
 
 	mtlr	r25
 	blr
+SYM_FUNC_END(start_initialization_book3s)
 #endif
 
 /*
-- 
2.31.1

