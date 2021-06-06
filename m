Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15939CEB5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 13:37:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FyZH10VSBz306r
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 21:37:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FyZFm0Jxcz306G
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 21:36:11 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FyZFd0211z9sW8; Sun,  6 Jun 2021 21:36:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
In-Reply-To: <20210526120005.3432222-1-npiggin@gmail.com>
References: <20210526120005.3432222-1-npiggin@gmail.com>
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Fix reverse map real-mode address
 lookup with huge vmalloc
Message-Id: <162297929320.2342154.13861620404676525941.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 21:34:53 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 May 2021 22:00:05 +1000, Nicholas Piggin wrote:
> real_vmalloc_addr() does not currently work for huge vmalloc, which is
> what the reverse map can be allocated with for radix host, hash guest.
> 
> Extract the hugepage aware equivalent from eeh code into a helper, and
> convert existing sites including this one to use it.

Applied to powerpc/fixes.

[1/1] KVM: PPC: Book3S HV: Fix reverse map real-mode address lookup with huge vmalloc
      https://git.kernel.org/powerpc/c/5362a4b6ee6136018558ef6b2c4701aa15ebc602

cheers
