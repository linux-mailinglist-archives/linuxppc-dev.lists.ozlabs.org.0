Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6B8B1BFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 13:11:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VCdN6r6HzF5Nt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 21:11:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VCb860FdzF3mY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 21:09:56 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8DB90Na160601
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 07:09:50 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v09w1g8mg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 07:09:50 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Fri, 13 Sep 2019 12:09:48 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Sep 2019 12:09:44 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8DB9hGG46399596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 11:09:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D65FA4054;
 Fri, 13 Sep 2019 11:09:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6658A4062;
 Fri, 13 Sep 2019 11:09:42 +0000 (GMT)
Received: from pomme.local (unknown [9.145.117.92])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Sep 2019 11:09:42 +0000 (GMT)
Subject: Re: [PATCH 0/3] powerpc/mm: Conditionally call H_BLOCK_REMOVE
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com
References: <20190830120712.22971-1-ldufour@linux.ibm.com>
 <1c499131-36f2-9d89-ed4c-5cb59a08398d@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Date: Fri, 13 Sep 2019 13:09:42 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1c499131-36f2-9d89-ed4c-5cb59a08398d@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091311-0028-0000-0000-0000039BCDFA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091311-0029-0000-0000-0000245E3CB4
Message-Id: <6d9ca38f-2b80-a2a5-491e-d818a3ebcd32@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130107
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 12/09/2019 à 15:44, Aneesh Kumar K.V a écrit :
> On 8/30/19 5:37 PM, Laurent Dufour wrote:
>> Since the commit ba2dd8a26baa ("powerpc/pseries/mm: call H_BLOCK_REMOVE"),
>> the call to H_BLOCK_REMOVE is always done if the feature is exhibited.
>>
>> On some system, the hypervisor may not support all the combination of
>> segment base page size and page size. When this happens the hcall is
>> returning H_PARAM, which is triggering a BUG_ON check leading to a panic.
>>
>> The PAPR document is specifying a TLB Block Invalidate Characteristics item
>> detailing which couple base page size, page size the hypervisor is
>> supporting through H_BLOCK_REMOVE. Furthermore, the characteristics are
>> also providing the size of the block the hcall could process.
>>
>> Supporting various block size seems not needed as all systems I was able to
>> play with was support an 8 addresses block size, which is the maximum
>> through the hcall. Supporting various size may complexify the algorithm in
>> call_block_remove() so unless this is required, this is not done.
>>
>> In the case of block size different from 8, a warning message is displayed
>> at boot time and that block size will be ignored checking for the
>> H_BLOCK_REMOVE support.
>>
>> Due to the minimal amount of hardware showing a limited set of
>> H_BLOCK_REMOVE supported page size, I don't think there is a need to push
>> this series to the stable mailing list.
>>
>> The first patch is initializing the penc values for each page size to an
>> invalid value to be able to detect those which have been initialized as 0
>> is a valid value.
>>
>> The second patch is reading the characteristic through the hcall
>> ibm,get-system-parameter and record the supported block size for each page
>> size.
>>
>> The third patch is changing the check used to detect the H_BLOCK_REMOVE
>> availability to take care of the base page size and page size couple.
>>
> 
> So ibm,segment-page-sizes indicates wether we support a combination of base 
> page size and actual page size. You are suggesting that the value reported 
> by that is not correct? Can you also share the early part of dmesg as below.

I'm not saying that the value reported by ibm,segment-page-sizes are 
incorrect, I'm saying that some couple are not supported by the hcall 
H_BLOCK_REMOVE.

May be should I change the second sentence by

On some system, the hypervisor may not support all the combination of 
segment base page size and page size for the hcall H_BLOCK_REMOVE. When 
this happens the hcall is returning H_PARAM, which is triggering a BUG_ON 
check leading to a panic.

Is that clear enough now ?

> 
> [    0.000000] hash-mmu: Page sizes from device-tree:
> [    0.000000] hash-mmu: base_shift=12: shift=12, sllp=0x0000, 
> avpnm=0x00000000, tlbiel=1, penc=0
> [    0.000000] hash-mmu: base_shift=12: shift=16, sllp=0x0000, 
> avpnm=0x00000000, tlbiel=1, penc=7
> [    0.000000] hash-mmu: base_shift=12: shift=24, sllp=0x0000, 
> avpnm=0x00000000, tlbiel=1, penc=56
> [    0.000000] hash-mmu: base_shift=16: shift=16, sllp=0x0110, 
> avpnm=0x00000000, tlbiel=1, penc=1
> [    0.000000] hash-mmu: base_shift=16: shift=24, sllp=0x0110, 
> avpnm=0x00000000, tlbiel=1, penc=8
> [    0.000000] hash-mmu: base_shift=24: shift=24, sllp=0x0100, 
> avpnm=0x00000001, tlbiel=0, penc=0
> [    0.000000] hash-mmu: base_shift=34: shift=34, sllp=0x0120, 
> avpnm=0x000007ff, tlbiel=0, penc=3
> 
> That shows different base page size and actual page size combination.
> 
> 
>> Laurent Dufour (3):
>>    powerpc/mm: Initialize the HPTE encoding values
>>    powperc/mm: read TLB Block Invalidate Characteristics
>>    powerpc/mm: call H_BLOCK_REMOVE when supported
>>
>>   arch/powerpc/include/asm/book3s/64/mmu.h |   3 +
>>   arch/powerpc/mm/book3s64/hash_utils.c    |   8 +-
>>   arch/powerpc/platforms/pseries/lpar.c    | 118 ++++++++++++++++++++++-
>>   3 files changed, 125 insertions(+), 4 deletions(-)
>>
> 
> 
> -aneesh

