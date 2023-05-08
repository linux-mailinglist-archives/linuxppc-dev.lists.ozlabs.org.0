Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0D6F9DA5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 04:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF4XN5py9z3fhj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 12:11:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tPwzyYvv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tPwzyYvv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF4MK3Hb8z3fN8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 12:03:25 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3481ls3o032324;
	Mon, 8 May 2023 02:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ixTZ/3HolzITfh19PSCUD7KhkHOE8kt285WElaD/iC0=;
 b=tPwzyYvvPyBv+FlwnyW3gipObvm/153sIFzRJhim0k9r0qxWKzz1z/ilGgm3JFwzOQyX
 5Fze5+8IHB8rmFbN7Loqtrr9Z+MQewlOttuwKFf/huER4cFIflVKQoAdULa1d+0m8tnA
 B9AFDvaMi8RD4BozhPsodBxUIi0k1kPsOgwdB1IgE4xSnUzp/5H0x+7miwuCzUwBHAZy
 6c8Fq3kfOo9vuC3S6aa0WcpWWypyn/XHdoKC1T7K5UWlWE0CFJn6NFZJ7mE7UnhvedQq
 jKtKWR5TL82vvPFsMzMu7ZK1GykE/m/7uxCxS+Udk43yBhN+7SFnqhRnMiTcVuK43OSN Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qeqr1g8t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:03:16 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34820Ob4004704;
	Mon, 8 May 2023 02:03:15 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qeqr1g89v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:03:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 347Mjhbe018959;
	Mon, 8 May 2023 02:01:43 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qde5fgu2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 02:01:42 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34821eWJ19137270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 02:01:40 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F74F2004B;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EB1120040;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 02:01:40 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5541960595;
	Mon,  8 May 2023 12:01:35 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/12] powerpc: Mark accesses to power_save callback in arch_cpu_idle
Date: Mon,  8 May 2023 12:01:14 +1000
Message-Id: <20230508020120.218494-7-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230508020120.218494-1-rmclure@linux.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bmSFBcdVCw2-gH2swHtps0m_NhoEcDP7
X-Proofpoint-ORIG-GUID: _a4ErqOldh5Pci7cJD1dxKvaniVa_1z-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-07_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=943
 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080012
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The power_save callback can be overwritten by another core at boot time.
Specifically, null values will be replaced exactly once with the callback
suitable for the particular platform (PowerNV / pseries lpars). Mark
reads to this variable with READ_ONCE to signal to KCSAN that this race
is acceptable, as well as to rule-out the possibility for compiler reorderings
leading to calling a null pointer.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/kernel/idle.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
index b1c0418b25c8..a1589bb97c98 100644
--- a/arch/powerpc/kernel/idle.c
+++ b/arch/powerpc/kernel/idle.c
@@ -43,10 +43,12 @@ __setup("powersave=off", powersave_off);
 
 void arch_cpu_idle(void)
 {
+	void (*power_save)(void) = READ_ONCE(ppc_md.power_save);
+
 	ppc64_runlatch_off();
 
-	if (ppc_md.power_save) {
-		ppc_md.power_save();
+	if (power_save) {
+		power_save();
 		/*
 		 * Some power_save functions return with
 		 * interrupts enabled, some don't.
-- 
2.37.2

