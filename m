Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ECF4FA04D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 01:54:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZw8w0751z3bZX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 09:54:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pG1F0Mrm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pG1F0Mrm; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZw8G17sHz2xsN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 09:54:21 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id q20so6491928wmq.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 16:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=n5UPNQEDai1gUFUdN9sucmKpzqqEUym2Bv+35OpgTmc=;
 b=pG1F0MrmF0MxsheTCnU5KlnL7Fq3an1SzIoDIJWlvZTcNPwAejlsTxkr/aITjxttuN
 4t9qOz+HWVuW9mjRCjV1vM02Lp8cdd8MquH/W9I+QdExZFr0zL5FS2Nb0kvl0UlWCFVK
 NgbMRkfNJM8aq4eRSV2Ai4D/koQFTxUsZyeBDHnWTq2iI4ygMQjDD0DiM26d3Eg9r9fy
 whdlpXipwUciya55rwa+AMb/cR0AFXTNn9znvHshZnrvO2q7Hhgb3ypRlYjgYvC2QDHR
 tvaZ+Czt68GGIRMZ42zUl+nz0t57NIJTSXJjhID/BEsFgMymPAqNrdXgUaadY0zKbhfr
 5DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=n5UPNQEDai1gUFUdN9sucmKpzqqEUym2Bv+35OpgTmc=;
 b=Jsch9AfurSss44yc/ZyUSOqSSGWPEMengnEnG6t2wz5ZmAZ5wrtYlrLy7ATGRWf5c4
 x8E1Ua2dCOHM2LEISovxMSdTi3dzquiSdEC263BmIAecdsbsD4QZi1vuuPg8x4Jx9UZg
 BHvLRh2DAyrE1bD81+X3DnYTQnfeE62pLgh7FIA4965xgedUsoemsxdk9JtNBk2yPZvh
 x9o18mJSoF9t7+FGnG42xCxfNCmvd5Km2FUISTmHtcUK1npHyjVOJj97RcJFYTCYq+n9
 y+qdsaFw3OY7zSh8FaqptckX/Jze3OZMjnUTKl8fNgHLMQuJNxFQBljsWbIH2Ol38pFw
 HhOA==
X-Gm-Message-State: AOAM5324gUfEgttxwCeKVPbqCfeCUjNE24WJMO82OgLjx3wwHnGOhEZr
 NqJXBvB54gTMIc6OTrrhJDk=
X-Google-Smtp-Source: ABdhPJzYPe2XZp3HIcQrurMuTy8KVeKXLKzzK2Euy2m/YilBtUjHiW3sSWpaiPkVrXseuI50+m05lg==
X-Received: by 2002:a05:600c:190e:b0:38c:b1ea:f4ac with SMTP id
 j14-20020a05600c190e00b0038cb1eaf4acmr18783624wmq.70.1649462057538; 
 Fri, 08 Apr 2022 16:54:17 -0700 (PDT)
Received: from smtpclient.apple ([185.238.38.242])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm26542577wru.99.2022.04.08.16.54.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:54:16 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220408114120.tvf2lxvhfqbnrlml@skbuf>
Date: Sat, 9 Apr 2022 01:54:13 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA317E17-3B09-411B-9DF6-05BDD320D988@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
 <20220408114120.tvf2lxvhfqbnrlml@skbuf>
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

Hello Vladimir,

