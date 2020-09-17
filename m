Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF95526DB6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:24:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsbjz58jMzDqcM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:24:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSp1x0QzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSn4Bj0z9sVK; Thu, 17 Sep 2020 21:27:36 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Wang Wensheng <wangwensheng4@huawei.com>, gustavoars@kernel.org,
 linuxppc-dev@lists.ozlabs.org, benh@kernel.crashing.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20200914122615.65669-1-wangwensheng4@huawei.com>
References: <20200914122615.65669-1-wangwensheng4@huawei.com>
Subject: Re: [PATCH -next] drivers/macintosh/smu.c: Fix undeclared symbol
 warning
Message-Id: <160034201787.3339803.8589404521263533861.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:36 +1000 (AEST)
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

On Mon, 14 Sep 2020 12:26:15 +0000, Wang Wensheng wrote:
> Make kernel with `C=2`:
> drivers/macintosh/smu.c:1018:30: warning: symbol
> '__smu_get_sdb_partition' was not declared. Should it be static?

Applied to powerpc/next.

[1/1] drivers/macintosh/smu.c: Fix undeclared symbol warning
      https://git.kernel.org/powerpc/c/3db8715ec9dc1d32ecafc67af9fb96508c98efe5

cheers
