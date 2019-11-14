Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 784F1FC2C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:38:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DGdV54pdzF7ZV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:38:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxm2DfPzF5JP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:07:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxh45YSz9sRd; Thu, 14 Nov 2019 20:07:52 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: de84ffc3ccbeec3678f95a3d898fc188efa0d9c5
In-Reply-To: <43817cb6e6631b0828b9a6e266f60d1f8ca8eb22.1571288375.git.sbobroff@linux.ibm.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/1] powerpc/eeh: differentiate duplicate detection message
Message-Id: <47DFxh45YSz9sRd@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:52 +1100 (AEDT)
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

On Thu, 2019-10-17 at 04:59:37 UTC, Sam Bobroff wrote:
> Currently when an EEH error is detected, the system log receives the
> same (or almost the same) message twice:
> 
> EEH: PHB#0 failure detected, location: N/A
> EEH: PHB#0 failure detected, location: N/A
> or
> EEH: eeh_dev_check_failure: Frozen PHB#0-PE#0 detected
> EEH: Frozen PHB#0-PE#0 detected
> 
> This looks like a bug, but in fact the messages are from different
> functions and mean slightly different things.  So keep both but change
> one of the messages slightly, so that it's clear they are different:
> 
> EEH: PHB#0 failure detected, location: N/A
> EEH: Recovering PHB#0, location: N/A
> or
> EEH: eeh_dev_check_failure: Frozen PHB#0-PE#0 detected
> EEH: Recovering PHB#0-PE#0
> 
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/de84ffc3ccbeec3678f95a3d898fc188efa0d9c5

cheers
