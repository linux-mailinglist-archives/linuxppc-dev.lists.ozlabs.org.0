Return-Path: <linuxppc-dev+bounces-8753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8C5ABDC21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 16:20:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1xYJ4Vk6z30Wh;
	Wed, 21 May 2025 00:20:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747750852;
	cv=none; b=k5E7wJf/TMiXj0eCzJtkWaqDBukGz0jfg08Tz/IeWSof/zQCy5wjLUpm+w0CEz5bb0oNADOQIXi3L/jH5nXrd00BHsOcoBlsF2EuqP2erX0Zy2y/567c0ZY5FSdVogy2evG0PutgIlX4Tb/1vTR5H+WZniR+Plu0/pRU/O728VjPf7UNI6zR8Bd8eYJp8/ElSLT3CqTWzZA71mA2KwmEwh/M1wbVTjt+CtCmFii2Waxu5GH94bl0Vt63MG4JdGrd7uerG73L3kuzfvyF1CrR6yDKttpV/fVSNVuKkRleXh8CMBgb6TvTim0X92xyd12aRtfdwdWZDqcyQrreBmZS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747750852; c=relaxed/relaxed;
	bh=9M7/BlfP7dJzumS/QsdQ4YkeRvcLGafBItc3rCa9KCU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fAQebMjwUshxkLoccaeYKSzzFJI8YSvWgnOKgWimHw7bYFPXrNRwh844+L6xAzI8cV0XbmpYwgeelyGiilWX4981WWKegQdrmCTuWYLayU7vFfEn4Mgk74oPgoU18L3d2gTlZLLKle0Qst2k4trUvPORJl3Qf52Eyq18CyQ8Lh4NoAWvY+01fherSajBBDhULiLl8MgEnURUtOrzMCK3nf0h9VbyAe0WMqrplebIZKMfPI1si70nd/+rRSue5dKMX1UiXR3nCkROB5vCh87Hk5K0PLrMhUdOrLpJvl9Hg+5xEBAlVf974zJePCUWTySIM0U37mFZADKfAL2nJMSUOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZGJxnrPC; dkim-atps=neutral; spf=none (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZGJxnrPC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1xYG1H9gz3055
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 00:20:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747750851; x=1779286851;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Iwy8kTFA+CL3opqrAZmUfyGJXHiNgP8g4TkfU4hripA=;
  b=ZGJxnrPCV1Mb0hHv+zl4f+Dh0hYUM5sezv9f2S8yuMCbD1WCvI4DDgz+
   hlw/Dh27uO5l8HpgFQELwJ2muoj9V89AA+vltLuTpkfFQ10IYCLjnMMxD
   MvtxqUJkdycL384fsGsWK762f34orKIzkZ1NDCRr9VgsHThQ3c9nktrTe
   t0ynk2bJTXnf9mghPvOWZYImin59p6s9r6dACgfGF38cxVZ58aL501F83
   jV5Gr8+ws0Ae/8ZyNhrk+mzzY/pcxzOa18kWn89L+SCvPankMrpWg4uPw
   MAgSlSRNzN0BT2cYuYfZWI9f7sz5SlzG0vwKwK6Kxw+6NTv6CF4AuZV7G
   A==;
X-CSE-ConnectionGUID: G88DV3qfQtKC17p88YbrSA==
X-CSE-MsgGUID: roOCzxQVRoWNZ8GNZkAcZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60345944"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60345944"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:20:46 -0700
X-CSE-ConnectionGUID: Gyg/2X3wTZ+ThaqpK5G17Q==
X-CSE-MsgGUID: AC6vN28JQX+9Hj8h2W3gsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139606900"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:20:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 17:20:36 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
    linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Martin Petersen <martin.petersen@oracle.com>, 
    Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, 
    Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, 
    Lukas Wunner <lukas@wunner.de>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
    Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
    Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 02/16] PCI/DPC: Log Error Source ID only when valid
In-Reply-To: <20250520140025.GA1291490@bhelgaas>
Message-ID: <57dc908d-c158-9019-b86e-3c051b951d17@linux.intel.com>
References: <20250520140025.GA1291490@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 20 May 2025, Bjorn Helgaas wrote:

> On Mon, May 19, 2025 at 04:15:56PM -0700, Sathyanarayanan Kuppuswamy wrote:
> > On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> > > From: Bjorn Helgaas <bhelgaas@google.com>
> > > 
> > > DPC Error Source ID is only valid when the DPC Trigger Reason indicates
> > > that DPC was triggered due to reception of an ERR_NONFATAL or ERR_FATAL
> > > Message (PCIe r6.0, sec 7.9.14.5).
> > > 
> > > When DPC was triggered by ERR_NONFATAL (PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE)
> > > or ERR_FATAL (PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) from a downstream device,
> > > log the Error Source ID (decoded into domain/bus/device/function).  Don't
> > > print the source otherwise, since it's not valid.
> > > 
> > > For DPC trigger due to reception of ERR_NONFATAL or ERR_FATAL, the dmesg
> > > logging changes:
> > > 
> > >    - pci 0000:00:01.0: DPC: containment event, status:0x000d source:0x0200
> > >    - pci 0000:00:01.0: DPC: ERR_FATAL detected
> > >    + pci 0000:00:01.0: DPC: containment event, status:0x000d, ERR_FATAL received from 0000:02:00.0
> > > 
> > > and when DPC triggered for other reasons, where DPC Error Source ID is
> > > undefined, e.g., unmasked uncorrectable error:
> > > 
> > >    - pci 0000:00:01.0: DPC: containment event, status:0x0009 source:0x0200
> > >    - pci 0000:00:01.0: DPC: unmasked uncorrectable error detected
> > >    + pci 0000:00:01.0: DPC: containment event, status:0x0009: unmasked uncorrectable error detected
> > > 
> > > Previously the "containment event" message was at KERN_INFO and the
> > > "%s detected" message was at KERN_WARNING.  Now the single message is at
> > > KERN_WARNING.
> > 
> > Since we are handling Uncorrectable errors, why not use pci_err?
> 
> Sounds reasonable to me.  I would do it in a separate patch because
> the point of this one is to avoid logging junk when Error Source ID is
> not valid.
> 
> > > +		pci_warn(pdev, "containment event, status:%#06x, %s received from %04x:%02x:%02x.%d\n",
> > > +			 status,
> > 
> > I see the BDF extraction and format code in many places in the PCI
> > drivers. May be a common macro will make it more readable.
> 
> Good idea.  Not sure how to implement it, so I put that on my TODO
> list for now.

Instead of macros, it might be worth adding a printf specifier for this. 
Together with some flags, it should be possible to cover also the 
variations that print less than the full BDF format.

> > > +			 (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
> > > +				"ERR_FATAL" : "ERR_NONFATAL",
> > > +			 pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
> > > +			 PCI_SLOT(source), PCI_FUNC(source));
> 

-- 
 i.


