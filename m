Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97CF93F2AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 12:29:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iHlEl7xp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXZNl4qMQz3cVR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 20:29:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iHlEl7xp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Mon, 29 Jul 2024 20:29:04 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXZN03Wfzz3cH2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 20:29:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722248945; x=1753784945;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Bt99ge3UUZGPkVxOwjK0CeLHXnSXdbcs1gevqufOntg=;
  b=iHlEl7xp6d6AQSadv4hf0vTpQOaP6rEHMsfPT+S7gISpZuGDfj7dCOJZ
   Qjc/FCibSoFlibpKOVF+33KjXFoYjB0KNLa2ntXVen3Yi1l/jQ5tv8Xwk
   cheplT5paKbF5uzOIDhh5n1IymkUM2tUw/Gz/QKQ+1EBEWiVeBVuN+ZKT
   GyWWYwi/ZtxCIVDNEMj0ybYfsycQ//CWFKxCND39u2wLrpyKU+11R7HwX
   A5p6J5l8gtzrNEap8ITCFiuL93Z1dUiC9N5wW8eotsDFljuFGgxqqEgDo
   l80wMee8e9sW8+IBE/6Y2EmJSFp9lnlAd0bymlwM7Knu+msX3GueMTyt8
   Q==;
X-CSE-ConnectionGUID: 7fRkh4zKRCekZjbZIAQ4Nw==
X-CSE-MsgGUID: j20KJuDyR6Cob1J3kiuy1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="37502574"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="37502574"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 03:27:57 -0700
X-CSE-ConnectionGUID: Ynsp7EQmRje2W4uZXxa9yQ==
X-CSE-MsgGUID: ZV+fiUwNQXmPYSqHZqNgKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="77171478"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.151])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 03:27:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jul 2024 13:27:44 +0300 (EEST)
To: Matthew W Carlis <mattc@purestorage.com>
Subject: Re: PCI: Work around PCIe link training failures
In-Reply-To: <20240726080446.12375-1-mattc@purestorage.com>
Message-ID: <914b7d34-9ed5-cd99-cb76-f6f8eccb842e@linux.intel.com>
References: <20240724191830.4807-1-mattc@purestorage.com> <20240726080446.12375-1-mattc@purestorage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, christophe.leroy@csgroup.eu, kuba@kernel.org, pabeni@redhat.com, wilson@tuliptree.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, alex.williamson@redhat.com, bhelgaas@google.com, Mika Westerberg <mika.westerberg@linux.intel.com>, david.abdurachmanov@gmail.com, Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, saeedm@nvidia.com, pali@kernel.org, davem@davemloft.net, macro@orcam.me.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 26 Jul 2024, Matthew W Carlis wrote:

> On Mon, 22 Jul 2024, Maciej W. Rozycki wrote:
> 
> > The main reason is it is believed that it is the downstream device
> > causing the issue, and obviously you can't fetch its ID if you can't
> > negotiate link so as to talk to it in the first place.
> 
> Have had some more time to look into this issue. So, I think the problem
> with this change is that it is quite strict in its assumptions about what
> it means when a device fails to train, but in an environment where hot-plug
> is exercised frequently you are essentially bound have something interrupt
> the link training. In the first case where we caught this problem our test
> automation was doing some power cycle tortures on our endpoints. If you catch
> the right timing the link will be forced down to Gen1 forever without some other
> automation to recover you unless your device is the one single device in the
> allowlist which had the hardware bug in the first place.
> 
> I wonder if we can come up with some kind of alternative.

The most obvious solution is to not leave the speed at Gen1 on failure in 
Target Speed quirk but to restore the original Target Speed value. The 
downside with that is if the current retraining interface (function) is 
used, it adds delay. But the retraining functions could be reworked such 
that the retraining is only triggered in case the Target Speed quirk 
fails but we don't wait for its result (which will very likely fail 
anyway).

-- 
 i.

