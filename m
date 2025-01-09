Return-Path: <linuxppc-dev+bounces-4918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08B5A079E8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 15:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTSb42PrMz3bW5;
	Fri, 10 Jan 2025 01:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736434704;
	cv=none; b=LxRbRh2Xdzjt2PfowAnKob/lcmFwzxvbHYhvwYEF1O06IISPEEKs29Tkgdh2KWvK4CyPddgmyczw/GT7MwtgZ4u7enh2bIWDs/NIpLY0QTP9qqJwFZFjD2aV+2rfV8wUTsubkL9xQ4uBEFK1EgtacBfgaRJqDC/I0LJ8PFBvQ/iKWbUv+ZcEP1F8o7/G8zgIkM5+cWYR5aQLbctBezMGqXHWEwAzBTNA1aaAtvleK4kkGeaUSWHMmg9gNeY/uYDWYyJ5MaXhoWumuoB7nmKIWTOCbX/ULstPXE29Qd6XGGbM3ZnLjpR3aVs+t/0ssckcfkKi3FsX5lB5ruxZhRZy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736434704; c=relaxed/relaxed;
	bh=ArKgt1VxN2cNvLcyRRoj9Mtzs0hBisL4VCbopgHPUqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Mp9uBhzfdyne/0FXo+ehCHeRZA80NPc8ceaibtSogugSSyhcrB74+JfLXJQFv7ntjTLqYY5CJNReLYAhelZhcEawW220Kx/HzuxRtVyFVI3DPQlUb/FlcgRv8C49zJm10BqHVFbt+Dmfb3gKxxquBjQmraxJii+wClKFck1zJGrmWvNJ5Ja1jMYCPJ0Dgx3Xa1d0jpdLEnCScwNgoELPic/YT7fQBskIXiTFjq4nC9YXf8t0VrpnWEv/gwnUkO9te+4O7xQKxx/EQu3urkxqjaYOLVzTQBt46MBTbzAsvYBG8ommeJtsucjfLiU0PCY2qBDZl/Gki/bJZq+qgnAK8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dNJKX3X9; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dNJKX3X9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTSb04wlLz3bW3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 01:58:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736434701; x=1767970701;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=vefbR+WxUsl6W1mxf4BqpYTUFUuz57yEjCw3Nj1MESk=;
  b=dNJKX3X9RXyOv2Lk2Z6mwNzEreJt8RV+n68UdsvVyiMkALktYoN+Kv2Q
   JetpNYAm+PsmuoTTBSdmzIv8cZOY7LUQCbGd/sGMRUV7LF0QluixSeS9P
   /GEf6s+bjANxV5mMTWFUyfzwOpn0Ed3f9T0nEra3duzc7W91Bd+r7B10x
   qM+iswYf8RJ0tBqacZKBB6HaM3c+kgEVDvIwKMX9nQ2FDpijAM4j4rwhJ
   u7I9WRhP3UYzAHHM3MeZUUPPsjURD1hgWq0Rv3mTYmBERubCO6C0yaXq2
   alPkxhyJ5xP35sMK0xCNTBpfL+AHGslrf3IaswS9soJT+NpSeolDMMjt5
   A==;
X-CSE-ConnectionGUID: d/ZFuFPwSuC2VluBYmFDOA==
X-CSE-MsgGUID: oRjEZ9xiRdW6LtWXbqxfjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48110954"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="48110954"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:58:14 -0800
X-CSE-ConnectionGUID: aAxGFyBISeOF2fi1TGSFDw==
X-CSE-MsgGUID: hUbAKolZSWC8NTenKubm+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108527826"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:58:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joel Granados <joel.granados@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fsc?=
 =?utf-8?Q?huh?=
 <linux@weissschuh.net>, Kees Cook <kees@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, Joel
 Granados <joel.granados@kernel.org>
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
Date: Thu, 09 Jan 2025 16:58:01 +0200
Message-ID: <87frlsjapy.fsf@intel.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 09 Jan 2025, Joel Granados <joel.granados@kernel.org> wrote:
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 2406cda75b7b..5384d1bb4923 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4802,7 +4802,7 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> -static struct ctl_table oa_table[] = {
> +static const struct ctl_table oa_table[] = {
>  	{
>  	 .procname = "perf_stream_paranoid",
>  	 .data = &i915_perf_stream_paranoid,

For i915,

Acked-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel

