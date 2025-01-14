Return-Path: <linuxppc-dev+bounces-5228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD752A10736
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 14:00:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXTkh1qDQz30Hf;
	Wed, 15 Jan 2025 00:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736859628;
	cv=none; b=n0Yu3Q91cIWRCXSGuXJ6jpIqZyIFUcD9jyfToluQRSVdaR5qgvmtHtFEG87nNQ1iIKkJMjdazlEd1Y+b55CecN5n7uZP15ElhYw45v3la4vjeqjZjTLCNfcwi9jYk+Th7+1USjk3i/vgmbVQHajhs2PxV//lqT2r0ghmaLk9PszuOeHUQMsiJcAgahSaMR0Q48Se3i2LfVZidGejOp02nuEKjL2Rq7lWLZG4la/4t9kwbmv3ywqvRtcQYvQfXHWt3d3sRFLLquBePnszmyMFb2LSZup/A7NHDPY6clo94H6NaB/wwejZhNDTpXvB8s74qpotUb5meAYEfvICvU5yZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736859628; c=relaxed/relaxed;
	bh=t59zGz/LVb5yCoIfYwsvWsS2Qsv7D19gdTJySORvJwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTxGM56TP4cP/dkb5JY36DihXgoFH5wYaAZGFAYIaLoWcUId7oRrSUefy15x7FYy7tflIjjl/5TgYHt9OTYyrFiLt59XweWx98wlMjdYjhsLVTEHKyOSjYVKlCr8VIhcyDLUm8rGHdyvzbVxrHuIjwYWBlcxJMHH0ICxLeIreptX0XgFIAcjxXYGSUs0QiYGYWcE5oH28rrT98NrMMughV6fXtrkNX3z6loqTo226kDSR5WuHTqib6XagmUF7wdvMP2bvMFT8VrdzdlICM75B4piXIIiTgriKH8/diM5InSHyEjWEIUgkKinJl5EfuXacS1qQwRmPDQUOKtMGoPzrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hUQMUivY; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hUQMUivY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXTkg06gPz301n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 00:00:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECB405C4CCF;
	Tue, 14 Jan 2025 12:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840EEC4CEE1;
	Tue, 14 Jan 2025 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736859622;
	bh=+UlpBfqj09Ly2utYLljGHX1TZBMJZ1VPjWkhmJ5SGCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hUQMUivYASPw9qQFM/e4VX79K2W9eewh7bfXl0dnO6oUVTGozhNaASX2u5UXt5HMp
	 ihVWBeJTuq6afv//5nQddLokkTETSesMREcqXfUP3FpPn2MaAXCrm0w/AteokjQr4T
	 u3fRLFA9sv+lgmjktrw+x3l4aQnjcqhy7cwuZuS+HPdtFeub36+k4QKzMppTD8xTvf
	 zZIwU0LyNUvPngKAUnNDCk2t6bDr8bb62Cwu1tehiBj7bfw+x6f9jzZAGxbSPZMTmO
	 uwXHp3MTBEl8RC5FJE88MM9DnZuAKiuamVJL5CJPOA/wlLNaPaTB+8eD6Q9dzm4Zvg
	 F2xwMCmvwIbdw==
Date: Tue, 14 Jan 2025 14:00:16 +0100
From: Alexey Gladkov <legion@kernel.org>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Oleg Nesterov <oleg@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
Message-ID: <Z4Zf4MppsrpoPiC1@example.org>
References: <20250113170925.GA392@strace.io>
 <20250113171054.GA589@strace.io>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113171054.GA589@strace.io>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025 at 07:10:54PM +0200, Dmitry V. Levin wrote:
> Bring syscall_set_return_value() in sync with syscall_get_error(),
> and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
> 
> This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
> syscall_set_return_value()").
> 
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> ---
>  arch/powerpc/include/asm/syscall.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 3dd36c5e334a..422d7735ace6 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -82,7 +82,11 @@ static inline void syscall_set_return_value(struct task_struct *task,
>  		 */
>  		if (error) {
>  			regs->ccr |= 0x10000000L;
> -			regs->gpr[3] = error;
> +			/*
> +			 * In case of an error regs->gpr[3] contains
> +			 * a positive ERRORCODE.
> +			 */
> +			regs->gpr[3] = -error;

After this change the syscall_get_error() will return positive value if
the system call failed. Since syscall_get_error() still believes
regs->gpr[3] is still positive in case !trap_is_scv().

Or am I missing something?

It looks like the selftest you mentioned in the commit message doesn't
check the !trap_is_scv() branch.

>  		} else {
>  			regs->ccr &= ~0x10000000L;
>  			regs->gpr[3] = val;
> -- 
> ldv

-- 
Rgrds, legion


