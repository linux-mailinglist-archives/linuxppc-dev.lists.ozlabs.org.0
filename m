Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8C433030
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 14:49:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HZdY3zDrzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 22:49:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HZG15qK7zDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 22:32:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45HZG14vJpz9sP6; Mon,  3 Jun 2019 22:32:57 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: efa9ace68e487ddd29c2b4d6dd23242158f1f607
X-Patchwork-Hint: ignore
Content-Type: text/plain; charset="utf-8";
In-Reply-To: <20190526024240.GA14546@zhanggen-UX430UQ>
To: Gen Zhang <blackgod016574@gmail.com>, benh@kernel.crashing.org,
 paulus@samba.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] dlpar: Fix a missing-check bug in
 dlpar_parse_cc_property()
Message-Id: <45HZG14vJpz9sP6@ozlabs.org>
Date: Mon,  3 Jun 2019 22:32:57 +1000 (AEST)
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
Cc: nfont@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2019-05-26 at 02:42:40 UTC, Gen Zhang wrote:
> In dlpar_parse_cc_property(), 'prop->name' is allocated by kstrdup().
> kstrdup() may return NULL, so it should be checked and handle error.
> And prop should be freed if 'prop->name' is NULL.
> 
> Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
> Acked-by: Nathan Lynch <nathanl@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/efa9ace68e487ddd29c2b4d6dd232421

cheers
