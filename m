Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4D1AD301
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 00:57:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493F3g3h42zF0Pt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 08:57:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=mst@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=cKCQEhfd; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=cKCQEhfd; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493F1W4YKjzDsXK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 08:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587077720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKVanRLC/Mg5qlaKqqDPeRa3RnNQCAvOBVg+npQmtGc=;
 b=cKCQEhfdIAT8vMqWtPmqZ3j55ClqmON1KgQyH59hMw6bSIdc/lG5hI1Vv+q+fDMYKwdSw8
 meK+wFCZHNOWaeZGxQfXWZQ/YZPHBIUAWmG3JGE/8qLi09B87xHuIOQztgaob2P8hp+nVl
 J/+k/c4QwZflJfBEyJZ2aMRMnIK4UMA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587077720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKVanRLC/Mg5qlaKqqDPeRa3RnNQCAvOBVg+npQmtGc=;
 b=cKCQEhfdIAT8vMqWtPmqZ3j55ClqmON1KgQyH59hMw6bSIdc/lG5hI1Vv+q+fDMYKwdSw8
 meK+wFCZHNOWaeZGxQfXWZQ/YZPHBIUAWmG3JGE/8qLi09B87xHuIOQztgaob2P8hp+nVl
 J/+k/c4QwZflJfBEyJZ2aMRMnIK4UMA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-9E7j_gTRPzuHX0mp2uxhgw-1; Thu, 16 Apr 2020 18:55:16 -0400
X-MC-Unique: 9E7j_gTRPzuHX0mp2uxhgw-1
Received: by mail-wm1-f69.google.com with SMTP id t62so157728wma.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 15:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9lsbeDYugkp9ahth1JLAh0S0ZCsR0PhUH/EAQX/EDRo=;
 b=BODMpd2HQWN5HrNf7Xi9w1BfYHbi5AawZBZE8G9F0vkOye0mdz+Rwrk8G75Z3DzT6P
 I3O8jiRQ8Oi1niUQ8xFltbfSVsdGl6ca09CKFYMiBP8hxVAL/V415A3PGnop/Q8/cosT
 A7HSgPcswbuodBhEaNi/ldULp7LtiyWXTWZrF3ddTcA0Zt+yODN8pc/hAOK8MvORBGlq
 x3qoVIhy3zg8/3i7kfjXO8O1uw/zMbRjQxSsKtj5IU/hrp8BTVo3G2k4CNo1N+d+WBPs
 Is+jVVioAEADpy65t7FPh6DTyi6GTyaqVNDpsLtvOv1751uckx6Rz1I+hGlJYlxsYsku
 h0jw==
X-Gm-Message-State: AGi0PuYL/q50p0/M6iMgoUpM/dWVpFV8DlxqngKLrSmujjYAxl9N59bG
 T2oSBrZOQht1ROPVhCqHkrdvunCwVKbOp0MBxo4m0cQTZjUxkYuX1CLFq0Fx6CrgyFajCR0Cl7V
 iWeToBSOqdFE5Y0GtjEUjbl9fbg==
X-Received: by 2002:adf:9d83:: with SMTP id p3mr610164wre.142.1587077715594;
 Thu, 16 Apr 2020 15:55:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypKqqEBtScGXpogtjB81/FXXZd5Rlg+Ab1dKWQPXOFKpcRMvC/kGOOlvzZHP/qvFjygZmEu/KA==
X-Received: by 2002:adf:9d83:: with SMTP id p3mr610136wre.142.1587077715334;
 Thu, 16 Apr 2020 15:55:15 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id 138sm5885051wmb.14.2020.04.16.15.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 15:55:14 -0700 (PDT)
