Return-Path: <linuxppc-dev+bounces-11414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDF2B396C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 10:21:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCDr66Txcz2yGx;
	Thu, 28 Aug 2025 18:21:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756369270;
	cv=none; b=mZ5zV0D1sFK4hfbQvLg0srPh0c/VhC7NxFxJu3QFQtLz8kSwv4WxHm+gEXggLXWHhO2x3gYxUHy4/kcyPV0EqYlHafmaUetTr1V1/k7n1GURm1JBoNxcWAlZGMjHKNxPFK7OH/ZNnHYSkUQ6gbhx+DWEkGtq8YBLG61C5VrzUi0OOH29T1Xfx39rwnWg5uzEBXg6xR5Iz98S7jWXUxUEpJ9EszPJucs/kcFJG+Yj1LzBO7rRc7tfXvPKsj1yw8Z9xyXY3g4mlsWrUVQQbDfq3ySXLVC2XccJ72Xt86q8nCKAiFrt8bU0+3u7G0gkzoNYXl96odHfNo6mU3Z5aCny/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756369270; c=relaxed/relaxed;
	bh=cVO9XoyfsV4Hh0cmwo3HIYjphpMP51iRhEJkXNqV+bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbgCkIV4CcLv6TeFphChzkhzdI25PH7Lid8faN+VBBtZiJwlZBy2NhvKdw/hK1+dTpLV5kUEXKz0VOapoyfG6Vnnfubn/cR5fx4UO2a94i0N70ksdzry1irRKS4k9iyocu4ErQ8mqK44+SA+SoaM5RHiKStDUjsXis86s2eJGTqYwluc7YLWTGvA40Hcvihw7I08c9tQQXbsBvdqJR+E8XLwHIJrICpuUTYaKG5ntZpbkDMSJCTkEOsvpS8Z/y5/rFAt3BwvCn027waqN+wAbLBlSNbF1Jg5JJDKlvkNQFur1DMUSZKeXI0uEZRIxqADiQx95BkJaSQHgh/1Bw5LnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass (client-ip=193.175.24.41; helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de; receiver=lists.ozlabs.org) smtp.mailfrom=alpha.franken.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alpha.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 2549 seconds by postgrey-1.37 at boromir; Thu, 28 Aug 2025 18:21:09 AEST
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCDr52f0hz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 18:21:09 +1000 (AEST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urXDA-0001jz-00; Thu, 28 Aug 2025 09:38:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 09775C04FD; Thu, 28 Aug 2025 08:57:33 +0200 (CEST)
Date: Thu, 28 Aug 2025 08:57:33 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org, sparclinux@vger.kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/24] MIPS: PCI: Use pci_enable_resources()
Message-ID: <aK_93U_PnpKayqZD@alpha.franken.de>
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
 <20250822145605.18172-4-ilpo.jarvinen@linux.intel.com>
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
In-Reply-To: <20250822145605.18172-4-ilpo.jarvinen@linux.intel.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 22, 2025 at 05:55:44PM +0300, Ilpo Järvinen wrote:
> pci-legacy.c under MIPS has a copy of pci_enable_resources() named as
> pcibios_enable_resources(). Having own copy of same functionality could
> lead to inconsistencies in behavior, especially now as
> pci_enable_resources() and the bridge window resource flags behavior
> are going to be altered by upcoming changes.
> 
> The check for !r->start && r->end is already covered by the more
> generic checks done in pci_enable_resources().
> 
> Call pci_enable_resources() from MIPS's pcibios_enable_device() and
> remove pcibios_enable_resources().
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/mips/pci/pci-legacy.c | 38 ++------------------------------------
>  1 file changed, 2 insertions(+), 36 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

