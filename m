Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B6142CF92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 02:30:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV9L62DX1z3cFY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 11:30:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UShiO4p2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UShiO4p2; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTr5j0MB1z2yKN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 22:34:00 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A11E861056;
 Wed, 13 Oct 2021 11:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634124838;
 bh=HQKsM5+JxN3z7fyOH4PY/6KtY66RH98iqwIkPpr7pp4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=UShiO4p2ZNEqVxTuBk6kFbR2B00UaMlAvlLYQnZahYzzR2pWxODYirJ55Ppvc4wcb
 TbsHJjV6yBuou71KQ85auBUjZSwjeGda875UjLN7pwgf34k/EH2knu8OabkXl897I6
 d38KzzByzeedoIWV/dOugDUDl6DilZq//3uEMWjKd9CwvbS4Qozhkn8DshWNKQBTv1
 2O/FPQuHxfdQqcncfqcRRrj5kN+rqJ+5UArlW1uDTv4ePzGur9CO7NwFRq4T1/KEQq
 aWFCcH5AR4qBg0rsV6uekaLWSPeuu9SbuPW4oDnE1b1kYx2Q3hiZfUMs5RsbVbgQOk
 /xhQrHdqpvXyQ==
Date: Wed, 13 Oct 2021 06:33:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 00/11] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20211013113356.GA1891412@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vd0uYEdfB0XaQuUV34V91qJdHR5ARku1hX_TCJLJHEjxQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 14 Oct 2021 11:29:19 +1100
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
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 "open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Fiona Trahe <fiona.trahe@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ido Schimmel <idosch@nvidia.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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

On Wed, Oct 13, 2021 at 12:26:42PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 13, 2021 at 2:33 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Mon, Oct 04, 2021 at 02:59:24PM +0200, Uwe Kleine-König wrote:
> 
> > I split some of the bigger patches apart so they only touched one
> > driver or subsystem at a time.  I also updated to_pci_driver() so it
> > returns NULL when given NULL, which makes some of the validations
> > quite a bit simpler, especially in the PM code in pci-driver.c.
> 
> It's a bit unusual. Other to_*_dev() are not NULL-aware IIRC.

It is a little unusual.  I only found three of 77 that are NULL-aware:

  to_moxtet_driver()
  to_siox_driver()
  to_spi_driver()

