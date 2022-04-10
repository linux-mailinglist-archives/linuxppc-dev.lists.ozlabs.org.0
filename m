Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC44FAF94
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 20:25:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kc0lm30Jvz3bYM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 04:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E3oamHlV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=E3oamHlV; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kc0l55WqXz2xF8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 04:24:47 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id z99so7157098ede.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6cdVUS6XiscYrUgxUxtAL2ssNdCpR5fNQ/PXRqx8HXE=;
 b=E3oamHlVUO9sG+tUlCb7w/lxckY+1bMJ8Oj/JMRsdthREWTAo/EU1ssZbsEddX/CMW
 XF+LLnOvzqbQ09/kqpDMUFnXICqi/jhgYhhv5gxrC5MMdDeloz3+bT7nNdHFZfSEL2q0
 XjhyXlJ2wmJ+nWvvMT0izK3719NdGolLrqWsrZQa3UBq1r9OQ40xF0MyV4NqmK82mhIJ
 Z5+8pR6KZwFLv6NnK3nKzBo3rK6QovFRSGe9xxfzi7Cygm/LyX76sqMrbY0iZzA1pxUb
 HTenU1x8AjD/thUEi/iR5ReeV/7u+ZMAdb3HHejyOJt71iosXVU5vKr6vibgesiixUDv
 Ojhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6cdVUS6XiscYrUgxUxtAL2ssNdCpR5fNQ/PXRqx8HXE=;
 b=MinN8QDcSHCBC4s2QoRVvZl/Ff8J2l6h0jKWRx3TI40AMkvTIYKqj11XyUPzrYPJ8n
 bWFnBcRSJXPN7VQQnkMojkVHCf+QsOOgrCGuedMNEM1mp/navm2NdHP8W0EvX+jHZsTE
 Ownf4BLkwLnGl8sCXhO3uQvB4BBiOIhoYUx8k1OgNdNW25i0Q7vnN33m7OO5VXUgln0v
 hVwrnpAz5jU/RE3jFTq/FeFuzn3trPLPMEgMuGzMe+zHQX/dbuocyEQusbchdGAYzejV
 sjoG8/Oz855GJ5yx+DDbw924ya2YquJzRva9tOgzNQrtJNb/EH5STM8uENHlCVYwemyb
 XRPQ==
X-Gm-Message-State: AOAM5307jRu6i8ypv+WMkZL3syPPQRvVj3UvAPKg4KvXuMeOYS+y2Pdm
 vn7G3DczM3r/RBJ+50Zmnx0=
X-Google-Smtp-Source: ABdhPJzHtBkIeS+/EEn5hhsp2OBGrQi0n93cEQMWNioFwMIDx3qPQINg9OZCTpvVlSgC58g1HvsjRQ==
X-Received: by 2002:aa7:db94:0:b0:410:f0e8:c39e with SMTP id
 u20-20020aa7db94000000b00410f0e8c39emr29340972edt.14.1649615079652; 
 Sun, 10 Apr 2022 11:24:39 -0700 (PDT)
