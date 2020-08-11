Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C702B2417F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 10:06:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQlmH6PzJzDqW1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 18:06:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aaOBmkhb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQlk96fslzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 18:05:05 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07B82oKZ158761; Tue, 11 Aug 2020 04:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LknupWjSVDvq5aZKwRksKrJheozadvuHPeiAfW7g5yE=;
 b=aaOBmkhbFC6HT0wMm1QrcqRH76dU4omOBWbfxhw54sHDfxEi8ddxPtC+CzyjFF+zMShZ
 z2a5FRY0In8hNpVDg3g3Q7FvZoGKyKo67eBD9u8fRR1GvBRS6Xpwu2+uGdbd5N2fV8bV
 C1xTlMGZ+4aZ/rm1t8Y6VwEqHz2NRuaHD/neFJC79VQUyzkD7LVz2HJGImGA+5nU1WEl
 SfMA9Z/g+onfZg8PxF3cL+oEbfMFaLSyrdLJjT43M5FN2WN0D/PefkHO6K2IwWquxjV0
 lR3jggyQ/IFQ0gov5FSNIFbDtd/Ws85G4nR5n+ucUJB9rgUnHwM4algBF9CiIeNypajP 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32src26d4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 04:04:58 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07B83TQP163059;
 Tue, 11 Aug 2020 04:04:57 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32src26d3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 04:04:57 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07B84sVX011114;
 Tue, 11 Aug 2020 08:04:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 32skp8b2yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 08:04:54 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07B84qTe29622766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Aug 2020 08:04:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EFA2A405F;
 Tue, 11 Aug 2020 08:04:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0A11A4062;
 Tue, 11 Aug 2020 08:04:51 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 Aug 2020 08:04:51 +0000 (GMT)
Received: from [9.102.43.29] (unknown [9.102.43.29])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0E735A01E4;
 Tue, 11 Aug 2020 18:04:50 +1000 (AEST)
Subject: Re: [PATCH] powerpc/rtas: Restrict RTAS requests from userspace
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200702161932.18176-1-ajd@linux.ibm.com>
 <87bljjxau2.fsf@mpe.ellerman.id.au>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <1ff85ddd-1b75-f49d-0ae2-edf9e5a199e2@linux.ibm.com>
Date: Tue, 11 Aug 2020 18:04:49 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87bljjxau2.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_07:2020-08-06,
 2020-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008110051
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
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/8/20 4:40 pm, Michael Ellerman wrote:
> Hi ajd,
> 
> Thanks for taking care of this.
> 
> I was going to merge this as-is, but given it's fixing a long standing
> issue there's not really a big rush. So a few comments below.

Thanks for the review.

>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index a09eba03f180..ec1cae52d8bd 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -324,6 +324,23 @@ int rtas_token(const char *service)
>>   }
>>   EXPORT_SYMBOL(rtas_token);
>>   
>> +#ifdef CONFIG_PPC_RTAS_FILTER
>> +
> 
> I think this could be combined with the #ifdef block below?

I put it here to keep it next to rtas_token() as it seemed thematically 
appropriate. Anyway per below I'll probably get rid of this function 
altogether.

