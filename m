Return-Path: <linuxppc-dev+bounces-11438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E63B3A821
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 19:31:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCT3b2zRpz2yg0;
	Fri, 29 Aug 2025 03:31:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756402315;
	cv=none; b=d6tG30d9bzc2WlgeUdWjQcYlfBG8QC1NvrdO+siUhkOVo+571ESP2mlBL1/sBs4/9FQKS59wrPbENN8QEwRkW2DpSoCnI2iWtO3BbW9nhM3NU8DK63SS/TNhJ3iDxVeeU5rQVDNBGHtwQu1N2Mq54rAz00QdbUGCr5SSzeWsttav3kZX0l6iQjnUbh8DecS30rENJ4keQt5zl9uNKPtS+iNvT+gu0YnsyNACi+Cdl9APHQE7dTog7cgmLmfebueWTh+rkMl2Uxx2vN7A0I18pda1qMztMg/+0EeYRobgnwgvmKb04mszwXM9g+8PfZDVXCTCjBQX07HyuU0xyglSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756402315; c=relaxed/relaxed;
	bh=/E4qnYzH0Zw8AYDJAn3DL5jYlchZbgLvLdTiQUTrbqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ANo+R22IVvpDM4eMlSmSncSOegAubI2K/rgQfVhafB9MTLHNCEr5vCL/UjhJHaf+pn2j0ldUKR/CoRW+4UmG78hSg13IvWaWtZF5Shw00TtYEHm/ZMyann6j8fun6pGIbv1xyLkxRjIJIA8m5asG/re/cqtbIKvwImr4xakzI08FLsuLjDf6e2kKQjq1poGYo8MplJL4mW4WsBZCaENHDpEkUHNvfbMvypMSxqyNPgeTueGK3y+eJhcabmVULAwIgxC0GoML84VKlxS1R5gTxaE8cXEWIr3/7Y9UcWCidFtlFIRqehoO3iZxJ/3Bam6yGsS6L0XOH8jvZBToBddpew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nm8QlKSU; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nm8QlKSU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCT3Z4vZKz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 03:31:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE08840BC1;
	Thu, 28 Aug 2025 17:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAD3C4CEEB;
	Thu, 28 Aug 2025 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756402312;
	bh=vl9K/umacKTfK8n27M0KwHBfAPbKCprrGgu7yc+VISM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Nm8QlKSUyPe3Gf+UCV04JeGw8KneAP2RaHR1A4YbseNmdkgRMIY3thPtQ/OAYQiqm
	 rp3ocwBxMk/z+rHqd3B3InJvp1jblMILJ8F44Ut8sekeJqhuMCpm+VVbun3jgnT//q
	 q0lW/PAxNv/v+VJ6n0eT+l5UxBBHcIAWlsXm/8Q5IroJBUY9QpO12Xnvn9FXHPslGE
	 sHC5eDUO0UKs2FOZh0vS5hlguumDWK8S8lyFXrZ9svJWpBcdmUBMxo7iH7EljoSAk4
	 QTHLNxoCXsQjUo/wNZpIa9zzlYtq6gjBnxsDClXPPdwPYrbU2icH59w927cENgcDjw
	 K4izz/zKsSrjw==
Date: Thu, 28 Aug 2025 12:31:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Andreas Larsson <andreas@gaisler.com>,
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
	LKML <linux-kernel@vger.kernel.org>,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/24] PCI: Bridge window selection improvements
Message-ID: <20250828173151.GA950809@bhelgaas>
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
In-Reply-To: <d209c08a-56df-5aac-869d-7c6c548c0614@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025 at 07:47:06PM +0300, Ilpo Järvinen wrote:
> On Wed, 27 Aug 2025, Bjorn Helgaas wrote:
> > On Fri, Aug 22, 2025 at 05:55:41PM +0300, Ilpo Järvinen wrote:
> > > This series is based on top of the three resource fitting and
> > > assignment algorithm fixes (v3).
> > > 
> > > PCI resource fitting and assignment code needs to find the bridge
> > > window a resource belongs to in multiple places, yet, no common
> > > function for that exists. Thus, each site has its own version of
> > > the decision, each with their own corner cases, misbehaviors, and
> > > some resulting in complex interfaces between internal functions.
> > > ...

> I'll need to do minor corrections into a few intermediate patches though 
> to ensure bisectability, we really want to make this as bisectable as 
> possible. In other words, I've found 2 relatively small issues in them 
> which won't change the end result when the whole series is complete and 
> fixed some small grammar errors in the changelogs.
> 
> I see you made some corrections so I'm not sure what's the best course of 
> action here to update them. Should I just send v2 normally and you deal 
> with your changes while replacing v1 with v2?

That would work for me.  Or if you picked the patches from
pci/resource and posted a v2 based on them, that would be even easier
for me.

