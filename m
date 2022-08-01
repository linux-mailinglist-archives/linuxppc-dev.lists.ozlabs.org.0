Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B77C586AE2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 14:35:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxHdm2dHVz3c4S
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 22:35:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CRzW0BYq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CRzW0BYq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxHd53CGhz2xJW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 22:34:49 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271AwMoK021089;
	Mon, 1 Aug 2022 12:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=S2gVEnVdS+zCAQdB6X1vsTB8uo4T/16KDDfJkam5cZw=;
 b=CRzW0BYqmc4PsrXU1UicFWd1ILJlQFvk1RI7YP4kHdI6SvlWdGnuK1AYiz+x2i7/xtai
 WGrbexdCrDVfKcV/Pb5VWWH2N9yRmmRMKPPPDlnhTZdxxAWhUz654i2YTGFuw/MGavOp
 YBiNvVXzFy+9fFGnKbnIwFNk0LEHW5eaBIAoFD/RAGn/evn2v5Vk1sdFRnYxJGR2RWrP
 1yNORgYv5vPfVf28UOBAIScSfeB2QG5oS5CdEAiH3HCNVaGoByu8EpnGM4lZagFWm/DW
 0vTk0BdEbWNz3hwjMfUAfbf44nj6GUToSkOm1QobFJOarEfti///vSPdfq4UXksg4D1t tQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hpbphnxtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 12:34:42 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 271CLVT3009282;
	Mon, 1 Aug 2022 12:34:41 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma01dal.us.ibm.com with ESMTP id 3hmv99es68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 12:34:41 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 271CYe1X24314118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Aug 2022 12:34:40 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41FE513605E;
	Mon,  1 Aug 2022 12:34:40 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C97913604F;
	Mon,  1 Aug 2022 12:34:39 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.77.138.167])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon,  1 Aug 2022 12:34:39 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v3 0/2] generic and PowerPC accessor functions for arch keystore
Date: Mon,  1 Aug 2022 07:34:24 -0500
Message-Id: <20220801123426.585801-1-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RwZ4H3keXvHtfK15cKrZAIEO3NpgVbDW
X-Proofpoint-ORIG-GUID: RwZ4H3keXvHtfK15cKrZAIEO3NpgVbDW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_07,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=914 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010062
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
Cc: axboe@kernel.dk, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Architectural neutral functions have been defined for accessing
architecture specific variable store. The neutral functions are
defined as weak so that they may be superseded by platform
specific versions.

PowerPC/pseries versions of these functions provide read/write access
to the non-volatile PLPKS data store.

This functionality allows kernel code such as the block SED opal
driver to store authentication keys in a secure permanent store.

Greg Joyce (2):
  lib: define generic accessor functions for arch specific keystore
  powerpc/pseries: Override lib/arch_vars.c functions

 arch/powerpc/platforms/pseries/Makefile       |   1 +
 .../platforms/pseries/plpks_arch_ops.c        | 167 ++++++++++++++++++
 include/linux/arch_vars.h                     |  23 +++
 lib/Makefile                                  |   2 +-
 lib/arch_vars.c                               |  25 +++
 5 files changed, 217 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/platforms/pseries/plpks_arch_ops.c
 create mode 100644 include/linux/arch_vars.h
 create mode 100644 lib/arch_vars.c


Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
base-commit: ff6992735ade75aae3e35d16b17da1008d753d28
-- 
2.27.0

