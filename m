Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A3E42BBAE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 11:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTnQx24QGz3c6q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 20:33:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=evc4kDT+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=evc4kDT+; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTnHf3vSfz2ymP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 20:27:24 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id z20so7341548edc.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+/MfPZS60YJ0eap0AJdMs6gge+XO+BZUvon0pBTzNGA=;
 b=evc4kDT+QZNhO898nkNWsOvYd5uoHISP2WxjXfUrXPc/LAvzY9eu3qYsrzHLMiVRP3
 7ek8KrGpW83pP3+71f6NoTqJUNew57wgLSdZESolUuO3w3SjswV4oNuZrRCsx5d2Sz6Z
 U6Dil/exw/Z01VwoZLKDTI9+cXYT6HoMhvbPnOyg97B0PkHUENz49VLf5qJ3twBM3fy6
 bHXGjIYLA3Q6jVCBIp04R0UFvkX24frr6ijNGP3vuZmaos7c/PDqm98vd8l9QZ2VLZ00
 0EBJxe8ZaQK4AqNo/Rk1lDSww7yrEMjrcnUEwQvCtD2OBAhLhOYcZrSIMXdkiq7GrIG/
 lN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+/MfPZS60YJ0eap0AJdMs6gge+XO+BZUvon0pBTzNGA=;
 b=CAovqLFK/ssD81qSwUimhm4cOKNOkBZdIzsM/XaeBtCSswn88C4kepfJB9mVG5dfSb
 MDXGfudtFhhjoiquHVEF1JYzuivLk2mq0WB4QSy8/mr0/G5nUwmWs5BLCBWbylCwCzE4
 /ZCZTR2mSOAKI49rkOmwad8Qik7FiWFTM+aur6cMeSfHAOe1pJDj+Nudk/oR4EcDaWt3
 QtYe8c2D6BAXQ50nkB5EpeF+g/10L5Q10hPF+oBsVxbuKeaFeHdK1IbsBqoOzwQdIeq9
 ISMBMDYoUaPY5EIVtwVEomBPbXCNoUlJf85cTroRIYNu0mGyWqOd2CD4xefN1IC+/MY/
 HHSw==
X-Gm-Message-State: AOAM532kDt/b+bLVuw2THUZxcy2w+Hi+d+M76SLGrlixOTya3tfUS77s
 FmMZq5oVytoLbfpe6pj8sjI6xZcZcvshqa1MfgY=
X-Google-Smtp-Source: ABdhPJzL0SqFZyZBLTfBNcE8CpMsywyY4boERpEcXyUfc9yUq7Z2mLOKk/hnon0PQ/WXXVk02NgEbEHqrWvW2H64g2s=
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr40092015ejc.69.1634117238956; 
 Wed, 13 Oct 2021 02:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211004125935.2300113-1-u.kleine-koenig@pengutronix.de>
 <20211012233212.GA1806189@bhelgaas>
In-Reply-To: <20211012233212.GA1806189@bhelgaas>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Oct 2021 12:26:42 +0300
Message-ID: <CAHp75Vd0uYEdfB0XaQuUV34V91qJdHR5ARku1hX_TCJLJHEjxQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:30:31 +1100
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexander Duyck <alexanderduyck@fb.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 qat-linux@intel.com, oss-drivers@corigine.com,
 Oliver O'Halloran <oohall@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marco Chiappero <marco.chiappero@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 "open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Fiona Trahe <fiona.trahe@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ido Schimmel <idosch@nvidia.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Simon Horman <simon.horman@corigine.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jack Xu <jack.xu@intel.com>, Borislav Petkov <bp@alien8.de>,
 Michael Buesch <m@bues.ch>, Jiri Pirko <jiri@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Namhyung Kim <namhyung@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Juergen Gross <jgross@suse.com>, Salil Mehta <salil.mehta@huawei.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, xen-devel@lists.xenproject.org,
 Vadym Kochan <vkochan@marvell.com>, MPT-FusionLinux.pdl@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Wojciech Ziemba <wojciech.ziemba@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, netdev <netdev@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Tomaszx Kowalik <tomaszx.kowalik@intel.com>,
 Taras Chornyi <tchornyi@marvell.com>, "David S. Miller" <davem@davemloft.net>,
 linux-perf-users@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 13, 2021 at 2:33 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Mon, Oct 04, 2021 at 02:59:24PM +0200, Uwe Kleine-K=C3=B6nig wrote:

> I split some of the bigger patches apart so they only touched one
> driver or subsystem at a time.  I also updated to_pci_driver() so it
> returns NULL when given NULL, which makes some of the validations
> quite a bit simpler, especially in the PM code in pci-driver.c.

