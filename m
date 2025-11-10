Return-Path: <linuxppc-dev+bounces-13983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87189C44E8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 05:32:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4cFr01GSz2yv8;
	Mon, 10 Nov 2025 15:32:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762749135;
	cv=none; b=SBiJBUYVv44lumi7MIDtLe+NdsMrXus2n0kS8f9DHD08GIHBhi6tV2mjwqmgKy6DN7paASZitWb4Ibu/z5oK6720gYKztlJ+LEEyDedea4ngiczXHi1hW4Uw1wBZpYf7E/thKM1gWT29fRlapo5DXhQi676WpCFx6X54lkiCk5EK4C16QLCnPZ1tELBpgRXjK3+1yOJhxOVZzPy3gUGeXhwV7LPhgCNk1HS3VhLjw3PMJuJjCafwdOPmfpeeqI+hMSENA11+6vFgIsldC9lA0adnc5LLDeXAR8rXqSJs0VF9Fav1IR0vKA5UYXeHkI9klv8X0WthdfM198WAqGGAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762749135; c=relaxed/relaxed;
	bh=vsU1RZLnrbaQXMov3T1w4F/vxwR9IwkqfqhPedHcRTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUQzBmb92BI6J3yTtBqwGnVFZB1UF1YqW3zF7ys4WMX9ZJDGHY7dTnZNmKO75WDPKwzFZRAkvbgFhEY2lQsl22Y6gMGJOoYHmDm2Jn74X7XDY2u4w/lUXQWcnShrKtWSnZJiUnh0MxKD/Gcp19qY3DEhUN8iTlv1bynA5AqgnT3NV0jFiadg/ata7u9+Lt2e5CWydMO7xi8E/nA9tQv6m7tG6LosT6VqshboFnLZrsFb/zFFlo43WOTVUNiNjqdGJqBHt0sLXbshYxf4PYJttRVFurhWTwmhU/jATAp30h2uDmkJBscosRCjsYUCWzrmohhAL5WxfBfvEQ/i2kTZlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I18ULFW3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I18ULFW3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4cFq2BBhz2ynP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 15:32:15 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9MhGkq005929;
	Mon, 10 Nov 2025 04:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vsU1RZLnrbaQXMov3
	T1w4F/vxwR9IwkqfqhPedHcRTA=; b=I18ULFW3o4o87tQwhpR7UH5HFmbg791Yf
	nVfWlOigRZzkcuVpLYt5KOr1FZqpf6Ag9k8X8g1jD+ZiGpn9e7rdZBNacVognnZT
	eBVqa1CGpne/UmelScEO9yl/o+fjseexLa3aLMQzPAWRAUXhHATVJeYcoxD13r8y
	HbbaQb0jDwRyZ/VuSjgEFSkv+fjXQFLmYrlKeGw7rb572WMLMO0X/FtbzDkooQFm
	ntHNrsUNzhYDl7scSe2tYfaJtwMV3dADwI749lmKsBu7yINiSklnyjeK8G/bPLZB
	R2HGk76+K+GE52LVIIat2wXdfUde4KrH7h0bZEzEmQGrGqRZVrGNA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wc6xfw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:11 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AA4Ug5l003607;
	Mon, 10 Nov 2025 04:32:11 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wc6xfw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:11 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9NJEFG028859;
	Mon, 10 Nov 2025 04:32:10 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aag6s40yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:09 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AA4W5Ev25100650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 04:32:05 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3611220040;
	Mon, 10 Nov 2025 04:32:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AFE720049;
	Mon, 10 Nov 2025 04:32:01 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Nov 2025 04:32:01 +0000 (GMT)
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
Subject: [PATCH v3 3/5] Documentation/ABI: mark old kexec sysfs deprecated
Date: Mon, 10 Nov 2025 10:01:41 +0530
Message-ID: <20251110043143.484408-4-sourabhjain@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAxOCBTYWx0ZWRfX7+mOY26QI/Rr
 jaBNK97njnroifwJP5ZwiHGQwqizOsCj1gYG3LB/UU5rZTI2N76LELvfiGHglV6gsI7i4lz7PPi
 /qmOxVcxbBg1XI8WwEMDiM7JnM6NDSXjKwosuyvEQztG1X7Voy4CkISk49WYdKYmX1I9FX/0ovW
 7ZXFtBfAhyt1xilXidtDer2DnpELXWdURnDd3IOBp0XvIUTyiZcBjZfm/MbzsgdCKd/O+wWjPXd
 ixNz/yEMTMkzTjVah6YvLnIEpyLW9CHXs9kJerEoTJl2WaBF8tSUWnRwCvceW1w5gVBTMyUPKg9
 xpfY9amX4QrZsJUHephSpPN8kqGl+5rHNHqfhggcG1KDBYzmqii6qXhHPjOVQGseKxd6mDFVYmr
 zVv2NCCaKgFw26t68MBUt1SOFeiTPA==
X-Authority-Analysis: v=2.4 cv=GcEaXAXL c=1 sm=1 tr=0 ts=69116acb cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=LRU2jnFezOS3J6eLL00A:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: Xlo5PES5yS8RFhqcRxzTDaJQHsWcKfzP
X-Proofpoint-ORIG-GUID: 8eh60D0z_xXaYRhK5KlM0QTnlYsqDFcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080018
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
 .../sysfs-kernel-kexec-kdump                     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-kexec-kdump (61%)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
similarity index 61%
rename from Documentation/ABI/testing/sysfs-kernel-kexec-kdump
rename to Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
index 96b24565b68e..96b4d41721cc 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
@@ -1,3 +1,19 @@
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
 What:		/sys/kernel/kexec_loaded
 Date:		Jun 2006
 Contact:	kexec@lists.infradead.org
-- 
2.51.1


