Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0292CC93
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 18:49:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45D0Dm3zvvzDqNR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 02:49:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45D0CP4KqgzDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 02:48:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45D0CG3N1Kz9tyRP;
 Tue, 28 May 2019 18:48:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 667rjOW_1YQx; Tue, 28 May 2019 18:48:10 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45D0CG2Q0Zz9tyRN;
 Tue, 28 May 2019 18:48:10 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 1E81174B; Tue, 28 May 2019 18:48:10 +0200 (CEST)
Received: from 37-170-84-163.coucou-networks.fr
 (37-170-84-163.coucou-networks.fr [37.170.84.163]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Tue, 28 May 2019 18:48:10 +0200
Date: Tue, 28 May 2019 18:48:10 +0200
Message-ID: <20190528184810.Horde.kzboSxOzA1nukNNnhCIE7g1@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Horia Geanta <horia.geanta@nxp.com>
Subject: Re: [PATCH v1 00/15] Fixing selftests failure on Talitos driver
References: <cover.1558445259.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB34850975FDD8F5F1CE366A9C981E0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR0402MB34850975FDD8F5F1CE366A9C981E0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Horia Geanta <horia.geanta@nxp.com> a =C3=A9crit=C2=A0:

> On 5/21/2019 4:34 PM, Christophe Leroy wrote:
>> Several test failures have popped up following recent changes to crypto
>> selftests.
>>
>> This series fixes (most of) them.
>>
>> The last three patches are trivial cleanups.
>>
> Thanks Christophe.
>
> For the series:
> Reviewed-by: Horia Geant=C4=83 <horia.geanta@nxp.com>
>
> Have you validated the changes also on SEC 2.x+?
> Asking since IIRC you mentioned having only HW with SEC 1 and=20=20
>=20changes in patch
> "crypto: talitos - fix AEAD processing." look quite complex.

When I ported the driver to SEC1 some years ago I only had a SEC 1.2=20=20
(mpc885)=20but I now have also a board with a mpc8321E which embeds a=20=20
SEC=202.2 so I also tested the changes on it.

Christophe

>
> Thanks,
> Horia


