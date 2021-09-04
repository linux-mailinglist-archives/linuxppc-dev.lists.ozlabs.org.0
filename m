Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D60634008CA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 03:02:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1bxT5qWjz306R
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 11:02:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1bx20C64z2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Sep 2021 11:02:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H1bwz6Tfdz9sSs;
 Sat,  4 Sep 2021 11:02:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210831135151.886620-1-mpe@ellerman.id.au>
References: <20210831135151.886620-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/ptdump: Fix generic ptdump for 64-bit
Message-Id: <163071729257.1779947.7959644631077562368.b4-ty@ellerman.id.au>
Date: Sat, 04 Sep 2021 11:01:32 +1000
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
Cc: nathan@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 31 Aug 2021 23:51:51 +1000, Michael Ellerman wrote:
> Since the conversion to generic ptdump we see crashes on 64-bit:
> 
>   BUG: Unable to handle kernel data access on read at 0xc0eeff7f00000000
>   Faulting instruction address: 0xc00000000045e5fc
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   ...
>   NIP __walk_page_range+0x2bc/0xce0
>   LR  __walk_page_range+0x240/0xce0
>   Call Trace:
>     __walk_page_range+0x240/0xce0 (unreliable)
>     walk_page_range_novma+0x74/0xb0
>     ptdump_walk_pgd+0x98/0x170
>     ptdump_check_wx+0x88/0xd0
>     mark_rodata_ro+0x48/0x80
>     kernel_init+0x74/0x1a0
>     ret_from_kernel_thread+0x5c/0x64
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ptdump: Fix generic ptdump for 64-bit
      https://git.kernel.org/powerpc/c/b14b8b1ed0e15b8f43fba9c25654278a31ee3c2f

cheers
