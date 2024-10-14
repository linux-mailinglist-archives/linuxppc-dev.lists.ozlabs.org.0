Return-Path: <linuxppc-dev+bounces-2222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B5299CC14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 15:59:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRzPh1XcNz3brl;
	Tue, 15 Oct 2024 00:59:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728914392;
	cv=none; b=QtcV+Y+NwzlRsrBfB2yH6hbUcMWJKKYslsrufwYoF9tV2gGvMcdG6A1RCys6IMj0sH9iokJMNpALbMyfafW2bLcpbDWfKoWKixNjhFS+5GlCd9NAgw9CWFkEyAmVUMYq5Q3b8qpGLTfblRFRR1i3kFkx3mPRdMmXYXvW+xC3VXts/RiUJ6Gn3c4lMFDh6yJR0X9+EJvwER3qu/vuv/RsbebFOAQNRn2wWxuGIYuHA4thnYW83z7E6gT/zCD7BjpNPeeK7Egfc8a8PoE48OcT9BLOvxgDEXUYPJTm7gP7iAoKuEB+mYk59nJCnkiAKMjryLb4oiAPHkYLcuN/iaYLQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728914392; c=relaxed/relaxed;
	bh=bainTkEeCWDsRFBIDs5P3QfRkaesbkdPSxHY8oKB5XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJKAL1S/7EVDtteFZTTolwTTQMojGZrJI+2Z4oILn8vpDmDVXkqetlh5Eoc9RIs/hCZT0XaFG8+SEDK9/rnSXQNGLp5CpZ5UjK0005IUHwJIelpKfoQdjJekMLALE4TGfiReRWUn09eT6IUTnL1IJDfY5h83NPDwT4Mub1t00C0PxW/lbxQPeC1WNyOjGzo06eWePLpcGzxILja0fdWEXF4X3Mr0Lx5Nc+SIUoeJDajMjZ6RK7+x1nADe4AnARbY4+c91diKgmoykQm3IOPsd6McEgs9TVZOpW0s5QxgmSItW/0v8/CShLsLxZkyTdwc+onhMl6doFwjdsO7QSkWzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NSUyMHM3; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NSUyMHM3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRzPg2145z3brP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 00:59:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CFD0A40EB8;
	Mon, 14 Oct 2024 13:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE44C4CEC3;
	Mon, 14 Oct 2024 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728914388;
	bh=H9P82NUHjzhSG+q03ylKXcErnfke+kcbkRkAXEXtqss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NSUyMHM312ILKPLeoDrkDB5PqqmMcQXJGNf/rrrQ0VjEAD4ebiRUhrIyozWQ2eGPN
	 K4ege7WiwKlk46bvSDbx03kr9XUeKzrIYI4sHwciGOxO0WMzPdKSJ6ENhrZWuDWWeY
	 GLi+EB0emlojuZERgAdKWUPgzjI84Bo+t6HxU4mNonaA5w49WHQf50KtXnMSmKMsWX
	 VOXG+zGYmKJPumw9ypG4H8TIPF5FA1wC7F43lKOpZWuVLy+l+3UHOeD0LqDjmxV0Su
	 7VJ4wdZCBX9uUsoWFr9xRbWSzq4LDNiwWQS7Z9d2YGbMNLUObt8UqFKWlzg4mwT3bi
	 W27SYygaZmeJQ==
Date: Mon, 14 Oct 2024 14:59:39 +0100
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
Subject: Re: [PATCH 3/9] arm64: vdso: Remove timekeeper include
Message-ID: <20241014135939.GC17505@willie-the-truck>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
 <20241010-vdso-generic-arch_update_vsyscall-v1-3-7fe5a3ea4382@linutronix.de>
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
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-3-7fe5a3ea4382@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 05:44:46PM +0200, Thomas Weiﬂschuh wrote:
> Since the generic VDSO clock mode storage is used, this header file is
> unused and can be removed.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/kernel/vdso.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
> index 706c9c3a7a50a4574e77da296e9c83e1e2a9f5ab..8ef20c16bc482e92de8098d55000c9999b89830e 100644
> --- a/arch/arm64/kernel/vdso.c
> +++ b/arch/arm64/kernel/vdso.c
> @@ -19,7 +19,6 @@
>  #include <linux/signal.h>
>  #include <linux/slab.h>
>  #include <linux/time_namespace.h>
> -#include <linux/timekeeper_internal.h>
>  #include <linux/vmalloc.h>
>  #include <vdso/datapage.h>
>  #include <vdso/helpers.h>

Acked-by: Will Deacon <will@kernel.org>

Will

