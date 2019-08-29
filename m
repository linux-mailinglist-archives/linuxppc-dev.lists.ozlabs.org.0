Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DA2A12C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 09:45:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JvmS6q04zDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 17:45:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JvkG05jPzDrHZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 17:43:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="mINmb0tO"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46JvkD0RB6z8t6X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 17:43:48 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46JvkC6bQKz9sBp; Thu, 29 Aug 2019 17:43:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="mINmb0tO"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46JvkB2PzRz9s5b
 for <linuxppc-dev@ozlabs.org>; Thu, 29 Aug 2019 17:43:45 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n9so1157681pgc.1
 for <linuxppc-dev@ozlabs.org>; Thu, 29 Aug 2019 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=98i3cS6/7WeCpm3OvjUM91P2z3Sji/6f7RLJLFnSUDQ=;
 b=mINmb0tOz5/AykZjdBT8jpkxTEoa4LQiZHXbsbR136iLVNNFvWGuDpes8vgrz9r/Uk
 au3qDWtfZViQNx2o4ImdwJ9+qWBeXEjO5I8XRu6TLvltxM4NTL3Snski5GQrDkhSHK35
 SdxnABHzPRkCx1m0P+4TYcxoSvuSzEGiR1dbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=98i3cS6/7WeCpm3OvjUM91P2z3Sji/6f7RLJLFnSUDQ=;
 b=lZLOy2gDAEm/caGDqN61WHaa4bLHN828aFB5p8UG00EixrdiPYvAlC93i23ly7z5pO
 s9FRu42z6m5sWjLhAeD/+J9vu4DTT6Zp1NhRgl76QbbgBOYshbO5LX4ecSBODF/sfhGC
 q0oKn9fsEYAFr3+EMevBcavUUb+HdgeXRvpuFdxMN0riJgn20l0sYd9FXD6XWu6gT6BK
 6cdzNkimQexxIGj7LfQCkkNxGngQHvkSxq1oyZj5d3yvy8vbymhXsRVF+mpLpBaOyNT3
 qKpS28XQKUyWAP2ylIHn+LcuIQn2x9o5Tyvue9668IejNFJKpBTqSegu9u+OZCfuQmld
 vrSA==
X-Gm-Message-State: APjAAAWQvziXsX6PCAhrYcPlDy0bnx2l2eJv0ev7/7c6cgAy45j5V7W4
 Jd1Sb6a+QpOhrGMem6q7IxLLpg==
X-Google-Smtp-Source: APXvYqwOPQ36C6YIdVTe/JpTXpKyOMyZT7Q4hhcam/9EfKjLvTPseUYdnWvscKgV/6C0HajuK6F58w==
X-Received: by 2002:aa7:93aa:: with SMTP id x10mr9818006pff.83.1567064621822; 
 Thu, 29 Aug 2019 00:43:41 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id q69sm1294096pjb.0.2019.08.29.00.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 00:43:41 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org,
 kernel-hardening@lists.openwall.com
Subject: Re: [PATCH v5 2/2] powerpc/xmon: Restrict when kernel is locked down
In-Reply-To: <20190828034613.14750-3-cmr@informatik.wtf>
References: <20190828034613.14750-1-cmr@informatik.wtf>
 <20190828034613.14750-3-cmr@informatik.wtf>
Date: Thu, 29 Aug 2019 17:43:34 +1000
Message-ID: <87d0gov2l5.fsf@dja-thinkpad.axtens.net>
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> Xmon should be either fully or partially disabled depending on the
> kernel lockdown state.

I've been kicking the tyres of this, and it seems to work well:

Tested-by: Daniel Axtens <dja@axtens.net>

>
> Put xmon into read-only mode for lockdown=integrity and prevent user
> entry into xmon when lockdown=confidentiality. Xmon checks the lockdown
> state on every attempted entry:
>
>  (1) during early xmon'ing
>
>  (2) when triggered via sysrq
>
>  (3) when toggled via debugfs
>
>  (4) when triggered via a previously enabled breakpoint
>
> The following lockdown state transitions are handled:
>
>  (1) lockdown=none -> lockdown=integrity
>      set xmon read-only mode
>
>  (2) lockdown=none -> lockdown=confidentiality
>      clear all breakpoints, set xmon read-only mode,
>      prevent user re-entry into xmon
>
>  (3) lockdown=integrity -> lockdown=confidentiality
>      clear all breakpoints, set xmon read-only mode,
>      prevent user re-entry into xmon

I have one small nit: if I enter confidentiality mode and then try to
enter xmon, I get 32 messages about clearing the breakpoints each time I
try to enter xmon:

root@dja-guest:~# echo confidentiality > /sys/kernel/security/lockdown 
root@dja-guest:~# echo x >/proc/sysrq-trigger 
[  489.585400] sysrq: Entering xmon
xmon: Disabled due to kernel lockdown
xmon: All breakpoints cleared
xmon: All breakpoints cleared
xmon: All breakpoints cleared
xmon: All breakpoints cleared
xmon: All breakpoints cleared
...

