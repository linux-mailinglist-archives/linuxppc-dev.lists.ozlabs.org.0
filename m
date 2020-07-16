Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 583982224CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:03:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6wvq0RcMzDqJt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:03:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQ92PCLzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4B6vPv2NVWz9sVQ; Thu, 16 Jul 2020 22:56:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPt2BxBz9sTS; Thu, 16 Jul 2020 22:56:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200623130320.405852-1-mpe@ellerman.id.au>
References: <20200623130320.405852-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/boot/dts: Fix dtc "pciex" warnings
Message-Id: <159490400445.3805857.5278939736840106441.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:02 +1000 (AEST)
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
Cc: sfr@canb.auug.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jun 2020 23:03:20 +1000, Michael Ellerman wrote:
> With CONFIG_OF_ALL_DTBS=y, as set by eg. allmodconfig, we see lots of
> warnings about our dts files, such as:
> 
>   arch/powerpc/boot/dts/glacier.dts:492.26-532.5:
>   Warning (pci_bridge): /plb/pciex@d00000000: node name is not "pci"
>   or "pcie"
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/boot/dts: Fix dtc "pciex" warnings
      https://git.kernel.org/powerpc/c/86bc917d2ac117ec922dbf8ed92ca989bf333281

cheers
