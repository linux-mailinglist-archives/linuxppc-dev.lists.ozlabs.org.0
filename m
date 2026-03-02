Return-Path: <linuxppc-dev+bounces-17513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGL0DrFwpWlXAgYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 12:12:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CB31D7452
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 12:12:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPbrF19dFz3bW7;
	Mon, 02 Mar 2026 22:12:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772449965;
	cv=none; b=I2G/CInA8J0j4oG+CR8I18fu4lUJKrB6gWmiwqiPEQKiidygubkRXT0lrjXQsiG9njt/qGSKR/EeOe+L2ntJzxzWMLM43GXLo0FauMG8O+VPQeM/119R5bQCYNXIcS3OFyaOSBXkFWp8dAPZSPNilGWQbHZlsT18kPbAj7s9AbRPZo0H4v7z07T7B+Aee/PcE0ERYJnDoSIXT3p6Y1GPy6T2TtFySQL1zPr/uCfVlDuEcxrv3iNW3aLqWlSyTxVoQhW8dt8FuLOgjv14aID9GJrmYL0vxlLIe7oG9cRzWqefNxt6tFusx8PM9wNWwz/nqXFf3+oILDx+oB1eqfKQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772449965; c=relaxed/relaxed;
	bh=pZJIy+8pfiKdhqv3yhDGRB3DFQFl/Dm2/+gV89eY+4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dx1jig6P16OI2NfsCl/lqNXxEqy2RiKiWdYFryF0UnThdfZQ/v9QvQeIVMJvN7dae/veEFtQ3cKVeT/5dVChB2pX1JCvakTChqNWX/qeKKM+kubLR9gfA6i6/je+QO0vJQ4mgudwjTpR27Q+HYPKJjtnEwb8PUKz5l8H7bgJ129a0pnSSFqGKpO1p7sWNt6Mts+L7houIngcgEx0ghln9YrbupGzYtbF8C2+ZpwPrIr6/BCaeBwmNyWhHyJiwh6sOAyWgP84HRBqGG6/KAAXUH+5OUJZCK8UVpGRylddecJqAtTe8m5W0s7cTkeIAZRtCwtd5/A0lITyGL4hPe+VDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G3Hpvs/X; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G3Hpvs/X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPbrD1t56z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 22:12:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2392243BA3;
	Mon,  2 Mar 2026 11:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE303C19423;
	Mon,  2 Mar 2026 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772449962;
	bh=kI1vAF5IYYRZx7NfrbX8i+Vpr3eooOLoiR/Oub7Ok/M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G3Hpvs/X9Hj8rmyJfLSpBlznThF8k+MtxrWf1mM83VjxnRDPN5P3yIYYlkLKX/E0I
	 q5JtlxCOhn+twA3b0aq74S+drJEM9TvtSlZVpqUVpXm3+l/ygZK5KuAI428w+jTWPr
	 vHI0dSGu8W1IZjOIErWDXTqonjR9UKG0G5KKBTBs8k4vpX+VmDux5ujv4Aqyc/q6Dr
	 YvxDRCs3+JGD9ezNqOucVd7KXkfG/9D9em/vYSGUPIVIuJvtNm7lbyArS3Qpehe27j
	 JcwW7fupV2zSXfBHxs4jLRJ5EMPYtuSBLpcpD6/Fc5Kny8JBvneIkAjuS9ZhUihjzB
	 Bbs8qJ2rqYlqQ==
Message-ID: <d90efa16-932e-4c29-b8e1-1a4ef08db403@kernel.org>
Date: Mon, 2 Mar 2026 12:12:38 +0100
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
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260228135319.238985-1-sayalip@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17513-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 24CB31D7452
X-Rspamd-Action: no action

Hi Sayali,

