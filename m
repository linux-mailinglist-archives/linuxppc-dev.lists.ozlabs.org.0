Return-Path: <linuxppc-dev+bounces-8349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB54FAAC700
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 15:53:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsKbX60WDz2yx7;
	Tue,  6 May 2025 23:52:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746539576;
	cv=none; b=DhgLUn0YzbHlZSupyLo3yYTJyLxN1X40y1tUbZ8Ohda0Y6gj+gLNBQ0A+aRtuZxtGH2JZc1FmHd6+MwIQpy17FIblmxuTaCuUdGc1oV5vdbEGolEW3QChyQYBr3hwGleS0qc7obMPSfJsn1TRzbvjN59kyQsbmxKXxoq9PxGDdhdMUSyWLrhQdmj/fY8J6EW+mO+/5YD8xkWLkLFARdFCYQXaRmTKdwI0qDI4Eh8WrldEO8LJNkszVVweowYfH4mNPbxnUhWrV4zxrc53DS47f/6G1WeeLpoeEH74onmfEnH2V2Kl5v1aOeX53ibY56RV5RdpSDbMyqzCYQRrRyvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746539576; c=relaxed/relaxed;
	bh=G2g50nwvrxrxxR+v3mU4H+R3PSqxi09twTXhGaqJc3I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IROQkqDVNGJt5eHKmu86+9WhUmk2B5dxyMXsB8iwZTV4dUw+VluQdIke86/VwpKXyEN64cau5L/8YJs1rU5nm/TRQb1vxzZ1FAAMP9+HZ0Z/0vAaAqoiTukEB/bp6qwWgwsG5RdTwIZK7OMcAEPF1pSnKT6ylZ0UbKq0yPOQVsLP1bMWk4/ZgQRXTWu/dBYdzY1vulVMqd+9S8TGPNxfnN513d4zx/VSjs1s98nvVQE7VThOxJ86iNvXfoGSr9FECOo9Ste7BiYusCjvUz4HUUKmzfeOdMn2kJvZL43H4JLaBY2C5zyzdx69Hx2RXpwu6g1Xla1Lp3iV3fbUhCdSpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iVRf+Mcb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iVRf+Mcb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsKbW1KjZz2yw7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 23:52:54 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546A43u8010324;
	Tue, 6 May 2025 13:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=G2g50nwvrxrxxR+v3mU4H+R3PSqxi09twTXhGaqJc
	3I=; b=iVRf+McbzKs6+5NconHTvZltTcuC+LU5bDzk39u9WtpWaW0GHny7bYWbx
	MnpVhCkmO2l96rRhm58qR9NPbdEtFZZpjwNDoj6UX9Dw+suBsZT8m33/mi+dSIyz
	zRN48m7Wh1GaDlSOp8mBZ8jSmq865hj4U0JL/Kd+SGdSn68itPewWkZHrOwXTjLH
	Af1jLeNMddj7gy0w7iSwPjq2gjlbRBMAB82EmMufpG60+NxW71kPu4S6H33qoFZF
	l6rK51o0EQEW7t4y0ELAfKvf4D7j94YDe++5MRoEI78jTVzVZlddyW783M9brbEA
	KJ2OAgBQKYCbuizbXDzoMnp0XFIFg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fgbj93er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 13:52:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 546BvvvX001316;
	Tue, 6 May 2025 13:52:51 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwftbwhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 13:52:51 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 546DqjoP50331964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 13:52:46 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E238420040;
	Tue,  6 May 2025 13:52:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 071402004B;
	Tue,  6 May 2025 13:52:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.252.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 May 2025 13:52:39 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: atrajeev@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        adubey@linux.ibm.com, skb99@linux.ibm.com, sshegde@linux.ibm.com,
        riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com, venkat88@linux.ibm.com,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] powerpc/pseries/htmdump: Include header file to get is_kvm_guest() definition
Date: Tue,  6 May 2025 19:22:32 +0530
Message-Id: <20250506135232.69014-1-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h5jMNl3Ws9E57PSCh5NOoWP8nOYGrPRv
X-Proofpoint-GUID: h5jMNl3Ws9E57PSCh5NOoWP8nOYGrPRv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEzMSBTYWx0ZWRfX0rXbbKU2n/LI uPFdthYT0CxGjytEHe0viFZxceqfdvE9DUwmR7jQMyxXj/G3N/wGlanzeSn7Dv9homfEIJ1jW9A oefIImQQIrSwtwL88HIi0fqNHpd6ZV8P6kdz3VGeh8+iLa3lI8uzwpgA1bBiV2czr1c7jNj3zeQ
 Ydp+ad10CACuWjL3cFZNqxt4TnHUTyDuo85yyU4i/jc7gZgxI6VUaokLVhQdWj4FYoOX/f9qJuO +Zxao8qs7L45OW1VETH2yLsLYthSMyiK4Yiy2GdqYOWOPQ+k8l4kI5CvOXExAj8FdLhP4djAK6K Q9ibFuCp3B2lMDck1GpeQOZlGhImnphJw7jlBwexZCJtmCtfjfIjZ8eXPKSInLTRiSMcuWw/AM4
 29FDhaRXeY/q50jXPH9BwaYx5Udv2ybKeMI6+FihzpCUwfP2E+qIyDNKQKnZTG9ogaJ3b0OM
X-Authority-Analysis: v=2.4 cv=FJcbx/os c=1 sm=1 tr=0 ts=681a1433 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8 a=bUd8kiv1R8YXL_p8ZIAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060131
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

htmdump_init calls is_kvm_guest() to check for guest environment.
is_kvm_guest() is defined in kvm_guest.h header file. Without including
the header file, build hits error failing to find the function.

  arch/powerpc/platforms/pseries/htmdump.c: In function 'htmdump_init':
  arch/powerpc/platforms/pseries/htmdump.c:469:6: error: implicit declaration of function 'is_kvm_guest';
  did you mean '__key_get'? [-Werror=implicit-function-declaration]
  if (is_kvm_guest()) {
      ^~~~~~~~~~~~
      __key_get

This is observed in configs where CONFIG_KVM_GUEST is disabled.
Include header file explicitly to avoid the build error

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505061324.elUl4njU-lkp@intel.com/
Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/htmdump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
index af15d50c924b..742ec52c9d4d 100644
--- a/arch/powerpc/platforms/pseries/htmdump.c
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -10,6 +10,7 @@
 #include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/kvm_guest.h>
 
 static void *htm_buf;
 static void *htm_status_buf;
-- 
2.43.0


