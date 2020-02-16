Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B81606EC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 23:35:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LMQ21jMfzDqdf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 09:35:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LMNH5KX9zDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 09:33:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=izLMkKNK; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48LMNG3cXPz9sPk;
 Mon, 17 Feb 2020 09:33:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1581892431;
 bh=IzVd3zz9l6kPQTSe8Nj+Ga0PypI0I2VtiI7TPnVOQrY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=izLMkKNKro+4UaU4NyZyvFFwQxyAvV8WHby0/+sU16FohAkhCP8xpodCbETwQD4H+
 Kbf5T+Sltm6K5SG7jU03OfXdEcvMoYnWbqk3qQtKTMEaEIjqlOvu/z7+ULva/ILRm0
 A2nOGCJidPEC6Unmb1ho0W5lQMI5ZScWTAC4Ce/8n4M2gMdGfbvJuGK6WNknf1hkXg
 IcjRwX4qaH/u0dwUeDgY6sn+ejB/zd+Xce1n7lp4BnpsCaanSUe02Ewd/v2RTSnFIM
 VMSPrl7+RcB5nGZadKVKhkY9QebfoBRaxC0ynLtIjfyn1SKKbsfkcj8eo9AdIdNQAT
 nd1nCAkuHeJQA==
Received: by neuling.org (Postfix, from userid 1000)
 id F1D392C01ED; Mon, 17 Feb 2020 09:33:49 +1100 (AEDT)
Message-ID: <f61f9a59ddb0f103cd62792e13afde4ca8afa7bb.camel@neuling.org>
Subject: Re: [PATCH 1/1] powerpc/cputable: Remove unnecessary copy of
 cpu_spec->oprofile_type
From: Michael Neuling <mikey@neuling.org>
To: Leonardo Bras <leonardo@linux.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner
 <tglx@linutronix.de>, desnesn@linux.ibm.com
Date: Mon, 17 Feb 2020 09:33:49 +1100
In-Reply-To: <20200215053637.280880-1-leonardo@linux.ibm.com>
References: <20200215053637.280880-1-leonardo@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-02-15 at 02:36 -0300, Leonardo Bras wrote:
> Before checking for cpu_type =3D=3D NULL, this same copy happens, so doin=
g
> it here will just write the same value to the t->oprofile_type
> again.
>=20
> Remove the repeated copy, as it is unnecessary.
>=20
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>

LGTM

Reviewed-by: Michael Neuling <mikey@neuling.org>

> ---
>  arch/powerpc/kernel/cputable.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputabl=
e.c
> index e745abc5457a..5a87ec96582f 100644
> --- a/arch/powerpc/kernel/cputable.c
> +++ b/arch/powerpc/kernel/cputable.c
> @@ -2197,7 +2197,6 @@ static struct cpu_spec * __init setup_cpu_spec(unsi=
gned
> long offset,
>  		 */
>  		if (old.oprofile_cpu_type !=3D NULL) {
>  			t->oprofile_cpu_type =3D old.oprofile_cpu_type;
> -			t->oprofile_type =3D old.oprofile_type;
>  		}
>  	}
> =20

