Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB6E7C98A1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:10:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gJBgCvZa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7bbY4WRSz3w2F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:10:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gJBgCvZa;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7bVS2VVnz3vZS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:06:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697364368;
	bh=i4UWmSXRdf8U3S13I3kD1JSY13lhFBz1uoD0N3O5gJM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gJBgCvZaEh9UB1j8l9jgl1lcm9tKhfgJp9ItNPM9Hj3n7fbEgL8m+iRP9O0vHZAgR
	 UBK77/niEbZXGJQWrrYT2xxm8zjejGl14XMaPzkLlLLTeAE9m7RPyXvuXYonrP4ZYm
	 MeAcgvITgft32SbCtgN+Sv7eCSiaHlr8BPPua5qvKAtqfxmlppHwkbqhvXA8WlX1Kt
	 LVr0BPr3a/zXmElcDvv8bj7MGn5nly4LU/6t1w8esohXrYX7wTBqXs4vAWpKDf362v
	 yyR5RTdmpoVzPLvXesfWxE2zH6UJTKLkzyzght/sVyGAmETiC7k0N6sJpWsFBvrNHg
	 VRK1ozDCF1xJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7bVQ4zgTz4wcc;
	Sun, 15 Oct 2023 21:06:06 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg Ungerer <gerg@linux-m68k.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <cover.1695031668.git.geert@linux-m68k.org>
References: <cover.1695031668.git.geert@linux-m68k.org>
Subject: Re: (subset) [PATCH v2 0/2] m68k/powerpc: Kill references to non-existent README.legal
Message-Id: <169736429851.960528.8922488798725928458.b4-ty@ellerman.id.au>
Date: Sun, 15 Oct 2023 21:04:58 +1100
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
Cc: linux-spdx@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 Sep 2023 12:14:42 +0200, Geert Uytterhoeven wrote:
> Note that the "COPYING" file at that time corresponded to the version
> from upstream Linux v0.99.11 until v2.1.104, and thus predated the
> addition of the "only valid GPL version is v2" clause in v2.4.0-test8.
> 
> This patch series gets rid of the references to README.legal by
> replacing the boilerplate with SPDX license identifiers.
> 
> [...]

Applied to powerpc/next.

[2/2] powerpc: Replace GPL 2.0+ README.legal boilerplate with SPDX
      https://git.kernel.org/powerpc/c/6fcb13972bc2b41211e1dddb02f5e73199addc75

cheers
