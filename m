Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B6453C03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 22:58:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv0Lx3fkyz307C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 08:58:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KfCX0frC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KfCX0frC; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv0LD1WQ5z2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 08:58:11 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGLiCSL005390
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 21:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jWT5gZOBoM2SVGaC7qKIMakkYpABBHXfIGDJodsEsNY=;
 b=KfCX0frCcynqHItHsac0DEfahkFOrLPmwCMVlcjguoTaakFo1E3cq+prEoajCxXIOURS
 WfgAKJyKk0qd2+82gPdPbr0+18GseY0A3uHiySXM87iM3wwz8Ms3oZM0EohgdKZzk2ay
 wDSr9B9jGtwLNHNM0ext3umqPv7+zrROtV6E8tOZA4cSkPakynlxC1/gJjJpR6H22HoS
 /19TSCHFT9BQdZ2DpVQvkYGmeNEjUkS3XOGuGXMYrOOv40M9QowCoQybW7IjnHXKl0Ae
 fwRObnDOuYzUlyrBLO1IRqO1njUysupe3dZqgzaHVoZnZbds9kuKQfDrJxjvuHIsXBOX 5A== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccmteg5ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 21:58:08 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AGLmmW1014860
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 21:58:07 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 3ca50bvwu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 21:58:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AGLw6Av48234910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 21:58:06 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD868AC05B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 21:58:06 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CB41AC060
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 21:58:06 +0000 (GMT)
Received: from localhost (unknown [9.211.102.167])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 21:58:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/rtas: kernel-doc fixes
Date: Tue, 16 Nov 2021 15:58:06 -0600
Message-Id: <20211116215806.928235-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PQcL_fhEZ1GVXle6aUlhu9HNL-XKEPTy
X-Proofpoint-ORIG-GUID: PQcL_fhEZ1GVXle6aUlhu9HNL-XKEPTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_06,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160097
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix the following issues reported by kernel-doc:

$ scripts/kernel-doc -v -none arch/powerpc/kernel/rtas.c
arch/powerpc/kernel/rtas.c:810: info: Scanning doc for function rtas_activate_firmware
arch/powerpc/kernel/rtas.c:818: warning: contents before sections
arch/powerpc/kernel/rtas.c:841: info: Scanning doc for function rtas_call_reentrant
arch/powerpc/kernel/rtas.c:893: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Find a specific pseries error log in an RTAS extended event log.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index ff80bbad22a5..ca27421f471a 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -809,13 +809,13 @@ void rtas_os_term(char *str)
 /**
  * rtas_activate_firmware() - Activate a new version of firmware.
  *
+ * Context: This function may sleep.
+ *
  * Activate a new version of partition firmware. The OS must call this
  * after resuming from a partition hibernation or migration in order
  * to maintain the ability to perform live firmware updates. It's not
  * catastrophic for this method to be absent or to fail; just log the
  * condition in that case.
- *
- * Context: This function may sleep.
  */
 void rtas_activate_firmware(void)
 {
@@ -890,11 +890,12 @@ int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
 #endif /* CONFIG_PPC_PSERIES */
 
 /**
- * Find a specific pseries error log in an RTAS extended event log.
+ * get_pseries_errorlog() - Find a specific pseries error log in an RTAS
+ *                          extended event log.
  * @log: RTAS error/event log
  * @section_id: two character section identifier
  *
- * Returns a pointer to the specified errorlog or NULL if not found.
+ * Return: A pointer to the specified errorlog or NULL if not found.
  */
 struct pseries_errorlog *get_pseries_errorlog(struct rtas_error_log *log,
 					      uint16_t section_id)
-- 
2.31.1

