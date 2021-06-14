Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57C3A6641
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 14:07:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3VZ02CMLz30CS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 22:07:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=frBzwAnJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jeyu@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=frBzwAnJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3VYZ3vTVz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 22:06:58 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5B4C611BD;
 Mon, 14 Jun 2021 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623672414;
 bh=Q2MM4OE/VICRfAoB7Alej8C61pteU8OP3UNtKNHFWJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=frBzwAnJ6zHGxnI4UWPXOTUCB87KxBhhiG+0T0rvQX/xBVgtn1hKgCdKqyEoLzk5M
 XX9/xSGDPSWzrgKQ1ZSbNYG45isW7jotLC1aK9yfzSD6qQM4+BRLJ9FrY7Q6pHoJyW
 v/DDpdcNgTMpleWD8rd65cPLspYigpANxiYJpxSaLHlMAIACHgdAAdwm0GiclVavEn
 QLXSFBd08OZmcN3ZerK5Ht9PUzcWuyegBjl5qQtia09yJ8v+fzLDFlDePrm5OoTgSQ
 x6hw30cowSi7PcR3kUpWt6oruoY9yvNzgAt3/JLh7P5h4x+oeVxvtlAH1rKkLrJPBH
 cAnxe0btDbjYw==
Date: Mon, 14 Jun 2021 14:06:50 +0200
From: Jessica Yu <jeyu@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 1/2] module: add elf_check_module_arch for module
 specific elf arch checks
Message-ID: <YMdGWjBOmcstBwOl@p200300cbcf109700df096d564fe976c3.dip0.t-ipconnect.de>
References: <20210611093959.821525-1-npiggin@gmail.com>
 <20210611093959.821525-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210611093959.821525-2-npiggin@gmail.com>
X-OS: Linux p200300cbcf109700df096d564fe976c3.dip0.t-ipconnect.de
 5.12.9-1-default x86_64
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
Cc: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+++ Nicholas Piggin [11/06/21 19:39 +1000]:
>The elf_check_arch() function is used to test usermode binaries, but
>kernel modules may have more specific requirements. powerpc would like
>to test for ABI version compatibility.
>
>Add an arch-overridable function elf_check_module_arch() that defaults
>to elf_check_arch() and use it in elf_validity_check().
>
>Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>[np: split patch, added changelog]
>Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>---
> include/linux/moduleloader.h | 5 +++++
> kernel/module.c              | 2 +-
> 2 files changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
>index 9e09d11ffe5b..fdc042a84562 100644
>--- a/include/linux/moduleloader.h
>+++ b/include/linux/moduleloader.h
>@@ -13,6 +13,11 @@
>  * must be implemented by each architecture.
>  */
>
>+// Allow arch to optionally do additional checking of module ELF header
>+#ifndef elf_check_module_arch
>+#define elf_check_module_arch elf_check_arch
>+#endif

Hi Nicholas,

Why not make elf_check_module_arch() consistent with the other
arch-specific functions? Please see module_frob_arch_sections(),
module_{init,exit}_section(), etc in moduleloader.h. That is, they are
all __weak functions that are overridable by arches. We can maybe make
elf_check_module_arch() a weak symbol, available for arches to
override if they want to perform additional elf checks. Then we don't
have to have this one-off #define.

Thanks,

Jessica

>+
> /* Adjust arch-specific sections.  Return 0 on success.  */
> int module_frob_arch_sections(Elf_Ehdr *hdr,
> 			      Elf_Shdr *sechdrs,
>diff --git a/kernel/module.c b/kernel/module.c
>index 7e78dfabca97..7c3f9b7478dc 100644
>--- a/kernel/module.c
>+++ b/kernel/module.c
>@@ -2946,7 +2946,7 @@ static int elf_validity_check(struct load_info *info)
>
> 	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) != 0
> 	    || info->hdr->e_type != ET_REL
>-	    || !elf_check_arch(info->hdr)
>+	    || !elf_check_module_arch(info->hdr)
> 	    || info->hdr->e_shentsize != sizeof(Elf_Shdr))
> 		return -ENOEXEC;
>
>-- 
>2.23.0
>
