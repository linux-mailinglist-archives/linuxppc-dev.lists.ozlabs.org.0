Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B477434300
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 03:35:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYtVJ4nKlz3cQp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 12:35:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.48; helo=mail-qv1-f48.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYtTs6KQqz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 12:35:27 +1100 (AEDT)
Received: by mail-qv1-f48.google.com with SMTP id z3so1164748qvl.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RUYSv1Ml+e5O/S44qXhwpad8q6ZJhXnlabD5d8PHlfE=;
 b=AUYNU9EnYfhG353UnbJALRcw1HHC23/2vvGsNN/BdSealy6ulCkTSikez+mXX/5N5U
 DlYRbvsWYRifDdANABfVMkHe1ms3Ru8Uika9MDsWt8Un0/mRRPR7tEMuF08x88148QXd
 FAQmmITkazbcYMPDMgkQgl6FhAD+ucc3TlMcd6+jcI8q18TEzIrMjhtBnFSoK4nDM/Sr
 XSrfHwACDVhM0S8vbFE4obCwDSzlJbakgJKR+pY5tONJNztZV9zt9FwmXPc7iH9t90vO
 vQdJGiC/1TpzqCshkesGlkHdK07gDEct1L9avNBUV/zBmqDY3edovE+3GJZ9Y2VvQQ1C
 VApQ==
X-Gm-Message-State: AOAM532r1q7QVEZ3Zm8ba0MsQIar2xZgTF6bKt7p3LI05vy9IXigf3/6
 ZwzGd1O3KRGbuFK2yV8aaZQFIurXHDQ=
X-Google-Smtp-Source: ABdhPJxZBP7ZzKEEDAyFBDtwI7KHg6Vau0RPIptlTXIXKHE+KHFqQoGObxKk9UIWB56fMuiVARiu0g==
X-Received: by 2002:ad4:5966:: with SMTP id eq6mr3423643qvb.64.1634693719099; 
 Tue, 19 Oct 2021 18:35:19 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com.
 [209.85.222.175])
 by smtp.gmail.com with ESMTPSA id n20sm407512qkk.63.2021.10.19.18.35.18
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 18:35:18 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id p4so1813157qki.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:35:18 -0700 (PDT)
X-Received: by 2002:a37:c12:: with SMTP id 18mr3064225qkm.12.1634693718152;
 Tue, 19 Oct 2021 18:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211019023241.17466-1-Meng.Li@windriver.com>
In-Reply-To: <20211019023241.17466-1-Meng.Li@windriver.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 19 Oct 2021 20:35:06 -0500
X-Gmail-Original-Message-ID: <CADRPPNRVAqptuD_cf+vtcD4UBbL+2uT0fjnw14QS=8_tpt1bjQ@mail.gmail.com>
Message-ID: <CADRPPNRVAqptuD_cf+vtcD4UBbL+2uT0fjnw14QS=8_tpt1bjQ@mail.gmail.com>
Subject: Re: [PATCH v2] soc: fsl: dpio: instead smp_processor_id with
 raw_smp_processor_id
To: Meng.Li@windriver.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>,
 Horia Geanta <horia.geanta@nxp.com>, Roy Pledge <Roy.Pledge@nxp.com>,
 lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 18, 2021 at 9:46 PM <Meng.Li@windriver.com> wrote:
>
> From: Meng Li <Meng.Li@windriver.com>
>
> When enable debug kernel configs,there will be calltrace as below:
>
> BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> caller is debug_smp_processor_id+0x20/0x30
> CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.10.63-yocto-standard #1
> Hardware name: NXP Layerscape LX2160ARDB (DT)
> Call trace:
>  dump_backtrace+0x0/0x1a0
>  show_stack+0x24/0x30
>  dump_stack+0xf0/0x13c
>  check_preemption_disabled+0x100/0x110
>  debug_smp_processor_id+0x20/0x30
>  dpaa2_io_query_fq_count+0xdc/0x154
>  dpaa2_eth_stop+0x144/0x314
>  __dev_close_many+0xdc/0x160
>  __dev_change_flags+0xe8/0x220
>  dev_change_flags+0x30/0x70
>  ic_close_devs+0x50/0x78
>  ip_auto_config+0xed0/0xf10
>  do_one_initcall+0xac/0x460
>  kernel_init_freeable+0x30c/0x378
>  kernel_init+0x20/0x128
>  ret_from_fork+0x10/0x38
>
> Based on comment in the context, it doesn't matter whether
> preemption is disable or not. So, instead smp_processor_id()

s/instead/replace/g

> with raw_smp_processor_id() to avoid above call trace.
>
> v2:
> Remove the preempt_disable/enable() protection, instead smp_processor_id
> with raw_smp_processor_id.

The revision history information should go after the "---" below.

>
> Fixes: c89105c9b390 ("staging: fsl-mc: Move DPIO from staging to drivers/soc/fsl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

I helped to fix the issues I mentioned.  Applied for fix.  Thanks.

> ---
>  drivers/soc/fsl/dpio/dpio-service.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
> index 19f47ea9dab0..3050a534d42c 100644
> --- a/drivers/soc/fsl/dpio/dpio-service.c
> +++ b/drivers/soc/fsl/dpio/dpio-service.c
> @@ -59,7 +59,7 @@ static inline struct dpaa2_io *service_select_by_cpu(struct dpaa2_io *d,
>          * potentially being migrated away.
>          */
>         if (cpu < 0)
> -               cpu = smp_processor_id();
> +               cpu = raw_smp_processor_id();
>
>         /* If a specific cpu was requested, pick it up immediately */
>         return dpio_by_cpu[cpu];
> --
> 2.17.1
>
