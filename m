Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F381D7420
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 11:33:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QYjX2qKczDqb0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 19:33:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OMjsPKlR; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QYgp4F12zDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 19:32:06 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id o24so8461500oic.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V4KeqXR0hNSztYcChgmQJ2RuPcBryFoEBZpBxPtEK1g=;
 b=OMjsPKlRJNovbMXdN7PC/UbB5x/ok9CgOjvbFeDQaKLZcapBo3SmFsXhl83qYpeZ1X
 4v1doHRPZgTJVULZfhezrgsDQreWoBgxlrMarCoklCE7VNrjmX+ye/wxY2Jpvt6zAqID
 ix5IUJQHrwMMGEwuDeMMKIu9xJ2J4asRqkaAxus1vfjk31DjrcgDGNhte6g3uhOlYXG0
 NVyh2phiENxysE4topMDwC1/uRUMc73XhiabkiCuJoZVyLvcvxb6g5LC0lwkgVv0h7Mx
 CwfMRI9GUcmmVkdnjjeWDYT32nse3PfOrJTiaWPbat/+q26ucbFrVEEuAFQMYRtY9kvn
 ze+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V4KeqXR0hNSztYcChgmQJ2RuPcBryFoEBZpBxPtEK1g=;
 b=AzWxHS2KUz0gmadKqk9IQRYT4hN+9tGlF8L8A6uz9zNY2eflmfEsa5Co9KTNjkE9IC
 HHeSr7sEtsq+b9v7SST6yS0VPV64J+3th/JuLykM5K6Khf4S1NZIOfr6s0xdiASG1MHv
 3x9Pxz4qt0Ob6NLq6v+xzlPC76KLbOCJJVW1uwJNtpv991Tsr2AD76z/LqbsAAjF6ft1
 QQZXaTJyFo3qr4IbduhqTs0Q1pyQ4ErS3FaL0KmQFnoTE5tJjZwvMAm1CPST1JW0OPqv
 q5rOhfcCUcy67q3pI6KZBBocD5wIhHvWZt/8UXwjySCeBMc/uqK84Qa+gq5y5uIra5Vg
 27tA==
X-Gm-Message-State: AOAM5306w71dhxIPndpemseFm3Uft1DtBrp7ZC7okiugf7Q1RhdZXRjT
 rezx7L/9aQwzgCYCCg2o2og=
X-Google-Smtp-Source: ABdhPJyQZxsr3+7xZB5tqZ22a95AwBRRBavHJtII9Q46eLcjZ4yUF4AIUVQSrdTx74t1cjcXxMFn/g==
X-Received: by 2002:aca:e1d6:: with SMTP id y205mr1544032oig.142.1589794322753; 
 Mon, 18 May 2020 02:32:02 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id r14sm2820213otk.60.2020.05.18.02.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 02:32:02 -0700 (PDT)
Date: Mon, 18 May 2020 02:32:00 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/wii: Fix declaration made after definition
Message-ID: <20200518093200.GA719945@ubuntu-s3-xlarge-x86>
References: <20200413190644.16757-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413190644.16757-1-natechancellor@gmail.com>
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
Cc: kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 13, 2020 at 12:06:45PM -0700, Nathan Chancellor wrote:
> A 0day randconfig uncovered an error with clang, trimmed for brevity:
> 
> arch/powerpc/platforms/embedded6xx/wii.c:195:7: error: attribute
> declaration must precede definition [-Werror,-Wignored-attributes]
>         if (!machine_is(wii))
>              ^
> 
> The macro machine_is declares mach_##name but define_machine actually
> defines mach_##name, hence the warning.
> 
> To fix this, move define_machine after the is_machine usage.
> 
> Fixes: 5a7ee3198dfa ("powerpc: wii: platform support")
> Reported-by: kbuild test robot <lkp@intel.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/989
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/powerpc/platforms/embedded6xx/wii.c | 25 ++++++++++++------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
> index 67e48b0a164e..a802ef957d63 100644
> --- a/arch/powerpc/platforms/embedded6xx/wii.c
> +++ b/arch/powerpc/platforms/embedded6xx/wii.c
> @@ -172,19 +172,6 @@ static void wii_shutdown(void)
>  	flipper_quiesce();
>  }
>  
> -define_machine(wii) {
> -	.name			= "wii",
> -	.probe			= wii_probe,
> -	.setup_arch		= wii_setup_arch,
> -	.restart		= wii_restart,
> -	.halt			= wii_halt,
> -	.init_IRQ		= wii_pic_probe,
> -	.get_irq		= flipper_pic_get_irq,
> -	.calibrate_decr		= generic_calibrate_decr,
> -	.progress		= udbg_progress,
> -	.machine_shutdown	= wii_shutdown,
> -};
> -
>  static const struct of_device_id wii_of_bus[] = {
>  	{ .compatible = "nintendo,hollywood", },
>  	{ },
> @@ -200,3 +187,15 @@ static int __init wii_device_probe(void)
>  }
>  device_initcall(wii_device_probe);
>  
> +define_machine(wii) {
> +	.name			= "wii",
> +	.probe			= wii_probe,
> +	.setup_arch		= wii_setup_arch,
> +	.restart		= wii_restart,
> +	.halt			= wii_halt,
> +	.init_IRQ		= wii_pic_probe,
> +	.get_irq		= flipper_pic_get_irq,
> +	.calibrate_decr		= generic_calibrate_decr,
> +	.progress		= udbg_progress,
> +	.machine_shutdown	= wii_shutdown,
> +};
> 
> base-commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
> -- 
> 2.26.0
> 

Gentle ping for review/acceptance.

Cheers,
Nathan
