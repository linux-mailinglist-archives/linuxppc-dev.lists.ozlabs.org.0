Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6253B1E3438
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 02:59:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WstJ2VtxzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 10:59:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ej1Vsk6w; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WsrJ06JBzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 10:57:51 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id c8so3786141iob.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 17:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kuUmsuCg+9pzqBxO+bwtYAHoLUlsa3lHTrZtAHLCGMw=;
 b=Ej1Vsk6wviEitrr3pRT8AURhJ3ZOL+ogF9tEZzetYHa6eXpED41xq2qztooiESNnSf
 rDeSdK2Uz5YGfEMIHiuoIUvWIypJQrVHSd/AKZmpY/mAB9lOZa6FpB2htB+YvZp5TLfH
 AwwgQK8kkjWbkSY86pFeEJJDwBhc/vVYmTSJsYPZFTLpuIqm/6BP+6vHZfMR57BHrq8A
 opM9zY52907AT5WNdn2RO1FXtFqvWpFysVoELJUIR3rU4V7tBpYPjky0/skcm3+w+okl
 KtdB4Y/rNuGwPIcg+PcbmxGwSwZ43gR5FtiEu0S7L0mZP0re4+Y0vNPLr26dBhS+EJ4X
 Xujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kuUmsuCg+9pzqBxO+bwtYAHoLUlsa3lHTrZtAHLCGMw=;
 b=KYY3EdgkFE6hjMY6poFkJBPzWLpnmzWiddtrPwT0hrrSSdn0oafJQa2Pt+Lt6L+K3C
 RgVMDiOJatEi7Qo3bVM7RBRWxqNT2H/34bX6Js2ECYv8T0HMOANuPJxpjFXxjG3z3XcG
 fPnFXrZm+3e+WPr2CisjgDUARBUu4TgX/nDStuhNf09gWVIx9RK2fmo7IBZLk4vWrdnc
 /bmgDYifeKyNgnXXrKUB5LFSM4g7TVn2sdxM6yMfLXl+I+fQnXcdfGiDrtv0iH1QHpe7
 lojcat6X7x7UHu7ZfLSvbYrWPwzJ1c94c0Rh5ZNyLBSXdKtP+xiEQNXNR7/Le3zLKnew
 Ki5A==
X-Gm-Message-State: AOAM530RKB9WPZhDCJAUMaIA/f1O5f7N91XU9FqSlmoQD3LsW81ds1Aq
 q4ZuTMT3YkYF4jaYByYw2xXi2fDT/eSAwk5I4hv/ng==
X-Google-Smtp-Source: ABdhPJyOdKtWVCZsYGDFZVQYQaT0G056KK1iyKXDkaGxifoX4oeGMSR8kmUbfKe09VAcKdV0rpzcQRrTL5tbAb0VrQo=
X-Received: by 2002:a02:a904:: with SMTP id n4mr3599227jam.105.1590541067926; 
 Tue, 26 May 2020 17:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200429075122.1216388-1-clg@kaod.org>
 <20200429075122.1216388-3-clg@kaod.org>
In-Reply-To: <20200429075122.1216388-3-clg@kaod.org>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 27 May 2020 10:57:36 +1000
Message-ID: <CAOSf1CHZ4+vEHotKzPDu2czVDBBM_oerxcCRS5QOFxsMbSknKQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] powerpc/pci: unmap legacy INTx interrupts of
 passthrough IO adapters
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 29, 2020 at 5:51 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> When a passthrough IO adapter is removed from a pseries machine using
> hash MMU and the XIVE interrupt mode, the POWER hypervisor, pHyp,
> expects the guest OS to have cleared all page table entries related to
> the adapter. If some are still present, the RTAS call which isolates
> the PCI slot returns error 9001 "valid outstanding translations" and
> the removal of the IO adapter fails.
>
> INTx interrupt numbers need special care because Linux maps the
> interrupts automatically in the Linux interrupt number space if they
> are presented in the device tree node describing the IO adapter. These
> interrupts are not un-mapped automatically and in case of an hot-plug
> adapter, the PCI hot-plug layer needs to handle the cleanup to make
> sure that all the page table entries of the XIVE ESB pages are
> cleared.
>
> Cc: "Oliver O'Halloran" <oohall@gmail.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/kernel/pci-hotplug.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-=
hotplug.c
> index bf83f76563a3..9e9c6befd7ea 100644
> --- a/arch/powerpc/kernel/pci-hotplug.c
> +++ b/arch/powerpc/kernel/pci-hotplug.c
> @@ -57,6 +57,8 @@ void pcibios_release_device(struct pci_dev *dev)
>         struct pci_controller *phb =3D pci_bus_to_host(dev->bus);
>         struct pci_dn *pdn =3D pci_get_pdn(dev);
>
> +       irq_dispose_mapping(dev->irq);

What does the original mapping? Powerpc arch code or the PCI core?
Tearing down the mapping in pcibios_release_device() seems a bit fishy
to me since the PCI core has already torn down the device state at
that point. If the release is delayed it's possible that another
pci_dev has mapped the IRQ before we get here, but maybe that's ok.

> +
>         eeh_remove_device(dev);
>
>         if (phb->controller_ops.release_device)
> --
> 2.25.4
>
