Return-Path: <linuxppc-dev+bounces-13683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE7C2A00F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 04:59:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0HsB1yTMz3bfX;
	Mon,  3 Nov 2025 14:59:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762142366;
	cv=none; b=eVYBcTAHM6ABsikBTroQe9ZWSnuSFQYbonGlJjjVBUQ+VRZfS1NlKxP59yBgarwrpp3k5ibm0aTOvWbmAF0mWbQY/pWbie+qUEmdkrNfwY+sUDhwNSA/5GzsnuX3AaSIfAz6EbqdhrqTGvDfbznQdnC1DLSwCMBIMw2uaZD40JS4dzUXQEYckIHYm7J+3KjbIT/QCXwff/Ozm97LBric4SEPbMS0z74xIdQ53/3OYjniIFzXm9TnzyzemNYv4BpwxzZiz7d5DfmQJggqhvjaLyQRdHOwK9YBj2qV5tFZrV+5AUdz1KhRzQUophB1Qn/tTfSGfjWRX/hiNXyssK8HXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762142366; c=relaxed/relaxed;
	bh=AvZ5h3INQpFqq+KEob2CI2+cmj/XeytnIj7tkIJp3SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYTmXoGQXPKtlFMCEYOyk8lcodlquXMt34KpISgDZTVTWFY0ownTbLFmg1xS3U+B9BRBDA6sj67Vm4+JvQ37o459TtxI0BJJajsZlTaE6u7upADLydnthRTA5utClBKyvI/nC9UIF/EeizDNs+KFw4p/CSZOONjcIqYEdVt/49WEyA2OSnHqjHOzLTh8qUdRF9a6N0VJhca3YU5wiC9dzr739EIhnkJ/gN7tZeOhdO+2CEYZHTIdBd81V8E6mWnCrBta0mFCmvKR8S3tfWIGZiWtzObtPOzOK5M/iK/zsCahMXuPFQeJq/PHFc0KfRADKSPPBLZF8kDjTDY93isQKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fwOqHiQk; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fwOqHiQk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0Hs93tJJz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 14:59:25 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A2MF9da009612;
	Mon, 3 Nov 2025 03:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=AvZ5h3INQpFqq+KEo
	b2CI2+cmj/XeytnIj7tkIJp3SI=; b=fwOqHiQkrmHDr+zJt6txf13OIXPx9U90a
	mtrDpNRuXeTaO18+V9jbIfvOG2GGuImenAYrHPvC3MEiQwIzQjQDxISM7K8HvShm
	9uPn3oLvHqwizGEchYnvj99nBHDZLjrY1Y2l4Ig3549qwWKQnMjrTf6BI8Wk2YE2
	1e//TinIvkJX8mjzDj0aRHe0psXYpETkp+ANF0UiyfkB4Sx7w/spAdg3a6Oz0ptF
	ePi9HQncdU8z78sZWHrbYAiFpPvs4CMZj4ksFv7u5AkSZai2bJ5KgMgXcnhLVGLX
	oBHXBz2BSCIKUpvi9Q15XVG+nK/DDAFduipGYqsoooIcgCyl+jvWg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xbmtpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 03:59:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A33nSdw021482;
	Mon, 3 Nov 2025 03:59:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrjbgnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 03:59:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A33xGZi42860880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Nov 2025 03:59:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D80652004B;
	Mon,  3 Nov 2025 03:59:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBBF92004E;
	Mon,  3 Nov 2025 03:59:14 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Nov 2025 03:59:14 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Jiri Bohac <jbohac@suse.cz>, Shivang Upadhyay <shivangu@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org
Subject: [PATCH 1/2] Documentation/ABI: add kexec and kdump sysfs interface
Date: Mon,  3 Nov 2025 09:28:58 +0530
Message-ID: <20251103035859.1267318-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103035859.1267318-1-sourabhjain@linux.ibm.com>
References: <20251103035859.1267318-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX5QmfpHgpw709
 hIObubPd11xxVuh3XF3PahdPxZWlo5i8W+sscUSWulprIaaEwlTUS8WbKF/xLPb5FOaw+2ItYHt
 SUQQoCYR+ZWo5e6ZRrch18QbF9vwrf439d41ZmM+O0yk/vpT4y8MuccWM8cqKYsSB6G9Z9UBkVI
 jGKDdMqgIXzS/6KSP3sd7veez00pcQfmM4gL21fI0X/ca7nvd/PBdvikxVIkK30jICdYwfAF+hO
 2RdN9hfQ5ZicYxQ+PUWcxIsv0AagmnjOolxncUYrzosyJhoy/a4JmiW2Yw4WkH2qYas0eNsiUvN
 s0IQZHkdYl3WysVCafzW0rotozDlZ0heIdSWgHStd+0vhq1vdWNRHfGjq4JSLYNxsirKVsEOl22
 erkz8fhLrZYfy4lSVa/IIflrkKq8CQ==
X-Proofpoint-GUID: SXkr0TzIn_er3yoERIrscZ33zWghVEpq
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=69082899 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8
 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8 a=ZOjX3YdM_w__wJIrIs4A:9
 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: SXkr0TzIn_er3yoERIrscZ33zWghVEpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add an ABI document for following kexec and kdump sysfs interface:
- /sys/kernel/kexec_loaded
- /sys/kernel/kexec_crash_loaded
- /sys/kernel/kexec_crash_size
- /sys/kernel/crash_elfcorehdr_size

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
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
2.51.0


