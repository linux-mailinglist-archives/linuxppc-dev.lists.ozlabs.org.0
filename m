Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54EA4646BC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 06:33:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3nmw5XXnz2yPj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 16:33:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bPVd8zdW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bPVd8zdW; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3nmH1Zt9z2ygB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 16:32:44 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id o14so16793172plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 21:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tpCmJo2bsWQVn4TP4a2fQaGlZVVq+NNHeKbbKn9xcpA=;
 b=bPVd8zdWsvzjOqgWGQB0PVAjBejhbhh79/C/nMasyj9BionVO/JCOrXNGmH+F4hRyv
 DS2bIxXNJXplnNb5A7PDgh7OkK/mryXwFi+6Ief32l9LfYpAs3aaWrW399PIi95FjKpP
 8Pt9GSCNgzU6M+VYXUN7WtKYaFYSm2W7mWPi3VxeFHYPWwvMH2mJJ9cajgqnIUPVS/rm
 tO01sEqtp9HKQDi+EB0hJNPnGW9sUB0aTedx7ERb4bzOLKqhNYc9L9Juy6FuUW3fWZal
 D84XAmhqT55Q06oclCPKUZSpI0+TDxnInlsOQ6mhQXGYWlK/VErC498KxQSnuT9qnDTm
 ShbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tpCmJo2bsWQVn4TP4a2fQaGlZVVq+NNHeKbbKn9xcpA=;
 b=F6rygF0TkfOTg4QNzH/BCGwwWXPP89ZPZlJy67Qt8jhb4IWSLLlehTOQuY25JZv0R4
 sgfoBGh7Go7jJjLFYr7+p6Njs/OXyZT+WO3vnf9up7tPhRKW6X/Kf1R6MemjxYugaEGj
 hAW7H4GG7qusPJQ1AbiQpEXKMAyRyWcsyPzRf1hT06N148y+fdZaM9D/ljNhlL1GikNS
 /mGCi8hMaBPD5w5DOnY1Qc6a4IKkzdwe/CL4GT04RL2cq7tQmUXXsE/E4HzeapjD+u4O
 9O4+4a/Jd+9oaii71f74hOCCJ+Un5JA89+zRnwv4Z2lh2VNf4SBdApIdlAeAFMkr2S26
 x5jA==
X-Gm-Message-State: AOAM531WY59CZGBVJUG4vCwUSfvkK2V9Jw9FeKi/21LDenwMW4WcR6t0
 n+iSi/6YlyC7Er0Ux0y6S8c=
X-Google-Smtp-Source: ABdhPJwkUfMA8MEjorWlPEzCCFykGlpgXNVi2Vmq3F81C1ZDdbpy5pVUrqMm5tPG9dEOFphR0gjPYA==
X-Received: by 2002:a17:90b:4a4d:: with SMTP id
 lb13mr4705223pjb.97.1638336762038; 
 Tue, 30 Nov 2021 21:32:42 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id i5sm17203794pgo.36.2021.11.30.21.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 21:32:41 -0800 (PST)
Date: Wed, 01 Dec 2021 15:32:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 rebased 1/9] powerpc/mm: Make slice specific to
 book3s/64
To: alex@ghiti.fr, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1637862579.git.christophe.leroy@csgroup.eu>
 <2d9668bd46805c9fcfef804e125aa4fbad2e87a7.1637862579.git.christophe.leroy@csgroup.eu>
In-Reply-To: <2d9668bd46805c9fcfef804e125aa4fbad2e87a7.1637862579.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1638336646.izi2xwmepk.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 26, 2021 3:52 am:
> Since commit 555904d07eef ("powerpc/8xx: MM_SLICE is not needed
> anymore") only book3s/64 selects CONFIG_PPC_MM_SLICES.
>=20
> Move slice.c into mm/book3s64/
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> v2: Remove now unnecessary #ifdef CONFIG_PPC_BOOK3S_64 in slice.c
> ---
>  arch/powerpc/mm/Makefile               | 1 -
>  arch/powerpc/mm/book3s64/Makefile      | 1 +
>  arch/powerpc/mm/{ =3D> book3s64}/slice.c | 2 --
>  arch/powerpc/mm/nohash/mmu_context.c   | 9 ---------
>  arch/powerpc/mm/nohash/tlb.c           | 4 ----
>  5 files changed, 1 insertion(+), 16 deletions(-)
>  rename arch/powerpc/mm/{ =3D> book3s64}/slice.c (99%)
>=20
