Return-Path: <linuxppc-dev+bounces-17578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOK0KO32pmmgawAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 15:57:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBBF1F1E30
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 15:57:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQJnN1q17z3bnr;
	Wed, 04 Mar 2026 01:57:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772549864;
	cv=none; b=kqS1bmgSp9PBMXNvd1RN6Yeg6qVRxymGLc04lF2VOlEE9Dm4ki2cbqq6GYEpziXVoZeDiMJbVWsZ9TT3YgMLs/Sfm026874q3Tk4NmGzqsElmGnrITpdTmc/ksYU0Qhr9mnNa2h6evbUv6MVoxviZb3ZPDXUmKq+T7+w/k6vSkL4PS09fBsmhb19Qy+DKdlzt6/OTcsd61oKmHS6e/znYwYqQLBIomxj7PoDhmEhhSUFCAlptfzpWWuHI1CuFbhP1pbVkiECpD52Sy9eM/ZFdZ7gIPJlLfEUaUXXVbxvwQ6Hm2PGGpIDYkVkYmds8EfqHOzJQdxDZH7jn+1HBVLiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772549864; c=relaxed/relaxed;
	bh=i3M1r/hadlUciHoIiadzHGBjuk3xL1BgSDkBQwE8778=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAjTxIikzF7FIMcf9jyzLtGljDtRPa9uEssYFFvZxoi51fJq1qefkXJEqI07mNrwgHCvDrmfYNMFagf9Dva79wWWhIojt2akoOQUcR51lOCkgMRvGNLKRDDIZvuhuJPVVYW6pR7Z6UMX8hbU+wF9ZGKiZpZ2O7mnFPpZM9QG1H5UkK2CouHiehQjRHXQwH8Db0/QBSP3/Fgj4AUvoiKyUp4NKRSLp2wngpRXE5NiqOPzAH1ZKe/r2JJjQcu45K/NDBnW8qan/dmLddVxLs6qgDZv04CIIAgwV7HmbaHj6dUa+CXCmhaIhPpYIs10NF0xvjCKxX5ie1pTXfzWKuninw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V0JNKZer; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V0JNKZer;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQJnM1Nvkz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 01:57:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9E6442B06;
	Tue,  3 Mar 2026 14:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D856C19422;
	Tue,  3 Mar 2026 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772549860;
	bh=wyd2uKAEWQc+wZ8mv3uAszTdLqgFO6N7p1RFEUEYByw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V0JNKZerYkXZJ2tT1WXNhR0q2Va+X27VfxPIma/+gaNFWX84qH3BpebdMWVvC4mcB
	 oeOtR52hgRpvgk6oAhFmab1b6h/VL8R9bNE/813WPQO4wL+VYzaYzJyd/IcyeFJBzr
	 fMO1bD/bcKcXVebIkmoI4LtfeDJtGzCQEL7j2+KJkvmvzLhLqF9e3xnx4/unW7odZj
	 LDMzdljLom6goDTHisjreY/WIsYGsesEiInKq+v14jQPQHjrTk30c0KU/AfuWtqXbs
	 CppSOkQ41qT/eGpVKWGr74TCirnvn3SIhlDevOjs4eW6M8vIdHE6tF6C4RQKUputVp
	 4gXKehDvX1Plw==
Message-ID: <65abe055-38b4-44ec-a7a0-7b4161677ead@kernel.org>
Date: Tue, 3 Mar 2026 15:57:35 +0100
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
Subject: Re: [PATCH v2 1/2] powerpc: fix KUAP warning in VMX usercopy path
To: Sayali Patil <sayalip@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, riteshh@linux.ibm.com,
 hbathini@linux.ibm.com, ming.lei@redhat.com, csander@purestorage.com,
 czhong@redhat.com, venkat88@linux.ibm.com
References: <20260228135319.238985-1-sayalip@linux.ibm.com>
 <d90efa16-932e-4c29-b8e1-1a4ef08db403@kernel.org>
 <c5138d29-e192-4a6f-b5d2-40d3a29d5bd4@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <c5138d29-e192-4a6f-b5d2-40d3a29d5bd4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: BCBBF1F1E30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17578-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sayalip@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:sshegde@linux.ibm.com,m:riteshh@linux.ibm.com,m:hbathini@linux.ibm.com,m:ming.lei@redhat.com,m:csander@purestorage.com,m:czhong@redhat.com,m:venkat88@linux.ibm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Hi,

