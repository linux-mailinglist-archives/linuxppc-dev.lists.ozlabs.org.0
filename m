Return-Path: <linuxppc-dev+bounces-13981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F5C44E80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 05:32:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4cFk3nGNz2ynW;
	Mon, 10 Nov 2025 15:32:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762749130;
	cv=none; b=cGsMHRaDVeVwG3fVDNJXB+/vO321uzlq+5Fi/EMrrPbmz0bxISXquB0RhF7v9xczzLST7uWDgOqo4iyAjJxwTVUfvCKW2XYpRWw8RqnN+24YrhfjbcH9LEL8XOsPxIMt0i8QNJ0ZP4tUF07x3Pnt7xTg+/ktfHmdFHnNQjcTwh1Sm5mfNXhyy2wbxN2eRkrVEP/niaxnP6q09TVwz5FhzTbv9W11gRR2oAa8lywRzmmrL9YWeYxJsVGvXzuHKnDFMyKr3+hTejhwihGiSwMmqwhJzhJK3qWSK/A9VeiyiJJrzB/+2KMrbqYlfKzwYP4UqBNQrHTEWMRlFwmaxGtqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762749130; c=relaxed/relaxed;
	bh=K12ZNWcHU/80IfHoVPKcJMdSwJlfuQgRRd7sR46umWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyezDTowrYlwd1u4dBpr17kfwmVo74/whxKv4pGbpNPU3VDrTADqZI+7AmRHn0IKPa6uUnPm1gPdzsujWh88c3kJSFOaw9zNrNrQTQ0BsXUkWVaD/HyIKY5zLqid04sNbNAb5nAPHHetigV5bAt/KWsjfforhMTz/J79iKcOVasPP4mKPHE4BZSF4sXrVbyYvpHCdmNQ45NE18jE0yxMQ24G61E/8klK8xtsp4elXS8TRp64aIVaDzbbHcxJ7jVu5qXxScCRhJsghWhjKC3bPoE3IG1/oEYaDvfFwierPKJkld+O2GXdl5M1fOcf1UMMYahtyiD2Yit7CkpmchxW5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ghkfFig+; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ghkfFig+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4cFj63vGz2xFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 15:32:09 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A97kTHG030154;
	Mon, 10 Nov 2025 04:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=K12ZNWcHU/80IfHoV
	PKcJMdSwJlfuQgRRd7sR46umWc=; b=ghkfFig+ybTuFnHQdZMBOIRmN5ESGCOkR
	Vhp3eQW4PW2aZhje0QeJ66jmT8WiOBb1rPdw46lWL9rxbpTf0wrezPoG300ZuaSv
	NNkmNJfJAauVyBHb1Zpy11A3ej87GCw81xZa6weRjDmFC0+2dBVj7mSPheM9+xsb
	nzJAuPgPpZf5U4TRP0335WG5cwYCLRkQ83dSPbLRmyX9osiuUURBIyYQzxT0GYHW
	68qrcw27A59tdisrJjuGTq2WJStaRi19GmcCdqb+kXj34EWUIkwSHFjdeGq7PZ5j
	oM8Lzly5O/wJiMVSB+dbqgduqICj/INmcS5TkhOxqnIQQMVfUG/Bw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5chw6yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:03 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AA4MVoW008139;
	Mon, 10 Nov 2025 04:32:02 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5chw6yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:02 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9NJa5c011738;
	Mon, 10 Nov 2025 04:32:01 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aajw13ka8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:01 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AA4Vt2R52625704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 04:31:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8620B20049;
	Mon, 10 Nov 2025 04:31:55 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 619DF20040;
	Mon, 10 Nov 2025 04:31:51 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Nov 2025 04:31:51 +0000 (GMT)
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
Subject: [PATCH v3 1/5] Documentation/ABI: add kexec and kdump sysfs interface
Date: Mon, 10 Nov 2025 10:01:39 +0530
Message-ID: <20251110043143.484408-2-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Ss+dKfO0 c=1 sm=1 tr=0 ts=69116ac3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=ZOjX3YdM_w__wJIrIs4A:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5NSBTYWx0ZWRfX0nbWmvBMZaYg
 F2Uch+HDfmGlrYkfeXLW3aB73iUCoAxtLosxEb/JOEY1r7i3iPOsKiUHA2mAeSA7V97c3BoWI/E
 I8HT0qeJyGaqdMCKhYdV1PNbIDXYLhPvm/HPaIbhb0HGIANSlEPZVlxySl0MjbWcMslwXKg9PA9
 QzsHV2oGCHn7psFku+rHrZPwUS6R9l457C0SjlC/YQjk+cBhXFryrnMT3qEqMO8UMIr/leI3jep
 fKeTT9vRVuID2MoPkMHuFSZ32a6M8+q3h/do6vTVOBXTMpfs9JGuuYCk4fBFfP/PKVWowzPneJt
 Mjr+mwQC/yJdAelUtJnFoCJyiiuVBJ1wHHb8z16Obb4HyA7qlo6QfEyio7QXwNF6ZPbIruFX6gX
 1Vw/LoE2bTTDivdL/n5QZDPhmwPw5Q==
X-Proofpoint-GUID: _x8BuBhgsmXcYvY3-myqU4CNehPUzQIV
X-Proofpoint-ORIG-GUID: _hPVkCOwyryni8VQ06jOVqOKRT49Mfln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080095
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add an ABI document for following kexec and kdump sysfs interface:
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
 .../ABI/testing/sysfs-kernel-kexec-kdump      | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kexec-kdump

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
new file mode 100644
index 000000000000..96b24565b68e
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -0,0 +1,43 @@
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
-- 
2.51.1


