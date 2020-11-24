Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7F2C1ACC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 02:27:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg5xN4rjJzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 12:27:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cg5vW54YRzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 12:26:15 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id h19so5222232otr.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 17:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=en+JssiqProhjdMr0CjlUCY8pgd39iHi9DtH1hOV64c=;
 b=ZujKmElOrWvvZ0WA3mrOb29t19TFmzvqyLjawiq7wW0M/coixKBNlmfiP7MJhpuagQ
 LFTdMek8odykXl/xydd5M0zHWKgaR6c/dDattqYRtSNKeQDr6GzQxjAW55+S5IIlCzMV
 4LVP6BIUlQSnqqOrIumLR8XtaXH7grpjLIlX1xNMhUeNC6XGQgEk5slvUGWNbWMKbSET
 31YNRb+MI0mxSJlBPTayNNMqAwilk87ScUkcIX2Kukfh31Ma22TtnQ5Jtzu3Jj3m/HdI
 9l+zTx5cTourxRUQZ+o1Y+/iTDi3o9V00wz5GekOJqIBv9WBLlw58e7mwxEzGdCY23dL
 46tw==
X-Gm-Message-State: AOAM531zw1iBScxqmAXj4MwZn1leMuyT5mirjj9oLQd6WlRfMDkVhswS
 9zbOEGFGTDitWquDxx3xhSXPJsLQlX6sHA==
X-Google-Smtp-Source: ABdhPJwB9PUuFge4mLOXmO7d/yA9fSDOakZXf9BAZBjlyAp6s1mQhih9X7BDvAzTULeCU79JlwTdVg==
X-Received: by 2002:a05:6830:1e08:: with SMTP id
 s8mr1701081otr.144.1606181172837; 
 Mon, 23 Nov 2020 17:26:12 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48])
 by smtp.gmail.com with ESMTPSA id 43sm7724583otf.28.2020.11.23.17.26.11
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 17:26:12 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id k3so17841741otp.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 17:26:11 -0800 (PST)
X-Received: by 2002:a05:6830:160d:: with SMTP id
 g13mr1726753otr.74.1606181171265; 
 Mon, 23 Nov 2020 17:26:11 -0800 (PST)
MIME-Version: 1.0
References: <20201020021832.36846-1-wang.yi59@zte.com.cn>
In-Reply-To: <20201020021832.36846-1-wang.yi59@zte.com.cn>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 23 Nov 2020 19:25:59 -0600
X-Gmail-Original-Message-ID: <CADRPPNQU2a-OCt6vaax3LbFBuS7+orYF85Ea3GX=TBKRh+9Q-A@mail.gmail.com>
Message-ID: <CADRPPNQU2a-OCt6vaax3LbFBuS7+orYF85Ea3GX=TBKRh+9Q-A@mail.gmail.com>
Subject: Re: [PATCH v3] soc: fsl: dpio: Get the cpumask through cpumask_of(cpu)
To: Yi Wang <wang.yi59@zte.com.cn>
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
Cc: jiang.xuexin@zte.com.cn, Hao Si <si.hao@zte.com.cn>,
 Roy Pledge <Roy.Pledge@nxp.com>, lkml <linux-kernel@vger.kernel.org>,
 Lin Chen <chen.lin5@zte.com.cn>, xue.zhihong@zte.com.cn,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 19, 2020 at 9:15 PM Yi Wang <wang.yi59@zte.com.cn> wrote:
