Return-Path: <linuxppc-dev+bounces-16601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I54BVWhg2kLqQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 20:43:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5FCEC2CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 20:43:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5rPD4Rxgz2xpk;
	Thu, 05 Feb 2026 06:43:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770234192;
	cv=none; b=SsiToHzRVM0Fy4hqcO9nipnNzA58C0pMAnwbuH+1GaqeB5MSG4xZwNmfNyA4F6vQMvexjKdGh4Lqpsyt4AYgcaqe6KCPEQKmuD/WKtDg9LGgckYwD/LO3yhwEkkIObr6tdjDy+MnD7zKEmiYPI/vopc/0K6tq6WxUFYjnhSfTDX6VFyeR63zmfUDkgth7t6aHSI7yPDFIvCw2Eicx9oP61PJyr/mq2YMecGbtBQ3f+P2k/axTdOmNP553IF+58jyMJz5WE5giQqTQuPBHmeqKzYovXdJyuiAXXNYlmQo/wh+rn4qs8eZy2ehVThtf7rwfDkp37L/soTz2D+Epn36BA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770234192; c=relaxed/relaxed;
	bh=oTx1Wv1rnyMmhoPSFL6Vou1DUALgAtGwKrg7q/8IfW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbm7x/vW9lpRbuOr+TMdhVFoWfGTQ3TIWVbOz3iRuzhbHpiIn1juGDPRtkkb67w+VNXWzhLNukq1VKyYanPGUCI1iaT3Ivouc7qLUlivmV99YNZlLvUxHIVZgMzwf9fH6fVd8rqMyYzdewXniOtbSA3rmT8J8BzxPuyHB5V+0vqw5sulcWYVVORUu7diX44CLQl5BzDjR5F4iPIPaJZD5BYVhB2FHUNvkGfHk2GC+hDYzKInDV8pLOcFYnumBCV/bs1cgrOAbGIyYgtkNsqv5IxUztpd06u+KuUj+FzAuix2tYOmzcFhH4wTZ6iuBRL2oCC8Qo+d0qElCgZ5ioQQrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dSv2Kga3; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dSv2Kga3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5rPC3gkNz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 06:43:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAF9A600AA;
	Wed,  4 Feb 2026 19:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEF5C4CEF7;
	Wed,  4 Feb 2026 19:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770234187;
	bh=klGJQDFpIQV+UTYw0N8RiEabthirIWJ6NTj5RFvTcAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dSv2Kga3O5StdZaXYpy2wAMTZiJBJ3cW9BJK4ndKqLIqWHqoJ0bKfqIrtKnWBOgdZ
	 m6KUDkvDpUOj+mkMDvJ6+6Arvhir5KGds+Y2fyo+wVh6+xLsRPd+ogy4Lx5eldR1F5
	 ap0uKDG+QAYSfBNoPZI1WljOT83dFUVtqNg8BN22967y03IlbKfyV0hJtSSFFVrM/J
	 bJTd/foYa83vign1Sa2VxF8JC/nMywQRzoZTIeMraB6pEKnSfTVr8RiC+pT61FP92F
	 19FzydgB6gcx2yhQqapE5v/e+lKSI2SM0/iA86zs6JUUbbo6Pr6CjZMGsoRJZ1XOq3
	 pnfo6+HEqtzVw==
Message-ID: <58845ef3-e781-42d1-bb7e-199b421ff476@kernel.org>
Date: Wed, 4 Feb 2026 20:42:58 +0100
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
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
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
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
 <aYOCWHF4CwzDVPuA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <aYOCWHF4CwzDVPuA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
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
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16601-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linkmauve.fr];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,infradead.org,akamai.com,goodmis.org,lists.ozlabs.org,lists.linux.dev,heyquark.com,gmx.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: AD5FCEC2CE
X-Rspamd-Action: no action



