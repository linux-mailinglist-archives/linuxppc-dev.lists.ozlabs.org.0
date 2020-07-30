Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5335E23330A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:28:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHWSd3YpxzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:28:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVd204vlzDqxW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVd10Gfxz9sTK; Thu, 30 Jul 2020 22:50:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200727010127.23698-1-oohall@gmail.com>
References: <20200727010127.23698-1-oohall@gmail.com>
Subject: Re: [PATCH] selftests/powerpc: Squash spurious errors due to device
 removal
Message-Id: <159611327088.1601380.3781080553407767826.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:28 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Jul 2020 11:01:27 +1000, Oliver O'Halloran wrote:
> For drivers that don't have the error handling callbacks we implement
> recovery by removing the device and re-probing it. This causes the sysfs
> directory for the PCI device to be removed which causes the following
> spurious error to be printed when checking the PE state:
> 
> Breaking 0005:03:00.0...
> ./eeh-basic.sh: line 13: can't open /sys/bus/pci/devices/0005:03:00.0/eeh_pe_state: no such file
> 0005:03:00.0, waited 0/60
> 0005:03:00.0, waited 1/60
> 0005:03:00.0, waited 2/60
> 0005:03:00.0, waited 3/60
> 0005:03:00.0, waited 4/60
> 0005:03:00.0, waited 5/60
> 0005:03:00.0, waited 6/60
> 0005:03:00.0, waited 7/60
> 0005:03:00.0, Recovered after 8 seconds
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: Squash spurious errors due to device removal
      https://git.kernel.org/powerpc/c/5f8cf6475828b600ff6d000e580c961ac839cc61

cheers
