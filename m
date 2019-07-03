Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309F5D9CD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 02:54:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45djL22mkMzDqS8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:54:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dsqKU/c3"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45djJ81JkfzDqH1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 10:52:39 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id m30so294235pff.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2019 17:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=HdPCVjVeZ3R46eEYlXvceRo+tQSPPLpfIkKrjyRLgqQ=;
 b=dsqKU/c3aQCWiKMXfYRQbUi2kW4HJ+ENm+x+9q3cMSHl2CNi9n9ppsdw990lVd4Zuz
 5x4kqCFLCurI8eaEcZArx8VMYm8Le4PljyInG7+lx3df81xfnBGVfz1CRS3G78+dewVu
 5+vZBmoopFdO9fpNOJS5QnB+sy2fbm+oH0dtVMccW0bQczG80rOhg3wluVpx+dNmrxqi
 cepFem/mb6+Y4Iqjxspj6NyUuJFYbEUWeKRNoqb6+xzlHyQ1I7r/4ckbGkYpRT13uATH
 O27aVi2J+lgPS+GlNmGco9kYcYsViRxmT1neb03lLFA4/UQI07ij1B13BhYkHkfxgTSt
 OnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=HdPCVjVeZ3R46eEYlXvceRo+tQSPPLpfIkKrjyRLgqQ=;
 b=K+PXSNEt45HCbFeiWZlOoP4XrqCFRJP/+4o3AsN6N9KhDfgpSXINO+UGh42BdBgy7h
 jfH9fliQu6cQvjJHYfsMgGLG/8IwlOnx0GoB2mVJ4Cr6byV1ZBrLRRYoXdBCeR0V7/L9
 i75RkQ0WygSD+qkn5VhdALExWgBgWgu3wvx5m/+LRJWb/3owlNMhIIGUkCTiyCHk+ol8
 zJHWLlOFBe84TbCtu8UOP5c4iekmx4KE5jDjaGxaSMWWdc+eq92eyfqhX+aKwNJWN7qG
 oNVfLzGgR0LcmZLlL0aQIPSWN16cHmO9pHJjO7ab5Mwr/vgEhHOS14mhAk+pqGdsYxHZ
 0SVQ==
X-Gm-Message-State: APjAAAVglqHzfeX8c321XSK8bFwY/XqLMWmr6Bjjy3RpC01T7QtCss7x
 0R06o7TQQdPFjvCw4SoEiYA=
X-Google-Smtp-Source: APXvYqy/cA0UGMaMFjuXoLyn2OYHzNHvpDRnfMbFIfZhqxUSuxg0Mdt0FLg/su9uIj/Yv6l8iHB91A==
X-Received: by 2002:a63:4e58:: with SMTP id o24mr32836675pgl.366.1562115156742; 
 Tue, 02 Jul 2019 17:52:36 -0700 (PDT)
Received: from localhost (203-219-139-70.static.tpgi.com.au. [203.219.139.70])
 by smtp.gmail.com with ESMTPSA id
 s15sm249999pfd.183.2019.07.02.17.52.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 17:52:36 -0700 (PDT)
Date: Wed, 03 Jul 2019 10:51:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/powernv/idle: Fix restore of SPRN_LDBAR for
 POWER9 stop state.
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <20190702105836.26695-1-maddy@linux.vnet.ibm.com>
In-Reply-To: <20190702105836.26695-1-maddy@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562115029.d32spasj75.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: ego@linux.vnet.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Madhavan Srinivasan's on July 2, 2019 8:58 pm:
> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> commit 10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
> reimplemented book3S code to pltform/powernv/idle.c. But when doing so
> missed to add the per-thread LDBAR update in the core_woken path of
> the power9_idle_stop(). Patch fixes the same.
>=20
> Fixes: 10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/idle.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platfor=
ms/powernv/idle.c
> index 2f4479b94ac3..fd14a6237954 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -758,7 +758,6 @@ static unsigned long power9_idle_stop(unsigned long p=
sscr, bool mmu_on)
>  	mtspr(SPRN_PTCR,	sprs.ptcr);
>  	mtspr(SPRN_RPR,		sprs.rpr);
>  	mtspr(SPRN_TSCR,	sprs.tscr);
> -	mtspr(SPRN_LDBAR,	sprs.ldbar);
> =20
>  	if (pls >=3D pnv_first_tb_loss_level) {
>  		/* TB loss */
> @@ -790,6 +789,7 @@ static unsigned long power9_idle_stop(unsigned long p=
sscr, bool mmu_on)
>  	mtspr(SPRN_MMCR0,	sprs.mmcr0);
>  	mtspr(SPRN_MMCR1,	sprs.mmcr1);
>  	mtspr(SPRN_MMCR2,	sprs.mmcr2);
> +	mtspr(SPRN_LDBAR,	sprs.ldbar);

Oh that's another one I messed up, thanks for the fix. I must have
confused myself with the SPR table in the UM :(

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

=