Investigating, I see that this is because my vm has 32 vcpus, and I'm
getting one per CPU.

Looking at the call sites, there's only one other caller, so I think you
might be better served with this:

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 94a5fada3034..fcaf1d568162 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3833,10 +3833,6 @@ static void clear_all_bpt(void)
                iabr = NULL;
                dabr.enabled = 0;
        }
-
-       get_output_lock();
-       printf("xmon: All breakpoints cleared\n");
-       release_output_lock();
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -3846,8 +3842,13 @@ static int xmon_dbgfs_set(void *data, u64 val)
        xmon_init(xmon_on);
 
        /* make sure all breakpoints removed when disabling */
-       if (!xmon_on)
+       if (!xmon_on) {
                clear_all_bpt();
+               get_output_lock();
+               printf("xmon: All breakpoints cleared\n");
+               release_output_lock();
+       }
+
        return 0;
 }
 
Apart from that:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Regards,
Daniel

> Suggested-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
>  arch/powerpc/xmon/xmon.c     | 85 ++++++++++++++++++++++++++++--------
>  include/linux/security.h     |  2 +
>  security/lockdown/lockdown.c |  2 +
>  3 files changed, 72 insertions(+), 17 deletions(-)
>
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index a98a354d46ac..94a5fada3034 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -25,6 +25,7 @@
>  #include <linux/nmi.h>
>  #include <linux/ctype.h>
>  #include <linux/highmem.h>
> +#include <linux/security.h>
>  
>  #include <asm/debugfs.h>
>  #include <asm/ptrace.h>
> @@ -187,6 +188,8 @@ static void dump_tlb_44x(void);
>  static void dump_tlb_book3e(void);
>  #endif
>  
> +static void clear_all_bpt(void);
> +
>  #ifdef CONFIG_PPC64
>  #define REG		"%.16lx"
>  #else
> @@ -283,10 +286,38 @@ Commands:\n\
>  "  U	show uptime information\n"
>  "  ?	help\n"
>  "  # n	limit output to n lines per page (for dp, dpa, dl)\n"
> -"  zr	reboot\n\
> -  zh	halt\n"
> +"  zr	reboot\n"
> +"  zh	halt\n"
>  ;
>  
> +#ifdef CONFIG_SECURITY
> +static bool xmon_is_locked_down(void)
> +{
> +	static bool lockdown;
> +
> +	if (!lockdown) {
> +		lockdown = !!security_locked_down(LOCKDOWN_XMON_RW);
> +		if (lockdown) {
> +			printf("xmon: Disabled due to kernel lockdown\n");
> +			xmon_is_ro = true;
> +		}
> +	}
> +
> +	if (!xmon_is_ro) {
> +		xmon_is_ro = !!security_locked_down(LOCKDOWN_XMON_WR);
> +		if (xmon_is_ro)
> +			printf("xmon: Read-only due to kernel lockdown\n");
> +	}
> +
> +	return lockdown;
> +}
> +#else /* CONFIG_SECURITY */
> +static inline bool xmon_is_locked_down(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  static struct pt_regs *xmon_regs;
>  
>  static inline void sync(void)
> @@ -438,7 +469,10 @@ static bool wait_for_other_cpus(int ncpus)
>  
>  	return false;
>  }
> -#endif /* CONFIG_SMP */
> +#else /* CONFIG_SMP */
> +static inline void get_output_lock(void) {}
> +static inline void release_output_lock(void) {}
> +#endif
>  
>  static inline int unrecoverable_excp(struct pt_regs *regs)
>  {
> @@ -455,6 +489,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
>  	int cmd = 0;
>  	struct bpt *bp;
>  	long recurse_jmp[JMP_BUF_LEN];
> +	bool locked_down;
>  	unsigned long offset;
>  	unsigned long flags;
>  #ifdef CONFIG_SMP
> @@ -465,6 +500,8 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
>  	local_irq_save(flags);
>  	hard_irq_disable();
>  
> +	locked_down = xmon_is_locked_down();
> +
>  	tracing_enabled = tracing_is_on();
>  	tracing_off();
>  
> @@ -516,7 +553,8 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
>  
>  	if (!fromipi) {
>  		get_output_lock();
> -		excprint(regs);
> +		if (!locked_down)
> +			excprint(regs);
>  		if (bp) {
>  			printf("cpu 0x%x stopped at breakpoint 0x%tx (",
>  			       cpu, BP_NUM(bp));
> @@ -568,10 +606,14 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
>  		}
>  		remove_bpts();
>  		disable_surveillance();
> -		/* for breakpoint or single step, print the current instr. */
> -		if (bp || TRAP(regs) == 0xd00)
> -			ppc_inst_dump(regs->nip, 1, 0);
> -		printf("enter ? for help\n");
> +
> +		if (!locked_down) {
> +			/* for breakpoint or single step, print curr insn */
> +			if (bp || TRAP(regs) == 0xd00)
> +				ppc_inst_dump(regs->nip, 1, 0);
> +			printf("enter ? for help\n");
> +		}
> +
>  		mb();
>  		xmon_gate = 1;
>  		barrier();
> @@ -595,8 +637,9 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
>  			spin_cpu_relax();
>  			touch_nmi_watchdog();
>  		} else {
> -			cmd = cmds(regs);
> -			if (cmd != 0) {
> +			if (!locked_down)
> +				cmd = cmds(regs);
> +			if (locked_down || cmd != 0) {
>  				/* exiting xmon */
>  				insert_bpts();
>  				xmon_gate = 0;
> @@ -633,13 +676,16 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
>  			       "can't continue\n");
>  		remove_bpts();
>  		disable_surveillance();
> -		/* for breakpoint or single step, print the current instr. */
> -		if (bp || TRAP(regs) == 0xd00)
> -			ppc_inst_dump(regs->nip, 1, 0);
> -		printf("enter ? for help\n");
> +		if (!locked_down) {
> +			/* for breakpoint or single step, print current insn */
> +			if (bp || TRAP(regs) == 0xd00)
> +				ppc_inst_dump(regs->nip, 1, 0);
> +			printf("enter ? for help\n");
> +		}
>  	}
>  
> -	cmd = cmds(regs);
> +	if (!locked_down)
> +		cmd = cmds(regs);
>  
>  	insert_bpts();
>  	in_xmon = 0;
> @@ -668,7 +714,10 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
>  		}
>  	}
>  #endif
> -	insert_cpu_bpts();
> +	if (locked_down)
> +		clear_all_bpt();
> +	else
> +		insert_cpu_bpts();
>  
>  	touch_nmi_watchdog();
>  	local_irq_restore(flags);
> @@ -3767,7 +3816,6 @@ static int __init setup_xmon_sysrq(void)
>  device_initcall(setup_xmon_sysrq);
>  #endif /* CONFIG_MAGIC_SYSRQ */
>  
> -#ifdef CONFIG_DEBUG_FS
>  static void clear_all_bpt(void)
>  {
>  	int i;
> @@ -3786,9 +3834,12 @@ static void clear_all_bpt(void)
>  		dabr.enabled = 0;
>  	}
>  
> +	get_output_lock();
>  	printf("xmon: All breakpoints cleared\n");
> +	release_output_lock();
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
>  static int xmon_dbgfs_set(void *data, u64 val)
>  {
>  	xmon_on = !!val;
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 429f9f03372b..ba9d308689b6 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -116,12 +116,14 @@ enum lockdown_reason {
>  	LOCKDOWN_MODULE_PARAMETERS,
>  	LOCKDOWN_MMIOTRACE,
>  	LOCKDOWN_DEBUGFS,
> +	LOCKDOWN_XMON_WR,
>  	LOCKDOWN_INTEGRITY_MAX,
>  	LOCKDOWN_KCORE,
>  	LOCKDOWN_KPROBES,
>  	LOCKDOWN_BPF_READ,
>  	LOCKDOWN_PERF,
>  	LOCKDOWN_TRACEFS,
> +	LOCKDOWN_XMON_RW,
>  	LOCKDOWN_CONFIDENTIALITY_MAX,
>  };
>  
> diff --git a/security/lockdown/lockdown.c b/security/lockdown/lockdown.c
> index 0068cec77c05..db85182d3f11 100644
> --- a/security/lockdown/lockdown.c
> +++ b/security/lockdown/lockdown.c
> @@ -31,12 +31,14 @@ static char *lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1] = {
>  	[LOCKDOWN_MODULE_PARAMETERS] = "unsafe module parameters",
>  	[LOCKDOWN_MMIOTRACE] = "unsafe mmio",
>  	[LOCKDOWN_DEBUGFS] = "debugfs access",
> +	[LOCKDOWN_XMON_WR] = "xmon write access",
>  	[LOCKDOWN_INTEGRITY_MAX] = "integrity",
>  	[LOCKDOWN_KCORE] = "/proc/kcore access",
>  	[LOCKDOWN_KPROBES] = "use of kprobes",
>  	[LOCKDOWN_BPF_READ] = "use of bpf to read kernel RAM",
>  	[LOCKDOWN_PERF] = "unsafe use of perf",
>  	[LOCKDOWN_TRACEFS] = "use of tracefs",
> +	[LOCKDOWN_XMON_RW] = "xmon read and write access",
>  	[LOCKDOWN_CONFIDENTIALITY_MAX] = "confidentiality",
>  };
>  
> -- 
> 2.23.0