>
> From: Hao Si <si.hao@zte.com.cn>
>
> The local variable 'cpumask_t mask' is in the stack memory, and its address
> is assigned to 'desc->affinity' in 'irq_set_affinity_hint()'.
> But the memory area where this variable is located is at risk of being
> modified.
>
> During LTP testing, the following error was generated:
>
> Unable to handle kernel paging request at virtual address ffff000012e9b790
> Mem abort info:
>   ESR = 0x96000007
>   Exception class = DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
> Data abort info:
>   ISV = 0, ISS = 0x00000007
>   CM = 0, WnR = 0
> swapper pgtable: 4k pages, 48-bit VAs, pgdp = 0000000075ac5e07
> [ffff000012e9b790] pgd=00000027dbffe003, pud=00000027dbffd003,
> pmd=00000027b6d61003, pte=0000000000000000
> Internal error: Oops: 96000007 [#1] PREEMPT SMP
> Modules linked in: xt_conntrack
> Process read_all (pid: 20171, stack limit = 0x0000000044ea4095)
> CPU: 14 PID: 20171 Comm: read_all Tainted: G    B   W
> Hardware name: NXP Layerscape LX2160ARDB (DT)
> pstate: 80000085 (Nzcv daIf -PAN -UAO)
> pc : irq_affinity_hint_proc_show+0x54/0xb0
> lr : irq_affinity_hint_proc_show+0x4c/0xb0
> sp : ffff00001138bc10
> x29: ffff00001138bc10 x28: 0000ffffd131d1e0
> x27: 00000000007000c0 x26: ffff8025b9480dc0
> x25: ffff8025b9480da8 x24: 00000000000003ff
> x23: ffff8027334f8300 x22: ffff80272e97d000
> x21: ffff80272e97d0b0 x20: ffff8025b9480d80
> x19: ffff000009a49000 x18: 0000000000000000
> x17: 0000000000000000 x16: 0000000000000000
> x15: 0000000000000000 x14: 0000000000000000
> x13: 0000000000000000 x12: 0000000000000040
> x11: 0000000000000000 x10: ffff802735b79b88
> x9 : 0000000000000000 x8 : 0000000000000000
> x7 : ffff000009a49848 x6 : 0000000000000003
> x5 : 0000000000000000 x4 : ffff000008157d6c
> x3 : ffff00001138bc10 x2 : ffff000012e9b790
> x1 : 0000000000000000 x0 : 0000000000000000
> Call trace:
>  irq_affinity_hint_proc_show+0x54/0xb0
>  seq_read+0x1b0/0x440
>  proc_reg_read+0x80/0xd8
>  __vfs_read+0x60/0x178
>  vfs_read+0x94/0x150
>  ksys_read+0x74/0xf0
>  __arm64_sys_read+0x24/0x30
>  el0_svc_common.constprop.0+0xd8/0x1a0
>  el0_svc_handler+0x34/0x88
>  el0_svc+0x10/0x14
> Code: f9001bbf 943e0732 f94066c2 b4000062 (f9400041)
> ---[ end trace b495bdcb0b3b732b ]---
> Kernel panic - not syncing: Fatal exception
> SMP: stopping secondary CPUs
> SMP: failed to stop secondary CPUs 0,2-4,6,8,11,13-15
> Kernel Offset: disabled
> CPU features: 0x0,21006008
> Memory Limit: none
> ---[ end Kernel panic - not syncing: Fatal exception ]---
>
> Fix it by using 'cpumask_of(cpu)' to get the cpumask.
>
> Signed-off-by: Hao Si <si.hao@zte.com.cn>
> Signed-off-by: Lin Chen <chen.lin5@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>

Applied for fix.  Thanks.

> ---
> v3: Use cpumask_of(cpu) to get the pre-defined cpumask in the static
> cpu_bit_bitmap array.
> v2: Place 'cpumask_t mask' in the driver's private data and while at it,
> rename it to cpu_mask.
>
>  drivers/soc/fsl/dpio/dpio-driver.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
> index 7b642c3..7f397b4 100644
> --- a/drivers/soc/fsl/dpio/dpio-driver.c
> +++ b/drivers/soc/fsl/dpio/dpio-driver.c
> @@ -95,7 +95,6 @@ static int register_dpio_irq_handlers(struct fsl_mc_device *dpio_dev, int cpu)
>  {
>         int error;
>         struct fsl_mc_device_irq *irq;
> -       cpumask_t mask;
>
>         irq = dpio_dev->irqs[0];
>         error = devm_request_irq(&dpio_dev->dev,
> @@ -112,9 +111,7 @@ static int register_dpio_irq_handlers(struct fsl_mc_device *dpio_dev, int cpu)
>         }
>
>         /* set the affinity hint */
> -       cpumask_clear(&mask);
> -       cpumask_set_cpu(cpu, &mask);
> -       if (irq_set_affinity_hint(irq->msi_desc->irq, &mask))
> +       if (irq_set_affinity_hint(irq->msi_desc->irq, cpumask_of(cpu)))
>                 dev_err(&dpio_dev->dev,
>                         "irq_set_affinity failed irq %d cpu %d\n",
>                         irq->msi_desc->irq, cpu);
> --
> 2.15.2
