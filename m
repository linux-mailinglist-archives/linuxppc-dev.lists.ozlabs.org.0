Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5631183BDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 23:03:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48djWK6xXhzDqLK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 09:03:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48djT31yPMzDqKV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 09:01:11 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02CLrCil018716; Thu, 12 Mar 2020 18:01:05 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yquesjxaw-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 18:01:04 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02CLUYjM005921;
 Thu, 12 Mar 2020 21:34:08 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 2yqt6psd7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 21:34:08 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02CLY75524510742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 21:34:07 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68C7E6E04E;
 Thu, 12 Mar 2020 21:34:07 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DE076E04C;
 Thu, 12 Mar 2020 21:34:06 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.72.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 12 Mar 2020 21:34:06 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: fix of_read_drc_info_cell() to point at
 next record
To: Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>
References: <20200307024547.5748-1-tyreld@linux.ibm.com>
 <87tv2w2kc2.fsf@linux.ibm.com>
 <e99f5e39-4788-a9ef-30d7-8096df7ee36e@linux.ibm.com>
 <87imjai0wp.fsf@mpe.ellerman.id.au>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <3a3950ed-a7fb-3458-dce0-0dd6e45f93eb@linux.ibm.com>
Date: Thu, 12 Mar 2020 14:34:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87imjai0wp.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-12_15:2020-03-11,
 2020-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003120107
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
Cc: mwb@linux.vnet.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/11/20 10:43 PM, Michael Ellerman wrote:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 3/10/20 10:25 AM, Nathan Lynch wrote:
>>> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>>>> The expectation is that when calling of_read_drc_info_cell()
>>>> repeatedly to parse multiple drc-info records that the in/out curval
>>>> parameter points at the start of the next record on return. However,
>>>> the current behavior has curval still pointing at the final value of
>>>> the record just parsed. The result of which is that if the
>>>> ibm,drc-info property contains multiple properties the parsed value
>>>> of the drc_type for any record after the first has the power_domain
>>>> value of the previous record appended to the type string.
>>>>
>>>> Ex: observed the following 0xffffffff prepended to PHB
>>>>
>>>> [   69.485037] drc-info: type: \xff\xff\xff\xffPHB, prefix: PHB , index_start: 0x20000001
>>>> [   69.485038] drc-info: suffix_start: 1, sequential_elems: 3072, sequential_inc: 1
>>>> [   69.485038] drc-info: power-domain: 0xffffffff, last_index: 0x20000c00
>>>>
>>>> Fix by incrementing curval past the power_domain value to point at
>>>> drc_type string of next record.
>>>>
>>>> Fixes: a29396653b8bf ("pseries/drc-info: Search DRC properties for CPU indexes")
>>>
>>> I have a different commit hash for that:
>>> e83636ac3334 pseries/drc-info: Search DRC properties for CPU indexes
>>
>> Oof, looks like I grabbed the commit hash from the SLES 15 SP1 branch. You have
>> the correct upstream commit.
>>
>> Fixes: e83636ac3334 ("pseries/drc-info: Search DRC properties for CPU indexes")
>>
>> Michael, let me know if you want me to resubmit, or if you will fixup the Fixes
>> tag on your end?
> 
> I can update the Fixes tag.
> 
> What's the practical effect of this bug? It seems like it should break
> all the hotplug stuff, but presumably it doesn't in practice for some
> reason?
> 
> It would also be *really* nice if we had some unit tests for this
> parsing code, it's demonstrably very bug prone.
> 
> cheers
> 

In practice PHBs are the only type of connector in the ibm,drc-info property
that has multiple records. So, it breaks PHB hotplug, but by chance not pci,
cpu, slot, or mem because they happen to only ever be a single record.

I have a follow up patch to at least add some pr_debug at the end of this
parsing function to dump each record as its read.

-Tyrel
