Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D65A235AE64
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:33:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHctK63TJz3c8g
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:33:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcp91shkz3bwX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:29:37 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FHcp82MNHz9sXb; Sun, 11 Apr 2021 00:29:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210326101201.1973552-1-mpe@ellerman.id.au>
References: <20210326101201.1973552-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Move security code into security.c
Message-Id: <161806493642.1467223.7654493725065071988.b4-ty@ellerman.id.au>
Date: Sun, 11 Apr 2021 00:28:56 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 26 Mar 2021 21:12:01 +1100, Michael Ellerman wrote:
> When the original spectre/meltdown mitigations were merged we put them
> in setup_64.c for lack of a better place.
> 
> Since then we created security.c for some of the other mitigation
> related code. But it should all be in there.
> 
> This sort of code movement can cause trouble for backports, but
> hopefully this code is relatively stable these days (famous last words).

Applied to powerpc/next.

[1/1] powerpc/64: Move security code into security.c
      https://git.kernel.org/powerpc/c/c6b4c9147f8b85d159f670d7bce71a93d16062a2

cheers
