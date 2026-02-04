Return-Path: <linuxppc-dev+bounces-16594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFilM6Z/g2nNnwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 18:19:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D689AEAF17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 18:19:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5nCR1Kx8z2xpk;
	Thu, 05 Feb 2026 04:19:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770225571;
	cv=none; b=E3lBjQnfzhGjtj3anCLV3TrAUe1Wign++of0uN4HSMR326+4qszbe7UKFWZoYGLKw9ZJ3FNmkdlvYIZyk/Wg1uM2MELrc1Um8QbWW9B63cCMhqDOpnZJUJWtenxs0ed0Sv/HCb6jIwvdG1ulCo2PH8VTB5LeyH0aeVtVzKWNHo3kCO5TjXmAOQUer7GkvHjQuQcrxqbPASs8Xprrwk1KkC/dMIWW6bS609Hrf7ASsx3dgsEQoQIY65Fh/0XiduFjbqrThmrnhwwKMWrA1oBUeSd/ag2/fbOo74S96Q60Stbuxg6Ewmv5+EA/idYHlGr6MKKzulFPKwrPvWy/Gu15+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770225571; c=relaxed/relaxed;
	bh=w4Mmcg/mTBkKnYhg9EeUnZ86Twbt2RoOxtFB04MrLYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlKwGHegySkERzRv2tgVip1ShqZ3k7WERz8A4CU0cQM9y16ORwP/1OACRewLyTQDiESEZzldVebpPXHHvphqsNwvTyhTpJ1PdA4iPp4xQuBTBYS3bznvU+vtJetNRYpj6HylnJSK70Yviq3fuUwHRO6MQtxYJdc5LkNE0kErWb+7mKAaI2RqvAgzqmeBS5tvEGGazKcTNIe6NuEUFsKhSMp5s4tIJpJvx1EkdAh9kdVWK2FNpLQ7ytoWn4rVZNC6XIMTbTHdXeaI4iNQslqjqbxhw3c7V8D0weuD54ABuenPJkbsX4gvokjN/RjB9edTyNls1Jt8fVBpQHZvXamIQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mr0Pw4cU; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mr0Pw4cU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5nCQ2YM8z2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 04:19:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AF1F4181A;
	Wed,  4 Feb 2026 17:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7599C4CEF7;
	Wed,  4 Feb 2026 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770225568;
	bh=DtHe0dwbusnQaV94dHwbXq/wTSKOEey/tmCSKDwj+wo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mr0Pw4cU9VKIf49Cx5IUekaRAaaJWcVfy4cr6IfmgolfGJgwarXwi7+W2mtY0mUFz
	 T8SUfyk5vmnZi4h84W19N6J6mA0lHMAsnaT54R3ayxcS3w4OMilo/hjFL7mRLQNc4u
	 o/8kHtDxD1wuOvAtf1OQbEoSi4aPLhL25djAeuIXxw7OzbBT9hTh2jiGXBqlaWaEns
	 RL9npkDq+LWQ582cE7X6G+kjwXQ5BDI8U7swO4T9ZbNhNo5PD5CNI7MZ4rFjVB8nZD
	 0Ql3r/znHtrsNeVVmcvfvWw/ZXmJkryBPyN+Mseo8R4zN2I0wiY9lZvVWYnaD7XbgE
	 l4uDcnF4SFtWw==
Message-ID: <6a4799d9-48fe-410e-acad-fe687edebc7e@kernel.org>
Date: Wed, 4 Feb 2026 18:19:19 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Add PowerPC support
To: Alice Ryhl <aliceryhl@google.com>, Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
 officialTechflashYT@gmail.com, Ash Logan <ash@heyquark.com>,
 Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
 <aYMiXcy33YEVkgYM@google.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <aYMiXcy33YEVkgYM@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16594-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:mkchauras@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,infradead.org,akamai.com,goodmis.org,google.com,lists.ozlabs.org,lists.linux.dev,heyquark.com,gmx.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D689AEAF17
X-Rspamd-Action: no action



Le 04/02/2026 à 11:41, Alice Ryhl a écrit :
> On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
>> For now only Big Endian 32-bit PowerPC is supported, as that is the only
>> hardware I have.  This has been tested on the Nintendo Wii so far, but I
>> plan on also using it on the GameCube, Wii U and Apple G4.
> 
> Super cool!
> 
>> These changes aren’t the only ones required to get the kernel to compile
>> and link on PowerPC, libcore will also have to be changed to not use
>> integer division to format u64, u128 and core::time::Duration, otherwise
>> __udivdi3() and __umoddi3() will have to be added.  I have tested this
>> change by replacing the three implementations with unimplemented!() and
>> it linked just fine.
> 
> Uh oh this seems tricky. How is this not a problem on arm32 too?
> 
> Perhaps we should just be providing __udivdi3() and __umoddi3() in
> general?

We don't want those functions in the kernel as they are sub-optimal and 
unnecessary. Usually the kernel needs can be covered with do_div() or 
other functions in include/asm-generic/div64.h. If we add those 
functions people will start doing divides blindly in the kernel 
forgetting the huge cost a 64 bits divide has on a 32 bits processor.

> 
>> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
>> index d4eaba459a0e..238f0f625a36 100644
>> --- a/arch/powerpc/include/asm/jump_label.h
>> +++ b/arch/powerpc/include/asm/jump_label.h
>> @@ -15,14 +15,18 @@
>>   #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
>>   #define JUMP_LABEL_NOP_SIZE	4
>>   
>> +/* This macro is also expanded on the Rust side. */
>> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
>> +	"1:\n\t"					\
>> +	"nop # arch_static_branch\n\t"			\
>> +	".pushsection __jump_table,  \"aw\"\n\t"	\
>> +	".long 1b - ., " label " - .\n\t"		\
>> +	 JUMP_ENTRY_TYPE key " - .\n\t"			\
>> +	 ".popsection \n\t"
>> +

Would be better split in two with a JUMP_TABLE_ENTRY() macro as other 
architectures and as done by Mukesh in its patch, see 
https://lore.kernel.org/r/20260204042417.83903-1-mkchauras@gmail.com

>>   static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>>   {
>> -	asm goto("1:\n\t"
>> -		 "nop # arch_static_branch\n\t"
>> -		 ".pushsection __jump_table,  \"aw\"\n\t"
>> -		 ".long 1b - ., %l[l_yes] - .\n\t"
>> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
>> -		 ".popsection \n\t"
>> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>>   		 : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
> In case this patch takes a long time to land, it may make sense to split
> this part out in a separate patch that can land now.
> 
> Also, consider pre-emptively updating arch_static_branch_jump too. We
> probably need it at some point in the future.
> 
>> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
>> index 38b3416bb979..0054880ba0ea 100644
>> --- a/scripts/generate_rust_target.rs
>> +++ b/scripts/generate_rust_target.rs
>> @@ -188,6 +188,16 @@ fn main() {
>>           panic!("arm uses the builtin rustc target");
>>       } else if cfg.has("ARM64") {
>>           panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
>> +    } else if cfg.has("PPC32") {
>> +        ts.push("arch", "powerpc");
>> +        ts.push("data-layout", "E-m:e-p:32:32-Fn32-i64:64-n32");
>> +        ts.push("features", "+soft-float");
>> +        ts.push("llvm-target", "powerpc-unknown-eabi");
>> +        if cfg.rustc_version_atleast(1, 91, 0) {
>> +            ts.push("target-pointer-width", 32);
>> +        } else {
>> +            ts.push("target-pointer-width", "32");
>> +        }
> 
> Is there no built-in target we can use? I think we want to avoid adding
> new targets if at all possible.
> 
> Alice


