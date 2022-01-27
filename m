Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7302449DAAB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 07:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkrM82Ywtz30Q9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 17:31:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MSumarAh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=mika.westerberg@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MSumarAh; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkrLS501lz2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 17:30:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643265024; x=1674801024;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JkOo36tz8YaoDuZXPsp9O8nW6ib1sRzLUQMQhkkfdUQ=;
 b=MSumarAhHMLbd73Owu8v11/dLD4tTa6WJ2q8sPQfntaanwKVUzgkTP32
 VF2WFCN2MOxNNPyMC1dzXT/T21ElGsS3AokcKyREIfN+Nxh0oMQHcN/58
 NoCEJn5IxPvGDRN5zISrnHwrVLVTFsS4642Fl+aNiY4Qgwj+muxv0xBUN
 pUNLtfIZpoxo/Wg/6rmER+glcrB2hdSwGyiUE7bvhtn8zDHrfpqAqi67V
 GAlLGcOOI6QPYgGu2GMmGlKoNDyRxu1TaHJ6w2bWz3x7Ktam4/aM5WSPr
 +kIASRaRawFum5YGP8WoxNgfr0t8m+oA//6YiksjGKCkYW+5gCNbQcVJP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333118447"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="333118447"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 22:29:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="618225100"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 22:29:18 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 27 Jan 2022 08:29:15 +0200
Date: Thu, 27 Jan 2022 08:29:15 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 1/2] PCI/AER: Disable AER when link is in L2/L3 ready, L2
 and L3 state
Message-ID: <YfI7u5XSlNlx2w4I@lahna>
References: <20220126071853.1940111-1-kai.heng.feng@canonical.com>
 <YfEqZMUS9jyiErmF@lahna>
 <CAAd53p7H3RApEHOzJYorD9VBnaPqYRkzE2g+8hAUXRToc=jbGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd53p7H3RApEHOzJYorD9VBnaPqYRkzE2g+8hAUXRToc=jbGg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Joerg Roedel <jroedel@suse.de>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com,
 linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Jan 27, 2022 at 10:21:35AM +0800, Kai-Heng Feng wrote:
> On Wed, Jan 26, 2022 at 7:03 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Wed, Jan 26, 2022 at 03:18:51PM +0800, Kai-Heng Feng wrote:
> > > Commit 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in
> > > hint") enables ACS, and some platforms lose its NVMe after resume from
> > > S3:
> > > [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
> > > [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
> > > [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
> > > [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
> > > [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
> > > [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
> > > [   50.947843] nvme nvme0: frozen state error detected, reset controller
> > >
> > > It happens right after ACS gets enabled during resume.
> >
> > Is this really because of the above commit of due the fact that AER
> > "service" never implemented the PM hooks in the first place ;-)
> 
> >From what I can understand, all services other than PME should be
> disabled during suspend.
> 
> For example, should we convert commit a697f072f5da8 ("PCI: Disable PTM
> during suspend to save power") to PM hooks in PTM service?

Yes, I think that's the right thing to do. I wonder how it was not using
the PM hooks in the first place.
