Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9526A0572
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 10:56:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMpMC4Jh8z3cP0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 20:56:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rWHav/x5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rWHav/x5;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMpKF1T0Rz3bXP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 20:54:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8B881B81993;
	Thu, 23 Feb 2023 09:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4C9C433EF;
	Thu, 23 Feb 2023 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677146077;
	bh=tzlp0We19KInWirh8J/R3X53YBq02wyMg36MmcYZucg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWHav/x5svyAQ2Kiupi0qIMdQsQIRNHbVu7V7cvhIG+FB2Ab9YOZbznomFKNVRU5c
	 dJGp13n1+5gUWl60lh8PHfPhiLUUzRx/jkZWhR2U0IJ4QwSkA71R1sHDBM1LDZoGSQ
	 K8nl4u6N+AgQlSy2sBaBWuu95IVveXkXHttSWa9s=
Date: Thu, 23 Feb 2023 10:54:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tom Saeger <tom.saeger@oracle.com>
Subject: Re: [PATCH 6.1 v2 0/7] Backport Build ID fixes
Message-ID: <Y/c32nwwcfmqZqbc@kroah.com>
References: <20230210-tsaeger-upstream-linux-6-1-y-v2-0-3689d04e29fc@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210-tsaeger-upstream-linux-6-1-y-v2-0-3689d04e29fc@oracle.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Sasha Levin <sashal@kernel.org>, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Dennis Gilmore <dennis@ausil.us>, Naresh Kamboju <naresh.kamboju@linaro.org>, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 10, 2023 at 01:17:15PM -0700, Tom Saeger wrote:
> Keep 6.1 in-sync with Build ID fixes.
> 
> I've build tested this on {x86_64, arm64, riscv, powerpc, s390, sh}.
> 
> Changes for v2:
> - include 1/7 2348e6bf4421 ("riscv: remove special treatment for the link order of head.o")
> - include 2/7 994b7ac1697b ("arm64: remove special treatment for the link order of head.o")
> - rebase  7/7 c1c551bebf92 ("sh: define RUNTIME_DISCARD_EXIT") from upstream
> 
> Previous threads:
> [1] https://lore.kernel.org/all/cover.1674876902.git.tom.saeger@oracle.com/
> [2] https://lore.kernel.org/all/3df32572ec7016e783d37e185f88495831671f5d.1671143628.git.tom.saeger@oracle.com/
> [3] https://lore.kernel.org/all/cover.1670358255.git.tom.saeger@oracle.com/
> 
> Signed-off-by: Tom Saeger <tom.saeger@oracle.com>
> ---
> Jisheng Zhang (1):
>       riscv: remove special treatment for the link order of head.o
> 
> Masahiro Yamada (3):
>       arm64: remove special treatment for the link order of head.o
>       arch: fix broken BuildID for arm64 and riscv
>       s390: define RUNTIME_DISCARD_EXIT to fix link error with GNU ld < 2.36
> 
> Michael Ellerman (2):
>       powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT
>       powerpc/vmlinux.lds: Don't discard .rela* for relocatable builds
> 
> Tom Saeger (1):
>       sh: define RUNTIME_DISCARD_EXIT
> 
>  arch/powerpc/kernel/vmlinux.lds.S | 6 +++++-
>  arch/s390/kernel/vmlinux.lds.S    | 2 ++
>  arch/sh/kernel/vmlinux.lds.S      | 1 +
>  include/asm-generic/vmlinux.lds.h | 5 +++++
>  scripts/head-object-list.txt      | 2 --
>  5 files changed, 13 insertions(+), 3 deletions(-)
> ---
> base-commit: d60c95efffe84428e3611431bf688f50bfc13f4e
> change-id: 20230210-tsaeger-upstream-linux-6-1-y-06c93fbe5bc8

Now queued up, thanks.

greg k-h
