Return-Path: <linuxppc-dev+bounces-17377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPlfCl9ioWnIsQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 10:22:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8E51B53AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 10:22:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMjXW3xxZz3bjb;
	Fri, 27 Feb 2026 20:22:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772184155;
	cv=none; b=QhTqLVX5YnXwG/zGEtO73jbQBR/DGxxWbv3Vim9XEnj33OiLWGKdfgQJohMUZuVLiDntvjlzOO7X4hHuqBP208e8TXS7mL9e9t8K3GKyEAqzTi6STFRQ9H8ioT9I1gyxiV24WUsZNuI6yD8ucuj9A49JzWmaU2wLrHleS7xbhYjuRH8pRvTFsVpghE8XwEZwRjsMNCU7e6zzpozWAVt8baA4P3thEyFOAfy5bRG4KplyUnT1g3OWXxftQAcZlSAkCeEg+RMTn68dbWLvIxfWL7fKdPv3VqXBeEb1rNTbR3dGksWiRAiFttrvsbtD+HPy288zjV+LEu1Xcd7NoZmRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772184155; c=relaxed/relaxed;
	bh=Sqkc+HLFSGjjtwglZPf/6z3ywNSfXtpoHXXty0+TTus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EyMAu6KK3MtjymEsf/tBLVMXYut1SdkNMuXzmugia+ahrp1ohy0nKKQtg+XDTYG2rdJ3wJc5mSqEzISskdMCFHjP8zXVNJFLP68AGzzkfJUI5Tiwc9LCkI7s7a4jh2+rYk6KNBSglONgcfxj9tEuFByQXD4evHDo35JbPjTNg8oKrg77UothV+n7/di7hSuP43wEikjKrCQN3+IT4WyBc0fnZLUuFeUUfFd+OHUbvps+QKZZOTvV9j9Pu2lrC3kU5K1NK17oBADVF9PMPxP1XOU8SCWTm1qQ3/u6J+u+KhaWk2ezUwGHd0L0fDOMB1lLllMUedhB2DFLaaiSZlz2Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HOrLsUwT; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HOrLsUwT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMjXV57Vmz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 20:22:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 961374325C;
	Fri, 27 Feb 2026 09:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7C1C116C6;
	Fri, 27 Feb 2026 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772184152;
	bh=1xRqsTK8wl/1ySu1f7UjH2uuObJ+YIC1m7OdvCqed6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HOrLsUwTFVwzCFf01k0g199VVFA743n/jWlbrQdAu3CnDtKoILFFSAV7Ud1QaGYJ+
	 z+itZmQ82+/P6Wkc/vrIAIbKFNxHSBjpbyX+oeX8BuNbbYgDfpTTWxEUPUpRwwCGy8
	 WHvbtmc3qclf9NkJIKtz+MCuz+duevrTtiIFFzZ1Tyqy3B6CyQ4SvDeYQsrOau4f0o
	 CR4liDwd8BMm6Z5d+dcfvKSwV6gl45QD9DhhstNaFaCKdmCsEFFMRt6zhq8q4uAdz2
	 sqzxp8n/lF9xiwg2FrlQrbM73R5YB0LnVZ73Evnrmb27oBw9M9EotzhFTyokfFv5qg
	 pOwGQJMnQpoZA==
Message-ID: <a8f8fd17-7746-46da-8ae7-439d1e8f1f23@kernel.org>
Date: Fri, 27 Feb 2026 10:22:28 +0100
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
Subject: Re: [PATCH 1/2] powerpc: fix KUAP warning in VMX usercopy path
To: Sayali Patil <sayalip@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, riteshh@linux.ibm.com
References: <20260217124457.89219-1-sayalip@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260217124457.89219-1-sayalip@linux.ibm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17377-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sayalip@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:sshegde@linux.ibm.com,m:riteshh@linux.ibm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 3A8E51B53AB
X-Rspamd-Action: no action

Hi,