Le 03/03/2026 à 10:19, Sayali Patil a écrit :
> 
> On 02/03/26 16:42, Christophe Leroy (CS GROUP) wrote:
>> Hi Sayali,
>>
>> Le 28/02/2026 à 14:53, Sayali Patil a écrit :
>>> On powerpc with PREEMPT_FULL or PREEMPT_LAZY and function tracing 
>>> enabled,
>>> KUAP warnings can be triggered from the VMX usercopy path under memory
>>> stress workloads.
>>>
>>> KUAP requires that no subfunctions are called once userspace access has
>>> been enabled. The existing VMX copy implementation violates this
>>> requirement by invoking enter_vmx_usercopy() from the assembly path 
>>> after
>>> userspace access has already been enabled. If preemption occurs
>>> in this window, the AMR state may not be preserved correctly,
>>> leading to unexpected userspace access state and resulting in
>>> KUAP warnings.
>>>
>>> Fix this by restructuring the VMX usercopy flow so that VMX selection
>>> and VMX state management are centralized in raw_copy_tofrom_user(),
>>> which is invoked by the raw_copy_{to,from,in}_user() wrappers.
>>>
>>> Introduce a usercopy_mode enum to describe the copy direction
>>> (IN, FROM, TO) and use it to derive the required KUAP permissions.
>>> Userspace access is now enabled and disabled through common helpers
>>> based on the selected mode, ensuring that the correct read/write
>>> permissions are applied consistently.
>>>
>>>   The new flow is:
>>>
>>>    - raw_copy_{to,from,in}_user() calls raw_copy_tofrom_user()
>>>    - raw_copy_tofrom_user() decides whether to use the VMX path
>>>      based on size and CPU capability
>>>    - Call enter_vmx_usercopy() before enabling userspace access
>>>    - Enable userspace access as per the usercopy mode
>>>      and perform the VMX copy
>>>    - Disable userspace access as per the usercopy mode
>>>    - Call exit_vmx_usercopy()
>>>    - Fall back to the base copy routine if the VMX copy faults
>>>
>>> With this change, the VMX assembly routines no longer perform VMX state
>>> management or call helper functions; they only implement the
>>> copy operations.
>>> The previous feature-section based VMX selection inside
>>> __copy_tofrom_user_power7() is removed, and a dedicated
>>> __copy_tofrom_user_power7_vmx() entry point is introduced.
>>>
>>> This ensures correct KUAP ordering, avoids subfunction calls
>>> while KUAP is unlocked, and eliminates the warnings while preserving
>>> the VMX fast path.
>>>
>>> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace 
>>> Access Protection")
>>> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>> Closes: https://lore.kernel.org/all/20260109064917.777587-2- 
>>> sshegde@linux.ibm.com/
>>> Suggested-by: Christophe Leroy <chleroy@kernel.org>
>>> Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
>>> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
>>> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
>>> ---
>>>
>>> v1->v2
>>>    - Updated as per the review comments.
>>>    - Centralized VMX usercopy handling in __copy_tofrom_user_vmx() in
>>>      arch/powerpc/lib/vmx-helper.c.
>>>    - Introduced a usercopy_mode enum to describe the copy direction
>>>      (IN, FROM, TO) and derive the required KUAP permissions, avoiding
>>>      duplication across the different usercopy paths.
>>
>> I like the reduction of duplication you propose but I can't see the 
>> added value of that enum, what about:
>>
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/ 
>> include/asm/uaccess.h
>> index 63d6eb8b004e..14a3219db838 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -329,12 +329,6 @@ do {                                \
>>  extern unsigned long __copy_tofrom_user(void __user *to,
>>          const void __user *from, unsigned long size);
>>
>> -enum usercopy_mode {
>> -    USERCOPY_IN,
>> -    USERCOPY_FROM,
>> -    USERCOPY_TO,
>> -};
>> -
>>  unsigned long __copy_tofrom_user_vmx(void __user *to, const void 
>> __user *from,
>>                  unsigned long size, enum usercopy_mode mode);
>>
>> @@ -352,48 +346,18 @@ static inline bool will_use_vmx(unsigned long n)
>>          n > VMX_COPY_THRESHOLD;
>>  }
>>
>> -static inline void raw_copy_allow(void __user *to, enum usercopy_mode 
>> mode)
>> -{
>> -    switch (mode) {
>> -    case USERCOPY_IN:
>> -        allow_user_access(to, KUAP_READ_WRITE);
>> -        break;
>> -    case USERCOPY_FROM:
>> -        allow_user_access(NULL, KUAP_READ);
>> -        break;
>> -    case USERCOPY_TO:
>> -        allow_user_access(to, KUAP_WRITE);
>> -        break;
>> -    }
>> -}
>> -
>> -static inline void raw_copy_prevent(enum usercopy_mode mode)
>> -{
>> -    switch (mode) {
>> -    case USERCOPY_IN:
>> -        prevent_user_access(KUAP_READ_WRITE);
>> -        break;
>> -    case USERCOPY_FROM:
>> -        prevent_user_access(KUAP_READ);
>> -        break;
>> -    case USERCOPY_TO:
>> -        prevent_user_access(KUAP_WRITE);
>> -        break;
>> -    }
>> -}
>> -
>>  static inline unsigned long raw_copy_tofrom_user(void __user *to,
>>          const void __user *from, unsigned long n,
>> -        enum usercopy_mode mode)
>> +        unsigned long dir)
>>  {
>>      unsigned long ret;
>>
>>      if (will_use_vmx(n))
>>          return __copy_tofrom_user_vmx(to, from,    n, mode);
>>
>> -    raw_copy_allow(to, mode);
>> +    allow_user_access(to, dir);
>>      ret = __copy_tofrom_user(to, from, n);
>> -    raw_copy_prevent(mode);
>> +    prevent_user_access(dir);
>>      return ret;
>>
>>  }
>> @@ -403,22 +367,20 @@ static inline unsigned long
>>  raw_copy_in_user(void __user *to, const void __user *from, unsigned 
>> long n)
>>  {
>>      barrier_nospec();
>> -    return raw_copy_tofrom_user(to, from, n, USERCOPY_IN);
>> +    return raw_copy_tofrom_user(to, from, n, KUAP_READ_WRITE);
>>  }
>>  #endif /* __powerpc64__ */
>>
>>  static inline unsigned long raw_copy_from_user(void *to,
>>          const void __user *from, unsigned long n)
>>  {
>> -    return raw_copy_tofrom_user((__force void __user *)to, from,
>> -                    n, USERCOPY_FROM);
>> +    return raw_copy_tofrom_user((__force void __user *)to, from, n, 
>> KUAP_READ);
>>  }
>>
>>  static inline unsigned long
>>  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>>  {
>> -    return raw_copy_tofrom_user(to, (__force const void __user *)from,
>> -                    n, USERCOPY_TO);
>> +    return raw_copy_tofrom_user(to, (__force const void __user 
>> *)from, n, KUAP_WRITE);
>>  }
>>
>>  unsigned long __arch_clear_user(void __user *addr, unsigned long size);
>> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx- 
>> helper.c
>> index 35080885204b..4610f7153fd9 100644
>> --- a/arch/powerpc/lib/vmx-helper.c
>> +++ b/arch/powerpc/lib/vmx-helper.c
>> @@ -11,25 +11,25 @@
>>  #include <asm/switch_to.h>
>>
>>  unsigned long __copy_tofrom_user_vmx(void __user *to, const void 
>> __user *from,
>> -            unsigned long size, enum usercopy_mode mode)
>> +            unsigned long size, unsigned long dir)
>>  {
>>      unsigned long ret;
>>
>>      if (!enter_vmx_usercopy()) {
>> -        raw_copy_allow(to, mode);
>> +        allow_user_access(to, dir);
>>          ret = __copy_tofrom_user(to, from, size);
>> -        raw_copy_prevent(mode);
>> +        prevent_user_access(dir);
>>          return ret;
>>      }
>>
>> -    raw_copy_allow(to, mode);
>> +    allow_user_access(to, dir);
>>      ret = __copy_tofrom_user_power7_vmx(to, from, size);
>> -    raw_copy_prevent(mode);
>> +    prevent_user_access(dir);
>>      exit_vmx_usercopy();
>>      if (unlikely(ret)) {
>> -        raw_copy_allow(to, mode);
>> +        allow_user_access(to, dir);
>>          ret = __copy_tofrom_user_base(to, from, size);
>> -        raw_copy_prevent(mode);
>> +        prevent_user_access(dir);
>>      }
>>
>>      return ret;
>>
>>
>>
>> Christophe
>>
>>
> Hi Christophe,
> Thanks for the review.
> With the suggested change, we are hitting a compilation error.
> 
> The issue is related to how KUAP enforces the access direction.
> allow_user_access() contains:
> 
> BUILD_BUG_ON(!__builtin_constant_p(dir));
> 
> which requires that the access direction is a compile-time constant.
> If we pass a runtime value (for example, an unsigned long), the
> __builtin_constant_p() check fails and triggers the following build error.
> 
> Error:
> In function 'allow_user_access', inlined from '__copy_tofrom_user_vmx' 
> at arch/powerpc/lib/vmx-helper.c:19:3:
> BUILD_BUG_ON failed: !__builtin_constant_p(dir) 706
> 
> 
> The previous implementation worked because allow_user_access() was 
> invoked with enum
> constants (READ, WRITE, READ_WRITE), which satisfied the 
> __builtin_constant_p() requirement.
> So in this case, the function must be called with a compile-time 
> constant to satisfy KUAP.
> 
> Please let me know if you would prefer a different approach.
> 

Ah, right, I missed that. The problem should only be in vmx-helper.c

What about:

diff --git a/arch/powerpc/include/asm/uaccess.h 
b/arch/powerpc/include/asm/uaccess.h
index 63d6eb8b004e..1e05f66fa647 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -329,14 +329,8 @@ do {								\
  extern unsigned long __copy_tofrom_user(void __user *to,
  		const void __user *from, unsigned long size);

-enum usercopy_mode {
-	USERCOPY_IN,
-	USERCOPY_FROM,
-	USERCOPY_TO,
-};
-
  unsigned long __copy_tofrom_user_vmx(void __user *to, const void 
__user *from,
-				unsigned long size, enum usercopy_mode mode);
+				unsigned long size, unsigned long dir);

  unsigned long __copy_tofrom_user_base(void __user *to,
  		const void __user *from, unsigned long size);
@@ -345,55 +339,25 @@ unsigned long __copy_tofrom_user_power7_vmx(void 
__user *to,
  		const void __user *from, unsigned long size);


-static inline bool will_use_vmx(unsigned long n)
+static __always_inline bool will_use_vmx(unsigned long n)
  {
  	return IS_ENABLED(CONFIG_ALTIVEC) &&
  		cpu_has_feature(CPU_FTR_VMX_COPY) &&
  		n > VMX_COPY_THRESHOLD;
  }

-static inline void raw_copy_allow(void __user *to, enum usercopy_mode mode)
-{
-	switch (mode) {
-	case USERCOPY_IN:
-		allow_user_access(to, KUAP_READ_WRITE);
-		break;
-	case USERCOPY_FROM:
-		allow_user_access(NULL, KUAP_READ);
-		break;
-	case USERCOPY_TO:
-		allow_user_access(to, KUAP_WRITE);
-		break;
-	}
-}
-
-static inline void raw_copy_prevent(enum usercopy_mode mode)
-{
-	switch (mode) {
-	case USERCOPY_IN:
-		prevent_user_access(KUAP_READ_WRITE);
-		break;
-	case USERCOPY_FROM:
-		prevent_user_access(KUAP_READ);
-		break;
-	case USERCOPY_TO:
-		prevent_user_access(KUAP_WRITE);
-		break;
-	}
-}
-
-static inline unsigned long raw_copy_tofrom_user(void __user *to,
+static __always_inline unsigned long raw_copy_tofrom_user(void __user *to,
  		const void __user *from, unsigned long n,
-		enum usercopy_mode mode)
+		unsigned long dir)
  {
  	unsigned long ret;

  	if (will_use_vmx(n))
-		return __copy_tofrom_user_vmx(to, from,	n, mode);
+		return __copy_tofrom_user_vmx(to, from,	n, dir);

-	raw_copy_allow(to, mode);
+	allow_user_access(to, dir);
  	ret = __copy_tofrom_user(to, from, n);
-	raw_copy_prevent(mode);
+	prevent_user_access(dir);
  	return ret;

  }
@@ -403,22 +367,20 @@ static inline unsigned long
  raw_copy_in_user(void __user *to, const void __user *from, unsigned 
long n)
  {
  	barrier_nospec();
-	return raw_copy_tofrom_user(to, from, n, USERCOPY_IN);
+	return raw_copy_tofrom_user(to, from, n, KUAP_READ_WRITE);
  }
  #endif /* __powerpc64__ */

  static inline unsigned long raw_copy_from_user(void *to,
  		const void __user *from, unsigned long n)
  {
-	return raw_copy_tofrom_user((__force void __user *)to, from,
-					n, USERCOPY_FROM);
+	return raw_copy_tofrom_user((__force void __user *)to, from, n, 
KUAP_READ);
  }

  static inline unsigned long
  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
  {
-	return raw_copy_tofrom_user(to, (__force const void __user *)from,
-					n, USERCOPY_TO);
+	return raw_copy_tofrom_user(to, (__force const void __user *)from, n, 
KUAP_WRITE);
  }

  unsigned long __arch_clear_user(void __user *addr, unsigned long size);
diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
index 35080885204b..5fc6b2997158 100644
--- a/arch/powerpc/lib/vmx-helper.c
+++ b/arch/powerpc/lib/vmx-helper.c
@@ -10,26 +10,49 @@
  #include <linux/hardirq.h>
  #include <asm/switch_to.h>

+static void __allow_user_access(void __user *to, unsigned long dir)
+{
+	if (dir == KUAP_READ)
+		allow_user_access(to, KUAP_READ);
+	else if (dir == KUAP_WRITE)
+		allow_user_access(to, KUAP_WRITE);
+	else if (dir == KUAP_READ_WRITE)
+		allow_user_access(to, KUAP_READ_WRITE);
+}
+
+static void __prevent_user_access(unsigned long dir)
+{
+	if (dir == KUAP_READ)
+		prevent_user_access(KUAP_READ);
+	else if (dir == KUAP_WRITE)
+		prevent_user_access(KUAP_WRITE);
+	else if (dir == KUAP_READ_WRITE)
+		prevent_user_access(KUAP_READ_WRITE);
+}
+
  unsigned long __copy_tofrom_user_vmx(void __user *to, const void 
__user *from,
-			unsigned long size, enum usercopy_mode mode)
+			unsigned long size, unsigned long dir)
  {
  	unsigned long ret;

+	if (WARN_ON_ONCE(!dir || dir > KUAP_READ_WRITE))
+		return size;
+
  	if (!enter_vmx_usercopy()) {
-		raw_copy_allow(to, mode);
+		__allow_user_access(to, dir);
  		ret = __copy_tofrom_user(to, from, size);
-		raw_copy_prevent(mode);
+		__prevent_user_access(dir);
  		return ret;
  	}

-	raw_copy_allow(to, mode);
+	__allow_user_access(to, dir);
  	ret = __copy_tofrom_user_power7_vmx(to, from, size);
-	raw_copy_prevent(mode);
+	__prevent_user_access(dir);
  	exit_vmx_usercopy();
  	if (unlikely(ret)) {
-		raw_copy_allow(to, mode);
+		__allow_user_access(to, dir);
  		ret = __copy_tofrom_user_base(to, from, size);
-		raw_copy_prevent(mode);
+		__prevent_user_access(dir);
  	}

  	return ret;


Christophe

