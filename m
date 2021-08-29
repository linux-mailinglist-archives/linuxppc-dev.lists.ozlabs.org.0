Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE073FAB4F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Aug 2021 14:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyCNb1rnlz2ybC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Aug 2021 22:26:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mkjRa/NB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mkjRa/NB; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyCMs5sR2z2xrt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Aug 2021 22:25:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GyCMn077Bz9sW5;
 Sun, 29 Aug 2021 22:25:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630239927;
 bh=iBAjFvolmNyY2XZ92vAE2fPLtdbfMKz7ggBJnDVP5XY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mkjRa/NB8vHgxfdu3l/F8pbrud+Fo5BKagyM0uRxjeTOdt8OWy59q2UNYjRakpxqa
 dtZGfZqT5BFbFBdansxFhWr6CYpmbCfg6wsQJWj3sdUWBf2lGB0Jr/5AX/ZSSiiw5m
 E8e9/0clEWAiKoSw2m9J5glNTV70KW+bMPOKzgHqPLF/Fn1tcxgHQ8ZWEUJBCMugAW
 zuJ6BQyAw7JV3eF3B2QYbjxsyWhCYKpq3PA46OB7Y4ciO4LOiSypNuZMzfFVycKrEI
 vFw9FGhvXCkDKyqpR5DaCNMwcR0hMTHNWrUvJCHXtGDxlNR+yig+pDPIe50oc/8Y5m
 3xYOxVFdfehsg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, kou.ishizaki@toshiba.co.jp,
 geoff@infradead.org, davem@davemloft.net, kuba@kernel.org
Subject: Re: [PATCH] net: spider_net: switch from 'pci_' to 'dma_' API
In-Reply-To: <90220a35-bd0a-ccf3-91b1-c2a459c447e7@csgroup.eu>
References: <60abc3d0c8b4ef8368a4d63326a25a5cb3cd218c.1630094078.git.christophe.jaillet@wanadoo.fr>
 <90220a35-bd0a-ccf3-91b1-c2a459c447e7@csgroup.eu>
Date: Sun, 29 Aug 2021 22:25:19 +1000
Message-ID: <871r6cfnf4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 27/08/2021 =C3=A0 21:56, Christophe JAILLET a =C3=A9crit=C2=A0:
>> ---
>> It has *not* been compile tested because I don't have the needed
>> configuration or cross-compiler. However, the modification is completely
>> mechanical and done by coccinelle.
>
> All you need is at https://mirrors.edge.kernel.org/pub/tools/crosstool/

There's also some instructions here for using distro toolchains:

https://github.com/linuxppc/wiki/wiki/Building-powerpc-kernels

cheers
