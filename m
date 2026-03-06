Return-Path: <linuxppc-dev+bounces-17791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNMVDNeSqml0TQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 09:39:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDB021D33E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 09:39:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS0Fv0lPyz3c5f;
	Fri, 06 Mar 2026 19:39:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772786386;
	cv=none; b=cw4AyH3oXdawi8YW7iq3scOxLi4nOkj5bi8+Qyx2sPwSX5GW4W9rzKCa7RFYrXMtL4Lfof4MGp77lB7kKzmxDIwGwEyUMNc+FCpgxCwqRQf4ArL+Vt56qQof2bAxqB1WKS7fP1J0YdiuaPZcr7WsURMhmThtmYTuZ2x6wlYZgICFgZoJU0U0ZBp2WLiRcBu48+BmwMbV57CePDD5LuuladwQZweO5IUKoLuPusW2g6Bz79sJhuMdtz9sYUAEvE8vSeKZ3s4zoS0Lo/DNL/pCo3cLEaMhKe9E55K2faIDdarVkV8wzgopY+QBwlgg2P/9icAzGNs4ZlHCldJv5ONX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772786386; c=relaxed/relaxed;
	bh=HUIl7fBnMjNKk+2kv/hV6OWGFREjM/5mAylke7VaoUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MG6T/GGqhf0F+uhbqsl3/BFldzKs1AIN3j9ikdUZWBWcnDkUhbJbWdF6C6RU2qcLt2Jplru92BwKmSOF6FxQnp3+IwxqhzlYpojyougc+Lc1xd5nogZRR/v0NCdBueeB35j6YBf8nVhuvcgXaJtNr1UA529cN3zUhpBPNPk8eO0uUfz3q3BHt2ZRdgzlVWf2Yia7F8fl4iIhtmHCsO5rFw7zR2a4SmFXch9tv553qC+QNqen8hpksKKr1he6zd2xSH5yMa1XB0RxBGoAJOKalWTZSelfdfvXmKyBh9kPYK6yZNpNPyApPMRGnKzaaR9ahVxMbwhGYyScRhCIvSyOsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=gC4EOFEJ; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=gC4EOFEJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS0Fq5rS5z30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 19:39:42 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id CC3E1240101
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2026 09:39:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1772786376; bh=HUIl7fBnMjNKk+2kv/hV6OWGFREjM/5mAylke7VaoUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=gC4EOFEJESiWVyZzIbEXMK5eifhrokpoYiDtKYVS9DwNoZoSVrqrcNDw1kOrjpumL
	 dYcB3LpM6KqrmUyHB5qxKkbCSz2DY2ZHGhc8F1HPobhS8pwALUM8srn3juImAwPZAY
	 5zpbOSnNY82YynEdkY8VOHYdlX8FKSqjW5YnS2iT3iVwzQoaFRqvX51MueAit46Otu
	 NpPw0TaqrgVPk0yAClAFub+ccULT6B87FAIeeRx98p2knprbVOMP/Ta72qklQi0Vmc
	 4f6rS5diZXfXKcW75yCmEbP3gkh5QDymO2RWMiz6EhJlUz4eho94IcTRxgW+xPMQTS
	 l7x4drOwBSCmg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fS0Fd6XyWz6tvm;
	Fri,  6 Mar 2026 09:39:33 +0100 (CET)
Date: Fri, 06 Mar 2026 08:39:35 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] powerpc: dts: Build devicetrees of enabled platforms
Message-ID: <aaqSxUNNNnRcB5U5@probook>
References: <20260305-mpc83xx-dtb-v2-1-cdb751458445@posteo.net>
 <6d736f38-bd33-4484-b3f2-bb9391976fe2@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d736f38-bd33-4484-b3f2-bb9391976fe2@kernel.org>
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3CDB021D33E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.net,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[posteo.net:s=2017];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17791-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:j.ne@posteo.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:geert@linux-m68k.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[j.ne@posteo.net,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.net:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j.ne@posteo.net,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[posteo.net,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,vger.kernel.org,lists.ozlabs.org,linux-m68k.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:32:41AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 05/03/2026 à 10:15, J. Neuschäfer via B4 Relay a écrit :
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > Follow the same approach as other architectures such as Arm or RISC-V,
> > and build devicetrees based on platforms selected in Kconfig. This makes
> > it unnecessary to use CONFIG_OF_ALL_DTBS on PowerPC in order to build
> > DTB files.
> > 
> > This makes it easier to use other build and test infrastructure such as
> > `make dtbs_check`, and is a first step towards generating FIT images
> > that include all the relevant DTBs with `make image.fit`.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> > Changes in v2:
> > - Use "dtb-$(FOO) += foo.dtb" format on every line, avoid backslashes
> >    (suggested by Geert Uytterhoeven)
> > - Link to v1: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F20260119-mpc83xx-dtb-v1-1-522f841290bf%40posteo.net&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9264db0cd3014d5c30c608de7a97cd4c%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639082989567825654%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=QS4N0muz5oPD3WzZQE3FsF5ghDDu9PSJ79iA5R%2FAd3w%3D&reserved=0
> > ---
> >   arch/powerpc/boot/dts/Makefile     | 111 +++++++++++++++++++++++++++++++++++++
> >   arch/powerpc/boot/dts/fsl/Makefile |  79 ++++++++++++++++++++++++++
> >   2 files changed, 190 insertions(+)
> > 
> > diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
> > index 0cd0d8558b475c..7fce8c819d3d72 100644
> > --- a/arch/powerpc/boot/dts/Makefile
> > +++ b/arch/powerpc/boot/dts/Makefile
> > @@ -3,3 +3,114 @@
> >   subdir-y += fsl
> >   dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
> > +
> > +# PPC44x platforms
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += arches.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += bamboo.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += bluestone.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += glacier.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += eiger.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += katmai.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += rainier.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += redwood.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += sequoia.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += taishan.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += yosemite.dtb
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += icon.dtb
> 
> Why so many lines ? You should be able to fit approximaly four per line,
> 
> dtb-$(CONFIG_PPC44x_SIMPLE) += arches.dtb bamboo.dtb bluestone.dtb
> glacier.dtb
> dtb-$(CONFIG_PPC44x_SIMPLE) += eiger.dtb katmai.dtb rainier.dtb redwood.dtb
> dtb-$(CONFIG_PPC44x_SIMPLE) += sequoia.dtb taishan.dtb
>  yosemite.dtb icon.dtb

Hm, fair enough, that would work too, and make it visually somewhat
clearer what belongs together.

I'll wait for more comments, but I think this is a good enough
improvement for a v3, while still keeping potential edit churn away as
Geert Uytterhoeven previously pointed out:

>> Even when it wouldn't fit on a single line, having separate
>> 
>>     dtb-$(CONFIG_FOO) += bar1.dtb
>>     dtb-$(CONFIG_FOO) += bar2.dtb
>> 
>> lines not only makes it a little bit shorter, but avoids the churn of
>> adding a backslash to the previous line when adding new entries.


Best Regards,
J. Neuschäfer

