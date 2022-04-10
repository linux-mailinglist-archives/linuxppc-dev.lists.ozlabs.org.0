Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D74FADE3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 14:40:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kbs6509kCz3bfq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 22:40:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=genybavv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=genybavv; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kbs5R0MmPz2xfT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 22:40:10 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id p15so25697333ejc.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 05:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WJ3zx5hxbrhQdoh4df/mkYbAfZTieLScs1fGc8yvAKE=;
 b=genybavvxQfO3oMBZjo2CjIk1O/oGwGjSShnuF7VRUqPU857l7tmI7mOpqspRCdNa8
 PP0OIXI2vNtXcK+auG9ZXMTFfhBJFd0oUTv8b4pdD3v7PeUC32Ge/N4RYYU9PNXTmgJE
 zl+60cT3783cP9JX4TQBR8pW957rVNarSQlgjCj2xNVl4mqDV72XT3VCx+sVT9VZ1DHg
 zQaUavreMRULymshsvHLE8NMNW7w3nEqeO1w59qryQUYbxeUYgeVZGqKcEuDOH+/Mstm
 /dypm4G0EB4d+XBiyN7xyFepVohVcq2zwf8oZ9d6urnWhkNoNMDQ1bECwpDFSUHNF7wj
 Nq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=WJ3zx5hxbrhQdoh4df/mkYbAfZTieLScs1fGc8yvAKE=;
 b=uTvGt8Wsv+xz9PsqVz1zg7Arr5jemJ75gzfEitCsJ4RsCkOtKtQqPSsZjchS2oIwig
 bX3Wenza5M65aJCHdbrQA5XgclBjj5tggBw6OMsOQHqgRup5VSLbG2z1OiCM1zVRWoD+
 eWXn18jt+UxSaVQwopempFmKnrLj+3EAJZXo/27tz9GCWxj6W80nWLR56r7uxcZqVxxx
 DQNgL/hp8qsU+EZXvbwGT0sd1HNqx2Srke4PwoyefHzoJy2gQPnFKcuCW7rTZ3J+SbGG
 v0dz+g2oGJAbN4w5k+22grU7K+bJSnOjm5pyAW6StoigvP9Nx90AtzRHvT+jcEkKl+o6
 VyiA==
X-Gm-Message-State: AOAM530OcHh9TCj6Bs2unF+3+Y1kGK0P/En+C3w7o92XcsDv+H+nwiax
 ud60Vqi/6bakbgvXNY/BXXw=
X-Google-Smtp-Source: ABdhPJyyaBS7UlkYvO3wuO5S0f8bGGkJ6uVCS0ltBvj9Hg44UfZ+IoAoo+jvga3Jvjur3dumJsVFrg==
X-Received: by 2002:a17:906:7943:b0:6df:e5b3:6553 with SMTP id
 l3-20020a170906794300b006dfe5b36553mr25955888ejo.398.1649594404580; 
 Sun, 10 Apr 2022 05:40:04 -0700 (PDT)
Received: from smtpclient.apple (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 tj13-20020a170907c24d00b006e853804a70sm2598630ejc.0.2022.04.10.05.39.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Apr 2022 05:40:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220410110508.em3r7z62ufqcbrfm@skbuf>
Date: Sun, 10 Apr 2022 14:39:48 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <935062D0-C657-4C79-A0BE-70141D052EC0@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
 <20220408114120.tvf2lxvhfqbnrlml@skbuf>
 <FA317E17-3B09-411B-9DF6-05BDD320D988@gmail.com>
 <C9081CE3-B008-48DA-A97C-76F51D4F189F@gmail.com>
 <20220410110508.em3r7z62ufqcbrfm@skbuf>
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



> On 10. Apr 2022, at 13:05, Vladimir Oltean <olteanv@gmail.com> wrote:
>=20
> On Sun, Apr 10, 2022 at 12:51:56PM +0200, Jakob Koschel wrote:
>> I've just looked at this again in a bit more detail while integrating =
it into the patch series.
>>=20
>> I realized that this just shifts the 'problem' to using the 'pos' =
iterator variable after the loop.
>> If the scope of the list iterator would be lowered to the list =
traversal loop it would also make sense
>> to also do it for list_for_each().
>=20
> Yes, but list_for_each() was never formulated as being problematic in
> the same way as list_for_each_entry(), was it? I guess I'm starting to
> not understand what is the true purpose of the changes.

Sorry for having caused the confusion. Let me elaborate a bit to give =
more context.

There are two main benefits of this entire effort.

1) fix the architectural bugs and avoid any missuse of the list iterator =
after the loop
by construction. This only concerns the list_for_each_entry_*() macros =
and your change
will allow lowering the scope for all of those. It might be debatable =
that it would be
more consistent to lower the scope for list_for_each() as well, but it =
wouldn't be
strictly necessary.

