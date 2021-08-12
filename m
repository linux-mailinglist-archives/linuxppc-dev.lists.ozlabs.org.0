Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A63EA061
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 10:14:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlfcP1ZmMz30M6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 18:14:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KMHoV3mq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KMHoV3mq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Glfbg0ZYVz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 18:14:06 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17C84r6h082759; Thu, 12 Aug 2021 04:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Tz0f+lhwc9CETN7Mri9PBdLHToiK3HWAIajWtkM0Gow=;
 b=KMHoV3mqcouCBnV42bh9yVYAJ3h3LgOulM7fvGECcaGgCMpiliri3tMKD3Yk6kn0ZFsA
 i23oW1y/c9CGkbgLf68xPMQiRBwhobnN9qe+a3oUZ9EydwvVvlkhLO9+WPY4NgxNda2h
 H0hZVeULaNYDhuzpx93Oox3I6181wAdTbgiRnRiMTKNSZ16Zj6nKTlbGnrlslVwTNlxj
 bshwLQfxwLlLfUJ1B3s+DGGknz6ZUpfjMfL4QGr/AcnSId15OndSDbOaSZ2ys4H3HQ2V
 UEEMU7diB2t20I3XMcvkgztFiaOQoV3TqCXhWptWxkwpXEt+PxYRqEkrbL95jI7S/8rO Gg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3acstnh25b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 04:13:52 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17C8DX19006105;
 Thu, 12 Aug 2021 08:13:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3a9ht91bst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 08:13:49 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17C8Dlcf53477680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 08:13:47 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6250C4C05E;
 Thu, 12 Aug 2021 08:13:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E0A04C04A;
 Thu, 12 Aug 2021 08:13:46 +0000 (GMT)
Received: from [9.199.50.186] (unknown [9.199.50.186])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Aug 2021 08:13:46 +0000 (GMT)
Subject: Re: [PATCH] powerpc/book3s64/radix: make
 tlb_single_page_flush_ceiling a debugfs entry
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210810045307.11892-1-aneesh.kumar@linux.ibm.com>
 <22c7c194-d75d-bf90-c8e5-83c995c7130c@csgroup.eu>
 <87o8a3m89i.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <bb3855e1-f15d-1df6-5699-9addc69ce1db@linux.ibm.com>
Date: Thu, 12 Aug 2021 13:43:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87o8a3m89i.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pz83zyyiBNDIX35vDw5Md8QShcc9rnm_
X-Proofpoint-ORIG-GUID: Pz83zyyiBNDIX35vDw5Md8QShcc9rnm_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-12_02:2021-08-11,
 2021-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120053
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/12/21 12:58 PM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 10/08/2021 à 06:53, Aneesh Kumar K.V a écrit :
>>> Similar to x86/s390 add a debugfs file to tune tlb_single_page_flush_ceiling.
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>    arch/powerpc/mm/book3s64/radix_tlb.c | 48 ++++++++++++++++++++++++++++
>>>    1 file changed, 48 insertions(+)
>>>
>>> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
>>> index aefc100d79a7..5cca0fe130e7 100644
>>> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
>>> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
>>> @@ -17,6 +17,7 @@
> ...
>>> +
>>> +static int __init create_tlb_single_page_flush_ceiling(void)
>>> +{
>>> +	debugfs_create_file("tlb_single_page_flush_ceiling", S_IRUSR | S_IWUSR,
>>> +			    powerpc_debugfs_root, NULL, &fops_tlbflush);
>>
>> Could you just use debugfs_create_u32() instead of re-implementing simple read and write ?
> 
> Yeah AFAICS that should work fine.
> 
> It could probably even be a u16?
> 

I was looking at switching all that to u64. Should i fallback to u16, 
considering a tlb_signle_page_flush_ceiling value larger that 2**16 
doesn't make sense?

-aneesh

