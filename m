Return-Path: <linuxppc-dev+bounces-13984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B6AC44E8F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 05:32:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4cFx1Smxz307v;
	Mon, 10 Nov 2025 15:32:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762749141;
	cv=none; b=TK3R8UPaWCB2OlZn9Yzsgjekb5JEYgC/qCFQTrEtQV2098HjXS/E2oIejnQ5lidB2E7+FLyoTfThds1p6xnB1b+oOt2OOZhnvHTUi2xrhzutmz7oTQQ1S1L9DweGbVoBzt2SIDT8lhQKBcg2/hrQE4cKszCWkczPIOQ37eaIjDH0/TQzzlwlMS7bNEVqe/HwBoef7/lCdMuRR4CKBUlp0vCY5cgaR5TDpEckDEJhV0HX3UsfYQgcWce7YZqaaNNBcA+JWXcx0ALIX/mIVCoSgKz3D3+dyB/KcqvDSlUAjteBmikVHzvydTOutq5vCqEXMOC5IgKinr6gb5WhsR4NHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762749141; c=relaxed/relaxed;
	bh=XQVnR5QN883hGjZ4jI12ajdUhVieIx83NkEJie8s4hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYu5zPEsyw91ivqBVOUZvG9l3gMHklV85vEYDV0sWDow4YpMwM+36BNwQ+5NEgjsCU6vIm/WK2C3KrNV7XLnu4jabDfAw8dVrZ8ugA8UinJbbdo5Iv9LldFZ2W62WMBUyfTo0+p7dpJGo7RCLZrlG0bGhm+5JeDcAWyKrw3yPlOWCFBA9DtuD22t4f3RijO+zFMvovsg/p3FNWj8iRWRGBvVupESX+wi8u6SUnXFNduPpfLAn7Adj9C2ucgPXpQ115EvXkHtW7rVE2E8zQLMBB8JtgF3jygFM4dPqDbfc8oFUfe5WP58q5mznCX6WPG9gmMwnzEfm/o0T+MO0Thw/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Azw7ra35; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Azw7ra35;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4cFw2JMWz2ynP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 15:32:20 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9JOPnf028433;
	Mon, 10 Nov 2025 04:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=XQVnR5QN883hGjZ4j
	I12ajdUhVieIx83NkEJie8s4hI=; b=Azw7ra359EovwdpEFfsIfHDZY6D0m/xBn
	nN5p5JaIbMEivJPdObwEmjy331isiEKcaW8Qbll0yucxhc40G+wyQOs2C17UEa1W
	Zp8h+e/KiBRvWhGsnwOEmIesVu5/LYOCl95wAVeLfAnWWyBIrLD/ToxMJglcWVDq
	kxAtYTm+AWe4T6jPs3v+xh5WQPVTcMhC6mufJ1SrVFUTPH2y6KLIznSj5YRguPbY
	QdlMXeVddKmDTKPOXdRlkRufgKzrCOWSdcO2AppI8CeuB8vk4ODDQ9t3lfS/3n5G
	Vita1XD8ql+TJjM4+uTzCBR5KwCh8jvv/utOvgfCyrMfrVKzRsQ1A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa3m7vqyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:15 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AA4WEbP009127;
	Mon, 10 Nov 2025 04:32:14 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa3m7vqym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:14 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9NJFMQ007314;
	Mon, 10 Nov 2025 04:32:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aajdj3ncc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AA4WA7k8519936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 04:32:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 010FB20049;
	Mon, 10 Nov 2025 04:32:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56A2820040;
	Mon, 10 Nov 2025 04:32:06 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Nov 2025 04:32:06 +0000 (GMT)
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
Subject: [PATCH v3 4/5] kexec: document new kexec and kdump sysfs ABIs
Date: Mon, 10 Nov 2025 10:01:42 +0530
Message-ID: <20251110043143.484408-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110043143.484408-1-sourabhjain@linux.ibm.com>
References: <20251110043143.484408-1-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=MtZfKmae c=1 sm=1 tr=0 ts=69116acf cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=C7Xb30-FUlXqnvbFlGcA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: XWGTsIeWUygy8KCBhQz2h0OFyxevu4iV
X-Proofpoint-ORIG-GUID: Ro9ESE3IIUvMiL_479W1gi1eTY0EYECU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA3OSBTYWx0ZWRfX+33Ufagc+pf1
 80b6HakgZa7c0SJeM3FhaiYsvFwvyBQ44SfGDX/5qgX0xtOQx4aDVYBrn7cYneTllPWTN5hFs+P
 Dx5MRqkivBS6IcGOmv6HKhD+fEfXleEK8mkf5ghYhtlyxJRtTofFzbGT9CeN3heREpXqEy9c3d+
 3vX276IXFzx72RPuaFugqtvaI+4uBcXw7K49PIMXnshQqxXP8sD+Ag21KfonUdobq056WgXoErn
 3bETFOmJoAj0B9G/Otirs84yBxBZE3qH8ozcVAAdg1pTXj8O+2x7N9U2Fxv1K6/3K/7gttn4gdL
 fZwYKSEN4TVQOvYyDfNxABs0GO7ai1b+mrHYGTY40k7GTHTj3IaitHRbtZw+CGn+Eeh0qMArViM
 6YEgPhv5Mi+CYY/QrMgSQstzKI8gSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080079
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add an ABI document for following kexec and kdump sysfs interface:

- /sys/kernel/kexec/loaded
- /sys/kernel/kexec/crash_loaded
- /sys/kernel/kexec/crash_size
- /sys/kernel/kexec/crash_elfcorehdr_size

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
 .../ABI/testing/sysfs-kernel-kexec-kdump      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kexec-kdump

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
new file mode 100644
index 000000000000..00c00f380fea
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -0,0 +1,51 @@
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
-- 
2.51.1


