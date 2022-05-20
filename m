Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9252F1D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:44:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Yy23RGBz3bsH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 03:44:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sUUH8mll;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sUUH8mll; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4YxN366tz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 03:43:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3EEF960EB3;
 Fri, 20 May 2022 17:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF91C385A9;
 Fri, 20 May 2022 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653068628;
 bh=rPqzA293aWRPWC7lXotl+If9E12i2+bUeADIQeb5a2g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sUUH8mllbuZL6HHd3vA70wS9VSj62/sIUB0SI8G/+Xtv5tyLYhdMqLJ0UgypHAi0J
 Na0HX1HL8ghPo2sQRbI0e4cAAIFr6xsvJJFFwQZ5Pdsmwbo8wdj2ktCzSdgJDfejk3
 yAcv9JnQwuv6YjCrGgDfdAl4H4hsQzjJrczsdZ9Ung4m9eH/Ih//TMXcI7+W3K6gra
 qaCcnsioUOM2vzfuG9E+A8oINvDsyQYQdXa+Y5HLlBtgelx+0NAqg9QqVUKDWK3Q1D
 ERb8k/034Jh9cdVGKrLe4ip2u01/HAe2sbSYO6PUkW4aXDiox4+Tq8QLkEAqCTh39U
 bSm1rsW8i2nag==
Date: Fri, 20 May 2022 10:43:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] net: fs_enet: sync rx dma buffer before reading
Message-ID: <20220520104347.2b1b658a@kernel.org>
In-Reply-To: <b11dcb32-5915-c1c8-9f0e-3cfc57b55792@csgroup.eu>
References: <20220519192443.28681-1-mans@mansr.com>
 <03f24864-9d4d-b4f9-354a-f3b271c0ae66@csgroup.eu>
 <yw1xmtfc9yaj.fsf@mansr.com>
 <b11dcb32-5915-c1c8-9f0e-3cfc57b55792@csgroup.eu>
MIME-Version: 1.0
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
Cc: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Dan Malek <dan@embeddededge.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vitaly Bordug <vbordug@ru.mvista.com>, Paolo Abeni <pabeni@redhat.com>,
 Joakim Tjernlund <joakim.tjernlund@lumentis.se>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 May 2022 12:54:56 +0000 Christophe Leroy wrote:
> Le 20/05/2022 =C3=A0 14:35, M=C3=A5ns Rullg=C3=A5rd a =C3=A9crit=C2=A0:
> > Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> >> See original commit 070e1f01827c. It explicitely says that the cache
> >> must be invalidate _AFTER_ the copy.
> >>
> >> The cache is initialy invalidated by dma_map_single(), so before the
> >> copy the cache is already clean.
> >>
> >> After the copy, data is in the cache. In order to allow re-use of the
> >> skb, it must be put back in the same condition as before, in extenso t=
he
> >> cache must be invalidated in order to be in the same situation as after
> >> dma_map_single().
> >>
> >> So I think your change is wrong. =20
> >=20
> > OK, looking at it more closely, the change is at least unnecessary since
> > there will be a cache invalidation between each use of the buffer either
> > way.  Please disregard the patch.  Sorry for the noise.
> >  =20
>=20
> I also looked deeper.
>=20
> Indeed it was implemented in kernel 4.9 or 4.8. At that time=20
> dma_unmap_single() was a no-op, it was not doing any sync/invalidation=20
> at all, invalidation was done only at mapping, so when we were reusing=20
> the skb it was necessary to clean the cache _AFTER_ the copy as if it=20
> was a new mapping.
>=20
> Today a sync is done at both map and unmap, so it doesn't really matter=20
> whether we do the invalidation before or after the copy when we re-use=20
> the skb.

Hm, I think the patch is necessary, sorry if you're also saying that
and I'm misinterpreting.=20

Without the dma_sync_single_for_cpu() if swiotlb is used the data
will not be copied back into the original buffer if there is no sync.
