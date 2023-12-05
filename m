Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E1D806352
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 01:20:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=buserror.net header.i=@buserror.net header.a=rsa-sha256 header.s=rsa_sel header.b=M0POUctn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlJ2F0P48z3ck3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 11:20:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=buserror.net header.i=@buserror.net header.a=rsa-sha256 header.s=rsa_sel header.b=M0POUctn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 2251 seconds by postgrey-1.37 at boromir; Wed, 06 Dec 2023 11:19:21 AEDT
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlJ1P0yykz3cCh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 11:19:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=buserror.net; s=rsa_sel; h=Subject:MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DZwB2POqwrd8X6LbQpzFj2/aL40ImBLV+vaLjDHtH1M=; b=M0POUctnsUN+d+fmAwVUWHXBZI
	5cVOFDODT4LsXnFWH4p8fm7f9RTqfvx7c/ndxpBWs2ZFEmItFqCE7nCLVoN09h58QrrBwrG3T/aVg
	OtEG1VtOWltsPlZjxZvZj7aKCwDjifGwxZrJl2iSaHFQR9AydQJE3g9e1yzPU24yPYkDIYbV7Gy9Q
	DaYUw7hr01kGbbb8sjkq3qNXAhDrkhWild/BIzcLpJBMm81Fp51M+ZutxsMM5ehvctK5BPzuCbuxL
	3nV0+J0flMFjbLvVajQW165IB34K2cd8Vyg3IN1GNykHmfr0+14F0yDB3aFrQpCupO6ZPYYwhwnns
	sHtUcyDQ==;
Received: from [2601:447:c601:5610::fed3]
	by baldur.buserror.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <oss@buserror.net>)
	id 1rAf0o-004kJT-0C;
	Tue, 05 Dec 2023 17:39:34 -0600
Message-ID: <ab212d9a4f35450e6575a0fe3aae01fb8e4709c4.camel@buserror.net>
From: Crystal Wood <oss@buserror.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 05 Dec 2023 17:39:32 -0600
In-Reply-To: <20231205051239.737384-1-mpe@ellerman.id.au>
References: <20231205051239.737384-1-mpe@ellerman.id.au>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2601:447:c601:5610::fed3
X-SA-Exim-Rcpt-To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=4.0.0
X-Spam-Report: 	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: Re: [PATCH] MAINTAINERS: powerpc: Transfer PPC83XX to Christophe
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-12-05 at 16:12 +1100, Michael Ellerman wrote:
> Christophe volunteered[1] to maintain PPC83XX.
>=20
> 1:
> https://lore.kernel.org/all/7b1bf4dc-d09d-35b8-f4df-16bf00429b6d@csgroup.=
eu/
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
> =C2=A0MAINTAINERS | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 562d048863ee..d4efe48cc36a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12287,21 +12287,21 @@ S:=C2=A0=C2=A0=C2=A0=C2=A0Orphan
> =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/powerpc/platforms/40x/
> =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/powerpc/platforms/44x/
> =C2=A0
> -LINUX FOR POWERPC EMBEDDED PPC83XX AND PPC85XX
> +LINUX FOR POWERPC EMBEDDED PPC85XX
> =C2=A0M:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Scott Wood <oss@buserror.net>
> =C2=A0L:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0linuxppc-dev@lists.ozlabs.org
> =C2=A0S:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Odd fixes
> =C2=A0T:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0git
> git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git
> =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/devicetree/bindings/c=
ache/freescale-l2cache.txt
> =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/devicetree/bindings/p=
owerpc/fsl/
> -F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/powerpc/platforms/83xx/
> =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/powerpc/platforms/85xx/
> =C2=A0
> -LINUX FOR POWERPC EMBEDDED PPC8XX
> +LINUX FOR POWERPC EMBEDDED PPC8XX AND PPC83XX
> =C2=A0M:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Christophe Leroy <christophe.leroy@=
csgroup.eu>
> =C2=A0L:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0linuxppc-dev@lists.ozlabs.org
> =C2=A0S:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Maintained
> =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/powerpc/platforms/8xx/
> +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0arch/powerpc/platforms/83xx/

Acked-by: Crystal Wood <oss@buserror.net>

-Crystal

