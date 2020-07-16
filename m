Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED6D2224FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:14:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6x8t2mpmzDr6V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:14:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQB1vYgzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vQ53Sk2z9sVY; Thu, 16 Jul 2020 22:56:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200604125610.649668-1-sandipan@linux.ibm.com>
References: <20200604125610.649668-1-sandipan@linux.ibm.com>
Subject: Re: [PATCH v3 0/3] selftests: powerpc: Fixes and execute-disable test
 for pkeys
Message-Id: <159490400411.3805857.17323999819214487510.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:13 +1000 (AEST)
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
Cc: fweimer@redhat.com, aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Jun 2020 18:26:07 +0530, Sandipan Das wrote:
> This fixes the way the Authority Mask Register (AMR) is updated
> by the existing pkey tests and adds a new test to verify the
> functionality of execute-disabled pkeys.
> 
> Previous versions can be found at:
> v2: https://lore.kernel.org/linuxppc-dev/20200527030342.13712-1-sandipan@linux.ibm.com/
> v1: https://lore.kernel.org/linuxppc-dev/20200508162332.65316-1-sandipan@linux.ibm.com/
> 
> [...]

Applied to powerpc/next.

[1/3] selftests/powerpc: Fix pkey access right updates
      https://git.kernel.org/powerpc/c/828ca4320d130bbe1d12866152600c49ff6a9f79
[2/3] selftests/powerpc: Move Hash MMU check to utilities
      https://git.kernel.org/powerpc/c/c405b738daf9d8e8a5aedfeb6be851681e65e54b
[3/3] selftests/powerpc: Add test for execute-disabled pkeys
      https://git.kernel.org/powerpc/c/1addb6444791f9e87fce0eb9882ec96a4a76e615

cheers
