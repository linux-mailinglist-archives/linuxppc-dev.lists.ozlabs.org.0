Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F552EC69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 14:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4RFx4PGqz3blG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 22:42:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=mansr.com (client-ip=2001:8b0:ca0d:1::2;
 helo=unicorn.mansr.com; envelope-from=mans@mansr.com; receiver=<UNKNOWN>)
X-Greylist: delayed 380 seconds by postgrey-1.36 at boromir;
 Fri, 20 May 2022 22:42:22 AEST
Received: from unicorn.mansr.com (unicorn.mansr.com [IPv6:2001:8b0:ca0d:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4RFV3N15z2yWr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 22:42:21 +1000 (AEST)
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
 by unicorn.mansr.com (Postfix) with ESMTPS id 6406615361;
 Fri, 20 May 2022 13:35:48 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id 4D31721A3D6; Fri, 20 May 2022 13:35:48 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] net: fs_enet: sync rx dma buffer before reading
References: <20220519192443.28681-1-mans@mansr.com>
 <03f24864-9d4d-b4f9-354a-f3b271c0ae66@csgroup.eu>
Date: Fri, 20 May 2022 13:35:48 +0100
In-Reply-To: <03f24864-9d4d-b4f9-354a-f3b271c0ae66@csgroup.eu> (Christophe
 Leroy's message of "Fri, 20 May 2022 05:39:38 +0000")
Message-ID: <yw1xmtfc9yaj.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Dan Malek <dan@embeddededge.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vitaly Bordug <vbordug@ru.mvista.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Joakim Tjernlund <joakim.tjernlund@lumentis.se>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 19/05/2022 =E0 21:24, Mans Rullgard a =E9crit=A0:
>> The dma_sync_single_for_cpu() call must precede reading the received
>> data. Fix this.
>
> See original commit 070e1f01827c. It explicitely says that the cache=20
> must be invalidate _AFTER_ the copy.
>
> The cache is initialy invalidated by dma_map_single(), so before the=20
> copy the cache is already clean.
>
> After the copy, data is in the cache. In order to allow re-use of the=20
> skb, it must be put back in the same condition as before, in extenso the=
=20
> cache must be invalidated in order to be in the same situation as after=20
> dma_map_single().
>
> So I think your change is wrong.

OK, looking at it more closely, the change is at least unnecessary since
there will be a cache invalidation between each use of the buffer either
way.  Please disregard the patch.  Sorry for the noise.

>>=20
>> Fixes: 070e1f01827c ("net: fs_enet: don't unmap DMA when packet len is b=
elow copybreak")
>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>> ---
>>   drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/dri=
vers/net/ethernet/freescale/fs_enet/fs_enet-main.c
>> index b3dae17e067e..432ce10cbfd0 100644
>> --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
>> +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
>> @@ -240,14 +240,14 @@ static int fs_enet_napi(struct napi_struct *napi, =
int budget)
>>                                  /* +2 to make IP header L1 cache aligne=
d */
>>                                  skbn =3D netdev_alloc_skb(dev, pkt_len =
+ 2);
>>                                  if (skbn !=3D NULL) {
>> +                                       dma_sync_single_for_cpu(fep->dev,
>> +                                               CBDR_BUFADDR(bdp),
>> +                                               L1_CACHE_ALIGN(pkt_len),
>> +                                               DMA_FROM_DEVICE);
>>                                          skb_reserve(skbn, 2);   /* alig=
n IP header */
>>                                          skb_copy_from_linear_data(skb,
>>                                                        skbn->data, pkt_l=
en);
>>                                          swap(skb, skbn);
>> -                                       dma_sync_single_for_cpu(fep->dev,
>> -                                               CBDR_BUFADDR(bdp),
>> -                                               L1_CACHE_ALIGN(pkt_len),
>> -                                               DMA_FROM_DEVICE);
>>                                  }
>>                          } else {
>>                                  skbn =3D netdev_alloc_skb(dev, ENET_RX_=
FRSIZE);
>> --
>> 2.35.1
>>=20

--=20
M=E5ns Rullg=E5rd
