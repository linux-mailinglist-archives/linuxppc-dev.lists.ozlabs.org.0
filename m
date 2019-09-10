Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B66E5AECCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 16:18:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SRvb57FDzF0tS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 00:18:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SRqV5wKpzDqG0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 00:14:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="FUvOlT3P"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46SRqT1WHWz9s4Y;
 Wed, 11 Sep 2019 00:14:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568124870;
 bh=Z28bLkGfDaS+JxlS5GFHDxMenzpB0cTLOOpN4+6VFVA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FUvOlT3PN6zmxCXxduF0n4OzydT25dHG9THLXee70RJmueBgsijIzPRx8lu/aeoaI
 XTU0fvPLs5A3Zo+0sO/ACkaanvLARHFcdspvVJiT6s7yOkY60VNhoG4BxVig/zuNRh
 iubQyAgr4Cu/SR6hnTgMdFPjw6l3wdTnFXGwox5uX9w3yrMXjJMRZqxExncPRz5INj
 xweIsTTU4+dr5OnU3LUazACzNJxOG8efYCCVId9R+dIN+L+KVqxtqJRuWlXivpAnWO
 XogsRCvVft1OLy77dOvoRDICCry+KyRDOrlW/yGN+4NLcwqabd6zYnM5O/3/H4Odvo
 /Vgxs/42K33Jw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v3] powerpc/lockdep: fix a false positive warning
In-Reply-To: <1568039433-10176-1-git-send-email-cai@lca.pw>
References: <1568039433-10176-1-git-send-email-cai@lca.pw>
Date: Wed, 11 Sep 2019 00:14:34 +1000
Message-ID: <87pnk8z19x.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, bvanassche@acm.org, arnd@arndb.de,
 peterz@infradead.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 paulus@samba.org, Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Qian,

Sorry I haven't replied sooner, I've been travelling.

Qian Cai <cai@lca.pw> writes:
> The commit 108c14858b9e ("locking/lockdep: Add support for dynamic
> keys") introduced a boot warning on powerpc below, because since the
> commit 2d4f567103ff ("KVM: PPC: Introduce kvm_tmp framework") adds
> kvm_tmp[] into the .bss section and then free the rest of unused spaces
> back to the page allocator.

Thanks for debugging this, but I'd like to fix it differently.

kvm_tmp has caused trouble before, with kmemleak, and it can also cause
trouble with STRICT_KERNEL_RWX, so I'd like to change how it's done,
rather than doing more hacks for it.

It should just be a page in text that we use if needed, and don't free,
which should avoid all these problems.

I'll try and get that done and posted soon.

cheers
