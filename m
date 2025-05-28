Return-Path: <linuxppc-dev+bounces-8967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879D9AC6689
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 12:00:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6lPd2JGQz2xRq;
	Wed, 28 May 2025 20:00:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748426453;
	cv=none; b=icDB2GNIZt0LsoAa14Ci/CepDd7bf7/mAj8PtDk8nue/8vjP8vUEDnA+qH47+TcIhGStj24V/4utkuQER8HUXb/zySWxYkLI1PkjelrvF6uEeYYqc4dN6bg64IW0qTflGVIL66LfUh85WWznRh3M+Ygf+lrwC6kE0ajP0UtUVKwU46LXRnFQVg5nsplyafDMRvGRPh+tRvWxmN3BZZpL7oj++9TST7dJsVnQcyy7eJLaSEsfdWzhVWvlZee481LsM5ipC5GjUDSQ7EM7tEJvmL6u1JWNrGm+S3RpZSQn2carkWQ0faOjXAfLIgJ4dj2Em+/hTsavCJYxKRRjaCX0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748426453; c=relaxed/relaxed;
	bh=LKnDUR0SktGjPGpiZWFhotHXy2fFqahSTBOtRDpaqrU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dmbMa7H0Iv6DuL94HyL08oYa+G7yAo/lC8mF2RQ2RPOYJ+TkUoYdA4IXN0KLODJc/Au+wnOjRpof/Wo4xf3k1bxMgH58EqKxMrLbEO/5/URIlse08I+QwL7wLMZ7EXO6xtbk5moS5gbOw9M6eRO6KgVmuU2IyILRhsG4xPqzAlFJ5PTBiquGepXkJSKvza6GlRzPqbNqPZi3cBFBc4XZa/SaXGzyyCNsr+qzll3Cq6eJKtzOqJRYZl3X+a3WWG5wuAdPszTpFLJNCJ8JS1wNdnUONwwngSKzFeFuDApAR67XCL5f6My6EOeB5ONO8tRe6105E2igTY25P9zhfXXlPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l64Gcsqt; dkim-atps=neutral; spf=none (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l64Gcsqt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6lPZ6xXSz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 20:00:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748426451; x=1779962451;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Zhox0hjZ9k9Tt2WB921pjM7KHIySapcRetCIkbZvAm0=;
  b=l64GcsqtF+eTdmJCRe6p4SkZ8WOFKLeypMKMylypYirGuMQCTMo3w//H
   8q3/lVQ1fIRysV94oqYrOj+IDkcuUZsTYWSh3+bomuTd3DjAgKxO87EIZ
   R7s3Sdcv6IrO2SnQK5BaBCqeIW15Q+VfwdJl3LfsLLcVCo9IIWhGrRFsv
   qbPAWfoFprlkC0XGoE2lyAERfoQggvaIvnZy0O21sjZkHGmgi5GvPokB/
   CCp8LPNjGS3Ud8YXaexTaTTDap83609ggejeqNPyHGZ8IeYwuQ6zt8rKc
   a9/3mdqSynvY7wcjnl5QzJghwZpDDV8KwLMaPMEKJqp5fwN+oJ9RjOry7
   w==;
X-CSE-ConnectionGUID: cMVmgxnVTnODd9is9wCLEg==
X-CSE-MsgGUID: b1p07ouYRDa3p65pcklJZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50550875"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50550875"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:00:47 -0700
X-CSE-ConnectionGUID: H40m0oA3Tme67hHo37j6Hw==
X-CSE-MsgGUID: kCQj+gMSSgORFrdMdims+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="166372921"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.151])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:00:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 May 2025 13:00:34 +0300 (EEST)
To: Lukas Wunner <lukas@wunner.de>
cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
    Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Weinan Liu <wnliu@google.com>, 
    Martin Petersen <martin.petersen@oracle.com>, 
    Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, 
    Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, 
    Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
    Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
    Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v8 13/20] PCI/ERR: Add printk level to
 pcie_print_tlp_log()
In-Reply-To: <aDave5XyXZoKWole@wunner.de>
Message-ID: <1565a7a9-bcf0-e8e4-0f75-de8859b47a8f@linux.intel.com>
References: <20250522232339.1525671-1-helgaas@kernel.org> <20250522232339.1525671-14-helgaas@kernel.org> <aDave5XyXZoKWole@wunner.de>
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

On Wed, 28 May 2025, Lukas Wunner wrote:

> On Thu, May 22, 2025 at 06:21:19PM -0500, Bjorn Helgaas wrote:
> > @@ -130,6 +132,6 @@ void pcie_print_tlp_log(const struct pci_dev *dev,
> >  		}
> >  	}
> >  
> > -	pci_err(dev, "%sTLP Header%s: %s\n", pfx,
> > +	dev_printk(level, &dev->dev, "%sTLP Header%s: %s\n", pfx,
> >  		log->flit ? " (Flit)" : "", buf);
> >  }
> 
> Nit: pci_printk() ?
> 
> The definition in include/linux/pci.h was retained by fab874e12593.

If pci_printk() is taken into use once again, there's 56d305b24d64 ("PCI: 
Remove pci_printk()") queued already in pci/misc which should be dropped 
in that case.

-- 
 i.


