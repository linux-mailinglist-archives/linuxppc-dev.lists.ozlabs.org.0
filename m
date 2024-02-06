Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ECF84BB33
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 17:42:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Inmg1AMQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTpvQ6wh8z3cB2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 03:42:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Inmg1AMQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=qingshun.wang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTptf0bfbz2xQ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 03:42:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707237723; x=1738773723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rRNlDDubtypf416CZLetd6q9gBTbLbGyegrQgkQerDE=;
  b=Inmg1AMQQxjpG4V2bgYR7oBU91LwPPsVLzGIFUmBKF+R3SiJS1HGBS6l
   s132a4FKa6ahBCz9i5+PoBT1966K2JB+6wGWlp47/6S8FrAZ2GvrtI7Ns
   MwsnhePyXAcHO4yY22FIeOrKLqnGndiDtOoxG5/x9FB+ZfAByOsufbAeo
   se/N86PMnipyMnnlkEGQmGkVG52bd6rwzyEdCfdl0nHCsZOo4O60cYE0F
   jcB95TQ/rSjEyjafHQ1cEB329sacWvMRrEqXHFh5s9F5kXO980UiYPMry
   YYj+EVDuG1S6mw75VoERKllC4YPhxb61a9VGynpQV+RaL4n3X4oLhZ0f5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="18304909"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="18304909"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 08:41:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1357592"
Received: from jingjing-mobl1.ccr.corp.intel.com (HELO localhost) ([10.254.215.110])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 08:41:49 -0800
Date: Wed, 7 Feb 2024 00:41:41 +0800
From: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 1/4] PCI/AER: Store more information in aer_err_info
Message-ID: <2rfnevhnhylik4r6smr56uunsxweo7s5elo65sjhiztvxnr6bq@5fcyv22zxyyp>
References: <20240125062802.50819-2-qingshun.wang@linux.intel.com>
 <20240205231231.GA830643@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205231231.GA830643@bhelgaas>
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

On Mon, Feb 05, 2024 at 05:12:31PM -0600, Bjorn Helgaas wrote:
> On Thu, Jan 25, 2024 at 02:27:59PM +0800, Wang, Qingshun wrote:
> > When Advisory Non-Fatal errors are raised, both correctable and
> > uncorrectable error statuses will be set. The current kernel code cannot
> > store both statuses at the same time, thus failing to handle ANFE properly.
> > In addition, to avoid clearing UEs that are not ANFE by accident, UE
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
> 
> There's a lot going on in this patch.  Could it possibly be split up a
> bit, e.g., first tease apart aer_err_info.status/.mask into
> .cor_status/mask and .uncor_status/mask, then add .uncor_severity,
> then add the device_status bit separately?  If it could be split up, I
> think the ANFE case would be easier to see.
> 
> Thanks a lot for working on this area!
> 
> Bjorn

Thanks for the feedback! Will split it up into two pacthes in the next
version.

--
Best regards,
Wang, Qingshun
