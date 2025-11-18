Return-Path: <linuxppc-dev+bounces-14296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E450C692AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 12:45:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9jVJ57dHz3bZs;
	Tue, 18 Nov 2025 22:45:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763466344;
	cv=none; b=NlxqugvHz1z4IJJRMSKJ1Jm3OpzgIaRae+1MJgq56A3WIW9bSGJ0A4R6ln4gAnc2A1ulWICzZnbjRIdlC3UN0ntpj5Gmk7GLmNMTu1MCGgkMwSJnStKF+eGcB7HHSPsVLdDspHVIi379rkU5X48G9mIYRPgXLvXanol7FR6m7F4niQMPDAN4QemWMRusZ10/NOd8oU+Y2H0ZP2JJAqYUYWd0Z3TTcuVnYaRC1tSPUIqdrR6zRnardfc7QZQR+7ghAa7j1bjJuGYPmTZ7/GUTo7rAaB1J/VbFwvMH8WOyhlyU3ErLWxkSgQkK072AhTVqNudwEPHeQwN+NhZJaQkDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763466344; c=relaxed/relaxed;
	bh=e0hLQINTaCmaRyN1vU9vMbUl969S3sc/832AKPQWkZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJs1pp3L1vhDo01AXnC2lxbCUGw4pBY/p39cYEz1ZNWiedm5ydtDoRySSrShGFSEm8Y423ut8nyYDw00Y/hgAlCoAH4DovCoDDkUiL6a5B0fjJoAGCHiM3d6FnMO6NZDRIBMCcWQzenuFhYot94kGIPpn/2wza2QIgEFL51FzJfZhfzb/lF22kMmIMN97aiCf/lvYJnKqRtPgjJZrx6B55+wnXMCvkgQbIBoxkwyii8TWEdBm0CC15DPp+cDStgFJkh5NQ/rlX7ntffIG0mnJXazLMbSAcBkqZeQd2P0ubBBddAS7glml6S3lvHqrfHhm4afBF9HC0yZICJopMlhZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cWFcLTq4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cWFcLTq4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9jVJ0FQ8z3bYf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 22:45:43 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI5Tvm5024576;
	Tue, 18 Nov 2025 11:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=e0hLQINTaCmaRyN1v
	U9vMbUl969S3sc/832AKPQWkZg=; b=cWFcLTq4OIECRrIBm1PjVJqX2XotdIpXz
	09Dap/gxV5Z9IyjN5xpOkPFaWQo8EurR7Z1Q41prH9qwCa+0DlQxUDnjlgJX0HwS
	eh4hLcyTz0XYUie+EzXfrgTJkUdUwPGoBylmOGuiowoKQ2JRcwbE6MXfTE2Z6RY8
	aFFQGSzElDPrpu4Hzdyk0FvTsvqAdXC6d1p9VJzAYM5vbSCBAA0VKsIznkP98EpT
	B6hX6HhYmrY2L1JLI4xrpOXzNxbEQncdvlvVvrmKc5AtnEnicVq10xQXJIv5gafN
	Z8sXe/XoZnNQqWcvknpBEM2wvcSroa87e0MlJLPVP1SiQZK0zFL6w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwt8dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 11:45:38 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AIBhM4b021473;
	Tue, 18 Nov 2025 11:45:38 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwt8du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 11:45:38 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIB2suf030795;
	Tue, 18 Nov 2025 11:45:37 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47xtyv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 11:45:37 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AIBjXTY56033576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Nov 2025 11:45:33 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7D4420043;
	Tue, 18 Nov 2025 11:45:33 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A62E20040;
	Tue, 18 Nov 2025 11:45:29 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.39.25.190])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Nov 2025 11:45:29 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Aditya Gupta <adityag@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Jiri Bohac <jbohac@suse.cz>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Pingfan Liu <piliu@redhat.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        kexec@lists.infradead.org
