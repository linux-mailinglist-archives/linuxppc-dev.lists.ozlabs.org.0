Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 746DA2DFB8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 12:37:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czy9s2Dv3zDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 22:37:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4CzxR913XpzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 22:03:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CzxR86Ph8z9sWK; Mon, 21 Dec 2020 22:03:32 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Vincent Stehlé <vincent.stehle@laposte.net>, linux-kernel@vger.kernel.org
In-Reply-To: <20201213182622.23047-1-vincent.stehle@laposte.net>
References: <20201213182622.23047-1-vincent.stehle@laposte.net>
Subject: Re: [PATCH] powerpc/ps3: use dma_mapping_error()
Message-Id: <160854857859.1696279.14497114768296534603.b4-ty@ellerman.id.au>
Date: Mon, 21 Dec 2020 22:03:32 +1100 (AEDT)
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
Cc: Geoff Levand <geoff@infradead.org>,
 Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 13 Dec 2020 19:26:22 +0100, Vincent Stehlé wrote:
> The DMA address returned by dma_map_single() should be checked with
> dma_mapping_error(). Fix the ps3stor_setup() function accordingly.

Applied to powerpc/next.

[1/1] powerpc/ps3: use dma_mapping_error()
      https://git.kernel.org/powerpc/c/d0edaa28a1f7830997131cbce87b6c52472825d1

cheers
