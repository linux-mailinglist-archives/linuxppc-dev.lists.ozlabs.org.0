Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9195FC8B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 17:52:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mncc42rzlz3drT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 02:52:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WJaeT/hf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dmkT5tJv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WJaeT/hf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dmkT5tJv;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mncb60Gjmz3bjB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 02:51:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665589899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEmL4QPQ3D0Tb37hjB24vN30XeOf49ixlW7Qc6HLGRk=;
	b=WJaeT/hfRBNbHlU9zu2CWUNrf7ywGPPVInm8zmeodjK+DCusFlRdQgfbxPetkh306Sny4b
	KtCW7YcTZN9NPgQNxa8A7kJSTgNSJNEEFdljPDvDZFVvtK5IP/ct5SorE6Js1zc1E0nYi7
	I1SAgMqyhaoIa+FthdRIScvjyvtyXKQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665589900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEmL4QPQ3D0Tb37hjB24vN30XeOf49ixlW7Qc6HLGRk=;
	b=dmkT5tJvAYOg1sm1oR5+8lsE9oysIFIY5ulvOo+NuFuFwyr477TzEqUMm3XzXo7+ZT7LIq
	d7phcoDx1WtwArpJSkf1QPhkMXW0yI6SFqrQew+ZQ0tR5F43GljjXxpP1RseUZtRxqEKSP
	de7a+T25RbSL/XpFnUbcYqqPLuv4LSo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-AoAHC3KBPyqTrRlXTcwJEQ-1; Wed, 12 Oct 2022 11:51:38 -0400
X-MC-Unique: AoAHC3KBPyqTrRlXTcwJEQ-1
Received: by mail-wm1-f69.google.com with SMTP id q14-20020a7bce8e000000b003c6b7debf22so650680wmj.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 08:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEmL4QPQ3D0Tb37hjB24vN30XeOf49ixlW7Qc6HLGRk=;
        b=QtbwrENUZuxnW8gviYxjjuq75VbKZNvmUkFVuFUXQWGgnD8zuBfIU6fsCyvyTo5UAP
         VSEdHa8e1S+JNkoBSbHS3EOAAPYPPDPy0ziI4gIWTDj34VITw6l+G11fguIqnAaGpaSa
         XbiMUDXYzFbaYOUDUV61MqM6wTDKy+A/3G3/uo2TzVM10e4yOyxL2ZJqpy0GrjvjaCzP
         Um8twvur+oLAQuSVuGs06iJI+o7PjROtQhL+8SFUvp5qCA05GraQLD7/hu40lrNM42CU
         PTMZ1UwRe34KH4B3LY9Jy4hbxP9QRx6di5s33cfJ7/XW9ug0myLnuKYQIOLFZYl7lcUH
         Wgvg==
X-Gm-Message-State: ACrzQf09I6UB7kDLnRAtt7NvJiYNoDJF+p6wYZ7tiAz4ENrwDGfd+Kl/
	rN+KcuVQG3tdNrMSLDOJRDwBhV4waPAgFTX7mi6sEjGocxZgoUeYil6CfveQQ754KbAlXrj6ipq
	P+kMg6nSkNyyrE8LGrkF7GdyFrQ==
X-Received: by 2002:a7b:c047:0:b0:3b4:adc7:1ecb with SMTP id u7-20020a7bc047000000b003b4adc71ecbmr3255634wmc.144.1665589897406;
        Wed, 12 Oct 2022 08:51:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7N8bKAUKvYW6q1makifjzVvultjsSZhoTQJypXKec3ISNPJh+4qwpbqB9CUNsCQPvo9cbiyw==
X-Received: by 2002:a7b:c047:0:b0:3b4:adc7:1ecb with SMTP id u7-20020a7bc047000000b003b4adc71ecbmr3255614wmc.144.1665589897125;
        Wed, 12 Oct 2022 08:51:37 -0700 (PDT)
Received: from redhat.com ([2.54.162.123])
        by smtp.gmail.com with ESMTPSA id d17-20020adfe891000000b0022e62529888sm32297wrm.67.2022.10.12.08.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 08:51:36 -0700 (PDT)
