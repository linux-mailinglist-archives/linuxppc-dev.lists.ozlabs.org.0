Return-Path: <linuxppc-dev+bounces-14134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E4C54531
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 21:03:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6Dqh2YkDz2xSX;
	Thu, 13 Nov 2025 07:03:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762977824;
	cv=none; b=M0elsiGYy5doISAUMCl64o5rKfBC4dhZiL7dfuBGC8X9jx49DGz7Q9oicAsL40Ppx2/LwtqrMYThpu51mR2Nqs0BRuRgKG9Y7dF2dYNEe9m11CZn8HNu9MFklHwlZfXgvw5+e2yMiGflgIS3g6RaZfuqIYgngxZ9BicIeJbmeEmO0FcvMP9AtGbhD8UoN9u1zT8dL2/uy1xwYroesysU6gLLEaRZHMAqSwhgPagAUr3lGlaqWW/AQUJox+JKhmKJiO5VZOoz9dhL+rUeii7TwAZGXHJgMBdYw0pH4qCEifTyIOfUwVrTD0JYQQZLh8sSgo5Rumh+CHly7oien2KdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762977824; c=relaxed/relaxed;
	bh=QL+GJWwmj4P45QdsQO6njChXM81ChPT6DFU8SBey9E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBX2ARQEsOeqD1CHvhp7owi/4LjQkQtFceLVBEWICSXjHmyUhKGdFH83hDZwVFn/Es4QJSUQhYbs33IsLyoh5Yw3bIWNCSNB4HgWcFCqJ8NSE7ud+rCFEgxdyRQ14PLogb8VPxWobhPANpy/6Rzo+QMzW+vQ7iYVS36uvRSZEF0L/31+P/WY63Tlc0LXmC6lWwZlh+Wy8wdBprn5na1HJ4pLXpaf+e8fmwGHSr2JicHP2u6zHosmt8JxJaKKkGYfVn8/u8Z0U5GGb6OMgFhDJflTtbVo4yZJIniPQJNp79v/q5LbnT43+/Bm+BtR/AWzKltrlusGPLIZdT4PBsgj2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ccIrzsBu; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ccIrzsBu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6Dqg54RNz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 07:03:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E7F2445B7;
	Wed, 12 Nov 2025 20:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB406C16AAE;
	Wed, 12 Nov 2025 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977821;
	bh=Krdas9AzGSECOCFA2WfUlzdX75hmmwim4vrl3G2LHP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccIrzsBu2sfaHL8EwE2+XzXAm+mSMhbBgAeiXJyPaOGTProGPgOQ81EjsiD/vkuJ4
	 QzAsAniJY1RexfM/F66rsQeFRzK77ivQC547WLrUhU8Q9ShngnZe61HJpkojC3tPRa
	 frNdTBKI3g29VGiHlHHpmGxYVkdiDL5WEO8y7NyaWL1P3XoB2S0lAlUQPcJ8z+K2b5
	 16pXiKl/FScrxzrW3onwGDarm71eUAIrMkkdyfOQItHCaDiHooPRUBdvhi+DVScKO0
	 ZuMkWCnzSMioRC9My5WYdAJlMCScrRC+w9btXbUu1NxxmHhehoQjfNJ34KdLNchkTv
	 Gqbh3kbJ/tMzQ==
Date: Wed, 12 Nov 2025 20:56:04 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 02/10] init: deduplicate cc-can-link.sh invocations
Message-ID: <aRTmVAcGpqcyjU26@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 03:05:17PM +0200, Thomas Weiﬂschuh wrote:
> The command to invoke scripts/cc-can-link.sh is very long and new usages
> are about to be added.
> 
> Add a helper variable to make the code easier to read and maintain.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  init/Kconfig            | 4 ++--
>  scripts/Kconfig.include | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

