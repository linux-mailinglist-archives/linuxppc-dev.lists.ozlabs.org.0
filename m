Return-Path: <linuxppc-dev+bounces-12523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDAAB92881
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 20:01:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVrXH2ljzz304l;
	Tue, 23 Sep 2025 04:01:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758564095;
	cv=none; b=MtGA1nDUsFFiFdkvYJtnZnZVN3692I4zxI+eUVeZknm/E6K61YV8d3IIE5yjLmQ/nnxGbvI44RnT+6GyyxGLQmXV7WSTxJsHDYLZXMBIEs688GVnF1dGrZRShWieRQ5712wINcJCZhhAVzzMeH3CeeiREk5R2wHzN8/FzmecmdGu0zzhyxYR1JcW4sRYTIaeDUEqONXClx0kW6jWyz9o3bapJUKymXkhEThXl7VE7JjyI647/GHjyh4435v/xPFTuROJn3MS/XlfuNZ/ASsM8kvqdOlKsRVsINlk/c/F7kmq1lzWczSaz2F3kKcuiTAoLP+nn5xNjNHkJ0PNywqHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758564095; c=relaxed/relaxed;
	bh=460DG1Ic4Vy4ZRI7OvE4PwRA1Kutoztc9uoODBEFv+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ethokoY1GzEa4bRBr9FWL0M5o2yiAJc9OqnRBfakfZtywW99UuQHo4FRZkPnYYzIBPkKv+fKPMXEclEjLHmkW0ThzWFttiTK5tUN52AizIb/+9YPSLKE2yCrR/Se1KeRlGoLVK+4IfeLlU8eqVGQF2cFwOm+0wtQRE7Wo26swpLaFZRVo/Pbzul20FqUZz9FnIARQzQ9o+gwHftc8y+knLVJgb5GvDdxTybW5dHEcU2CLFPPjwQNUGYxo3CQhLowczUPAn1FmGqZs3y8tJeAUvrFbo8OOoL31n1kV3ezfXoWaQRrfMhyK5bM0wYix/GPpOsUYy7F9J/Zg/U+Wmhhyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LLm0bEeF; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LLm0bEeF; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LLm0bEeF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LLm0bEeF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVrXG27hVz2yrQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 04:01:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758564090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=460DG1Ic4Vy4ZRI7OvE4PwRA1Kutoztc9uoODBEFv+Y=;
	b=LLm0bEeFceGCSPWkwVVT2nTl68F4EZngtlmHECHttp/fDZkBbnq/EodVHvjbI/vhEtPS+l
	JdERSTfJkCKuqVwVi3isJmzuwSnH/pM9YZg2bw1q3Pgl43P2khX+u2Brgb3kKDsbnZtOH+
	dCzisWEhvGVmTrb8i7CjghbPXjtKOqQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758564090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=460DG1Ic4Vy4ZRI7OvE4PwRA1Kutoztc9uoODBEFv+Y=;
	b=LLm0bEeFceGCSPWkwVVT2nTl68F4EZngtlmHECHttp/fDZkBbnq/EodVHvjbI/vhEtPS+l
	JdERSTfJkCKuqVwVi3isJmzuwSnH/pM9YZg2bw1q3Pgl43P2khX+u2Brgb3kKDsbnZtOH+
	dCzisWEhvGVmTrb8i7CjghbPXjtKOqQ=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-NeT7DiB9NIa0bo11jWnBXw-1; Mon, 22 Sep 2025 14:01:28 -0400
X-MC-Unique: NeT7DiB9NIa0bo11jWnBXw-1
X-Mimecast-MFC-AGG-ID: NeT7DiB9NIa0bo11jWnBXw_1758564087
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-3413a52b3fdso370568fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 11:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758564087; x=1759168887;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=460DG1Ic4Vy4ZRI7OvE4PwRA1Kutoztc9uoODBEFv+Y=;
        b=H3c5unqdrhVnyGfORx9QTR9IUx9qnm8LkmIA5uGRYshOb2qiHpvlfdAgAix0C5K5Ut
         0+qV6t6dPqkxE8mSZAliUXPTychfqDTmWj7inP42FZ1uK62nHap3A5No/rvQCE8yICh/
         OLDm5WRavXbPi8b+HXPKz4/juAmo2CoK4Cqj+tA+BaS8E/tv7qXB64npXprlBtQ+PzSk
         jG22iAVntDzXDaornS74s0qinAa+txxUph8Mp3Wr7mtwxQMmXzAKqbawC85iVU2+okjp
         u93ZoM1said6xz+Q0WAArViFe5LPXV04R0o1Vofe+0V9F3TSEcBm6HwEqc26hmTYfI4w
         s8sA==
X-Forwarded-Encrypted: i=1; AJvYcCWRorrDMRQUSWCH30XMEUlzoRHsQ4BLtmxz7I3H3cRD5M2IOg1DrIGOKhERrg4cpwHgTLrqm3RcZoqTR5M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+8jOIR2ObwPI3h29+bu55TF/VLVz1W8UpMh+47/an9ewHqyR+
	8ABJ65S++vw57p3gbcAP3+YNIe+MvGQEv+X8yj9mrfSX3Ga9DfT5ixehs48hMocpjyOxnM2Ub4L
	C14nbDnOBEVSMi6kf2G4qx+s7KrGpsytdLbmIMr0Z//vQDBqbN1WGHcpR4kxJMfAGmuY=
