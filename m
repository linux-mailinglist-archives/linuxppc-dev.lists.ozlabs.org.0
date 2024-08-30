Return-Path: <linuxppc-dev+bounces-832-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D633B9668B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 20:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwR733rgWz30KY;
	Sat, 31 Aug 2024 04:11:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=178.60.130.6
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725041503;
	cv=none; b=JXE7jBYBQSmeqq4Jr5n8wucYFFK557ceMbcCe/dkUg5Gc9B01ALVKNcA/BLaORhG3TU/iyYQil/UNSxjuVSnqg0HUZJuaK7XA5OqlIHYE1QabP4/1oSfoHJ0PfrFraBoPfgF1IKhvm81i6iVwfK+7dw74523tAbZLlQ0sJ/qhuF+NiGyviPNnfjqA8IkJbdvZ8L72zY9wVtHLPC3w+AMqbH2PyVBuWp3lM12EPQ2fPG54SHstK5qgM1BjzX+zdA24+qN27qJosZibXqvxb+j7AT/Y0d38syD2itnngE5xfeg6JX7QEVSvH64BTtEERUfLbW+FEO2YZuwO0TMEV1h2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725041503; c=relaxed/relaxed;
	bh=28Z7dlWcO7m9gkU3DOzwuYm7qBeow4XlSUU1VNXqCuM=;
	h=DKIM-Signature:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=PhKna/NDIIni+e6liCp0sk5Ek6ZKAHfpqgDcV+arYaEU7Ll13JKg8QVxKSXwYiL1U0aClTZ6b2zdFGPHLRZTKFGVWpcxG5lLFDVtmz9hRBL/zXnTkSb+UF1OHAj0mi4qN7h2NbA6BC1zV4cFLv2/4mZZMqW4+jwI1bqLou/cxnflRG05HLMTeqm/PBotgUSW7CGftifUS9pwYJfz6OrUUzCOhiGx4qNoqRfXhOqaGdt6mSYTKZnX0+2s/sRkukyarAGypqmjTGwD3iEUNIKoAmyy+65Z4ZiQqgGLjhHXvJZ4/iMMld7t5WkX6ck6atJ+NvEkEUNVbHv16DsSfHdtiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=igalia.com; dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KCJhDUSZ; dkim-atps=neutral; spf=pass (client-ip=178.60.130.6; helo=fanzine2.igalia.com; envelope-from=gpiccoli@igalia.com; receiver=lists.ozlabs.org) smtp.mailfrom=igalia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KCJhDUSZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com; envelope-from=gpiccoli@igalia.com; receiver=lists.ozlabs.org)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwR7159M2z30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 04:11:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=28Z7dlWcO7m9gkU3DOzwuYm7qBeow4XlSUU1VNXqCuM=; b=KCJhDUSZXjqCXyf6ktd33IQgT2
	oAAS/t7P+5fmOFj5q8ftN2N0OIByUsie0WiIxFaKnmOrOmB5sI7zja5AbFIaUFThjBX6e06rnevWj
	1Huq33OngdJz/bAYJTSPwf1328zmWAx/E+Nl8Hk4ffOdfSIC7UKNWEKMxPCF8WbDGNDSgT6J8jrsi
	WlgdVrzqdnrBrJLAgk3Sp/4F792EYW74wRQVr06ZEg/FLfcBqP4FAKAwVLmunNp9oQapsLc6JakIc
	L9zTQgLdcK4BxCSwBfZ3HAoSE2lLbss1059yuc45J4n/3uLvSbK1kKKH164xrpV+ZPZGsJ+LqoVVR
	jAIJOA3g==;
Received: from [177.76.152.96] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1sk65l-007FKs-2N; Fri, 30 Aug 2024 20:11:24 +0200
Message-ID: <d1e65436-b49b-76b1-01d4-2be2a0eb0f3a@igalia.com>
Date: Fri, 30 Aug 2024 15:11:13 -0300
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] powerpc/fadump, x86/sev: Inform about unconditionally
 enabling crash_kexec_post_notifiers
Content-Language: en-US
To: Stephen Brennan <stephen.s.brennan@oracle.com>,
 kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Cc: bhe@redhat.com, vgoyal@redhat.com, dyoung@redhat.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 hbathini@linux.ibm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, ashish.kalra@amd.com,
 michael.roth@amd.com, brijesh.singh@amd.com, thomas.lendacky@amd.com,
 linux-kernel@vger.kernel.org, linux-debuggers@vger.kernel.org,
 kernel@gpiccoli.net, kernel-dev@igalia.com
References: <20240830141752.460173-1-gpiccoli@igalia.com>
 <87bk19rj5u.fsf@oracle.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <87bk19rj5u.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2024 14:54, Stephen Brennan wrote:
