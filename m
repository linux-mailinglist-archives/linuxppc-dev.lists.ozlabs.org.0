Return-Path: <linuxppc-dev+bounces-12591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF06BA4F97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Sep 2025 21:35:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cYLR96mdyz2xjv;
	Sat, 27 Sep 2025 05:35:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758915349;
	cv=none; b=fxryLnDorDMXk5or8iOkCV0FyzRw4uQ2KMos1vh026LtkBEDT7IcrtpIIBRCp8t8ZfI9+hn0yMKmg0U8xoO3AhLYZpYysbPb5sb8a23bZkAV50ViDKDUsEs+rVFKMhd0lCHnOjzL1ewdVCPUWmc8wM5fszJJwiVb2DD4F+dvvkZk25os0llc2E6ic5pJqgGmxXKuOwoE2r2mmLrwbteFkhM9xkz4Z+EFu8OYKvIlS2WhmTCxBRENM5vr2VQX0/mezdZAXmbeZ762jr/6gxG4dz3G8sSOjpgAOecnMr6mMlUNClofvrehT0vJ3k8c7JkqnmQJUY6fqK9G1hjfeM8z5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758915349; c=relaxed/relaxed;
	bh=oY1hglVyTWd1KeCI5NfVNHgyGT0tzUUrNBNxvpJcPL4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wqu1BS16wJ+nleD4QAw/+qvTQmxwNxqnpgB076Y3jsDRyClqpXUFBRuTfb6hfs2XmoikThD1OpeI3RANEYQMCIP0PgZaPlCg4C8aMyWiyIX83/koA05B8nIlcAIjOem2Y+RNfMCSdjhCFTMSeqjF/waldYLezSQCAf8tjJcKp2gJJy/9GE/z5Z5PBCMQsONNs58io54hwauIZfFyyuguiL6i2QQpJqrlGiDavn14vPSrftDsIiVM6xDEn8uOZ1MXJ9cmokrUnK9x7I0GydTdr1IY4NrSbnBxKvZjIj12BW1v4ehS2jL4ryYusO3g0e1sgekFOZrc8CcRx0BCCtXvWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5uq5j8z; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5uq5j8z; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5uq5j8z;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5uq5j8z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cYLR72vjgz2xK5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Sep 2025 05:35:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758915341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oY1hglVyTWd1KeCI5NfVNHgyGT0tzUUrNBNxvpJcPL4=;
	b=e5uq5j8z7//PPlcJg0wdMuL02uZlvNj/n3VNNU0T/HP86FUzvujp9BGcFSTI2fb7kUjQG3
	/RS7mMW3GMgfG9sD5R9KM47IhS171k7HQdvSPyaj+NHn/vFeCle2LbmE1WLu/K+e9Nn7U4
	OkLcRQyT8zACR/jR66lekL9qnoqhWtM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758915341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oY1hglVyTWd1KeCI5NfVNHgyGT0tzUUrNBNxvpJcPL4=;
	b=e5uq5j8z7//PPlcJg0wdMuL02uZlvNj/n3VNNU0T/HP86FUzvujp9BGcFSTI2fb7kUjQG3
	/RS7mMW3GMgfG9sD5R9KM47IhS171k7HQdvSPyaj+NHn/vFeCle2LbmE1WLu/K+e9Nn7U4
	OkLcRQyT8zACR/jR66lekL9qnoqhWtM=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-e8FZiJZlONG0N5Mtbwu3Uw-1; Fri, 26 Sep 2025 15:35:39 -0400
X-MC-Unique: e8FZiJZlONG0N5Mtbwu3Uw-1
X-Mimecast-MFC-AGG-ID: e8FZiJZlONG0N5Mtbwu3Uw_1758915338
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-4264c256677so7271085ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 12:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758915338; x=1759520138;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oY1hglVyTWd1KeCI5NfVNHgyGT0tzUUrNBNxvpJcPL4=;
        b=VL6/hwchmuSVGPOxzLretTLYiDeqfTopfo9A1pbJOOvb8GsiX4ABHssSz3d3kC4231
         oRmGM14U7KvCEzgSvVg15XwClIqIn/q4ECu24dSoZuFE8OpbV1gZTZFeQJzZFopIO1BV
         wYkIJ6IaxgKE7jloPXQuWxR6zjKZx0gNFt/YB116XDC2QbfFH0Uy73Pe+wZk5KVDigmg
         WOTeVtE6CSmS7gyNfR4TdvDb1jgKZRXmry4XxugrHo7jazwymny2yZ2n4Mbtcr6D2u9D
         4k7495BDNr5XUbniMaTHeuxFZsO2O0mZQhNsmbKULjn+tni2YA8rPsXBZNK2CHzv3uGo
         KOmw==
X-Forwarded-Encrypted: i=1; AJvYcCUx6LiCACBYfk1S//EjRFv6n6MP5m1DetUXbxYKAtKkwg6ds8Sr5jVCi2ZA6oGgkrxnAmi2xlQr3h2tYys=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPJGcgLpwg96tzW1IRvuDrGeIcm74tV0HMVOB6ks7johZ7evti
	MT7PKDaiJ/Gwc7+Hnui2jrupAv0qFGP05nAAkT/e/bZqft5MHnoVjWwHjiFdomvUUsWZrNJ0cw3
	HhGGg/4im7HA0TuHGfxphq0eqkBKBklVPNGLz6v6Oo8acIu4Wyr66kZARFaf1CHMXaHw=
