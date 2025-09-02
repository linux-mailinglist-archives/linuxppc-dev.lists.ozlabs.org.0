Return-Path: <linuxppc-dev+bounces-11614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A8B3FD02
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 12:51:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGMxJ2CjMz2xpn;
	Tue,  2 Sep 2025 20:51:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756810292;
	cv=none; b=MN3QvJxqt3FoVzK5Kb1msK+uSC+iprDStCboUi8Y2Kf7QMn2sjIoW+rHGhaC9foCzFA0jXlIGX90u5E6+jt6aKUfgx5vwB+qLB4VYjMuigpm6dNew5Q01FNDJ0dVtfsC5LMFCGlXAS8iMK3D9z6SKnjqvGIBg3WcnI0rnGWeP5GNiRLYyErT9zVjnL0rKSqgjOO/xiGf6pVb5SfMKwRAcsOlZ4UEVQ+2ZHSUWmYGgAaNelraqqMPS9HPs5/klwW69wk81DtsbKHsIkYwWgobb4XwQ5kHC416UacSpvPxdAWUpVkU2pvUOph/0hBqADDCUTQe8iYzNXN+OiTKpPNFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756810292; c=relaxed/relaxed;
	bh=5oCH/UAMV/Ow7I5KjhpkHLsSOUSZe/gM+gFWpbFwqd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9sj9ZxAWubBNBdvR2HSyniw6rI+mr8P2gchlTMi8oee7kkK4zxx76g7Tv5aWdqlkb4Ku+3U5GPX8Nd3+AF+HnH5IZWoSGbnPtN0uZQM7s/lgLZLziBSB/1wBxb3CGdzWyGETTzwxzJLsX7XEvzH3pLZfA/To43t6vOtETacPkvXdQrM4xhsSDREsF1mh99RvFdP9B9T+tEpbxX0KWkBrJoH91oQiSUOfukTu8/Ow9fDwp2GwA19uTPPHUwQ3o0VRUhYUAd+rK/vtYyg9mldJpZzQk4HSliNcrYMPL35wxgL0pBpOewIr4CuqxklXMkehd9Eq1p4nliOknsET4uJoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BqjzIpA/; dkim-atps=neutral; spf=pass (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BqjzIpA/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGMxG3VkVz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 20:51:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756810282; x=1757415082; i=markus.elfring@web.de;
	bh=5oCH/UAMV/Ow7I5KjhpkHLsSOUSZe/gM+gFWpbFwqd0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BqjzIpA/VWQeYLrTo2eWTcKg1Z+/fQUZ3+X8LxKIcpg1SvubA+ysNspSc+V2LIXC
	 Pbc+D5glHCT1FRKg0ZP7o4cS9btSJ8wAenqBObrv5G0Vlww4XVNevqhd+QvkeqEJA
	 HckWmj5/hYoKtJL5ehJfdOzn7gUAxeFXvs5jV634f8GmbIeansFz3se82WRQfORzB
	 d+qWu1UW89GQwakA0ibAM+wPdPdnmaTWnBrF2YFO3fQkXb4zn9c3TSit6O6kNxjSi
	 mdu0xPexlFAB+3IftzvrX/aAX46K1vrMVKw1r1JnN0InivtbQpPHWKpn2sDIpQtiF
	 O1zuk9L2heXPLdDxkA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Melaj-1uJEVj1Agv-00c9xY; Tue, 02
 Sep 2025 12:51:22 +0200
Message-ID: <75284139-15f9-4cb6-8b6e-44b9f5312f54@web.de>
Date: Tue, 2 Sep 2025 12:51:20 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: pasemi: fix PCI device reference leaks in pas_setup_mce_regs
To: Jiri Slaby <jirislaby@kernel.org>, Miaoqian Lin <linmq006@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Olof Johansson <olof@lixom.net>, Paul Mackerras <paulus@ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250902072156.2389727-1-linmq006@gmail.com>
 <63be79a4-79e4-47f5-a756-aa55fe0d29ab@web.de>
 <d620167b-ba52-4f80-82bc-1a35223f96e6@kernel.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <d620167b-ba52-4f80-82bc-1a35223f96e6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qkJgSfUQRHDUBjKXTnPkIaQJnw4BApWlKae00poTjroIKXjD8Ih
 2lPfwJNfJJMCtwdBDBPOG5SnCrZ4ccMjBwkA/V0cbKohaXFFOvcio1AccLoK2X7JdKjNXFj
 VqHPTFWhnanX1bcB5pnj4NaPKF9AhQpDo/U02alKCkRnqQ42oym1YeGoiFt9KBQs/SgbKNS
 uGGmWClTTpQHpRpafSjgg==
UI-OutboundReport: notjunk:1;M01:P0:O9SB3Lj683U=;QiORRqIzC0CLJ22Ht3pjTrAVGPw
 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
 /AGeakanwk58ADqbDPT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>> *=C2=A0Would=C2=A0you=C2=A0like=C2=A0to=C2=A0increase=C2=A0the=C2=A0app=
lication=C2=A0of=C2=A0scope-based=C2=A0resource=C2=A0management?
>> =C2=A0=C2=A0https://elixir.bootlin.com/linux/v6.17-rc4/source/include/l=
inux/device.h#L1180
>=20
> That=C2=A0won't=C2=A0work=C2=A0here=C2=A0at=C2=A0all.

Why do you think in this direction here?

Regards,
Markus

