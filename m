Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53E764FDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 11:33:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EWO8BEGu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBQYW1bK8z3cR4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 19:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EWO8BEGu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBQXc6BsBz3bch
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 19:32:32 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R9DsDc013580;
	Thu, 27 Jul 2023 09:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DjTokeIRr5Zr8YctEQ0ezEcbh9foSdA76GVK4ttK+7k=;
 b=EWO8BEGugv/jBO5l4WSeGlqsJ45C+QkQjpmdMlzSo7cMIPaqMH9WNpmU4yPBsG4OAdHA
 +/TL3jZO7efOxKsV+JUkFl6ssQya/8gFfNHXrmiMNWrc+eVO9qeObeRAIMvMcRc2DX/l
 69vB5FzkljbHF7zVjPo7NRMJoUJ4tENRFBfkfflKPdVAddZW7oxJLY2/Wp+Hih7nrYrw
 N3NdhmhhxxAyy9LtwQNAu4/gLaElQphVZ+Ak3Wd1lWmlZ/SETrkS/pyk+f0GtPoyFQWc
 KquR/YPBa4zw7yT2bNCaRYQ9yDXK+kzCgGsEsbzW4gnGCj67Mk+YzPUJsq6g3BAOibO0 sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3nrvge1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 09:32:18 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36R9UI5H004440;
	Thu, 27 Jul 2023 09:32:18 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3nrvge13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 09:32:18 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36R7IW26026200;
	Thu, 27 Jul 2023 09:32:17 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0sesctxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 09:32:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36R9WF1a62128530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jul 2023 09:32:15 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F74120043;
	Thu, 27 Jul 2023 09:32:15 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05A9920040;
	Thu, 27 Jul 2023 09:32:13 +0000 (GMT)
Received: from [9.109.212.144] (unknown [9.109.212.144])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jul 2023 09:32:12 +0000 (GMT)
Message-ID: <b8068200-c692-79fc-3413-8dc05619e228@linux.ibm.com>
Date: Thu, 27 Jul 2023 15:02:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 6/7] mm/memory_hotplug: Embed vmem_altmap details in
 memory block
Content-Language: en-US
To: Michal Hocko <mhocko@suse.com>
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
 <20230727080232.667439-7-aneesh.kumar@linux.ibm.com>
 <ZMI39umu4DZbQ8Iw@dhcp22.suse.cz>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <ZMI39umu4DZbQ8Iw@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5hgY73Y9pLJvLSEUAeMqqKIJvs5h6T4V
X-Proofpoint-GUID: EEuUSfVWop7y4i3TO-yHBuMi6XhEFU8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=830 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270080
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

On 7/27/23 2:55 PM, Michal Hocko wrote:
> On Thu 27-07-23 13:32:31, Aneesh Kumar K.V wrote:
>> With memmap on memory, some architecture needs more details w.r.t altmap
>> such as base_pfn, end_pfn, etc to unmap vmemmap memory. Instead of
>> computing them again when we remove a memory block, embed vmem_altmap
>> details in struct memory_block if we are using memmap on memory block
>> feature.
>>
>> No functional change in this patch
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  drivers/base/memory.c  | 25 +++++++++++-------
>>  include/linux/memory.h |  8 ++----
>>  mm/memory_hotplug.c    | 58 +++++++++++++++++++++++++++---------------
>>  3 files changed, 55 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>> index b456ac213610..57ed61212277 100644
>> --- a/drivers/base/memory.c
>> +++ b/drivers/base/memory.c
>> @@ -106,6 +106,7 @@ static void memory_block_release(struct device *dev)
>>  {
>>  	struct memory_block *mem = to_memory_block(dev);
>>  
>> +	WARN_ON(mem->altmap);
> 
> What is this supposed to catch? A comment would be handy so that we know
> what to look at should it ever trigger.
> 

I did add a comment where we clear the altmap in try_remove_memory(). I will also add
more details here.

+			 * Mark altmap NULL so that we can add a debug
+			 * check on memblock free.
 			 */

WARN_ON is an indication of memory leak because if we have mem->altmap != NULL
then the allocated altmap is not freed . It also indicate that memblock got freed
without going through the try_remove_memory(). 

>>  	kfree(mem);
>>  }


=aneesh
