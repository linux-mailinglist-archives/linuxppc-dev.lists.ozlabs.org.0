Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7AC0DC8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 00:02:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g5PX2Z2yzDr1d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 08:02:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="iL1pA+i7"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g5L501vJzDr0x
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 07:59:24 +1000 (AEST)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50D172082F;
 Fri, 27 Sep 2019 21:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569621561;
 bh=vjYWy4L7Eyb3/PmemD47fPDcJCVBojbdz7DDNpbWr7A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=iL1pA+i7CQJ35abdfV61IEEyNrKcYqudsqFZUhXcGeRPfS5DBbUipjFRPmMA+V8sr
 1pFjQasqXBzQwEhBg6QOjY6cQ+Ae7GUT1jkqoam1XfrlKBWRNajwGykgQpAWHRahoM
 ahQYevtEbds+x6g+lGjKSFVeRgM1DgXbXFflWNUY=
Date: Fri, 27 Sep 2019 16:59:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Subject: Re: [PATCH v5 01/23] PCI: Fix race condition in
 pci_enable/disable_device()
Message-ID: <20190927215919.GA54330@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816165101.911-2-s.miroshnichenko@yadro.com>
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
Cc: Marta Rybczynska <mrybczyn@kalray.eu>, linux-pci@vger.kernel.org,
 Srinath Mannam <srinath.mannam@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 16, 2019 at 07:50:39PM +0300, Sergey Miroshnichenko wrote:
> This is a yet another approach to fix an old [1-2] concurrency issue, when:
>  - two or more devices are being hot-added into a bridge which was
>    initially empty;
>  - a bridge with two or more devices is being hot-added;
>  - during boot, if BIOS/bootloader/firmware doesn't pre-enable bridges.
> 
> The problem is that a bridge is reported as enabled before the MEM/IO bits
> are actually written to the PCI_COMMAND register, so another driver thread
> starts memory requests through the not-yet-enabled bridge:
> 
>  CPU0                                        CPU1
> 
>  pci_enable_device_mem()                     pci_enable_device_mem()
>    pci_enable_bridge()                         pci_enable_bridge()
>      pci_is_enabled()
>        return false;
>      atomic_inc_return(enable_cnt)
>      Start actual enabling the bridge
>      ...                                         pci_is_enabled()
>      ...                                           return true;
>      ...                                     Start memory requests <-- FAIL
>      ...
>      Set the PCI_COMMAND_MEMORY bit <-- Must wait for this
> 
> Protect the pci_enable/disable_device() and pci_enable_bridge(), which is
> similar to the previous solution from commit 40f11adc7cd9 ("PCI: Avoid race
> while enabling upstream bridges"), but adding a per-device mutexes and
> preventing the dev->enable_cnt from from incrementing early.

This isn't directly related to the movable BARs functionality; is it
here because you see the problem more frequently when moving BARs?
