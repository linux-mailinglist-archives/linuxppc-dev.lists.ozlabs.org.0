Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D9F42CF8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 02:29:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV9Jt6yP7z2ysq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 11:29:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OqtFMqGM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OqtFMqGM; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTqD966Hjz2y0G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 21:54:33 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85F6E60ED4;
 Wed, 13 Oct 2021 10:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634122469;
 bh=7iHTFHMgD8tHMQJ8um3MWnq2WmS30AxI0TP6/V1BtV4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=OqtFMqGMGFV4K9yVj94P1PdYhryA/CdqOslHcpNhaQ08AmoURmbWpdbwgGLpBRtvv
 GOsgbbkXEnNemfGxenULuEuLWhQSBLZDlcXtsIPUtWRz0Xquu4nM3on/FjIIYLKVym
 bnMheTYnvnPKKCMeJmHy92kqkk6lJLUVe2jWrwP9ZfoZxr9KzicovqTES+nvgUJrgd
 CW5TCOmBqfvu1ALAWILVarLhtB0Ty7o6Te/0Wlj3D4Ep4xDYZe5KxmPTRIsD28cE8M
 U3L0ny1u+JWyxeAAoH7731EvVOLTcEPfK9OIXkjw0dh6LOeY9oV0Ng9JEnXKuTIMCX
 IWg5mdhv7zLQg==
Date: Wed, 13 Oct 2021 05:54:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v6 00/11] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20211013105428.GA1890798@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211013085131.5htnch5p6zv46mzn@pengutronix.de>
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
 Mark Rutland <mark.rutland@arm.com>, x86@kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-pci@vger.kernel.org, Alexander Duyck <alexanderduyck@fb.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>, oss-drivers@corigine.com,
 netdev@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Jiri Olsa <jolsa@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Paul Mackerras <paulus@samba.org>, Marco Chiappero <marco.chiappero@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Ido Schimmel <idosch@nvidia.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, qat-linux@intel.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Fiona Trahe <fiona.trahe@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jack Xu <jack.xu@intel.com>,
 Borislav Petkov <bp@alien8.de>, Michael Buesch <m@bues.ch>,
 Jiri Pirko <jiri@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Juergen Gross <jgross@suse.com>, Salil Mehta <salil.mehta@huawei.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, xen-devel@lists.xenproject.org,
 Vadym Kochan <vkochan@marvell.com>, MPT-FusionLinux.pdl@broadcom.com,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Mathias Nyman <mathias.nyman@intel.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Wojciech Ziemba <wojciech.ziemba@intel.com>,
 Tomaszx Kowalik <tomaszx.kowalik@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Taras Chornyi <tchornyi@marvell.com>, linux-perf-users@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 13, 2021 at 10:51:31AM +0200, Uwe Kleine-König wrote:
> On Tue, Oct 12, 2021 at 06:32:12PM -0500, Bjorn Helgaas wrote:
> > On Mon, Oct 04, 2021 at 02:59:24PM +0200, Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > this is v6 of the quest to drop the "driver" member from struct pci_dev
> > > which tracks the same data (apart from a constant offset) as dev.driver.
> > 
> > I like this a lot and applied it to pci/driver for v5.16, thanks!
> > 
> > I split some of the bigger patches apart so they only touched one
> > driver or subsystem at a time.  I also updated to_pci_driver() so it
> > returns NULL when given NULL, which makes some of the validations
> > quite a bit simpler, especially in the PM code in pci-driver.c.
> 
> OK.
> 
> > Full interdiff from this v6 series:
> > 
> > diff --git a/arch/x86/kernel/probe_roms.c b/arch/x86/kernel/probe_roms.c
> > index deaaef6efe34..36e84d904260 100644
> > --- a/arch/x86/kernel/probe_roms.c
> > +++ b/arch/x86/kernel/probe_roms.c
> > @@ -80,17 +80,15 @@ static struct resource video_rom_resource = {
> >   */
> >  static bool match_id(struct pci_dev *pdev, unsigned short vendor, unsigned short device)
> >  {
> > +	struct pci_driver *drv = to_pci_driver(pdev->dev.driver);
> >  	const struct pci_device_id *id;
> >  
> >  	if (pdev->vendor == vendor && pdev->device == device)
> >  		return true;
> >  
> > -	if (pdev->dev.driver) {
> > -		struct pci_driver *drv = to_pci_driver(pdev->dev.driver);
> > -		for (id = drv->id_table; id && id->vendor; id++)
> > -			if (id->vendor == vendor && id->device == device)
> > -				break;
> > -	}
> > +	for (id = drv ? drv->id_table : NULL; id && id->vendor; id++)
> > +		if (id->vendor == vendor && id->device == device)
> > +			break;
> >  
> >  	return id && id->vendor;
> >  }
> > diff --git a/drivers/misc/cxl/guest.c b/drivers/misc/cxl/guest.c
> > index d997c9c3ebb5..7eb3706cf42d 100644
> > --- a/drivers/misc/cxl/guest.c
> > +++ b/drivers/misc/cxl/guest.c
> > @@ -20,38 +20,38 @@ static void pci_error_handlers(struct cxl_afu *afu,
> >  				pci_channel_state_t state)
> >  {
> >  	struct pci_dev *afu_dev;
> > +	struct pci_driver *afu_drv;
> > +	struct pci_error_handlers *err_handler;
> 
> These two could be moved into the for loop (where afu_drv was with my
> patch already). This is also possible in a few other drivers.

That's true, they could.  I tried to follow the prevailing style in
the file.  At least in cxl, I didn't see any other cases of
declarations being in the minimal scope like that.

Bjorn
