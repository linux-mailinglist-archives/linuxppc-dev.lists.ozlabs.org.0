Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D08E423A629
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 14:45:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKyKC5CfSzDqTT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 22:45:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKyF410QBzDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 22:41:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cVClQkke; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKyF30k0qz9sXW;
 Mon,  3 Aug 2020 22:41:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596458503;
 bh=rX/hFWHJYOaUPB2cPh/xDSZoR29h5p2sxO6WS0MuD58=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cVClQkke2/4IWqR71bZFRXaqJv7YRevjcQpKptdn4F+CRVOMm+71u+aYVNRBPAB7L
 mJl0gSGkn5u+R0OihmoBZR1QTr+9Dx8110WiH+QskZ2ZNHP7BxIM+WMjFWQMtnzC0s
 sGpJsWf/rNINilc++U9dFMn419E4xpQfkhONecLhm/vF4VrIkhftFyT1J/XY+4blkK
 a6mxagPBbdU0FELvX31nkWD/FrnVrXrnR25ki5llHZGSifezp2OyEWLZgULZa3vNKJ
 ppjKXRbXi63iXAbNxwNJA8xMqRaxo5yFyDyayQK97hSkPZ/gyHfIMkzqQSa/FpsGg3
 BgBqJjBPXX/oQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH] powerpc: Fix P10 PVR revision in /proc/cpuinfo for SMT4
 cores
In-Reply-To: <20200803035600.1820371-1-mikey@neuling.org>
References: <20200803035600.1820371-1-mikey@neuling.org>
Date: Mon, 03 Aug 2020 22:41:41 +1000
Message-ID: <87sgd3zyt6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: grimm@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Michael Neuling <mikey@neuling.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Neuling <mikey@neuling.org> writes:
> On POWER10 bit 12 in the PVR indicates if the core is SMT4 or
> SMT8. Bit 12 is set for SMT4.
>
> Without this patch, /proc/cpuinfo on a SMT4 DD1 POWER10 looks like
> this:
>     cpu             : POWER10, altivec supported
>     revision        : 17.0 (pvr 0080 1100)
>
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> ---
>  arch/powerpc/kernel/setup-common.c | 1 +
>  1 file changed, 1 insertion(+)

This should have a Fixes: pointing at something so it gets backported.

cheers
