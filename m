Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C026DAA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 13:47:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsZvm1KgNzDqZX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 21:47:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSV4gMPzDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSS4NnCz9sV6; Thu, 17 Sep 2020 21:27:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <0eb61cf0dc66d781d47deb2228498cd61d03a754.1597643221.git.christophe.leroy@csgroup.eu>
References: <0eb61cf0dc66d781d47deb2228498cd61d03a754.1597643221.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/4] powerpc/process: Remove useless #ifdef CONFIG_VSX
Message-Id: <160034201621.3339803.17351420143711068195.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:20 +1000 (AEST)
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

On Mon, 17 Aug 2020 05:47:55 +0000 (UTC), Christophe Leroy wrote:
> cpu_has_feature(CPU_FTR_VSX) returns false when CONFIG_VSX is
> not set.
> 
> There is no need to enclose the test in an #ifdef CONFIG_VSX.
> Remove it.

Applied to powerpc/next.

[1/4] powerpc/process: Remove useless #ifdef CONFIG_VSX
      https://git.kernel.org/powerpc/c/80739c2bd29133715d6828e333649a55095f4747
[2/4] powerpc/process: Remove useless #ifdef CONFIG_ALTIVEC
      https://git.kernel.org/powerpc/c/e3667ee427e224f9951eb3940a97477285548134
[3/4] powerpc/process: Remove useless #ifdef CONFIG_SPE
      https://git.kernel.org/powerpc/c/532ed1900d37a47c821718a0d8d28eb05b2c4d28
[4/4] powerpc/process: Remove useless #ifdef CONFIG_PPC_FPU
      https://git.kernel.org/powerpc/c/c83c192a6fbb1d4db4144c40296ed059f5eca384

cheers
