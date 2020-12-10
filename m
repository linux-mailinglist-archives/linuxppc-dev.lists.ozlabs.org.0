Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 354892D5B62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 14:13:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsDqx2PDzzDqyP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 00:13:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXl3S9qzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXl0M35z9sXV; Thu, 10 Dec 2020 22:29:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <4fc9e30b2b09933c8dfd7a50924dfbdf9ea6a80f.1602587470.git.christophe.leroy@csgroup.eu>
References: <4fc9e30b2b09933c8dfd7a50924dfbdf9ea6a80f.1602587470.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/2] powerpc/feature: Fix CPU_FTRS_ALWAYS by removing
 CPU_FTRS_GENERIC_32
Message-Id: <160756607118.1313423.13202054747271223838.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:58 +1100 (AEDT)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Oct 2020 11:11:20 +0000 (UTC), Christophe Leroy wrote:
> On 8xx, we get the following features:
> 
> [    0.000000] cpu_features      = 0x0000000000000100
> [    0.000000]   possible        = 0x0000000000000120
> [    0.000000]   always          = 0x0000000000000000
> 
> This is not correct. As CONFIG_PPC_8xx is mutually exclusive with all
> other configurations, the three lines should be equal.
> 
> [...]

Patch 2 applied to powerpc/next.

[2/2] powerpc/feature: Remove CPU_FTR_NODSISRALIGN
      https://git.kernel.org/powerpc/c/7d47034551687eb6c15e8431d897a3758fc5f83e

cheers
