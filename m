Return-Path: <linuxppc-dev+bounces-7189-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F96BA67B78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 18:58:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHKMn3rN2z2ySY;
	Wed, 19 Mar 2025 04:58:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742320725;
	cv=none; b=TyL0HrM6jFr5539qX43Yzx9ITZhTWP8Rr8v4uJFTODVvXEuoJ1yCFulixKF2D3856y5UBaBq2UaZgb8NO/N88DAPo89ywcoWwHvbW4STD02hnJueYQaE/FffgvOpADlRyVvMTotHyBdN7vx4kJRBatoofr9ljjCucrrQq+MnZUXCp/tpCIETnW3OpKShU8BtEG4HD3chmBPiKVnSoPYWE2C+7mIhBXN2kBNSGwWCXs5WSFqOe0w1yU4lzKREkh94kcOjz/RCwiM55LUJkQE/sF97Uv1Nc3PJeQSrwykspJsNFhmPpmVY2oyFai3Wbc++dNBs9xioRZGgIrQdZaHXow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742320725; c=relaxed/relaxed;
	bh=Bxl1Ld3BAp4jOPXx2r3UoMSFMwZHzeN8OlZBrkNTKbo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ab5q+kAvYeiNvbyYkLFqdVyNJAWAK613od2wgXQAYI5FmDB/2itB9VLQwBE7RWfYTbqqRcGKFEYY1HB31Gk47SKZz0zV4snFHpOzAwL9wbfYHNccSQmT2UyGVmgRlAlcictLGmJ5GmPA16F9u6J64Q5tK65auysiEqcSe039TMbJOntyYLB4ee5HhgvPqvRKuAoHtIPrqk+HNIGPhlQApyATsgMF2GZ49eBorLjcKdxT3ZQxeS9vQuLUIqpnDtCvkJK0JGv85VqsSBMnZnCE7xerhoRWvqqXshXaxmwytM1uAN0HuUbWjRMoInnc2AtlVAwI+Yo4hG/s2T9QEIUnzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7NFpWXh; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7NFpWXh; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7NFpWXh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7NFpWXh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHKMm3GB9z2yS4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 04:58:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742320718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bxl1Ld3BAp4jOPXx2r3UoMSFMwZHzeN8OlZBrkNTKbo=;
	b=L7NFpWXhqmR4EHEZHpwPW8xqYqu8UhWP5E+QOg7OnEYokwTG/f8ShsC/rRk1S4eMZEykYH
	UkMdooQQGjfF9tXStXSEGqV9j0G6nmcNrf0svO8LWbxYVm/7iaf+oF4Vu14v2w5M17GR+Q
	qREZZAMrtZ96zB1w1UxX/N9LGPaIlbY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742320718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bxl1Ld3BAp4jOPXx2r3UoMSFMwZHzeN8OlZBrkNTKbo=;
	b=L7NFpWXhqmR4EHEZHpwPW8xqYqu8UhWP5E+QOg7OnEYokwTG/f8ShsC/rRk1S4eMZEykYH
	UkMdooQQGjfF9tXStXSEGqV9j0G6nmcNrf0svO8LWbxYVm/7iaf+oF4Vu14v2w5M17GR+Q
	qREZZAMrtZ96zB1w1UxX/N9LGPaIlbY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-DDxCn_ycMpqi2WeC8EzVIA-1; Tue, 18 Mar 2025 13:58:36 -0400
X-MC-Unique: DDxCn_ycMpqi2WeC8EzVIA-1
X-Mimecast-MFC-AGG-ID: DDxCn_ycMpqi2WeC8EzVIA_1742320716
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85db97c5c47so52734439f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 10:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320716; x=1742925516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bxl1Ld3BAp4jOPXx2r3UoMSFMwZHzeN8OlZBrkNTKbo=;
        b=gC59uOtxNnJosXmt6Skly8kB0SvREbqULiItQ7zJmah3xhlv/qe6VtZYVYDskNMIum
         vmDn2AehD4tMYStZMgrq3+K4jsWZ9h95ahb8xI33sJjpCFRhlXSx0Fj2ziofZiL1/0wM
         x5+s+VBWjWJtENvAU3QRzeBThGU/h44Z+SckAETAA94u/XS1DnwHIOgjnlffbfVkQi0J
         gpetNy0+86P15cpHmKCjyB2z9+jmfuFoX0KcfqdU50d6EVzzXEpQDvOhnXKHBUVMQWX+
         9mzZjUzMKygFc13uWpapGk91+9bOCSvVkl2JTrPGuxKYbakHREVh2MpQNqVSa6Az5iSV
         F5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrSNLMVz4ZA0+bmyxgiLpe5AdTrmaTv1vDFd5N8rMwd0fQW+ew5Ty3ONJzCbzlOVB9QCmd9CmrcnF5PTA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4qK6kzhUuQrbQiejnfY06BQfGzEYwoCw9AEeDcmhVZppHoSKa
	ihwKe9Rbh/W1zslkuGwVXRHvslwWDALiKAh1p+ihL+e6rksgAU8FiTdQ7DlwnyfwMUTJeAHl7Bq
	/4J15BV3TkZ8QxpoBTC318PYXFKtZOOMpNEkwhbfGKQu75vsxh4W8snJoCcQROQE=
