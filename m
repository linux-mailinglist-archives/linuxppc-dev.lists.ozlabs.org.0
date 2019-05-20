Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9614F23BF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 17:22:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4572h63DTKzDqHP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 01:22:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4572fC6PJnzDqD4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 01:20:51 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KF5qRd006470
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 11:20:49 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2skwa84fhw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 11:20:48 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Mon, 20 May 2019 16:20:48 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 May 2019 16:20:45 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4KFKiRf8257808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 May 2019 15:20:44 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47F5EC605F;
 Mon, 20 May 2019 15:20:44 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36682C6069;
 Mon, 20 May 2019 15:20:25 +0000 (GMT)
Received: from [9.199.54.74] (unknown [9.199.54.74])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 May 2019 15:20:22 +0000 (GMT)
Subject: Re: PROBLEM: Power9: kernel oops on memory hotunplug from ppc64le
 guest
To: Nicholas Piggin <npiggin@gmail.com>, bharata@linux.ibm.com
References: <16a7a635-c592-27e2-75b4-d02071833278@linux.vnet.ibm.com>
 <20190518141434.GA22939@in.ibm.com> <878sv1993k.fsf@concordia.ellerman.id.au>
 <20190520042533.GB22939@in.ibm.com> <1558327521.633yjtl8ki.astroid@bobo.none>
 <20190520055622.GC22939@in.ibm.com> <1558335484.9inx69a7ea.astroid@bobo.none>
 <20190520082035.GD22939@in.ibm.com> <20190520142922.GE22939@in.ibm.com>
 <1558363500.jsgl4a2lfa.astroid@bobo.none>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Mon, 20 May 2019 20:50:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558363500.jsgl4a2lfa.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19052015-8235-0000-0000-00000E99A357
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011131; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01206080; UDB=6.00633288; IPR=6.00987040; 
 MB=3.00026972; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-20 15:20:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052015-8236-0000-0000-000045A3F2CD
Message-Id: <3ec09ffa-e3d8-5ba2-cf1e-c0d47cfc2332@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905200099
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
Cc: linux-kernel@vger.kernel.org, srikanth <sraithal@linux.vnet.ibm.com>,
 linux-next@vger.kernel.org, bharata@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/19 8:25 PM, Nicholas Piggin wrote:
> Bharata B Rao's on May 21, 2019 12:29 am:
>> On Mon, May 20, 2019 at 01:50:35PM +0530, Bharata B Rao wrote:
>>> On Mon, May 20, 2019 at 05:00:21PM +1000, Nicholas Piggin wrote:
>>>> Bharata B Rao's on May 20, 2019 3:56 pm:
>>>>> On Mon, May 20, 2019 at 02:48:35PM +1000, Nicholas Piggin wrote:
>>>>>>>>> git bisect points to
>>>>>>>>>
>>>>>>>>> commit 4231aba000f5a4583dd9f67057aadb68c3eca99d
>>>>>>>>> Author: Nicholas Piggin <npiggin@gmail.com>
>>>>>>>>> Date:   Fri Jul 27 21:48:17 2018 +1000
>>>>>>>>>
>>>>>>>>>      powerpc/64s: Fix page table fragment refcount race vs speculative references
>>>>>>>>>
>>>>>>>>>      The page table fragment allocator uses the main page refcount racily
>>>>>>>>>      with respect to speculative references. A customer observed a BUG due
>>>>>>>>>      to page table page refcount underflow in the fragment allocator. This
>>>>>>>>>      can be caused by the fragment allocator set_page_count stomping on a
>>>>>>>>>      speculative reference, and then the speculative failure handler
>>>>>>>>>      decrements the new reference, and the underflow eventually pops when
>>>>>>>>>      the page tables are freed.
>>>>>>>>>
>>>>>>>>>      Fix this by using a dedicated field in the struct page for the page
>>>>>>>>>      table fragment allocator.
>>>>>>>>>
>>>>>>>>>      Fixes: 5c1f6ee9a31c ("powerpc: Reduce PTE table memory wastage")
>>>>>>>>>      Cc: stable@vger.kernel.org # v3.10+
>>>>>>>>
>>>>>>>> That's the commit that added the BUG_ON(), so prior to that you won't
>>>>>>>> see the crash.
>>>>>>>
>>>>>>> Right, but the commit says it fixes page table page refcount underflow by
>>>>>>> introducing a new field &page->pt_frag_refcount. Now we are hitting the underflow
>>>>>>> for this pt_frag_refcount.
>>>>>>
>>>>>> The fixed underflow is caused by a bug (race on page count) that got
>>>>>> fixed by that patch. You are hitting a different underflow here. It's
>>>>>> not certain my patch caused it, I'm just trying to reproduce now.
>>>>>
>>>>> Ok.
>>>>
>>>> Can't reproduce I'm afraid, tried adding and removing 8GB memory from a
>>>> 4GB guest (via host adding / removing memory device), and it just works.
>>>
>>> Boot, add 8G, reboot, remove 8G is the sequence to reproduce.
>>>
>>>>
>>>> It's likely to be an edge case like an off by one or rounding error
>>>> that just happens to trigger in your config. Might be easiest if you
>>>> could test with a debug patch.
>>>
>>> Sure, I will continue debugging.
>>
>> When the guest is rebooted after hotplug, the entire memory (which includes
>> the hotplugged memory) gets remapped again freshly. However at this time
>> since no slab is available yet, pt_frag_refcount never gets initialized as we
>> never do pte_fragment_alloc() for these mappings. So we right away hit the
>> underflow during the first unplug itself, it looks like.
> 
> Nice catch, good debugging work.
> 
>> I will check how this can be fixed.
> 
> Tricky problem. What do you think? You might be able to make the early
> page table allocations in the same pattern as the frag allocations, and
> then fill in the struct page metadata when you have those.


I guess we need to do something similar to what x86 does. We need to 
walk the init_mm page table again and re-init struct page and other data 
structures backing the tables?

-aneesh

