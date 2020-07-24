Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC21722C8F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:28:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCtQ26qWzzDrR6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:28:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgv0Y0ZzDqGZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgs5ZZwz9sVG; Fri, 24 Jul 2020 23:25:12 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Will Deacon <willdeacon@google.com>
In-Reply-To: <20200716193820.1141936-1-palmer@dabbelt.com>
References: <20200716193820.1141936-1-palmer@dabbelt.com>
Subject: Re: [PATCH] powerpc/64: Fix an out of date comment about MMIO ordering
Message-Id: <159559697172.1657499.14368228495374762010.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:25:12 +1000 (AEST)
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
Cc: kernel-team@android.com, jniethe5@gmail.com, bigeasy@linutronix.de,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, tglx@linutronix.de, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jul 2020 12:38:20 -0700, Palmer Dabbelt wrote:
> This primitive has been renamed, but because it was spelled incorrectly in the
> first place it must have escaped the fixup patch.  As far as I can tell this
> logic is still correct: smp_mb__after_spinlock() uses the default smp_mb()
> implementation, which is "sync" rather than "hwsync" but those are the same
> (though I'm not that familiar with PowerPC).

Applied to powerpc/next.

[1/1] powerpc/64: Fix an out of date comment about MMIO ordering
      https://git.kernel.org/powerpc/c/147c13413c04bc6a2bd76f2503402905e5e98cff

cheers
