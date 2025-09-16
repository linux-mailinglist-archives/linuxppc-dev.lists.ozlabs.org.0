Return-Path: <linuxppc-dev+bounces-12296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B76BDB59FF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 20:02:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR8qm4w2Dz30NF;
	Wed, 17 Sep 2025 04:02:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758045732;
	cv=none; b=Z+1Rgf1YAeHdX4VhgC89hCXhPhLPxWA0apcm6/oDJD9OgSVwE4e0R0XWTJ6vIgkXMrCx/gbvM4dF7GWoMIl3Q/7budTictddN55FtxfVOVRWpLBEDWCL7ydhprN37w8SVeGKQHNROgmoz0RqsPLfvZcHlI3f0xm3Y8SGh6gcJzwfQm0YOOoud6IiyGF1gpt5MNIsVopOXts5TxHPlMCfTeU321FY+L/xl5akCvGLNYCHTxd932vpeEEKioLG2SE1SG0/CaKE3pKvMgUbhKKXeS2RELWw5KLx+UAXI0d8GLwdXv0QGMcfnO7kmxTONHDckjNGfLQlOqLX32qRH0b2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758045732; c=relaxed/relaxed;
	bh=rLUOJFZUImaUfo6SdetdAgOJfxOPATvzty/XKsifFnA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cuzi/2CQ7o3utY6w2rmC7zClpqVQ7xgjj3WYOqOZP+i4yNsoE3DxM/YnSkK/L5ArJYpCqvtlQgxY4KqHZqXDt141IoQH+WmnfiN8R4fkJ2735Ou1zgfWp8bc7GUXRbXOKXqc8DN4ae0P5JVTkfI9gTSq1xwQFWhLSolJ7dbpkGH2i2LKRhwy6GQYRZQ1IS2O2HIDaTNBHQsqxCY/shmoNDGe+2dNyXzh5YZG8Q361VGBN+nj/CQiUGB+oSkTh+YDfKPKEmRUwrSWgoyoJ4Uk/BKIIWSkzUYI5jnJ8OB3hvXy++UlDLum2ZUpCEHlu2TJT0qAfZ7ZbOBF/Zo9x4YGsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rlizjEY5; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=I3Yh1UNG; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rlizjEY5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=I3Yh1UNG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cR8ql5hkGz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 04:02:11 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758045719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rLUOJFZUImaUfo6SdetdAgOJfxOPATvzty/XKsifFnA=;
	b=rlizjEY5wByJN9OlvYx1jL11IWtDhp6F60MRFS8WZE3YA9wFEAHVBkH1RIaGaMv/QQoOFh
	fzbbK23DzyeTlo8nGjAEsIyJKhauBMM+H7Q++grmwg2gOy3x4hqWbpvQmwnWUGuGp4iyyv
	pu8DgvXl9kqh01D5Yv7Bj90iuqr+Zp+zXJykBWMvdAqxqAzqGKRNmIjGByo+WFxojTL0SR
	UTPzwx+aSzHl2kTK2PsiTQtP8KjtyKqsZ8iW8/nYITuklCpjcahl6h/DB1RWcBX5UJ3a0l
	hjumCkdnxhnU1rtwUCGmZeE9gMr4sDWW00HAT87wkpNofBxC2mfFpNquGo5SVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758045719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rLUOJFZUImaUfo6SdetdAgOJfxOPATvzty/XKsifFnA=;
	b=I3Yh1UNG5fgJcJC/vuiQLI4n8j9+NvVpTX6AYL1Y2vq6+VrlnSSOpesFjngYDEE/Owb7a2
	DchTBisnkFxe2ZDg==
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH] genirq/msi: Remove msi_post_free()
In-Reply-To: <20250916061007.964005-1-namcao@linutronix.de>
References: <20250916061007.964005-1-namcao@linutronix.de>
Date: Tue, 16 Sep 2025 20:01:58 +0200
Message-ID: <87segm9syx.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16 2025 at 08:10, Nam Cao wrote:

> The only user of msi_post_free() - powerpc/pseries - has been changed to
> use msi_teardown().
>
> Remove this unused callback.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> This patch depends on the powerpc/series conversion patch, which is
> currently in powerpc tree:
> https://lore.kernel.org/lkml/c7a6d8f27fd217021dea4daad777e81a525ae460.1754903590.git.namcao@linutronix.de/
>
> I think it is most convenient to apply this patch to powerpc tree, if
> everyone is okay with that?

Yes.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

