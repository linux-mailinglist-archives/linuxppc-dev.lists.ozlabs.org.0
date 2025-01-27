Return-Path: <linuxppc-dev+bounces-5606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6D8A1DC97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 20:18:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhdVJ3TStz309v;
	Tue, 28 Jan 2025 06:18:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738005480;
	cv=none; b=cSyJeBlvSQN1C76bRng0gOlLyK9FodmBU1dck662gzh6Ddx/pmcR0TEz8sL4FuQxewYbIBRPRJE7RMFk8XA9+Cjf0+p8z5wltkTOsy8pTJz8mGYfjc8McaFnV0CL3J+EixZkydloxvDMY+/sUDqAXG/Jzu0yu5+cze46bhpTfVL4WAr2TyRAqMo0MF0VqpaTMCou0w/DTdDRvPBmTPZQ9OuN8ebDOw5sHfthcApzJ/h6D+IP5nqKjcFUTeBZZ+k00SSrPNfMK4lX3Ut7Y+53IkoIp0qZ36VaHLGl4cVq9328q9dR/CEtaJ1u9BUQ5lBTdlGHHtPnqoONGjr9I+fSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738005480; c=relaxed/relaxed;
	bh=6j26Kg8rbpe4f2Vo4rcSxwWteTAVOlI+xceZvIn0owk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aH2toidx4070o1pOAfryCqGGgDJY9If7m+IPO9Qfq1eIMgfWPVlpbnvWgVUssf5xlbngx5Vjj9sSnoFJsN3KZx0E1ijMo5+eZ2Eqfn60BhuUY1T6AVpunyEDQSRJrdrk41MyzIQwO0paLv3W6eiPuLFGZ9EW7Vta2jxlWRGvF94mAmzRWM5WVe/Ok1naUZulVaYQvqQETl6GL8rGPUqcjkpBpYJjjvc8hFpV5gq53vuW2fXx7XM7ylSfaFHRzwfbtzVL8bm5EUt95kGIhNdJ/8RA/7wpGzZ/VXPeTU21lqlp0G82VC+QVFp9i+lvbCLYQMd+5GqIKusluHV8Xm1j0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lFxj5rfm; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lFxj5rfm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhdVH5lKYz301n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 06:17:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0E75A4186F;
	Mon, 27 Jan 2025 19:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86628C4CED2;
	Mon, 27 Jan 2025 19:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005476;
	bh=r9YoCzMn+S7Rp21hkZ42NQlHWCOwaqNEe0i3f9P/rhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFxj5rfm0IvZCUg/tO+0gBKuTznDKVK80+04mTG8YN1sFlvh2MJwAuIZMiTjG9A6i
	 Zj3XKiNoNTB3HjMLBZfUs/wmfkT0rscnJ518VQLQjH6La8oJDOjP0V+WgMTgys1SZR
	 jiPgowA8IKkJUH0X7Sqta7HcPXUC40RQmwa+6vHSadAxGbi7LpSQG0i83yFSsj6e09
	 vp+dwfJiiCBLQdkpMVTuZ3no03/rXMX42JsDnDG7o4aguNZutfDGGdO9mG9fvXoAIY
	 1/g3PpUQh2x1t2aEEYavbMnvun0Md/mwcEmOfVW860NZYefJiCQUke9jFTVpD/gtxU
	 JPFv+07PAiAtw==
Date: Mon, 27 Jan 2025 11:17:52 -0800
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
Message-ID: <202501271117.E00B5250@keescook>
References: <20250120134409.GA21241@redhat.com>
 <20250120134452.GA21275@redhat.com>
 <202501201353.168E6AAC8@keescook>
 <20250121143038.GB3422@redhat.com>
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
In-Reply-To: <20250121143038.GB3422@redhat.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 21, 2025 at 03:30:39PM +0100, Oleg Nesterov wrote:
> How about
> 
> 	__secure_computing()
> 	{
> 		return secure_computing_strict(syscall_get_nr(...));
> 	}
> 
> in the "#ifndef CONFIG_HAVE_ARCH_SECCOMP_FILTER" section near
> secure_computing_strict() in kernel/seccomp.c ?

Yeah, that should be good.

-- 
Kees Cook

