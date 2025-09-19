Return-Path: <linuxppc-dev+bounces-12432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E28B8B019
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 20:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cT1ts4d8Rz3bwk;
	Sat, 20 Sep 2025 04:56:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758308181;
	cv=none; b=BQ+ZiP1kwTouR22OjeK3BCr4d3zJfwO8ODEVYv7CKCkg2CiNFjqLBN8q8hEuByLvcV36xxFG4Dnbhhs3ASQezuOeDRecmIWFFjb9jB88GaTMq45Y5hI4NmwcayNP+dVrVwh37YU7MTl5BFzwmikZ6NUuIcZ+EDYJU+cmLP+ERR2lVWNhTn3l3lFaQfZpA0JR2i20aEA0xXsRIQxh5gTOFjpbE+MlbfGWtrLNOAe/RXFkx2lpnZhJp7Rrgg8Gcp3Flidfi5/XdB3KNc2Vd7+iPkOEUCv86mZL9FGNNvXx3p3J/awLeTx8SVU3oT5aZXDlDjCtd2Z4HIXHleIZquvERw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758308181; c=relaxed/relaxed;
	bh=lVj38TV6NFlRJUveEKKnf4vw+DN0Kar28r+mnlIexw0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V51tuERiy5CTx6/rkI6W8Y9uKtmlAYmnXWDeQsqSFi/qeu316xfghLtzKf544pgW8VlF3EHYDKpNMXaaw3SBfH3xh2NOpJX0VTPyyg4173d1P0s9hJTXGxZTCRm0n0NYg/l+AIo/16kkroTIeEJ2Zgr/kqad+DcupebPleWGKKqN/kwYvAMr5NEvO8ZKHwKggBg9grH02Jn6McZCkGwdOLTqI6YjkB6Smd5AqjJt/i2dwtPoS6OoXlI9zzYXbxih3KBupj58RS4mwasTx+3CRB29/psDiZRerpYs+Zs7pFlFfNPHfyxe+sUG+t3kJqFLBIZQH1aPCnrXwehZ+ckTWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZxszoSaQ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dIB9OBQ0; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZxszoSaQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dIB9OBQ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cT1tr36D0z2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 04:56:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758308174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVj38TV6NFlRJUveEKKnf4vw+DN0Kar28r+mnlIexw0=;
	b=ZxszoSaQ/aNernkoTLJg3I+OjMp0luGQgrmPDeD9cz+4JLQl29iwWiCDiGLldjuAWXz1nZ
	1cq6BBJttKpqsdrQWGnJ1YEiyLgi/fP0zWl7xDRriYuWw5XJNk8h9qv9qo6Bnxt9t1NUua
	NbdSWhQRo1DBQkFpaX0/dk4ypB6q0w0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758308175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVj38TV6NFlRJUveEKKnf4vw+DN0Kar28r+mnlIexw0=;
	b=dIB9OBQ07EX3BPwIKmZZ9XeRFtE8UKDtLyKd3THchO5RdGdM1VnGqEGj2bqRPp/xJmIwA/
	DheWlEhHDdkHpB1I/a0TnQVrbaLlTWeBIiMNZW0oZuI8YeIxVteEWkkj9oVI0szV7bDIKa
	+A1siXp15900XaGjzpDybvJpUQ1L9h8=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-fDsCJamsMHirAI45o1FvDQ-1; Fri, 19 Sep 2025 14:56:07 -0400
X-MC-Unique: fDsCJamsMHirAI45o1FvDQ-1
X-Mimecast-MFC-AGG-ID: fDsCJamsMHirAI45o1FvDQ_1758308166
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-4198fcc4a80so4711165ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 11:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758308166; x=1758912966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVj38TV6NFlRJUveEKKnf4vw+DN0Kar28r+mnlIexw0=;
        b=oDqks4GCHQ1iBOuvk2dyMJHr16aafkIfpBPDTARgigysEodsq6PtVpPi6cuNBLnhAS
         GM6rPwe+iH9jh8DaeHH8sxHSeGVboeu3g6N8m6tUgZ1JCHoi65VmrU04l7zNhCaU6SwQ
         0F55Zpgu1XIG5aWIM/JAny3s6obXFtqv7/Gk1MRh67pKcIGUQxOXSxPLbk/hYLS+s1qI
         UIy+gRUtyh7btwiO+IRzL+ORNSxWEXJ5ARdf8aJF1U7OkgR3Nk7+XZxhQq0F3Zg5iH81
         /O2CA7epVpoJkLz/2JHwbo9yXCG8DVAKzxNh0xQXdTAySSMeQGrPyxmhf9VWMmpcVwG3
         TVtg==
X-Forwarded-Encrypted: i=1; AJvYcCWsoqQh35VRIbVKZgrrk+QDUxV1zIQSO+Xxe5RrLOYJBUeDNjt9bYZcE5EJL47dXCPsXBmq9fWvwTYNGsI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxkRMmLP0DtmWs6+1D0jOINbL1Ca0zpcyg2jH3elBjivxJuxYW
	eujXtTe7JZWySqfLPonE0hUF5Azcm2CtmJjRW9FdhGhvpfLYVLq0kknAFIp/gVW04XKj9gejn78
	sRZ2tUwTxEHQw8sdwVGltyjbreiXI7lVCI5RlEkHlS+jMXNHaSsGxEvVMXrW92IBzQXk=
