Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E4F7408C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 05:02:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=obsBC9q2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrRGS0g6bz30GJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 13:02:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=obsBC9q2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrRFW4d0yz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 13:02:07 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35S2lY7q031019;
	Wed, 28 Jun 2023 03:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wvqgE6t+NcWFSXTcKQuUFx+7achVimLTTzLAxvns4SY=;
 b=obsBC9q2s0UcFqMcYbqV1rO/Nq+4tuYm9YQv6LUWCQYzFuR6Uu8wqjDHr63uqERQ49mk
 DnHXYe4SfntFJzjuQ++K037f39w2RS5skLae0+oCyk5L6K0twSEgX9jAJqH7yMdgN+5u
 GSf3jrjgkT3eNSCLVoIKyv5ztOQosPDViyxZMMz2wiCrgfUMVD9+X/+6hXSm54GNzCLr
 UfHQmRS2n+G5m2p48aNugqHhBvykFWRA36u4liJ3QU7mzGPKAWnhSzciJaIL14efkCwj
 /StnrUq6E+KHK0jA9c8mBBgPJrJJ30mVdrKmi1z5Zi73vVXt1YaPPVV3inXd91elcC3k QA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rgccsr7y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 03:01:37 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35S2qgAo012502;
	Wed, 28 Jun 2023 03:01:36 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rgccsr7tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 03:01:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35RNQe1i003383;
	Wed, 28 Jun 2023 03:01:21 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rdr4529yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 03:01:21 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35S31JkF45220528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jun 2023 03:01:19 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4F8520040;
	Wed, 28 Jun 2023 03:01:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13D1820043;
	Wed, 28 Jun 2023 03:01:16 +0000 (GMT)
Received: from [9.43.54.216] (unknown [9.43.54.216])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Jun 2023 03:01:15 +0000 (GMT)
Message-ID: <677132e9-6c99-4d55-1eea-15555dc10c2f@linux.ibm.com>
Date: Wed, 28 Jun 2023 08:31:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 12/16] mm/vmemmap optimization: Split hugetlb and
 devdax vmemmap optimization
Content-Language: en-US
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <87wmzoo0j9.fsf@doe.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <87wmzoo0j9.fsf@doe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2CxgRxFpsVPyvHbVioSz92R_xZclGdeg
X-Proofpoint-ORIG-GUID: xwPkfiBs1NUrWg9D8z9n2Ht4XZOquBrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_16,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280027
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/28/23 6:39 AM, Ritesh Harjani (IBM) wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> 
>> Arm disabled hugetlb vmemmap optimization [1] because hugetlb vmemmap
>> optimization includes an update of both the permissions (writeable to
>> read-only) and the output address (pfn) of the vmemmap ptes. That is not
>> supported without unmapping of pte(marking it invalid) by some
>> architectures.
>>
>> With DAX vmemmap optimization we don't require such pte updates and
>> architectures can enable DAX vmemmap optimization while having hugetlb
>> vmemmap optimization disabled. Hence split DAX optimization support into a
>> different config.
>>
>> loongarch and riscv don't have devdax support. So the DAX config is not
>> enabled for them. With this change, arm64 should be able to select DAX
>> optimization
>>
>> [1] commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable HUGETLB_PAGE_OPTIMIZE_VMEMMAP")
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/loongarch/Kconfig | 2 +-
>>  arch/riscv/Kconfig     | 2 +-
>>  arch/x86/Kconfig       | 3 ++-
>>  fs/Kconfig             | 2 +-
>>  include/linux/mm.h     | 2 +-
>>  mm/Kconfig             | 5 ++++-
>>  6 files changed, 10 insertions(+), 6 deletions(-)
> 
> what about s390?
> 
> git grep "ARCH_WANT_OPTIMIZE_VMEMMAP" .
> arch/s390/Kconfig:      select ARCH_WANT_OPTIMIZE_VMEMMAP
> 

Thanks for catching that. Updated

-aneesh

