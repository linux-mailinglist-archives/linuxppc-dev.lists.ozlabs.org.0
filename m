Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D26F7857B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4pT0tC7z3gpF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cp3kbNz3c8n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:03:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cp2Cddz4x2S;
	Wed, 23 Aug 2023 22:03:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <b056c4e986a4a7707fc1994304c34f7bd15d6871.1691474658.git.christophe.leroy@csgroup.eu>
References: <b056c4e986a4a7707fc1994304c34f7bd15d6871.1691474658.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/6] powerpc/include: Remove unneeded #include <asm/fs_pd.h>
Message-Id: <169279175564.797584.5057179018617962889.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 08 Aug 2023 08:04:38 +0200, Christophe Leroy wrote:
> tqm8xx_setup.c and fs_enet.h don't use any items provided by fs_pd.h
> 
> Remove unneeded #include <asm/fs_pd.h>
> 
> 

Applied to powerpc/next.

[1/6] powerpc/include: Remove unneeded #include <asm/fs_pd.h>
      https://git.kernel.org/powerpc/c/60bc069c433fc89caa97927b1636401a0e647f67
[2/6] powerpc/include: Declare mpc8xx_immr in 8xx_immap.h
      https://git.kernel.org/powerpc/c/e6e077cb2aa4ffb8b320f9a1464f29a21986a901
[3/6] powerpc/include: Remove mpc8260.h and m82xx_pci.h
      https://git.kernel.org/powerpc/c/fecc436a97afed920486be609c3989e05547a384
[4/6] powerpc: Remove CONFIG_PCI_8260
      https://git.kernel.org/powerpc/c/cb888cdf741c958cae3e00b649fb7ed5c9bb2d49
[5/6] powerpc/8xx: Remove immr_map() and immr_unmap()
      https://git.kernel.org/powerpc/c/fbbf4280dae4c02d2f176a8fdac7a7d32fe76fc0
[6/6] powerpc/cpm2: Remove cpm2_map() and cpm2_unmap()
      https://git.kernel.org/powerpc/c/7768716d2f1906c9258ed4b39584da6317020594

cheers
