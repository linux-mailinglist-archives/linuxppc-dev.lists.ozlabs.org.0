Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B554316962
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 15:47:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbN0H07crzDsmp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 01:47:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKYY3zXfzDshk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:53 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKYY1XNFz9sWY; Wed, 10 Feb 2021 23:57:47 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Sandipan Das <sandipan@linux.ibm.com>
In-Reply-To: <20210204080744.135785-1-sandipan@linux.ibm.com>
References: <20210204080744.135785-1-sandipan@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] powerpc: sstep: Fix load-store and update emulation
Message-Id: <161296172385.3178259.13923609382303854453.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:47 +1100 (AEDT)
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Feb 2021 13:37:43 +0530, Sandipan Das wrote:
> The Power ISA says that the fixed-point load and update
> instructions must neither use R0 for the base address (RA)
> nor have the destination (RT) and the base address (RA) as
> the same register. Similarly, for fixed-point stores and
> floating-point loads and stores, the instruction is invalid
> when R0 is used as the base address (RA).
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/sstep: Fix load-store and update emulation
      https://git.kernel.org/powerpc/c/bbda4b6c7d7c7f79da71f95c92a5d76be22c3efd
[2/2] powerpc/sstep: Fix darn emulation
      https://git.kernel.org/powerpc/c/22b89ba178dd0a66a26699ead014a3e73ff8e044

cheers
