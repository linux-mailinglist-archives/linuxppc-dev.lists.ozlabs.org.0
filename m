Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF438BD069
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 16:36:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ooq+Cxwn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY3rD4ZmXz3bYR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 00:36:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ooq+Cxwn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY3qR672lz30Tv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 00:35:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715006148; x=1746542148;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=e7HTaiEOkmkyJLnFpjteHG7h39udIJBpDlEILJ0M2T0=;
  b=Ooq+CxwnxK42mJRL5ClwTuRQMcF6iWuflVIDu9rDZgsadexzmzXlGLVE
   LvKo7IEw03cwJaWReUwO0pLdwDEvQYBdQhDOQ9eREpR+p4f+juedsjKdK
   UV4f5KVahXvFTt9HEdLBFAredmsW1KKUPJrkT3uV1aIN6krQ/Zq/cGa7R
   gUrdQIp5XqIBlafpg/WShQqlgoA+JOy0EXPlm9Zp50jj1RQzLtJubGluN
   RVaI+NNzz4ByfkODs+vVYGPkGnBaABG58KePxWQmiM7o+S8dPpRRqpl7S
   4imycVZNitztI2DixPljbdKNJnnpvsbihWbhYqaQGITG+mi4KeOIuI9yO
   g==;
X-CSE-ConnectionGUID: 9rhw/jZ4TpeaifN8hbVBsw==
X-CSE-MsgGUID: fE3A5e5yS6CEWUfiC/u2sA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14535893"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="14535893"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:35:43 -0700
X-CSE-ConnectionGUID: A40k2weoTG65ZydoWdBO0w==
X-CSE-MsgGUID: l0S3Bw+/R/2Wl8ZHpd+pBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28184155"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.68])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:35:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 6 May 2024 17:35:34 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 1/2] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
In-Reply-To: <20240503225305.GA1609388@bhelgaas>
Message-ID: <816d5e04-1af7-884c-1ec2-ad70c18068a7@linux.intel.com>
References: <20240503225305.GA1609388@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1733933349-1715004351=:1111"
Content-ID: <c4cc418c-1dd3-ce34-6759-6c90ef46b8f8@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1733933349-1715004351=:1111
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <a6b0eafc-f653-302c-44ae-97c6bf23ef83@linux.intel.com>

On Fri, 3 May 2024, Bjorn Helgaas wrote:

> On Fri, Apr 12, 2024 at 04:36:34PM +0300, Ilpo J=E4rvinen wrote:
> > pcie_read_tlp_log() handles only 4 TLP Header Log DWORDs but TLP Prefix
> > Log (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
> >=20
> > Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> > TLP Prefix Log. The layout of relevant registers in AER and DPC
> > Capability is not identical because the offsets of TLP Header Log and
> > TLP Prefix Log vary so the callers must pass the offsets to
> > pcie_read_tlp_log().
>=20
> I think the layouts of the Header Log and the TLP Prefix Log *are*
> identical, but they are at different offsets in the AER Capability vs
> the DPC Capability.  Lukas and I have both stumbled over this.

I'll try to reword it once again.

The way it's spec'ed, there actually also a small difference in sizes too=
=20
(PCIe r6 7.9.14.13 says DPC one can be < 4 DWs whereas AER on is always 4=
=20
DWs regardless of the number of supported E-E Prefixes) so I'll just=20
rewrite it so it doesn't focus just on the offset.

> Similar and more comments at:
> https://lore.kernel.org/r/20240322193011.GA701027@bhelgaas

I'm really sorry, I missed those comments and only focused on that ixgbe=20
part.

> > Convert eetlp_prefix_path into integer called eetlp_prefix_max and
> > make is available also when CONFIG_PCI_PASID is not configured to
> > be able to determine the number of E-E Prefixes.
>=20
> s/make is/make it/
>=20
> I think this could be a separate patch.

Sure, I can make it own patch.

> > --- a/include/linux/aer.h
> > +++ b/include/linux/aer.h
> > @@ -20,6 +20,7 @@ struct pci_dev;
> > =20
> >  struct pcie_tlp_log {
> >  =09u32 dw[4];
> > +=09u32 prefix[4];
> >  };
> > =20
> >  struct aer_capability_regs {
> > @@ -37,7 +38,9 @@ struct aer_capability_regs {
> >  =09u16 uncor_err_source;
> >  };
> > =20
> > -int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_=
log *log);
> > +int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> > +=09=09      unsigned int tlp_len, struct pcie_tlp_log *log);
> > +unsigned int aer_tlp_log_len(struct pci_dev *dev);
>=20
> I think it was a mistake to expose pcie_read_tlp_log() outside
> drivers/pci, and I don't think we should expose aer_tlp_log_len()
> either.

Ah, my intention was to remove the exposure but I only ended up removing=20
the actual EXPORT and didn't realize I should have also moved the=20
prototype into another header.

I'll add also a patch to remove pcie_read_tlp_log() EXPORT too but I'm=20
wondering now whether I should also move these function(s) into=20
pcie/aer.c (or somewhere else that is only build if AER is enabled) since=
=20
there won't be callers ourside of AER/DPC?

> We might be stuck with exposing struct pcie_tlp_log since it looks
> like ras_event.h uses it.

Yes.

--=20
 i.
--8323328-1733933349-1715004351=:1111--
