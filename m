Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540B8494031
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 19:52:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfFBD19Vhz3bSq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 05:52:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jB8jTGft;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=jB8jTGft; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfF9W4bhMz3050
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 05:51:40 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 187so3237812pga.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 10:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p4+HpvQqpXWwOnnXQVxrBDcjJ5yInc/mHBvdCwo/eqE=;
 b=jB8jTGftBMXo7MjLtldaBa1YH3NRmecF1y+pwQjHfQtUOVs0sUXRi5UTthYKtoUhfO
 9gidudV/7NVCgC7Sy5njjUvBQuV82xuHTATdFKnFvPrzrV2Be/b4VTXhm+IPdPHi/95B
 yhgMPppJjJm18KCshVGY3K2kICbvbWhXQPDis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p4+HpvQqpXWwOnnXQVxrBDcjJ5yInc/mHBvdCwo/eqE=;
 b=ijj1VhWfnBdpyCPCSl6Lxiz8HtdPhRoES6vuXiv3gTZ/m9WryUeNkcBeGmgu39z5cK
 Sgi8u8+o6P6pWOUGPrx1ZdFviQIRh5S7MGiOdhc37NdfPGnrw3XxegvGji7Rzxiv7DUs
 Ef2ojvHhQSOu3W+9erO17SjCGjd4A/0dAin1iqg86GGF0fxKQuOEilXBSIpVhoLQ793o
 1MtBgp/dSPoCnOSEWg/2dBNNlspuH4DdZLneerUWTX9K9MrgWeq/6oS8VFJg+dtkglGl
 8HzeIDG+8PNaZNsgUuDJKhe+o0OuungWTxhZptfKZzeYYt7ODn+157keMq7JkKZW6m+S
 geYQ==
X-Gm-Message-State: AOAM532s8O3P/j5LcFb8N0NuNik3+VeyFmTNq0JVKr/qcgOy0qEyPLRq
 WTAOZU7MnhdHVX27PnZACmNeWg==
X-Google-Smtp-Source: ABdhPJyqQae4RrbN+8YvLzLqk5/OqW4MahzZOqILFVoW0wHcIsva/dbqktfdkKKRqs7wtIGsGOSxrw==
X-Received: by 2002:a63:eb07:: with SMTP id t7mr28591515pgh.112.1642618295553; 
 Wed, 19 Jan 2022 10:51:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id md18sm108396pjb.9.2022.01.19.10.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 10:51:35 -0800 (PST)
Date: Wed, 19 Jan 2022 10:51:34 -0800
From: Kees Cook <keescook@chromium.org>
To: He Ying <heying24@huawei.com>
Subject: Re: [PATCH] powerpc/process, kasan: Silence KASAN warnings in
 __get_wchan()
Message-ID: <202201191051.E49ED291@keescook>
References: <20220119015025.136902-1-heying24@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119015025.136902-1-heying24@huawei.com>
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
Cc: catalin.marinas@arm.com, linux-kernel@vger.kernel.org, sxwjean@gmail.com,
 peterz@infradead.org, paulus@samba.org, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 18, 2022 at 08:50:25PM -0500, He Ying wrote:
> The following KASAN warning was reported in our kernel.
> 
>   BUG: KASAN: stack-out-of-bounds in get_wchan+0x188/0x250
>   Read of size 4 at addr d216f958 by task ps/14437
> 
>   CPU: 3 PID: 14437 Comm: ps Tainted: G           O      5.10.0 #1
>   Call Trace:
>   [daa63858] [c0654348] dump_stack+0x9c/0xe4 (unreliable)
>   [daa63888] [c035cf0c] print_address_description.constprop.3+0x8c/0x570
>   [daa63908] [c035d6bc] kasan_report+0x1ac/0x218
>   [daa63948] [c00496e8] get_wchan+0x188/0x250
>   [daa63978] [c0461ec8] do_task_stat+0xce8/0xe60
>   [daa63b98] [c0455ac8] proc_single_show+0x98/0x170
>   [daa63bc8] [c03cab8c] seq_read_iter+0x1ec/0x900
>   [daa63c38] [c03cb47c] seq_read+0x1dc/0x290
>   [daa63d68] [c037fc94] vfs_read+0x164/0x510
>   [daa63ea8] [c03808e4] ksys_read+0x144/0x1d0
>   [daa63f38] [c005b1dc] ret_from_syscall+0x0/0x38
>   --- interrupt: c00 at 0x8fa8f4
>       LR = 0x8fa8cc
> 
>   The buggy address belongs to the page:
>   page:98ebcdd2 refcount:0 mapcount:0 mapping:00000000 index:0x2 pfn:0x1216f
>   flags: 0x0()
>   raw: 00000000 00000000 01010122 00000000 00000002 00000000 ffffffff 00000000
>   raw: 00000000
>   page dumped because: kasan: bad access detected
> 
>   Memory state around the buggy address:
>    d216f800: 00 00 00 00 00 f1 f1 f1 f1 00 00 00 00 00 00 00
>    d216f880: f2 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   >d216f900: 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1 00
>                                             ^
>    d216f980: f2 f2 f2 f2 f2 f2 f2 00 00 00 00 00 00 00 00 00
>    d216fa00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 
> After looking into this issue, I find the buggy address belongs
> to the task stack region. It seems KASAN has something wrong.
> I look into the code of __get_wchan in x86 architecture and
> find the same issue has been resolved by the commit
> f7d27c35ddff ("x86/mm, kasan: Silence KASAN warnings in get_wchan()").
> The solution could be applied to powerpc architecture too.
> 
> As Andrey Ryabinin said, get_wchan() is racy by design, it may
> access volatile stack of running task, thus it may access
> redzone in a stack frame and cause KASAN to warn about this.
> 
> Use READ_ONCE_NOCHECK() to silence these warnings.
> 
> Signed-off-by: He Ying <heying24@huawei.com>

Looks reasonable to me; thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/powerpc/kernel/process.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 984813a4d5dc..a75d20f23dac 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2160,12 +2160,12 @@ static unsigned long ___get_wchan(struct task_struct *p)
>  		return 0;
>  
>  	do {
> -		sp = *(unsigned long *)sp;
> +		sp = READ_ONCE_NOCHECK(*(unsigned long *)sp);
>  		if (!validate_sp(sp, p, STACK_FRAME_OVERHEAD) ||
>  		    task_is_running(p))
>  			return 0;
>  		if (count > 0) {
> -			ip = ((unsigned long *)sp)[STACK_FRAME_LR_SAVE];
> +			ip = READ_ONCE_NOCHECK(((unsigned long *)sp)[STACK_FRAME_LR_SAVE]);
>  			if (!in_sched_functions(ip))
>  				return ip;
>  		}
> -- 
> 2.17.1
> 

-- 
Kees Cook
