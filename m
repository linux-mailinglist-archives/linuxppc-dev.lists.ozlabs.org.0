Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E9E42FE8B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 01:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWMSL3Tv9z3cZ3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 10:10:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uJA4ra39;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uJA4ra39; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWBxt46KQz308J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 03:46:58 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34DF061164;
 Fri, 15 Oct 2021 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634316415;
 bh=UazkFhnF58o243B84E27T2Q0kziPCzNQlAM0EXnPs+0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=uJA4ra39P0Gv6naQSVcILGvPjCJywIq0xOMKparacmz05rvVX6Np5K3P9TBtMV+Q6
 0fZMoqlsDqrvmOr81us08+gZah/AgsMkvZGLUZdvStWvkLQD9P6+IT1gNPD5kGzCTz
 OqQa78pHkuTPX/IwPxuJYSyFJgvQojor9CCfmM0cFvkyP8yz7FerO3C6Xj6Ja6G65F
 0JNWOrnI2B9XClHx9c5DgYXjOqp4IU9Zrxk/YET9tVYaYS+dnGehAv9e/YWKzwcbHz
 D1LRfA0mXkjJ2/mnwlueLADrqQ5YuEa5UTY+rPKkoEu2iEn918jjZk3T8fIflFmK8o
 yGBq7Ksq4IKXA==
Date: Fri, 15 Oct 2021 11:46:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 00/11] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20211015164653.GA2108651@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWbdvc7EWEZLVTHM@smile.fi.intel.com>
X-Mailman-Approved-At: Sat, 16 Oct 2021 10:07:44 +1100
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Salil Mehta <salil.mehta@huawei.com>,
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

On Wed, Oct 13, 2021 at 04:23:09PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 13, 2021 at 06:33:56AM -0500, Bjorn Helgaas wrote:
> > On Wed, Oct 13, 2021 at 12:26:42PM +0300, Andy Shevchenko wrote:
> > > On Wed, Oct 13, 2021 at 2:33 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Mon, Oct 04, 2021 at 02:59:24PM +0200, Uwe Kleine-König wrote:

> > > > +       return drv && drv->resume ?
> > > > +                       drv->resume(pci_dev) : pci_pm_reenable_device(pci_dev);
> > > 
> > > One line?
> > 
> > I don't think I touched that line.
> 
> Then why they are both in + section?

They're both in the + section of the interdiff because Uwe's v6 patch
looks like this:

  static int pci_legacy_resume(struct device *dev)
  {
          struct pci_dev *pci_dev = to_pci_dev(dev);
  -       return drv && drv->resume ?
  -                       drv->resume(pci_dev) : pci_pm_reenable_device(pci_dev);
  +       if (pci_dev->dev.driver) {
  +               struct pci_driver *drv = to_pci_driver(pci_dev->dev.driver);
  +
  +               if (drv->resume)
  +                       return drv->resume(pci_dev);
  +       }
  +
  +       return pci_pm_reenable_device(pci_dev);

and my revision looks like this:

   static int pci_legacy_resume(struct device *dev)
   {
	  struct pci_dev *pci_dev = to_pci_dev(dev);
  -       struct pci_driver *drv = pci_dev->driver;
  +       struct pci_driver *drv = to_pci_driver(dev->driver);

so compared to Uwe's v6, I restored that section to the original code.
My goal here was to make the patch as simple and easy to review as
possible.

> > > > +       struct pci_driver *drv = to_pci_driver(dev->dev.driver);
> > > >         const struct pci_error_handlers *err_handler =
> > > > -                       dev->dev.driver ? to_pci_driver(dev->dev.driver)->err_handler : NULL;
> > > > +                       drv ? drv->err_handler : NULL;
> > > 
> > > Isn't dev->driver == to_pci_driver(dev->dev.driver)?
> > 
> > Yes, I think so, but not sure what you're getting at here, can you
> > elaborate?
> 
> Getting pointer from another pointer seems waste of resources, why we
> can't simply
> 
> 	struct pci_driver *drv = dev->driver;

I think this is in pci_dev_save_and_disable(), and "dev" here is a
struct pci_dev *.  We're removing the dev->driver member.  Let me know
if I'm still missing something.

> > > > -                               "bad request in aer recovery "
> > > > -                               "operation!\n");
> > > > +                               "bad request in AER recovery operation!\n");

> > > Stray change? Or is it in a separate patch in your tree?
> > 
> > Could be skipped.  The string now fits on one line so I combined it to
> > make it more greppable.
> 
> This is inconsistency in your changes, in one case you are objecting of
> doing something close to the changed lines, in the other you are doing
> unrelated change.

You're right, this didn't make much sense in that patch.  I moved the
line join to the previous patch, which unindented this section and
made space for this to fit on one line.  Here's the revised commit:

  https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/commit/?id=34ab316d7287

