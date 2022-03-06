Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2048C4CE9EA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 08:52:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBDN80M10z3bfR
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 18:52:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBDMm1Gyvz2xt0
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Mar 2022 18:52:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KBDMk5zv9z4xZq;
 Sun,  6 Mar 2022 18:52:34 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220301204743.45133-1-muriloo@linux.ibm.com>
References: <20220301204743.45133-1-muriloo@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/64s: Fix build failure when
 CONFIG_PPC_64S_HASH_MMU is not set
Message-Id: <164655313998.2845689.17526112679322960530.b4-ty@ellerman.id.au>
Date: Sun, 06 Mar 2022 18:52:19 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: "Erhard F ." <erhard_f@mailbox.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Nick Child <nick.child@ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, mopsfelder@gmail.com,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Mar 2022 17:47:43 -0300, Murilo Opsfelder Araujo wrote:
> The following build failure occurs when CONFIG_PPC_64S_HASH_MMU is not
> set:
> 
>     arch/powerpc/kernel/setup_64.c: In function ‘setup_per_cpu_areas’:
>     arch/powerpc/kernel/setup_64.c:811:21: error: ‘mmu_linear_psize’ undeclared (first use in this function); did you mean ‘mmu_virtual_psize’?
>       811 |                 if (mmu_linear_psize == MMU_PAGE_4K)
>           |                     ^~~~~~~~~~~~~~~~
>           |                     mmu_virtual_psize
>     arch/powerpc/kernel/setup_64.c:811:21: note: each undeclared identifier is reported only once for each function it appears in
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Fix build failure when CONFIG_PPC_64S_HASH_MMU is not set
      https://git.kernel.org/powerpc/c/58dbe9b373df2828d873b1c0e5afc77485b2f376

cheers
