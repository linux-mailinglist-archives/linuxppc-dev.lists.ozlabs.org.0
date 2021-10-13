Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD1942CF93
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 02:31:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV9Lc6mzxz3cN8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 11:31:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=gmail.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTtYH0QpWz2yHq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 00:24:33 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="290914500"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="290914500"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 06:23:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="626341116"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 06:23:15 -0700
Received: from andy by smile with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1maeDt-000LPO-Od;
 Wed, 13 Oct 2021 16:23:09 +0300
Date: Wed, 13 Oct 2021 16:23:09 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 00/11] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <YWbdvc7EWEZLVTHM@smile.fi.intel.com>
References: <CAHp75Vd0uYEdfB0XaQuUV34V91qJdHR5ARku1hX_TCJLJHEjxQ@mail.gmail.com>
 <20211013113356.GA1891412@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211013113356.GA1891412@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Oct 13, 2021 at 06:33:56AM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 13, 2021 at 12:26:42PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 13, 2021 at 2:33 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Mon, Oct 04, 2021 at 02:59:24PM +0200, Uwe Kleine-König wrote:

...

> > It's a bit unusual. Other to_*_dev() are not NULL-aware IIRC.
> 
> It is a little unusual.  I only found three of 77 that are NULL-aware:
> 
>   to_moxtet_driver()
>   to_siox_driver()
>   to_spi_driver()
> 
> It seems worthwhile to me because it makes the patch and the resulting
> code significantly cleaner.

I'm not objecting the change, just a remark.

...

> > > +       for (id = drv ? drv->id_table : NULL; id && id->vendor; id++)
> > > +               if (id->vendor == vendor && id->device == device)
> > 
> > > +                       break;
> > 
> > return true;
> > 
> > >         return id && id->vendor;
> > 
> > return false;
> 
> Good cleanup for a follow-up patch, but doesn't seem directly related
> to the objective here.

True. Maybe you can bake one while not forgotten?

...

> > > +       return drv && drv->resume ?
> > > +                       drv->resume(pci_dev) : pci_pm_reenable_device(pci_dev);
> > 
> > One line?
> 
> I don't think I touched that line.

Then why they are both in + section?

...

> > > +       struct pci_driver *drv = to_pci_driver(dev->dev.driver);
> > >         const struct pci_error_handlers *err_handler =
> > > -                       dev->dev.driver ? to_pci_driver(dev->dev.driver)->err_handler : NULL;
> > > +                       drv ? drv->err_handler : NULL;
> > 
> > Isn't dev->driver == to_pci_driver(dev->dev.driver)?
> 
> Yes, I think so, but not sure what you're getting at here, can you
> elaborate?

Getting pointer from another pointer seems waste of resources, why we
can't simply

	struct pci_driver *drv = dev->driver;

?

...

> > Stray change? Or is it in a separate patch in your tree?
> 
> Could be skipped.  The string now fits on one line so I combined it to
> make it more greppable.

This is inconsistency in your changes, in one case you are objecting of
doing something close to the changed lines, in the other you are doing
unrelated change.

-- 
With Best Regards,
Andy Shevchenko