It seems worthwhile to me because it makes the patch and the resulting
code significantly cleaner.  Here's one example without the NULL
check:

  @@ -493,12 +493,15 @@ static void pci_device_remove(struct device *dev)
   static void pci_device_shutdown(struct device *dev)
   {
          struct pci_dev *pci_dev = to_pci_dev(dev);
  -       struct pci_driver *drv = pci_dev->driver;

          pm_runtime_resume(dev);

  -       if (drv && drv->shutdown)
  -               drv->shutdown(pci_dev);
  +       if (pci_dev->dev.driver) {
  +               struct pci_driver *drv = to_pci_driver(pci_dev->dev.driver);
  +
  +               if (drv->shutdown)
  +                       drv->shutdown(pci_dev);
  +       }

  static void pci_device_shutdown(struct device *dev)
  {
    struct pci_dev *pci_dev = to_pci_dev(dev);

    pm_runtime_resume(dev);

    if (pci_dev->dev.driver) {
      struct pci_driver *drv = to_pci_driver(pci_dev->dev.driver);

      if (drv->shutdown)
        drv->shutdown(pci_dev);
    }

and here's the same thing with the NULL check:

  @@ -493,7 +493,7 @@ static void pci_device_remove(struct device *dev)
   static void pci_device_shutdown(struct device *dev)
   {
          struct pci_dev *pci_dev = to_pci_dev(dev);
  -       struct pci_driver *drv = pci_dev->driver;
  +       struct pci_driver *drv = to_pci_driver(dev->driver);

  static void pci_device_shutdown(struct device *dev)
  {
    struct pci_dev *pci_dev = to_pci_dev(dev);
    struct pci_driver *drv = to_pci_driver(dev->driver);

    pm_runtime_resume(dev);

    if (drv && drv->shutdown)
      drv->shutdown(pci_dev);

> >  static bool match_id(struct pci_dev *pdev, unsigned short vendor, unsigned short device)
> >  {
> > +       struct pci_driver *drv = to_pci_driver(pdev->dev.driver);
> >         const struct pci_device_id *id;
> >
> >         if (pdev->vendor == vendor && pdev->device == device)
> >                 return true;
> 
> > +       for (id = drv ? drv->id_table : NULL; id && id->vendor; id++)
> > +               if (id->vendor == vendor && id->device == device)
> 
> > +                       break;
> 
> return true;
> 
> >         return id && id->vendor;
> 
> return false;

Good cleanup for a follow-up patch, but doesn't seem directly related
to the objective here.  The current patch is:

  @@ -80,7 +80,7 @@ static struct resource video_rom_resource = {
    */
   static bool match_id(struct pci_dev *pdev, unsigned short vendor, unsigned short device)
   {
  -       struct pci_driver *drv = pdev->driver;
  +       struct pci_driver *drv = to_pci_driver(pdev->dev.driver);
          const struct pci_device_id *id;

          if (pdev->vendor == vendor && pdev->device == device)

> >         device_lock(&vf_dev->dev);
> > -       if (vf_dev->dev.driver) {
> > +       if (to_pci_driver(vf_dev->dev.driver)) {
> 
> Hmm...

Yeah, it could be either of:

  if (to_pci_driver(vf_dev->dev.driver))
  if (vf_dev->dev.driver)

I went back and forth on that and went with to_pci_driver() on the
theory that we were testing the pci_driver * before and the patch is
more of a mechanical change and easier to review if we test the
pci_driver * after.

> > +               if (!pci_dev->state_saved && pci_dev->current_state != PCI_D0
> 
> > +                   && pci_dev->current_state != PCI_UNKNOWN) {
> 
> Can we keep && on the previous line?

I think this is in pci_legacy_suspend(), and I didn't touch that line.
It shows up in the interdiff because without the NULL check in
to_pci_driver(), we had to indent this code another level.  With the
NULL check, we don't need that extra indentation.

> > +                       pci_WARN_ONCE(pci_dev, pci_dev->current_state != prev,
> > +                                     "PCI PM: Device state not saved by %pS\n",
> > +                                     drv->suspend);
> >                 }
> 
> ...
> 
> > +       return drv && drv->resume ?
> > +                       drv->resume(pci_dev) : pci_pm_reenable_device(pci_dev);
> 
> One line?

I don't think I touched that line.

> > +       struct pci_driver *drv = to_pci_driver(dev->dev.driver);
> >         const struct pci_error_handlers *err_handler =
> > -                       dev->dev.driver ? to_pci_driver(dev->dev.driver)->err_handler : NULL;
> > +                       drv ? drv->err_handler : NULL;
> 
> Isn't dev->driver == to_pci_driver(dev->dev.driver)?

Yes, I think so, but not sure what you're getting at here, can you
elaborate?

> >         device_lock(&dev->dev);
> > +       pdrv = to_pci_driver(dev->dev.driver);
> >         if (!pci_dev_set_io_state(dev, state) ||
> > -               !dev->dev.driver ||
> > -               !(pdrv = to_pci_driver(dev->dev.driver))->err_handler ||
> 
> > +               !pdrv ||
> > +               !pdrv->err_handler ||
> 
> One line now?
> 
> >                 !pdrv->err_handler->error_detected) {
> 
> Or this and the previous line?

Could, but the "dev->driver" to "to_pci_driver(dev->dev.driver)"
changes are the heart of this patch, and I don't like to clutter it
with unrelated changes.

> > -       result = PCI_ERS_RESULT_NONE;
> >
> >         pcidev = pci_get_domain_bus_and_slot(domain, bus, devfn);
> >         if (!pcidev || !pcidev->dev.driver) {
> >                 dev_err(&pdev->xdev->dev, "device or AER driver is NULL\n");
> >                 pci_dev_put(pcidev);
> > -               return result;
> > +               return PCI_ERS_RESULT_NONE;
> >         }
> >         pdrv = to_pci_driver(pcidev->dev.driver);
> 
> What about splitting the conditional to two with clear error message
> in each and use pci_err() in the second one?

Could possibly be cleaned up.  Felt like feature creep so I didn't.

> >                 default:
> >                         dev_err(&pdev->xdev->dev,
> > -                               "bad request in aer recovery "
> > -                               "operation!\n");
> > +                               "bad request in AER recovery operation!\n");
> 
> Stray change? Or is it in a separate patch in your tree?

Could be skipped.  The string now fits on one line so I combined it to
make it more greppable.

Bjorn
