Return-Path: <linuxppc-dev+bounces-5019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC4AA09EE3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 00:57:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJVw43ZSz3bV6;
	Sat, 11 Jan 2025 10:57:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736553464;
	cv=none; b=Z+cfivhFP7c+zEH+PFnAUOZbEbWSga+cna7y2JqynYD8DQNR+eqQ5dL6aZiD6Udd8j/tW6+KUvEpb8K/kH9rTB6l0cDuLMwLdoOCBko8ApflI2pOKqfeytglY5KTgjTgeGiEqq/C8aHITyE3eeSR9e7gZfEO2BtWIMwtIQ7Oa2M19yWTWim8w/L2PdNuX9iby2CAAVVh6W4GMQAUDEXWKp7hD7FZCFVg6lW3X6s2O8fRg9qATjF01iRC3Zb/KwbrK0e/up8HJP7W3EIB4guXULtB9/3uvZMnlp8156sbaJ1eZvHaefj9ZJWThXCeGxROAkxI1cA3EY6A4kfXsZcUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736553464; c=relaxed/relaxed;
	bh=RpsxTqSpw+xU+Ojta4h7470vlKL8fe0DWlZjJQJKYKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fpc0r0kFENQBuElgoL/4gjm6BohqTXhC5P0d2TP5Na/eYeowz6Kq0w5ov1jxiCbVkXNQhD8xwoNoHVgoYhyyMa51Q95ZDz+VfhVVGyScs1x8ewc8L84NTmULcV/28wxh4nJ7OkMwsMCuo1hcWE2VOlFvcnQg0uXclthiiMiZqSXauiZNYupRymRJ96FOxjn0sldmnbn+mmJWkRt5g1kJge0kroH9hhdhEmMLaUXFE+jTs7rGN72xF4OJOXkPR+CCKa6jQo7drELTIP7CvWiXoUGgMhXBfa/grKXU4WkS5DCy8likV2fK8D7Bh0NMDoTbW+XdwP8TE8KXclNBcbuciQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kTTB5fZ+; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kTTB5fZ+;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVJVt31pmz3c6q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 10:57:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1736553455;
	bh=RpsxTqSpw+xU+Ojta4h7470vlKL8fe0DWlZjJQJKYKk=;
	h=From:To:Cc:Subject:Date:From;
	b=kTTB5fZ+zESsLt3q/HMo0BRoWuct1MIpwDIPYrYNcnt5MkPp01zlusE9aFMVvu20v
	 IIzIMAeTIPjXH9TT8VmQoYK/rgvn8OS1wcgmxNwMCPJrdW41UB/B/oUaA7unw+JV5x
	 8gRjTIXhQ2hhBVzWDAWdeyUiGGTHTSe47DfLzo5g1xLt0mgoxxJ8weSMyztGG2sR3b
	 2AgSMvIoBhxDFqyW8AeQuckL0/CuZepD5yBcnB64982CZTJz8CBYvQhOglpJKCqx9r
	 CTwWRrzyJWquiJwuLTg05pUURzTy2/SEiPtU1zRf11gkPYC9I4RzcULRzvNSfoj3oy
	 w8wB5iIQtOYsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YVJVk3jdZz4wcy;
	Sat, 11 Jan 2025 10:57:34 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Paolo Bonzini
 <pbonzini@redhat.com>, LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: powerpc: Update my status
Date: Sat, 11 Jan 2025 10:57:38 +1100
Message-ID: <8734hqkyrx.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Maddy is taking over the day-to-day maintenance of powerpc. I will still
be around to help, and as a backup.

Re-order the main POWERPC list to put Maddy first to reflect that.

KVM/powerpc patches will be handled by Maddy via the powerpc tree with
review from Nick, so replace myself with Maddy there.

Remove myself from BPF, leaving Hari & Christophe as maintainers.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..025c6ad42c9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4131,7 +4131,6 @@ S:	Odd Fixes
 F:	drivers/net/ethernet/netronome/nfp/bpf/
 
 BPF JIT for POWERPC (32-BIT AND 64-BIT)
-M:	Michael Ellerman <mpe@ellerman.id.au>
 M:	Hari Bathini <hbathini@linux.ibm.com>
 M:	Christophe Leroy <christophe.leroy@csgroup.eu>
 R:	Naveen N Rao <naveen@kernel.org>
@@ -12632,7 +12631,7 @@ F:	arch/mips/include/uapi/asm/kvm*
 F:	arch/mips/kvm/
 
 KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc)
-M:	Michael Ellerman <mpe@ellerman.id.au>
+M:	Madhavan Srinivasan <maddy@linux.ibm.com>
 R:	Nicholas Piggin <npiggin@gmail.com>
 L:	linuxppc-dev@lists.ozlabs.org
 L:	kvm@vger.kernel.org
@@ -13211,11 +13210,11 @@ X:	drivers/macintosh/adb-iop.c
 X:	drivers/macintosh/via-macii.c
 
 LINUX FOR POWERPC (32-BIT AND 64-BIT)
+M:	Madhavan Srinivasan <maddy@linux.ibm.com>
 M:	Michael Ellerman <mpe@ellerman.id.au>
 R:	Nicholas Piggin <npiggin@gmail.com>
 R:	Christophe Leroy <christophe.leroy@csgroup.eu>
 R:	Naveen N Rao <naveen@kernel.org>
-M:	Madhavan Srinivasan <maddy@linux.ibm.com>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 W:	https://github.com/linuxppc/wiki/wiki
-- 
2.47.1


