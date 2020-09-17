Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48126DB79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:27:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsbnX2psYzDqW1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:27:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSq3Pp9zDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSp1r5Dz9sV6; Thu, 17 Sep 2020 21:27:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jason Yan <yanaijie@huawei.com>, geoff@infradead.org, mpe@ellerman.id.au,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, benh@kernel.crashing.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20200911020121.1464585-1-yanaijie@huawei.com>
References: <20200911020121.1464585-1-yanaijie@huawei.com>
Subject: Re: [PATCH] powerpc/ps3: make two symbols static
Message-Id: <160034201679.3339803.12983868854288470547.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:37 +1000 (AEST)
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
Cc: Hulk Robot <hulkci@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Sep 2020 10:01:21 +0800, Jason Yan wrote:
> This addresses the following sparse warning:
> 
> arch/powerpc/platforms/ps3/spu.c:451:33: warning: symbol
> 'spu_management_ps3_ops' was not declared. Should it be static?
> arch/powerpc/platforms/ps3/spu.c:592:28: warning: symbol
> 'spu_priv1_ps3_ops' was not declared. Should it be static?

Applied to powerpc/next.

[1/1] powerpc/ps3: make two symbols static
      https://git.kernel.org/powerpc/c/bbc4f40b5322b3e0b8678619f1c613dadc811669

cheers
