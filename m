Return-Path: <linuxppc-dev+bounces-12553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5FAB98401
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 06:55:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWl0V4jNzz306d;
	Wed, 24 Sep 2025 14:55:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758646946;
	cv=none; b=A3hghCG0m+OTW1akmMcrrXelsEPSCPwAvJMmNbgV6/MkfKH9L238M3nS+sphYcpXg40Hdmhq9+3kSyqeyt4/bPQ6PQYiU0ve1r7MH+2D2MF0+j1dLboETz9BjAlyTeLRNGaTPtihee5Aslde5CB2Tqyhck9CgdqSY4HrOR8hi/nYAGLxf0X8k3ezGNNe+gsU8SRsqOQRz0N92maIe7KV/M/j9V8+fnSlJ5ePq8T2EoLR7SFgW/+u772XJKrvXV5o7qYMCEOGwhixYc98Sny7KQx8uFIH0M9mgmmEtsZtxLwAeq2AssQy0m8JfdvJvfS7vlNor7pA80Bd5tFDFkBgpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758646946; c=relaxed/relaxed;
	bh=+yVsTQAlBVDvjynp3S3KHSHcOn+gzz2S8kJWQRrsb8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5CGhCMeJXOf01gAyNoGWIoNsnrgzbstCU/0xX0HK3Nhk0RXXj1stJi/Q3OmX/F/rxYDkafbusCA1II108OrXbBEjskRTyn1jhQMhpeO44mirWxSX3jLGgDw94hRTHdhHG+gAvwhJRiZ68JSGKbaz2SOAb3+SvWqmoHOxn1Q5GJSb9Y7N5SzNE6tYgBEb+gZEk9nl9Qr+33vc63ZtK/02aNj+tIHfUSm549YEolYJfeQF0t68xJG6AXBHxT/m/I8e8oLAwESENT2Tk9baRN8h6tmDNhHDGdCf0xu0vdqlpq9aOXOx0TFDbeOs8qp0saipNw/OrgGi8eOJF9Gu0ll7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eMfoSAm5; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UHmdhhnL; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=clg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eMfoSAm5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UHmdhhnL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=clg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWR9X6TpJz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 03:02:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758646937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+yVsTQAlBVDvjynp3S3KHSHcOn+gzz2S8kJWQRrsb8k=;
	b=eMfoSAm5iCp64B7cBDh0AO/057Y8KYw7c1F/3XQwhA4rxUP58S+6AVp3S16a3mdOywMo92
	mSYsUsc4pM0+u2hA+La01jSuk9GEVJ4AMI3R63jgdb2Cojw1pMwNhDx69EKI7rjTiJOVE5
	4HO+zYPO8kjSkdAm4ZaS3DmMg8Ohfgs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758646938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+yVsTQAlBVDvjynp3S3KHSHcOn+gzz2S8kJWQRrsb8k=;
	b=UHmdhhnLoPxntIhmW0qMPEs1wQ8u4jShhCaiys1KSlSsgY1Y1h6Jp4IGW/bl6AaJrUEk4y
	TXfPItlMGK21+wg7+Ybe0hzhbc95XVCH65nydmbp57VkVqNXctkqH79vaEUusIWE27/GXH
	dSPNq23CWyTQP+8ggFluKAssTtNPrEg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-u-kmBmqxM3eA3gFW-UVL2w-1; Tue, 23 Sep 2025 13:02:15 -0400
X-MC-Unique: u-kmBmqxM3eA3gFW-UVL2w-1
X-Mimecast-MFC-AGG-ID: u-kmBmqxM3eA3gFW-UVL2w_1758646934
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3efa77de998so2715362f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 10:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758646934; x=1759251734;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yVsTQAlBVDvjynp3S3KHSHcOn+gzz2S8kJWQRrsb8k=;
        b=Fl5lryHnWePvjg13y8WrRMemkBsYkYnq8vBElKsjttKs/KiJ2vwT8HI3qxuBXNqhxC
         4irey7YZEjBNUXufdO3gX7FyCgX79cfTCVGqVTR8fQoAHUdEJ7yYG18QAY6j7LpB6GYf
         hac1FYffB8X0D4kDTcgTZ7GLqWJeO4VBWL42bA69QRo5BJ3NWg1HV+TEZ+fYMx/xRSPZ
         p2vSA08cZ+vDjRl8ygoHo+dwf38oTnzlMT9yOwqRCK0ChbORoFqSFpct0x4VvLhSYMRl
         rp2DzgFz7tvU5fafr28apCnhaoAaWU98kSM0DiBBu8kpJpkoFAhmJ5XeDbOUO73lMONt
         SlWQ==
X-Gm-Message-State: AOJu0YyKKdqQCSFm1Jzg/fxyl1ste+l+ySvrg5iPE59QroK9AazfrRwI
	97OI6vYVhnM5sBydQPIl302RfmL8NSubeB7B13er+vclFWVxOX8+ZKO1Y+K0zGcoxQtVaKYPK6v
	mdNraaVYeBSucWYjpZlrvM/6mFJNZYRLCbKx+VhZ+pyRGPTWrK/yyQrWbJKgriwDNCsQ=
