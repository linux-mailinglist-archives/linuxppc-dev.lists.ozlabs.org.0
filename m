Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8584E4D7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 17:17:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RVWFLwBi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TW2FH6Wkmz3cXm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 03:17:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RVWFLwBi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=qingshun.wang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TW2DY0QV3z3btX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 03:16:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707409005; x=1738945005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vNcKCC/VYDlVMZCuvfjdsv4qWjl8OrFT+5tYxsr8d0s=;
  b=RVWFLwBiaZOqbqQyNJi8dna5ATfKOHW7upNzfldwB8+GD4nFzAJeQxS+
   aYAifpc5GgQQPaABFJS7leNpm93YoFrrECcOPamQ/RYPID7bB85lkkiQf
   Dp0bdw9cEvT/xkG1wMUJBJx2yEuWg45+CiYa5mGOHoKHsRHcpLR34ICVd
   0iy7JZGJeOMQ1eMPhzO6PAX1N/Kb73oSI7ox3ExU6BVM3jxyzs8wSVGYN
   iaeT2XOOl7PYLxF9AujhXyA5oOjQT09qZoWql64deE6a2Z8JrBPwGDufd
   hSduoCQmYaGCTjHGHGiio+P95bxQXI3yIBj2uxE8OTU+l8YYZQhdEoFFj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1115678"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1115678"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:16:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="24927005"
Received: from zhushaoj-mobl1.ccr.corp.intel.com (HELO localhost) ([10.249.169.162])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:16:32 -0800
Date: Fri, 9 Feb 2024 00:16:23 +0800
From: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 1/4] PCI/AER: Store more information in aer_err_info
Message-ID: <vc67zlmqs46fx2iqjqlpvju5dzpdvqkmydpebecgcaxjivlmu5@ksu4c2g7qqig>
References: <2rfnevhnhylik4r6smr56uunsxweo7s5elo65sjhiztvxnr6bq@5fcyv22zxyyp>
 <20240206172335.GA872811@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206172335.GA872811@bhelgaas>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, erwin.tsaur@intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, chao.p.peng@linux.intel.com, Ira Weiny <ira.weiny@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, Robert Richter <rrichter@amd.com>, Borislav Petkov <bp@alien8.de>, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, feiting.wanyan@intel.com, qingshun.wang@intel.com, Adam Preble <adam.c.preble@intel.com>, Mahesh J Salgaonk
 ar <mahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, Lukas Wunner <lukas@wunner.de>, James Morse <james.morse@arm.com>, linuxppc-dev@lists.ozlabs.org, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 06, 2024 at 11:23:35AM -0600, Bjorn Helgaas wrote:
> On Wed, Feb 07, 2024 at 12:41:41AM +0800, Wang, Qingshun wrote:
> > On Mon, Feb 05, 2024 at 05:12:31PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Jan 25, 2024 at 02:27:59PM +0800, Wang, Qingshun wrote:
> > > > When Advisory Non-Fatal errors are raised, both correctable and
> > > > uncorrectable error statuses will be set. The current kernel code cannot
> > > > store both statuses at the same time, thus failing to handle ANFE properly.
> > > > In addition, to avoid clearing UEs that are not ANFE by accident, UE
> > > > severity and Device Status also need to be recorded: any fatal UE cannot
> > > > be ANFE, and if Fatal/Non-Fatal Error Detected is set in Device Status, do
> > > > not take any assumption and let UE handler to clear UE status.
> > > > 
> > > > Store status and mask of both correctable and uncorrectable errors in
> > > > aer_err_info. The severity of UEs and the values of the Device Status
> > > > register are also recorded, which will be used to determine UEs that should
> > > > be handled by the ANFE handler. Refactor the rest of the code to use
> > > > cor/uncor_status and cor/uncor_mask fields instead of status and mask
> > > > fields.
> > > 
> > > There's a lot going on in this patch.  Could it possibly be split up a
> > > bit, e.g., first tease apart aer_err_info.status/.mask into
> > > .cor_status/mask and .uncor_status/mask, then add .uncor_severity,
> > > then add the device_status bit separately?  If it could be split up, I
> > > think the ANFE case would be easier to see.
> > 
> > Thanks for the feedback! Will split it up into two pacthes in the next
> > version.
> 
> Or even three:
> 
>   1) tease apart aer_err_info.status/.mask into .cor_status/mask and
>      .uncor_status/mask
> 
>   2) add .uncor_severity
> 
>   3) add device_status
> 
> Looking at this again, I'm a little confused about 2) and 3).  I see
> the new read of PCI_ERR_UNCOR_SEVER into .uncor_severity, but there's
> no actual *use* of it.
> 
> Same for 3), I see the new read of PCI_EXP_DEVSTA, but AFAICS there's
> no use of that value.
> 

Both 2) and 3) are used in PATCH 2 and traced in PATCH 4. I can separate
the logic for reading these values from PATCH 1 and merge it with PATCH
2.

--
Best regards,
Wang, Qingshun
