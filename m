Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EB8F8095
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 20:52:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BhNQ6Hr1zF4Q5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 06:52:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="1Ab8iCkY"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BhKS46yGzF3g0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 06:49:32 +1100 (AEDT)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B554721655;
 Mon, 11 Nov 2019 19:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573501770;
 bh=REocQpHcUoTtJ9Lh+xQEQRDVLTZtYKJWSj4dAiNX3xw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=1Ab8iCkYnJf94nsOy/Munq6j823ReviIIS9wpR9XftMxl0XEEZHDVPRA5OU0sziFW
 h0ibZehKnyrXCBwT7FSlzHq9TnttB4juz5tJYQjodv1jts1H4x3NX4ggTgSzTtUoce
 CHJk1Go1Mk+IuSJ2Zmp8NI5vOVIN5YKlCfLTX8ls=
Date: Mon, 11 Nov 2019 13:49:28 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH v2 0/9] Fixes and Enablement of ibm,drc-info property
Message-ID: <20191111194928.GA38342@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573449697-5448-1-git-send-email-tyreld@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: nathanl@linux.ibm.com, tlfalcon@linux.ibm.com, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 10, 2019 at 11:21:27PM -0600, Tyrel Datwyler wrote:
> There was a previous effort to add support for the PAPR
> architected ibm,drc-info property. This property provides a more
> memory compact representation of a parition's Dynamic Reconfig
> Connectors (DRC). These can otherwise be thought of as currently
> partitioned, or available but yet to be partitioned system resources
> such as cpus, memory, and physical/logical IOA devices.
> 
> The initial implementation proved buggy and was fully turned off by
> disabling the bit in the appropriate CAS support vector. We now have
> PowerVM firmware in the field that supports this new property, and
> further to support partitions with 24TB+ of possible memory this
> property is required to perform platform migration.
> 
> This series fixs the short comings of the previous submission
> in the areas of general implementation, cpu hotplug, and IOA hotplug.
> 
> v2 changelog:
> 	Cover Letter: fixed up spelling errors (mpe, tfalcon)
> 	Patch 3: added comment regarding indexing of drc values (tfalcon)
> 		 split drc-index and drc-info logic into multiple
> 		 functions for collecting cpu drc's for dlpar (mpe)
> 	Patch 7: fix up a couple more sparse warnings (mpe)
> 
> Tyrel Datwyler (9):
>   powerpc/pseries: Fix bad drc_index_start value parsing of drc-info
>     entry
>   powerpc/pseries: Fix drc-info mappings of logical cpus to drc-index
>   powerpc/pseries: Add cpu DLPAR support for drc-info property
>   PCI: rpaphp: Fix up pointer to first drc-info entry
>   PCI: rpaphp: Don't rely on firmware feature to imply drc-info support
>   PCI: rpaphp: Add drc-info support for hotplug slot registration
>   PCI: rpaphp: Annotate and correctly byte swap DRC properties
>   PCI: rpaphp: Correctly match ibm,my-drc-index to drc-name when using
>     drc-info
>   powerpc/pseries: Enable support for ibm,drc-info property
> 
>  arch/powerpc/kernel/prom_init.c                 |   2 +-
>  arch/powerpc/platforms/pseries/hotplug-cpu.c    | 127 +++++++++++++++++++++---
>  arch/powerpc/platforms/pseries/of_helpers.c     |   8 +-
>  arch/powerpc/platforms/pseries/pseries_energy.c |  23 ++---
>  drivers/pci/hotplug/rpaphp_core.c               | 127 +++++++++++++++++-------

For the drivers/pci/* parts:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

I assume they will be merged along with the rest of the series via
powerpc.

>  5 files changed, 216 insertions(+), 71 deletions(-)
> 
> -- 
> 2.7.4
> 
