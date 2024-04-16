Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E198A7544
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 22:12:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=cjZZt45z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJwDg6mQmz3vYh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 06:12:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=cjZZt45z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJwCy4fl7z3cPm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 06:11:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7AFA2CE113D;
	Tue, 16 Apr 2024 20:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947A5C3277B;
	Tue, 16 Apr 2024 20:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1713298281;
	bh=vH93qz9QypmdrxTbfPnlMTMImwmxiAcyrlntd9a+0o0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cjZZt45zzFNVvRVLLkIaQ69+5t4zoCNBaDZANtTYyKIzGiPWX0wB/I6nLAB1CxgDP
	 LyDiexeqmuMVOpNvYwYTEYfDw/QqbKIpHEnEylNsfU0Nr6S5UXmnG60k+iAegOG4s6
	 wUvuXfyB5LNQoRUHmF5B7VHXvfaARZL14SvNsgdE=
Date: Tue, 16 Apr 2024 13:11:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Maxwell Bland <mbland@motorola.com>
Subject: Re: [PATCH 5/5] ptdump: add state parameter for non-leaf callback
Message-Id: <20240416131120.a801ff03a6d0bbec0e9151c8@linux-foundation.org>
In-Reply-To: <20240416122254.868007168-6-mbland@motorola.com>
References: <20240416122254.868007168-1-mbland@motorola.com>
	<20240416122254.868007168-6-mbland@motorola.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-s390@vger.kernel.org, Yu Chien Peter Lin <peterlin@andestech.com>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.i
 nfradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Song Shuai <suagrfillet@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Apr 2024 14:51:32 -0500 Maxwell Bland <mbland@motorola.com> wrote:

> ptdump can now note non-leaf descriptor entries, a useful addition for
> debugging table descriptor permissions when working on related code
> 
> Signed-off-by: Maxwell Bland <mbland@motorola.com>
> ---
>  arch/arm64/mm/ptdump.c          |  6 ++++--
>  arch/powerpc/mm/ptdump/ptdump.c |  2 ++
>  arch/riscv/mm/ptdump.c          |  6 ++++--
>  arch/s390/mm/dump_pagetables.c  |  6 ++++--
>  arch/x86/mm/dump_pagetables.c   |  3 ++-
>  include/linux/ptdump.h          |  1 +
>  mm/ptdump.c                     | 13 +++++++++++++
>  7 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index 796231a4fd63..1a6f4a3513e5 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -299,7 +299,8 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
>  			.range = (struct ptdump_range[]){
>  				{info->base_addr, end},
>  				{0, 0}
> -			}
> +			},
> +			.note_non_leaf = false
>  		}

It would be acceptable to omit all of these and rely upon the runtime
zeroing which the compiler will emit.

Documentation/arch/arm64/ptdump.rst might need updating.

Please include sample output in the changelog so we can better
understand the user's view of this change.

