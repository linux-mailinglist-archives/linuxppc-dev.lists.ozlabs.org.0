Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3FD14C5D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 06:26:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486sRX1mMpzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:26:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDf5871zDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDf2z6sz9s1x; Wed, 29 Jan 2020 16:17:22 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 4e0942c0302b5ad76b228b1a7b8c09f658a1d58a
In-Reply-To: <20191016012536.22588-1-oohall@gmail.com>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/eeh: Only dump stack once if an MMIO loop is
 detected
Message-Id: <486sDf2z6sz9s1x@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:22 +1100 (AEDT)
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-10-16 at 01:25:36 UTC, Oliver O'Halloran wrote:
> Many drivers don't check for errors when they get a 0xFFs response from an
> MMIO load. As a result after an EEH event occurs a driver can get stuck in
> a polling loop unless it some kind of internal timeout logic.
> 
> Currently EEH tries to detect and report stuck drivers by dumping a stack
> trace after eeh_dev_check_failure() is called EEH_MAX_FAILS times on an
> already frozen PE. The value of EEH_MAX_FAILS was chosen so that a dump
> would occur every few seconds if the driver was spinning in a loop. This
> results in a lot of spurious stack traces in the kernel log.
> 
> Fix this by limiting it to printing one stack trace for each PE freeze. If
> the driver is truely stuck the kernel's hung task detector is better suited
> to reporting the probelm anyway.
> 
> Cc: Sam Bobroff <sbobroff@linux.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/4e0942c0302b5ad76b228b1a7b8c09f658a1d58a

cheers
