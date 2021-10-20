Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4538243430C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 03:43:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYtff6yPcz3cSM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 12:43:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.180;
 helo=mail-qt1-f180.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYtfD0MGkz2yWL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 12:42:42 +1100 (AEDT)
Received: by mail-qt1-f180.google.com with SMTP id w2so1777787qtn.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=phuizum7Jvmwq/i5uKXc0tZWrbM+XXyJMZ25fUOpTLs=;
 b=0D22pzHvHBDBwDaGLJ4q4JHnV9zlNRjTkRu4Kc5jlM0UNQ+tC4Xk+poOZmundcaANj
 y4j+3Z7y3GDwEvyC2+s6y1L99R1kZq6+ApeoWh3EzTbFl5aUheC+aemmAVc2O8EygCXJ
 vM0FocvRMBugCx2upEwME0lqQjRByAOrhgsgq0GcmNtFRvY3dXIiEGinTAY+LhFEGEdC
 9WxHBYb/M8cBix0UNZJPAbCvJlPQqYowox8f5Ne3jHlNsobrwu/7d3UQ3CvXI30fHcVb
 AAn131fKf68X6OMk5v7Q8SR6O4OVz/ceou6TEiGrWaEk/1y0eTeflrtIr2S3078Wnf6C
 ZZRw==
X-Gm-Message-State: AOAM531QjXfWGj7UCaGUNHBIQgOPN84M78L234PDMkHlQB3P0v6AGyN3
 Q/IFFZuVIVk+XcgKqF8B3uq/92TahRw=
X-Google-Smtp-Source: ABdhPJxajQ+Nzpy+/3pTV7V8l11UlD9HzCI8ibv4Wr+a4q9zKOY9a2TVodYzELJj54Wq24+6rq/cbw==
X-Received: by 2002:ac8:578c:: with SMTP id v12mr3888257qta.400.1634694158979; 
 Tue, 19 Oct 2021 18:42:38 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170])
 by smtp.gmail.com with ESMTPSA id y22sm366687qkj.93.2021.10.19.18.42.38
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 18:42:38 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id r17so1697760qtx.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:42:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1050:: with SMTP id
 f16mr3965552qte.127.1634694158181; 
 Tue, 19 Oct 2021 18:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211019030555.29461-1-Meng.Li@windriver.com>
In-Reply-To: <20211019030555.29461-1-Meng.Li@windriver.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 19 Oct 2021 20:42:27 -0500
X-Gmail-Original-Message-ID: <CADRPPNSuZ9Jidm7tg+BTu_iwbxHE8i+1J3wkPLF0CZuGNd3RDg@mail.gmail.com>
Message-ID: <CADRPPNSuZ9Jidm7tg+BTu_iwbxHE8i+1J3wkPLF0CZuGNd3RDg@mail.gmail.com>
Subject: Re: [PATCH] driver: soc: dpio: use the whole functions to protect
 critical zone
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Youri Querry <youri.querry_1@nxp.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 18, 2021 at 10:07 PM <Meng.Li@windriver.com> wrote:
>
> From: Meng Li <Meng.Li@windriver.com>
>
> In orininal code, use 2 function spin_lock() and local_irq_save() to
> protect the critical zone. But when enable the kernel debug config,
> there are below inconsistent lock state detected.
> ================================
> WARNING: inconsistent lock state
> 5.10.63-yocto-standard #1 Not tainted
> --------------------------------
> inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
> lock_torture_wr/226 [HC0[0]:SC1[5]:HE1:SE0] takes:
> ffff002005b2dd80 (&p->access_spinlock){+.?.}-{3:3}, at: qbman_swp_enqueue_multiple_mem_back+0x44/0x270
> {SOFTIRQ-ON-W} state was registered at:
>   lock_acquire.part.0+0xf8/0x250
>   lock_acquire+0x68/0x84
>   _raw_spin_lock+0x68/0x90
>   qbman_swp_enqueue_multiple_mem_back+0x44/0x270
>   ......
>   cryptomgr_test+0x38/0x60
>   kthread+0x158/0x164
>   ret_from_fork+0x10/0x38
> irq event stamp: 4498
> hardirqs last  enabled at (4498): [<ffff800010fcf980>] _raw_spin_unlock_irqrestore+0x90/0xb0
> hardirqs last disabled at (4497): [<ffff800010fcffc4>] _raw_spin_lock_irqsave+0xd4/0xe0
> softirqs last  enabled at (4458): [<ffff8000100108c4>] __do_softirq+0x674/0x724
> softirqs last disabled at (4465): [<ffff80001005b2a4>] __irq_exit_rcu+0x190/0x19c
>
> other info that might help us debug this:
>  Possible unsafe locking scenario:
>        CPU0
>        ----
>   lock(&p->access_spinlock);
>   <Interrupt>
>     lock(&p->access_spinlock);
>  *** DEADLOCK ***
>
> So, in order to avoid deadlock, use the whole functinos

s/functinos/functions/

> spin_lock_irqsave/spin_unlock_irqrestore() to protect critical zone.
>
> Fixes: 3b2abda7d28c ("soc: fsl: dpio: Replace QMAN array mode with ring mode enqueue")
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

Applied for fix.  Thanks.

> ---
>  drivers/soc/fsl/dpio/qbman-portal.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
> index 845e91416b58..a56dbe4de34f 100644
> --- a/drivers/soc/fsl/dpio/qbman-portal.c
> +++ b/drivers/soc/fsl/dpio/qbman-portal.c
> @@ -785,8 +785,7 @@ int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
>         int i, num_enqueued = 0;
>         unsigned long irq_flags;
>
> -       spin_lock(&s->access_spinlock);
> -       local_irq_save(irq_flags);
> +       spin_lock_irqsave(&s->access_spinlock, irq_flags);
>
>         half_mask = (s->eqcr.pi_ci_mask>>1);
>         full_mask = s->eqcr.pi_ci_mask;
> @@ -797,8 +796,7 @@ int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
>                 s->eqcr.available = qm_cyc_diff(s->eqcr.pi_ring_size,
>                                         eqcr_ci, s->eqcr.ci);
>                 if (!s->eqcr.available) {
> -                       local_irq_restore(irq_flags);
> -                       spin_unlock(&s->access_spinlock);
> +                       spin_unlock_irqrestore(&s->access_spinlock, irq_flags);
>                         return 0;
>                 }
>         }
> @@ -837,8 +835,7 @@ int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
>         dma_wmb();
>         qbman_write_register(s, QBMAN_CINH_SWP_EQCR_PI,
>                                 (QB_RT_BIT)|(s->eqcr.pi)|s->eqcr.pi_vb);
> -       local_irq_restore(irq_flags);
> -       spin_unlock(&s->access_spinlock);
> +       spin_unlock_irqrestore(&s->access_spinlock, irq_flags);
>
>         return num_enqueued;
>  }
> --
> 2.17.1
>