X-Gm-Gg: ASbGncuWb5ZJZOYD83m9cuCRhjmaH+IBzKjfZm4DYpP+vBoIa0WdC+dEKPXI20JZ6iX
	wz8TAQ+d45bhQZWRC6MLHTbP0DH2oenvRxHTGKmjFuZZYLS5KteECVtjjV0UevvsmJr/5NZTiPB
	kNcEe2KGC/JRITfS6bMyTZRuPpUcng31oU8e5ouW26BuFMxcIZx5MQ/A2aSnM3LXsyCMbcwLUyd
	CMlXIxqYPUJ+MITpt0mFyFa5sBr0rCUi//kehP2Vh1wwYZhv/WQaFqfcWxBI+LeD+jBucbgR9TO
	7hGkccphbgOAJiVeC8dI20WCfbnfk5P5u9r9G3DnJgM=
X-Received: by 2002:a05:6602:15c9:b0:893:6203:3724 with SMTP id ca18e2360f4ac-9013213d540mr426976439f.0.1758915338396;
        Fri, 26 Sep 2025 12:35:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR2DnZA3GXqQrAUC6ZcTCJTXIWsAJfpwgJcYcU5jtBTsOVnpzauFMrgUuqFC0eBpZO46rZjA==
X-Received: by 2002:a05:6602:15c9:b0:893:6203:3724 with SMTP id ca18e2360f4ac-9013213d540mr426974539f.0.1758915337866;
        Fri, 26 Sep 2025 12:35:37 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-904100c3cfcsm206353739f.23.2025.09.26.12.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 12:35:37 -0700 (PDT)
Date: Fri, 26 Sep 2025 13:35:34 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: kvm <kvm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH v4] vfio/pci: Fix INTx handling on legacy non-PCI 2.3
 devices
Message-ID: <20250926133534.0d8084f5.alex.williamson@redhat.com>
In-Reply-To: <333803015.1744464.1758647073336.JavaMail.zimbra@raptorengineeringinc.com>
References: <333803015.1744464.1758647073336.JavaMail.zimbra@raptorengineeringinc.com>
Organization: Red Hat
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wa-ILEeshPwRQssB9PMh6Ti8IkyUdEB_LLtAwLjvD-Y_1758915338
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 23 Sep 2025 12:04:33 -0500 (CDT)
Timothy Pearson <tpearson@raptorengineering.com> wrote:

> PCI devices prior to PCI 2.3 both use level interrupts and do not support
> interrupt masking, leading to a failure when passed through to a KVM guest on
> at least the ppc64 platform. This failure manifests as receiving and
> acknowledging a single interrupt in the guest, while the device continues to
> assert the level interrupt indicating a need for further servicing.
> 
> When lazy IRQ masking is used on DisINTx- (non-PCI 2.3) hardware, the following
> sequence occurs:
> 
>  * Level IRQ assertion on device
>  * IRQ marked disabled in kernel
>  * Host interrupt handler exits without clearing the interrupt on the device
>  * Eventfd is delivered to userspace
>  * Guest processes IRQ and clears device interrupt
>  * Device de-asserts INTx, then re-asserts INTx while the interrupt is masked
>  * Newly asserted interrupt acknowledged by kernel VMM without being handled
>  * Software mask removed by VFIO driver
>  * Device INTx still asserted, host controller does not see new edge after EOI
> 
> The behavior is now platform-dependent.  Some platforms (amd64) will continue
> to spew IRQs for as long as the INTX line remains asserted, therefore the IRQ
> will be handled by the host as soon as the mask is dropped.  Others (ppc64) will
> only send the one request, and if it is not handled no further interrupts will
> be sent.  The former behavior theoretically leaves the system vulnerable to
> interrupt storm, and the latter will result in the device stalling after
> receiving exactly one interrupt in the guest.
> 
> Work around this by disabling lazy IRQ masking for DisINTx- INTx devices.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/vfio/pci/vfio_pci_intrs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
> index 123298a4dc8f..61d29f6b3730 100644
> --- a/drivers/vfio/pci/vfio_pci_intrs.c
> +++ b/drivers/vfio/pci/vfio_pci_intrs.c
> @@ -304,9 +304,14 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
>  
>  	vdev->irq_type = VFIO_PCI_INTX_IRQ_INDEX;
>  
> +	if (!vdev->pci_2_3)
> +		irq_set_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
> +
>  	ret = request_irq(pdev->irq, vfio_intx_handler,
>  			  irqflags, ctx->name, ctx);
>  	if (ret) {
> +		if (!vdev->pci_2_3)
> +			irq_clear_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
>  		vdev->irq_type = VFIO_PCI_NUM_IRQS;
>  		kfree(name);
>  		vfio_irq_ctx_free(vdev, ctx, 0);
> @@ -352,6 +357,8 @@ static void vfio_intx_disable(struct vfio_pci_core_device *vdev)
>  		vfio_virqfd_disable(&ctx->unmask);
>  		vfio_virqfd_disable(&ctx->mask);
>  		free_irq(pdev->irq, ctx);
> +		if (!vdev->pci_2_3)
> +			irq_clear_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
>  		if (ctx->trigger)
>  			eventfd_ctx_put(ctx->trigger);
>  		kfree(ctx->name);

As expected, I don't note any functional issues with this on x86.  I
didn't do a full statistical analysis, but I suspect this might
slightly reduce the mean interrupt rate (netperf TCP_RR) and increase
the standard deviation, but not sufficiently worrisome for a niche use
case like this.

Applied to vfio next branch for v6.18.  Thanks,

Alex