Received: from smtpclient.apple (i130160.upc-i.chello.nl. [62.195.130.160])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a170906bc4400b006e893908c4csm356693ejv.60.2022.04.10.11.24.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Apr 2022 11:24:39 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <935062D0-C657-4C79-A0BE-70141D052EC0@gmail.com>
Date: Sun, 10 Apr 2022 20:24:37 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <C88FE232-417C-4029-A79E-9A7E807D2FE7@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
 <20220408114120.tvf2lxvhfqbnrlml@skbuf>
 <FA317E17-3B09-411B-9DF6-05BDD320D988@gmail.com>
 <C9081CE3-B008-48DA-A97C-76F51D4F189F@gmail.com>
 <20220410110508.em3r7z62ufqcbrfm@skbuf>
 <935062D0-C657-4C79-A0BE-70141D052EC0@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
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
Cc: Andrew Lunn <andrew@lunn.ch>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 Ariel Elior <aelior@marvell.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>, Di Zhu <zhudi21@huawei.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Colin Ian King <colin.king@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Casper Andersson <casper.casan@gmail.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 10. Apr 2022, at 14:39, Jakob Koschel <jakobkoschel@gmail.com> =
wrote:
>=20
>=20
>=20
>> On 10. Apr 2022, at 13:05, Vladimir Oltean <olteanv@gmail.com> wrote:
>>=20
>> On Sun, Apr 10, 2022 at 12:51:56PM +0200, Jakob Koschel wrote:
>>> I've just looked at this again in a bit more detail while =
integrating it into the patch series.
>>>=20
>>> I realized that this just shifts the 'problem' to using the 'pos' =
iterator variable after the loop.
>>> If the scope of the list iterator would be lowered to the list =
traversal loop it would also make sense
>>> to also do it for list_for_each().
>>=20
>> Yes, but list_for_each() was never formulated as being problematic in
>> the same way as list_for_each_entry(), was it? I guess I'm starting =
to
>> not understand what is the true purpose of the changes.
>=20
> Sorry for having caused the confusion. Let me elaborate a bit to give =
more context.
>=20
> There are two main benefits of this entire effort.
>=20
> 1) fix the architectural bugs and avoid any missuse of the list =
iterator after the loop
> by construction. This only concerns the list_for_each_entry_*() macros =
and your change
> will allow lowering the scope for all of those. It might be debatable =
that it would be
> more consistent to lower the scope for list_for_each() as well, but it =
wouldn't be
> strictly necessary.
>=20
> 2) fix *possible* speculative bugs. In our project, Kasper [1], we =
were able to show
> that this can be an issue for the list traversal macros (and this is =
how the entire
> effort started).
> The reason is that the processor might run an additional loop =
iteration in speculative
> execution with the iterator variable computed based on the head =
element. This can
> (and we have verified this) happen if the CPU incorrectly=20
> assumes !list_entry_is_head(pos, head, member).
>=20
> If this happens, all memory accesses based on the iterator variable =
*potentially* open
> the chance for spectre [2] gadgets. The proposed mitigation was =
setting the iterator variable
> to NULL when the terminating condition is reached (in speculative safe =
way). Then,
> the additional speculative list iteration would still execute but =
won't access any
> potential secret data.
>=20
> And this would also be required for list_for_each() since combined =
with the list_entry()
> within the loop it basically is semantically identical to =
list_for_each_entry()
> for the additional speculative iteration.
>=20
> Now, I have no strong opinion on going all the way and since 2) is not =
the main motivation
> for this I'm also fine with sticking to your proposed solution, but it =
would mean that implementing
> a "speculative safe" list_for_each() will be more difficult in the =
future since it is using
> the iterator of list_for_each() past the loop.
>=20
> I hope this explains the background a bit better.
>=20
>>=20
>>> What do you think about doing it this way:
>>>=20
>>> diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c =
b/drivers/net/dsa/sja1105/sja1105_vl.c
>>> index b7e95d60a6e4..f5b0502c1098 100644
>>> --- a/drivers/net/dsa/sja1105/sja1105_vl.c
>>> +++ b/drivers/net/dsa/sja1105/sja1105_vl.c
>>> @@ -28,6 +28,7 @@ static int sja1105_insert_gate_entry(struct =
sja1105_gating_config *gating_cfg,
>>> list_add(&e->list, &gating_cfg->entries);
>>> } else {
>>> struct sja1105_gate_entry *p;
>>> + struct list_head *pos =3D NULL;
>>>=20
>>> list_for_each_entry(p, &gating_cfg->entries, list) {
>>> if (p->interval =3D=3D e->interval) {
>>> @@ -37,10 +38,14 @@ static int sja1105_insert_gate_entry(struct =
sja1105_gating_config *gating_cfg,
>>> goto err;
>>> }
>>>=20
>>> - if (e->interval < p->interval)
>>> + if (e->interval < p->interval) {
>>> + pos =3D &p->list;
>>> break;
>>> + }
>>> }
>>> - list_add(&e->list, p->list.prev);
>>> + if (!pos)
>>> + pos =3D &gating_cfg->entries;
>>> + list_add(&e->list, pos->prev);
>>> }
>>>=20
>>> gating_cfg->num_entries++;
>>> --
>>>=20
>>>>=20
>>>> Thanks for the suggestion.
>>>>=20
>>>>> 	}
>>>>>=20
>>>>> 	gating_cfg->num_entries++;
>>>>> -----------------------------[ cut here =
]-----------------------------
>>>>=20
>>>> [1] =
https://lore.kernel.org/linux-kernel/20220407102900.3086255-12-jakobkosche=
l@gmail.com/
>>>>=20
>>>> 	Jakob
>>>=20
>>> Thanks,
>>> Jakob
>=20
> Thanks,
> Jakob
>=20
> [1] https://www.vusec.net/projects/kasper/
> [2] https://spectreattack.com/spectre.pdf


Btw, I just realized that the if (!pos) is not necessary. This should =
simply do it:

diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c =
b/drivers/net/dsa/sja1105/sja1105_vl.c
index b7e95d60a6e4..2d59e75a9e3d 100644
--- a/drivers/net/dsa/sja1105/sja1105_vl.c
+++ b/drivers/net/dsa/sja1105/sja1105_vl.c
@@ -28,6 +28,7 @@ static int sja1105_insert_gate_entry(struct =
sja1105_gating_config *gating_cfg,
 		list_add(&e->list, &gating_cfg->entries);
 	} else {
+		struct list_head *pos =3D &gating_cfg->entries;
 		struct sja1105_gate_entry *p;
=20
 		list_for_each_entry(p, &gating_cfg->entries, list) {
 			if (p->interval =3D=3D e->interval) {
@@ -37,10 +38,12 @@ static int sja1105_insert_gate_entry(struct =
sja1105_gating_config *gating_cfg,
 				goto err;
 			}
=20
-			if (e->interval < p->interval)
+			if (e->interval < p->interval) {
+				pos =3D &p->list;
 				break;
+			}
 		}
-		list_add(&e->list, p->list.prev);
+		list_add(&e->list, pos->prev);
 	}
=20
 	gating_cfg->num_entries++;
--=20
2.25.1

Thanks,
Jakob