Date: Wed, 12 Oct 2022 11:51:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [GIT PULL] virtio: fixes, features
Message-ID: <20221012115023-mutt-send-email-mst@kernel.org>
References: <20221010132030-mutt-send-email-mst@kernel.org>
 <87r0zdmujf.fsf@mpe.ellerman.id.au>
 <20221012070532-mutt-send-email-mst@kernel.org>
 <87mta1marq.fsf@mpe.ellerman.id.au>
 <87edvdm7qg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
In-Reply-To: <87edvdm7qg.fsf@mpe.ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: xiujianfeng@huawei.com, kvm@vger.kernel.org, alvaro.karsz@solid-run.com, netdev@vger.kernel.org, jasowang@redhat.com, wangdeming@inspur.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>, angus.chen@jaguarmicro.com, Bjorn Helgaas <bhelgaas@google.com>, lingshan.zhu@intel.com, linuxppc-dev@lists.ozlabs.org, gavinl@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 13, 2022 at 01:33:59AM +1100, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > [ Cc += Bjorn & linux-pci ]
> >
> > "Michael S. Tsirkin" <mst@redhat.com> writes:
> >> On Wed, Oct 12, 2022 at 05:21:24PM +1100, Michael Ellerman wrote:
> >>> "Michael S. Tsirkin" <mst@redhat.com> writes:
> > ...
> >>> > ----------------------------------------------------------------
> >>> > virtio: fixes, features
> >>> >
> >>> > 9k mtu perf improvements
> >>> > vdpa feature provisioning
> >>> > virtio blk SECURE ERASE support
> >>> >
> >>> > Fixes, cleanups all over the place.
> >>> >
> >>> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>> >
> >>> > ----------------------------------------------------------------
> >>> > Alvaro Karsz (1):
> >>> >       virtio_blk: add SECURE ERASE command support
> >>> >
> >>> > Angus Chen (1):
> >>> >       virtio_pci: don't try to use intxif pin is zero
> >>> 
> >>> This commit breaks virtio_pci for me on powerpc, when running as a qemu
> >>> guest.
> >>> 
> >>> vp_find_vqs() bails out because pci_dev->pin == 0.
> >>> 
> >>> But pci_dev->irq is populated correctly, so vp_find_vqs_intx() would
> >>> succeed if we called it - which is what the code used to do.
> >>> 
> >>> I think this happens because pci_dev->pin is not populated in
> >>> pci_assign_irq().
> >>> 
> >>> I would absolutely believe this is bug in our PCI code, but I think it
> >>> may also affect other platforms that use of_irq_parse_and_map_pci().
> >>
> >> How about fixing this in of_irq_parse_and_map_pci then?
> >> Something like the below maybe?
> >> 
> >> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> >> index 196834ed44fe..504c4d75c83f 100644
> >> --- a/drivers/pci/of.c
> >> +++ b/drivers/pci/of.c
> >> @@ -446,6 +446,8 @@ static int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *
> >>  	if (pin == 0)
> >>  		return -ENODEV;
> >>  
> >> +	pdev->pin = pin;
> >> +
> >>  	/* Local interrupt-map in the device node? Use it! */
> >>  	if (of_get_property(dn, "interrupt-map", NULL)) {
> >>  		pin = pci_swizzle_interrupt_pin(pdev, pin);
> 
> Backing up a bit. Should the virtio code be looking at pci_dev->pin in
> the first place?
> 
> Shouldn't it be checking pci_dev->irq instead?
> 
> The original commit talks about irq being 0 and colliding with the timer
> interrupt.
> 
> But all (most?) platforms have converged on 0 meaning NO_IRQ since quite
> a fews ago AFAIK.

Are you sure?

arch/arm/include/asm/irq.h:#ifndef NO_IRQ
arch/arm/include/asm/irq.h:#define NO_IRQ       ((unsigned int)(-1))



> And the timer irq == 0 is a special case AIUI:
>   https://lore.kernel.org/all/CA+55aFwiLp1z+2mzkrFsid1WZQ0TQkcn8F2E6NL_AVR+m1fZ2w@mail.gmail.com/
> 
> cheers

