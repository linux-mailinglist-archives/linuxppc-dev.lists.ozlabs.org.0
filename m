Return-Path: <linuxppc-dev+bounces-13985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3795CC44E95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 05:32:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4cGH1v3wz2xqj;
	Mon, 10 Nov 2025 15:32:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762749159;
	cv=none; b=CMlIGfqUt1kCPSAqc33SAvEb/SbUdLahRzTa0Al4j8FFWWJ5G9/1RcIqfe3ij1FyiZi0wqHYYP7cyVAPTzMID7VaPHEfjB5Dt4qKCDzmqnVsHAMQykkWMrA+yIxNMSvgs+MlN4CHGMpu4U7wiNMKeZKADdV1lkumEkrT9fww+CW7+aHtpIQaLtSeSG0flqJ82f8xn3AYx2Frm0VDOQC8hfqhnuwpb8VrE3q1ZUgxHfBmhZC6OjDNfN+CWOuITYCaZk8ru21HmbBYeOhIjaslnDam317cbR4oeXkFkyAYUfrzDTQYYuXkcY4+6Ps3NFuEDs9KdTWUvdxvs0XhF98wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762749159; c=relaxed/relaxed;
	bh=Y843UHAo4TTYfhg3gY3eOgCT9p62bFpqECVsQxpKWAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtnyAobOLrAaUnJAEhISvQeJjPDSxAEMpK3SPqfRl4iUS0YlCeHYdTRKjauSmQsKZo8J9S0OlXdWDAe4Nov52cRh0YGHYIGdnQ7Iq5/6ySGcK+HaXFardYMyAkPcu44QGx3RNcnTrI38650HiPKupjsh+9OVyoPHIUGAQt56WtaaBTsEoKH9GH96kNzYFaCKmGxQoC+S6CeUh5T8woe4XkGRsczn1tn/1k0UAXK2k/R8v90/hB0YYRDjelSODDSZyN1FgiF5XdeJqiBwZM1O3kq6sVC8RmcU373tjIj5Orh4vmocHtiqH9VmAgm+EKERoTqQstH7YuNiTJMdasRWAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ll1yWM1S; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ll1yWM1S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4cGG46F2z2xqM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 15:32:38 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9NMBbL030964;
	Mon, 10 Nov 2025 04:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Y843UHAo4TTYfhg3g
	Y3eOgCT9p62bFpqECVsQxpKWAQ=; b=ll1yWM1SY774DrdGf5bitP3pDP9w186+y
	HDJLiJhbuf7O0jdSyi/i2p7t2bOpNO7KHeCIvWdC/ALpuZKnTE7g4LcZQXkdxrYj
	sI0W4Rv2LTu4nrespmHEl3DdTR0fl55ryR5To/k4tUFg1Wn998XwXTJan+fPIaVx
	lZ9gWo3PPc1TUyx3MOTDHuATSp8RsbG2mFR307bBibKYji8yjGl0tLl61yKZTfJW
	aR3ugIc4Jr9OgsoAIMrO5XWtpxmgpxw1Eadul/H/NKljCK5NThCiffso4FLwO3qH
	ZGHlnE7kT8Z12orfb3fuu0bVIW7F/GqX2+JXAnp6VVvEP9fyehQ3w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5chw70p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:20 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AA4U43a026875;
	Mon, 10 Nov 2025 04:32:20 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5chw70j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9NJMCl014841;
	Mon, 10 Nov 2025 04:32:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aahpjut9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 04:32:18 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AA4WF4j61342196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 04:32:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1ABBD20049;
	Mon, 10 Nov 2025 04:32:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4602020040;
	Mon, 10 Nov 2025 04:32:11 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Nov 2025 04:32:11 +0000 (GMT)
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
Subject: [PATCH v3 5/5] crash: export crashkernel CMA reservation to userspace
Date: Mon, 10 Nov 2025 10:01:43 +0530
Message-ID: <20251110043143.484408-6-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Ss+dKfO0 c=1 sm=1 tr=0 ts=69116ad4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=xHySkhmCpRGYbmLIrh4A:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5NSBTYWx0ZWRfXxviF4FCwEarM
 yc1LY5Tu8GcyGsCVpQaqoUaZAVbe4a3a0MfS/jZRPM0K4YerWDDjCrxZ4u0MEKp6nA6nkAO5A4J
 0J4ekljfk6jQ+VrV2IzSp05iLz3TeDqgE1uf3pkuQ3RnxOOPUbizgkJUo60HIy9FqO4pgCXNSRw
 tIJluGlaYzKM/qSOzRobVB8RJr/wPyA/ujXuR2vAJJCZ/f2I9ZV1VXv/dk7raSfM7tMHiY3Jbd4
 TqGPQHr1oSH0uWp25QV5Gi9XFyJghieKKyMQbLXLn3a5iA79D0sNPj9Ut+ywciTf+5l6Sm7ynwe
 fdbBX86+jBjWirf8NHYvHO8QLk6dtl9VQGVbu82ztCSBJ/4jXc/xoHrIAZzrovnfTkj1UfK2bZ5
 BPbpCkDTHwpaZ1SHaWNhIbT+X5yJFw==
X-Proofpoint-GUID: auHh23VC4ON0syCQXH9zdfVE6uPG1e4W
X-Proofpoint-ORIG-GUID: YOWHrtq7ZAwkVSY61seUoCGRKrnTKQYS
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

Add a sysfs entry /sys/kernel/kexec/crash_cma_ranges to expose all
CMA crashkernel ranges.

This allows userspace tools configuring kdump to determine how much
memory is reserved for crashkernel. If CMA is used, tools can warn
users when attempting to capture user pages with CMA reservation.

The new sysfs hold the CMA ranges in below format:

cat /sys/kernel/kexec/crash_cma_ranges
100000000-10c7fffff

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
Changelog:
 - Add the missing hunk to export crash_cma_ranges sysfs

---
 .../ABI/testing/sysfs-kernel-kexec-kdump        | 10 ++++++++++
 kernel/kexec_core.c                             | 17 +++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index 00c00f380fea..f59051b5d96d 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -49,3 +49,13 @@ Description:	read only
 		is used by the user space utility kexec to support updating the
 		in-kernel kdump image during hotplug operations.
 User:		Kexec tools
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
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 7476a46de5d6..da6ff72b4669 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -1271,6 +1271,22 @@ static ssize_t crash_size_store(struct kobject *kobj,
 }
 static struct kobj_attribute crash_size_attr = __ATTR_RW(crash_size);
 
+static ssize_t crash_cma_ranges_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+
+	ssize_t len = 0;
+	int i;
+
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
+				     crashk_cma_ranges[i].start,
+				     crashk_cma_ranges[i].end);
+	}
+	return len;
+}
+static struct kobj_attribute crash_cma_ranges_attr = __ATTR_RO(crash_cma_ranges);
+
 #ifdef CONFIG_CRASH_HOTPLUG
 static ssize_t crash_elfcorehdr_size_show(struct kobject *kobj,
 			       struct kobj_attribute *attr, char *buf)
@@ -1289,6 +1305,7 @@ static struct attribute *kexec_attrs[] = {
 #ifdef CONFIG_CRASH_DUMP
 	&crash_loaded_attr.attr,
 	&crash_size_attr.attr,
+	&crash_cma_ranges_attr.attr,
 #ifdef CONFIG_CRASH_HOTPLUG
 	&crash_elfcorehdr_size_attr.attr,
 #endif
-- 
2.51.1


