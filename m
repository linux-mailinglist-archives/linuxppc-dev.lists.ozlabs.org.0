Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A0043DAEE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 07:59:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfvyj2hTfz3bnC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 16:59:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=vYjyS+8E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=vYjyS+8E; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfksM2v6gz3f6V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 10:09:11 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so6408408pjl.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 16:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XJfFTW9EjYJeHoclf1SeEwj25PLenE7ts5EFTr8vzec=;
 b=vYjyS+8EH3CfIBezSrdmSEFFSJc1bpK8IsDLNwp4SIdgzIr0qhB73jSdQ+tZtt+gKe
 gLRCAnofL8DMkcE7vLBKcZfntvEYsCybXJMFIekVgyaoqoB4d2yoy2/fxl6NKOgXIYmd
 GMEiLNFKg0iVmrnBvlpV4pv/PV+nqVeQwlB1PLBrwM8b8vjtjZjGvc3MJRrAfuUoDBNo
 ViaF9lo0gQuECLSnf0dUVzQmZPRvjI+cvfCWgH2cYeMbb2VhrXJlj9sEs5Y4vYC263de
 h2wbGwEHNdbZkGS/4AP/MxQ7HKYBbqiVTjD7lo6//33sqHBHnP35ISg1TmvMKaMznq9A
 cKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XJfFTW9EjYJeHoclf1SeEwj25PLenE7ts5EFTr8vzec=;
 b=cwgi+iPhrxPPl3u0Wso+Ggb42hLbkSA8DzrgDWfCNk1+K9CoRa3rPQsTW3fim1SvEu
 Wx/xi9EU539GJbWYxFp5QCBEBvzyUhY3swzNPz62kO8OO2Z5BaMdmHM+CX0ZMl/sWq1A
 YCOGVPx8+lw07GV+0xd1BvLEbfFfvgGh/qiGx8m9oIluJUly2J8YnY2vzsYxbF7xqx++
 MNGqWVhVIRaicH+kVCQDmgSV7hpKzScPRjTxSysRf8lCfvpJNvdfFdtVQWrIJ8sfabBA
 7ayZ97yqGV/Vd4CMFYTbga2iNkzfJgen0iSSkFdqE5AoqpSpUBXXjUPRLztYIhO3qcN0
 IUug==
X-Gm-Message-State: AOAM531INMJ8dz/zgCiJ2rViQ+PxF9CCLsPNukRTJGPu73/W7WBsQlIV
 t+G3mmaMp7eUwfSNuvy785AEMA==
X-Google-Smtp-Source: ABdhPJxUJYglQ4uyqyrvUHQJ2HBzLbAnkI4OfP0sJtC8YPLND6BbQ0gKrpcxmED13rpzsyQoceaG3g==
X-Received: by 2002:a17:903:246:b0:13f:2ff9:8b93 with SMTP id
 j6-20020a170903024600b0013f2ff98b93mr652035plh.54.1635376148047; 
 Wed, 27 Oct 2021 16:09:08 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:60fc:a50:6d27:9fd3])
 by smtp.gmail.com with ESMTPSA id bg15sm739067pjb.15.2021.10.27.16.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 16:09:07 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:09:07 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Oct 2021 16:09:01 PDT (-0700)
Subject: Re: [PATCH v2 18/45] riscv: Use do_kernel_power_off()
In-Reply-To: <20211027211715.12671-19-digetx@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: digetx@gmail.com
Message-ID: <mhng-fd8f451c-4860-4b0c-a155-6f65891cd276@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Oct 2021 16:58:51 +1100
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
Cc: ulf.hansson@linaro.org, dalias@libc.org, linux-ia64@vger.kernel.org,
 tmaimon77@gmail.com, ssantosh@kernel.org, rafael@kernel.org,
 boris.ostrovsky@oracle.com, catalin.marinas@arm.com, linus.walleij@linaro.org,
 dave.hansen@linux.intel.com, x86@kernel.org, tali.perry1@gmail.com,
 James.Bottomley@HansenPartnership.com, thierry.reding@gmail.com,
 guoren@kernel.org, pavel@ucw.cz, hpa@zytor.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com, will@kernel.org,
 gerg@linux-m68k.org, sstabellini@kernel.org, benjaminfair@google.com,
 ysato@users.sourceforge.jp, krzysztof.kozlowski@canonical.com,
 linux-sh@vger.kernel.org, lee.jones@linaro.org, deller@gmx.de,
 daniel.lezcano@linaro.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 jonathanh@nvidia.com, tony@atomide.com, wens@csie.org, mingo@redhat.com,
 geert@linux-m68k.org, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, linux@roeck-us.net, lenb@kernel.org,
 aou@eecs.berkeley.edu, linux-omap@vger.kernel.org, j.neuschaefer@gmx.net,
 vz@mleia.com, linux-acpi@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 broonie@kernel.org, bp@alien8.de, green.hu@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 tglx@linutronix.de, andriy.shevchenko@linux.intel.com, yuenn@google.com,
 linux-arm-kernel@lists.infradead.org, jgross@suse.com,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 avifishman70@gmail.com, venture@google.com, linux-pm@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 paulus@samba.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, funaho@jurai.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Oct 2021 14:16:48 PDT (-0700), digetx@gmail.com wrote:
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/riscv/kernel/reset.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 9c842c41684a..912288572226 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -23,16 +23,12 @@ void machine_restart(char *cmd)
>
>  void machine_halt(void)
>  {
> -	if (pm_power_off != NULL)
> -		pm_power_off();
> -	else
> -		default_power_off();
> +	do_kernel_power_off();
> +	default_power_off();
>  }
>
>  void machine_power_off(void)
>  {
> -	if (pm_power_off != NULL)
> -		pm_power_off();
> -	else
> -		default_power_off();
> +	do_kernel_power_off();
> +	default_power_off();
>  }

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
