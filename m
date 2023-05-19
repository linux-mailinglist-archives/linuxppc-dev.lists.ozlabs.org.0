Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8FD708F3A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 07:12:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMw1r64g1z3fC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 15:12:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VxDWZ61K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VxDWZ61K;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMvxC3bJQz3fHB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 15:07:59 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4gWV6015227;
	Fri, 19 May 2023 05:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zKxf7HAp4TOy42oAu8UQKOVTlvuOMbdmJOsP5+9kBdM=;
 b=VxDWZ61KhC3wpUo/niok4DRjYSK/eUwNxNAhQ4dXRIER21u5FtIss7G3Ga6mhbNAS9Lm
 dr2UZ6b93/pAsyR3FwsQQI47RHl7j+YxS56TveeNzR/MqPdkqVj22OQBkYgEJ6pMjuW9
 myxvLDN1RhyKn/hPXc686V3CXfYHaX4GDSp0a8thUwISJ8GOB28x72JQFkZ54jjSvvJY
 EaA8kB2RTIXBzKFKL3i5lERDVdOzDkAvJ4nTuVGQaJyUgooWTEgPzkuG6A6vcUfBngaK
 qvmmEhPEs2zp6o6a9wS8dH7WeeDjR2t+rOX7Dipnwve3fLWdD6uvP5R4/ggZlA/W/Ntm GA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp2ap0mqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:07:56 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34J558l8013746;
	Fri, 19 May 2023 05:07:55 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp2ap0mmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:07:55 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4bwMX020001;
	Fri, 19 May 2023 05:02:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3qj264tg2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:52 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34J52on451708312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 May 2023 05:02:50 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70D942004B;
	Fri, 19 May 2023 05:02:50 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7BD520040;
	Fri, 19 May 2023 05:02:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 May 2023 05:02:49 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7A6EC6060B;
	Fri, 19 May 2023 15:02:45 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/12] powerpc/dexcr: Support custom default DEXCR value
Date: Fri, 19 May 2023 15:02:30 +1000
Message-Id: <20230519050236.144847-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519050236.144847-1-bgray@linux.ibm.com>
References: <20230519050236.144847-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: POj_I_RhxHRO5WMMQuXGVIWjLVZPS1XQ
X-Proofpoint-ORIG-GUID: e_mnFDkd9OADpjl5v8vITe6s6ut4SSMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190043
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make the DEXCR value configurable at config time. Intentionally don't
limit possible values to support future aspects without needing kernel
updates.

The default config value enables hashst/hashchk in problem state.
This should be safe, as generally software needs to request these
instructions be included in the first place.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>

---

v3:	* Fix hashchk typo, provide minimum ISA version
	* Add ruscur reviewed-by
v1:	* New in v1

Preface with: I'm note sure on the best place to put the config.

I also don't think there's any need to zero out unknown/unsupported
bits. Reserved implies they are ignored by the hardware (from my
understanding of the ISA). Current P10s boot with all bits set; lsdexcr
(later patch) reports

   uDEXCR: ff000000 (SBHE, IBRTPD, SRAPD, NPHIE, PHIE, unknown)

when you try to read it back. Leaving them be also makes it easier to
support newer aspects without a kernel update.

If arbitrary value support isn't important, it's probably a nicer
interface to make each aspect an entry in a menu.

Future work may include dynamic DEXCR controls via prctl() and sysfs.
The dynamic controls would be able to override this default DEXCR on a
per-process basis. A stronger "PPC_ENFORCE_USER_ROP_PROCTETION" config
may be required at such a time to prevent dynamically disabling the
hash checks.
---
 arch/powerpc/Kconfig                  | 14 ++++++++++++++
 arch/powerpc/kernel/cpu_setup_power.c |  3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 539d1f03ff42..b96df37e4171 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1039,6 +1039,20 @@ config PPC_MEM_KEYS
 
 	  If unsure, say y.
 
+config PPC_DEXCR_DEFAULT
+	hex "Default DEXCR value"
+	default 0x0000000004000000
+	depends on PPC_BOOK3S_64
+	help
+	  Power10 introduces the Dynamic Execution Control Register (DEXCR)
+	  to provide fine grained control over various speculation and
+	  security capabilities. This is used as the default DEXCR value.
+
+	  It is a 64 bit value that splits into 32 bits for supervisor mode
+	  and 32 bits for problem state. The default config value enables
+	  the hashst/hashchk instructions in userspace. See the ISA (3.1B or
+	  later) for specifics of what each bit controls.
+
 config PPC_SECURE_BOOT
 	prompt "Enable secure boot support"
 	bool
diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
index c00721801a1b..814c825a0661 100644
--- a/arch/powerpc/kernel/cpu_setup_power.c
+++ b/arch/powerpc/kernel/cpu_setup_power.c
@@ -10,6 +10,7 @@
 #include <asm/reg.h>
 #include <asm/synch.h>
 #include <linux/bitops.h>
+#include <linux/kconfig.h>
 #include <asm/cputable.h>
 #include <asm/cpu_setup.h>
 
@@ -128,7 +129,7 @@ static void init_PMU_ISA31(void)
 
 static void init_DEXCR(void)
 {
-	mtspr(SPRN_DEXCR, 0);
+	mtspr(SPRN_DEXCR, CONFIG_PPC_DEXCR_DEFAULT);
 	mtspr(SPRN_HASHKEYR, 0);
 }
 
-- 
2.40.1

