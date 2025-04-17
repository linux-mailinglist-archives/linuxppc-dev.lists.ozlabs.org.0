Return-Path: <linuxppc-dev+bounces-7729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE83A915A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 09:48:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdVQD2ryTz2yqT;
	Thu, 17 Apr 2025 17:48:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744876132;
	cv=none; b=GbHBj+1MCM2UE85m763UMWF+X6Q0PRSYgs04SbOf/SoM34A52AqtZsk5GV5k/jHYTZ3QbkZvG+yfLCO8V8QbXLZoW184rplkbc6Nf13La8V8JQqBbQXE1Etf7daGk8vFJldyyJRv6i6pVVvHe4mGBTLifqND6ssCYgw1N+63WZeRBQhf+3z4bCNFha17xyCHipP2ynQwt72ZE9RpSe6OncFWy6RzKSI4hMJSZiOJ+xkWDn4kEF730bQTu2aok5KzOhEmSaG11QEyyxWJyJcPjh1FYhxQgA/4UzzAjjDUjfa15OWMQTaS3Q0Btd3vmshjwV6ej+XerKmkld8fRzAKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744876132; c=relaxed/relaxed;
	bh=p43bfdOmuQ8qqwc94HMuGClre+3eHsXSQHqnA09BKYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V91ZO7N/JI3WL4xkFOgTxg7UzdA9eu7dzo3FtxPEQK+KpyJbDmpt1fxc1ZBt+D2nldKm9hUCrGliGAK6KzQ7lNSgja5aXZzpbrL4GeIos/6O7m7M9b98f6i/KSufRP4ACT37wlxnK3mrYR3nCMe3uiXlCH2hq0LQlXN+i1XsiPFwclU7d2mGACfk+symkuYaQzRL83JN8DapcgFYqFJtpfcAP08gQECV9UwK+tzP3hv0W2r206xdflWeuj5uzKO4Q01m6da/YpkVgFaWwnbzUAygSaPV6/CzH2piHndWV3amDBn0uXak2Eaxk1wbFGGdgEMg5i1MqKscsL2Xp2aySA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=etbCC2Fn; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=michal.swiatkowski@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=etbCC2Fn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=michal.swiatkowski@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdVQC2pvWz2ydv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 17:48:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744876131; x=1776412131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AJDZ7g9e7QmBIngwpIsFAzOeQfTEjm5Sb3aXttAvypM=;
  b=etbCC2FnKLkKtbCI6Dkuvxbh6iwngJNWhYVnH974UGMFDVcgf5o2wc/4
   6E/NbEwhoOcrwIf4TBOM6wnqa1KAtlZmhcmzT0MC5B7sytE7X5EHljTnB
   c/KDXzAoJxP1uxggGOW1XHM0L3hOIEAQZfaM9yvzaQBHqHOodezG0BX6s
   hoT2SkAyH8QsN91TavE5DEuhKeUsvTvGl1Otqf8NW/pLJ91WssQ3XLZua
   I1iwWAAKVljWy8bXq+o/Kk4P5zhPElW3FQYDDD6arD8GYtpZz1ynbTukh
   KhwovLm91pJmdGGEZXV7Uv2ATz7ktM6nna7pDRMSbajYOVlKrRq6tFZxR
   A==;
X-CSE-ConnectionGUID: mUDckHkvQtm6R9lyv4FQsg==
X-CSE-MsgGUID: bGKjAy1qTA+iRSks58YVrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="34066279"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="34066279"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:48:48 -0700
X-CSE-ConnectionGUID: Ulxf/l1DTvKPfFBNMUKtMw==
X-CSE-MsgGUID: ojzmiwjyT1abjQjC4jZfTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131054723"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:48:47 -0700
Date: Thu, 17 Apr 2025 09:48:28 +0200
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: netdev@vger.kernel.org, michal.swiatkowski@linux.intel.com,
	horms@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 2/3] net: ibmveth: Reset the adapter when
 unexpected states are detected
Message-ID: <aACyTHFwKonUwLv+@mev-dev.igk.intel.com>
References: <20250416205751.66365-1-davemarq@linux.ibm.com>
 <20250416205751.66365-3-davemarq@linux.ibm.com>
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
In-Reply-To: <20250416205751.66365-3-davemarq@linux.ibm.com>
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 03:57:50PM -0500, Dave Marquardt wrote:
> Reset the adapter through new function ibmveth_reset, called in
> WARN_ON situations. Removed conflicting and unneeded forward
> declaration.
> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> ---
>  drivers/net/ethernet/ibm/ibmveth.c | 116 ++++++++++++++++++++++++-----
>  drivers/net/ethernet/ibm/ibmveth.h |   1 +
>  2 files changed, 98 insertions(+), 19 deletions(-)
> 

Thanks for addressing comments
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

