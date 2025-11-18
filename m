Return-Path: <linuxppc-dev+bounces-14307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE2EC6AE55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 18:19:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9rvJ3Jprz2yvH;
	Wed, 19 Nov 2025 04:19:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763486364;
	cv=none; b=MwQ8Q7HU78TLW5LN42snMaJ1omjBUt1gkgrOHF7oQDclxz0XhIE/gC2t2hziZJ6XNLvv93WzXFh73wKRJzohvBXNojxKsUVCkeblbrZ2X3m+dommrRwOiU5M9S1aaem1Toz+zt0kmmXIYdukV+DU7QII+ht8rUfv+2BQ/0dEbGSkW4iP0yo1DETivZfHjumpXNY2Hg6hZXx/r6qP3wxDUVoZXDrgDU9CU+8YkTQoXCC4FNhGX4X0e1bl9rCk0iTc1mT/14tfttrw2NksnWX1YDsVo5CICeaKUyLu8Rfj1gnPU58lcjL0zO1C4FKjWbtTfrN93cQ0F1So9civ8o6ODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763486364; c=relaxed/relaxed;
	bh=bP7IS4BNaU4htgSTSaOq9yg1qieTaZzZOWRZt7CyTqI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=canzIavohY5YpxfjVBZAUucE0qWQJ7H2PhWS566H6WJN3Pvb0xFdJsaAx5zZDHQTewb+dAwF0RUUB3Zwdmpq0KWnKITKLV2mdD+5PLN1fugk3VEd3CLuwmaWUIUt2QGciGwK9a91AC5rVswo8aRfO9MS3ELcgB6auTRFVrJyvS3FfTaAR4RQrz8/ae0StO31QnW0pWzVAh7kaEv1CesS2Grl3xzavdddtYi4l42PxL9jxPvQlKvKTKrugcQTrqFVABh7E/bqMHnH6c4UYbnVDeiMIp81UsVK0cqX++jgB0SRr9Q8IEJD+j2Fo1z2qc+G2adchHO/tqJG2DVQZJjP4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=Yx2WBjr0; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=Yx2WBjr0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9rvF5F66z2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 04:19:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bP7IS4BNaU4htgSTSaOq9yg1qieTaZzZOWRZt7CyTqI=; b=Yx2WBjr03mdDSpA89fUq2JlJQP
	bV1AmC54RbdHbFNLvuflIdEng9WJPc7MZ/uFw/aa2h8nPYo838w+OA8f0EnxtXBDi81fb4RhIHUuM
	MGXA5lXt2gaOGP42LKQzVbYT1tT5qbxLNcqA/MsmQzxA4YQoFIJ3ZOis5c6HS8mC0gAj6kqwPuiIZ
	gvuXU6g/k7KbDao9mwJWV0olNsAfoMCTogRLOoFJRaNR1W/9NBODGR87G3LnzY0L+gNmwvlMSXfIg
	ID7/MKhX6MT3CCoskN8jgMrRCzG7nO5Is7LbZqWGseLz1jnZaWhTp2HiGHw1brzplAETU92oa8a7b
	SrYFOyOA==;
Date: Tue, 18 Nov 2025 18:19:28 +0100 (CET)
Message-Id: <20251118.181928.392761539252490710.rene@exactco.de>
To: christophe.leroy@csgroup.eu
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Subject: Re: [PATCH] modpost: amend ppc symnames for -Os build
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <748c8f8c-23ed-4589-9521-a948cce40922@csgroup.eu>
References: <20251118.131735.802732108462696577.rene@exactco.de>
	<748c8f8c-23ed-4589-9521-a948cce40922@csgroup.eu>
X-Mailer: Mew version 6.10 on Emacs 30.2
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
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hey Christophe,

thank you for your quick review!

On Tue, 18 Nov 2025 15:25:14 +0100, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 18/11/2025 à 13:17, René Rebe a écrit :
> > [Vous ne recevez pas souvent de courriers de
> > rene@exactco.de. Découvrez pourquoi ceci est important à
> > https://aka.ms/LearnAboutSenderIdentification ]
> > Building a size optimized ppc kernel, gcc emmits more symbols than
> > currently allowed listed in scripts/mod/modpost.c. Add to fix:
> 
> You should say when the problem started to happen, and what those

I guess always, or at least for a long time with -Os functions have a
certain pattern or size. Maybe the size of amdgpu and certainly the
DC_FP use triggered the floating point ones for me.

> functions are supposed to save and restore.
> 
> As an exemple see commit 8fe9c93e7453 ("powerpc: Add vr save/restore
> functions")
> 
> Also confirm it is only needed on powerpc64, if so make it clear in
> the commit message.

The fp ones can only occur for ppc64 right now as long as:
ARCH_HAS_KERNEL_FPU_SUPPORT      if PPC64 && PPC_FPU

If the gpr ones are emitted by gcc for ppc(32) I would need to
specifically review. As it is mostly the more modern ppc64, I'll use
that for v2 then, ...

	     René

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

