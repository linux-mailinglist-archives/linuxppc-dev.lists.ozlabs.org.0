Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E584843877
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 09:05:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nAbdAgrR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPvjM17TFz3cLY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 19:05:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nAbdAgrR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=qingshun.wang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPvhb3ckqz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 19:04:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706688288; x=1738224288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2wy6IAqZWDlhSg8xSyQOwMuys/jiy/qt5c8fR9V26Dk=;
  b=nAbdAgrRyI65hp691yPbj14k9H7KLmKbOKkVYt0NsLAx0YSLa/T442SW
   ojr8NXGDANC9KN11BKjpNcTZeEEkJJU+iH4MoEHhSeiU+ap/19iUo8257
   M+Pf5QXwFieWnqRM3tZx/Gt58F26joU9QzjtpFbePbpb9Jn1Xu7FfIkPJ
   hMBW+/u5mQuz1fqZ9lfQrEOwoTspn62692wNkph4lJFaoi/R4DlGPWgnW
   liMlBjHZAFGFq7l9aJWfyYz8H6ID/YzvXH3RRknKtPe1eYI+5vD5895pL
   F3wofXyRChB2zDBGbyJhj/INHEzVU879jNLmej7ZszLCOB8ZZF86oOiPq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17059010"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="17059010"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 00:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3992171"
Received: from nixos.sh.intel.com (HELO localhost) ([10.238.2.93])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 00:04:33 -0800
Date: Wed, 31 Jan 2024 16:04:21 +0800
From: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
To: 	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v2 1/4] PCI/AER: Store more information in aer_err_info
Message-ID: <ojv6nqi55o4q3aazf34w7yjriagup3h5dmim7k67xuv6t7xdjr@m3bjyroi4jfq>
References: <20240125062802.50819-1-qingshun.wang@linux.intel.com>
 <20240125062802.50819-2-qingshun.wang@linux.intel.com>
 <6ecb7bbf-0eba-4cea-b9b8-05fd092b7d01@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ecb7bbf-0eba-4cea-b9b8-05fd092b7d01@linux.intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, erwin.tsaur@intel.com, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, chao.p.peng@linux.intel.com, Ira Weiny <ira.weiny@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, linux-acpi@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Len Brown <lenb@kernel.org>, Robert Richter <rrichter@amd.com>, Borislav Petkov <bp@alien8.de>, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, feiting.wanyan@intel.com, qingshun.wang@intel.com, Adam Preble <adam.c.preble@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Li Yang <l
 eoyang.li@nxp.com>, Lukas Wunner <lukas@wunner.de>, James Morse <james.morse@arm.com>, linuxppc-dev@lists.ozlabs.org, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 30, 2024 at 06:26:39PM -0800, Kuppuswamy Sathyanarayanan wrote:
> 
> On 1/24/24 10:27 PM, Wang, Qingshun wrote:
> > When Advisory Non-Fatal errors are raised, both correctable and
> 
> Maybe you can start with same info about what Advisory Non-FataL
> errors are and the specification reference. I know that you included
> it in cover letter. But it is good to include it in commit log.

Good idea, thanks!

> 
> > uncorrectable error statuses will be set. The current kernel code cannot
> > store both statuses at the same time, thus failing to handle ANFE properly.
> > In addition, to avoid clearing UEs that are not ANFE by accident, UE
> 
> Please add some details about the impact of not clearing them.

Makes sense, will do.

> > severity and Device Status also need to be recorded: any fatal UE cannot
> > be ANFE, and if Fatal/Non-Fatal Error Detected is set in Device Status, do
> > not take any assumption and let UE handler to clear UE status.
> >
> > Store status and mask of both correctable and uncorrectable errors in
> > aer_err_info. The severity of UEs and the values of the Device Status
> > register are also recorded, which will be used to determine UEs that should
> > be handled by the ANFE handler. Refactor the rest of the code to use
> > cor/uncor_status and cor/uncor_mask fields instead of status and mask
> > fields.
> >
> > Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> > ---
> >  drivers/acpi/apei/ghes.c | 10 ++++-
> >  drivers/cxl/core/pci.c   |  6 ++-
> >  drivers/pci/pci.h        |  8 +++-
> >  drivers/pci/pcie/aer.c   | 93 ++++++++++++++++++++++++++--------------
> >  include/linux/aer.h      |  4 +-
> >  include/linux/pci.h      | 27 ++++++++++++
> >  6 files changed, 111 insertions(+), 37 deletions(-)
> >
> > ......
> >
> > @@ -1213,38 +1233,49 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
> >  	int temp;
> >  
> >  	/* Must reset in this function */
> > -	info->status = 0;
> > +	info->cor_status = 0;
> > +	info->uncor_status = 0;
> > +	info->uncor_severity = 0;
> >  	info->tlp_header_valid = 0;
> >  
> >  	/* The device might not support AER */
> >  	if (!aer)
> >  		return 0;
> >  
> > -	if (info->severity == AER_CORRECTABLE) {
> > +	if (info->severity == AER_CORRECTABLE ||
> > +	    info->severity == AER_NONFATAL ||
> > +	    type == PCI_EXP_TYPE_ROOT_PORT ||
> > +	    type == PCI_EXP_TYPE_RC_EC ||
> > +	    type == PCI_EXP_TYPE_DOWNSTREAM) {
> 
> 
> It looks like you are reading both uncorrectable and correctable status
> by default for both NONFATAL and CORRECTABLE errors. Why not do
> it conditionally only for ANFE errors?
> 
> 

My initial purpose was the value will be used in aer_event trace in
PATCH 4 under both conditions, but I can also add checks here to reduce
unnecessary IO and remove the checks in PATCH 4.

> > +		/* Link is healthy for IO reads */
> >  		pci_read_config_dword(dev, aer + PCI_ERR_COR_STATUS,
> > -			&info->status);
> > +				      &info->cor_status);
> >  		pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK,
> > -			&info->mask);
> >  
> > ......
> >
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index add9368e6314..259812620d4d 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -318,6 +318,33 @@ struct pci_sriov;
> >  struct pci_p2pdma;
> >  struct rcec_ea;
> >  
> > +struct pcie_capability_regs {
> > +	u8 pcie_cap_id;
> > +	u8 next_cap_ptr;
> > +	u16 pcie_caps;
> > +	u32 device_caps;
> > +	u16 device_control;
> > +	u16 device_status;
> > +	u32 link_caps;
> > +	u16 link_control;
> > +	u16 link_status;
> > +	u32 slot_caps;
> > +	u16 slot_control;
> > +	u16 slot_status;
> > +	u16 root_control;
> > +	u16 root_caps;
> > +	u32 root_status;
> > +	u32 device_caps_2;
> > +	u16 device_control_2;
> > +	u16 device_status_2;
> > +	u32 link_caps_2;
> > +	u16 link_control_2;
> > +	u16 link_status_2;
> > +	u32 slot_caps_2;
> > +	u16 slot_control_2;
> > +	u16 slot_status_2;
> > +};
> > +
> IIUC, this struct is only used drivers/acpi/apei/ghes.c . Why not define it in that file?

You are right. Whenever we need it elsewhere, we can move it to the
header file anyway.

> >  /* The pci_dev structure describes PCI devices */
> >  struct pci_dev {
> >  	struct list_head bus_list;	/* Node in per-bus list */
> 
> -- 
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
> 

--
Best regards,
Wang, Qingshun
