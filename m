Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFBC761048
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 12:09:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=shP7B5uj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9CSB6DTCz3ckl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:09:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=shP7B5uj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9CMd5sRJz3dBl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 20:05:33 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PA4sBX021896;
	Tue, 25 Jul 2023 10:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D6w7Lot4e8BcNeMjCVSUtPdDiB71BA0lpgavvF7b3RE=;
 b=shP7B5ujmWDO+U2BiS7P6H6gPz3mHhqA/ZfnNIRxek6l4gFdg2c1xroGKxcOYXVouvAt
 Fwap1KMxUVYk6S9pl55JMEvAiq+/TfMSP4mVuvJQ+kia2geGq3yi4vb+T3wUFamBRcXT
 xkNKnxQQAImeVfA8Dn/KX6CQ/WKW+STHxGeJayR3yQIZELAFmYU7THD39vHI1tMJFHZ+
 wCyrREvaO16QWnn+HK5ojqMfJ6n9UiSPsnfbZaTRd7Lc84CjYkTrFcdX6oqtUl/9r4hs
 /Ni5aHvTK51QkdJPWxJWL/Cu4T/S4ulUag86sXXaPSEUKK9QxO90RqACddWF0kxu/WAZ 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s255jsdxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:05:21 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36PA5KkD024411;
	Tue, 25 Jul 2023 10:05:20 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s255jsdqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:05:16 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36P9hPjv002281;
	Tue, 25 Jul 2023 10:02:35 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0unjam2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:02:35 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36PA2YEJ21889350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jul 2023 10:02:35 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8AAC58060;
	Tue, 25 Jul 2023 10:02:34 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F08BA5805C;
	Tue, 25 Jul 2023 10:02:30 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Jul 2023 10:02:30 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 3/7] mm/hotplug: Allow architecture to override memmap on memory support check
Date: Tue, 25 Jul 2023 15:32:08 +0530
Message-ID: <20230725100212.531277-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wa5YJNwiOKhzS4Z2on0AOQ9xoLeTsKUK
X-Proofpoint-ORIG-GUID: HOPEk8GXVZCohyAsTaTDWTuv_qE2mfns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_04,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307250087
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures would want different restrictions. Hence add an
architecture-specific override.

The PMD_SIZE check is moved there.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/memory_hotplug.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index eca32ccd45cc..457824a6ecb8 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1247,9 +1247,24 @@ static int online_memory_block(struct memory_block *mem, void *arg)
 	return device_online(&mem->dev);
 }
 
+#ifndef arch_supports_memmap_on_memory
+static inline bool arch_supports_memmap_on_memory(unsigned long size)
+{
+	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
+	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
+
+	/*
+	 * As default, we want the vmemmap to span a complete PMD such that we
+	 * can map the vmemmap using a single PMD if supported by the
+	 * architecture.
+	 */
+	return IS_ALIGNED(vmemmap_size, PMD_SIZE);
+}
+#endif
+
 static bool mhp_supports_memmap_on_memory(unsigned long size)
 {
-	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
+	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
 	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
 	unsigned long remaining_size = size - vmemmap_size;
 
@@ -1281,8 +1296,8 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
 	 */
 	return mhp_memmap_on_memory() &&
 	       size == memory_block_size_bytes() &&
-	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
-	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
+	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)) &&
+	       arch_supports_memmap_on_memory(size);
 }
 
 /*
-- 
2.41.0