> [...]
> Could we maybe go further than this, and delete the public declarations
> of crash_kexec_post_notifiers in "include/linux"? (I see two). We could
> replace the users that set it to true with a function that logs the
> change so that it's impossible for new code to set it directly without
> notifying the user. Something like this? Compile tested only for x86.
> 
> commit da8691a25d7b0c2f914720bc054dd1d9dbe4b373
> Author: Stephen Brennan <stephen.s.brennan@oracle.com>
> Date:   Fri Aug 30 10:49:24 2024 -0700
> 
>     panic: make crash_kexec_post_notifiers private
>     
>     This requires that any in-kernel user setting it directly must log the
>     reason so that users are aware their panic behavior may be different
>     from their configuration.
>     
>     Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> 

Thanks Stephen! I'm totally into that, your approach is very good.
Cheers,


Guilherme


> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index a612e7513a4f8..9966f29409599 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1818,7 +1818,7 @@ int __init setup_fadump(void)
>  	 * lets panic() function take crash friendly path before panic
>  	 * notifiers are invoked.
>  	 */
> -	crash_kexec_post_notifiers = true;
> +	enable_crash_kexec_post_notifiers("PPC/fadump");
>  
>  	return 1;
>  }
> diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
> index 0ce17766c0e52..6e9f5f8d13cc5 100644
> --- a/arch/x86/virt/svm/sev.c
> +++ b/arch/x86/virt/svm/sev.c
> @@ -256,7 +256,7 @@ static int __init snp_rmptable_init(void)
>  	 * Setting crash_kexec_post_notifiers to 'true' to ensure that SNP panic
>  	 * notifier is invoked to do SNP IOMMU shutdown before kdump.
>  	 */
> -	crash_kexec_post_notifiers = true;
> +	enable_crash_kexec_post_notifiers("AMD/SEV");
>  
>  	return 0;
>  
> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> index 9c452bfbd5719..fa3bbb66235de 100644
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -303,8 +303,7 @@ int __init hv_common_init(void)
>  	if (ms_hyperv.misc_features & HV_FEATURE_GUEST_CRASH_MSR_AVAILABLE) {
>  		u64 hyperv_crash_ctl;
>  
> -		crash_kexec_post_notifiers = true;
> -		pr_info("Hyper-V: enabling crash_kexec_post_notifiers\n");
> +		enable_crash_kexec_post_notifiers("Hyper-V");
>  
>  		/*
>  		 * Panic message recording (sysctl_record_panic_msg)
> diff --git a/include/linux/panic.h b/include/linux/panic.h
> index 54d90b6c5f47b..697184664c6f4 100644
> --- a/include/linux/panic.h
> +++ b/include/linux/panic.h
> @@ -31,8 +31,6 @@ extern int sysctl_panic_on_rcu_stall;
>  extern int sysctl_max_rcu_stall_to_panic;
>  extern int sysctl_panic_on_stackoverflow;
>  
> -extern bool crash_kexec_post_notifiers;
> -
>  extern void __stack_chk_fail(void);
>  void abort(void);
>  
> diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> index 41e32483d7a7b..97c31cf5c2fdb 100644
> --- a/include/linux/panic_notifier.h
> +++ b/include/linux/panic_notifier.h
> @@ -7,6 +7,6 @@
>  
>  extern struct atomic_notifier_head panic_notifier_list;
>  
> -extern bool crash_kexec_post_notifiers;
> +void enable_crash_kexec_post_notifiers(const char *reason);
>  
>  #endif	/* _LINUX_PANIC_NOTIFIERS_H */
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 63cf89393c6eb..634c6b99717c5 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -33,6 +33,9 @@
>  /* Per cpu memory for storing cpu states in case of system crash. */
>  note_buf_t __percpu *crash_notes;
>  
> +/* Defined in kernel/panic.c and needed here, but not intended to be public. */
> +extern bool crash_kexec_post_notifiers;
> +
>  #ifdef CONFIG_CRASH_DUMP
>  
>  int kimage_crash_copy_vmcoreinfo(struct kimage *image)
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 2a0449144f82e..f4ae3abbea7ed 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -137,6 +137,12 @@ static long no_blink(int state)
>  	return 0;
>  }
>  
> +void enable_crash_kexec_post_notifiers(const char *reason)
> +{
> +	crash_kexec_post_notifiers = true;
> +	pr_info("%s: enabling crash_kexec_post_notifiers\n", reason);
> +}
> +
>  /* Returns how long it waited in ms */
>  long (*panic_blink)(int state);
>  EXPORT_SYMBOL(panic_blink);
> 