Date: Thu, 16 Apr 2020 18:55:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200416185426-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200415024356.23751-1-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de, gor@linux.ibm.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 15, 2020 at 10:43:56AM +0800, Jason Wang wrote:
> We try to keep the defconfig untouched after decoupling CONFIG_VHOST
> out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
> ("vhost: refine vhost and vringh kconfig") by enabling VHOST_MENU by
> default. Then the defconfigs can keep enabling CONFIG_VHOST_NET
> without the caring of CONFIG_VHOST.
>=20
> But this will leave a "CONFIG_VHOST_MENU=3Dy" in all defconfigs and even
> for the ones that doesn't want vhost. So it actually shifts the
> burdens to the maintainers of all other to add "CONFIG_VHOST_MENU is
> not set". So this patch tries to enable CONFIG_VHOST explicitly in
> defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHOST_VSOCK.
>=20
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com> (s390)
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Jason Wang <jasowang@redhat.com>

I rebased this on top of OABI fix since that
seems more orgent to fix.
Pushed to my vhost branch pls take a look and
if possible test.
Thanks!

> ---
> Change since V1:
> - depends on EVENTFD for VHOST
> ---
>  arch/mips/configs/malta_kvm_defconfig  |  1 +
>  arch/powerpc/configs/powernv_defconfig |  1 +
>  arch/powerpc/configs/ppc64_defconfig   |  1 +
>  arch/powerpc/configs/pseries_defconfig |  1 +
>  arch/s390/configs/debug_defconfig      |  1 +
>  arch/s390/configs/defconfig            |  1 +
>  drivers/vhost/Kconfig                  | 26 +++++++++-----------------
>  7 files changed, 15 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/ma=
lta_kvm_defconfig
> index 8ef612552a19..06f0c7a0ca87 100644
> --- a/arch/mips/configs/malta_kvm_defconfig
> +++ b/arch/mips/configs/malta_kvm_defconfig
> @@ -18,6 +18,7 @@ CONFIG_PCI=3Dy
>  CONFIG_VIRTUALIZATION=3Dy
>  CONFIG_KVM=3Dm
>  CONFIG_KVM_MIPS_DEBUG_COP0_COUNTERS=3Dy
> +CONFIG_VHOST=3Dm
>  CONFIG_VHOST_NET=3Dm
>  CONFIG_MODULES=3Dy
>  CONFIG_MODULE_UNLOAD=3Dy
> diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/config=
s/powernv_defconfig
> index 71749377d164..404245b4594d 100644
> --- a/arch/powerpc/configs/powernv_defconfig
> +++ b/arch/powerpc/configs/powernv_defconfig
> @@ -346,5 +346,6 @@ CONFIG_CRYPTO_DEV_VMX=3Dy
>  CONFIG_VIRTUALIZATION=3Dy
>  CONFIG_KVM_BOOK3S_64=3Dm
>  CONFIG_KVM_BOOK3S_64_HV=3Dm
> +CONFIG_VHOST=3Dm
>  CONFIG_VHOST_NET=3Dm
>  CONFIG_PRINTK_TIME=3Dy
> diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/=
ppc64_defconfig
> index 7e68cb222c7b..4599fc7be285 100644
> --- a/arch/powerpc/configs/ppc64_defconfig
> +++ b/arch/powerpc/configs/ppc64_defconfig
> @@ -61,6 +61,7 @@ CONFIG_ELECTRA_CF=3Dy
>  CONFIG_VIRTUALIZATION=3Dy
>  CONFIG_KVM_BOOK3S_64=3Dm
>  CONFIG_KVM_BOOK3S_64_HV=3Dm
> +CONFIG_VHOST=3Dm
>  CONFIG_VHOST_NET=3Dm
>  CONFIG_OPROFILE=3Dm
>  CONFIG_KPROBES=3Dy
> diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/config=
s/pseries_defconfig
> index 6b68109e248f..4cad3901b5de 100644
> --- a/arch/powerpc/configs/pseries_defconfig
> +++ b/arch/powerpc/configs/pseries_defconfig
> @@ -321,5 +321,6 @@ CONFIG_CRYPTO_DEV_VMX=3Dy
>  CONFIG_VIRTUALIZATION=3Dy
>  CONFIG_KVM_BOOK3S_64=3Dm
>  CONFIG_KVM_BOOK3S_64_HV=3Dm
> +CONFIG_VHOST=3Dm
>  CONFIG_VHOST_NET=3Dm
>  CONFIG_PRINTK_TIME=3Dy
> diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_=
defconfig
> index 0c86ba19fa2b..6ec6e69630d1 100644
> --- a/arch/s390/configs/debug_defconfig
> +++ b/arch/s390/configs/debug_defconfig
> @@ -57,6 +57,7 @@ CONFIG_PROTECTED_VIRTUALIZATION_GUEST=3Dy
>  CONFIG_CMM=3Dm
>  CONFIG_APPLDATA_BASE=3Dy
>  CONFIG_KVM=3Dm
> +CONFIG_VHOST=3Dm
>  CONFIG_VHOST_NET=3Dm
>  CONFIG_VHOST_VSOCK=3Dm
>  CONFIG_OPROFILE=3Dm
> diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
> index 6b27d861a9a3..d1b3bf83d687 100644
> --- a/arch/s390/configs/defconfig
> +++ b/arch/s390/configs/defconfig
> @@ -57,6 +57,7 @@ CONFIG_PROTECTED_VIRTUALIZATION_GUEST=3Dy
>  CONFIG_CMM=3Dm
>  CONFIG_APPLDATA_BASE=3Dy
>  CONFIG_KVM=3Dm
> +CONFIG_VHOST=3Dm
>  CONFIG_VHOST_NET=3Dm
>  CONFIG_VHOST_VSOCK=3Dm
>  CONFIG_OPROFILE=3Dm
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index e79cbbdfea45..29f171a53d8a 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -12,23 +12,19 @@ config VHOST_RING
>  =09  This option is selected by any driver which needs to access
>  =09  the host side of a virtio ring.
> =20
> -config VHOST
> -=09tristate
> +menuconfig VHOST
> +=09tristate "Vhost Devices"
> +=09depends on EVENTFD
>  =09select VHOST_IOTLB
>  =09help
> -=09  This option is selected by any driver which needs to access
> -=09  the core of vhost.
> +=09  Enable option to support host kernel or hardware accelerator
> +=09  for virtio device.
> =20
> -menuconfig VHOST_MENU
> -=09bool "VHOST drivers"
> -=09default y
> -
> -if VHOST_MENU
> +if VHOST
> =20
>  config VHOST_NET
>  =09tristate "Host kernel accelerator for virtio net"
> -=09depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP)
> -=09select VHOST
> +=09depends on NET && (TUN || !TUN) && (TAP || !TAP)
>  =09---help---
>  =09  This kernel module can be loaded in host kernel to accelerate
>  =09  guest networking with virtio_net. Not to be confused with virtio_ne=
t
> @@ -39,8 +35,7 @@ config VHOST_NET
> =20
>  config VHOST_SCSI
>  =09tristate "VHOST_SCSI TCM fabric driver"
> -=09depends on TARGET_CORE && EVENTFD
> -=09select VHOST
> +=09depends on TARGET_CORE
>  =09default n
>  =09---help---
>  =09Say M here to enable the vhost_scsi TCM fabric module
> @@ -48,8 +43,7 @@ config VHOST_SCSI
> =20
>  config VHOST_VSOCK
>  =09tristate "vhost virtio-vsock driver"
> -=09depends on VSOCKETS && EVENTFD
> -=09select VHOST
> +=09depends on VSOCKETS
>  =09select VIRTIO_VSOCKETS_COMMON
>  =09default n
>  =09---help---
> @@ -62,8 +56,6 @@ config VHOST_VSOCK
> =20
>  config VHOST_VDPA
>  =09tristate "Vhost driver for vDPA-based backend"
> -=09depends on EVENTFD
> -=09select VHOST
>  =09depends on VDPA
>  =09help
>  =09  This kernel module can be loaded in host kernel to accelerate
> --=20
> 2.20.1