X-Gm-Gg: ASbGnctPS+jKs59gu2ok7tx6q+/jg2g0xNTh50fwu2ffAH2DLcHQXOiSGZuUOMTKvhm
	1+XI8nYJ9aRwfdseiKJaL0jYhGReWs8cQeIaQYtRACNLhHCuUPI/4vifdIifxiVA6pSf4vRtOai
	SL68HqnVRN3HS2k1Oav/ZUqjfjmjMrO6tYl91wbZWtuSGiORZ1WCL8c7W7R5CNBfzkVKC/XKIJ9
	yphpJxmdedaX5mZ5OqN/RKkZLRh8wcQrSOcagvOTuHAerR2etOwdXtQ34h+WH9uYKahGgLKyQnJ
	f7mrnoTA58OLukwG1XA2Cl5Gbnbo0UNs0XVVUUdWTVc=
X-Received: by 2002:a92:c24a:0:b0:419:de32:2d01 with SMTP id e9e14a558f8ab-42481989234mr25313805ab.4.1758308166453;
        Fri, 19 Sep 2025 11:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeRMlVVwJSn2J+eoiOVihrmI8BY3L8aB3kwLEGCqd+cR5IVXI2iK+bf/xhrrP0TTZWi378yA==
X-Received: by 2002:a92:c24a:0:b0:419:de32:2d01 with SMTP id e9e14a558f8ab-42481989234mr25313645ab.4.1758308165944;
        Fri, 19 Sep 2025 11:56:05 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d539906dfsm2442600173.56.2025.09.19.11.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:56:05 -0700 (PDT)
Date: Fri, 19 Sep 2025 12:56:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: kvm <kvm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI
 devices
Message-ID: <20250919125603.08f600ac.alex.williamson@redhat.com>
In-Reply-To: <663798478.1707537.1757450926706.JavaMail.zimbra@raptorengineeringinc.com>
References: <663798478.1707537.1757450926706.JavaMail.zimbra@raptorengineeringinc.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-Mimecast-MFC-PROC-ID: MPqOU7YcjL9L3t9ex7Z_3EvDxG3NOJvdfZpslYIFQYM_1758308166
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 9 Sep 2025 15:48:46 -0500 (CDT)
Timothy Pearson <tpearson@raptorengineering.com> wrote:

> PCI devices prior to PCI 2.3 both use level interrupts and do not support
> interrupt masking, leading to a failure when passed through to a KVM guest on
> at least the ppc64 platform, which does not utilize the resample IRQFD. This
> failure manifests as receiving and acknowledging a single interrupt in the guest
> while leaving the host physical device VFIO IRQ pending.
> 
> Level interrupts in general require special handling due to their inherently
> asynchronous nature; both the host and guest interrupt controller need to
> remain in synchronization in order to coordinate mask and unmask operations.
> When lazy IRQ masking is used on DisINTx- hardware, the following sequence
> occurs:
>
>  * Level IRQ assertion on host
>  * IRQ trigger within host interrupt controller, routed to VFIO driver
>  * Host EOI with hardware level IRQ still asserted
>  * Software mask of interrupt source by VFIO driver
>  * Generation of event and IRQ trigger in KVM guest interrupt controller
>  * Level IRQ deassertion on host
>  * Guest EOI
>  * Guest IRQ level deassertion
>  * Removal of software mask by VFIO driver
> 
> Note that no actual state change occurs within the host interrupt controller,
> unlike what would happen with either DisINTx+ hardware or message interrupts.
> The host EOI is not fired with the hardware level IRQ deasserted, and the
> level interrupt is not re-armed within the host interrupt controller, leading
> to an unrecoverable stall of the device.
> 
> Work around this by disabling lazy IRQ masking for DisINTx- INTx devices.

I'm not really following here.  It's claimed above that no actual state
change occurs within the host interrupt controller, but that's exactly
what disable_irq_nosync() intends to do, mask the interrupt line at the
controller.  The lazy optimization that's being proposed here should
only change the behavior such that the interrupt is masked at the call
to disable_irq_nosync() rather than at a subsequent re-assertion of the
interrupt.  In any case, enable_irq() should mark the line enabled and
reenable the controller if necessary.

Also, contrary to above, when a device supports DisINT+ we're not
manipulating the host controller.  We're able to mask the interrupt at
the device.  MSI is edge triggered, we don't mask it, so it's not
relevant to this discussion afaict.

There may be good reason to disable the lazy masking behavior as you're
proposing, but I'm not able to glean it from this discussion of the
issue.

> 
> ---
>  drivers/vfio/pci/vfio_pci_intrs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
> index 123298a4dc8f..011169ca7a34 100644
> --- a/drivers/vfio/pci/vfio_pci_intrs.c
> +++ b/drivers/vfio/pci/vfio_pci_intrs.c
> @@ -304,6 +304,9 @@ static int vfio_intx_enable(struct vfio_pci_core_device *vdev,
>  
>  	vdev->irq_type = VFIO_PCI_INTX_IRQ_INDEX;
>  
> +	if (is_intx(vdev) && !vdev->pci_2_3)

We just set irq_type, which is what is_intx() tests, how could it be
anything other?  Thanks,

Alex

> +		irq_set_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
> +
>  	ret = request_irq(pdev->irq, vfio_intx_handler,
>  			  irqflags, ctx->name, ctx);
>  	if (ret) {
> @@ -351,6 +354,8 @@ static void vfio_intx_disable(struct vfio_pci_core_device *vdev)
>  	if (ctx) {
>  		vfio_virqfd_disable(&ctx->unmask);
>  		vfio_virqfd_disable(&ctx->mask);
> +		if (!vdev->pci_2_3)
> +			irq_clear_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
>  		free_irq(pdev->irq, ctx);
>  		if (ctx->trigger)
>  			eventfd_ctx_put(ctx->trigger);


