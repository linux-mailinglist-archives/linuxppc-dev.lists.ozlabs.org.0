Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247425653EC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:42:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3nT0Gzdz3fCr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:42:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fS4lJ2z3c1X
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fS0gLKz4xn1;
	Mon,  4 Jul 2022 21:36:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, linuxppc-dev@lists.ozlabs.org, Juerg Haefliger <juerg.haefliger@canonical.com>, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220526065737.86370-1-juerg.haefliger@canonical.com>
References: <20220526065737.86370-1-juerg.haefliger@canonical.com>
Subject: Re: [PATCH 0/2] powerpc: Kconfig cleanups
Message-Id: <165693444574.9954.3298717136812564151.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:34:05 +1000
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 May 2022 08:57:35 +0200, Juerg Haefliger wrote:
> Replace some stray tabs with whitespaces and remove an extra empty
> line.
> 
> Juerg Haefliger (2):
>   powerpc: Kconfig: Replace tabs with whitespaces
>   powerpc: Kconfig.debug: Remove extra empty line
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Kconfig: Replace tabs with whitespaces
      https://git.kernel.org/powerpc/c/cea9d62b64c981b2a72e7166b21ba413fea16c83
[2/2] powerpc: Kconfig.debug: Remove extra empty line
      https://git.kernel.org/powerpc/c/d60cb5010cafc7889384ce49292a320f5bcd56ff

cheers
