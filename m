Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEE8776952
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 21:58:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XxBDzNTk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLgpN2tRyz3cX4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 05:58:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XxBDzNTk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLgjV4SpWz3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 05:53:50 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 379JgK1K017455;
	Wed, 9 Aug 2023 19:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Kv1uBofxfFr4XcBPYMsOnENGVuvDK07nAxIIE/b0PFY=;
 b=XxBDzNTkJDcmdalegweZtTMOM4htEooZ6hxNBOK0c4bBvTw22bAVoyu/gP1CvZJtmzhE
 zuIFhGtYobYxNybtUnim2TDsXgsbvRkDVPvfwV2Svvg2VIpiUT1dyunqIUB8kNloAwKD
 oT7yVCOENwxkkKT/l3N22cxcBjROVHzGYD6Y/XOA7O4FhTAbM8LNmZUOoLiOmAh/MIb2
 Aab4ZFUr/1bb1CRd8e+m1nM44AZ6a0t2ZE+1RpyU7/MoW5Xv8TcHTrr8yybS+Ba3Z0OX
 MUUZdJ/NJg9V+wAONPhPvr+mbJjMO1f0yiVym6XDR3buXrjsWmBacJ7O/1piMXVa0WBU 2Q== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sch088e4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 19:53:45 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 379IbUcY006656;
	Wed, 9 Aug 2023 19:53:45 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sa0rtbmyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 19:53:44 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 379JrgqJ44892626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Aug 2023 19:53:42 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37DC320043;
	Wed,  9 Aug 2023 19:53:42 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31CF820040;
	Wed,  9 Aug 2023 19:53:40 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com (unknown [9.61.3.84])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Aug 2023 19:53:40 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v2 5/6] integrity: PowerVM machine keyring enablement
Date: Wed,  9 Aug 2023 15:53:14 -0400
Message-Id: <20230809195315.1085656-6-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230809195315.1085656-1-nayna@linux.ibm.com>
References: <20230809195315.1085656-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TJKR4hG43C0SpmTNZdd8EJi9U5ntwOTC
X-Proofpoint-GUID: TJKR4hG43C0SpmTNZdd8EJi9U5ntwOTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_17,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0
 impostorscore=0 mlxlogscore=805 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090171
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, Nayna Jain <nayna@linux.ibm.com>, linux-security-module@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update Kconfig to enable machine keyring and limit to CA certificates
on PowerVM. Only key signing CA keys are allowed.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-and-tested-by: Mimi Zohar <zohar@linux.ibm.com>

---
 security/integrity/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index ec6e0d789da1..232191ee09e3 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -67,7 +67,9 @@ config INTEGRITY_MACHINE_KEYRING
 	depends on SECONDARY_TRUSTED_KEYRING
 	depends on INTEGRITY_ASYMMETRIC_KEYS
 	depends on SYSTEM_BLACKLIST_KEYRING
-	depends on LOAD_UEFI_KEYS
+	depends on LOAD_UEFI_KEYS || LOAD_PPC_KEYS
+	select INTEGRITY_CA_MACHINE_KEYRING if LOAD_PPC_KEYS
+	select INTEGRITY_CA_MACHINE_KEYRING_MAX if LOAD_PPC_KEYS
 	help
 	 If set, provide a keyring to which Machine Owner Keys (MOK) may
 	 be added. This keyring shall contain just MOK keys.  Unlike keys
-- 
2.31.1