Le 04/02/2026 à 18:33, Mukesh Kumar Chaurasiya a écrit :
> [Vous ne recevez pas souvent de courriers de mkchauras@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
>> For now only Big Endian 32-bit PowerPC is supported, as that is the only
>> hardware I have.  This has been tested on the Nintendo Wii so far, but I
>> plan on also using it on the GameCube, Wii U and Apple G4.
>>
>> These changes aren’t the only ones required to get the kernel to compile
>> and link on PowerPC, libcore will also have to be changed to not use
>> integer division to format u64, u128 and core::time::Duration, otherwise
>> __udivdi3() and __umoddi3() will have to be added.  I have tested this
>> change by replacing the three implementations with unimplemented!() and
>> it linked just fine.
>>
> Hey Link,
> I sent a patch with ppc64le support.
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20260204042417.83903-1-mkchauras%40gmail.com%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C9033c0c08e1142c26cc408de6420675d%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639058287509811601%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=LglEn8yJoYUcsXoENa8HO4SsOW4kKU397kDNVyfBilg%3D&reserved=0
> 
> Can i take this patch and put ppc64le support over it and send it out?

Could also one of you feed https://github.com/linuxppc/issues/issues/451 ?

Thanks
Christophe

> 
> Regards,
> Mukesh
>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>> ---
>>   Documentation/rust/arch-support.rst   |  1 +
>>   arch/powerpc/Kconfig                  |  1 +
>>   arch/powerpc/Makefile                 |  2 ++
>>   arch/powerpc/include/asm/jump_label.h | 16 ++++++++++------
>>   rust/Makefile                         |  4 +++-
>>   scripts/generate_rust_target.rs       | 10 ++++++++++
>>   6 files changed, 27 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
>> index 6e6a515d0899..70b9e192a7a0 100644
>> --- a/Documentation/rust/arch-support.rst
>> +++ b/Documentation/rust/arch-support.rst
>> @@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
>>   ``arm``        Maintained        ARMv7 Little Endian only.
>>   ``arm64``      Maintained        Little Endian only.
>>   ``loongarch``  Maintained        \-
>> +``powerpc``    Maintained        32-bit Big Endian only.
>>   ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>>   ``um``         Maintained        \-
>>   ``x86``        Maintained        ``x86_64`` only.
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 9537a61ebae0..17db23b82e91 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -283,6 +283,7 @@ config PPC
>>        select HAVE_REGS_AND_STACK_ACCESS_API
>>        select HAVE_RELIABLE_STACKTRACE
>>        select HAVE_RSEQ
>> +     select HAVE_RUST                        if PPC32
>>        select HAVE_SAMPLE_FTRACE_DIRECT        if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>>        select HAVE_SAMPLE_FTRACE_DIRECT_MULTI  if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>>        select HAVE_SETUP_PER_CPU_AREA          if PPC64
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index a58b1029592c..9fd82c75dcbd 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -61,6 +61,8 @@ else
>>   KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>>   endif
>>
>> +KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
>> +
>>   ifdef CONFIG_CPU_LITTLE_ENDIAN
>>   KBUILD_CPPFLAGS      += -mlittle-endian
>>   KBUILD_LDFLAGS       += -EL
>> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
>> index d4eaba459a0e..238f0f625a36 100644
>> --- a/arch/powerpc/include/asm/jump_label.h
>> +++ b/arch/powerpc/include/asm/jump_label.h
>> @@ -15,14 +15,18 @@
>>   #define JUMP_ENTRY_TYPE              stringify_in_c(FTR_ENTRY_LONG)
>>   #define JUMP_LABEL_NOP_SIZE  4
>>
>> +/* This macro is also expanded on the Rust side. */
>> +#define ARCH_STATIC_BRANCH_ASM(key, label)           \
>> +     "1:\n\t"                                        \
>> +     "nop # arch_static_branch\n\t"                  \
>> +     ".pushsection __jump_table,  \"aw\"\n\t"        \
>> +     ".long 1b - ., " label " - .\n\t"               \
>> +      JUMP_ENTRY_TYPE key " - .\n\t"                 \
>> +      ".popsection \n\t"
>> +
>>   static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>>   {
>> -     asm goto("1:\n\t"
>> -              "nop # arch_static_branch\n\t"
>> -              ".pushsection __jump_table,  \"aw\"\n\t"
>> -              ".long 1b - ., %l[l_yes] - .\n\t"
>> -              JUMP_ENTRY_TYPE "%c0 - .\n\t"
>> -              ".popsection \n\t"
>> +     asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>>                 : :  "i" (&((char *)key)[branch]) : : l_yes);
>>
>>        return false;
>> diff --git a/rust/Makefile b/rust/Makefile
>> index 5c0155b83454..377e6fd68524 100644
>> --- a/rust/Makefile
>> +++ b/rust/Makefile
>> @@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>>        -fno-inline-functions-called-once -fsanitize=bounds-strict \
>>        -fstrict-flex-arrays=% -fmin-function-alignment=% \
>>        -fzero-init-padding-bits=% -mno-fdpic \
>> -     --param=% --param asan-% -fno-isolate-erroneous-paths-dereference
>> +     --param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
>> +     -ffixed-r2 -mmultiple -mno-readonly-in-sdata
>>
>>   # Derived from `scripts/Makefile.clang`.
>>   BINDGEN_TARGET_x86   := x86_64-linux-gnu
>>   BINDGEN_TARGET_arm64 := aarch64-linux-gnu
>>   BINDGEN_TARGET_arm   := arm-linux-gnueabi
>>   BINDGEN_TARGET_loongarch     := loongarch64-linux-gnusf
>> +BINDGEN_TARGET_powerpc       := powerpc-linux-gnu
>>   BINDGEN_TARGET_um    := $(BINDGEN_TARGET_$(SUBARCH))
>>   BINDGEN_TARGET               := $(BINDGEN_TARGET_$(SRCARCH))
>>
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
>>       } else if cfg.has("RISCV") {
>>           if cfg.has("64BIT") {
>>               panic!("64-bit RISC-V uses the builtin rustc riscv64-unknown-none-elf target");
>> --
>> 2.52.0
>>
> 


