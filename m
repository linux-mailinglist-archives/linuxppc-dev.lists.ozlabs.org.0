Return-Path: <linuxppc-dev+bounces-9292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08311AD59E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 17:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHTfb2cCXz2yMt;
	Thu, 12 Jun 2025 01:12:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749654743;
	cv=none; b=DKyfqln5FMjoDuJ4iGgWNvXs8chkLBClTg1sL91uK8pEiEY7eJ1TY3j/aco5yAqZXAANFSkWsVFu93XifEJ/m4MDeh4ZXz70JD7R42YuspEFArIY5p2qD8uZ+ohBTiQTmbp9tXpIBAS+/YM78kfpXrcpdFtlAjKaRfLF7/gKsHcgY6FRP8h/ywspKFD4tkcloT5/RCSO+I8gILeRnhWceFXxU9r1FcHUk+CocRDX+D2gY/qE+WXtGmjs/PWHdh9nnaJnFEQblBoTvBC9NkKf4RxpQ+CYZGK9aVjmpcyZ38U/B58YMVyU8niX34zvJpxPyPmyI0/j7pvKG5tlTsKUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749654743; c=relaxed/relaxed;
	bh=dt8Ksd3h2FYmayz03UsrnSwEDKb105FJ+JFrE2T+WrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIY7LpDqFcGr4+XHIX3XycBaUCxgTJXr+kEReEkOqXOU9azi6qTpi7r0xPdAMqUY4oRuFRVXy4D1Tv0TLRck2VKb80MnHqWNRpikP7qihL1DLFDbFjk+Ky0OcZzGs3Vis+B8J4chCS1wO4TBxQWeLvgrEwOl381AXhmZuKtJWc8awedFcEt+KIOUy6CBCoK16191Ui7qO/RRHSNfHUREyuGalBxCkcKoVeUvYGCQDD1xKDXlKyBjaUfGAUh2Aq9B6dk9UCcKQ0mpb/LXfmFZ3+BBdA6PkIdoykoDZ1CMqr0/V2sFzEoDldyHyoYtHiwjiaQ9rPQbOoJgaU1uGP8czQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iZ0Kxd4R; dkim-atps=neutral; spf=none (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iZ0Kxd4R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHTfX6Dfmz2y82
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 01:12:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749654742; x=1781190742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w50J13DoDa3ztdz0aJJJjIaFHSClneyL/iYpIIag/qs=;
  b=iZ0Kxd4RslYmH/DQxqGzaC2O/BxL2qOn+8pKCoF1DS08g0Y/SGszUURG
   e4PjJZ0F22SIbp/31bYR8OqEG+hDll2bBHLl2pVjVZ+s9fQVGI1F357oX
   9XP+3/rgzQmk4TWFYZrHJ9vGK1C33x7ywGgSAk8g499Orn43iCEm1xdLL
   7XXxavi+6Wk5VQ8poIGhOK0vXvt3eta6cZWqO11riBQ/gqio0V6zcy0sk
   EaYDM+7c3Y0r9nVLaqfaCnw4aJxcSDENdNiReL3G6jBXOM9g01+XR8ZkZ
   KlLF0ui5pOUK5Jw8aIzDKWkEfcchhVP2qTVRcW5eJYhDXxDlKgEBW2Hik
   Q==;
X-CSE-ConnectionGUID: Q9LHsS+PT5iss+oDFxtCug==
X-CSE-MsgGUID: DSb2znf5Soqspv8GgpNTVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62083557"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="62083557"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:12:16 -0700
X-CSE-ConnectionGUID: y29W/3r0RkKpTtbZaK2+RQ==
X-CSE-MsgGUID: h+7CkrccS1exPpWmkCy9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="184427637"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:12:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPN7X-00000005gGG-2dL9;
	Wed, 11 Jun 2025 18:12:07 +0300
Date: Wed, 11 Jun 2025 18:12:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/33] serial: 8250: sanitize
 uart_port::serial_{in,out}() types
Message-ID: <aEmcxySiXun--YZs@smile.fi.intel.com>
References: <20250611100319.186924-1-jirislaby@kernel.org>
 <20250611100319.186924-9-jirislaby@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611100319.186924-9-jirislaby@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 11, 2025 at 12:02:54PM +0200, Jiri Slaby (SUSE) wrote:
> uart_port::{serial_in,serial_out} (and plat_serial8250_port::* likewise)
> historically use:
> * 'unsigned int' for 32-bit register values in reads and writes, and
> * 'int' for offsets.
> 
> Make them sane such that:
> * 'u32' is used for register values, and
> * 'unsigned int' is used for offsets.
> 
> While at it, name hooks' parameters, so it is clear what is what.

At a glance this looks just mechanical change. Have you used coccinelle for
that?

As for the whole idea, I like it,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

...

> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>

These also can be moved under '---' :-)

> ---
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---

-- 
With Best Regards,
Andy Shevchenko



