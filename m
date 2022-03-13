Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD664D7885
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 22:54:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KGtjQ5RDXz30NC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 08:54:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kd6HiZZC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ashok.raj@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Kd6HiZZC; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGthj2BkMz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 08:52:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647208405; x=1678744405;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IjVd8cturXGZmGe8andxrrHRkoNcB+kQTYO3rJ+bTec=;
 b=Kd6HiZZC+Be1M2OtQUvQQAZkbxoNt02ltRNh43fqiRRSLOd6XgTp8eva
 BHzvFQjlxONNv82itwn6juxjbyBePRuMkvC7eVDt4KlS3dyuNlX5PhezT
 IVQl3fKQvi9YGncmUOjYLoBjwyjUfVj1Mf/F4X19JppWEZYHaCnlSMDG3
 6Cwom6mWhH7bhrtEXkrr75GHRIUR7AuC0cpcHHWm+RIA8m7MaiQTcJwcd
 9t1ADEp9hMjtdq/7bvHxHfgo43GxwpankWpjxIY6J8WhBhSoSc4/OgLya
 UH1KGzsvNrez1vSuY+ndWdhb3cNvjNx47o4h8bbqqKZusGm9boH9Vu18M w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="342326757"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; d="scan'208";a="342326757"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 14:51:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; d="scan'208";a="556126366"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.125])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 14:51:43 -0700
Date: Sun, 13 Mar 2022 14:43:14 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v1] PCI/AER: Handle Multi UnCorrectable/Correctable
 errors properly
Message-ID: <20220313214314.GD182809@otc-nc-03>
References: <20220311025807.14664-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20220313195220.GA436941@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220313195220.GA436941@bhelgaas>
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Badger <ebadger@purestorage.com>,
 Oliver OHalloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 13, 2022 at 02:52:20PM -0500, Bjorn Helgaas wrote:
> On Fri, Mar 11, 2022 at 02:58:07AM +0000, Kuppuswamy Sathyanarayanan wrote:
> > Currently the aer_irq() handler returns IRQ_NONE for cases without bits
> > PCI_ERR_ROOT_UNCOR_RCV or PCI_ERR_ROOT_COR_RCV are set. But this
> > assumption is incorrect.
> > 
> > Consider a scenario where aer_irq() is triggered for a correctable
> > error, and while we process the error and before we clear the error
> > status in "Root Error Status" register, if the same kind of error
> > is triggered again, since aer_irq() only clears events it saw, the
> > multi-bit error is left in tact. This will cause the interrupt to fire
> > again, resulting in entering aer_irq() with just the multi-bit error
> > logged in the "Root Error Status" register.
> > 
> > Repeated AER recovery test has revealed this condition does happen
> > and this prevents any new interrupt from being triggered. Allow to
> > process interrupt even if only multi-correctable (BIT 1) or
> > multi-uncorrectable bit (BIT 3) is set.
> > 
> > Reported-by: Eric Badger <ebadger@purestorage.com>
> 
> Is there a bug report with any concrete details (dmesg, lspci, etc)
> that we can include here?

Eric might have more details to add when he collected numerous logs to get
to the timeline of the problem. The test was to stress the links with an
automated power off, this will result in some eDPC UC error followed by
link down. The recovery worked fine for several cycles and suddenly there
were no more interrupts. A manual rescan on pci would probe and device is
operational again.

The test patch revealed we entered the aer_irq() with just the multi-error
PCI_ERR_ROOT_MULTI_COR_RCV or PCI_ERR_ROOT_MULTI_UNCOR_RCV, then we didn't
clear those bits causing interrupt generation to cease after that.

Cheers,
Ashok