2) fix *possible* speculative bugs. In our project, Kasper [1], we were =
able to show
that this can be an issue for the list traversal macros (and this is how =
the entire
effort started).
The reason is that the processor might run an additional loop iteration =
in speculative
execution with the iterator variable computed based on the head element. =
This can
(and we have verified this) happen if the CPU incorrectly=20
assumes !list_entry_is_head(pos, head, member).

If this happens, all memory accesses based on the iterator variable =
*potentially* open
the chance for spectre [2] gadgets. The proposed mitigation was setting =
the iterator variable
to NULL when the terminating condition is reached (in speculative safe =
way). Then,
the additional speculative list iteration would still execute but won't =
access any
potential secret data.

And this would also be required for list_for_each() since combined with =
the list_entry()
within the loop it basically is semantically identical to =
list_for_each_entry()
for the additional speculative iteration.

Now, I have no strong opinion on going all the way and since 2) is not =
the main motivation
for this I'm also fine with sticking to your proposed solution, but it =
would mean that implementing
a "speculative safe" list_for_each() will be more difficult in the =
future since it is using
the iterator of list_for_each() past the loop.

I hope this explains the background a bit better.

>=20
>> What do you think about doing it this way:
>>=20
>> diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c =
b/drivers/net/dsa/sja1105/sja1105_vl.c
>> index b7e95d60a6e4..f5b0502c1098 100644
>> --- a/drivers/net/dsa/sja1105/sja1105_vl.c
>> +++ b/drivers/net/dsa/sja1105/sja1105_vl.c
>> @@ -28,6 +28,7 @@ static int sja1105_insert_gate_entry(struct =
sja1105_gating_config *gating_cfg,
>>                list_add(&e->list, &gating_cfg->entries);
>>        } else {
>>                struct sja1105_gate_entry *p;
>> +               struct list_head *pos =3D NULL;
>>=20
>>                list_for_each_entry(p, &gating_cfg->entries, list) {
>>                        if (p->interval =3D=3D e->interval) {
>> @@ -37,10 +38,14 @@ static int sja1105_insert_gate_entry(struct =
sja1105_gating_config *gating_cfg,
>>                                goto err;
>>                        }
>>=20
>> -                       if (e->interval < p->interval)
>> +                       if (e->interval < p->interval) {
>> +                               pos =3D &p->list;
>>                                break;
>> +                       }
>>                }
>> -               list_add(&e->list, p->list.prev);
>> +               if (!pos)
>> +                       pos =3D &gating_cfg->entries;
>> +               list_add(&e->list, pos->prev);
>>        }
>>=20
>>        gating_cfg->num_entries++;
>> --
>>=20
>>>=20
>>> Thanks for the suggestion.
>>>=20
>>>> 	}
>>>>=20
>>>> 	gating_cfg->num_entries++;
>>>> -----------------------------[ cut here =
]-----------------------------
>>>=20
>>> [1] =
https://lore.kernel.org/linux-kernel/20220407102900.3086255-12-jakobkosche=
l@gmail.com/
>>>=20
>>> 	Jakob
>>=20
>> Thanks,
>> Jakob

Thanks,
Jakob

[1] https://www.vusec.net/projects/kasper/
[2] https://spectreattack.com/spectre.pdf

