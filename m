Return-Path: <linuxppc-dev+bounces-2221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D4899CC10
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 15:59:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRzPB028mz3bg4;
	Tue, 15 Oct 2024 00:59:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728914365;
	cv=none; b=IGintzk2jCzuybqTYNDz1GEv4fEMIP8wiFXm2qVI+Xi8YeYknfPfBqzTEdmvL2lRcFgkmLlSznOhzA65Iw2dltp6sHt+JaGFTC6lAWEx+anHzL5gg24oWMFt3Y56QrwlPnjBqeCAbBR9VnikqZhgs+fY85wxkg+R42pZXcUyGYyO9XeRcYk0SeUV46Sk5XmAiXQwESAk+shpu2IUwcNi0ZM17Hp9jHMpEBGhT0pf/q/H/kzzhJ7VpdVPzw5wkf1OU0IFbrKo8G+jOeCo9jSy83T6JBKsUH06u4o8ti+04btsRvWWepELIAj+MpaxpdZY2EnqpeRF6t39dbXEAk5tDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728914365; c=relaxed/relaxed;
	bh=aHmf9x1xTr9gnp+lxJ4TmE/7vn8iOkeu0LljRA1wl0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9iyarkuHWYcE9xZgaqAuEsLS4GuzOj+DyxqOsXnupm12pHkqGAM+7hn0LlwoVH6/5uzq55gW5GFjxqbO6Ed7kcMhal2gWu13ZxLX7cZCZ8fKDTVf1g6Gvd9Yep7FOki5n8lRDiNS4y78v+f2d96jUN+GIu1/+VNuVraHmNksNjb8oljIVvJ60ZRK7eF76t/Pt3AXXyP9VSISIfwSb9vPg6F/lzpmFo8F0SSgpt+AENBOQ1NvF5ymZshoeo2pqX3r0wgyvDGi0DWXk5Xl/JeZWlKRFBxSHAWBa9OaBTaOxZHaLWQly4XbRUoFeTmsfUrj6H6mGFUE3/svNqLkLxvvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XLiQSRny; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XLiQSRny;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRzP90R8Dz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 00:59:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C15BA41049;
	Mon, 14 Oct 2024 13:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93215C4CEC3;
	Mon, 14 Oct 2024 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728914361;
	bh=OFpg+lOM6lZXKg41f2jamDsHYXkihHB1FSkYSOpNp7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLiQSRnyrpGh3KeRNqwVQin1xwWw8rjBh6YtiIP+ymVkvW8PlGuD4VtJIxOmpdA7B
	 kLkCXSdWO7/FV7LDmeiT3sDuHbEWfE+uDkzGg9u0jQtgPxwbFMt+IYVBxBrs8U2LC1
	 9Nadzv3qkoFqNSpWKUSyaxfFzYjt/ZSWSsyITg1OKm1SPfPzUCVpR3eToqy/TZ6K43
	 5XWZnSHQHQ7upIBccE716ZkFnzDKlzLGLucKHqBxRdpjzBny2jaw725EkRJ1uOMeI1
	 0f+RlmDrO9MpoT9zo3HWfgQn1fmyMap2Almoz8XozNC3KcwbCpAd0AZ4ckWWNQjHHO
	 bhyzWaJbPd0OQ==
Date: Mon, 14 Oct 2024 14:59:12 +0100
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/9] vdso: Remove timekeeper argument of
 __arch_update_vsyscall()
Message-ID: <20241014135911.GB17505@willie-the-truck>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
 <20241010-vdso-generic-arch_update_vsyscall-v1-1-7fe5a3ea4382@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-1-7fe5a3ea4382@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 05:44:44PM +0200, Thomas Weiﬂschuh wrote:
> No implementation of this hook uses the passed in timekeeper anymore.
> 
> This avoids including a non-VDSO header while building the VDSO,
> which can lead to compilation errors.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/include/asm/vdso/vsyscall.h | 3 +--
>  include/asm-generic/vdso/vsyscall.h    | 3 +--
>  kernel/time/vsyscall.c                 | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

