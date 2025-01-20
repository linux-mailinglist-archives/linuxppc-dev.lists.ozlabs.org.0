Return-Path: <linuxppc-dev+bounces-5426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 948DFA17448
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 22:48:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcP9D50Wsz2yYJ;
	Tue, 21 Jan 2025 08:48:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737409712;
	cv=none; b=hh9Q12Ca3dcbzvuy9sVfzOq+3RyX/lU7r0F6HvmcDnx+Fi+uyS/g7rX2E28TaQ7fDzndxZno+JGDR/DnLWJbu2jBAUKG7jXpIoGDsAUzdEQ9uA9Y3d2sFfoiLRVSJYbCNX3UIHGqaSLgcZ9B+Gb0BdNJro/fEuTBJ/LfVX25M4g9QN5ye4v0yOe6Se0Uhos4EEw9T5iNNIzPW51WPqAqNYXrxjOY9gxjttO4w5iKUum+/ctzeRQo4/4U05ItL4vpjUpOzg1x8DUtDTlLB/QoTnzz1DVE1lQFLpbJsK9Rh+AuMrgbP4bXpovJZYiT5qKW/8zpjjj0nOiAoajxO8qFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737409712; c=relaxed/relaxed;
	bh=s4fWueicN30uzSJ6/tLCrkBtP5IUh4iqac2TI55ULfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+FnfjdzLBuEzxP+BHANEMNQUIL6QNvXwgbSklcVRW1vrr0KFMcFte8ye0uDtAiAc8NWbJPaFHOsuXVno8h8VzFx2PXjpqi4xtSPKT6D/Ax1R9z1eG2J2yjBWN0alf660ejdG/3dvwyq1CqPJXGObB7pB2UvdwtWnnQZ/Je15wvKp/M4Sosac0xX0CZhgdFpMJFFD4fkQ5xg2u5qg4OKmf9Qlu9XUsBeA7I8DmX6pZeLRVRQSfOSYYNfepzrRTcHIDZl51a91Q04dmgaeBsfijQBx2T7rIpMzf40PfFR+PwZvI1Q5AOaDuCcFA9jtQqA+Tp6ZRnT8NqjCqkv+icCJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ul7c/xwL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ul7c/xwL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcP9C6tbnz2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 08:48:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13B4CA40589;
	Mon, 20 Jan 2025 21:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B029C4CEDD;
	Mon, 20 Jan 2025 21:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737409708;
	bh=KJBGFuDnQEzeIGfx6nk02kCtmyMiS+ukeSEcCPa1o2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ul7c/xwLDHY/rXiymPqGfvNNH/EQK/VE6tlmlLiHLAKWHy8qi26cYVItN7x8jsjLl
	 tY+N12xvlQuU9bhlpyq6wczQp9MZ6rsfdqwEv2F2U4cVIVwS+XcKlk38vYgQVBz2cp
	 ek/HRgkUSGvwVdNFUhjlsd4mn/byqUVr470aPlH1+5nRZ0Idg0D3GbUwDZBVYKCGyT
	 RHKWUVC4dUNCGhNsLqqvHg+ljDnn6FR5Ik8OyWbbib+8GfWBMdZfrFoUjXutaJnRd/
	 dXKHGlYRH2Cr3T0OuNiceU7OhgcnnTb5lg6m87Xhirj1Ma8N8Mg2MDhBk4giQZgRez
	 WvNCUpJ7DsDTA==
Date: Mon, 20 Jan 2025 13:48:25 -0800
From: Kees Cook <kees@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/4] seccomp/mips: change syscall_trace_enter() to use
 secure_computing()
Message-ID: <202501201344.E7FBB164@keescook>
References: <20250120134409.GA21241@redhat.com>
 <20250120134445.GA21268@redhat.com>
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
In-Reply-To: <20250120134445.GA21268@redhat.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 02:44:45PM +0100, Oleg Nesterov wrote:
> arch/mips/Kconfig selects HAVE_ARCH_SECCOMP_FILTER so syscall_trace_enter()
> can just use __secure_computing(NULL) and rely on populate_seccomp_data(sd)
> and "sd == NULL" checks in __secure_computing(sd) paths.
> 
> With the change above syscall_trace_enter() can just use secure_computing()
> and avoid #ifdef + test_thread_flag(TIF_SECCOMP). CONFIG_GENERIC_ENTRY is
> not defined, so test_syscall_work(SECCOMP) will check TIF_SECCOMP.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  arch/mips/kernel/ptrace.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
> index 61503a36067e..f7107479c7fa 100644
> --- a/arch/mips/kernel/ptrace.c
> +++ b/arch/mips/kernel/ptrace.c
> @@ -1326,24 +1326,8 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
>  			return -1;
>  	}
>  
> -#ifdef CONFIG_SECCOMP
> -	if (unlikely(test_thread_flag(TIF_SECCOMP))) {

Yup, this test works out the same as what secure_computing() does.

> -		int ret, i;
> -		struct seccomp_data sd;
> -		unsigned long args[6];
> -
> -		sd.nr = current_thread_info()->syscall;

This matches MIPS's syscall_get_nr() in populate_seccomp_data().

> -		sd.arch = syscall_get_arch(current);
> -		syscall_get_arguments(current, regs, args);
> -		for (i = 0; i < 6; i++)
> -			sd.args[i] = args[i];
> -		sd.instruction_pointer = KSTK_EIP(current);

Rest matches the rest of populate_seccomp_data().

> -
> -		ret = __secure_computing(&sd);
> -		if (ret == -1)
> -			return ret;
> -	}
> -#endif
> +	if (secure_computing())
> +		return -1;
>  
>  	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
>  		trace_sys_enter(regs, regs->regs[2]);
> -- 

So this check out logically from what I can see. I can build test it,
but I don't have MIPS emulation set up. I'd love an Ack from a MIPS
maintainer...

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

