Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB4B24BEFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 15:38:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXQht3LMGzDr39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 23:38:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXQXm68VZzDr1R
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 23:31:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BXQXl2v1Rz9sV4; Thu, 20 Aug 2020 23:31:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: oohall@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20200819130741.16769-1-fbarrat@linux.ibm.com>
References: <20200819130741.16769-1-fbarrat@linux.ibm.com>
Subject: Re: [PATCH] powerpc/powernv/pci: Fix typo when releasing DMA resources
Message-Id: <159793027430.2366922.16353476973955365668.b4-ty@ellerman.id.au>
Date: Thu, 20 Aug 2020 23:31:34 +1000 (AEST)
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

On Wed, 19 Aug 2020 15:07:41 +0200, Frederic Barrat wrote:
> Fix typo introduced during recent code cleanup, which could lead to
> silently not freeing resources or oops message (on PCI hotplug or CAPI
> reset).
> Only impacts ioda2, the code path for ioda1 is correct.

Applied to powerpc/fixes.

[1/1] powerpc/powernv/pci: Fix possible crash when releasing DMA resources
      https://git.kernel.org/powerpc/c/e17a7c0e0aebb956719ce2a8465f649859c2da7d

cheers