Le 28/02/2026 à 14:53, Sayali Patil a écrit :
> On powerpc with PREEMPT_FULL or PREEMPT_LAZY and function tracing enabled,
> KUAP warnings can be triggered from the VMX usercopy path under memory
> stress workloads.
> 
> KUAP requires that no subfunctions are called once userspace access has
> been enabled. The existing VMX copy implementation violates this
> requirement by invoking enter_vmx_usercopy() from the assembly path after
> userspace access has already been enabled. If preemption occurs
> in this window, the AMR state may not be preserved correctly,
> leading to unexpected userspace access state and resulting in
> KUAP warnings.
> 
> Fix this by restructuring the VMX usercopy flow so that VMX selection
> and VMX state management are centralized in raw_copy_tofrom_user(),
> which is invoked by the raw_copy_{to,from,in}_user() wrappers.
> 
> Introduce a usercopy_mode enum to describe the copy direction
> (IN, FROM, TO) and use it to derive the required KUAP permissions.
> Userspace access is now enabled and disabled through common helpers
> based on the selected mode, ensuring that the correct read/write
> permissions are applied consistently.
> 
>   The new flow is:
> 
>    - raw_copy_{to,from,in}_user() calls raw_copy_tofrom_user()
>    - raw_copy_tofrom_user() decides whether to use the VMX path
>      based on size and CPU capability
>    - Call enter_vmx_usercopy() before enabling userspace access
>    - Enable userspace access as per the usercopy mode
>      and perform the VMX copy
>    - Disable userspace access as per the usercopy mode
>    - Call exit_vmx_usercopy()
>    - Fall back to the base copy routine if the VMX copy faults
> 
> With this change, the VMX assembly routines no longer perform VMX state
> management or call helper functions; they only implement the
> copy operations.
> The previous feature-section based VMX selection inside
> __copy_tofrom_user_power7() is removed, and a dedicated
> __copy_tofrom_user_power7_vmx() entry point is introduced.
> 
> This ensures correct KUAP ordering, avoids subfunction calls
> while KUAP is unlocked, and eliminates the warnings while preserving
> the VMX fast path.
> 
> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Closes: https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/
> Suggested-by: Christophe Leroy <chleroy@kernel.org>
> Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
> 
> v1->v2
>    - Updated as per the review comments.
>    - Centralized VMX usercopy handling in __copy_tofrom_user_vmx() in
>      arch/powerpc/lib/vmx-helper.c.
>    - Introduced a usercopy_mode enum to describe the copy direction
>      (IN, FROM, TO) and derive the required KUAP permissions, avoiding
>      duplication across the different usercopy paths.

I like the reduction of duplication you propose but I can't see the 
added value of that enum, what about:

diff --git a/arch/powerpc/include/asm/uaccess.h 
b/arch/powerpc/include/asm/uaccess.h
index 63d6eb8b004e..14a3219db838 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -329,12 +329,6 @@ do {								\
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
  				unsigned long size, enum usercopy_mode mode);