X-Gm-Gg: ASbGncsUP+x6YiHNEwrAG5njD5mu0aoMFE9G/LnfxTyOtPLJnt6N3POUNCDQxnwRtA0
	vcqyAYANpKq9t/NVvDM9x5LSY6qriFIwpq0oDQpApcxTJ9DTGPX5NAnmQqXjDHhRKksvZOJmNwn
	7q5bvLtqd8dx0U/wpkfhErgXiNGF+v/NO5DCUMkhrG6LMIcgW2zybmjD4NjNDTC/Y5rafa1Fzqo
	5Xw3H0cRPZWGwFINmWDJaSKumPAv/8lj9a05nVcgZ0BqGRMHKHKdlIKI/q59mufrHUcNHc3aqN/
	RnZJWZfBtAB92tticpc=
X-Received: by 2002:a05:6602:620e:b0:855:9e01:9acf with SMTP id ca18e2360f4ac-85dc4820bb0mr535551839f.1.1742320715762;
        Tue, 18 Mar 2025 10:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlkkLLnQNtTDFReWf7pCaR7vIy9TXueCWKVkZHXRvNIS2pfiS2nIoGKt6+5q9CMJ94ft2RMA==
X-Received: by 2002:a05:6602:620e:b0:855:9e01:9acf with SMTP id ca18e2360f4ac-85dc4820bb0mr535550839f.1.1742320715386;
        Tue, 18 Mar 2025 10:58:35 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f263816a1fsm2807665173.110.2025.03.18.10.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 10:58:34 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:58:32 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: jgg@ziepe.ca, kevin.tian@intel.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, yi.l.liu@intel.com, Yunxiang.Li@amd.com,
 pstanner@redhat.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] vfio: pci: Advertise INTx only if LINE is connected
Message-ID: <20250318115832.04abbea7.alex.williamson@redhat.com>
In-Reply-To: <174231895238.2295.12586708771396482526.stgit@linux.ibm.com>
References: <174231895238.2295.12586708771396482526.stgit@linux.ibm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -mJjtgQd0vE_sWPegQO2dy5v4dhTRmHsaYRt7EetxzQ_1742320716
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 18 Mar 2025 17:29:21 +0000
Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:

> On POWER systems, when the device is behind the io expander,
> not all PCI slots would have the PCI_INTERRUPT_LINE connected.
> The firmware assigns a valid PCI_INTERRUPT_PIN though. In such
> configuration, the irq_info ioctl currently advertizes the
> irq count as 1 as the PCI_INTERRUPT_PIN is valid.
> 
> The patch adds the additional check[1] if the irq is assigned
> for the PIN which is done iff the LINE is connected.
> 
> [1]: https://lore.kernel.org/qemu-devel/20250131150201.048aa3bf.alex.williamson@redhat.com/
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> Suggested-By: Alex Williamson <alex.williamson@redhat.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 586e49efb81b..4ce70f05b4a8 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -734,6 +734,10 @@ static int vfio_pci_get_irq_count(struct vfio_pci_core_device *vdev, int irq_typ
>  			return 0;
>  
>  		pci_read_config_byte(vdev->pdev, PCI_INTERRUPT_PIN, &pin);
> +#if IS_ENABLED(CONFIG_PPC64)
> +		if (!vdev->pdev->irq)
> +			pin = 0;
> +#endif
>  
>  		return pin ? 1 : 0;
>  	} else if (irq_type == VFIO_PCI_MSI_IRQ_INDEX) {
> 
> 

See:

https://lore.kernel.org/all/20250311230623.1264283-1-alex.williamson@redhat.com/

Do we need to expand that to test !vdev->pdev->irq in
vfio_config_init()?  We don't allow a zero irq to be enabled in
vfio_intx_enable(), so we might as well not report it as supported.  I
don't see why any of this needs to be POWER specific.  Thanks,

Alex