X-Gm-Gg: ASbGncvtx0EPHsYNVEHNQvLK7SY/VuNI71zozM0plbgiBNW8Ifafc1Sjn4bxggH68er
	pAmpt4R4cbhNL4JHLWOtrMLcPBJhBijZ1friKb4JC4Mi8fEzV6dzoZjc4vCgvg96OTlmEgM6JgL
	xarUronm8y/All8w1jj2IXewA3QxF8qeROFFaFGZC9S1sOYQokqPUrRG4+yf5AgdWO0Ndjy9NqN
	312UkYuXTXX7iXBcUSt9MX+MYnES9T1g0hfwru7xtrOFBXuqixD6YB433Juzlwdgilz6pt4nmYx
	fzloLb3QSfgS3VOesQy+9OVhkbRfY3FDn7Ufdg7/q+Q=
X-Received: by 2002:a05:6870:b629:b0:315:9799:3034 with SMTP id 586e51a60fabf-33bb25f83c2mr4002019fac.4.1758564086767;
        Mon, 22 Sep 2025 11:01:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYnIMKXh5y99WxhdDkDbr916ivwJuVlh0A+q2C84lnCRCzbEmhjL5pCZQH6SAgTllCOi6PJQ==
X-Received: by 2002:a05:6870:b629:b0:315:9799:3034 with SMTP id 586e51a60fabf-33bb25f83c2mr4001999fac.4.1758564086216;
        Mon, 22 Sep 2025 11:01:26 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-625d881f9b9sm4159648eaf.1.2025.09.22.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 11:01:25 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:01:22 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: kvm <kvm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] vfio/pci: Fix INTx handling on legacy non-PCI 2.3
 devices
Message-ID: <20250922120122.4e9942e8.alex.williamson@redhat.com>
In-Reply-To: <912864077.1743059.1758561514856.JavaMail.zimbra@raptorengineeringinc.com>
References: <912864077.1743059.1758561514856.JavaMail.zimbra@raptorengineeringinc.com>
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
X-Mimecast-MFC-PROC-ID: OThF-45NHsCp65g5Zsl75RSDGe3QoiaA-1z7nG_tNr8_1758564087
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 22 Sep 2025 12:18:34 -0500 (CDT)
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
>  * Host interrupt controller sees still-active INTX, reasserts IRQ
>  * Host kernel ignores disabled IRQ
>  * Guest processes IRQ and clears device interrupt
>  * Software mask removed by VFIO driver

This isn't the sequence that was previously identified as the issue.
An interrupt controller that reasserts the IRQ when it remains active
is not susceptible to the issue, and is what I think we generally
expect on x86.  I understand that we believe this issue manifests
exactly because the interrupt controller does not reassert an interrupt
that remains active.  I think the sequence is:

 * device asserts INTx
 * vfio_intx_handler() calls disable_irq_nosync() to mark IRQ disabled
 * interrupt delivered to userspace via eventfd
 * userspace driver/VM services interrupt
 * device de-asserts INTx
 * device re-asserts INTx
 * interrupt received while IRQ disabled is masked at controller
 * VMM performs EOI via unmask ioctl, enable_irq() clears disable and
   unmasks IRQ
 * interrupt controller does not reassert interrupt to the host

The fix then, aiui, is that disabling the unlazy mode masks the
interrupt at disable_irq_nosync(), the same sequence of de-asserting
and re-asserting the interrupt occurs at the controller, but since the
controller was masked at the new rising edge, it will send the
interrupt when umasked.

> The behavior is now platform-dependent.  Some platforms (amd64) will continue
> to spew IRQs for as long as the INTX line remains asserted, therefore the IRQ
> will be handled by the host as soon as the mask is dropped.  Others (ppc64) will
> only send the one request, and if it is not handled no further interrupts will
> be sent.  The former behavior theoretically leaves the system vulnerable to
> interrupt storm, and the latter will result in the device stalling after
> receiving exactly one interrupt in the guest.
> 
> Work around this by disabling lazy IRQ masking for DisINTx- INTx devices.
> ---
>  drivers/vfio/pci/vfio_pci_intrs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
> index 123298a4dc8f..d8637b53d051 100644
> --- a/drivers/vfio/pci/vfio_pci_intrs.c
> +++ b/drivers/vfio/pci/vfio_pci_intrs.c
> @@ -304,6 +304,9 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
>  
>  	vdev->irq_type = VFIO_PCI_INTX_IRQ_INDEX;
>  
> +	if (!vdev->pci_2_3)
> +		irq_set_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
> +
>  	ret = request_irq(pdev->irq, vfio_intx_handler,
>  			  irqflags, ctx->name, ctx);
>  	if (ret) {

This branch is an example of where we're not clearing the flag on
error.  Thanks,

Alex

> @@ -352,6 +355,8 @@ static void vfio_intx_disable(struct vfio_pci_core_device *vdev)
>  		vfio_virqfd_disable(&ctx->unmask);
>  		vfio_virqfd_disable(&ctx->mask);
>  		free_irq(pdev->irq, ctx);
> +		if (!vdev->pci_2_3)
> +			irq_clear_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
>  		if (ctx->trigger)
>  			eventfd_ctx_put(ctx->trigger);
>  		kfree(ctx->name);


