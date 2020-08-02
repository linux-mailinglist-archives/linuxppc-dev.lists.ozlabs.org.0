Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0FE235749
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:59:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKN191yL0zDqFp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:59:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMT56nw1zDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:35:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMT50kM8z9sTd; Sun,  2 Aug 2020 23:35:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20190627053044.9238-1-nathanl@linux.ibm.com>
References: <20190627053044.9238-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH 0/2] migration/prrn instrumentation tweaks
Message-Id: <159637523991.42190.10835835540209153604.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:35:04 +1000 (AEST)
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

On Thu, 27 Jun 2019 00:30:42 -0500, Nathan Lynch wrote:
> Mainly this produces better information about what's happening with
> the device tree as a result of LPM or PRRN.
> 
> Nathan Lynch (2):
>   powerpc/pseries/mobility: set pr_fmt
>   powerpc/pseries/mobility: add pr_debug for device tree changes
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/pseries/mobility: Set pr_fmt()
      https://git.kernel.org/powerpc/c/494a66f34e00b6a1897b5a1ab150a19265696b17
[2/2] powerpc/pseries/mobility: Add pr_debug() for device tree changes
      https://git.kernel.org/powerpc/c/5d8b1f9dea17b4bf5e5f088f39eeab32c7e487be

cheers
