Return-Path: <linuxppc-dev+bounces-5013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3013AA09843
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 18:15:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV7ZS3n3Fz3cbg;
	Sat, 11 Jan 2025 04:15:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736529312;
	cv=none; b=nMyIsu8qaZAPiYFFM4d3j95rwI37/q9g2+xjrdUJyMd7bEFuBR7TdFkekCW73ORIHggx2oucWEJddomUhl6h7dcpHY4gp9n9dCHYCxYHv1UH+7L2RqWy1fYn4KEYNnmfrnVq0r6TglJ8SKK4+nVuAqm+hPRiHAhQcQafRLxMnqgwF9kfY1Uv5AZMXk8fuBDGrgysCKFu27XsoyUafQNCgFfc7742K9iBzMXVWvjNlZiGBBqIb2jMVq/iWRyy7/WJu1OcfuzkE6b65nhm7QWK2hda1ZRDdpc3n8IU5ijr6wqDyDO2+y0sWoSn4gmFmCg6q0ZT1W3vte3mDzk7YqIU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736529312; c=relaxed/relaxed;
	bh=rU8B9pXUWMp+CstKuXw+YGxa2kBNtjGh+nPj+/URa+U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTEvFg/HASp8vTfWctz3BsfBbi4SpllzBAuq5SfIsuzxUlbwvRhwYZRGo15YXt0PPwkX9EV8mGHTEN2WCy2YFjzFR6vvIXru62ktThklt37lQ1vt8OakWyFkzIMc9vh5jYI2iDXDjgxcM+qXulGUD8lR5DkvPQEUJP9hjHLVMOt70BMqVyVVEk6oKDA/ArcT1GPTu7me9uncjAfBgxeHEhg+p7tCofa1zpkDXHxL+FCalGWtYBA8uFVJdfIErmDxxCorYDStUZgjSA61unaGoCj1u1EQSxVgCnDSyK3S/rZbPrOzT6nxW7wGrOVKmlEMEBX9OHvqsuQfLYoaXlzUjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R9QF8Jn8; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=ashutosh.dixit@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R9QF8Jn8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=ashutosh.dixit@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 11 Jan 2025 04:15:08 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV7ZN2q2Vz3cbL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 04:15:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736529308; x=1768065308;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=zCD9wMt7oj+kJBhlIcsVVTGT43QE2wPIyfO0mHZuo3E=;
  b=R9QF8Jn8iKznUKVRSTrloSueTFu/IvwtijynjYwngqd9KqJRfDP9ZgOv
   pMWnaIR8g93gcr4RzBKmW0k5xpLKUA4exDj55weXL3U6uzmmITyXHsv/6
   3vftq/qHWvalUFb6NtSecyL4wu3N10Ucl4FYa1vlzgpTbEfSRPsFoZ329
   vFksbMD7MilkcW0wpu8JYgTHy8XGa6i4K19FhLoWveUzZZ08Ca5TqGXjH
   1zEDs3Tl3AsmAG2fBZlU++DJLn2hCUN+8KQPz9gmnMksOJac2rTdt97Ml
   iqBSDW5jj5k9lxz11FSxMDULC04i5foBeWBOecrmld/xS+ZL3Kn1N1VuX
   Q==;
X-CSE-ConnectionGUID: gkEgOc2TQrerMHWTDNZnAw==
X-CSE-MsgGUID: 6tBvRwF0SkWxe/xmS1IHWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36712477"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36712477"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 09:13:58 -0800
X-CSE-ConnectionGUID: d+N1H3FPQryemumCSoERgQ==
X-CSE-MsgGUID: skCK+1HISZSgobnkHZdoJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127073384"
Received: from orsosgc001.jf.intel.com (HELO orsosgc001.intel.com) ([10.165.21.142])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 09:13:57 -0800
Date: Fri, 10 Jan 2025 09:13:56 -0800
Message-ID: <8534hqvbfv.wl-ashutosh.dixit@intel.com>
From: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,	Kees Cook
 <kees@kernel.org>,	Luis Chamberlain <mcgrof@kernel.org>,
	linux-arm-kernel@lists.infradead.org,	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,	linux-crypto@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,	intel-xe@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,	linux-rdma@vger.kernel.org,
	linux-raid@vger.kernel.org,	linux-scsi@vger.kernel.org,
	linux-serial@vger.kernel.org,	xen-devel@lists.xenproject.org,
	linux-aio@kvack.org,	linux-fsdevel@vger.kernel.org,	netfs@lists.linux.dev,
	codalist@coda.cs.cmu.edu,	linux-mm@kvack.org,	linux-nfs@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,	fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,	io-uring@vger.kernel.org,	bpf@vger.kernel.org,
	kexec@lists.infradead.org,	linux-trace-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,	keyrings@vger.kernel.org
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.2 (x86_64-redhat-linux-gnu) MULE/6.0 (HANACHIRUSATO)
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
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 09 Jan 2025 05:16:39 -0800, Joel Granados wrote:
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 2406cda75b7b..5384d1bb4923 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4802,7 +4802,7 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
>	return ret;
>  }
>
> -static struct ctl_table oa_table[] = {
> +static const struct ctl_table oa_table[] = {
>	{
>	 .procname = "perf_stream_paranoid",
>	 .data = &i915_perf_stream_paranoid,
> diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> index 8ec1b84cbb9e..57cf01efc07f 100644
> --- a/drivers/gpu/drm/xe/xe_observation.c
> +++ b/drivers/gpu/drm/xe/xe_observation.c
> @@ -56,7 +56,7 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>	}
>  }
>
> -static struct ctl_table observation_ctl_table[] = {
> +static const struct ctl_table observation_ctl_table[] = {
>	{
>	 .procname = "observation_paranoid",
>	 .data = &xe_observation_paranoid,

For i915 and xe:

Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

