Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1EE49DAC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 07:35:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkrSC3cjHz3cRk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 17:35:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CpEM6dmQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=mika.westerberg@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CpEM6dmQ; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkrRb0vdkz2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 17:34:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643265291; x=1674801291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oAtC2UENBb/Yx/gPjIbAsh8DxMuVnWALhMreXORpLwE=;
 b=CpEM6dmQI+j1CbQ5zOdLYloP1LrbsqunQ+iyJTmxvMCcNW5thiusQs8f
 ddjvvweDqss95kY8mCQyikc9tdxmtr1V4RzEPZQSQE/QkQDW/eyfbsY28
 CMblncs1DydHT4cOF395pSDOGjo6Uaiq3tYxNTbX4r54tNE+tRaNsyLou
 8a9MIgBj8LLY7w+IwOz9n4xrEXQky0EnKYuHi5jYxy/OQ91B3CVvnS2Lx
 Yea8/1uve1MNeYYtKr9jFuwlYZ55GNWgA/qQPrepiJf+zQqiLVRtQPqBR
 fC9nYq80akQEpQFi03nPt9ZcH6NvBfwW9lPxA+TeuELrNbrBEdyMYLoAa A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="271218051"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="271218051"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 22:33:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="521097307"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 22:33:38 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 27 Jan 2022 08:31:20 +0200
Date: Thu, 27 Jan 2022 08:31:20 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2 2/2] PCI/DPC: Disable DPC service when link is in
 L2/L3 ready, L2 and L3 state
Message-ID: <YfI8OGuAWKtPsv+J@lahna>
References: <20220127025418.1989642-1-kai.heng.feng@canonical.com>
 <20220127025418.1989642-2-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127025418.1989642-2-kai.heng.feng@canonical.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 10:54:18AM +0800, Kai-Heng Feng wrote:
> Since TLP and DLLP transmission is disabled for a Link in L2/L3 Ready,
> L2 and L3 (i.e. device in D3hot and D3cold), and DPC depends on AER, so
> also disable DPC here.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
