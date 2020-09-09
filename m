Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A1262FAC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 16:21:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmkj15m1lzDqHK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 00:21:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjWF2NvkzDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjWD6g2Bz9sTv; Wed,  9 Sep 2020 23:27:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20200902000012.3440389-1-joel@jms.id.au>
References: <20200902000012.3440389-1-joel@jms.id.au>
Subject: Re: [PATCH v3] powerpc: Warn about use of smt_snooze_delay
Message-Id: <159965717503.808686.10527215455301576220.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:45 +1000 (AEST)
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Sep 2020 09:30:11 +0930, Joel Stanley wrote:
> It's not done anything for a long time. Save the percpu variable, and
> emit a warning to remind users to not expect it to do anything.
> 
> This uses pr_warn_once instead of pr_warn_ratelimit as testing
> 'ppc64_cpu --smt=off' on a 24 core / 4 SMT system showed the warning to
> be noisy, as the online/offline loop is slow.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Warn about use of smt_snooze_delay
      https://git.kernel.org/powerpc/c/a02f6d42357acf6e5de6ffc728e6e77faf3ad217

cheers
