Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCAE2771BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 15:02:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxwF417gbzDqk9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 23:02:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxvTY0ZRSzDqYq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 22:28:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BxvTT1jLnz9sTh; Thu, 24 Sep 2020 22:28:12 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Yang Yingliang <yangyingliang@huawei.com>
In-Reply-To: <20200917020643.90375-1-yangyingliang@huawei.com>
References: <20200917020643.90375-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next v2] powerpc/book3s64: fix link error with
 CONFIG_PPC_RADIX_MMU=n
Message-Id: <160094999549.26280.7851538426572891757.b4-ty@ellerman.id.au>
Date: Thu, 24 Sep 2020 22:28:12 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Sep 2020 10:06:43 +0800, Yang Yingliang wrote:
> Fix link error when CONFIG_PPC_RADIX_MMU is disabled:
> powerpc64-linux-gnu-ld: arch/powerpc/platforms/pseries/lpar.o:(.toc+0x0): undefined reference to `mmu_pid_bits'

Applied to powerpc/next.

[1/1] powerpc/book3s64: fix link error with CONFIG_PPC_RADIX_MMU=n
      https://git.kernel.org/powerpc/c/bda7673d64b6c2e92423363a756caa657464e096

cheers
