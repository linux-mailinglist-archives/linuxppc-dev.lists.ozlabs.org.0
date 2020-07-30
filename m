Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5B32332B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:10:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHW3m4c5ZzDr4R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:10:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVcs4g2JzDqwh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVcs2W6Vz9sSd; Thu, 30 Jul 2020 22:50:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <20200727224201.GA10133@embeddedor>
References: <20200727224201.GA10133@embeddedor>
Subject: Re: [PATCH][next] powerpc: Use fallthrough pseudo-keyword
Message-Id: <159611327982.1601380.9594499163506768565.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:20 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Jul 2020 17:42:01 -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Applied to powerpc/next.

[1/1] powerpc: Use fallthrough pseudo-keyword
      https://git.kernel.org/powerpc/c/5e66a0cb5fbdc76f9ad86a1e8f43256dbad29ef7

cheers