> 
>> +static char *rtas_token_name(int token)
>> +{
>> +	struct property *prop;
>> +
>> +	for_each_property_of_node(rtas.dev, prop) {
>> +		const __be32 *tokp = prop->value;
>> +
>> +		if (tokp && be32_to_cpu(*tokp) == token)
>> +			return prop->name;
>> +	}
>> +	return NULL;
>> +}
>> +
>> +#endif /* CONFIG_PPC_RTAS_FILTER */
>> +
>>   int rtas_service_present(const char *service)
>>   {
>>   	return rtas_token(service) != RTAS_UNKNOWN_SERVICE;
>> @@ -1110,6 +1127,184 @@ struct pseries_errorlog *get_pseries_errorlog(struct rtas_error_log *log,
>>   	return NULL;
>>   }
>>   
>> +#ifdef CONFIG_PPC_RTAS_FILTER
>> +
>> +/*
>> + * The sys_rtas syscall, as originally designed, allows root to pass
>> + * arbitrary physical addresses to RTAS calls. A number of RTAS calls
>> + * can be abused to write to arbitrary memory and do other things that
>> + * are potentially harmful to system integrity, and thus should only
>> + * be used inside the kernel and not exposed to userspace.
>> + *
>> + * All known legitimate users of the sys_rtas syscall will only ever
>> + * pass addresses that fall within the RMO buffer, and use a known
>> + * subset of RTAS calls.
>> + *
>> + * Accordingly, we filter RTAS requests to check that the call is
>> + * permitted, and that provided pointers fall within the RMO buffer.
>> + * The rtas_filters list contains an entry for each permitted call,
>> + * with the indexes of the parameters which are expected to contain
>> + * addresses and sizes of buffers allocated inside the RMO buffer.
>> + */
>> +struct rtas_filter {
>> +	const char name[32];
> 
> Using a const char * for the name would be more typical, meaning the
> strings would end up in .rodata, and could be merged with other uses of
> the same strings.

Will fix

> 
>> +
>> +	/* Indexes into the args buffer, -1 if not used */
>> +	int rmo_buf_idx1;
>> +	int rmo_size_idx1;
>> +	int rmo_buf_idx2;
>> +	int rmo_size_idx2;
> 
> The "rmo" prefix is probably unnecessary?
> 

Ack

>> +};
>> +
>> +struct rtas_filter rtas_filters[] = {
> 
> Should be static, and __ro_after_init ?
> 
>> +	{ "ibm,activate-firmware", -1, -1, -1, -1 },
> 
> Would it be worth making the indices 1-based, allowing 0 to be the
> unused value, meaning you only have to initialise the used fields?

1-based array indices are morally reprehensible. It would make it 
cleaner but I kind of prefer an obvious and clear constant for unused, idk

> It would require adjusting them before use, but there's only 4 places
> they're used, and you could probably use a macro to do the - 1.
> 
>> +	{ "ibm,configure-connector", 0, -1, 1, -1 },	/* Special cased, size 4096 */
> 
> Does it make sense to put the hard coded sizes in the structure as well?
> 
> eg. fixed_size1 = 4096,
> 
> I think that would avoid the need for any strcmps in the code.

Not quite - we still have a special case for ibm,configure-connector 
passing a base address of 0.

But yes that's a good idea.

> 
>> +	{ "display-character", -1, -1, -1, -1 },
>> +	{ "ibm,display-message", 0, -1, -1, -1 },
>> +	{ "ibm,errinjct", 2, -1, -1, -1 },		/* Fixed size of 1024 */
>> +	{ "ibm,close-errinjct", -1, -1, -1, -1 },
>> +	{ "ibm,open-errinct", -1, -1, -1, -1 },
>> +	{ "ibm,get-config-addr-info2", -1, -1, -1, -1 },
>> +	{ "ibm,get-dynamic-sensor-state", 1, -1, -1, -1 },
>> +	{ "ibm,get-indices", 2, 3, -1, -1 },
>> +	{ "get-power-level", -1, -1, -1, -1 },
>> +	{ "get-sensor-state", -1, -1, -1, -1 },
>> +	{ "ibm,get-system-parameter", 1, 2, -1, -1 },
>> +	{ "get-time-of-day", -1, -1, -1, -1 },
>> +	{ "ibm,get-vpd", 0, -1, 1, 2 },
>> +	{ "ibm,lpar-perftools", 2, 3, -1, -1 },
>> +	{ "ibm,platform-dump", 4, 5, -1, -1 },
>> +	{ "ibm,read-slot-reset-state", -1, -1, -1, -1 },
>> +	{ "ibm,scan-log-dump", 0, 1, -1, -1 },
>> +	{ "ibm,set-dynamic-indicator", 2, -1, -1, -1 },
>> +	{ "ibm,set-eeh-option", -1, -1, -1, -1 },
>> +	{ "set-indicator", -1, -1, -1, -1 },
>> +	{ "set-power-level", -1, -1, -1, -1 },
>> +	{ "set-time-for-power-on", -1, -1, -1, -1 },
>> +	{ "ibm,set-system-parameter", 1, -1, -1, -1 },
>> +	{ "set-time-of-day", -1, -1, -1, -1 },
>> +	{ "ibm,suspend-me", -1, -1, -1, -1 },
>> +	{ "ibm,update-nodes", 0, -1, -1, -1 },		/* Fixed size of 4096 */
>> +	{ "ibm,update-properties", 0, -1, -1, -1 },	/* Fixed size of 4096 */
>> +	{ "ibm,physical-attestation", 0, 1, -1, -1 },
>> +};
>> +
>> +static void dump_rtas_params(int token, int nargs, int nret,
>> +			     struct rtas_args *args)
>> +{
>> +	int i;
>> +	char *token_name = rtas_token_name(token);
>> +
>> +	pr_err_ratelimited("sys_rtas: token=0x%x (%s), nargs=%d, nret=%d (called by %s)\n",
>> +			   token, token_name ? token_name : "unknown", nargs,
>> +			   nret, current->comm);
>> +	pr_err_ratelimited("sys_rtas: args: ");
>> +
>> +	for (i = 0; i < nargs; i++) {
>> +		u32 arg = be32_to_cpu(args->args[i]);
>> +
>> +		pr_cont("%08x ", arg);
>> +		if (arg >= rtas_rmo_buf &&
>> +		    arg < (rtas_rmo_buf + RTAS_RMOBUF_MAX))
>> +			pr_cont("(buf+0x%lx) ", arg - rtas_rmo_buf);
>> +	}
> 
> This can leak the location of the RMO buf into dmesg. I know it's
> visible via /proc, but the /proc file is 0400.
> 
> So I think it's probably safer if we just don't dump the args, or their
> relation to the RMO buf.

Good point, removed.

> 
>> +
>> +	pr_cont("\n");
>> +}
>> +
>> +static bool in_rmo_buf(u32 base, u32 end)
>> +{
>> +	return base >= rtas_rmo_buf &&
>> +		base < (rtas_rmo_buf + RTAS_RMOBUF_MAX) &&
>> +		base <= end &&
>> +		end >= rtas_rmo_buf &&
>> +		end < (rtas_rmo_buf + RTAS_RMOBUF_MAX);
>> +}
>> +
>> +static bool block_rtas_call(int token, int nargs,
>> +			    struct rtas_args *args)
>> +{
>> +	int i;
>> +	const char *reason;
>> +	char *token_name = rtas_token_name(token);
> 
> This code isn't particularly performance critical, but I think it would
> be cleaner to do the token lookup once at init time, and store the token
> in the filter array?
> 
> Then this code would only be doing token comparisons.

Yeah that would be cleaner, can get rid of rtas_token_name().

> 
>> +
>> +	if (!token_name)
>> +		goto err_notpermitted;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
>> +		struct rtas_filter *f = &rtas_filters[i];
>> +		u32 base, size, end;
>> +
>> +		if (strcmp(token_name, f->name))
>> +			continue;
>> +
>> +		if (f->rmo_buf_idx1 != -1) {
>> +			base = be32_to_cpu(args->args[f->rmo_buf_idx1]);
>> +			if (f->rmo_size_idx1 != -1)
>> +				size = be32_to_cpu(args->args[f->rmo_size_idx1]);
>> +			else if (!strcmp(token_name, "ibm,errinjct"))
>> +				size = 1024;
>> +			else if (!strcmp(token_name, "ibm,update-nodes") ||
>> +				 !strcmp(token_name, "ibm,update-properties") ||
>> +				 !strcmp(token_name, "ibm,configure-connector"))
>> +				size = 4096;
>> +			else
>> +				size = 1;
>> +
>> +			end = base + size - 1;
>> +			if (!in_rmo_buf(base, end)) {
>> +				reason = "address pair 1 out of range";
> 
> I don't think we need to give the user this much detail about what they
> did wrong, all cases can just print "call not permitted" IMO.

Ack

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
