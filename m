Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D697454CE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:26:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZCB0rx4z3cZG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:25:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZ8J2CnNz30gm
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:23:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZ8H6kJSz4wxn;
	Mon,  3 Jul 2023 15:23:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230519113806.370635-1-mpe@ellerman.id.au>
References: <20230519113806.370635-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm: Reinstate ARCH_FORCE_MAX_ORDER ranges
Message-Id: <168836167610.46386.17455877483324713616.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:21:16 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 May 2023 21:38:06 +1000, Michael Ellerman wrote:
> Commit 1e8fed873e74 ("powerpc: drop ranges for definition of
> ARCH_FORCE_MAX_ORDER") removed the limits on the possible values for
> ARCH_FORCE_MAX_ORDER.
> 
> However removing the ranges entirely causes some common work flows to
> break. For example building a defconfig (which uses 64K pages), changing
> the page size to 4K, and rebuilding used to work, because
> ARCH_FORCE_MAX_ORDER would be clamped to 12 by the ranges.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Reinstate ARCH_FORCE_MAX_ORDER ranges
      https://git.kernel.org/powerpc/c/358e526a1648cdd773ba169da5867874ae2408e3

cheers
