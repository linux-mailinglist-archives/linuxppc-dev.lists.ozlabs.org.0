Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7754FA059
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 01:59:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZwFm0MxDz3bhQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 09:59:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UTGVqcy3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329;
 helo=mail-wm1-x329.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UTGVqcy3; dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZwF80q6Cz2xss
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 09:58:35 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso8614178wma.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 16:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qd3xc3Ra5RdXly3fLoBNbPp+Yte3DEybTK7LULZsV3k=;
 b=UTGVqcy3UNBHn4SjP055yjMHx25cx36ejPBp1IwM+TK42xPMJWggb62u36PjAn6CNs
 erjoHyHU8VCNFk6fyYMl9z5v01Gp4wFgd/YNtvHzVZoUNO1l1su4dzjYvBw8kUi9XQGT
 Dqx4LfV7Q3W3Q2ELUZ+IriwQLR2xNOatUWwcD4gCTCxw1L69vExXISL5tvGEhODxE6Rx
 NyTL6VCNOxreRWn96Q5S2m2f20ESHMigOHCRieFZbYkKlad5VdovjvaPkuSuw/BSGDvW
 pPhBauUCmlFtTa8H2+PKUY86AjdMN4Ej5kEfWhaBYJ/9ht3pshbQ+wwXawCFIYrMD9Xn
 BSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qd3xc3Ra5RdXly3fLoBNbPp+Yte3DEybTK7LULZsV3k=;
 b=4Jc5dS7u3BdQIBun5JZYKaYlKYb26KkMpuS6hayOWNYskMhna9SmDcMzgS/dJ97g0i
 GfIkvyZxv4XIJA2sy3rBzToGgNIVlTrtiHJSgn8nIielmzV4pi9oV/fCxR63USKH1inE
 cUv1tgF/kaXX5Z5WDL4+4hGotLrkVAbwLk+rPWMBVbBvN7C+oK0Lo+jqbNMp29vbZlPV
 WAxGWXVKgZ4FI7W8As5rAl/nweu4cZwOQkqtRQxWHOHUtq9j1mRf/yyCu8g0cmSDyJTX
 Q7EjLbfrjdaiEnRvHsSgp4/Jucze2zzhr8Esy3YTCVJMqB0a67/kbAVNrI9iMlE463gS
 nkKg==
X-Gm-Message-State: AOAM532OeeCJQqIz56vsEyFoGp0MaSFZPQvRiVHuZDKygfHSg4AIBvfH
 yroHWtUfp6SvtNruRdymPBo=
X-Google-Smtp-Source: ABdhPJwvJD+Cmd/2tHHonwkEVj4aZLwFznxjwZ531F0NRT9DZUNezEkyG1rHEVZvGmv1umZ1GStMeg==
X-Received: by 2002:a7b:c844:0:b0:38e:7c92:a9e3 with SMTP id
 c4-20020a7bc844000000b0038e7c92a9e3mr18808150wml.140.1649462311057; 
 Fri, 08 Apr 2022 16:58:31 -0700 (PDT)
Received: from smtpclient.apple ([185.238.38.242])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c4fd100b0038cd5074c83sm12043743wmq.34.2022.04.08.16.58.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:58:30 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220407205426.6a31e4b2@kernel.org>
Date: Sat, 9 Apr 2022 01:58:29 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <AAB64C72-5B45-4BA1-BB48-106F08BDFF1B@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
 <20220407205426.6a31e4b2@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Vladimir Oltean <olteanv@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Casper Andersson <casper.casan@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Jakub,

> On 8. Apr 2022, at 05:54, Jakub Kicinski <kuba@kernel.org> wrote:
>=20
> On Thu,  7 Apr 2022 12:28:47 +0200 Jakob Koschel wrote:
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
>=20
> This turns a pretty slick piece of code into something ugly :(
> I'd rather you open coded the iteration here than make it more=20
> complex to satisfy "safe coding guidelines".

I'm not entirely sure I understand what you mean with=20
"open coded the iteration". But maybe the solution proposed by Vladimir =
[1]
works for you? I'm planning to rewrite the cases in that way for the =
relevant
ones.

>=20
> Also the list_add() could be converted to list_add_tail().

Good point, I wasn't sure if that's considered as something that should =
be
done as a separate change. I'm happy to include it in v2.

Thanks for the input.

	Jakob

[1] =
https://lore.kernel.org/linux-kernel/20220408114120.tvf2lxvhfqbnrlml@skbuf=
/

