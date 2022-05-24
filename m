Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B045C5328F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:29:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sR04yrPz3fTK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:29:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s841ldxz3c7F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:16:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s8412j8z4yTR;
 Tue, 24 May 2022 21:16:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, benh@kernel.crashing.org,
 YueHaibing <yuehaibing@huawei.com>, christophe.leroy@csgroup.eu,
 mpe@ellerman.id.au
In-Reply-To: <20220517094830.27560-1-yuehaibing@huawei.com>
References: <20220517094830.27560-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] powerpc/book3e: Fix build error
Message-Id: <165339057319.1718562.17208569105645113277.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:33 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 May 2022 17:48:30 +0800, YueHaibing wrote:
> arch/powerpc/mm/nohash/fsl_book3e.c: In function ‘relocate_init’:
> arch/powerpc/mm/nohash/fsl_book3e.c:348:2: error: implicit declaration of function ‘early_get_first_memblock_info’ [-Werror=implicit-function-declaration]
>   early_get_first_memblock_info(__va(dt_ptr), &size);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add missing include file linux/of_fdt.h to fix this.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/book3e: Fix build error
      https://git.kernel.org/powerpc/c/7574dd080ee0a1e8a9c6312dc7c8fe97f73415ff

cheers
