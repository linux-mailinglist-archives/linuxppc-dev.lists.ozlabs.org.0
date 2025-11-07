Return-Path: <linuxppc-dev+bounces-13907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1E3C3DF45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 01:12:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2fdz3SRRz3bf2;
	Fri,  7 Nov 2025 11:12:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762474375;
	cv=none; b=WwOuZxo4wHlpm6cA89ceDJPXMr3wWXFjcOSESkAB9RTsescYJvDz+C86gVJ8EBYYgMk1lxh5Q+FpSvqtRWYwVcnmmGYzvz2CxFXYs7gWzzFgaLM+KNJa1OLn7Bo3wyP4X9mjEjhMEtPjiSvYFRrhDgKxRq56HaV6uI1wd6jKOFSNVCj2GkgWN0hWfpXSeqc7AbudWQHn9YCArZEws0Zmc3Df5XTs84C3YJcurt2ZL7Sxj5pe/UsHZa77JpsRK0/9gcVfpxCSyn4piPfZTnM++MNlH2fJedCNq038WnIujcmRC2ZNyGz5oy6Ke2djOWE3IQeIF7kunV0tcYU9xFfXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762474375; c=relaxed/relaxed;
	bh=FO2YeDdLThGKX3T8+BGIBpNFIBVY5RgAYAnyL2k8ztM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PIxLFGL0ihn2Q1hcxdfvQ/UWkDqO1Uc+0mYIfNmTE4Kh6Vm/9RTvkMAQHrb1BGnZ8EAQS+BVgwcPrX7u9h/tSRgvZ88dB2heuxE43J41RO29LDsjLWYDYIhURR4FXYk4KKYQ0Mtgg1LirEzTjYidphb5L7YzugFzJrW4V1mI2/BopsN2OwZaorVWNiTgJZ6i/9mAPVJuy0wQQvenjzYxOqgCLrnWnVspIF4OnuDJsxa/Voh3b6M8ibnLOwAQQzASFizggBpa9lzsdyNemnq1FQQkwR45mXPVCKv88GeEa8/3lkzUHQjcc+/6kAumCaQtPjnnOnMLMBF4vrI3j8xZuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=arLi1sXK; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=arLi1sXK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2fdy4Gxkz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 11:12:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55511601A7;
	Fri,  7 Nov 2025 00:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0F1C4CEFB;
	Fri,  7 Nov 2025 00:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762474371;
	bh=zVxtIiQXF/h3lLGX+vTX4ScikwyurKS7hUPFV5evgT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=arLi1sXKCOwj5bu+tukL49Vo2iKLJWUsqpLupqoRVBsB+qXse1CVN9RDSb3fOdmz0
	 QWq+nqXxO6RDUAYD5duqY3eDg4gHTyBzD/i68NgZ2QkpJ6ydS9Bb2FQzOQpPKWj6vz
	 bXYRTGV9r6zODcS1pIFaOYL4UGDie/fNdCt2WEedrIO50EsyjA+nOsrXtKoZub5BKl
	 jDZCQ8MH3S60cl138FURAdotszxxo8Q2T6iL0D/iOje6ZfuODWgWtANGpLjPjKU9Fp
	 h9YpZQQKVGWFV0rRMe/n3+geqebX703u7a4gtQFv7Zu+9PjvF4cnGRAKvTPfzEwtq+
	 q8rhLXwIRWrPA==
Date: Thu, 6 Nov 2025 18:12:49 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org, sparclinux@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org, regressions@leemhuis.info
Subject: Re: [PATCH 02/24] sparc/PCI: Remove pcibios_enable_device() as they
 do nothing extra
Message-ID: <20251107001249.GA1977735@bhelgaas>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fcc0fd4b74f99d5c4d80d3907e7607a7d4c89da.camel@physik.fu-berlin.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 08:49:50AM +0100, John Paul Adrian Glaubitz wrote:
> On Fri, 2025-08-22 at 17:55 +0300, Ilpo Järvinen wrote:
> > Under arch/sparc/ there are multiple copies of pcibios_enable_device()
> > but none of those seem to do anything extra beyond what
> > pci_enable_resources() is supposed to do. These functions could lead to
> > inconsistencies in behavior, especially now as pci_enable_resources()
> > and the bridge window resource flags behavior are going to be altered
> > by upcoming changes.

> This change actually broke driver initialization on SPARC, see:
> 
> https://github.com/sparclinux/issues/issues/22

#regzbot report: https://github.com/sparclinux/issues/issues/22
#regzbot introduced: 754babaaf333
#regzbot title: v6.18-rc3 fails to initialise mpt3sas on sparc T5-2

754babaaf333 ("sparc/PCI: Remove pcibios_enable_device() as they do nothing extra")

