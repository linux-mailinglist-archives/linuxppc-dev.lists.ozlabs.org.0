Return-Path: <linuxppc-dev+bounces-4883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA93A06A59
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 02:34:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT6lm5Sbvz2yVb;
	Thu,  9 Jan 2025 12:34:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736386484;
	cv=none; b=HgAW5PlUzVjQXRzO8ibUhMdiQh5hoNE9HDDEOfsOUiYuKI3R0SacHzYI/dUTwsDI6H8xDzHkhmvW+OKhEh+1NS7kepqD6PSHFhZwjz1ufiYUVjvP6kxYnKTHzkRfPKjV78AQfFBhv/1cVets2QGanQo3vlV8p59sPASdaT3spncfXXEWYJKSXmFdD4rcEIRpdjuBev3HdsRZLylq8fr7xkU8rtPqu82QDreZS4iD+WsRR4tpfZnfxIaK3MjFjHQhgS15qczJS7OCj39zYEtnYdpYO2vHTusfTqR8WY2zYMnnbhD8Qbq4aPf8MThzoasytamws/1/lPvxulTLfCE5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736386484; c=relaxed/relaxed;
	bh=cOpwEm3vc64U9el0o8BXgtUsBUXlhU3xwaCjuDgOqVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRqeWQ6Usv61Gw9yxipJtdidhDdmhHG5D/WIyAjKtYDe+orMHUsAWvRDM2EWAX9KpTZNPqrN2ODNT3iIgdiegatKu8A1O3ZO8tj2x6gFwW1N6E6xW7qrrdnWt8pVtGkgqaV/qhSQ/NlgaesoxdU/OtKjE1o5DfdibD6kI6h/XtDY2y5SpowYZdaYFtg81qbRdE9P4HycP7i5nrFfZp3LrsJ3N3H1oyrW1JehowLNYOcB7VPsleEkJ02KwFI6YC6tqsvkkxGAkQ7Komu9qv1x6smvLwHwqlZVkkMSh+hjq+dA5gbV/UCV0TvV+tb4hhUoFgLih5j1VKPvJr0wkzm8qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jMe+NTqy; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=alison.schofield@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jMe+NTqy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=alison.schofield@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT6lk0KRTz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 12:34:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736386483; x=1767922483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RER8xEkbtZJunXd1DrZR4xiCOceE1iPmaLstar6K/Ws=;
  b=jMe+NTqyQWbdDIsRtGvuOsXcIqDN0QxeFXw1wk2Ai1Y1e3fPRux1M4Wx
   hkh5qtVyckL3Zrs/K1ImEgKZoUWXR74OoOztmr/gIJlkjEhlZzqk3Fy90
   jFkoBkFThcbgzf2Ep2CwRdh1/iDAZbteXthIA/W81psYh06LMyWtueG6L
   TOgQUaKJOs8oOVOalJ9eN0gU1HZ/o9rlJZY+kw1uXoQ8C1eTz6s0S2Gzy
   dAwWOvPoFxn4yDvAlx/ZF/MiQW/9M7O182a+1+lmwqooka4qgizbYcBSJ
   RqwgyqmeKp6CbKabr22C5cL0KX/t5C4Axa32iuv6LqG8K5rEaFRLOWGQf
   Q==;
X-CSE-ConnectionGUID: GypLofJaSWebhD/hn74Rhg==
X-CSE-MsgGUID: cxn8rDOcRjy+LDIu/pufxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40313998"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="40313998"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 17:34:35 -0800
X-CSE-ConnectionGUID: Hc5lWmCDRcOCp4HuSUdhaQ==
X-CSE-MsgGUID: 8EZhG4KIQciXTPEzWMApnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107305857"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2.lan) ([10.125.111.65])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 17:34:32 -0800
Date: Wed, 8 Jan 2025 17:34:30 -0800
From: Alison Schofield <alison.schofield@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
	lina@asahilina.net, zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
	jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
	will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com
Subject: Re: [PATCH v5 00/25] fs/dax: Fix ZONE_DEVICE page reference counts
Message-ID: <Z38npigJajz_gm-5@aschofie-mobl2.lan>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 07, 2025 at 02:42:16PM +1100, Alistair Popple wrote:
> Main updates since v4:
> 
>  - Removed most of the devdax/fsdax checks in fs/proc/task_mmu.c. This
>    means smaps/pagemap may contain DAX pages.
> 
>  - Fixed rmap accounting of PUD mapped pages.
> 
>  - Minor code clean-ups.
> 
> Main updates since v3:
> 
>  - Rebased onto next-20241216.

Hi Alistair-

This set passes the ndctl/dax unit tests when applied to next-20241216

Tested-by: Alison Schofield <alison.schofield@intel.com>

-- snip



