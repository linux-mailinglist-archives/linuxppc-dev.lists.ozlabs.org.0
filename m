Return-Path: <linuxppc-dev+bounces-11434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7368B3A6D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 18:47:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCS4D0VfTz2yMh;
	Fri, 29 Aug 2025 02:47:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756399644;
	cv=none; b=XCXduhYKh+5hhsY8Y+ZfSeEYUbyJ0RPanJ1ibSKhh4hAwN340FmvKBLkXSVUKkf7P2ylYWzLqA+vzFHvzoeKcINFSDBGhErXp31qEtINzVBC1g9MolHGb7Kkgz3Dt/hQMwuyn2ePyQA9LFs1TIgOK7+8X0YSmMAGsAet3IFzGDxEoyw9p6rei65EL5gtgWbq+wKjHyqtqfBBEfdnTdBQNO1LV8Rt6QsX6H8KGGM92kWKdte4f8wXD8NZS/clUaRRR/snpNICLuHE7CmuGIcB816jER7e6UAsSUIJiJOnLqbixnCoWIpFKkF8CcNSp/fnHnB3eLopP35fNu7EnsciUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756399644; c=relaxed/relaxed;
	bh=Co6mwgfTxETTV/bixevUayWr2EJj2ehXF1tpd2eC7gM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mtebKxDjOsh2wV/OShBKWQAsrPSI69/JBWUaJk1+OQQvp4HHtFkYNVmEEWAnoGtcIau88wf+y1XMHq94/ayRy3CkHg600Xav+0CmP7OUapPYzE9p7idHP6AdGAQ+EWY7OPqHqewvqG8yGtaxV9EVBv7x8HNuL3jUkpSK+1CCv7Qyyh5B132I6CeMUCFCQnc+50c7m2vRnlEaR8ZLv5jKkdpp2bO7fB82hg/TbNrAgFRncteVlwrqFjdP0MmhO1xUaDFibMQ3zw4puAXOua4227mSRBknxpyto6w35XmtJ3HQNi/9FXaxZKhXjuyyYIF1qjWmIeRUVCDS2jmNulTHpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P5x0pf6r; dkim-atps=neutral; spf=none (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P5x0pf6r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCS4958qqz2xnx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 02:47:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756399642; x=1787935642;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=aU91kSbFDXIVNuJ60vvVOrVduOxjp8fd95hLA1xmbMQ=;
  b=P5x0pf6rKH/0wx6EiynNXQJoXzA2XzOs4JU522S0nXlU+SwMv/f+/1pm
   nLsV8DBboQneAWBPbYYSg1G0BNG2tgmwjQ8g9RxB4RmTIA9fnc/fRIPrC
   5x346jU3urufsXi3kFmduqTj9ljPKHwnxQqxCLilJPLWhVFvGN3QCckal
   lWabRmxELytBnPgzzThlhyFei48Z8JPobjOv/TbswXE1EMtgusyc8IRPN
   wk4BGag4p7bZo88xOLFuRD3f0sgkbtufqr8R2nUdciYRowuC6ikAuhj3A
   B9dLSN0aGKwnLRc6kmsgcpVzl/3FySrdrU+0PZrdBRr2P62hGLTDNOlFS
   g==;
X-CSE-ConnectionGUID: 7lTr2gzJQHWsEEzh+CpvNQ==
X-CSE-MsgGUID: HYJ5vZu7TIGEfGPrTN1b6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58621140"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58621140"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:47:16 -0700
X-CSE-ConnectionGUID: SjrdaJHHQdK4rDEfENOp0g==
X-CSE-MsgGUID: vM+TeRjKRZ2iMMw4509i4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="207303211"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:47:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 Aug 2025 19:47:06 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Andreas Larsson <andreas@gaisler.com>, Bjorn Helgaas <bhelgaas@google.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-pci@vger.kernel.org, 
    sparclinux@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
    Yinghai Lu <yinghai@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    LKML <linux-kernel@vger.kernel.org>, 
    =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/24] PCI: Bridge window selection improvements
In-Reply-To: <20250827223606.GA915856@bhelgaas>
Message-ID: <d209c08a-56df-5aac-869d-7c6c548c0614@linux.intel.com>
References: <20250827223606.GA915856@bhelgaas>
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
Content-Type: multipart/mixed; BOUNDARY="8323328-231680363-1756381945=:938"
Content-ID: <11bc2533-54ae-273a-c46a-d271790c5a86@linux.intel.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-231680363-1756381945=:938
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <f90962a0-95ab-8e0a-58b9-2afe95683ba6@linux.intel.com>

On Wed, 27 Aug 2025, Bjorn Helgaas wrote:

> On Fri, Aug 22, 2025 at 05:55:41PM +0300, Ilpo J=E4rvinen wrote:
> > This series is based on top of the three resource fitting and
> > assignment algorithm fixes (v3).
> >=20
> > PCI resource fitting and assignment code needs to find the bridge
> > window a resource belongs to in multiple places, yet, no common
> > function for that exists. Thus, each site has its own version of
> > the decision, each with their own corner cases, misbehaviors, and
> > some resulting in complex interfaces between internal functions.
> > ...
>=20
> > I've tried to look out for any trouble that code under arch/ could
> > cause after the flags start to behave differently and therefore ended
> > up consolidating arch/ code to use pci_enable_resources(). My
> > impression is that strictly speaking only the MIPS code would break
> > similar to PCI core's copy of pci_enable_resources(), the others were
> > much more lax in checking so they'd likely keep working but
> > consolidation seemed still the best approach there as the enable checks
> > seemed diverging for no apparent reason.
> > ...
>=20
> >   m68k/PCI: Use pci_enable_resources() in pcibios_enable_device()
> >   sparc/PCI: Remove pcibios_enable_device() as they do nothing extra
> >   MIPS: PCI: Use pci_enable_resources()
> > ...
>=20
> >  arch/m68k/kernel/pcibios.c   |  39 +-
> >  arch/mips/pci/pci-legacy.c   |  38 +-
> >  arch/sparc/kernel/leon_pci.c |  27 --
> >  arch/sparc/kernel/pci.c      |  27 --
> >  arch/sparc/kernel/pcic.c     |  27 --
> > ...
>=20
> I love the fact that you're doing so much cleanup.  Thanks for all the
> work in this!
>
> Obviously all this code is quite sensitive, so I put it on
> pci/resource to get more exposure in -next.

Thanks. I really appreciate the opportunity to have it in next for extra=20
testing as my testing, while relatively extensive, still has its limits.

I'll need to do minor corrections into a few intermediate patches though=20
to ensure bisectability, we really want to make this as bisectable as=20
possible. In other words, I've found 2 relatively small issues in them=20
which won't change the end result when the whole series is complete and=20
fixed some small grammar errors in the changelogs.

I see you made some corrections so I'm not sure what's the best course of=
=20
action here to update them. Should I just send v2 normally and you deal=20
with your changes while replacing v1 with v2?

> If it turns out that we
> trip over things or just don't feel comfortable yet for v6.18, we can
> always defer this part until the next cycle.

I agree, and really please don't hesitate to postpone if it turns out=20
necessary.

> I will also watch for acks from the m68k, mips, and sparc maintainers
> for those pieces.
>=20
> Bjorn
>=20

--=20
 i.
--8323328-231680363-1756381945=:938--

