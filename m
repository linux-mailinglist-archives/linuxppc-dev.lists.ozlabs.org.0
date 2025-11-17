Return-Path: <linuxppc-dev+bounces-14208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A73EC62554
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 05:47:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8wGK1VR1z30Vs;
	Mon, 17 Nov 2025 15:47:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763354857;
	cv=none; b=iytGfFchU1HSp3o34b60bppo44N7eRV5ei0t26sMwSzPiW1N0HQgHIBZGTLyuQA5jG2BAYNC2TeQzNyX3ddA3u9e4mkvHhJ4Z+c6+qeqRIETSjCIGqqbc3owZiONsxh2NxiHo3NIAmNaZg2BjKDXid1Q/DD+HhG+TZfQfD1h6sNytlTSzuT2LF0eTYrK2kOiNy9aGl7WxbG2SqV0OSMSL/s7VqLcV7u+XZkl7EsVTtO0+kDdFTioR/BV1+H42RYyR8+e+MeawZMiXxY3h5o1rtXniJJO+O6t3jzT0eSQnwc9o23oK+LzvpZNYN7zRhCWyruCV0oUNo+YZS5yD7gPow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763354857; c=relaxed/relaxed;
	bh=kAgUP736+w/dAXgeAKsmaBm2Bawoay2q/0qlkSveY/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqdG1t45fUziuALXFWNgW1xgbGbtO2JMnyYrKIpC85TJ4FkGExos9kRpYVmgkLuS8XPjq+tF9mIEggSJ5JiCRMfckuNLgZEPVvfTXiTzgldy7920rQkixOfrlziQzVoIJSAL4x3mzCmtT7D3WTstFwe6P6OS54tpi33JTf4xWe189YUpy48yqpQYfKpOqj/8EP2ALZB3EaD1kO+TiDI9Ysy4WABO8FZ81juU93h8d4fV0qO4BWfcyMpTf4GbFrgYKzQDDic4/dvvh+qnBLpz2AzWFbMcwGAZPzcLiJQLL166JgKXs9iXYMhywxJWf/e+G0wRvirXB8XW+egq7kvBng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OOJofWWS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OOJofWWS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8wGJ3dWsz2xQr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 15:47:36 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AGJQVac004165;
	Mon, 17 Nov 2025 04:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=kAgUP736+w/dAXgeA
	KsmaBm2Bawoay2q/0qlkSveY/I=; b=OOJofWWSjHGcgj93yma/rToJGlRUYGXAH
	7AjOf6RJw9R9EsBLHQHlN4bBvB3Hel7j4vjF6wLNPkyAFqukZUGz6LRVq0ySvD+G
	wt3NaIh3PZenqbQuVG4qA+osz9WSbxZ8nJKF/aiA2i3m3zASJghaVdRcAuH+FUD1
	XV/QEy/4D//by+aFMEaXQ6hjU1wygSe16HIld1hMTi3Br3TxGMVNvQJeIpT13nxf
	mP1oNkx7kFOo2eYaODohbg05gYAfPDZGeY0P8lePIjwGrxELG6X7Px1zCyNDmRAA
	fGUewXdhK4xBcG2s1+j+Fa2EI98eRUj+9IaQmvPPZka6AjmuoHV8Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjvvh9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:47:32 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AH4g6N8028017;
	Mon, 17 Nov 2025 04:47:31 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjvvh9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:47:31 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH30ePh022347;
	Mon, 17 Nov 2025 04:47:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4umm0ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:47:30 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AH4lQx043712800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 04:47:26 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A07CF20049;
	Mon, 17 Nov 2025 04:47:26 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AED420040;
	Mon, 17 Nov 2025 04:47:23 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Nov 2025 04:47:22 +0000 (GMT)
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
Subject: [PATCH v5 2/3] Documentation/ABI: mark old kexec sysfs deprecated
Date: Mon, 17 Nov 2025 10:17:07 +0530
Message-ID: <20251117044708.1337558-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117044708.1337558-1-sourabhjain@linux.ibm.com>
References: <20251117044708.1337558-1-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691aa8e4 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=Ie6jO2O-dg1Sisz_YqoA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX6IaE0D4qigNw
 HXT7hWhAj6uk2c1NIg4DLGvz+mge1LxtgdMwIARG5Rm0XRJH6iMao++LB7p3uVqRXP7euFMbJ8u
 ULvsy+XEP3oa4OiV9qFrDPVbuAZLBhXitSVeC6i2+Zz/sr7oJ8cicK2AA8HCPEvVHVEJQJOJnXv
 +tEGWMbDute9tT3Xr9VJjwah1zZiE03L5gtYXJweaTm2FZy0Zvjmn1U4JuPV67+uKGhw7yI0FFP
 ccilgtZTGbEs5bvXck28cnQurakMp+P5qNlN1zrojWeWjcmR5BVGa5nJQE8AgvGtUhatwTmcrFw
 Mm1/7U6rqD4DYobTmufpCohvCYs5YO2TCzMiGaunox0lyjzwPhlrEmGEyR04wlksJiY/9yXN9Sx
 qQ6noxTUWdIeMQ3DLJUKUw4xeEbOjw==
