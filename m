Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307D2A60D4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 10:44:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR1vj4c7SzDqF6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 20:44:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=scOIzNnk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR1sy3mDJzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 20:43:02 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A4933w4023583; Wed, 4 Nov 2020 04:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zdRbraW1F2GIaa1UV8CaG7ZHN3GkfsDk51ocD6Ao0uA=;
 b=scOIzNnkJXQfwShsDUxhQ5uolcyuMOX8cG+RIERaFDl98wAsBZ5YsPlEimw+C77IhP+3
 Oxjc/hGOVfGXMUlFC3rSBijUJ0Bf3N20AoPaJXPcOhZxxp/bKXfaMTsSadZxHWLOH4VW
 WOVYV6Vij642VqSpywYqAtPyZ3SgJksEQAVj3K9SFih/EShyg+wk4o7ogVqdT54G6iDa
 BD/UTHIUprNrcyFTJPsmoVX65dja9uyD1pU1neWCrM/myXumIf4oZ5PVlshrKL+1tOzk
 SZiXW30GxvFexGVVloC/kPSADyUfXOPJaOLPRz9TjUluiH4AsZMtOT+d3Tmue/0iPVzT dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34kqdana48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 04:41:38 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A494B4g028017;
 Wed, 4 Nov 2020 04:41:38 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34kqdana3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 04:41:37 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A49Qceh031125;
 Wed, 4 Nov 2020 09:41:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 34h01uc0wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 09:41:35 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A49fXSr3408582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Nov 2020 09:41:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3181311C04C;
 Wed,  4 Nov 2020 09:41:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95A4311C052;
 Wed,  4 Nov 2020 09:41:32 +0000 (GMT)
Received: from pomme.local (unknown [9.145.163.138])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Nov 2020 09:41:32 +0000 (GMT)
Subject: Re: [PATCH] x86/mpx: fix recursive munmap() corruption
To: Dmitry Safonov <0x7f454c46@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20190401141549.3F4721FE@viggo.jf.intel.com>
 <alpine.DEB.2.21.1904191248090.3174@nanos.tec.linutronix.de>
 <87d0lht1c0.fsf@concordia.ellerman.id.au>
 <6718ede2-1fcb-1a8f-a116-250eef6416c7@linux.vnet.ibm.com>
 <4f43d4d4-832d-37bc-be7f-da0da735bbec@intel.com>
 <4e1bbb14-e14f-8643-2072-17b4cdef5326@linux.vnet.ibm.com>
 <87k1faa2i0.fsf@concordia.ellerman.id.au>
 <9c2b2826-4083-fc9c-5a4d-c101858dd560@linux.vnet.ibm.com>
 <12313ba8-75b5-d44d-dbc0-0bf2c87dfb59@csgroup.eu>
 <452b347c-0a86-c710-16ba-5a98c12a47e3@linux.vnet.ibm.com>
 <02389b9c-141c-f5b7-756a-516599063766@gmail.com>
From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
Message-ID: <3d93d41c-24fb-d24e-53f1-9dcb5c8d6394@linux.vnet.ibm.com>
Date: Wed, 4 Nov 2020 10:41:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <02389b9c-141c-f5b7-756a-516599063766@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-04_06:2020-11-04,
 2020-11-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011040068
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
Cc: mhocko@suse.com, rguenther@suse.de, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 luto@amacapital.net, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 03/11/2020 à 22:08, Dmitry Safonov a écrit :
> Hi Laurent, Christophe, Michael, all,
> 
> On 11/3/20 5:11 PM, Laurent Dufour wrote:
>> Le 23/10/2020 à 14:28, Christophe Leroy a écrit :
> [..]
>>>>> That seems like it would work for CRIU and make sense in general?
>>>>
>>>> Sorry for the late answer, yes this would make more sense.
>>>>
>>>> Here is a patch doing that.
>>>>
>>>
>>> In your patch, the test seems overkill:
>>>
>>> +    if ((start <= vdso_base && vdso_end <= end) ||  /* 1   */
>>> +        (vdso_base <= start && start < vdso_end) || /* 3,4 */
>>> +        (vdso_base < end && end <= vdso_end))       /* 2,3 */
>>> +        mm->context.vdso_base = mm->context.vdso_end = 0;
>>>
>>> What about
>>>
>>>       if (start < vdso_end && vdso_start < end)
>>>           mm->context.vdso_base = mm->context.vdso_end = 0;
>>>
>>> This should cover all cases, or am I missing something ?
>>>
>>>
>>> And do we really need to store vdso_end in the context ?
>>> I think it should be possible to re-calculate it: the size of the VDSO
>>> should be (&vdso32_end - &vdso32_start) + PAGE_SIZE for 32 bits VDSO,
>>> and (&vdso64_end - &vdso64_start) + PAGE_SIZE for the 64 bits VDSO.
>>
>> Thanks Christophe for the advise.
>>
>> That is covering all the cases, and indeed is similar to the Michael's
>> proposal I missed last year.
>>
>> I'll send a patch fixing this issue following your proposal.
> 
> It's probably not necessary anymore. I've sent patches [1], currently in
> akpm, the last one forbids splitting of vm_special_mapping.
> So, a user is able munmap() or mremap() vdso as a whole, but not partly.

Hi Dmitry,

That's a good thing too, but I think my patch is still valid in the PowerPC 
code, fixing a bad check, even if some corner cases are handled earlier in the code.

> [1]:
> https://lore.kernel.org/linux-mm/20201013013416.390574-1-dima@arista.com/
> 
> Thanks,
>            Dmitry
> 

