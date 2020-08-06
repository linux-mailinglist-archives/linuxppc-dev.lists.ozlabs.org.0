Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0895823DA82
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 14:58:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMpSx1KF2zDqq0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 22:58:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMp9N31t0zDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 22:44:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mUxTSKxd; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BMp9M64jFz9sR4; Thu,  6 Aug 2020 22:44:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMp9M3tflz9sPC;
 Thu,  6 Aug 2020 22:44:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596717895;
 bh=EoMA5oktmVhcAiEw7r+sP/7tsifxKNDsG7KJXtB6rfE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mUxTSKxd7XyY204tzUo+hc8Yl6wrEv5BXAjfRZ0LtCETpt5cQ/sOyTU0r2viRpanE
 zRthgdbhZQZQbrmR8DxxRRyFmW3VESyZrRDCbR2MxkuaSRXo5dvzcuuFvZZlqBrShR
 m+33aGgIF1/+dff2TKgrTbI0BL2CSjerygSgkHN5Qri1nlfF+1CaC1GN5DaCpZ6G0D
 M4T09Be+UpE3YcktuEg7ZxvW0F5P955+MqsygWU4RtHh14sm1rc8TLEL7+F/Zka0+r
 S4pXAFMdKyN9nBL2Lr6V6btzU4flUo2m5wzJANVn6uq2dwhi+tWfKirt0rYQSIen/U
 15ML2gf5sg6xA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2 2/2] powerpc/pseries: new lparcfg key/value pair:
 partition_affinity_score
In-Reply-To: <bc9858c9-7d55-88c0-1f85-157af48e1d8c@linux.ibm.com>
References: <20200727184605.2945095-1-cheloha@linux.ibm.com>
 <20200727184605.2945095-2-cheloha@linux.ibm.com>
 <bc9858c9-7d55-88c0-1f85-157af48e1d8c@linux.ibm.com>
Date: Thu, 06 Aug 2020 22:44:54 +1000
Message-ID: <871rkkymd5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 7/27/20 11:46 AM, Scott Cheloha wrote:
>> The H_GetPerformanceCounterInfo (GPCI) PHYP hypercall has a subcall,
>> Affinity_Domain_Info_By_Partition, which returns, among other things,
>> a "partition affinity score" for a given LPAR.  This score, a value on
>> [0-100], represents the processor-memory affinity for the LPAR in
>> question.  A score of 0 indicates the worst possible affinity while a
>> score of 100 indicates perfect affinity.  The score can be used to
>> reason about performance.
>> 
>> This patch adds the score for the local LPAR to the lparcfg procfile
>> under a new 'partition_affinity_score' key.
>> 
>> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
>
> I was hoping Michael would chime in the first time around on this patch series
> about adding another key/value pair to lparcfg.

That guy is so unreliable.

I don't love adding new stuff in lparcfg, but given the file already
exists and there's no prospect of removing it, it's probably not worth
the effort to put the new field anywhere else.

My other query with this was how on earth anyone is meant to interpret
the metric. ie. if my metric is 50, what does that mean? If it's 90
should I worry?

Which makes me realise we have no documentation for lparcfg in the
kernel at all.

So it would be nice to have it mentioned somewhere in Documentation,
even if it just points to the manpage in powerpc-ibm-utils.

cheers


> So, barring a NACK from mpe:
>
> Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>
>> ---
>>  arch/powerpc/platforms/pseries/lparcfg.c | 35 ++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>> index b8d28ab88178..e278390ab28d 100644
>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>> @@ -136,6 +136,39 @@ static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
>>  	return rc;
>>  }
>>  
>> +static void show_gpci_data(struct seq_file *m)
>> +{
>> +	struct hv_gpci_request_buffer *buf;
>> +	unsigned int affinity_score;
>> +	long ret;
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
>> +	affinity_score = buf->bytes[0xB];
>> +	seq_printf(m, "partition_affinity_score=%u\n", affinity_score);
>> +out:
>> +	kfree(buf);
>> +}
>> +
>>  static unsigned h_pic(unsigned long *pool_idle_time,
>>  		      unsigned long *num_procs)
>>  {
>> @@ -487,6 +520,8 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
>>  			   partition_active_processors * 100);
>>  	}
>>  
>> +	show_gpci_data(m);
>> +
>>  	seq_printf(m, "partition_active_processors=%d\n",
>>  		   partition_active_processors);
>>  
>> 
