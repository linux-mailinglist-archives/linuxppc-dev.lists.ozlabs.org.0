Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 339CF632178
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 12:58:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NG5WB0C3Qz3cM0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 22:58:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bg5U0clU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bg5U0clU;
	dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG5VH0qNJz300l
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 22:57:26 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id a15so14222158ljb.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 03:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vxmELrfnlhiJH56czijj6cc+20yGhxjI5SFSU/qzaXs=;
        b=Bg5U0clUuFBJcnbVO7dashZFPnVYYFDDEWYEPHmHkGGPYRKtkCwycfLz2S11DKfJB8
         nFvMKK4Qt2zCIR03EahaQnXBTUeKbypT9qkcErWQElmCEkp5RsiwD3pB0tP2YiC6wXV8
         Z7g8/5sZIDEyz6PWEwXMIJwCIoY/fSW7IB1HCaBwAc1AAXxmZ9Z3weXWouMvS1v8Q99g
         HaMiWRTdjihHWEyfSnoemSNrLQsE0oFkuMm56dwihq0gP5J3HKZ95nnbVVXzJakzeTaz
         6Aj7A6OGPg6D1d3pTDVDfdVChpu4aEHl6mfOzKcBL+uI0fO2NEkmaQPBcoszfdWPANff
         daRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxmELrfnlhiJH56czijj6cc+20yGhxjI5SFSU/qzaXs=;
        b=mn4TPUt4Oul2DgXv3l3HwMsKT8qrPzijs9825cQk2LN+f1FidQpIWzQVcPb6TJWMZe
         O01i+EdrL4PJNlXqv//2tdttawHoNPZ6F/vYQM5cCK13vJg+fREjE/roW5voSNlfmgKU
         NfPItPognSBBoYOSbp8KQGElvwmCNINxdVPLnh3FzmZYsTN11XXJmMO58Rfdu+pEUIzV
         dmz2XEUAxPvE2Pol/2c6S/n0Z1IlKbmBe9uYfxi+Mz+BhxtYKGLkSPQYFX5ukdnO3WpN
         jFrOFYV0QcFiYaOonVVBjD3qsOU4deXQ+1xGa5PucM6dpzoyUaeuQEp1HlumUry6eZl4
         2rdQ==
X-Gm-Message-State: ANoB5pmqn09UWNqFM+sIV4y+CIgAAoeo6Oz3in06pl07e8gCK4WVFoIV
	WGpfbyUZninTtaO+W2uvw8De7YyXefYZXFfftGUu3o4GkQ==
X-Google-Smtp-Source: AA0mqf5MfBzkTjsRcmQ0jH/USZGD/mrpYSF62WJPb964AknnTVxXmmfsx3772PhkcBvQkY5ICBiD8Kgbf9WeYb4otbQ=
X-Received: by 2002:a2e:b891:0:b0:277:8df:88a7 with SMTP id
 r17-20020a2eb891000000b0027708df88a7mr6045147ljp.139.1669031839189; Mon, 21
 Nov 2022 03:57:19 -0800 (PST)
MIME-Version: 1.0
References: <CAFgQCTuz3n5uNKwOOXaL9xT-ftJT0nfo4OfdNepvMGbi0Zqh7Q@mail.gmail.com>
In-Reply-To: <CAFgQCTuz3n5uNKwOOXaL9xT-ftJT0nfo4OfdNepvMGbi0Zqh7Q@mail.gmail.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Mon, 21 Nov 2022 19:57:07 +0800
Message-ID: <CAFgQCTv6R_P0W16ak=9D481NKWqaXwd26CKHHqRbuMygP1u4Aw@mail.gmail.com>
Subject: Re: // a kdump hang caused by PPC pci patch series
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Cc: Coiby Xu <coxu@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sorry that forget a subject.

On Mon, Nov 21, 2022 at 7:54 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> Hello Powerpc folks,
>
> I encounter an kdump bug, which I bisect and pin commit 174db9e7f775
> ("powerpc/pseries/pci: Add support of MSI domains to PHB hotplug")
>
> In that case, using Fedora 36 as host, the mentioned commit as the
> guest kernel, and virto-block disk, the kdump kernel will hang:
>
> [    0.000000] Kernel command line: elfcorehdr=0x22c00000
> no_timer_check net.ifnames=0 console=tty0 console=hvc0,115200n8
> irqpoll maxcpus=1 noirqdistrib reset_devices cgroup_disable=memory
>      numa=off udev.children-max=2 ehea.use_mcs=0 panic=10
> kvm_cma_resv_ratio=0 transparent_hugepage=never novmcoredd
> hugetlb_cma=0
>     ...
>     [    7.763260] virtio_blk virtio2: 32/0/0 default/read/poll queues
>     [    7.771391] virtio_blk virtio2: [vda] 20971520 512-byte logical
> blocks (10.7 GB/10.0 GiB)
>     [   68.398234] systemd-udevd[187]: virtio2: Worker [190]
> processing SEQNUM=1193 is taking a long time
>     [  188.398258] systemd-udevd[187]: virtio2: Worker [190]
> processing SEQNUM=1193 killed
>
>
> During my test, I found that in very rare cases, the kdump can success
> (I guess it may be due to the cpu id).  And if using either maxcpus=2
> or using scsi-disk, then kdump can also success.  And before the
> mentioned commit, kdump can also success.
>
> The attachment contains the xml to reproduce that bug.
>
> Do you have any ideas?
>
> Thanks
