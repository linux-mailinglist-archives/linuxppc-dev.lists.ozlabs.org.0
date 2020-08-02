Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E702235754
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 16:03:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKN6C1vFpzDqQT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 00:03:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMT70KNlzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:35:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMT56fKmz9sSG; Sun,  2 Aug 2020 23:35:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20190627051537.7298-1-nathanl@linux.ibm.com>
References: <20190627051537.7298-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH 0/4] cacheinfo instrumentation tweaks
Message-Id: <159637523917.42190.6803530597213353039.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:35:05 +1000 (AEST)
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

On Thu, 27 Jun 2019 00:15:33 -0500, Nathan Lynch wrote:
> A few changes that would have aided debugging this code's interactions
> with partition migration, maybe they'll help with the next thing
> (hibernation?).
> 
> Nathan Lynch (4):
>   powerpc/cacheinfo: set pr_fmt
>   powerpc/cacheinfo: name@unit instead of full DT path in debug messages
>   powerpc/cacheinfo: improve diagnostics about malformed cache lists
>   powerpc/cacheinfo: warn if cache object chain becomes unordered
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/cacheinfo: Set pr_fmt()
      https://git.kernel.org/powerpc/c/e2b3c165f27a6bdb197b0dc86683ed36f61c5527
[2/4] powerpc/cacheinfo: Use name@unit instead of full DT path in debug messages
      https://git.kernel.org/powerpc/c/be6f885e97e9304541057fbf25148685847ef310
[3/4] powerpc/cacheinfo: Improve diagnostics about malformed cache lists
      https://git.kernel.org/powerpc/c/1b3da8ffaa158e9a95c19b17c14d7259d58bc0cd
[4/4] powerpc/cacheinfo: Warn if cache object chain becomes unordered
      https://git.kernel.org/powerpc/c/6ec54363f198aae9c1343f82ff5b865546944a73

cheers