X-Proofpoint-GUID: Fee9Le7WiUmVVcxqKav1L0eb7Pr5eq1o
X-Proofpoint-ORIG-GUID: ktFsjZdjB3zQhqUWJMHk955FPtRxrYAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The previous commit ("kexec: move sysfs entries to /sys/kernel/kexec")
moved all existing kexec sysfs entries to a new location. The ABI
document is updated to include a note about the deprecation of the old
kexec sysfs entries.

The following kexec sysfs entries are deprecated:
- /sys/kernel/kexec_loaded
- /sys/kernel/kexec_crash_loaded
- /sys/kernel/kexec_crash_size
- /sys/kernel/crash_elfcorehdr_size

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
 .../ABI/obsolete/sysfs-kernel-kexec-kdump     | 59 +++++++++++++++++++
 .../ABI/testing/sysfs-kernel-kexec-kdump      | 44 --------------
 2 files changed, 59 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump

diff --git a/Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump b/Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
new file mode 100644
index 000000000000..96b4d41721cc
--- /dev/null
+++ b/Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
@@ -0,0 +1,59 @@
+NOTE: all the ABIs listed in this file are deprecated and will be removed after 2028.
+
+Here are the alternative ABIs:
++------------------------------------+-----------------------------------------+
+| Deprecated                         | Alternative                             |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/kexec_loaded           | /sys/kernel/kexec/loaded                |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/kexec_crash_loaded     | /sys/kernel/kexec/crash_loaded          |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/kexec_crash_size       | /sys/kernel/kexec/crash_size            |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/crash_elfcorehdr_size  | /sys/kernel/kexec/crash_elfcorehdr_size |
++------------------------------------+-----------------------------------------+
+
+
+What:		/sys/kernel/kexec_loaded
+Date:		Jun 2006
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Indicates whether a new kernel image has been loaded
+		into memory using the kexec system call. It shows 1 if
+		a kexec image is present and ready to boot, or 0 if none
+		is loaded.
+User:		kexec tools, kdump service
+
+What:		/sys/kernel/kexec_crash_loaded
+Date:		Jun 2006
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Indicates whether a crash (kdump) kernel is currently
+		loaded into memory. It shows 1 if a crash kernel has been
+		successfully loaded for panic handling, or 0 if no crash
+		kernel is present.
+User:		Kexec tools, Kdump service
+
+What:		/sys/kernel/kexec_crash_size
+Date:		Dec 2009
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
+What:		/sys/kernel/crash_elfcorehdr_size
+Date:		Aug 2023
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Indicates the preferred size of the memory buffer for the
+		ELF core header used by the crash (kdump) kernel. It defines
+		how much space is needed to hold metadata about the crashed
+		system, including CPU and memory information. This information
+		is used by the user space utility kexec to support updating the
+		in-kernel kdump image during hotplug operations.
+User:		Kexec tools
diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index 320ec75a4903..7e5e528665db 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -1,47 +1,3 @@
-What:		/sys/kernel/kexec_loaded
-Date:		Jun 2006
-Contact:	kexec@lists.infradead.org
-Description:	read only
-		Indicates whether a new kernel image has been loaded
-		into memory using the kexec system call. It shows 1 if
-		a kexec image is present and ready to boot, or 0 if none
-		is loaded.
-User:		kexec tools, kdump service
-
-What:		/sys/kernel/kexec_crash_loaded
-Date:		Jun 2006
-Contact:	kexec@lists.infradead.org
-Description:	read only
-		Indicates whether a crash (kdump) kernel is currently
-		loaded into memory. It shows 1 if a crash kernel has been
-		successfully loaded for panic handling, or 0 if no crash
-		kernel is present.
-User:		Kexec tools, Kdump service
-
-What:		/sys/kernel/kexec_crash_size
-Date:		Dec 2009
-Contact:	kexec@lists.infradead.org
-Description:	read/write
-		Shows the amount of memory reserved for loading the crash
-		(kdump) kernel. It reports the size, in bytes, of the
-		crash kernel area defined by the crashkernel= parameter.
-		This interface also allows reducing the crashkernel
-		reservation by writing a smaller value, and the reclaimed
-		space is added back to the system RAM.
-User:		Kdump service
-
-What:		/sys/kernel/crash_elfcorehdr_size
-Date:		Aug 2023
-Contact:	kexec@lists.infradead.org
-Description:	read only
-		Indicates the preferred size of the memory buffer for the
-		ELF core header used by the crash (kdump) kernel. It defines
-		how much space is needed to hold metadata about the crashed
-		system, including CPU and memory information. This information
-		is used by the user space utility kexec to support updating the
-		in-kernel kdump image during hotplug operations.
-User:		Kexec tools
-
 What:		/sys/kernel/kexec/crash_cma_ranges
 Date:		Nov 2025
 Contact:	kexec@lists.infradead.org
-- 
2.51.1


