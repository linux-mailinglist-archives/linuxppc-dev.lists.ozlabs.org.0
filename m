Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0FE23FEC2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Aug 2020 16:23:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPhCT54pczDqLG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 00:23:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TXqs/4r4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BPgzp47bBzDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 00:13:10 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 079E3gB9149525; Sun, 9 Aug 2020 10:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XsSuybbAjSqGixDxKJSEm8NOeDilwDooHtkyyIpgphE=;
 b=TXqs/4r4evYY7jbl5n/XqDZp2mT3pbjPpfHrRZVyFywpl4e6P2UIQPD4efQDk75YNCOI
 2B4KBAeciXK8Dq6ZOEm2RXVnO0b2Gj71qnnBxw2DEBbdis3VCD36svYziOxC0wTydkuy
 MR/bel8yEf+jz3BTTdI8u/3RiI+myteU9TFZwCfEzb2SXD4XMKmkGq2xxyfHuxZ16ePU
 lwqyMiDT3VMTQDe9JyYpXyIlkxzSzXMFOAv60Vpa1hOkXtHNoShQPDI0RfQ2r3JH711D
 42HimcrZQ93Ck8jjlQL7cksIInp+YZ1SsSmhmNGFk5Kr6Gm5vV1jsqz+aT2wH+A8g1Dk iQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32t9ksh78y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Aug 2020 10:12:57 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 079EA7xL022365;
 Sun, 9 Aug 2020 14:12:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 32skp819hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Aug 2020 14:12:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 079ECrP029557092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 9 Aug 2020 14:12:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D695F42041;
 Sun,  9 Aug 2020 14:12:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB84A4203F;
 Sun,  9 Aug 2020 14:12:52 +0000 (GMT)
Received: from [9.102.2.152] (unknown [9.102.2.152])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  9 Aug 2020 14:12:52 +0000 (GMT)
Subject: Re: [RFC PATCH 1/2] powerpc/numa: Introduce logical numa id
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
 <87pn83ytet.fsf@linux.ibm.com>
 <324611f7-fdaf-f83c-7159-977488aa7ce7@linux.ibm.com>
 <87k0yayykz.fsf@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <6d880a50-09c4-d591-c88c-09fd77512ad3@linux.ibm.com>
Date: Sun, 9 Aug 2020 19:42:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87k0yayykz.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-09_08:2020-08-06,
 2020-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008090101
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/8/20 2:15 AM, Nathan Lynch wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> On 8/7/20 9:54 AM, Nathan Lynch wrote:
>>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>>>> index e437a9ac4956..6c659aada55b 100644
>>>> --- a/arch/powerpc/mm/numa.c
>>>> +++ b/arch/powerpc/mm/numa.c
>>>> @@ -221,25 +221,51 @@ static void initialize_distance_lookup_table(int nid,
>>>>    	}
>>>>    }
>>>>    
>>>> +static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};
>>>
>>> It's odd to me to use MAX_NUMNODES for this array when it's going to be
>>> indexed not by Linux's logical node IDs but by the platform-provided
>>> domain number, which has no relation to MAX_NUMNODES.
>>
>>
>> I didn't want to dynamically allocate this. We could fetch
>> "ibm,max-associativity-domains" to find the size for that. The current
>> code do assume  firmware group id to not exceed MAX_NUMNODES. Hence kept
>> the array size to be MAX_NUMNODEs. I do agree that it is confusing. May
>> be we can do #define MAX_AFFINITY_DOMAIN MAX_NUMNODES?
> 
> Well, consider:
> 
> - ibm,max-associativity-domains can change at runtime with LPM. This
>    doesn't happen in practice yet, but we should probably start thinking
>    about how to support that.
> - The domain numbering isn't clearly specified to have any particular
>    properties such as beginning at zero or a contiguous range.
> 
> While the current code likely contains assumptions contrary to these
> points, a change such as this is an opportunity to think about whether
> those assumptions can be reduced or removed. In particular I think it
> would be good to gracefully degrade when the number of NUMA affinity
> domains can exceed MAX_NUMNODES. Using the platform-supplied domain
> numbers to directly index Linux data structures will make that
> impossible.
> 
> So, maybe genradix or even xarray wouldn't actually be overengineering
> here.
> 

One of the challenges with such a data structure is that we initialize 
the nid_map before the slab is available. This means a memblock based 
allocation and we would end up implementing such a sparse data structure 
ourselves here.

As you mentioned above, since we know that hypervisor as of now limits 
the max affinity domain id below ibm,max-associativity-domains we are 
good with an array-like nid_map we have here. This keeps the code simpler.

This will also allow us to switch to a more sparse data structure as you 
requested here in the future because the main change that is pushed in 
this series is the usage of firmare_group_id_to_nid(). The details of 
the data structure we use to keep track of that mapping are pretty much 
internal to that function.

-aneesh

