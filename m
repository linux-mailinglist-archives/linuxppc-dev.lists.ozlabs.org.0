Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F41F579C9F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 10:31:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bTwtvG0Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlGxs2K8Nz2xdm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 18:30:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bTwtvG0Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlGwy45KKz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 18:30:10 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C88xgt024983;
	Tue, 12 Sep 2023 08:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=to9w5yrqCHLi29TMkR3+kZKXKZXXIvDAGsAhn9dw/yI=;
 b=bTwtvG0YmubKG4vqG8tZKYHLnYxe+ArOSp4HTFeQqaoN/Bs1FRyIuVuoVBmKnDdFVkgk
 dcMuQ0Ib2m73Rkuvi83f2SYcTjjRiF58VX4qZP4BsWvJbQL2rseZbiNoVCVFcB2yB4Xz
 h8YVw2qGLQqHiPIhaUYxUj3GO+SS29cdYKfIN0X7WW3Y3IRvu2k/oiMuApLgZ7XdaRe/
 vzqHoVnIM6bc8VUfr2Nj0/LRv7dpFIHjEpKDVEimewfkgnBXGAWyXzgM3L0ZQHKBnCkv
 hg8Xk+kTAzVOyVEIHulor7ukWmOFcxYQsp/naLkJiCTYHwq2v5FLKxWPJJSKTIPLELTG GA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2j5jcbv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 08:29:59 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38C89doZ029507;
	Tue, 12 Sep 2023 08:29:59 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2j5jcbuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 08:29:58 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38C6wIJe002401;
	Tue, 12 Sep 2023 08:29:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t158k18md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 08:29:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38C8Tqbk54526208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 08:29:52 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A093C2004B;
	Tue, 12 Sep 2023 08:29:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E740320040;
	Tue, 12 Sep 2023 08:29:50 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.106.137])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Sep 2023 08:29:50 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Kexec-ml <kexec@lists.infradead.org>
Subject: [PATCH v3 1/2] vmcore: remove dependency with is_kdump_kernel() for exporting vmcore
Date: Tue, 12 Sep 2023 13:59:49 +0530
Message-ID: <20230912082950.856977-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EIk-mFTGMjHmkefYEWiZ-GstYmU1pwQ_
X-Proofpoint-ORIG-GUID: 7srt9IEhyvE3vzJikvVf5Z4KGm7-Pkiy
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=957 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120068
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Dave Young <dyoung@redhat.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Baoquan He <bhe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, is_kdump_kernel() returns true when elfcorehdr_addr is set.
While elfcorehdr_addr is set for kexec based kernel dump mechanism,
alternate dump capturing methods like fadump [1] also set it to export
the vmcore. Since, is_kdump_kernel() is used to restrict resources in
crash dump capture kernel and such restrictions may not be desirable
for fadump, allow is_kdump_kernel() to be defined differently for such
scenarios. With this, is_kdump_kernel() could be false while vmcore is
usable. So, remove unnecessary dependency with is_kdump_kernel(), for
exporting vmcore.

[1] https://docs.kernel.org/powerpc/firmware-assisted-dump.html

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v3:
* Decoupled is_vmcore_usable() & vmcore_unusable() from is_kdump_kernel()
  as suggested here: 
    https://lore.kernel.org/linuxppc-dev/ZP7si3UMVpPfYV+w@MiWiFi-R3L-srv/T/#m13ae5a7e4ba6f4d8397f0f66581832292eee3a85


 include/linux/crash_dump.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
index 0f3a656293b0..acc55626afdc 100644
--- a/include/linux/crash_dump.h
+++ b/include/linux/crash_dump.h
@@ -50,6 +50,7 @@ void vmcore_cleanup(void);
 #define vmcore_elf64_check_arch(x) (elf_check_arch(x) || vmcore_elf_check_arch_cross(x))
 #endif
 
+#ifndef is_kdump_kernel
 /*
  * is_kdump_kernel() checks whether this kernel is booting after a panic of
  * previous kernel or not. This is determined by checking if previous kernel
@@ -64,6 +65,7 @@ static inline bool is_kdump_kernel(void)
 {
 	return elfcorehdr_addr != ELFCORE_ADDR_MAX;
 }
+#endif
 
 /* is_vmcore_usable() checks if the kernel is booting after a panic and
  * the vmcore region is usable.
@@ -75,7 +77,8 @@ static inline bool is_kdump_kernel(void)
 
 static inline int is_vmcore_usable(void)
 {
-	return is_kdump_kernel() && elfcorehdr_addr != ELFCORE_ADDR_ERR ? 1 : 0;
+	return elfcorehdr_addr != ELFCORE_ADDR_ERR &&
+		elfcorehdr_addr != ELFCORE_ADDR_MAX ? 1 : 0;
 }
 
 /* vmcore_unusable() marks the vmcore as unusable,
@@ -84,8 +87,7 @@ static inline int is_vmcore_usable(void)
 
 static inline void vmcore_unusable(void)
 {
-	if (is_kdump_kernel())
-		elfcorehdr_addr = ELFCORE_ADDR_ERR;
+	elfcorehdr_addr = ELFCORE_ADDR_ERR;
 }
 
 /**
-- 
2.41.0

