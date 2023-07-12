Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACA7750A04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 15:51:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zu9LAOZj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1K0R2bbcz3cN2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 23:51:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zu9LAOZj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1JzN68PJz3cD1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 23:50:40 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CDlqbx018837;
	Wed, 12 Jul 2023 13:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=jfUnXQjFDiAT2+OsefhLGqBTdHxKFrPm+Ydmt09me38=;
 b=Zu9LAOZjLg4N03vAxLBLe2ooORZR/X/4OEcjhTfKaa/hrTq4BCM981Hu8aTf7QxaGM8z
 mw2wHGCOIuLiN34YjRXKjlWYkzO8HmZfgfTcDq/aMgx8xRigo37H6E/BVjX+5wKzyzc5
 4q3KhBMbOBoB5x2r531UeSXaZQ0hu7zC0LqtHi5g+zIfeoU0dBRCN1X6HOmqNVAgp7ZK
 yMZzGcmUCqv6QjKpLiUIVKRjXNLsMdbPYbgzdKBHq5bBQMuOcCNExH+TVE3SsXCBQZRd
 9QO1jdDcRB5Y+qu7aWCoYJq57c626bCRrOO3u3bOE2zmkrUmD5WvLs6feKJHpt8rqDyf DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rswc6r1q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jul 2023 13:50:25 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36CDlquM018852;
	Wed, 12 Jul 2023 13:50:24 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rswc6r1pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jul 2023 13:50:24 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36CB2Njr005235;
	Wed, 12 Jul 2023 13:50:23 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3rpye6eup7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jul 2023 13:50:23 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36CDoMxl57737488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 13:50:22 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 300ED5804B;
	Wed, 12 Jul 2023 13:50:22 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AED155805B;
	Wed, 12 Jul 2023 13:50:17 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.19.28])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Jul 2023 13:50:17 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: Re: [PATCH v3 4/7] mm/hotplug: Allow pageblock alignment via altmap
 reservation
In-Reply-To: <57dd0568-ee56-ff8d-3ba3-a9089a2ab386@redhat.com>
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-5-aneesh.kumar@linux.ibm.com>
 <b44ce7ab-7fcf-3f1b-4bca-3d5d12838812@redhat.com>
 <ccda3be5-1e44-145e-7b46-2e420935b1d6@linux.ibm.com>
 <57dd0568-ee56-ff8d-3ba3-a9089a2ab386@redhat.com>
Date: Wed, 12 Jul 2023 19:20:14 +0530
Message-ID: <87wmz56xyh.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ijQmLLJPE_Y4O2g7aLj7U1jR6teFhqWc
X-Proofpoint-ORIG-GUID: 5zOgomSzcCcXAUbd4IJieMmJJQh8Qy6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_08,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120122
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

> On 12.07.23 05:16, Aneesh Kumar K V wrote:
>> On 7/11/23 10:49 PM, David Hildenbrand wrote:
>>> On 11.07.23 06:48, Aneesh Kumar K.V wrote:
>>>> Add a new kconfig option that can be selected if we want to allow
>>>> pageblock alignment by reserving pages in the vmemmap altmap area.
>>>> This implies we will be reserving some pages for every memoryblock
>>>> This also allows the memmap on memory feature to be widely useful
>>>> with different memory block size values.
>>>
>>> "reserving pages" is a nice way of saying "wasting memory". :) Let's spell that out.
>>>
>>> I think we have to find a better name for this, and I think we should have a toggle similar to memory_hotplug.memmap_on_memory. This should be an admin decision, not some kernel config option.
>>>
>>>
>>> memory_hotplug.force_memmap_on_memory
>>>
>>> "Enable the memmap on memory feature even if it could result in memory waste due to memmap size limitations. For example, if the memmap for a memory block requires 1 MiB, but the pageblock size is 2 MiB, 1 MiB
>>> of hotplugged memory will be wasted. Note that there are still cases where the feature cannot be enforced: for example, if the memmap is smaller than a single page, or if the architecture does not support the forced mode in all configurations."
>>>
>>> Thoughts?
>>>
>> 
>> With module parameter, do we still need the Kconfig option?
>
> No.
>
> Sleeping over this, maybe we can convert the existing 
> memory_hotplug.memmap_on_memory parameter to also accept "force".
>

How about this? 

modified   mm/memory_hotplug.c
@@ -45,13 +45,67 @@
 /*
  * memory_hotplug.memmap_on_memory parameter
  */
-static bool memmap_on_memory __ro_after_init;
-module_param(memmap_on_memory, bool, 0444);
-MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug");
+enum {
+	MEMMAP_ON_MEMORY_DISABLE = 0,
+	MEMMAP_ON_MEMORY_ENABLE,
+	FORCE_MEMMAP_ON_MEMORY,
+};
+static int memmap_mode __read_mostly = MEMMAP_ON_MEMORY_DISABLE;
+static const char *memmap_on_memory_to_str[] = {
+	[MEMMAP_ON_MEMORY_DISABLE]  = "disable",
+	[MEMMAP_ON_MEMORY_ENABLE]   = "enable",
+	[FORCE_MEMMAP_ON_MEMORY]    = "force",
+};
+
+static inline unsigned long memory_block_align_base(unsigned long size)
+{
+	if (memmap_mode == FORCE_MEMMAP_ON_MEMORY) {
+		unsigned long align;
+		unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
+		unsigned long vmemmap_size;
+
+		vmemmap_size = DIV_ROUND_UP(nr_vmemmap_pages * sizeof(struct page), PAGE_SIZE);
+		align = pageblock_align(vmemmap_size) - vmemmap_size;
+		return align;
+	} else
+		return 0;
+}
+
+static int set_memmap_mode(const char *val, const struct kernel_param *kp)
+{
+	int ret = sysfs_match_string(memmap_on_memory_to_str, val);
+
+	if (ret < 0)
+		return ret;
+	*((int *)kp->arg) = ret;
+	if (ret == FORCE_MEMMAP_ON_MEMORY) {
+		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
+			memory_block_align_base(memory_block_size_bytes()));
+	}
+	return 0;
+}
+
+static int get_memmap_mode(char *buffer, const struct kernel_param *kp)
+{
+	return sprintf(buffer, "%s\n", memmap_on_memory_to_str[*((int *)kp->arg)]);
+}
+
+static const struct kernel_param_ops memmap_mode_ops = {
+	.set = set_memmap_mode,
+	.get = get_memmap_mode,
+};
+module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0644);
+MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
+	"With value \"force\" it could result in memory waste due to memmap size limitations \n"
+	"For example, if the memmap for a memory block requires 1 MiB, but the pageblock \n"
+	"size is 2 MiB, 1 MiB of hotplugged memory will be wasted. Note that there are \n"
+	"still cases where the feature cannot be enforced: for example, if the memmap is \n"
+	"smaller than a single page, or if the architecture does not support the forced \n"
+	"mode in all configurations. (disable/enable/force)");
 
 static inline bool mhp_memmap_on_memory(void)
 {
-	return memmap_on_memory;
+	return !!memmap_mode;
 }
 #else

We can also enable runtime enable/disable/force the feature. We just
need to make sure on try_remove_memory we lookup for altmap correctly. 
