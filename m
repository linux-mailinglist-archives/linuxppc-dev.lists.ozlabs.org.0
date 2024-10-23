Return-Path: <linuxppc-dev+bounces-2505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBCA9ACB58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 15:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYVT26Pvwz2yRZ;
	Thu, 24 Oct 2024 00:36:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729690614;
	cv=none; b=DvQYkhRZh9932SzF1iAoDfi7qrn7jF/kMUSnsuk8nlWx+0TKs8w00qwxf7+/Ylg9o/PVjbOrxQaZgFm2O1Gv2SR6IXZJx/EB9pSqt/FlWgUNtd1rd6GCPjPkacuPwrS7T2QCwYt8Tm7fN0nK8sTiOeJjwL4N2oIEx8Y6A1+zq3aiU0nTKGoXEpVl/M5Iq66p3q9QjBVZOGFHahJ/z+aLVIItoAZtd7oIqLxmmmCOPKTo3aOOsHeVUHCqDl8b2CO4u26TuQi9P62Jkg8gglBhGqR893W40mkydG7aRSxoiuP38N7o8wpUcFOdEGVafYLV/zgfEDCO/zYVUClExg9I4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729690614; c=relaxed/relaxed;
	bh=KrLzMROnEAaEoL/sZN90zcAXRy6/ZaEcrBLFw/E9/lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TvCFrQG6plzE8znVHJ9iqAZ2nOjlX8RdvxNBPzsWvokFl9JG6gexFPj33QODGi8cxMJLEci6+1Z0PO9HZcL85P1IFCG0la3xezTTzn/7uxaQoO4eaTDBKFEZLaX0oFtuaW++mvChHnEZ/BEAedRy6zqhMaFBp3FCWl0gNHvnVTiNfJDtJLcn89ThBA3GOyXrVxXiC5bGSrJCGYqwW8dFNSO1FoQOJ/NbpdiiT8ONVhIVQEHYKkxrJ3LnEfvCDk7RCZOLfgexlrZGbzTOFzFKM8IpLDvlL0JJn05NwgFeYqL8BJmKCmi9zgCITWunacMicKCEpNt/7VBPBSfAafNE5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bjCl80rm; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bjCl80rm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 24 Oct 2024 00:36:51 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYVSz44JBz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 00:36:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729690612; x=1761226612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c12i6YS3Zu5lw62vyhst8XtuMC8q5uxDihPxDU8KoDc=;
  b=bjCl80rmCE/4hp0M3c8z/uwOkhrb9vWJrP49iMDj6iaxIeSMTp3RtKFd
   9xl/ebn9ATXDdT8l8WMrOZ6FsMvQVnG1Z0zcNp4ZLe6viO4CKDl+CDMss
   h3U5g3AliOiR7brNtSMY4NjH9h8V2FdjNisQRmVUNKqkwcUKl85bEdvkf
   q1D0I4fyrwVT/oZTMZTe7B2yzgD0b9teeaMLagKlYSgTpnc6B0aTv29Ww
   hEMM5vc/MoAPPoChss8wsRqtG4XQBR/3kw2Z2e1CBbWNGuVMVEyFVleob
   Y3M9FTVDLNP92h2UbICzznvVcBcJR2I745JAKV87nfIGw+9Hh55z1R6xD
   A==;
X-CSE-ConnectionGUID: L73XBq2tQV2hLv5kwOxa6g==
X-CSE-MsgGUID: Y8XEI5j9RGqGiWXyhVrv9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29387863"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="29387863"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 06:35:39 -0700
X-CSE-ConnectionGUID: w7cd642VS+SvjDE8PG9fBA==
X-CSE-MsgGUID: tnMxC2zGRQOz496M7vXC2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="85316221"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdefranc-mobl3.localnet) ([10.245.245.109])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 06:35:34 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 2/2] ACPI: extlog: Trace CPER PCI Express Error Section
Date: Wed, 23 Oct 2024 15:35:18 +0200
Message-ID: <8286502.jJDZkT8p0M@fdefranc-mobl3>
In-Reply-To: <66b27fe8d73fe_c144829438@dwillia2-xfh.jf.intel.com.notmuch>
References:
 <20240527144356.246220-1-fabio.m.de.francesco@linux.intel.com>
 <20240527144356.246220-3-fabio.m.de.francesco@linux.intel.com>
 <66b27fe8d73fe_c144829438@dwillia2-xfh.jf.intel.com.notmuch>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tuesday, August 6, 2024 9:56:24=E2=80=AFPM GMT+2 Dan Williams wrote:
> Fabio M. De Francesco wrote:
> > Currently, extlog_print() (ELOG) only reports CPER PCIe section (UEFI
> > v2.10, Appendix N.2.7) to the kernel log via print_extlog_rcd().
>=20
> I think the critical detail is is that print_extlog_rcd() is only
> triggered when ras_userspace_consumers() returns true. The observation
> is that ras_userspace_consumers() hides information from the trace path
> when the intended purpose of it was to hide duplicate emissions to the
> kernel log when userspace is watching the tracepoints.
>
> Setting aside whether ras_userspace_consumers() is still a good idea or
> not, it is obvious that this patch as is may surprise environments that
> start seeing kernel error logs where the kernel was silent before.
>
> I think the path of least surprise would be to make sure that
> pci_print_aer() optionally skips emitting to the kernel log when not
> needed wanted.

Sorry for replying so late...

I'm not entirely sure that users would not prefer to be surprised by=20
_finally_ seeing kernel error logs for failing PCIe components. I suspect=20
that users might have been confused by not seeing any output.
=20
> So perhaps first do a lead-in patch to optionally quiet the print
> messages in pci_print_aer() and then pass in KERN_DEBUG from the
> extlog_print() path. Then we can decide later what to do about
> ras_userspace_consumers().

Anyway, I'll do it.

> > the similar ghes_do_proc() (GHES) prints to kernel log and calls
> > pci_print_aer() to report via the ftrace infrastructure.
> >=20
> > Add support to report the CPER PCIe Error section also via the ftrace
> > infrastructure by calling pci_print_aer() to make ELOG act consistently
> > with GHES.
>=20
> You might also want to explain a bit about the motivation for this which
> is that I/O Machine Check Arcitecture events may signal failing PCIe
> components or links. The AER event contains details on what was
> happening on the wire when the error was signaled.

Yes, I agree.

> >=20
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Fabio M. De Francesco=20
<fabio.m.de.francesco@linux.intel.com>
> > ---
> >  drivers/acpi/acpi_extlog.c | 30 ++++++++++++++++++++++++++++++
> >  drivers/pci/pcie/aer.c     |  2 +-
> >  include/linux/aer.h        | 13 +++++++++++--
> >  3 files changed, 42 insertions(+), 3 deletions(-)
> >=20
> > [...]
> >
> > +		pci_print_aer(pdev, aer_severity, aer);
>=20
> ...per above this would become:
>=20
>     pci_print_aer(KERN_DEBUG, pdev, aer_severity, aer);
>=20
> [..]
>=20
> Rest of the changes look good to me.

I need to be sure that I understood...

void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
                   struct aer_capability_regs *aer)
{
        [...]

        if (printk_get_level(level) <=3D console_loglevel) {
                pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
                        status, mask);
                __aer_print_error(dev, &info);
                pci_err(dev, "aer_layer=3D%s, aer_agent=3D%s\n",
                        aer_error_layer[layer], aer_agent_string[agent]);

                if (aer_severity !=3D AER_CORRECTABLE)
                        pci_err(dev, "aer_uncor_severity: 0x%08x\n",
                                aer->uncor_severity);

                if (tlp_header_valid)
                        __print_tlp_header(dev, &aer->header_log);
        }

        [...]
}=09

It would require changing a couple of call sites, like in   =20
aer_recover_work_func():

pci_print_aer(KERN_ERR, pdev, entry.severity, entry.regs);
=20
Would you please confirm that the code shown above is what
you asked for?

Thanks,

=46abio