@@ -352,48 +346,18 @@ static inline bool will_use_vmx(unsigned long n)
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
  static inline unsigned long raw_copy_tofrom_user(void __user *to,
  		const void __user *from, unsigned long n,
-		enum usercopy_mode mode)
+		unsigned long dir)
  {
  	unsigned long ret;

  	if (will_use_vmx(n))
  		return __copy_tofrom_user_vmx(to, from,	n, mode);

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
index 35080885204b..4610f7153fd9 100644
--- a/arch/powerpc/lib/vmx-helper.c
+++ b/arch/powerpc/lib/vmx-helper.c
@@ -11,25 +11,25 @@
  #include <asm/switch_to.h>

  unsigned long __copy_tofrom_user_vmx(void __user *to, const void 
__user *from,
-			unsigned long size, enum usercopy_mode mode)
+			unsigned long size, unsigned long dir)
  {
  	unsigned long ret;

  	if (!enter_vmx_usercopy()) {
-		raw_copy_allow(to, mode);
+		allow_user_access(to, dir);
  		ret = __copy_tofrom_user(to, from, size);
-		raw_copy_prevent(mode);
+		prevent_user_access(dir);
  		return ret;
  	}

-	raw_copy_allow(to, mode);
+	allow_user_access(to, dir);
  	ret = __copy_tofrom_user_power7_vmx(to, from, size);
-	raw_copy_prevent(mode);
+	prevent_user_access(dir);
  	exit_vmx_usercopy();
  	if (unlikely(ret)) {
-		raw_copy_allow(to, mode);
+		allow_user_access(to, dir);
  		ret = __copy_tofrom_user_base(to, from, size);
-		raw_copy_prevent(mode);
+		prevent_user_access(dir);
  	}

  	return ret;



Christophe


> 
> v1: https://lore.kernel.org/all/20260217124457.89219-1-sayalip@linux.ibm.com/
> 
> ---
>   arch/powerpc/include/asm/uaccess.h | 95 ++++++++++++++++++++++++------
>   arch/powerpc/lib/copyuser_64.S     |  1 +
>   arch/powerpc/lib/copyuser_power7.S | 45 +++++---------
>   arch/powerpc/lib/vmx-helper.c      | 26 ++++++++
>   4 files changed, 119 insertions(+), 48 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index ba1d878c3f40..63d6eb8b004e 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -15,6 +15,9 @@
>   #define TASK_SIZE_MAX		TASK_SIZE_USER64
>   #endif
>   
> +/* Threshold above which VMX copy path is used */
> +#define VMX_COPY_THRESHOLD 3328
> +
>   #include <asm-generic/access_ok.h>
>   
>   /*
> @@ -326,40 +329,96 @@ do {								\
>   extern unsigned long __copy_tofrom_user(void __user *to,
>   		const void __user *from, unsigned long size);
>   
> -#ifdef __powerpc64__
> -static inline unsigned long
> -raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
> +enum usercopy_mode {
> +	USERCOPY_IN,
> +	USERCOPY_FROM,
> +	USERCOPY_TO,
> +};
> +
> +unsigned long __copy_tofrom_user_vmx(void __user *to, const void __user *from,
> +				unsigned long size, enum usercopy_mode mode);
> +
> +unsigned long __copy_tofrom_user_base(void __user *to,
> +		const void __user *from, unsigned long size);
> +
> +unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
> +		const void __user *from, unsigned long size);
> +
> +
> +static inline bool will_use_vmx(unsigned long n)
> +{
> +	return IS_ENABLED(CONFIG_ALTIVEC) &&
> +		cpu_has_feature(CPU_FTR_VMX_COPY) &&
> +		n > VMX_COPY_THRESHOLD;
> +}
> +
> +static inline void raw_copy_allow(void __user *to, enum usercopy_mode mode)
> +{
> +	switch (mode) {
> +	case USERCOPY_IN:
> +		allow_user_access(to, KUAP_READ_WRITE);
> +		break;
> +	case USERCOPY_FROM:
> +		allow_user_access(NULL, KUAP_READ);
> +		break;
> +	case USERCOPY_TO:
> +		allow_user_access(to, KUAP_WRITE);
> +		break;
> +	}
> +}
> +
> +static inline void raw_copy_prevent(enum usercopy_mode mode)
> +{
> +	switch (mode) {
> +	case USERCOPY_IN:
> +		prevent_user_access(KUAP_READ_WRITE);
> +		break;
> +	case USERCOPY_FROM:
> +		prevent_user_access(KUAP_READ);
> +		break;
> +	case USERCOPY_TO:
> +		prevent_user_access(KUAP_WRITE);
> +		break;
> +	}
> +}
> +
> +static inline unsigned long raw_copy_tofrom_user(void __user *to,
> +		const void __user *from, unsigned long n,
> +		enum usercopy_mode mode)
>   {
>   	unsigned long ret;
>   
> -	barrier_nospec();
> -	allow_user_access(to, KUAP_READ_WRITE);
> +	if (will_use_vmx(n))
> +		return __copy_tofrom_user_vmx(to, from,	n, mode);
> +
> +	raw_copy_allow(to, mode);
>   	ret = __copy_tofrom_user(to, from, n);
> -	prevent_user_access(KUAP_READ_WRITE);
> +	raw_copy_prevent(mode);
>   	return ret;
> +
> +}
> +
> +#ifdef __powerpc64__
> +static inline unsigned long
> +raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
> +{
> +	barrier_nospec();
> +	return raw_copy_tofrom_user(to, from, n, USERCOPY_IN);
>   }
>   #endif /* __powerpc64__ */
>   
>   static inline unsigned long raw_copy_from_user(void *to,
>   		const void __user *from, unsigned long n)
>   {
> -	unsigned long ret;
> -
> -	allow_user_access(NULL, KUAP_READ);
> -	ret = __copy_tofrom_user((__force void __user *)to, from, n);
> -	prevent_user_access(KUAP_READ);
> -	return ret;
> +	return raw_copy_tofrom_user((__force void __user *)to, from,
> +					n, USERCOPY_FROM);
>   }
>   
>   static inline unsigned long
>   raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>   {
> -	unsigned long ret;
> -
> -	allow_user_access(to, KUAP_WRITE);
> -	ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
> -	prevent_user_access(KUAP_WRITE);
> -	return ret;
> +	return raw_copy_tofrom_user(to, (__force const void __user *)from,
> +					n, USERCOPY_TO);
>   }
>   
>   unsigned long __arch_clear_user(void __user *addr, unsigned long size);
> diff --git a/arch/powerpc/lib/copyuser_64.S b/arch/powerpc/lib/copyuser_64.S
> index 9af969d2cc0c..25a99108caff 100644
> --- a/arch/powerpc/lib/copyuser_64.S
> +++ b/arch/powerpc/lib/copyuser_64.S
> @@ -562,3 +562,4 @@ exc;	std	r10,32(3)
>   	li	r5,4096
>   	b	.Ldst_aligned
>   EXPORT_SYMBOL(__copy_tofrom_user)
> +EXPORT_SYMBOL(__copy_tofrom_user_base)
> diff --git a/arch/powerpc/lib/copyuser_power7.S b/arch/powerpc/lib/copyuser_power7.S
> index 8474c682a178..17dbcfbae25f 100644
> --- a/arch/powerpc/lib/copyuser_power7.S
> +++ b/arch/powerpc/lib/copyuser_power7.S
> @@ -5,13 +5,9 @@
>    *
>    * Author: Anton Blanchard <anton@au.ibm.com>
>    */
> +#include <linux/export.h>
>   #include <asm/ppc_asm.h>
>   
> -#ifndef SELFTEST_CASE
> -/* 0 == don't use VMX, 1 == use VMX */
> -#define SELFTEST_CASE	0
> -#endif
> -
>   #ifdef __BIG_ENDIAN__
>   #define LVS(VRT,RA,RB)		lvsl	VRT,RA,RB
>   #define VPERM(VRT,VRA,VRB,VRC)	vperm	VRT,VRA,VRB,VRC
> @@ -47,10 +43,14 @@
>   	ld	r15,STK_REG(R15)(r1)
>   	ld	r14,STK_REG(R14)(r1)
>   .Ldo_err3:
> -	bl	CFUNC(exit_vmx_usercopy)
> +	ld      r6,STK_REG(R31)(r1)	/* original destination pointer */
> +	ld      r5,STK_REG(R29)(r1)	/* original number of bytes */
> +	subf    r7,r6,r3		/* #bytes copied */
> +	subf    r3,r7,r5		/* #bytes not copied in r3 */
>   	ld	r0,STACKFRAMESIZE+16(r1)
>   	mtlr	r0
> -	b	.Lexit
> +	addi    r1,r1,STACKFRAMESIZE
> +	blr
>   #endif /* CONFIG_ALTIVEC */
>   
>   .Ldo_err2:
> @@ -74,7 +74,6 @@
>   
>   _GLOBAL(__copy_tofrom_user_power7)
>   	cmpldi	r5,16
> -	cmpldi	cr1,r5,3328
>   
>   	std	r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
>   	std	r4,-STACKFRAMESIZE+STK_REG(R30)(r1)
> @@ -82,12 +81,6 @@ _GLOBAL(__copy_tofrom_user_power7)
>   
>   	blt	.Lshort_copy
>   
> -#ifdef CONFIG_ALTIVEC
> -test_feature = SELFTEST_CASE
> -BEGIN_FTR_SECTION
> -	bgt	cr1,.Lvmx_copy
> -END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
> -#endif
>   
>   .Lnonvmx_copy:
>   	/* Get the source 8B aligned */
> @@ -263,23 +256,14 @@ err1;	stb	r0,0(r3)
>   15:	li	r3,0
>   	blr
>   
> -.Lunwind_stack_nonvmx_copy:
> -	addi	r1,r1,STACKFRAMESIZE
> -	b	.Lnonvmx_copy
> -
> -.Lvmx_copy:
>   #ifdef CONFIG_ALTIVEC
> +_GLOBAL(__copy_tofrom_user_power7_vmx)
>   	mflr	r0
>   	std	r0,16(r1)
>   	stdu	r1,-STACKFRAMESIZE(r1)
> -	bl	CFUNC(enter_vmx_usercopy)
> -	cmpwi	cr1,r3,0
> -	ld	r0,STACKFRAMESIZE+16(r1)
> -	ld	r3,STK_REG(R31)(r1)
> -	ld	r4,STK_REG(R30)(r1)
> -	ld	r5,STK_REG(R29)(r1)
> -	mtlr	r0
>   
> +	std     r3,STK_REG(R31)(r1)
> +	std     r5,STK_REG(R29)(r1)
>   	/*
>   	 * We prefetch both the source and destination using enhanced touch
>   	 * instructions. We use a stream ID of 0 for the load side and
> @@ -300,8 +284,6 @@ err1;	stb	r0,0(r3)
>   
>   	DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
>   
> -	beq	cr1,.Lunwind_stack_nonvmx_copy
> -
>   	/*
>   	 * If source and destination are not relatively aligned we use a
>   	 * slower permute loop.
> @@ -478,7 +460,8 @@ err3;	lbz	r0,0(r4)
>   err3;	stb	r0,0(r3)
>   
>   15:	addi	r1,r1,STACKFRAMESIZE
> -	b	CFUNC(exit_vmx_usercopy)	/* tail call optimise */
> +	li r3,0
> +	blr
>   
>   .Lvmx_unaligned_copy:
>   	/* Get the destination 16B aligned */
> @@ -681,5 +664,7 @@ err3;	lbz	r0,0(r4)
>   err3;	stb	r0,0(r3)
>   
>   15:	addi	r1,r1,STACKFRAMESIZE
> -	b	CFUNC(exit_vmx_usercopy)	/* tail call optimise */
> +	li r3,0
> +	blr
> +EXPORT_SYMBOL(__copy_tofrom_user_power7_vmx)
>   #endif /* CONFIG_ALTIVEC */
> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
> index 54340912398f..35080885204b 100644
> --- a/arch/powerpc/lib/vmx-helper.c
> +++ b/arch/powerpc/lib/vmx-helper.c
> @@ -10,6 +10,32 @@
>   #include <linux/hardirq.h>
>   #include <asm/switch_to.h>
>   
> +unsigned long __copy_tofrom_user_vmx(void __user *to, const void __user *from,
> +			unsigned long size, enum usercopy_mode mode)
> +{
> +	unsigned long ret;
> +
> +	if (!enter_vmx_usercopy()) {
> +		raw_copy_allow(to, mode);
> +		ret = __copy_tofrom_user(to, from, size);
> +		raw_copy_prevent(mode);
> +		return ret;
> +	}
> +
> +	raw_copy_allow(to, mode);
> +	ret = __copy_tofrom_user_power7_vmx(to, from, size);
> +	raw_copy_prevent(mode);
> +	exit_vmx_usercopy();
> +	if (unlikely(ret)) {
> +		raw_copy_allow(to, mode);
> +		ret = __copy_tofrom_user_base(to, from, size);
> +		raw_copy_prevent(mode);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(__copy_tofrom_user_vmx);
> +
>   int enter_vmx_usercopy(void)
>   {
>   	if (in_interrupt())


