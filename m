Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 325C7764FB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 11:28:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wtjt8nrF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBQRq0lnSz3cM5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 19:28:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wtjt8nrF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBQQy1qs7z3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 19:27:38 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R9FDoC013208;
	Thu, 27 Jul 2023 09:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ov8GaOrZpmzA0j8SS/4mOwN8qvFCeLXW0O/KbsJbAj0=;
 b=Wtjt8nrFw1RdZc+7ULkrDC08OKVTHTOwcNg9/uuh1mO1emCwkmaCN8J/nbt6I1Q6rvr9
 N6jOnXvbw1Fqoxo2GOdIJNyLSvPb4l0j+vBciYXbjRY5XuoAYGJrj9wH2p9pMpCDt2Eu
 HmteaR/cYdCbxaJygPQk9c7+f0hSVXPYbriYNWH7U6Xc7n3fd9RfzW0W6knR1djoHPB0
 IVbua8Aq24uTFds1frBLxLo6Ppa9N/HmR/jKzmVJCuvbMnvn6CycOQ0jCdHo1F2Sq1zW
 MPVye7x3YnpjPFknw6eKCGehxL1jKyizFVHTabn0lGVMouCzmm8n8elR2t0TM0P/ncSd 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3n511s9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 09:27:24 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36R8hf6l028352;
	Thu, 27 Jul 2023 09:27:24 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3n511s9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 09:27:24 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36R8tUFW003624;
	Thu, 27 Jul 2023 09:27:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txkc63t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 09:27:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36R9RKD329229392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jul 2023 09:27:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A671920043;
	Thu, 27 Jul 2023 09:27:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E44E420040;
	Thu, 27 Jul 2023 09:27:18 +0000 (GMT)
Received: from [9.109.212.144] (unknown [9.109.212.144])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jul 2023 09:27:18 +0000 (GMT)
Message-ID: <f977e09b-6a09-901f-96c3-e59cd0b3470c@linux.ibm.com>
Date: Thu, 27 Jul 2023 14:57:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 4/7] mm/memory_hotplug: Support memmap_on_memory when
 memmap is not aligned to pageblocks
Content-Language: en-US
To: Michal Hocko <mhocko@suse.com>
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
 <20230727080232.667439-5-aneesh.kumar@linux.ibm.com>
 <ZMI3o8k/+QKbhRol@dhcp22.suse.cz>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <ZMI3o8k/+QKbhRol@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PghE2kCZ43h9QzfydF3yWECW_GUuqV2n
X-Proofpoint-GUID: pocW8nM03ogqsf8EAWzXhi7T7PMhsVxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 spamscore=0 mlxlogscore=489 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

On 7/27/23 2:53 PM, Michal Hocko wrote:
> On Thu 27-07-23 13:32:29, Aneesh Kumar K.V wrote:
> [...]
>> +	if (mode == MEMMAP_ON_MEMORY_FORCE) {
>> +		unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
>> +
>> +		pr_info_once("Memory hotplug will reserve %ld pages in each memory block\n",
>> +			     memmap_pages - PFN_UP(memory_block_memmap_size()));
>> +	}
>> +	return 0;
>> +}
> 
> Why should we print this only for the forced case? Isn't that
> interesting for any on memory memmap? Also is this the above sufficient
> on its own? the size depends on the block size and that can vary.
> I think it would make more sense to print the block size and the vmemmap
> reservation and for the force case also any wasted amount on top (if
> any).
> 

For the other cases the space is completely used by for struct page allocation. What
the information is indicating here is that for each memblock we add we are loosing/wasting so many pages. 
May be I should have used the term "waste" instead of "reserve" ?

-aneesh
