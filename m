Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D676333F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 04:30:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGVCJ6JLKz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 14:30:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nh3VlyHP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nh3VlyHP;
	dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGVBK4mbGz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 14:29:59 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id b9so16565922ljr.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 19:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZHAbFpbK8NadXCjAK/heNZ7lPOq0hiWZyz4LbGJ4kQ=;
        b=nh3VlyHP4JyQ7/qxPpvQWeGf8Dk/smiiCxwVCFsjCN3TNiegoAACDhDL5iLOg6JM44
         xRNx6UEx+1j30fcYl2m/AwVdIkyNXdfEus7mVcTbHon+jksicLB+dUDniseurvXtdxkS
         7HKWs2fYmMy//iLPIMUXgpVbwZwp/PftoFyuQNNxkqaSm2uKfOOEdKFkzgVvuPpCrNSQ
         EYmGvWErkKAfhpbzeI1OKD3D4Fa0JC3g7gfiqR0lGGcNu0vCBg4yydRmz4AzU3sg4aUD
         mGQv4XmBDosh01qPhTMwDSDYeqC85sKWHTd7ddbaS2fr7qnP4QDlN+0/56ZK4KdA9xfe
         ifEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZHAbFpbK8NadXCjAK/heNZ7lPOq0hiWZyz4LbGJ4kQ=;
        b=jzkHTf2u35fcM+RWbA72nbtSihuSwHiiXCqzX/cO2OWOcsDmPI1v1JF4eyr7kvOktP
         aCaB14TFRJ63dvW4YVPnuaCqWR3Im0YX6aPfn8yT7pvZycXHpVBMUDS2sLZMufZXouO1
         tjAgAzL/LbgXAyAlSILtVWZGkz8whPpy9o72W0FMAsx1bL8XS2rChSVpB0Vl5y8aaSbO
         fcxZ/MqqhUdzcvbTJNrAlRzHoOKdR8UqvKOQn63JHS45pMoXaUrUWNeJWiE1MI5ItKsO
         +cny8exYxtPiP9YaIgv1geeCRfj9rxM+w7STJB+yDB+ZneNbwlsP/LbwsdG0lYRKi8EW
         u2jw==
X-Gm-Message-State: ANoB5plX628V6GYhiKjpLA3uEX/TYWXLOAIsIRO1zUH5uuiTW61J4OPg
	riZlC898G4w6Wf5iqp4EhxAAy93SZGdJYi60pA==
X-Google-Smtp-Source: AA0mqf6p0k1GLsMfDuxzu3tMSMUyfaT3sN4BxQl7l1dEuTtvmifyuBLZa+6vPLcFovHR4Sq2o9GsXropgIeMcw2HQxU=
X-Received: by 2002:a2e:a90a:0:b0:26d:ccb6:1d47 with SMTP id
 j10-20020a2ea90a000000b0026dccb61d47mr1383260ljq.199.1669087792761; Mon, 21
 Nov 2022 19:29:52 -0800 (PST)
MIME-Version: 1.0
References: <CAFgQCTuz3n5uNKwOOXaL9xT-ftJT0nfo4OfdNepvMGbi0Zqh7Q@mail.gmail.com>
 <CAFgQCTv6R_P0W16ak=9D481NKWqaXwd26CKHHqRbuMygP1u4Aw@mail.gmail.com> <61dc96ad-f60e-932f-c063-d1b377006b78@kaod.org>
In-Reply-To: <61dc96ad-f60e-932f-c063-d1b377006b78@kaod.org>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Tue, 22 Nov 2022 11:29:41 +0800
Message-ID: <CAFgQCTvfFW57nKvFpUwtQO-HozfFRf2XqBFcQ0rGqrXQS=seig@mail.gmail.com>
Subject: Re: // a kdump hang caused by PPC pci patch series
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Coiby Xu <coxu@redhat.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gedric,

Appreciate your insight. Please see the comment inline below.

On Mon, Nov 21, 2022 at 8:57 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 11/21/22 12:57, Pingfan Liu wrote:
> > Sorry that forget a subject.
> >
> > On Mon, Nov 21, 2022 at 7:54 PM Pingfan Liu <kernelfans@gmail.com> wrot=
e:
> >>
> >> Hello Powerpc folks,
> >>
> >> I encounter an kdump bug, which I bisect and pin commit 174db9e7f775
> >> ("powerpc/pseries/pci: Add support of MSI domains to PHB hotplug")
> >> In that case, using Fedora 36 as host, the mentioned commit as the
> >> guest kernel, and virto-block disk, the kdump kernel will hang:
>
> The host kernel should be using the PowerNV platform and not pseries
> or are you running a nested L2 guest on KVM/pseries L1 ?
>

Host kernel ran on P9 bare metal. And here PowerKVM is used.

> And as far as I remember, the patch above only impacts the IBM PowerVM
> hypervisor, not KVM, and PHB hotplug, or kdump induces some hot-plugging
> I am not aware of.
>

Sorry that my information is not clear.
The suspect series is "[PATCH 00/31] powerpc: Modernize the PCI/MSI
support", and in the main line, beginning from commit 786e5b102a00
("powerpc/pseries/pci: Introduce __find_pe_total_msi()").

I tried to bisect, and the commit a5f3d2c17b07 ("powerpc/pseries/pci:
Add MSI domains") even hangs the first kernel. So I went ahead to find
the next functional change on pseries, which is commit 174db9e7f775
("powerpc/pseries/pci: Add support of MSI domains to PHB hotplug").


> Also, if indeed, this is a L2 guest, the XIVE interrupt controller is
> emulated in QEMU, "info pic" should return:
>
>    ...
>    irqchip: emulated
>
> >>
> >> [    0.000000] Kernel command line: elfcorehdr=3D0x22c00000
> >> no_timer_check net.ifnames=3D0 console=3Dtty0 console=3Dhvc0,115200n8
> >> irqpoll maxcpus=3D1 noirqdistrib reset_devices cgroup_disable=3Dmemory
> >>       numa=3Doff udev.children-max=3D2 ehea.use_mcs=3D0 panic=3D10
> >> kvm_cma_resv_ratio=3D0 transparent_hugepage=3Dnever novmcoredd
> >> hugetlb_cma=3D0
> >>      ...
> >>      [    7.763260] virtio_blk virtio2: 32/0/0 default/read/poll queue=
s
> >>      [    7.771391] virtio_blk virtio2: [vda] 20971520 512-byte logica=
l
> >> blocks (10.7 GB/10.0 GiB)
> >>      [   68.398234] systemd-udevd[187]: virtio2: Worker [190]
> >> processing SEQNUM=3D1193 is taking a long time
> >>      [  188.398258] systemd-udevd[187]: virtio2: Worker [190]
> >> processing SEQNUM=3D1193 killed
> >>
> >>
> >> During my test, I found that in very rare cases, the kdump can success
> >> (I guess it may be due to the cpu id).  And if using either maxcpus=3D=
2
> >> or using scsi-disk, then kdump can also success.  And before the
> >> mentioned commit, kdump can also success.
> >>
> >> The attachment contains the xml to reproduce that bug.
> >>
> >> Do you have any ideas?
>
> Most certainly an interrupt not being delivered. You can check the status
> on the host with :
>
>    virsh qemu-monitor-command --hmp <domain>  "info pic"
>

OK, I will try to occupy a P9 machine and have a shot. I will update
the info later.


Thanks,

Pingfa
>
>
> Thanks,
>
> C.
