Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1D5328F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:29:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sRQ0pfvz3hWK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:29:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s846Hgbz3cgP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:16:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s845DZdz4yTV;
 Tue, 24 May 2022 21:16:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, benh@kernel.crashing.org, mpe@ellerman.id.au,
 YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20220517094900.14900-1-yuehaibing@huawei.com>
References: <20220517094900.14900-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] powerpc/kaslr_booke: Fix build error
Message-Id: <165339057419.1718562.13519076380982149999.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:34 +1000
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

On Tue, 17 May 2022 17:49:00 +0800, YueHaibing wrote:
> arch/powerpc/mm/nohash/kaslr_booke.c: In function ‘kaslr_get_cmdline’:
> arch/powerpc/mm/nohash/kaslr_booke.c:46:2: error: implicit declaration of function ‘early_init_dt_scan_chosen’; did you mean ‘early_init_mmu_secondary’? [-Werror=implicit-function-declaration]
>   early_init_dt_scan_chosen(boot_command_line);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~
>   early_init_mmu_secondary
> arch/powerpc/mm/nohash/kaslr_booke.c: In function ‘get_initrd_range’:
> arch/powerpc/mm/nohash/kaslr_booke.c:210:10: error: implicit declaration of function ‘of_read_number’; did you mean ‘seq_read_iter’? [-Werror=implicit-function-declaration]
>   start = of_read_number(prop, len / 4);
>           ^~~~~~~~~~~~~~
>           seq_read_iter
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/kaslr_booke: Fix build error
      https://git.kernel.org/powerpc/c/cdf87d2bd12cf3ea760a1fa35907a31e5177f425

cheers