X-Gm-Gg: ASbGnctzAglKVr3iXZ/O99AJy7VHvbXNTouy/rPOpKyry+VUhV1JbSBfWkhvw/hofmH
	2d0kryt2dHyuyn3DInfcASEAEIyu4ml9caA7TatYnPXkyBEGoVtUql1AK48CV+SL5/VRj4HUjuW
	mP+voloBc7WQKSDN5FJPro4YD7Kky/HZq2IhYZaM7DQmuWbC639Rxwsy0JXfsLnpJaGaQ7eFeps
	OfT/L4ravr2Ozzv+IiGwN2ihkv6VParxvl02SaTch9qJtAF5NlLtbU8RIPdmXbwOaRBl77LsiQl
	N8yuSfvqfiY4dCqTRgjI/J+kgJetLnNrI7L838JKL1suJ5MsAggXPMuiQ20iGvDMr2EaegZcJfP
	vTbw=
X-Received: by 2002:a05:6000:184f:b0:3ee:1492:aeac with SMTP id ffacd0b85a97d-405ca95972dmr3593630f8f.38.1758646934239;
        Tue, 23 Sep 2025 10:02:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk1FKJIA+oRLLUZLl85pUi0Wj5cslafO5JrAxW6RScXu4bROYWAr/9CVSMPLqkzQDlLQNw7g==
X-Received: by 2002:a05:6000:184f:b0:3ee:1492:aeac with SMTP id ffacd0b85a97d-405ca95972dmr3593596f8f.38.1758646933712;
        Tue, 23 Sep 2025 10:02:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a? ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3f70b47ca57sm14207316f8f.0.2025.09.23.10.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 10:02:13 -0700 (PDT)
Message-ID: <b1813fed-1dbe-40ad-a6e9-a5c86aea996c@redhat.com>
Date: Tue, 23 Sep 2025 19:02:12 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] vfio/pci: Fix INTx handling on legacy non-PCI 2.3
 devices
To: Timothy Pearson <tpearson@raptorengineering.com>,
 kvm <kvm@vger.kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <1293210747.1743219.1758565305521.JavaMail.zimbra@raptorengineeringinc.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <1293210747.1743219.1758565305521.JavaMail.zimbra@raptorengineeringinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9u1maVlneQGiWCETsOkwE6C6fszlp3hXDe1EPLzCSIk_1758646934
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/22/25 20:21, Timothy Pearson wrote:
> PCI devices prior to PCI 2.3 both use level interrupts and do not support
> interrupt masking, leading to a failure when passed through to a KVM guest on
> at least the ppc64 platform. This failure manifests as receiving and
> acknowledging a single interrupt in the guest, while the device continues to
> assert the level interrupt indicating a need for further servicing.
> 
> When lazy IRQ masking is used on DisINTx- (non-PCI 2.3) hardware, the following
> sequence occurs:
> 
>   * Level IRQ assertion on device
>   * IRQ marked disabled in kernel
>   * Host interrupt handler exits without clearing the interrupt on the device
>   * Eventfd is delivered to userspace
>   * Guest processes IRQ and clears device interrupt
>   * Device de-asserts INTx, then re-asserts INTx while the interrupt is masked
>   * Newly asserted interrupt acknowledged by kernel VMM without being handled
>   * Software mask removed by VFIO driver
>   * Device INTx still asserted, host controller does not see new edge after EOI
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

Timothy,

This changes lacks your SoB.

Thanks,

C.




> ---
>   drivers/vfio/pci/vfio_pci_intrs.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
> index 123298a4dc8f..61d29f6b3730 100644
> --- a/drivers/vfio/pci/vfio_pci_intrs.c
> +++ b/drivers/vfio/pci/vfio_pci_intrs.c
> @@ -304,9 +304,14 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
>   
>   	vdev->irq_type = VFIO_PCI_INTX_IRQ_INDEX;
>   
> +	if (!vdev->pci_2_3)
> +		irq_set_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
> +
>   	ret = request_irq(pdev->irq, vfio_intx_handler,
>   			  irqflags, ctx->name, ctx);
>   	if (ret) {
> +		if (!vdev->pci_2_3)
> +			irq_clear_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
>   		vdev->irq_type = VFIO_PCI_NUM_IRQS;
>   		kfree(name);
>   		vfio_irq_ctx_free(vdev, ctx, 0);
> @@ -352,6 +357,8 @@ static void vfio_intx_disable(struct vfio_pci_core_device *vdev)
>   		vfio_virqfd_disable(&ctx->unmask);
>   		vfio_virqfd_disable(&ctx->mask);
>   		free_irq(pdev->irq, ctx);
> +		if (!vdev->pci_2_3)
> +			irq_clear_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
>   		if (ctx->trigger)
>   			eventfd_ctx_put(ctx->trigger);
>   		kfree(ctx->name);


