Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8E52B72A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 00:51:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbN5B31ZjzDqZp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 10:51:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbMzH6HYWzDqZ1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 10:46:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=r9lvxBwK; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbMzF2x60z9sPB;
 Wed, 18 Nov 2020 10:46:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605656793;
 bh=oMbUvmEwIV1erVGEeTb/ximWdVDTiuB2dVzFoifZbmA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=r9lvxBwKL2lvcH3aO/YmBX6QKSfdhqSdvs2+jYAXZfQGfMyi8gvbWF/wNKIqDt5+f
 UZLekQp2pC1C/BlLu7cGtTAGyLV0Y1dyTfJ2Ylq9WhvgIT4OemuO7rhB9CivqX+3OW
 xRVxWCN8/IDpFFNug+FQ7O82Uh9ZwS448JXg+ybVWjJx//manM1a+sANmvznk9bOwq
 o3vuyuq4WjSQ/9yUNsiZK0WPHTMYjz/Ox4qw554fIIiaT3fqHC6eJUFtUFKczetdCl
 4pv4/hsgn5Oi5gF6zkKO2ShBesne4UeWvEZkaDgZjqTDFwVHIWbAfszyu20a9p8lI0
 QjqeN8fhTy7yQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 3/3] powerpc: fix -Wimplicit-fallthrough
In-Reply-To: <20201116043532.4032932-4-ndesaulniers@google.com>
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-4-ndesaulniers@google.com>
Date: Wed, 18 Nov 2020 10:46:32 +1100
Message-ID: <87lfez35t3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Desaulniers <ndesaulniers@google.com> writes:
> The "fallthrough" pseudo-keyword was added as a portable way to denote
> intentional fallthrough. Clang will still warn on cases where there is a
> fallthrough to an immediate break. Add explicit breaks for those cases.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/236
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/powerpc/kernel/prom_init.c | 1 +
>  arch/powerpc/kernel/uprobes.c   | 1 +
>  arch/powerpc/perf/imc-pmu.c     | 1 +
>  3 files changed, 3 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
