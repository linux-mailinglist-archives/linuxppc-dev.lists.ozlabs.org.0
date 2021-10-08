Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C555427380
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 00:13:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HR2X81kQJz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 09:13:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NfOQ1Byd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NfOQ1Byd; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HR2WX6K1Lz2xXh
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 09:13:12 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8320760FC1;
 Fri,  8 Oct 2021 22:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633731189;
 bh=wNgDKDIIK358RGjNmCHeTM6eGu9i1NUq2a4Cx1Zn5ec=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=NfOQ1BydTGGErjNKi2rvvo23VwEfRECB5hinU3fTD/YWGT9/wIoxtnDy0UMOb9F4Z
 Tzo85ZiIClqd9Br3sFdFgZc04avS7YFvKqBTXL1DiIl4OuLjBm9qY2WvQp8l+8T0B5
 AthcCY3b9E2A3C/eMVa0xojj/6onvABaY40UGivKWe/p1obD6p8Y4Bun00Fgp1s8zp
 RGlUjv6rmc5Hni8/2Ju6cxQJcUjT0b7O9dwy0Z94iGg1CuBBYqPTMaPsBt0GNoUzlI
 HXbK/hR3Bd6/t9zuyP1NSYD6n8jVOsNG5w7uN4sQ0R/gVLZtxJfARJL0iO21pHUVd9
 vv+eJeOuhHiyg==
Date: Fri, 8 Oct 2021 17:13:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [PATCH v3] PCI: Move pci_dev_is/assign_added() to pci.h
Message-ID: <20211008221308.GA1383868@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720150145.640727-1-schnelle@linux.ibm.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 20, 2021 at 05:01:45PM +0200, Niklas Schnelle wrote:
> The helper function pci_dev_is_added() from drivers/pci/pci.h is used in
> PCI arch code of both s390 and powerpc leading to awkward relative
> includes. Move it to the global include/linux/pci.h and get rid of these
> includes just for that one function.
> 
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
> Since v1 (and bad v2):
> - Fixed accidental removal of PCI_DPC_RECOVERED, PCI_DPC_RECOVERING
>   defines and also move these to include/linux/pci.h
> 
>  arch/powerpc/platforms/powernv/pci-sriov.c |  3 ---
>  arch/powerpc/platforms/pseries/setup.c     |  1 -
>  arch/s390/pci/pci_sysfs.c                  |  2 --
>  drivers/pci/hotplug/acpiphp_glue.c         |  1 -
>  drivers/pci/pci.h                          | 15 ---------------
>  include/linux/pci.h                        | 15 +++++++++++++++
>  6 files changed, 15 insertions(+), 22 deletions(-)

I dropped this one because I think a subsequent patch removed the use
in arch/powerpc, so if you still need this, it probably needs to be
updated to at least drop those hunks.
