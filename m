Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C32C3417
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 23:37:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgf5x4B21zDqbX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 09:37:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=NEGAHRpR; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=ZMUN54SZ; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgf4J1zBtzDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:35:44 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606257334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRW3k8t/OUrpGW8c3MLXqEButobcfnyhEWJHhSJlBTM=;
 b=NEGAHRpROMitKtzsGdA4PHsRgObzoo/ECbp8sJI9Rgi7HN6KjVduYw/5NeXqp93ESkGzKJ
 PNFgwDL3avIq+ioErc1CzmZvwYcLKGFecXoXjUdzmb8wYNtTnLMSx8yVa/w4alNdnrzSYE
 nWDWvYMi8DQfRoa3+lSekcQ0eH/UvJHtdsaK6E5SzUki5v1D5Bck0u/Vw3MhdGnL3Hd9fI
 LO7uL1LV1HoWOFHUn5bqDTYRCsGkqELO/y8ogwMUU9rcsvYJDD4eHsY+L+Vy4xetWbXtzu
 UIMgaDCA+l49jKid+eKARRChyBgEmS3Ho66K879x+36wUwkCdl72cqFF3W5qPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606257334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRW3k8t/OUrpGW8c3MLXqEButobcfnyhEWJHhSJlBTM=;
 b=ZMUN54SZWoEE76hGf7VoMwUkXmS7N4Qtkcet9EDtRmSHFQvarvQMcXjAwEc23CvP3GagUJ
 IrrQoVVzEFQgdWDQ==
To: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] powerpc/pseries: pass MSI affinity to
 irq_create_mapping()
In-Reply-To: <20201124200308.1110744-3-lvivier@redhat.com>
References: <20201124200308.1110744-1-lvivier@redhat.com>
 <20201124200308.1110744-3-lvivier@redhat.com>
Date: Tue, 24 Nov 2020 23:35:34 +0100
Message-ID: <87eekil6x5.fsf@nanos.tec.linutronix.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Marc Zyngier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 24 2020 at 21:03, Laurent Vivier wrote:
> With virtio multiqueue, normally each queue IRQ is mapped to a CPU.
>
> This problem cannot be shown on x86_64 for two reasons:

There is only _ONE_ reason why this is not a problem on x86. x86 uses
the generic PCI/MSI domain which supports this out of the box.

> - the call path traverses arch_setup_msi_irqs() that is arch specific:
>
>    virtscsi_probe()
>       virtscsi_init()
>          vp_modern_find_vqs()
>             vp_find_vqs()
>                vp_find_vqs_msix()
>                   pci_alloc_irq_vectors_affinity()
>                      __pci_enable_msix_range()
>                         pci_msi_setup_msi_irqs()
>                            arch_setup_msi_irqs()
>                               rtas_setup_msi_irqs()

This is a problem on _all_ variants of PPC MSI providers, not only for
pseries. It's not restricted to virtscsi devices either, that's just the
device which made you discover this.

Thanks,

        tglx





