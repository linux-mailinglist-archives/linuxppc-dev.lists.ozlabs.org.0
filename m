Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D76102C44A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 17:07:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch5Q70rfKzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 03:07:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux-powerpc.org (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=kda@linux-powerpc.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-powerpc.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linux-powerpc-org.20150623.gappssmtp.com
 header.i=@linux-powerpc-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=hMOkWMlq; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch5NG4sXZzDq9b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 03:06:01 +1100 (AEDT)
Received: by mail-ed1-x541.google.com with SMTP id t9so3090276edq.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 08:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=sFDVHTtkdm3pyH75COND6ic4pQck9okc86/RtBFvaVI=;
 b=hMOkWMlqnjT5T3KheRXSvbIdWc0NiEKFzBE+kepT432F8AjcasejaLcbsYL3gRcK6J
 ktpTpW0CXLElE2ZL7r4kx+Sf/JXLCyemIYnO5j9/Gtw70XK0s4XXnBiaQW1OpYZgcm0q
 dGisF1IsRKDGTQLvcv56O+lvXfQSSNi1VCt5gnxq2iutLJThlpEoZzYNE2JMcFjo9gJ1
 qon852mKOuNW3HCJUF3xnnG6FWaC8o5Tn4RA6g/rPsz7N8e/gK1ml4P2l5sPsFQaq5Rt
 a9Tkd8knovVbgYgj9lrrk9Cc7sHyCadeUeHiOh3wMvr2n8O1sX2mb1g3YhHY5xXTyHGc
 RdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=sFDVHTtkdm3pyH75COND6ic4pQck9okc86/RtBFvaVI=;
 b=O/i0xiLvkBEImme69BDImnToYfiq49gPfZ8v3sghAhoJjAOTYQ+e+/Q+s2yuW7Th1h
 Imp0TPEb3WfTbovt7lUu6JtqbXB7VMsFxOomdkkLts24fgkhry+eTce3wPrI1Hx1yziv
 ZBuiSSssl9DYDuAxRh6eTsR8owATkUEdumBAExWw1fTiLvWeIrzvPCcpjIXBb+VdwMeG
 jJ3zeC01Bw7ONHCpQoPgAWP36a7wSORRK9drPnF94D1eBcSdPQ1hnwvQknrJT2xMl/IM
 xTGRSegZrOteqAWb1zCLWZXEYkyvl+OcIclyxcbObSXbTXPSuhWp3QiNiU6wHRTw2c9D
 arSw==
X-Gm-Message-State: AOAM530v9zN4FW1Y++Z10OHY6pQXFAAuwxpjhWc5Vb6M1fwTJa3D3UzK
 5FkIdQW6UviR84kX7C82mYwuIdTrvRNtmFWbqN4SnA==
X-Google-Smtp-Source: ABdhPJy6ob6fmz+u3HhkWotLkhYtQfkABfyx5NZ0czbNVWC4DVmL/HNnVx5U7U6w0UNe2yt5Khw04Spvyi6e7OSzN8E=
X-Received: by 2002:a05:6402:22e3:: with SMTP id
 dn3mr4377399edb.136.1606320357550; 
 Wed, 25 Nov 2020 08:05:57 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a54:3cc7:0:0:0:0:0 with HTTP; Wed, 25 Nov 2020 08:05:56
 -0800 (PST)
X-Originating-IP: [5.35.99.104]
In-Reply-To: <20201125150932.1150619-3-lvivier@redhat.com>
References: <20201125150932.1150619-1-lvivier@redhat.com>
 <20201125150932.1150619-3-lvivier@redhat.com>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Wed, 25 Nov 2020 19:05:56 +0300
Message-ID: <CAOJe8K1Q7sGf67bdj-2Mthkj4XNR4fOSskV1dyh62AdzefhpAQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] powerpc/pseries: pass MSI affinity to
 irq_create_mapping()
To: Laurent Vivier <lvivier@redhat.com>
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
Cc: Marc Zyngier <maz@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, Greg Kurz <groug@kaod.org>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/25/20, Laurent Vivier <lvivier@redhat.com> wrote:
> With virtio multiqueue, normally each queue IRQ is mapped to a CPU.
>
> But since commit 0d9f0a52c8b9f ("virtio_scsi: use virtio IRQ affinity")
> this is broken on pseries.

Please add "Fixes" tag.

Thanks!

>
> The affinity is correctly computed in msi_desc but this is not applied
> to the system IRQs.
>
> It appears the affinity is correctly passed to rtas_setup_msi_irqs() but
> lost at this point and never passed to irq_domain_alloc_descs()
> (see commit 06ee6d571f0e ("genirq: Add affinity hint to irq allocation"))
> because irq_create_mapping() doesn't take an affinity parameter.
>
> As the previous patch has added the affinity parameter to
> irq_create_mapping() we can forward the affinity from rtas_setup_msi_irqs()
> to irq_domain_alloc_descs().
>
> With this change, the virtqueues are correctly dispatched between the CPUs
> on pseries.
>
> BugId: https://bugzilla.redhat.com/show_bug.cgi?id=1702939
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>  arch/powerpc/platforms/pseries/msi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/msi.c
> b/arch/powerpc/platforms/pseries/msi.c
> index 133f6adcb39c..b3ac2455faad 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -458,7 +458,8 @@ static int rtas_setup_msi_irqs(struct pci_dev *pdev, int
> nvec_in, int type)
>  			return hwirq;
>  		}
>
> -		virq = irq_create_mapping(NULL, hwirq);
> +		virq = irq_create_mapping_affinity(NULL, hwirq,
> +						   entry->affinity);
>
>  		if (!virq) {
>  			pr_debug("rtas_msi: Failed mapping hwirq %d\n", hwirq);
> --
> 2.28.0
>
>
