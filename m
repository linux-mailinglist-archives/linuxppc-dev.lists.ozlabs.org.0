Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D8D1C375C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 12:58:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0FS62rZzDqdf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 20:58:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0BN1QfVzDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 20:55:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AgVSNtd0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49G0BM4Mxtz9sSW;
 Mon,  4 May 2020 20:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588589724;
 bh=VOZJ+41zv/uZ/NKVIx1QgglexMhIon3i+ZhlW+HFNpE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AgVSNtd0EKpHhqfVc4Qj1yCW1CRAJqnOrCkYbhWJemSwhGz1lczFqdOXMEOaN+Q2l
 orQzsYvlKHQL/k4nRIyf5tisa4q8BsWSNng5IOXVl/dktxlYCr5S9q7O1LDyAo09Rg
 FAyAlgcyiibMSATur+LOPYkj3RhMKfazyhfQJe4kcZFW2lKNFWGHTYCyn2krXDC14m
 /4xrj2GKdLx9wyuEhf6thS+6EwPRk09x924ORpYI4BJUB08slSf2u1crkPTisDCttt
 sFy3XbxWSFZfqqFkUEDwQ3pAGAvvjJuPJVFAq3881KuvjuYpzCEcGh53+W/+jaYhto
 i/IyxTIcKnvgA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/5200: update contact email
In-Reply-To: <20200502142642.18979-1-wsa@kernel.org>
References: <20200502142642.18979-1-wsa@kernel.org>
Date: Mon, 04 May 2020 20:55:41 +1000
Message-ID: <877dxsdl5e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wolfram Sang <wsa@kernel.org> writes:
> My 'pengutronix' address is defunct for years. Merge the entries and use
> the proper contact address.

Is there any point adding the new address? It's just likely to bit-rot
one day too.

I figure the git history is a better source for more up-to-date emails.

cheers

> diff --git a/arch/powerpc/boot/dts/pcm032.dts b/arch/powerpc/boot/dts/pcm032.dts
> index c259c6b3ac5a..780e13d99e7b 100644
> --- a/arch/powerpc/boot/dts/pcm032.dts
> +++ b/arch/powerpc/boot/dts/pcm032.dts
> @@ -3,9 +3,7 @@
>   * phyCORE-MPC5200B-IO (pcm032) board Device Tree Source
>   *
>   * Copyright (C) 2006-2009 Pengutronix
> - * Sascha Hauer <s.hauer@pengutronix.de>
> - * Juergen Beisert <j.beisert@pengutronix.de>
> - * Wolfram Sang <w.sang@pengutronix.de>
> + * Sascha Hauer, Juergen Beisert, Wolfram Sang <kernel@pengutronix.de>
>   */
>  
>  /include/ "mpc5200b.dtsi"
> -- 
> 2.20.1
