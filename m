Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E4A241BAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 15:43:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQvDm5N19zDqQN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 23:43:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=dOfMwxCf; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQvB86zJ2zDqB7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 23:41:20 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id q19so482283pll.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=UFADfDlmmwcNrk7aAau53duDwiNVI9sDgC6ZuRsFW7I=;
 b=dOfMwxCfgcXdemUu5QNnsXOvt58YMWZLDIqTQW1AipFRv/SMjmcDjQt9TcS/oFTy/P
 E/kl04H9b1H0TZPeN7GAZb82/lDf31L2zGFHgylqJmNtRECl+cHzSVocRRua3r7OvJAw
 bSP+AhCw1nQ9oqg/RVdqpydyPY3Qyv7UDwRdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=UFADfDlmmwcNrk7aAau53duDwiNVI9sDgC6ZuRsFW7I=;
 b=WBUHpISVpXVojgxNnQu/Zb/nAoyEKKs9Zh8DHpwKldwD67y8gq+JI2PIzvtnRqhHHz
 ktWWPWqKn4do4H+uxn2qWPwAe1CoTDbeqNGZvs0fjyPHFlaal838bM7hUxLqwkBqe3nb
 1j6Jnup7PPXb2Ul2vG26Kv0rX/9AArRzkE8NMmnL68D5Yk2UkK0Shg1InbcqUpT/Byzq
 KyR5agv35CiWGqcm8yXXvEZXuAF+kQl1V31ldByLIbyNZmsoaadvg9tMimspCo7A3PZc
 ESKeYUjoU9CdBXfAfp+njcApfz2xJLlBv4CCE9qfRWWY0wxp7krweJHvkEermTMvjsJU
 t1/g==
X-Gm-Message-State: AOAM5306j4PimLIj3bLCBwQ1FS8bpETLtXovoSbF8YNkJmMHI1LeSDCD
 577+N67zcgDbf4b+WTxon8Tppw==
X-Google-Smtp-Source: ABdhPJwteNVQVRoAr5b9Hmci8Bi8tD22EobfyJSK031JXQMCN1O064WAKDWC9JaBWppmPsB05IE5eA==
X-Received: by 2002:a17:90a:2110:: with SMTP id
 a16mr1182665pje.104.1597153276672; 
 Tue, 11 Aug 2020 06:41:16 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-35cf-8781-c255-22a6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:35cf:8781:c255:22a6])
 by smtp.gmail.com with ESMTPSA id t2sm26757976pfb.123.2020.08.11.06.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 06:41:16 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Andrew Donnellan <ajd@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/rtas: Restrict RTAS requests from userspace
In-Reply-To: <1ff85ddd-1b75-f49d-0ae2-edf9e5a199e2@linux.ibm.com>
References: <20200702161932.18176-1-ajd@linux.ibm.com>
 <87bljjxau2.fsf@mpe.ellerman.id.au>
 <1ff85ddd-1b75-f49d-0ae2-edf9e5a199e2@linux.ibm.com>
Date: Tue, 11 Aug 2020 23:41:12 +1000
Message-ID: <875z9pnvuv.fsf@dja-thinkpad.axtens.net>
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
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:

