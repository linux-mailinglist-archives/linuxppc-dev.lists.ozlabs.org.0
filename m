Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08092381B89
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 00:48:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjLC90X5Tz3bxt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 08:48:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjL8X17Q9z2yxF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 08:45:48 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FjL8W4c6Vz9sjD; Sun, 16 May 2021 08:45:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210506044959.1298123-1-mpe@ellerman.id.au>
References: <20210506044959.1298123-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] powerpc/64s: Fix crashes when toggling stf barrier
Message-Id: <162111863469.1890426.14450132692669538392.b4-ty@ellerman.id.au>
Date: Sun, 16 May 2021 08:43:54 +1000
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
Cc: nathanl@linux.ibm.com, anton@samba.org, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 May 2021 14:49:58 +1000, Michael Ellerman wrote:
> The STF (store-to-load forwarding) barrier mitigation can be
> enabled/disabled at runtime via a debugfs file (stf_barrier), which
> causes the kernel to patch itself to enable/disable the relevant
> mitigations.
> 
> However depending on which mitigation we're using, it may not be safe to
> do that patching while other CPUs are active. For example the following
> crash:
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/64s: Fix crashes when toggling stf barrier
      https://git.kernel.org/powerpc/c/8ec7791bae1327b1c279c5cd6e929c3b12daaf0a
[2/2] powerpc/64s: Fix crashes when toggling entry flush barrier
      https://git.kernel.org/powerpc/c/aec86b052df6541cc97c5fca44e5934cbea4963b

cheers
