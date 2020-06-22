Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F00203FD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 21:04:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rJkQ2jslzDqLv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 05:04:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rJcD2RQnzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 04:59:23 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05MIWJjY168539
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 14:59:21 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31tyuxcs77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 14:59:20 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05MIndcs013692
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 18:59:20 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 31sa38x75n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 18:59:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05MIxG4531392178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 18:59:16 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A135BE051;
 Mon, 22 Jun 2020 18:59:18 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C85B4BE04F;
 Mon, 22 Jun 2020 18:59:17 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.126.221])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 18:59:17 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: new lparcfg key/value pair:
 partition_affinity_score
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200619153419.3676392-1-cheloha@linux.ibm.com>
 <10febdd6-4672-24ca-03e9-553468c8852c@linux.ibm.com>
 <87d05ufugs.fsf@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <4329ec13-22c7-75c6-548d-323d19775a54@linux.ibm.com>
Date: Mon, 22 Jun 2020 11:59:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87d05ufugs.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_10:2020-06-22,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 cotscore=-2147483648 malwarescore=0 clxscore=1015 spamscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220122
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

On 6/19/20 5:32 PM, Nathan Lynch wrote:
> Hi Tyrel,
> 
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 6/19/20 8:34 AM, Scott Cheloha wrote:
>>> The H_GetPerformanceCounterInfo PHYP hypercall has a subcall,
>>> Affinity_Domain_Info_By_Partition, which returns, among other things,
>>> a "partition affinity score" for a given LPAR.  This score, a value on
>>> [0-100], represents the processor-memory affinity for the LPAR in
>>> question.  A score of 0 indicates the worst possible affinity while a
>>> score of 100 indicates perfect affinity.  The score can be used to
>>> reason about performance.
>>>
>>> This patch adds the score for the local LPAR to the lparcfg procfile
>>> under a new 'partition_affinity_score' key.
>>
>> I expect that you will probably get a NACK from Michael on this. The overall
>> desire is to move away from these dated /proc interfaces. While its true that I
>> did add a new value recently it was strictly to facilitate and correct the
>> calculation of a derived value that was already dependent on a couple other
>> existing values in lparcfg.
>>
>> With that said I would expect that you would likely be advised to expose this as
>> a sysfs attribute. The question is where? We probably should put some thought in
>> to this as I would like to port each lparcfg value over to sysfs so that we can
>> move to deprecating lparcfg. Putting everything under something like
>> /sys/kernel/lparcfg/* maybe. Michael may have a better suggestion.
> 
> I think this score fits pretty naturally in lparcfg: it's a simple
> metric that is specific to the pseries/papr platform, like everything
> else in there.
> 
> A few dozen key=value pairs contained in a single file is simple and
> efficient, unlike sysfs with its rather inconsistently applied
> one-value-per-file convention. Surely it's OK if lparcfg gains a line
> every few years?
> 

So, two things:

1.) I wanted to give fore warning that Michael is generally reluctant to add new
things to lparcfg and I wanted to prepare you for that possibility.

2.) As a simple metric who is consuming said metric? I've not seen any patches
to powerpc-utils in prep so should I be expecting this to be exposed via
lparstat, or are we expecting new tooling to also start parsing lparcfg? If we
are planning for users to consume it via existing powerpc-utils tooling than its
probably easier to make the argument that it fits into lparcfg. If we are
creating new tooling, or expecting users to extract that value on their own I
think the sysfs route is going to be favored.

-Tyrel

> 
>>> The H_GetPerformanceCounterInfo hypercall is already used elsewhere in
>>> the kernel, in powerpc/perf/hv-gpci.c.  Refactoring that code and this
>>> code into a more general API might be worthwhile if additional modules
>>> require the hypercall in the future.
>>
>> If you are duplicating code its likely you should already be doing this. See the
>> rest of my comments about below.
>>
>>>
>>> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
>>> ---
>>>  arch/powerpc/platforms/pseries/lparcfg.c | 53 ++++++++++++++++++++++++
>>>  1 file changed, 53 insertions(+)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>>> index b8d28ab88178..b75151eee0f0 100644
>>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>>> @@ -136,6 +136,57 @@ static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
>>>  	return rc;
>>>  }
>>>  
>>> +/*
>>> + * Based on H_GetPerformanceCounterInfo v1.10.
>>> + */
>>> +static void show_gpci_data(struct seq_file *m)
>>> +{
>>> +	struct perf_counter_info_params {
>>> +		__be32 counter_request;
>>> +		__be32 starting_index;
>>> +		__be16 secondary_index;
>>> +		__be16 returned_values;
>>> +		__be32 detail_rc;
>>> +		__be16 counter_value_element_size;
>>> +		u8     counter_info_version_in;
>>> +		u8     counter_info_version_out;
>>> +		u8     reserved[0xC];
>>> +	} __packed;
>>
>> This looks to duplicate the hv_get_perf_counter_info_params struct from
>> arch/powerpc/perf/hv-gpci.h. Maybe this include file needs to move to
>> arch/powerpc/asm/inlcude so you don't have to redefine this struct.
>>
>>> +	struct hv_gpci_request_buffer {
>>> +		struct perf_counter_info_params params;
>>> +		u8 output[4096 - sizeof(struct perf_counter_info_params)];
>>> +	} __packed;
>>
>> This struct is code duplication of the one defined in
>> arch/powerpc/perf/hv-gpci.c and could be moved into hv-gpci.h along with
>> HGPCI_MAX_DATA_BYTES so that you can use those versions here.
> 
> I tend to agree with these comments.
> 
> 
>>> +	struct hv_gpci_request_buffer *buf;
>>> +	long ret;
>>> +	unsigned int affinity_score;
>>> +
>>> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
>>> +	if (buf == NULL)
>>> +		return;
>>> +
>>> +	/*
>>> +	 * Show the local LPAR's affinity score.
>>> +	 *
>>> +	 * 0xB1 selects the Affinity_Domain_Info_By_Partition subcall.
>>> +	 * The score is at byte 0xB in the output buffer.
>>> +	 */
>>> +	memset(&buf->params, 0, sizeof(buf->params));
>>> +	buf->params.counter_request = cpu_to_be32(0xB1);
>>> +	buf->params.starting_index = cpu_to_be32(-1);	/* local LPAR */
>>> +	buf->params.counter_info_version_in = 0x5;	/* v5+ for score */
>>> +	ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO, virt_to_phys(buf),
>>> +				 sizeof(*buf));
>>> +	if (ret != H_SUCCESS) {
>>> +		pr_debug("hcall failed: H_GET_PERF_COUNTER_INFO: %ld, %x\n",
>>> +			 ret, be32_to_cpu(buf->params.detail_rc));
>>> +		goto out;
>>> +	}
>>> +	affinity_score = buf->output[0xB];
>>> +	seq_printf(m, "partition_affinity_score=%u\n", affinity_score);
>>> +out:
>>> +	kfree(buf);
>>> +}
>>> +
>>
>> IIUC we should already be able to get this value from userspace using perf tool,
>> right? If thats the case can't we also programatically retrieve it via the
>> perf_event interface in userspace as well?
> 
> No... I had the same thought when I first looked at this, but perf is
> for sampling counters, and the partition affinity score is not a
> counter.

But, its obtained through the same H_GET_PERF_COUNTER_INFO interface as the rest
of the performance counters. Shouldn't it be obtainable via 'perf stat -e
hv-gpci/*' and therefore also via perf_event? I really am not that familiar with
perf so correct me on whatever I'm missing here.

-Tyrel