Le 17/02/2026 à 13:44, Sayali Patil a écrit :
> [Vous ne recevez pas souvent de courriers de sayalip@linux.ibm.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
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
> Fix this by moving VMX selection and enter_vmx_usercopy()/
> exit_vmx_usercopy() handling into the raw_copy_{to,from,in}_user()
> wrappers in uaccess.h. The new flow is:
> 
>    - Decide whether to use the VMX path based on size and CPU capability
>    - Call enter_vmx_usercopy() before enabling userspace access
>    - Enable userspace access and perform the VMX copy
>    - Disable userspace access
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

You patch conflicts with the changes for adding masked user access.

Can you rebase on top of v7.0-rc1 ?

Comments below

> 
> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Closes: https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/
> Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/uaccess.h | 67 ++++++++++++++++++++++++++++++
>   arch/powerpc/lib/copyuser_64.S     |  1 +
>   arch/powerpc/lib/copyuser_power7.S | 45 +++++++-------------
>   arch/powerpc/lib/vmx-helper.c      |  2 +
>   4 files changed, 85 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 784a00e681fa..52e4a784d148 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -13,6 +13,11 @@
>   #define TASK_SIZE_MAX          TASK_SIZE_USER64
>   #endif
> 
> +#ifdef CONFIG_ALTIVEC

remove the ifdef to avoid matching ifdef later

> +/* Threshold above which VMX copy path is used */
> +#define VMX_COPY_THRESHOLD 3328
> +#endif
> +
>   #include <asm-generic/access_ok.h>
> 
>   /*
> @@ -323,12 +328,42 @@ do {                                                              \
>   extern unsigned long __copy_tofrom_user(void __user *to,
>                  const void __user *from, unsigned long size);
> 
> +extern unsigned long __copy_tofrom_user_base(void __user *to,
> +               const void __user *from, unsigned long size);
> +

extern keywork is pointless for function prototypes, don't add new ones.

> +#ifdef CONFIG_ALTIVEC

Remove the ifdef

> +extern unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
> +               const void __user *from, unsigned long size);
> +
> +static inline bool will_use_vmx(unsigned long n)
> +{
> +       return cpu_has_feature(CPU_FTR_VMX_COPY) &&
> +               n > VMX_COPY_THRESHOLD;

Change to

	return IS_ENABLED(CONFIG_ALTIVEC) && cpu_has_feature(CPU_FTR_VMX_COPY) 
&&  n > VMX_COPY_THRESHOLD;

Then will_use_vmx() will return false when CONFIG_ALTIVEC is not set

> +}
> +#endif
> +
>   #ifdef __powerpc64__
>   static inline unsigned long
>   raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
>   {
>          unsigned long ret;
> 
> +#ifdef CONFIG_ALTIVEC

Remove the ifdef, will_use_vmx() will return false with the above change 
when CONFIG_ALTIVEC is not set

> +       if (will_use_vmx(n) && enter_vmx_usercopy()) {
> +               allow_read_write_user(to, from, n);
> +               ret = __copy_tofrom_user_power7_vmx(to, from, n);
> +               prevent_read_write_user(to, from, n);
> +               exit_vmx_usercopy();
> +               if (unlikely(ret)) {
> +                       allow_read_write_user(to, from, n);
> +                       ret = __copy_tofrom_user_base(to, from, n);
> +                       prevent_read_write_user(to, from, n);
> +               }
> +
> +               return ret;
> +       }

This block is starting to be a bit big for an inline function.
I think we should just have:

	if (will_use_vmx(n))
		return __copy_tofrom_user_vmx()

and then define a __copy_tofrom_user_vmx() in for instance 
arch/powerpc/lib/vmx-helper.c

This would also avoid having to export enter_vmx_usercopy() and 
exit_vmx_usercopy()

Christophe

> +#endif
> +
>          allow_read_write_user(to, from, n);
>          ret = __copy_tofrom_user(to, from, n);
>          prevent_read_write_user(to, from, n);
> @@ -341,6 +376,22 @@ static inline unsigned long raw_copy_from_user(void *to,
>   {
>          unsigned long ret;
> 
> +#ifdef CONFIG_ALTIVEC
> +       if (will_use_vmx(n) && enter_vmx_usercopy()) {
> +               allow_read_from_user(from, n);
> +               ret = __copy_tofrom_user_power7_vmx((__force void __user *)to, from, n);
> +               prevent_read_from_user(from, n);
> +               exit_vmx_usercopy();
> +               if (unlikely(ret)) {
> +                       allow_read_from_user(from, n);
> +                       ret = __copy_tofrom_user_base((__force void __user *)to, from, n);
> +                       prevent_read_from_user(from, n);
> +               }
> +
> +               return ret;
> +       }
> +#endif
> +
>          allow_read_from_user(from, n);
>          ret = __copy_tofrom_user((__force void __user *)to, from, n);
>          prevent_read_from_user(from, n);
> @@ -352,6 +403,22 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>   {
>          unsigned long ret;
> 
> +#ifdef CONFIG_ALTIVEC
> +       if (will_use_vmx(n) && enter_vmx_usercopy()) {
> +               allow_write_to_user(to, n);
> +               ret = __copy_tofrom_user_power7_vmx(to, (__force const void __user *)from, n);
> +               prevent_write_to_user(to, n);
> +               exit_vmx_usercopy();
> +               if (unlikely(ret)) {
> +                       allow_write_to_user(to, n);
> +                       ret = __copy_tofrom_user_base(to, (__force const void __user *)from, n);
> +                       prevent_write_to_user(to, n);
> +               }
> +
> +               return ret;
> +       }
> +#endif
> +
>          allow_write_to_user(to, n);
>          ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
>          prevent_write_to_user(to, n);
> diff --git a/arch/powerpc/lib/copyuser_64.S b/arch/powerpc/lib/copyuser_64.S
> index 9af969d2cc0c..25a99108caff 100644
> --- a/arch/powerpc/lib/copyuser_64.S
> +++ b/arch/powerpc/lib/copyuser_64.S
> @@ -562,3 +562,4 @@ exc;        std     r10,32(3)
>          li      r5,4096
>          b       .Ldst_aligned
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
> -#define SELFTEST_CASE  0
> -#endif
> -
>   #ifdef __BIG_ENDIAN__
>   #define LVS(VRT,RA,RB)         lvsl    VRT,RA,RB
>   #define VPERM(VRT,VRA,VRB,VRC) vperm   VRT,VRA,VRB,VRC
> @@ -47,10 +43,14 @@
>          ld      r15,STK_REG(R15)(r1)
>          ld      r14,STK_REG(R14)(r1)
>   .Ldo_err3:
> -       bl      CFUNC(exit_vmx_usercopy)
> +       ld      r6,STK_REG(R31)(r1)     /* original destination pointer */
> +       ld      r5,STK_REG(R29)(r1)     /* original number of bytes */
> +       subf    r7,r6,r3                /* #bytes copied */
> +       subf    r3,r7,r5                /* #bytes not copied in r3 */
>          ld      r0,STACKFRAMESIZE+16(r1)
>          mtlr    r0
> -       b       .Lexit
> +       addi    r1,r1,STACKFRAMESIZE
> +       blr
>   #endif /* CONFIG_ALTIVEC */
> 
>   .Ldo_err2:
> @@ -74,7 +74,6 @@
> 
>   _GLOBAL(__copy_tofrom_user_power7)
>          cmpldi  r5,16
> -       cmpldi  cr1,r5,3328
> 
>          std     r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
>          std     r4,-STACKFRAMESIZE+STK_REG(R30)(r1)
> @@ -82,12 +81,6 @@ _GLOBAL(__copy_tofrom_user_power7)
> 
>          blt     .Lshort_copy
> 
> -#ifdef CONFIG_ALTIVEC
> -test_feature = SELFTEST_CASE
> -BEGIN_FTR_SECTION
> -       bgt     cr1,.Lvmx_copy
> -END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
> -#endif
> 
>   .Lnonvmx_copy:
>          /* Get the source 8B aligned */
> @@ -263,23 +256,14 @@ err1;     stb     r0,0(r3)
>   15:    li      r3,0
>          blr
> 
> -.Lunwind_stack_nonvmx_copy:
> -       addi    r1,r1,STACKFRAMESIZE
> -       b       .Lnonvmx_copy
> -
> -.Lvmx_copy:
>   #ifdef CONFIG_ALTIVEC
> +_GLOBAL(__copy_tofrom_user_power7_vmx)
>          mflr    r0
>          std     r0,16(r1)
>          stdu    r1,-STACKFRAMESIZE(r1)
> -       bl      CFUNC(enter_vmx_usercopy)
> -       cmpwi   cr1,r3,0
> -       ld      r0,STACKFRAMESIZE+16(r1)
> -       ld      r3,STK_REG(R31)(r1)
> -       ld      r4,STK_REG(R30)(r1)
> -       ld      r5,STK_REG(R29)(r1)
> -       mtlr    r0
> 
> +       std     r3,STK_REG(R31)(r1)
> +       std     r5,STK_REG(R29)(r1)
>          /*
>           * We prefetch both the source and destination using enhanced touch
>           * instructions. We use a stream ID of 0 for the load side and
> @@ -300,8 +284,6 @@ err1;       stb     r0,0(r3)
> 
>          DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
> 
> -       beq     cr1,.Lunwind_stack_nonvmx_copy
> -
>          /*
>           * If source and destination are not relatively aligned we use a
>           * slower permute loop.
> @@ -478,7 +460,8 @@ err3;       lbz     r0,0(r4)
>   err3;  stb     r0,0(r3)
> 
>   15:    addi    r1,r1,STACKFRAMESIZE
> -       b       CFUNC(exit_vmx_usercopy)        /* tail call optimise */
> +       li r3,0
> +       blr
> 
>   .Lvmx_unaligned_copy:
>          /* Get the destination 16B aligned */
> @@ -681,5 +664,7 @@ err3;       lbz     r0,0(r4)
>   err3;  stb     r0,0(r3)
> 
>   15:    addi    r1,r1,STACKFRAMESIZE
> -       b       CFUNC(exit_vmx_usercopy)        /* tail call optimise */
> +       li r3,0
> +       blr
> +EXPORT_SYMBOL(__copy_tofrom_user_power7_vmx)
>   #endif /* CONFIG_ALTIVEC */
> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
> index 54340912398f..554b248002b4 100644
> --- a/arch/powerpc/lib/vmx-helper.c
> +++ b/arch/powerpc/lib/vmx-helper.c
> @@ -27,6 +27,7 @@ int enter_vmx_usercopy(void)
> 
>          return 1;
>   }
> +EXPORT_SYMBOL(enter_vmx_usercopy);
> 
>   /*
>    * This function must return 0 because we tail call optimise when calling
> @@ -49,6 +50,7 @@ int exit_vmx_usercopy(void)
>                  set_dec(1);
>          return 0;
>   }
> +EXPORT_SYMBOL(exit_vmx_usercopy);
> 
>   int enter_vmx_ops(void)
>   {
> --
> 2.52.0
> 


