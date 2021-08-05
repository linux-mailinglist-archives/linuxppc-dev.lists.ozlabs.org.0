Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544EE3E2008
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 02:31:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggmcn1NWyz3cl8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 10:31:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KuDKmWy8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KuDKmWy8; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GglXJ27lFz3bPV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 09:42:40 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4D0E610CD;
 Thu,  5 Aug 2021 23:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628206956;
 bh=Z/61WgkabawKvCqT33aQpch4UJfYpbpJ/lpjJTDKmJE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=KuDKmWy8QxzyN9WG7Q1pVzQ6S5j62PkYn7/jQtSiQ405ZyO5HsJaxlGQ4ptwW9KWQ
 8JzTD06NkExqlaqFClHSIgp3ZV4HCT08Q0ZvAqUHpT3JHz2y5xKJeL0G0pylHGRvn6
 U5xMy5iYmp2VcbacJIAcWlgxiuyj7K4SXjueq2YyorPxHzpAkvrgrNXJfYWPF6dNbg
 +rqlXTqZ1NVd0xWfnIPttHUHPunKRAjCa2hTqiMX3yjjCM3obbaCQHJI0obD1yIuBB
 sBxx4HfHs+13rY1cXK0ifZwIzG7diuJ8rdtPvOtsYTWDljySsOW/3p75koSGgoeKnq
 J3gIMCJ0Jo3qg==
Date: Thu, 5 Aug 2021 18:42:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 0/6] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20210805234234.GA1797883@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210803100150.1543597-1-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Fri, 06 Aug 2021 10:30:47 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Alexander Duyck <alexanderduyck@fb.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>, oss-drivers@corigine.com,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-perf-users@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Ido Schimmel <idosch@nvidia.com>, x86@kernel.org, qat-linux@intel.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-wireless@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Fiona Trahe <fiona.trahe@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Simon Horman <simon.horman@corigine.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Michael Buesch <m@bues.ch>, Jiri Pirko <jiri@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Juergen Gross <jgross@suse.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, xen-devel@lists.xenproject.org,
 Vadym Kochan <vkochan@marvell.com>, MPT-FusionLinux.pdl@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Wojciech Ziemba <wojciech.ziemba@intel.com>, linux-kernel@vger.kernel.org,
 Taras Chornyi <tchornyi@marvell.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 03, 2021 at 12:01:44PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> changes since v1 (https://lore.kernel.org/linux-pci/20210729203740.1377045-1-u.kleine-koenig@pengutronix.de):
> 
> - New patch to simplify drivers/pci/xen-pcifront.c, spotted and
>   suggested by Boris Ostrovsky
> - Fix a possible NULL pointer dereference I introduced in xen-pcifront.c
> - A few whitespace improvements
> - Add a commit log to patch #6 (formerly #5)
> 
> I also expanded the audience for patches #4 and #6 to allow affected
> people to actually see the changes to their drivers.
> 
> Interdiff can be found below.
> 
> The idea is still the same: After a few cleanups (#1 - #3) a new macro
> is introduced abstracting access to struct pci_dev->driver. All users
> are then converted to use this and in the last patch the macro is
> changed to make use of struct pci_dev::dev->driver to get rid of the
> duplicated tracking.

I love the idea of this series!

I looked at all the bus_type.probe() methods, it looks like pci_dev is
not the only offender here.  At least the following also have a driver
pointer in the device struct:

  parisc_device.driver
  acpi_device.driver
  dio_dev.driver
  hid_device.driver
  pci_dev.driver
  pnp_dev.driver
  rio_dev.driver
  zorro_dev.driver

Do you plan to do the same for all of them, or is there some reason
why they need the pointer and PCI doesn't?

In almost all cases, other buses define a "to_<bus>_driver()"
interface.  In fact, PCI already has a to_pci_driver().

This series adds pci_driver_of_dev(), which basically just means we
can do this:

  pdrv = pci_driver_of_dev(pdev);

instead of this:

  pdrv = to_pci_driver(pdev->dev.driver);

I don't see any other "<bus>_driver_of_dev()" interfaces, so I assume
other buses just live with the latter style?  I'd rather not be
different and have two ways to get the "struct pci_driver *" unless
there's a good reason.

Looking through the places that care about pci_dev.driver (the ones
updated by patch 5/6), many of them are ... a little dubious to begin
with.  A few need the "struct pci_error_handlers *err_handler"
pointer, so that's probably legitimate.  But many just need a name,
and should probably be using dev_driver_string() instead.

Bjorn
