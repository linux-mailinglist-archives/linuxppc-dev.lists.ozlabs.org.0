Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 668DD23FFB8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Aug 2020 20:42:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPnyj3FT8zDqTK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 04:42:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JBRQlRFq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BPnwz3dKLzDqKK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 04:41:05 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 079IWwox037190
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 9 Aug 2020 14:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=lV7ku2TnMW60/KUlE2Nc99fakyoaSZa0i2fPeLYQ+Iw=;
 b=JBRQlRFqsPsUgE+TjeVmMkSB6WIN+tUqfmgD7h+w5mSap4EbtMJHEeFzfsHVhtaNvoZh
 8Vz5A3RoSWc66FCmL797dPkGhtJvtDsuCHS7hkiXlJ71Zr/TLMIejXfbUjLh1BhDanBn
 mQsawq5sf5ryMKMa8f11ruh8CxXxFu874BDrwKYxRNnbS2/Bh/cBMnWhjwO+fWybLdi7
 Y2oxzx8ZpfLRpXub6HySB4IrihTaUPTBTG1HBZ4wudn7r6HCyBNDCGUazbQOV0fCdv/n
 BAlxlcfClzIeEaaPmkrErL1OeNaxMBJqTaC7PILNtH9CbizYcpEZqNScvTT4gofSw8tI xg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sraq6gva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Aug 2020 14:41:02 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 079IZspP025102
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 9 Aug 2020 18:41:01 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 32skp8kqsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Aug 2020 18:41:01 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 079If0Cp46137804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 9 Aug 2020 18:41:00 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3986124053;
 Sun,  9 Aug 2020 18:41:00 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EE4E124052;
 Sun,  9 Aug 2020 18:40:59 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.49.44])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun,  9 Aug 2020 18:40:58 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] powerpc/numa: Introduce logical numa id
In-Reply-To: <6d880a50-09c4-d591-c88c-09fd77512ad3@linux.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
 <87pn83ytet.fsf@linux.ibm.com>
 <324611f7-fdaf-f83c-7159-977488aa7ce7@linux.ibm.com>
 <87k0yayykz.fsf@linux.ibm.com>
 <6d880a50-09c4-d591-c88c-09fd77512ad3@linux.ibm.com>
Date: Mon, 10 Aug 2020 00:10:56 +0530
Message-ID: <87eeof4q87.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-09_09:2020-08-06,
 2020-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008090141
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

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> On 8/8/20 2:15 AM, Nathan Lynch wrote:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>> On 8/7/20 9:54 AM, Nathan Lynch wrote:
>>>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>>>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>>>>> index e437a9ac4956..6c659aada55b 100644
>>>>> --- a/arch/powerpc/mm/numa.c
>>>>> +++ b/arch/powerpc/mm/numa.c
>>>>> @@ -221,25 +221,51 @@ static void initialize_distance_lookup_table(int nid,
>>>>>    	}
>>>>>    }
>>>>>    
>>>>> +static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};
>>>>
>>>> It's odd to me to use MAX_NUMNODES for this array when it's going to be
>>>> indexed not by Linux's logical node IDs but by the platform-provided
>>>> domain number, which has no relation to MAX_NUMNODES.
>>>
>>>
>>> I didn't want to dynamically allocate this. We could fetch
>>> "ibm,max-associativity-domains" to find the size for that. The current
>>> code do assume  firmware group id to not exceed MAX_NUMNODES. Hence kept
>>> the array size to be MAX_NUMNODEs. I do agree that it is confusing. May
>>> be we can do #define MAX_AFFINITY_DOMAIN MAX_NUMNODES?
>> 
>> Well, consider:
>> 
>> - ibm,max-associativity-domains can change at runtime with LPM. This
>>    doesn't happen in practice yet, but we should probably start thinking
>>    about how to support that.
>> - The domain numbering isn't clearly specified to have any particular
>>    properties such as beginning at zero or a contiguous range.
>> 
>> While the current code likely contains assumptions contrary to these
>> points, a change such as this is an opportunity to think about whether
>> those assumptions can be reduced or removed. In particular I think it
>> would be good to gracefully degrade when the number of NUMA affinity
>> domains can exceed MAX_NUMNODES. Using the platform-supplied domain
>> numbers to directly index Linux data structures will make that
>> impossible.
>> 
>> So, maybe genradix or even xarray wouldn't actually be overengineering
>> here.
>> 
>
> One of the challenges with such a data structure is that we initialize 
> the nid_map before the slab is available. This means a memblock based 
> allocation and we would end up implementing such a sparse data structure 
> ourselves here.
>
> As you mentioned above, since we know that hypervisor as of now limits 
> the max affinity domain id below ibm,max-associativity-domains we are 
> good with an array-like nid_map we have here. This keeps the code simpler.
>
> This will also allow us to switch to a more sparse data structure as you 
> requested here in the future because the main change that is pushed in 
> this series is the usage of firmare_group_id_to_nid(). The details of 
> the data structure we use to keep track of that mapping are pretty much 
> internal to that function.

How about this? This makes it not a direct index. But it do limit the
search to max numa node on the system. 

static int domain_id_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  -1 };

static int __affinity_domain_to_nid(int domain_id, int max_nid)
{
	int i;

	for (i = 0; i < max_nid; i++) {
		if (domain_id_map[i] == domain_id)
			return i;
	}
	return NUMA_NO_NODE;
}

int affinity_domain_to_nid(struct affinity_domain *domain)
{
	int nid, domain_id;
	static int last_nid = 0;
	static DEFINE_SPINLOCK(node_id_lock);

	domain_id = domain->id;
	/*
	 * For PowerNV we don't change the node id. This helps to avoid
	 * confusion w.r.t the expected node ids. On pseries, node numbers
	 * are virtualized. Hence do logical node id for pseries.
	 */
	if (!firmware_has_feature(FW_FEATURE_LPAR))
		return domain_id;

	if (domain_id ==  -1 || last_nid == MAX_NUMNODES)
		return NUMA_NO_NODE;

	nid = __affinity_domain_to_nid(domain_id, last_nid);

	if (nid == NUMA_NO_NODE) {
		spin_lock(&node_id_lock);
		/*  recheck with lock held */
		nid = __affinity_domain_to_nid(domain_id, last_nid);
		if (nid == NUMA_NO_NODE) {
			nid = last_nid++;
			domain_id_map[nid] = domain_id;
		}
		spin_unlock(&node_id_lock);
	}

	return nid;
}
