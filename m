Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D250A3ECCB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 04:40:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gnz0Y4wZlz3cVb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 12:40:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gnz041Z63z301B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 12:39:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Gnyzv5hMNzBBtB;
 Mon, 16 Aug 2021 04:39:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zLKgHYKhixx; Mon, 16 Aug 2021 04:39:39 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Gnyzv2JJNzBBrY;
 Mon, 16 Aug 2021 04:39:39 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 824B8248; Mon, 16 Aug 2021 04:45:14 +0200 (CEST)
Received: from 37.165.172.2 ([37.165.172.2]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Mon, 16 Aug 2021 04:45:14 +0200
Date: Mon, 16 Aug 2021 04:45:14 +0200
Message-ID: <20210816044514.Horde.WAvjInneMUMGu0ryEZHgrQ8@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: DRBG - select SHA512
References: <304ee0376383d9ceecddbfd216c035215bbff861.camel@chronox.de>
 <20210716081411.GA2062@gondor.apana.org.au> <YRft/tuKE6MjHhY7@zn.tnic>
 <20210816020735.GA10021@gondor.apana.org.au>
In-Reply-To: <20210816020735.GA10021@gondor.apana.org.au>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: sachinp@linux.vnet.ibm.com, Stephan Mueller <smueller@chronox.de>,
 lkml <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Herbert Xu <herbert@gondor.apana.org.au> a =C3=A9crit=C2=A0:

> On Sat, Aug 14, 2021 at 06:23:26PM +0200, Borislav Petkov wrote:
>> On Fri, Jul 16, 2021 at 04:14:12PM +0800, Herbert Xu wrote:
>> > Stephan Mueller <smueller@chronox.de> wrote:
>> > > With the swtich to use HMAC(SHA-512) as the default DRBG type, the
>> > > configuration must now also select SHA-512.
>> > >
>> > > Fixes: 9b7b94683a9b "crypto: DRBG - switch to HMAC SHA512 DRBG=20=20
>>=20as default
>> > > DRBG"
>> > > Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>> > > Signed-off-by: Stephan Mueller <smueller@chronox.com>
>> > > ---
>> > > crypto/Kconfig | 2 +-
>> > > 1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > Patch applied.  Thanks.
>>
>> Is that patch going to Linus anytime soon?
>>
>> I still see it on latest rc5+:
>
> I'll push it up this week.

The fixes tag has a problem it seems. Should be corrected before pushing.

Christophe

>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


