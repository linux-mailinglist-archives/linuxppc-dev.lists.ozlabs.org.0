Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 515A325C11B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 14:36:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj0g52rGdzDr0l
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 22:36:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj0Sv3Hl9zDqvd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 22:27:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4Bj0Sr2Jkwz9sTS; Thu,  3 Sep 2020 22:27:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Bj0Sq6b6Sz9sTM; Thu,  3 Sep 2020 22:27:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200901124653.523182-1-mpe@ellerman.id.au>
References: <20200901124653.523182-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Skip PROT_SAO test in guests/LPARS
Message-Id: <159913602428.7198.2228774336078806098.b4-ty@ellerman.id.au>
Date: Thu,  3 Sep 2020 22:27:55 +1000 (AEST)
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

On Tue, 1 Sep 2020 22:46:53 +1000, Michael Ellerman wrote:
> In commit 9b725a90a8f1 ("powerpc/64s: Disallow PROT_SAO in LPARs by
> default") PROT_SAO was disabled in guests/LPARs by default. So skip
> the test if we are running in a guest to avoid a spurious failure.

Applied to powerpc/fixes.

[1/1] selftests/powerpc: Skip PROT_SAO test in guests/LPARS
      https://git.kernel.org/powerpc/c/fc1f178cdb31783ff37296ecae817a1045a1a513

cheers
