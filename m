Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A992B1A85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 11:12:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46V8zh4LGPzF5Jp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 19:12:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46V8xd5bqJzF4Zr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 19:10:45 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8D97X8V040729
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 05:10:42 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v07es9qu4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 05:10:41 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Fri, 13 Sep 2019 10:10:39 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Sep 2019 10:10:36 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8D9AZWC58327128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 09:10:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C490A4060;
 Fri, 13 Sep 2019 09:10:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8282A405C;
 Fri, 13 Sep 2019 09:10:34 +0000 (GMT)
Received: from pomme.local (unknown [9.145.117.92])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Sep 2019 09:10:34 +0000 (GMT)
Subject: Re: [PATCH 2/3] powperc/mm: read TLB Block Invalidate Characteristics
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com
References: <20190830120712.22971-1-ldufour@linux.ibm.com>
 <20190830120712.22971-3-ldufour@linux.ibm.com> <87impxshfk.fsf@linux.ibm.com>
 <468a53a6-a970-5526-8035-eef59dcf48ed@linux.ibm.com>
 <97bafb53-6ae9-1d42-1816-ef81b845b80c@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Date: Fri, 13 Sep 2019 11:10:34 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <97bafb53-6ae9-1d42-1816-ef81b845b80c@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091309-0012-0000-0000-0000034ACACB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091309-0013-0000-0000-000021853A28
Message-Id: <76cd8c5e-0a7f-1aa0-0004-c7a874085ce1@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=879 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130088
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

Le 13/09/2019 à 04:00, Aneesh Kumar K.V a écrit :
> On 9/13/19 12:56 AM, Laurent Dufour wrote:
>> Le 12/09/2019 à 16:44, Aneesh Kumar K.V a écrit :
>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
> 
>>>> +
>>>> +    idx = 2;
>>>> +    while (idx < len) {
>>>> +        unsigned int block_size = local_buffer[idx++];
>>>> +        unsigned int npsize;
>>>> +
>>>> +        if (!block_size)
>>>> +            break;
>>>> +
>>>> +        block_size = 1 << block_size;
>>>> +        if (block_size != 8)
>>>> +            /* We only support 8 bytes size TLB invalidate buffer */
>>>> +            pr_warn("Unsupported H_BLOCK_REMOVE block size : %d\n",
>>>> +                block_size);
>>>
>>> Should we skip setting block size if we find block_size != 8? Also can
>>> we avoid doing that pr_warn in loop and only warn if we don't find
>>> block_size 8 in the invalidate characteristics array?
>>
>> My idea here is to fully read and process the data returned by the hcall, 
>> and to put the limitation to 8 when checking before calling H_BLOCK_REMOVE.
>> The warning is there because I want it to be displayed once at boot.
>>
> 
> 
> Can we have two block size reported for the same base page size/actual page 
> size combination? If so we will overwrite the hblk[actual_psize] ?

In check_lp_set_hblk() I'm only keeping the bigger one.

> 
>>>
>>>> +
>>>> +        for (npsize = local_buffer[idx++];  npsize > 0; npsize--)
>>>> +            check_lp_set_hblk((unsigned int) local_buffer[idx++],
>>>> +                      block_size);
>>>> +    }
>>>> +
>>>> +    for (bpsize = 0; bpsize < MMU_PAGE_COUNT; bpsize++)
>>>> +        for (idx = 0; idx < MMU_PAGE_COUNT; idx++)
>>>> +            if (mmu_psize_defs[bpsize].hblk[idx])
>>>> +                pr_info("H_BLOCK_REMOVE supports base psize:%d 
>>>> psize:%d block size:%d",
>>>> +                    bpsize, idx,
>>>> +                    mmu_psize_defs[bpsize].hblk[idx]);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +machine_arch_initcall(pseries, read_tlbbi_characteristics);
>>>> +
>>>>   /*
>>>>    * Take a spinlock around flushes to avoid bouncing the hypervisor tlbie
>>>>    * lock.
> 
> -aneesh

