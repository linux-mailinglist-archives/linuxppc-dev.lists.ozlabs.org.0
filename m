Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF32C403D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:33:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch0fn6xMWzDqRW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:33:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzsr3FNHzDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:57:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsm1K6Jz9sVX; Wed, 25 Nov 2020 22:57:48 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201014072837.24539-1-jniethe5@gmail.com>
References: <20201014072837.24539-1-jniethe5@gmail.com>
Subject: Re: [PATCH v4 1/2] powerpc/64: Set up a kernel stack for secondaries
 before cpu_restore()
Message-Id: <160630539903.2174375.14042902720117238305.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:48 +1100 (AEDT)
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
Cc: oohall@gmail.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 18:28:36 +1100, Jordan Niethe wrote:
> Currently in generic_secondary_smp_init(), cur_cpu_spec->cpu_restore()
> is called before a stack has been set up in r1. This was previously fine
> as the cpu_restore() functions were implemented in assembly and did not
> use a stack. However commit 5a61ef74f269 ("powerpc/64s: Support new
> device tree binding for discovering CPU features") used
> __restore_cpu_cpufeatures() as the cpu_restore() function for a
> device-tree features based cputable entry. This is a C function and
> hence uses a stack in r1.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/64: Set up a kernel stack for secondaries before cpu_restore()
      https://git.kernel.org/powerpc/c/3c0b976bf20d236c57adcefa80f86a0a1d737727
[2/2] powerpc/64s: Convert some cpu_setup() and cpu_restore() functions to C
      https://git.kernel.org/powerpc/c/344fbab991a568dc33ad90711b489d870e18d26d

cheers