It's a bit unusual. Other to_*_dev() are not NULL-aware IIRC.

Below are some comments as well.

...

>  static bool match_id(struct pci_dev *pdev, unsigned short vendor, unsign=
ed short device)
>  {
> +       struct pci_driver *drv =3D to_pci_driver(pdev->dev.driver);
>         const struct pci_device_id *id;
>
>         if (pdev->vendor =3D=3D vendor && pdev->device =3D=3D device)
>                 return true;

> +       for (id =3D drv ? drv->id_table : NULL; id && id->vendor; id++)
> +               if (id->vendor =3D=3D vendor && id->device =3D=3D device)

> +                       break;

return true;

>         return id && id->vendor;

return false;

>  }

...

> +                       afu_result =3D err_handler->error_detected(afu_de=
v,
> +                                                                state);

One line?

...

>         device_lock(&vf_dev->dev);
> -       if (vf_dev->dev.driver) {
> +       if (to_pci_driver(vf_dev->dev.driver)) {

Hmm...

...

> +               if (!pci_dev->state_saved && pci_dev->current_state !=3D =
PCI_D0

> +                   && pci_dev->current_state !=3D PCI_UNKNOWN) {

Can we keep && on the previous line?

> +                       pci_WARN_ONCE(pci_dev, pci_dev->current_state !=
=3D prev,
> +                                     "PCI PM: Device state not saved by =
%pS\n",
> +                                     drv->suspend);
>                 }

...

> +       return drv && drv->resume ?
> +                       drv->resume(pci_dev) : pci_pm_reenable_device(pci=
_dev);

One line?

...

> +       struct pci_driver *drv =3D to_pci_driver(dev->dev.driver);
>         const struct pci_error_handlers *err_handler =3D
> -                       dev->dev.driver ? to_pci_driver(dev->dev.driver)-=
>err_handler : NULL;
> +                       drv ? drv->err_handler : NULL;

Isn't dev->driver =3D=3D to_pci_driver(dev->dev.driver)?

...

> +       struct pci_driver *drv =3D to_pci_driver(dev->dev.driver);
>         const struct pci_error_handlers *err_handler =3D
> -                       dev->dev.driver ? to_pci_driver(dev->dev.driver)-=
>err_handler : NULL;
> +                       drv ? drv->err_handler : NULL;

Ditto.

...

>         device_lock(&dev->dev);
> +       pdrv =3D to_pci_driver(dev->dev.driver);
>         if (!pci_dev_set_io_state(dev, state) ||
> -               !dev->dev.driver ||
> -               !(pdrv =3D to_pci_driver(dev->dev.driver))->err_handler |=
|

> +               !pdrv ||
> +               !pdrv->err_handler ||

One line now?

>                 !pdrv->err_handler->error_detected) {

Or this and the previous line?

...

> +       pdrv =3D to_pci_driver(dev->dev.driver);
> +       if (!pdrv ||
> +               !pdrv->err_handler ||
>                 !pdrv->err_handler->mmio_enabled)
>                 goto out;

Ditto.

...

> +       pdrv =3D to_pci_driver(dev->dev.driver);
> +       if (!pdrv ||
> +               !pdrv->err_handler ||
>                 !pdrv->err_handler->slot_reset)
>                 goto out;

Ditto.

...

>         if (!pci_dev_set_io_state(dev, pci_channel_io_normal) ||
> -               !dev->dev.driver ||
> -               !(pdrv =3D to_pci_driver(dev->dev.driver))->err_handler |=
|
> +               !pdrv ||
> +               !pdrv->err_handler ||
>                 !pdrv->err_handler->resume)
>                 goto out;

Ditto.

> -       result =3D PCI_ERS_RESULT_NONE;
>
>         pcidev =3D pci_get_domain_bus_and_slot(domain, bus, devfn);
>         if (!pcidev || !pcidev->dev.driver) {
>                 dev_err(&pdev->xdev->dev, "device or AER driver is NULL\n=
");
>                 pci_dev_put(pcidev);
> -               return result;
> +               return PCI_ERS_RESULT_NONE;
>         }
>         pdrv =3D to_pci_driver(pcidev->dev.driver);

What about splitting the conditional to two with clear error message
in each and use pci_err() in the second one?

...

>                 default:
>                         dev_err(&pdev->xdev->dev,
> -                               "bad request in aer recovery "
> -                               "operation!\n");
> +                               "bad request in AER recovery operation!\n=
");

Stray change? Or is it in a separate patch in your tree?

--=20
With Best Regards,
Andy Shevchenko