> On 8. Apr 2022, at 13:41, Vladimir Oltean <olteanv@gmail.com> wrote:
>=20
> Hello Jakob,
>=20
> On Thu, Apr 07, 2022 at 12:28:47PM +0200, Jakob Koschel wrote:
>> In preparation to limit the scope of a list iterator to the list
>> traversal loop, use a dedicated pointer to point to the found element =
[1].
>>=20
>> Before, the code implicitly used the head when no element was found
>> when using &pos->list. Since the new variable is only set if an
>> element was found, the list_add() is performed within the loop
>> and only done after the loop if it is done on the list head directly.
>>=20
>> Link: =
https://lore.kernel.org/all/CAHk-=3DwgRr_D8CB-D9Kg-c=3DEHreAsk5SqXPwr9Y7k9=
sA6cWXJ6w@mail.gmail.com/ [1]
>> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
>> ---
>> drivers/net/dsa/sja1105/sja1105_vl.c | 14 +++++++++-----
>> 1 file changed, 9 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c =
b/drivers/net/dsa/sja1105/sja1105_vl.c
>> index b7e95d60a6e4..cfcae4d19eef 100644
>> --- a/drivers/net/dsa/sja1105/sja1105_vl.c
>> +++ b/drivers/net/dsa/sja1105/sja1105_vl.c
>> @@ -27,20 +27,24 @@ static int sja1105_insert_gate_entry(struct =
sja1105_gating_config *gating_cfg,
>> 	if (list_empty(&gating_cfg->entries)) {
>> 		list_add(&e->list, &gating_cfg->entries);
>> 	} else {
>> -		struct sja1105_gate_entry *p;
>> +		struct sja1105_gate_entry *p =3D NULL, *iter;
>>=20
>> -		list_for_each_entry(p, &gating_cfg->entries, list) {
>> -			if (p->interval =3D=3D e->interval) {
>> +		list_for_each_entry(iter, &gating_cfg->entries, list) {
>> +			if (iter->interval =3D=3D e->interval) {
>> 				NL_SET_ERR_MSG_MOD(extack,
>> 						   "Gate conflict");
>> 				rc =3D -EBUSY;
>> 				goto err;
>> 			}
>>=20
>> -			if (e->interval < p->interval)
>> +			if (e->interval < iter->interval) {
>> +				p =3D iter;
>> +				list_add(&e->list, iter->list.prev);
>> 				break;
>> +			}
>> 		}
>> -		list_add(&e->list, p->list.prev);
>> +		if (!p)
>> +			list_add(&e->list, gating_cfg->entries.prev);
>> 	}
>>=20
>> 	gating_cfg->num_entries++;
>> --=20
>> 2.25.1
>>=20
>=20
> I apologize in advance if I've misinterpreted the end goal of your =
patch.
> I do have a vague suspicion I understand what you're trying to =
achieve,
> and in that case, would you mind using this patch instead of yours?

I think you are very much spot on!

> I think it still preserves the intention of the code in a clean =
manner.
>=20
> -----------------------------[ cut here ]-----------------------------
> =46rom 7aed740750d1bc3bff6e85fd33298f5905bb4e01 Mon Sep 17 00:00:00 =
2001
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Date: Fri, 8 Apr 2022 13:55:14 +0300
> Subject: [PATCH] net: dsa: sja1105: avoid use of type-confused pointer =
in
> sja1105_insert_gate_entry()
>=20
> It appears that list_for_each_entry() leaks a type-confused pointer =
when
> the iteration loop ends with no early break, since "*p" will no longer
> point to a "struct sja1105_gate_entry", but rather to some memory in
> front of "gating_cfg->entries".
>=20
> This isn't actually a problem here, because if the element we insert =
has
> the highest interval, therefore we never exit the loop early, =
"p->list"
> (which is all that we use outside the loop) will in fact point to
> "gating_cfg->entries" even though "p" itself is invalid.
>=20
> Nonetheless, there are preparations to increase the safety of
> list_for_each_entry() by making it impossible to use the encapsulating
> structure of the iterator element outside the loop. So something needs
> to change here before those preparations go in, even though this
> constitutes legitimate use.
>=20
> Make it clear that we are not dereferencing members of the =
encapsulating
> "struct sja1105_gate_entry" outside the loop, by using the regular
> list_for_each() iterator, and dereferencing the struct =
sja1105_gate_entry
> only within the loop.
>=20
> With list_for_each(), the iterator element at the end of the loop does
> have a sane value in all cases, and we can just use that as the "head"
> argument of list_add().
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> drivers/net/dsa/sja1105/sja1105_vl.c | 12 +++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c =
b/drivers/net/dsa/sja1105/sja1105_vl.c
> index c0e45b393fde..fe93c80fe5ef 100644
> --- a/drivers/net/dsa/sja1105/sja1105_vl.c
> +++ b/drivers/net/dsa/sja1105/sja1105_vl.c
> @@ -27,9 +27,15 @@ static int sja1105_insert_gate_entry(struct =
sja1105_gating_config *gating_cfg,
> 	if (list_empty(&gating_cfg->entries)) {
> 		list_add(&e->list, &gating_cfg->entries);
> 	} else {
> -		struct sja1105_gate_entry *p;
> +		struct list_head *pos;
> +
> +		/* We cannot safely use list_for_each_entry()
> +		 * because we dereference "pos" after the loop
> +		 */
> +		list_for_each(pos, &gating_cfg->entries) {
> +			struct sja1105_gate_entry *p;
>=20
> -		list_for_each_entry(p, &gating_cfg->entries, list) {
> +			p =3D list_entry(pos, struct sja1105_gate_entry, =
list);
> 			if (p->interval =3D=3D e->interval) {
> 				NL_SET_ERR_MSG_MOD(extack,
> 						   "Gate conflict");
> @@ -40,7 +46,7 @@ static int sja1105_insert_gate_entry(struct =
sja1105_gating_config *gating_cfg,
> 			if (e->interval < p->interval)
> 				break;
> 		}
> -		list_add(&e->list, p->list.prev);
> +		list_add(&e->list, pos->prev);

I was actually considering doing it this way before but wasn't sure if =
this would be preferred.
I've done something like this in [1] and it does turn out quite well.

I'll integrate this in the v2 series.

Thanks for the suggestion.

> 	}
>=20
> 	gating_cfg->num_entries++;
> -----------------------------[ cut here ]-----------------------------

[1] =
https://lore.kernel.org/linux-kernel/20220407102900.3086255-12-jakobkosche=
l@gmail.com/

	Jakob=
