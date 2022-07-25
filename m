Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB6657FEE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 14:23:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrzj84B62z3cd9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 22:23:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QMXMm72W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrzh94YKpz3c52
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 22:22:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QMXMm72W;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lrzh93WXkz4xD9;
	Mon, 25 Jul 2022 22:22:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658751753;
	bh=5Fl0RHlEgXuBE2WPauMEneaFCDwh//pAstIMXhcK4IQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QMXMm72WGBtS6Qf4YunmB9MFolK45aDmMEUUmEeRDcGMBGvAJ3FbBz/aN/D5KIg2X
	 s0SoQinKa2Cd1l4joa0rdtgPew9uj87CfgyTzuo7MZ/UHAvsBGtVjiFBs5fd3IqCgO
	 tOKpb8Vec5dLh1oGpqV51mIEsqxu7CKR1WGaviPraHvsyVLzwqXx017DKYWMZQPfwq
	 /OUuwgwhBrUDBkfAGVyRwcgg8U6HHx/ypEE75o+nAdG+gzAsxEpe2Zl14iSyCyj1/a
	 dV+OFBRViom+W2CX2faWctnMv2lPgqniUxqtTGcvgBUGqybQitIKSOYnzMh7idmkHL
	 D7S7jZnKO2Q4g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linuxppc-dev@lists.ozlabs.org, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in
 archrandom.h
In-Reply-To: <20220723214537.2054208-2-yury.norov@gmail.com>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com>
Date: Mon, 25 Jul 2022 22:22:33 +1000
Message-ID: <87tu75bcvq.fsf@mpe.ellerman.id.au>
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
Cc: Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yury Norov <yury.norov@gmail.com> writes:
> archrandom.h includes <asm/machdep.h> to refer ppc_md. This causes
> circular header dependency, if generic nodemask.h  includes random.h:
>
> In file included from include/linux/cred.h:16,
>                  from include/linux/seq_file.h:13,
>                  from arch/powerpc/include/asm/machdep.h:6,
>                  from arch/powerpc/include/asm/archrandom.h:5,
>                  from include/linux/random.h:109,
>                  from include/linux/nodemask.h:97,
>                  from include/linux/list_lru.h:12,
>                  from include/linux/fs.h:13,
>                  from include/linux/compat.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:12:
> include/linux/sched.h:1203:9: error: unknown type name 'nodemask_t'
>  1203 |         nodemask_t                      mems_allowed;
>       |         ^~~~~~~~~~
>
> Fix it by removing <asm/machdep.h> dependency from archrandom.h
>
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/powerpc/include/asm/archrandom.h |  9 +--------
>  arch/powerpc/kernel/setup-common.c    | 11 +++++++++++
>  2 files changed, 12 insertions(+), 8 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
