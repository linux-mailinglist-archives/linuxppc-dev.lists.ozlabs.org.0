Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA378D2D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 06:43:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oZzE6uCW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbBWw0JfRz3bYt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 14:43:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oZzE6uCW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbBW06PcXz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 14:43:08 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37U4QWIm001998
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 04:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=DFnLqbW8e2TTWl6x0VPDZKR2vOqplRUJdaXCEgulRbg=;
 b=oZzE6uCWoocmqL4EuxWlLsnnjfou+z+wMyXcYMuqLi8+aEa8TsdlmNtizmcPc+igBWiL
 QyAAouEt0qCVnoskQK4CxSzBlsjX+MjNuXxUmIEmbjhu/znk7RM5dJfDb6eeQhZpUU7+
 lZ8nZYvjejtjDLSv4C5FJxAZgXTb4SDOE0jCbjC8sEHZiSjnO2B7DUAX0OCUQDTPbDQk
 hPD/mLH64EALwtDZdnILWJf5Vjs+QOKaQwCEt0j+33nM95YaLbXPlvp7knOej/WFEk/Y
 hexyiujjP5hp6fKjkkYaEUHB7hyZgDUdCOQuSiN8OY1x0DH7IUIczaY+cqC8kEvkoX67 jQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssxr3rj64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 04:43:04 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37U4bh1K004884
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 04:43:03 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3squqssep7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 04:43:03 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37U4h1CO22872734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 04:43:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B5B620040
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 04:43:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2C142005A
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 04:43:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 04:43:00 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5AB34600D2;
	Wed, 30 Aug 2023 14:42:58 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/configs: Set more PPC debug configs
Date: Wed, 30 Aug 2023 14:42:38 +1000
Message-ID: <20230830044238.578840-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lhlxQS86F-dmSS-FoQQTp9TY9LJcB5Sc
X-Proofpoint-GUID: lhlxQS86F-dmSS-FoQQTp9TY9LJcB5Sc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=711 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300041
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add more config options that wouldn't be done by the generic debug
config in kernel/configs/debug.config

CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG
	Adds an initialized check on each (cpu|mmu)_has_feature()

CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
	Adds some extra checks around IRQ mask manipulation

CONFIG_PPC_KUAP_DEBUG
	Adds some extra KAUP checks around interrupts/context switching

CONFIG_PPC_RFI_SRR_DEBUG
	Adds some extra SSR checks around interrupts/syscalls

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/configs/debug.config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/configs/debug.config b/arch/powerpc/configs/debug.config
index a14ae1f20d60..bcc1fcf25e10 100644
--- a/arch/powerpc/configs/debug.config
+++ b/arch/powerpc/configs/debug.config
@@ -1 +1,5 @@
+CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG=y
+CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=y
+CONFIG_PPC_KUAP_DEBUG=y
+CONFIG_PPC_RFI_SRR_DEBUG=y
 CONFIG_SCOM_DEBUGFS=y
-- 
2.41.0

