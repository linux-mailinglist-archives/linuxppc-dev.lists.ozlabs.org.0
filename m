Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8976C43D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 06:46:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XVMdq8T6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFzvV30Jnz3c1y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 14:46:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XVMdq8T6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFztb5tslz2yGB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 14:45:27 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3724cQsE030013;
	Wed, 2 Aug 2023 04:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=i9NN+IMaVHS2ICmf6ro2iorAbo7KSqOZ4HRb1rKzbF8=;
 b=XVMdq8T6xYSC5cXH47IVBSO6AvRjllMIPM0zjsuLnHXjuV+DBUqoXxZLDTc3EcAgQLsR
 Mz/+j+/YNQG3KPHkKEfui4G9mHJ4ymXg2C4LwmXpwyBk4R0n1lvAVRWxGvJkBhRZa/fs
 ImIkgbabIt0YXvLOWSivHtIIlp9NiVMvSjRFaCqIYr2ZlIv271NktGkc9yEReRHgGDkb
 BWMz83r9d+5bbnISrdsul/Lut88O4Q+ZXe+Ra42YD77sjrK+kSMfGufWyWddVWg8TSJO
 w9UcXoFqhhOaEpVe4GbNWIdhancPk96nk51Vbp81lbO2X2qkkHQ8Ir9UcGRt/JzVdsab 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7fra0unb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 04:45:10 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3724csOb030687;
	Wed, 2 Aug 2023 04:45:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7fra0umh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 04:45:10 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3722qOnM006153;
	Wed, 2 Aug 2023 04:45:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5d3sj3sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 04:45:09 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3724j7lo22151772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Aug 2023 04:45:07 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 680B920040;
	Wed,  2 Aug 2023 04:45:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0220420043;
	Wed,  2 Aug 2023 04:45:05 +0000 (GMT)
Received: from [9.43.11.83] (unknown [9.43.11.83])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Aug 2023 04:45:04 +0000 (GMT)
Message-ID: <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
Date: Wed, 2 Aug 2023 10:15:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
Content-Language: en-US
To: Michal Hocko <mhocko@suse.com>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
 <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
 <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
 <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jslBqxdDI7wmB3ZJihTBu6JRQBsdy0QX
X-Proofpoint-GUID: kJsFRem3iVPTakEyEESkRhSt632uUhqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_02,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 mlxlogscore=729
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020040
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
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/1/23 4:20 PM, Michal Hocko wrote:
> On Tue 01-08-23 14:58:29, Aneesh Kumar K V wrote:
>> On 8/1/23 2:28 PM, Michal Hocko wrote:
>>> On Tue 01-08-23 10:11:16, Aneesh Kumar K.V wrote:
>>>> Allow updating memmap_on_memory mode after the kernel boot. Memory
>>>> hotplug done after the mode update will use the new mmemap_on_memory
>>>> value.
>>>
>>> Well, this is a user space kABI extension and as such you should spend
>>> more words about the usecase. Why we could live with this static and now
>>> need dynamic?
>>>
>>
>> This enables easy testing of memmap_on_memory feature without a kernel reboot.
> 
> Testing alone is rather weak argument to be honest.
> 
>> I also expect people wanting to use that when they find dax kmem memory online
>> failing because of struct page allocation failures[1]. User could reboot back with
>> memmap_on_memory=y kernel parameter. But being able to enable it via sysfs makes
>> the feature much more useful.
> 
> Sure it can be useful but that holds for any feature, right. The main
> question is whether this is worth maintaing. The current implementation
> seems rather trivial which is an argument to have it but are there any
> risks long term? Have you evaluated a potential long term maintenance
> cost? There is no easy way to go back and disable it later on without
> breaking some userspace.
> 
> All that should be in the changelog!

I updated it as below. 

mm/memory_hotplug: Enable runtime update of memmap_on_memory parameter

Allow updating memmap_on_memory mode after the kernel boot. Memory
hotplug done after the mode update will use the new mmemap_on_memory
value.

It is now possible to test the memmap_on_memory feature easily without
the need for a kernel reboot. Additionally, for those encountering
struct page allocation failures while using dax kmem memory online, this
feature may prove useful. Instead of rebooting with the
memmap_on_memory=y kernel parameter, users can now enable it via sysfs,
which greatly enhances its usefulness. Making the necessary changes to
support runtime updates is a simple change that should not affect the
addition of new features or result in long-term maintenance problems.