> On 10/8/20 4:40 pm, Michael Ellerman wrote:
>> Hi ajd,
>> 
>> Thanks for taking care of this.
>> 
>> I was going to merge this as-is, but given it's fixing a long standing
>> issue there's not really a big rush. So a few comments below.
>
> Thanks for the review.
>
>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>> index a09eba03f180..ec1cae52d8bd 100644
>>> --- a/arch/powerpc/kernel/rtas.c
>>> +++ b/arch/powerpc/kernel/rtas.c
>>> @@ -324,6 +324,23 @@ int rtas_token(const char *service)
>>>   }
>>>   EXPORT_SYMBOL(rtas_token);
>>>   
>>> +#ifdef CONFIG_PPC_RTAS_FILTER
>>> +
>> 
>> I think this could be combined with the #ifdef block below?
>
> I put it here to keep it next to rtas_token() as it seemed thematically 
> appropriate. Anyway per below I'll probably get rid of this function 
> altogether.
>
>> 
>>> +static char *rtas_token_name(int token)
>>> +{
>>> +	struct property *prop;
>>> +
>>> +	for_each_property_of_node(rtas.dev, prop) {
>>> +		const __be32 *tokp = prop->value;
>>> +
>>> +		if (tokp && be32_to_cpu(*tokp) == token)
>>> +			return prop->name;
>>> +	}
>>> +	return NULL;
>>> +}
>>> +
>>> +#endif /* CONFIG_PPC_RTAS_FILTER */
>>> +
>>>   int rtas_service_present(const char *service)
>>>   {
>>>   	return rtas_token(service) != RTAS_UNKNOWN_SERVICE;
>>> @@ -1110,6 +1127,184 @@ struct pseries_errorlog *get_pseries_errorlog(struct rtas_error_log *log,
>>>   	return NULL;
>>>   }
>>>   
>>> +#ifdef CONFIG_PPC_RTAS_FILTER
>>> +
>>> +/*
>>> + * The sys_rtas syscall, as originally designed, allows root to pass
>>> + * arbitrary physical addresses to RTAS calls. A number of RTAS calls
>>> + * can be abused to write to arbitrary memory and do other things that
>>> + * are potentially harmful to system integrity, and thus should only
>>> + * be used inside the kernel and not exposed to userspace.
>>> + *
>>> + * All known legitimate users of the sys_rtas syscall will only ever
>>> + * pass addresses that fall within the RMO buffer, and use a known
>>> + * subset of RTAS calls.
>>> + *
>>> + * Accordingly, we filter RTAS requests to check that the call is
>>> + * permitted, and that provided pointers fall within the RMO buffer.
>>> + * The rtas_filters list contains an entry for each permitted call,
>>> + * with the indexes of the parameters which are expected to contain
>>> + * addresses and sizes of buffers allocated inside the RMO buffer.
>>> + */
>>> +struct rtas_filter {
>>> +	const char name[32];
>> 
>> Using a const char * for the name would be more typical, meaning the
>> strings would end up in .rodata, and could be merged with other uses of
>> the same strings.
>
> Will fix
>
>> 
>>> +
>>> +	/* Indexes into the args buffer, -1 if not used */
>>> +	int rmo_buf_idx1;
>>> +	int rmo_size_idx1;
>>> +	int rmo_buf_idx2;
>>> +	int rmo_size_idx2;
>> 
>> The "rmo" prefix is probably unnecessary?
>> 
>
> Ack
>
>>> +};
>>> +
>>> +struct rtas_filter rtas_filters[] = {
>> 
>> Should be static, and __ro_after_init ?
>> 
>>> +	{ "ibm,activate-firmware", -1, -1, -1, -1 },
>> 
>> Would it be worth making the indices 1-based, allowing 0 to be the
>> unused value, meaning you only have to initialise the used fields?
>
> 1-based array indices are morally reprehensible. It would make it 
> cleaner but I kind of prefer an obvious and clear constant for unused, idk
>
>> It would require adjusting them before use, but there's only 4 places
>> they're used, and you could probably use a macro to do the - 1.
>> 
>>> +	{ "ibm,configure-connector", 0, -1, 1, -1 },	/* Special cased, size 4096 */
>> 
>> Does it make sense to put the hard coded sizes in the structure as well?
>> 
>> eg. fixed_size1 = 4096,
>> 
>> I think that would avoid the need for any strcmps in the code.
>
> Not quite - we still have a special case for ibm,configure-connector 
> passing a base address of 0.
>
> But yes that's a good idea.
>
>> 
>>> +	{ "display-character", -1, -1, -1, -1 },
>>> +	{ "ibm,display-message", 0, -1, -1, -1 },
>>> +	{ "ibm,errinjct", 2, -1, -1, -1 },		/* Fixed size of 1024 */
>>> +	{ "ibm,close-errinjct", -1, -1, -1, -1 },
>>> +	{ "ibm,open-errinct", -1, -1, -1, -1 },
>>> +	{ "ibm,get-config-addr-info2", -1, -1, -1, -1 },
>>> +	{ "ibm,get-dynamic-sensor-state", 1, -1, -1, -1 },
>>> +	{ "ibm,get-indices", 2, 3, -1, -1 },
>>> +	{ "get-power-level", -1, -1, -1, -1 },
>>> +	{ "get-sensor-state", -1, -1, -1, -1 },
>>> +	{ "ibm,get-system-parameter", 1, 2, -1, -1 },
>>> +	{ "get-time-of-day", -1, -1, -1, -1 },
>>> +	{ "ibm,get-vpd", 0, -1, 1, 2 },
>>> +	{ "ibm,lpar-perftools", 2, 3, -1, -1 },
>>> +	{ "ibm,platform-dump", 4, 5, -1, -1 },
>>> +	{ "ibm,read-slot-reset-state", -1, -1, -1, -1 },
>>> +	{ "ibm,scan-log-dump", 0, 1, -1, -1 },
>>> +	{ "ibm,set-dynamic-indicator", 2, -1, -1, -1 },
>>> +	{ "ibm,set-eeh-option", -1, -1, -1, -1 },
>>> +	{ "set-indicator", -1, -1, -1, -1 },
>>> +	{ "set-power-level", -1, -1, -1, -1 },
>>> +	{ "set-time-for-power-on", -1, -1, -1, -1 },
>>> +	{ "ibm,set-system-parameter", 1, -1, -1, -1 },
>>> +	{ "set-time-of-day", -1, -1, -1, -1 },
>>> +	{ "ibm,suspend-me", -1, -1, -1, -1 },
>>> +	{ "ibm,update-nodes", 0, -1, -1, -1 },		/* Fixed size of 4096 */
>>> +	{ "ibm,update-properties", 0, -1, -1, -1 },	/* Fixed size of 4096 */
>>> +	{ "ibm,physical-attestation", 0, 1, -1, -1 },
>>> +};
>>> +
>>> +static void dump_rtas_params(int token, int nargs, int nret,
>>> +			     struct rtas_args *args)
>>> +{
>>> +	int i;
>>> +	char *token_name = rtas_token_name(token);
>>> +
>>> +	pr_err_ratelimited("sys_rtas: token=0x%x (%s), nargs=%d, nret=%d (called by %s)\n",
>>> +			   token, token_name ? token_name : "unknown", nargs,
>>> +			   nret, current->comm);
>>> +	pr_err_ratelimited("sys_rtas: args: ");
>>> +
>>> +	for (i = 0; i < nargs; i++) {
>>> +		u32 arg = be32_to_cpu(args->args[i]);
>>> +
>>> +		pr_cont("%08x ", arg);
>>> +		if (arg >= rtas_rmo_buf &&
>>> +		    arg < (rtas_rmo_buf + RTAS_RMOBUF_MAX))
>>> +			pr_cont("(buf+0x%lx) ", arg - rtas_rmo_buf);
>>> +	}
>> 
>> This can leak the location of the RMO buf into dmesg. I know it's
>> visible via /proc, but the /proc file is 0400.
>> 
>> So I think it's probably safer if we just don't dump the args, or their
>> relation to the RMO buf.
>
> Good point, removed.
>
>> 
>>> +
>>> +	pr_cont("\n");
>>> +}
>>> +
>>> +static bool in_rmo_buf(u32 base, u32 end)
>>> +{
>>> +	return base >= rtas_rmo_buf &&
>>> +		base < (rtas_rmo_buf + RTAS_RMOBUF_MAX) &&
>>> +		base <= end &&
>>> +		end >= rtas_rmo_buf &&
>>> +		end < (rtas_rmo_buf + RTAS_RMOBUF_MAX);
>>> +}
>>> +
>>> +static bool block_rtas_call(int token, int nargs,
>>> +			    struct rtas_args *args)
>>> +{
>>> +	int i;
>>> +	const char *reason;
>>> +	char *token_name = rtas_token_name(token);
>> 
>> This code isn't particularly performance critical, but I think it would
>> be cleaner to do the token lookup once at init time, and store the token
>> in the filter array?
>> 
>> Then this code would only be doing token comparisons.
>
> Yeah that would be cleaner, can get rid of rtas_token_name().

I'm not sure I quite understand what you're suggesting.

You still need to do a string->token lookup at least once as the tokens
differ between PowerVM and qemu. Are you saying that you can fold the
token name lookup into the init function?

Kind regards,
Daniel

>> 
>>> +
>>> +	if (!token_name)
>>> +		goto err_notpermitted;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
>>> +		struct rtas_filter *f = &rtas_filters[i];
>>> +		u32 base, size, end;
>>> +
>>> +		if (strcmp(token_name, f->name))
>>> +			continue;
>>> +
>>> +		if (f->rmo_buf_idx1 != -1) {
>>> +			base = be32_to_cpu(args->args[f->rmo_buf_idx1]);
>>> +			if (f->rmo_size_idx1 != -1)
>>> +				size = be32_to_cpu(args->args[f->rmo_size_idx1]);
>>> +			else if (!strcmp(token_name, "ibm,errinjct"))
>>> +				size = 1024;
>>> +			else if (!strcmp(token_name, "ibm,update-nodes") ||
>>> +				 !strcmp(token_name, "ibm,update-properties") ||
>>> +				 !strcmp(token_name, "ibm,configure-connector"))
>>> +				size = 4096;
>>> +			else
>>> +				size = 1;
>>> +
>>> +			end = base + size - 1;
>>> +			if (!in_rmo_buf(base, end)) {
>>> +				reason = "address pair 1 out of range";
>> 
>> I don't think we need to give the user this much detail about what they
>> did wrong, all cases can just print "call not permitted" IMO.
>
> Ack
>
> -- 
> Andrew Donnellan              OzLabs, ADL Canberra
> ajd@linux.ibm.com             IBM Australia Limited
