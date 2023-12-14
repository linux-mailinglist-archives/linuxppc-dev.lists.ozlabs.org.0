Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18177812746
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 06:58:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qy8SrAG9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrM8f5fFTz3ckQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 16:58:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qy8SrAG9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrM6v5YMtz3bPV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 16:56:39 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE506VA007793;
	Thu, 14 Dec 2023 05:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iEucn8MPWHb8gdt1ku/4VB8RB4S52vsUNHa2ubv6AXM=;
 b=qy8SrAG94IYJgoOhdDdfNXB7Dzj6mcXDCLHpgd5Pd8+aeZ+KB/xdHKaVUaM81YrTWxjZ
 H5F6v8KL9ZCQsc1ezUtfmphIdXXSM6bit9dRAnMuGeiD7iXvlefPt51cUeRzg4D//6D+
 VY9ysWO/5ptVk0K7BukH0USwnyoAHgJvRgnGRmAQBIMrj0X+7Xlmrl7DGSXtemCX1zlz
 QHy99mKSou7LXlg7rJPi9Sjp8pZslVF0EW0TOrzPADVhDD2amARLBbY2Qt6OM7AJ+qiZ
 i2AL2LNt/jpIFkeb92VIMM/qy5M0Xo0xKeAPRwQEENHr4jVWFlTRzVA+U/A3YCn3Rp8U vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyjg3cj6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:26 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BE5PCHY009786;
	Thu, 14 Dec 2023 05:56:24 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyjg3cj67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:24 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE5sZq6008442;
	Thu, 14 Dec 2023 05:56:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw2jtpnfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:23 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BE5uMHA22151726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Dec 2023 05:56:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAFB92004D;
	Thu, 14 Dec 2023 05:56:21 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C7D120043;
	Thu, 14 Dec 2023 05:56:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Dec 2023 05:56:21 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6ACA2600D6;
	Thu, 14 Dec 2023 16:56:19 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: glider@google.com, elver@google.com, dvyukov@google.com,
        akpm@linux-foundation.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 03/13] powerpc: Disable KMSAN santitization for prom_init, vdso and purgatory
Date: Thu, 14 Dec 2023 05:55:29 +0000
Message-Id: <20231214055539.9420-4-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231214055539.9420-1-nicholas@linux.ibm.com>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tGzZF3E5YBSAEi-LT31YAzRubiKi2f0r
X-Proofpoint-GUID: BEavQEDS5PQBgWzLfLd3K1kN0uk1GSRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_02,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=431 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312140035
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
Cc: iii@linux.ibm.com, linux-kernel@vger.kernel.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>, linux-mm@kvack.org, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Other sanitizers are disabled for these, disable KMSAN too.

prom_init.o can only reference a limited set of external symbols. KMSAN
adds additional references which are not permitted so disable
sanitization.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 arch/powerpc/kernel/Makefile      | 2 ++
 arch/powerpc/kernel/vdso/Makefile | 1 +
 arch/powerpc/purgatory/Makefile   | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 2919433be355..78ea441f7e18 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -61,6 +61,8 @@ KCSAN_SANITIZE_btext.o := n
 KCSAN_SANITIZE_paca.o := n
 KCSAN_SANITIZE_setup_64.o := n
 
+KMSAN_SANITIZE_prom_init.o := n
+
 #ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
 # Remove stack protector to avoid triggering unneeded stack canary
 # checks due to randomize_kstack_offset.
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 0c7d82c270c3..86fa6ff1ee51 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -52,6 +52,7 @@ KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
 KCSAN_SANITIZE := n
+KMSAN_SANITIZE := n
 
 ccflags-y := -fno-common -fno-builtin
 ldflags-y := -Wl,--hash-style=both -nostdlib -shared -z noexecstack $(CLANG_FLAGS)
diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index 78473d69cd2b..4b267061bf84 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -2,6 +2,7 @@
 
 KASAN_SANITIZE := n
 KCSAN_SANITIZE := n
+KMSAN_SANITIZE := n
 
 targets += trampoline_$(BITS).o purgatory.ro
 
-- 
2.40.1