Subject: [PATCH v6 3/3] Documentation/ABI: new kexec and kdump sysfs interface
Date: Tue, 18 Nov 2025 17:15:07 +0530
Message-ID: <20251118114507.1769455-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118114507.1769455-1-sourabhjain@linux.ibm.com>
References: <20251118114507.1769455-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: lv60pG7ahr_au-Ez_XUU298QwUCq5vtj
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691c5c63 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=C7Xb30-FUlXqnvbFlGcA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: R8HbI9uE-bqJJcgPa4NIBDMjH6ONUAd8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX9nGszFNYV7pf
 xPrmGqFB6nwyf2Uz6d7WGjFbW6VwF3Svc+AesZwvMv43Rt/Ch6Zk5aUAzOzl/joDaz5SAhzqCUG
 oECxmyw+rB0Vk/IcxLvfmwvZkSzDnMLC54MS8dTvuhSS7knOKCqGgZPtyLuHo/ynu/AbD2s4Muq
 M7UKYss2GJTT0jh5pfPyHoD5TIxGsNbSZ7TGOlpem50d2N0wIIS9qwBZU7Bl3VeZH8IZGV5AYPx
 eyOeBfLPRNpM0OqesBm7htxMWOkLfFdoWAwGviJmrFN/UPzAfQqr1NxeV7PnR1en+Dp3akFdAHH
 81ifUy+cdNsTaZJuvs2l6Au9D/0TfeaI/vi1pntX/IxR95RmvP3g/7aQRGwueWuX2xgGZahvbCJ
 CEgmLx5mgDjrRcNibn/2xFHpZeZV2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add an ABI document for following kexec and kdump sysfs interface:

- /sys/kernel/kexec/loaded
- /sys/kernel/kexec/crash_loaded
- /sys/kernel/kexec/crash_size
- /sys/kernel/kexec/crash_elfcorehdr_size
- /sys/kernel/kexec/crash_cma_ranges

Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: Pingfan Liu <piliu@redhat.com>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 .../ABI/testing/sysfs-kernel-kexec-kdump      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kexec-kdump

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
new file mode 100644
index 000000000000..f59051b5d96d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -0,0 +1,61 @@
+What:		/sys/kernel/kexec/*
+Date:		Nov 2025
+Contact:	kexec@lists.infradead.org
+Description:
+		The /sys/kernel/kexec/* directory contains sysfs files
+		that provide information about the configuration status
+		of kexec and kdump.
+
+What:		/sys/kernel/kexec/loaded
+Date:		Nov 2025
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Indicates whether a new kernel image has been loaded
+		into memory using the kexec system call. It shows 1 if
+		a kexec image is present and ready to boot, or 0 if none
+		is loaded.
+User:		kexec tools, kdump service
+
+What:		/sys/kernel/kexec/crash_loaded
+Date:		Nov 2025
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Indicates whether a crash (kdump) kernel is currently
+		loaded into memory. It shows 1 if a crash kernel has been
+		successfully loaded for panic handling, or 0 if no crash
+		kernel is present.
+User:		Kexec tools, Kdump service
+
+What:		/sys/kernel/kexec/crash_size
+Date:		Nov 2025
+Contact:	kexec@lists.infradead.org
+Description:	read/write
+		Shows the amount of memory reserved for loading the crash
+		(kdump) kernel. It reports the size, in bytes, of the
+		crash kernel area defined by the crashkernel= parameter.
+		This interface also allows reducing the crashkernel
+		reservation by writing a smaller value, and the reclaimed
+		space is added back to the system RAM.
+User:		Kdump service
+
+What:		/sys/kernel/kexec/crash_elfcorehdr_size
+Date:		Nov 2025
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Indicates the preferred size of the memory buffer for the
+		ELF core header used by the crash (kdump) kernel. It defines
+		how much space is needed to hold metadata about the crashed
+		system, including CPU and memory information. This information
+		is used by the user space utility kexec to support updating the
+		in-kernel kdump image during hotplug operations.
+User:		Kexec tools
+
+What:		/sys/kernel/kexec/crash_cma_ranges
+Date:		Nov 2025
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Provides information about the memory ranges reserved from
+		the Contiguous Memory Allocator (CMA) area that are allocated
+		to the crash (kdump) kernel. It lists the start and end physical
+		addresses of CMA regions assigned for crashkernel use.
+User:		kdump service
-- 
2.51.1


