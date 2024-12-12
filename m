Return-Path: <linuxppc-dev+bounces-4069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635E9F001B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 00:25:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8T9B6txMz30fg;
	Fri, 13 Dec 2024 10:25:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734045934;
	cv=none; b=JAJ1tYBy+Svp8lO7jwLJ4KZhcT5jiITWBErYG2FbooXuFRM+opSGnpkRSPd0vR9DiY6eRCKf+1Ukov8wkEZn0JJR4ghv4IDB6l3eE+gwzNUEUHX/RwUjsPBN5KGyqNYSRvgW6xXoLUcOcWZSuUa9OCh7LPzzMnogDFkGVF9LzqOSEuZcTbV6O6s5mEWIxASEAHt4aPwJyHHUm4uI3y5qv0Rnn/ZDiWAa6UsxMoeHk87GfLqyeRHjpTMTH2Bv3zhkKWs54/gFjYNlYJyp/wT+v39R0ht49YeJmIaxV4ttBYyuxk/34g17+/zc0eCjTkin7WDkLeSvXuQcVkTHfdVyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734045934; c=relaxed/relaxed;
	bh=xof6KjotFED6aNjGkQKMFIs3CD6wTr0V6nvA0U454fM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z9Ewe4pGOEDdsXjre/noL7tftgou1AImehs7uXT8LrbYI1LUfpebXPAOXULYA/fUSbdED8bWTCyAxFw6vZEleTywwitRBgqp3Y5PMoH9tj7x+fR9oEFRCPUF3EJ4lgxYw8kzPAlrYJmsDS4eDvez7tfc5d5E7evmbsdWYdyg70n0P7MFMuKiUpuLp1J5FJu1e78ehzJ0qn/gfOVN9EZJCFImRUNIYbf7ij3GC6KARUD9GAGR6s+qN9bMluou04pZ+8IWQgK3Pb3aVdZ9nEtjDNHLxhSiHfYup7s4r32aR2nUgoeZReoqqA73DxrTKvJdAXY9s+oe5V89sBzL5HYMCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jyycplv8; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jyycplv8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 13 Dec 2024 10:25:31 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8T970K7Jz30Wp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 10:25:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734045931; x=1765581931;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=8RkAiN7aafpa/YU5vNB2TjsIPY9KF58x80E0z5e7j6Y=;
  b=Jyycplv8gk9fqVPBpwf8d2GoymxtR3RRmnToAFgDGur3RUm89dbjSxrC
   azWah17+bdzFNBFyKBtTEwHvEQtxRO5c7p1ygjU/0eEDPeD+pPfV3u6Gw
   4plVVncedKoexzx59+iYEqbnS95wea2deC18rRMtjPeQWY1eI0h4eg5vQ
   xMJcNW5G6ivbPwLNFtgLiBHIumC4/oMd/JTX3t7ebmF+cneVLb6GoDmwS
   Qvsr2/r7FniyKx+ErZDACGx3wFh75/KLA3E3S36XOemE8muVKND0s/HAZ
   J3g3SM1CmddTaEgwZlRO/6o/tcwkDbk2nXFJD2DvnEtv/hX4Q0Jxv6CSJ
   g==;
X-CSE-ConnectionGUID: mMK2ExLfSV+4kDFjv1zyVQ==
X-CSE-MsgGUID: GgFQCudySYu1o7lvHviNFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="52013622"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="52013622"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 15:24:23 -0800
X-CSE-ConnectionGUID: g3JkOje5RZSvpXvSxtNrQA==
X-CSE-MsgGUID: 1J/Q+r1AT4qnxv1vEFkYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="96443567"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.129])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 15:24:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>, Thomas
 Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas
 <javierm@redhat.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie
 <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
In-Reply-To: <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <09edb59a-527a-4ddb-bfaf-ea74fb5a3023@gmx.de>
 <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
Date: Fri, 13 Dec 2024 01:24:14 +0200
Message-ID: <87frmstrhd.fsf@intel.com>
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

On Thu, 12 Dec 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> On Thu, Dec 12, 2024, at 19:44, Helge Deller wrote:
>> On 12/12/24 11:04, Thomas Zimmermann wrote:
>>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>>> only controls backlight support within fbdev core code and data
>>> structures.
>>>
>>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>>> select it explicitly. Fixes warnings about recursive dependencies,
>>> such as [...]
>>
>> I think in the fbdev drivers themselves you should do:
>> 	select BACKLIGHT_CLASS_DEVICE
>> instead of "depending" on it.
>> This is the way as it's done in the DRM tiny and the i915/gma500 DRM drivers.
>>
>> So, something like:
>>
>> --- a/drivers/staging/fbtft/Kconfig
>>         tristate "Support for small TFT LCD display modules"
>>         depends on FB && SPI
>>         depends on FB_DEVICE
>>    +    select BACKLIGHT_DEVICE_CLASS
>>         depends on GPIOLIB || COMPILE_TEST
>>         select FB_BACKLIGHT
>>
>> config FB_BACKLIGHT
>>            tristate
>>            depends on FB
>>    -	  select BACKLIGHT_CLASS_DEVICE
>>    +       depends on BACKLIGHT_CLASS_DEVICE
>>
>>
>> Would that fix the dependency warning?
>
> The above is generally a mistake and the root cause of the
> dependency loops. With very few exceptions, the solution in
> these cases is to find the inconsistent 'select' and change
> it into 'depends on'.

Agreed.

> I actually have a few more patches like this that I've
> been carrying for years now, e.g. one that changes all the
> 'select I2C' into appropriate dependencies.

I've done that for BACKLIGHT_CLASS_DEVICE and some related configs years
ago, but there was pushback, and I gave up. Nowadays when I see this I
just chuckle briefly and move on.

Occasionally I quote Documentation/kbuild/kconfig-language.rst:

	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
	In general use select only for non-visible symbols
	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.

If kconfig warned about selecting symbols with dependencies it would be
painful for a while but eventually I think life would be easier.

BR,
Jani.


-- 
Jani Nikula, Intel

