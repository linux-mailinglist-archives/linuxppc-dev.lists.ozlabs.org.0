Return-Path: <linuxppc-dev+bounces-4799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D27C5A0521F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 05:34:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSZnm2XkDz2ykT;
	Wed,  8 Jan 2025 15:34:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736310876;
	cv=none; b=mmR4hHwo8FI+nTXGmOOfpWrCI48N/ZQGTvC3txiVIUsp92LdUGWXpq0XWX0uH7Jd4aa81Tam35STtg6bPKtOXvlowobXGFy8xVhpJ7xCGnsYXp7q9gTBj1g/1DfUrRXkAMp0eyhu5HIoo6rXiBrBAFxF6tbu/KYV+obyMVeS0gYo0IC+ORt2gChKhJvCFGcNl2ALGzEFN9lzfHYMZJYYIBZSElZIAGFLxCph0yAirSfR3EWyM4pCqYMnSy27XsgBDdWjpRMCNFBOaH81le/21zCrqMLuxKs9TOfNgSnD2zokDcjASuYsBIfY6u9L8dq8BUuPKi9GI7Asldd1lKbJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736310876; c=relaxed/relaxed;
	bh=l5qyePdTQsadGlhhkm88UTLOJyB05IwMsFPhm2KKy5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUGqlYRfdWsxH0adZnK4rAIgr3CHud44w8Tchr7LXdGrLIMmh4fGEyvbVatpXL2cNwcFLRSimgE1/gxKP38LWbpYh8h9dP9HIcE9jYnh3blPtv2PmqMxo8YV2UFD39zKXdGTBDmxy9mR1tUuoti0RmIO+6+IxbRaJXcp/d2stGlI+9lZOwX5upbpvL3pyPlpqw/blFdDJGR7jobmQXRWmTiZYZlQbp8rXrdY2H7OvR9QdHSwHbWJk5i/PPWBQ2OBKEcD1s2jloRUCJ/cZBDbwCWiu4MPavoZmwMxmESQ6DtpAWvW9/wJFmLBjxX1k43lCF/4OB7n+Gl30m46bh7T6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=zS6k4I7h; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=zS6k4I7h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSZnk2w4dz2yNn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 15:34:33 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso18431454a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 20:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736310871; x=1736915671; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5qyePdTQsadGlhhkm88UTLOJyB05IwMsFPhm2KKy5k=;
        b=zS6k4I7h99255QQjDNWrp6Jwr4cqBjTsQ4ZTVJ7KKdipwfpYJ3llMFo6cKam1URHFv
         ICKWDF1+0THKstecPwn/Q1cLaq5/tIwiPIYSSZ4R9++jZF2Pr/1ilrYWp+vfUfAZiOCD
         tJwO7kfUqGTY1m/KX7AcT80wx6iJNQXVGZZt7xpRE9X+qfNy2+ROSxZ/GQnOsABzsvcX
         NrRdEYRsRIARBE0nduYed1kNVaqlNABw4/+hcy0j/oZ06wN4WFdAFT6HGmxzjuxvOfiP
         oecZ154ymO1cC1QK7W68Aucgw4/FfEFunzzdw938ghjK9DqVcvA7ggud9CPdWJOng1rm
         bdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736310871; x=1736915671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5qyePdTQsadGlhhkm88UTLOJyB05IwMsFPhm2KKy5k=;
        b=QHf6o3Kysk2POagkgq3EJOMOrrKzgUvz++3TmWAT3nerc4khIDtUOjfK+TJ90Wb4fp
         UKn/G0rT8QEgWJIYgCSwDEJWzrbD/v9OuK22m9GTPsJXAys7s6l0FbSm42Z/+8DDg0SA
         rZz9kbHfCiMXdRRWaMO3uacSBlyvQkdDEMXVNp9FHzE/lIS+2Qz8AzsbJe4M0dY0lrd/
         +fr3ihX69zcuZBR2GiKDBHwW4TMzCaTuTXlnyB9sDzI4h+6jeeMAHSILlNG55HVDPxkv
         XZQp723A2nWymsvjWlrBq+eiLFd1YX+abLuefobMiiUrdRXUgrinv999pLqqZ8YMFDpL
         ssIw==
X-Forwarded-Encrypted: i=1; AJvYcCWObqFzjWhKVyJIicgLtMoj3ybfaFyy11HxU1RH5jFIAk9gWwigpskg4MuVoHADhp31c5HNghfEK1BIrh8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwTp80C1TUDzPPIk+AA5qbG6E4Xp1eJezAeerkDATAIzoRp0TNH
	nizOQTVfv6oTXr33/GxGFN1tIMg4L5b44DaBa9/Dbc7HntK7NX79hCIdBhvN7xE=
X-Gm-Gg: ASbGnctMnE3YdmFkjO3YZjIj4JCpoq3kdln/GU4MLwSDzdJvWyZ2HzTrViLL7golmlE
	s/OWA42DZO/P4wuvIpk0M62aHuzA2aQ29pI/HXiRHNEtlo5WzOlcVU3CVGxYtQgA7Dsg61T5Szf
	HbZkUU3qLmRlG+QbxCQsytHn+bdxGaWUWKxcEqGbqNov+ANMqOqc/CsQUqMwSV2HluvnRsGcl/1
	O8f+MgiQUZWM4kH3PssFRGiCuu+z4XakmIoMZf1tke31aW47GYYUc+BpijxLbKLRCg=
X-Google-Smtp-Source: AGHT+IGQRKZLowOpLDJxDKDC4Zdlnk/imeV0cILJj+G12S7tUJ9/SfK9Sf0wRtST8EIlv//HMUuIqA==
X-Received: by 2002:a17:90b:3bc4:b0:2f4:43ce:dcea with SMTP id 98e67ed59e1d1-2f548f1edafmr2196020a91.25.1736310871016;
        Tue, 07 Jan 2025 20:34:31 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a34d91bsm448853a91.32.2025.01.07.20.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 20:34:30 -0800 (PST)
Message-ID: <2c6f2c95-b2fc-46e0-91ce-1b9f14b28d3d@daynix.com>
Date: Wed, 8 Jan 2025 13:34:24 +0900
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] binfmt_elf: Use note name macros
To: Dave Martin <Dave.Martin@arm.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, kexec@lists.infradead.org,
 binutils@sourceware.org, devel@daynix.com
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
 <20250107-elf-v3-2-99cb505b1ab2@daynix.com>
 <Z31T0dMgMucke5KS@e133380.arm.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <Z31T0dMgMucke5KS@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/01/08 1:18, Dave Martin wrote:
> On Tue, Jan 07, 2025 at 09:45:53PM +0900, Akihiko Odaki wrote:
>> Use note name macros to match with the userspace's expectation.
> 
> Also (and more importantly) get rid of duplicated knowledge about the
> mapping of note types to note names, so that elf.h is the authoritative
> source of this information?
> 
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Acked-by: Baoquan He <bhe@redhat.com>
>> ---
>>   fs/binfmt_elf.c       | 21 ++++++++++-----------
>>   fs/binfmt_elf_fdpic.c |  8 ++++----
>>   2 files changed, 14 insertions(+), 15 deletions(-)
>>
>> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
>> index 106f0e8af177..5b4a92e5e508 100644
>> --- a/fs/binfmt_elf.c
>> +++ b/fs/binfmt_elf.c
> 
> [...]
> 
>> @@ -1538,7 +1538,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
>>   	do
>>   		i += 2;
>>   	while (auxv[i - 2] != AT_NULL);
>> -	fill_note(&auxv_note, "CORE", NT_AUXV, i * sizeof(elf_addr_t), auxv);
>> +	fill_note(&auxv_note, NN_AUXV, NT_AUXV, i * sizeof(elf_addr_t), auxv);
>>   	thread_status_size += notesize(&auxv_note);
>>   
>>   	offset = sizeof(*elf);				/* ELF header */
> 
> Looking at this code, it appears that the right name is explicitly
> taken from elf.h for a few specific notes, but for those that are
> specified by the arch code (e.g., in struct user_regset entries) the
> name is still guessed locally:
> 
> static int fill_thread_core_info(...) {
> 
> ...
> 
> 	fill_note(&t->notes[note_iter], is_fpreg ? "CORE" : "LINUX",
> 		note_type, ret, data);
> 
> 
> It would be preferable to clean this up if we want elf.h to be the
> authoritative source for the names.

If we want elf.h to be the authoritative source, yes, but I like the 
current form as it ensures nobody adds a note with a name different from 
"LINUX" and it is also simpler. There is a trade-off so I'd like to keep 
the current form unless anyone has a strong preference for one option.

Regards,
Akihiko Odaki

> 
> It would be possible to add a .core_note_name entry in struct
> user_regset, and define a helper macro to populate the note type and
> name, something like the following:
> 
> struct user_regset {
> 	...
> 	unsigned int core_note_type;
> +	unsigned int core_note_name;
> };
> 
> #define USER_REGSET_NOTE_TYPE(type) \
> 	.core_note_type = NT_ ## type, \
> 	.core_note_name = NN_ ## name,
> 
> ...and then replace every .core_note_type assignment with an invocation
> of this macro.  A quick git grep should easily find all the affected
> cases.
> 
> 
> Alternatively, as discussed in the last review round, a helper could
> be defined to get the name for a note type:
> 
> const char *elf_note_name(int Elf32_Word n_type)
> {
> 	switch (n_type) {
> 	case NT_PRSTATUS:	return NN_PRSTATUS;
> 	case NT_PRFPREG:	return NN_PRFPREG;
> 	/* ...and all the rest..., then: */
> 
> 	default:
> 		WARN();
> 		return "LINUX";
> 	}
> }
> 
> This avoids the caller having to specify the name explicitly, but only
> works if all the n_type values are unique for the note types that Linux
> knows about (currently true).
> 
> Experimenting with this shows that GCC 11.4.0 (for example) doesn't do
> a very good job with this switch, though, and it requires building
> knowledge about irrelevant arch-specific note types into every kernel.
> I think that extending struct user_regset is probably the better
> approach -- though other people may disagree.
> 
> Cheers
> ---Dave


