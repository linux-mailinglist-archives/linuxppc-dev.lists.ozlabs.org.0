Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B1201F3D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 02:33:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pc986GLWzDrfJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 10:33:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pc7Z0GR2zDrR8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 10:32:09 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05K0VwOq130479
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 20:32:07 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rund4bfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 20:32:06 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05K0Tv8s030003
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 00:32:06 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 31qu280sbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 00:32:06 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05K0W4mT23658794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 20 Jun 2020 00:32:04 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EA356E050;
 Sat, 20 Jun 2020 00:32:05 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D06E56E053;
 Sat, 20 Jun 2020 00:32:04 +0000 (GMT)
Received: from localhost (unknown [9.160.89.118])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 20 Jun 2020 00:32:04 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: new lparcfg key/value pair:
 partition_affinity_score
In-Reply-To: <10febdd6-4672-24ca-03e9-553468c8852c@linux.ibm.com>
References: <20200619153419.3676392-1-cheloha@linux.ibm.com>
 <10febdd6-4672-24ca-03e9-553468c8852c@linux.ibm.com>
Date: Fri, 19 Jun 2020 19:32:03 -0500
Message-ID: <87d05ufugs.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_22:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=1 phishscore=0
 clxscore=1015 bulkscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190170
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

Hi Tyrel,

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 6/19/20 8:34 AM, Scott Cheloha wrote:
>> The H_GetPerformanceCounterInfo PHYP hypercall has a subcall,
>> Affinity_Domain_Info_By_Partition, which returns, among other things,
>> a "partition affinity score" for a given LPAR.  This score, a value on
>> [0-100], represents the processor-memory affinity for the LPAR in
>> question.  A score of 0 indicates the worst possible affinity while a
>> score of 100 indicates perfect affinity.  The score can be used to
>> reason about performance.
>> 
>> This patch adds the score for the local LPAR to the lparcfg procfile
>> under a new 'partition_affinity_score' key.
>
> I expect that you will probably get a NACK from Michael on this. The overall
> desire is to move away from these dated /proc interfaces. While its true that I
> did add a new value recently it was strictly to facilitate and correct the
> calculation of a derived value that was already dependent on a couple other
> existing values in lparcfg.
>
> With that said I would expect that you would likely be advised to expose this as
> a sysfs attribute. The question is where? We probably should put some thought in
> to this as I would like to port each lparcfg value over to sysfs so that we can
> move to deprecating lparcfg. Putting everything under something like
> /sys/kernel/lparcfg/* maybe. Michael may have a better suggestion.

I think this score fits pretty naturally in lparcfg: it's a simple
metric that is specific to the pseries/papr platform, like everything
else in there.

A few dozen key=value pairs contained in a single file is simple and
efficient, unlike sysfs with its rather inconsistently applied
one-value-per-file convention. Surely it's OK if lparcfg gains a line
every few years?


>> The H_GetPerformanceCounterInfo hypercall is already used elsewhere in
>> the kernel, in powerpc/perf/hv-gpci.c.  Refactoring that code and this
>> code into a more general API might be worthwhile if additional modules
>> require the hypercall in the future.
>
> If you are duplicating code its likely you should already be doing this. See the
> rest of my comments about below.
>
>> 
>> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/lparcfg.c | 53 ++++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>> index b8d28ab88178..b75151eee0f0 100644
>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>> @@ -136,6 +136,57 @@ static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
>>  	return rc;
>>  }
>>  
>> +/*
>> + * Based on H_GetPerformanceCounterInfo v1.10.
>> + */
>> +static void show_gpci_data(struct seq_file *m)
>> +{
>> +	struct perf_counter_info_params {
>> +		__be32 counter_request;
>> +		__be32 starting_index;
>> +		__be16 secondary_index;
>> +		__be16 returned_values;
>> +		__be32 detail_rc;
>> +		__be16 counter_value_element_size;
>> +		u8     counter_info_version_in;
>> +		u8     counter_info_version_out;
>> +		u8     reserved[0xC];
>> +	} __packed;
>
> This looks to duplicate the hv_get_perf_counter_info_params struct from
> arch/powerpc/perf/hv-gpci.h. Maybe this include file needs to move to
> arch/powerpc/asm/inlcude so you don't have to redefine this struct.
>
>> +	struct hv_gpci_request_buffer {
>> +		struct perf_counter_info_params params;
>> +		u8 output[4096 - sizeof(struct perf_counter_info_params)];
>> +	} __packed;
>
> This struct is code duplication of the one defined in
> arch/powerpc/perf/hv-gpci.c and could be moved into hv-gpci.h along with
> HGPCI_MAX_DATA_BYTES so that you can use those versions here.

I tend to agree with these comments.


>> +	struct hv_gpci_request_buffer *buf;
>> +	long ret;
>> +	unsigned int affinity_score;
>> +
>> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
>> +	if (buf == NULL)
>> +		return;
>> +
>> +	/*
>> +	 * Show the local LPAR's affinity score.
>> +	 *
>> +	 * 0xB1 selects the Affinity_Domain_Info_By_Partition subcall.
>> +	 * The score is at byte 0xB in the output buffer.
>> +	 */
>> +	memset(&buf->params, 0, sizeof(buf->params));
>> +	buf->params.counter_request = cpu_to_be32(0xB1);
>> +	buf->params.starting_index = cpu_to_be32(-1);	/* local LPAR */
>> +	buf->params.counter_info_version_in = 0x5;	/* v5+ for score */
>> +	ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO, virt_to_phys(buf),
>> +				 sizeof(*buf));
>> +	if (ret != H_SUCCESS) {
>> +		pr_debug("hcall failed: H_GET_PERF_COUNTER_INFO: %ld, %x\n",
>> +			 ret, be32_to_cpu(buf->params.detail_rc));
>> +		goto out;
>> +	}
>> +	affinity_score = buf->output[0xB];
>> +	seq_printf(m, "partition_affinity_score=%u\n", affinity_score);
>> +out:
>> +	kfree(buf);
>> +}
>> +
>
> IIUC we should already be able to get this value from userspace using perf tool,
> right? If thats the case can't we also programatically retrieve it via the
> perf_event interface in userspace as well?

No... I had the same thought when I first looked at this, but perf is
for sampling counters, and the partition affinity score is not a
counter.
