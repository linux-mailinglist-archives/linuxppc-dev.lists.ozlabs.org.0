Return-Path: <linuxppc-dev+bounces-5427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB8A1745B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 22:54:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcPJK1Gx7z2yZS;
	Tue, 21 Jan 2025 08:54:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737410081;
	cv=none; b=TY8jpoY/Xy/mlc6Gxoo0Uw39VcWKL5J7zAS0g2PJDjMiwtPeFRIZ8GclPmCGtCjA4crgvxmUcgqCBeSrzhDnQjnKsa47QDR3vkipjCWxJaUeR2SsqrQKE2u4T65xIeen39BlUDjbQR1EpJdO42XI1DUjSUykvW3uVChkwrD1iqra0NSggx2D5Blj0CFoeLWFFJqlO0Ch7IkwkygroUTQmK6znElmM6XoT9WaiO/vXEryoZSVQ+2Dt6gosu4yqrbm3UnF6iqvzaIfJsTReWtFChEQ+N4R0jlgQvrAKXTcab5OQ45YQnsaZbzF431JvddhhRO8Iu0jMyF8MR39Y8WA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737410081; c=relaxed/relaxed;
	bh=U6tdY+69FuZbw9iyUn7F4yRCCh81XRh3gWBfZo6xhVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loCddpu19coJHfukGJLCZp00hOwCyW1oNUq/IR3iXugL19qxIs+ZCM64cMu2NncoMxA606wa6++W55uYW1Ye0jnp4+leznUcleCUJk2ZyhMyaHvWXpgzy41DQn8miCMV1P2vEX9EbwKq5jWvaAYWtpa+BwATt5QfTMVO8zeFycZi12Kk4LV7i6cdi0e+UUspwJlI/0eWnKlZ23OLD97gEYbFNV3VFOgkzRQTdXZbwYOQ/owvR69AEdWXY9CtvbPNJGqSZipMfdT4Ikz3f8xoW2eEQJGs/b0OVIFtzMBeAdxWUcF+q0wr8tTQzvHbONE33jpX47xor/Wd5Tt5S4MrBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R4lq3qPj; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R4lq3qPj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcPJJ3lm2z2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 08:54:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A8ADDA405AD;
	Mon, 20 Jan 2025 21:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F4BC4CEE1;
	Mon, 20 Jan 2025 21:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737410078;
	bh=FTNVSUbh2PWTc4zJ8DnJqkFLz/kXMkSs1jq7XJrn7yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4lq3qPjkaty+B9MZVUJMBEtN18EE/1NYlWpZrSPIOVz9PwI+vmjdGMRFscMEjKtk
	 eoGuNLy988ukdqRItKpN1JIBfjgxAhW5YrVwHZ17ajr7c2PIOTXTlShTJjvLl8Uwbq
	 OWQgorVgP+nXecpsnVtYxlUiYl3uinWxLqn1tgeiPV3HTlutvrcetE3VAGK8Kvzlsp
	 pV+G4TaI9gnJwHBUx6l/wPoqyUSpn/62NGn1sl+1AJ83TpFurVnWW2oXm0nhg3x2fE
	 opqAwfhGizhqXtJzUcD7cHOIQrHT+pAXZ0OzcLipktjANtAq9aywGBuq4XJ3HK+y/R
	 UMa67C8A7+vYA==
Date: Mon, 20 Jan 2025 13:54:35 -0800
From: Kees Cook <kees@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] seccomp: kill the dead code in the
 !CONFIG_HAVE_ARCH_SECCOMP_FILTER version of __secure_computing()
Message-ID: <202501201353.168E6AAC8@keescook>
References: <20250120134409.GA21241@redhat.com>
 <20250120134452.GA21275@redhat.com>
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
In-Reply-To: <20250120134452.GA21275@redhat.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 02:44:52PM +0100, Oleg Nesterov wrote:
> Depending on CONFIG_HAVE_ARCH_SECCOMP_FILTER, __secure_computing(NULL)
> will crash or not, this is not consistent/safe.

Right now this never happens because there are no callers.

> Fortunately, if CONFIG_HAVE_ARCH_SECCOMP_FILTER=n, __secure_computing()
> has no callers, these architectures use secure_computing_strict().

As you say here.

> Also, after the previous change __secure_computing(sd) is always called
> with sd == NULL, so it is clear that we can remove the code which makes
> no sense.

However, after this change, if someone were to *add* a caller, it would
bypass strict mode. Instead of "return 0", it seems like it'd be better
to remove the function entirely (and maybe add a comment about calling
secure_computing_strict() directly)?

> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  include/linux/seccomp.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
> index e45531455d3b..e01dfe57a884 100644
> --- a/include/linux/seccomp.h
> +++ b/include/linux/seccomp.h
> @@ -32,11 +32,7 @@ static inline int secure_computing(void)
>  }
>  #else
>  extern void secure_computing_strict(int this_syscall);
> -static inline int __secure_computing(const struct seccomp_data *sd)
> -{
> -	secure_computing_strict(sd->nr);
> -	return 0;
> -}
> +static inline int __secure_computing(const struct seccomp_data *sd) { return 0; }
>  #endif
>  
>  extern long prctl_get_seccomp(void);
> -- 
> 2.25.1.362.g51ebf55
> 

-- 
Kees Cook

