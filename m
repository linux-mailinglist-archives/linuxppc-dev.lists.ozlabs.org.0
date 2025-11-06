Return-Path: <linuxppc-dev+bounces-13826-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7921C391CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 05:51:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d28sx0KqCz3cZL;
	Thu,  6 Nov 2025 15:51:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762404692;
	cv=none; b=ODF22+u6+2xK7afItxStAUGhOENCT4GainddLTed2cXQMf0Qqu4ct8UukbSXDE/9galqUxnJ9VHeS/gXTwttq/uyeCYQugNRxoEPdv7Ed2DLlmR8NTm+yVZACA0Rbrw6Vva0VlFfiuZ7BxJ020tfvmr4FQKLb6UfP/M1/VeMnEVeLjsx75GMClGZaiBlcz93+Uuj9BaoZorHNP3mSLdEK3gZ08pHjhRyOPTRIoqzRjwrqc+F22yvD/uk2R9euv22liPIhtdQ35YYTU//Y5O1odi6lpQtb6/Je0akw3H4SUw91kvqKDLWy7vH6XtByh4q3bw3OrF3QaNRrjhQNh6LnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762404692; c=relaxed/relaxed;
	bh=/V6SVSlCwWARJN8MshYeE38wHOsfx9fVw6Lsq3W3djs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WS2O2v9zZ8Dwzj5UMBmk2AHHAC1dnY0vaUcaNyg2qv5jK0qswNvtDVHW6aOqt6h1my6Z4ZsR7bVeNdAu/JhVm82ZgwpwL2q94C0gagdoTa2ytTmyv/2ZJTRmun3cf6y6wY2pcxc8Pr/wj49mYm9XFgwRiACCfJ3f42plh2Tjbvnjkdsj7KL391Lli/p4psKrMRzDQAW6SF6/2SzkaOnUeQorvJlAZ6BPPvIyY8C65umbrrQzu7mMVj+fM2Rw7BoV4bSNYg82v8hKUXdrRurjOW7E56kd+ezIXnYsh9h+23RT2rXELg02/ZYe+SzXrDlERi9Z8NakQjEkfIAqvoAaDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XfLDGkQW; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XfLDGkQW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d28sw1dg6z2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 15:51:31 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A5GKMvV018413;
	Thu, 6 Nov 2025 04:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=/V6SVSlCwWARJN8Ms
	hYeE38wHOsfx9fVw6Lsq3W3djs=; b=XfLDGkQWclbKiABi5+zLAFXCwihk13uvK
	R3ob7vtTXodFPmq6cSuHeZEYlazpRbvqrYCFQsYVPTuyAmXCFkfWVOxLZs1C0T0y
	k+HlytsiMSl3m550tbNQp7dFEX5fRwhpiMuHb5qq5PIxJLAqtJzpXPkImnIeoy1J
	/4sTBOqYsN46J2yRRT2A/9B8C4xueOXO0qWk4Y9NBkZKJhSzuh9Bl019f7MtoRiY
	pU5dcecEnx1/Fdw8obs8aDFswDjj9P0fGbeXiAl6xTjLziGVjYyHpmpLWvv83u1E
	z5sxFsGPqG+6WmL0ykVHcH4xhOqZtPU4N2IB3xpoD1AXZhjo4uMIQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mrcm0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 04:51:26 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A64mNjb017116;
	Thu, 6 Nov 2025 04:51:25 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mrcm0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 04:51:25 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A61gAES027407;
	Thu, 6 Nov 2025 04:51:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5vwykv4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 04:51:24 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A64pKFC56230298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Nov 2025 04:51:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 935E820049;
	Thu,  6 Nov 2025 04:51:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5FCB20040;
	Thu,  6 Nov 2025 04:51:16 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Nov 2025 04:51:16 +0000 (GMT)
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
Subject: [PATCH v2 1/5] Documentation/ABI: add kexec and kdump sysfs interface
Date: Thu,  6 Nov 2025 10:21:03 +0530
Message-ID: <20251106045107.17813-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106045107.17813-1-sourabhjain@linux.ibm.com>
References: <20251106045107.17813-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: 3jBlu3bVDmG0_vkthBTjLNlihbjrMRpW
X-Authority-Analysis: v=2.4 cv=MKhtWcZl c=1 sm=1 tr=0 ts=690c294e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=ZOjX3YdM_w__wJIrIs4A:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Ebw9ON7VxY8ItKWR85PjsbQKqgqbG_FC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwMSBTYWx0ZWRfX3vSpzTbkIjUB
 FqDqe6VQ+SE6jvu26wpy/p5gw7fXIU8ZHFUOmV4qLnlvW9lR1oxHn1b0kyujjUeJgk4OTzBHEnG
 +kQ2RUmHoObNxwgL1z52KoNxHmUIwnTWFqcxW9fBYHrBHCs1sC4XdJ0zKdp+KYFqssPqoEhQS5w
 8EqhtwRgMafjerRFCDEWztWrAl5iizlHUP9b8mUtsYQCo0hkEAQZJS9g1VursL8bJ4hC0lXoSTU
 r4qdKHAvtX69cDchuLwwLviIGTnZ9ThDFRZI9uXQFNPoUOcXrwoYdPJOVczeywJUjTxlr+bh5v3
 +yLjmI5qmvBnDb2ZIAhDMaG02fRGdp3z6Xa20f4kS6AYziv/gELhTbRbhT8L4+E2tdvz/jp/0ix
 /XV7hPh1Oo4hPiDFPraKw7+m9Z9wWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010001
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
2.51.0


