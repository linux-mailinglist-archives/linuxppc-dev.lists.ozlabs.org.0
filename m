Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DE22C83E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:42:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCsNt0V2wzF151
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:42:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgQ19tKzDr9w
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:24:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgP4Wztz9sTF; Fri, 24 Jul 2020 23:24:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: jk@ozlabs.org, arnd@arndb.de, Christoph Hellwig <hch@lst.de>,
 mpe@ellerman.id.au
In-Reply-To: <20200610085554.5647-1-hch@lst.de>
References: <20200610085554.5647-1-hch@lst.de>
Subject: Re: [PATCH] powerpc/spufs: fix the type of ret in
 spufs_arch_write_note
Message-Id: <159559697273.1657499.2096852571669138051.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:24:46 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Jun 2020 10:55:54 +0200, Christoph Hellwig wrote:
> Both the ->dump method and snprintf return an int.  So switch to an
> int and properly handle errors from ->dump.

Applied to powerpc/next.

[1/1] powerpc/spufs: Fix the type of ret in spufs_arch_write_note
      https://git.kernel.org/powerpc/c/7c7ff885c7bce40a487e41c68f1dac14dd2c8033

cheers
