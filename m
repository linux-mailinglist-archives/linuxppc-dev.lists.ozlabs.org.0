Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4092D248
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 15:07:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Wtv5WKeK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJyn373pyz3frq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 23:07:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Wtv5WKeK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJymK2V8Pz3cXt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 23:06:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720616734; x=1721221534; i=markus.elfring@web.de;
	bh=hL1FGV0d+/uNuT5MwoYkBSDKdQE8pznXZfxl1D6esK4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Wtv5WKeKXhTZ4xKMJdhVn4hR0512X93slSKmuJcIJq3zP4UTGggQGgS/rwS7KW7A
	 fWmPHQFZnmGKE5po8BZuXyWUjGeWcH7uKkXCcKLV0WrEuucuyxISWs55EOkfvLQbF
	 xpkJZwjHYvT0YsnNwh+yXvk3+Db8gY3XxyKLz6+IkV51bT2ygM1+FbHEkuutUY1zl
	 O/+b9NQHt8VooN5QiRor4c2mH6MG3Sxv52ajrp9ghTg9KVMWJ3JhbaME2nNb3CSsd
	 VtQXtqPNUZS20uh8njvx3uEcnZA03SjN4ANAPI2RlDGiBkxQqU3cWH1eDYiVy//rw
	 t3WkhWLnopmmo7M6IA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MD5jp-1sadhP2Yi1-00DHGg; Wed, 10
 Jul 2024 15:05:34 +0200
Message-ID: <17c94d87-e260-4155-90c1-b7e5013ac69e@web.de>
Date: Wed, 10 Jul 2024 15:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: make24@iscas.ac.cn, linuxppc-dev@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org
References: <20240710103352.1890726-1-make24@iscas.ac.cn>
Subject: Re: [v2] cxl: Fix possible null pointer dereference in read_handle()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240710103352.1890726-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ySccpis36z6zCEn3Lvza8Bcw69K9CLTO951Rfrr+vzx9/WjUznR
 uBGLzfKx31PWoZiRB7dopUjsxoO0LOxfLLn4qYbLDy1tjwFRFR18KxbDMxFvi5MN48BHBPQ
 miagwSx+EDmvQYcvoizxkyvQjC5+j5OC437GHMMocZo4AYMnYa8QXKcpxrrhdIXySYhjuF5
 a0sHalsGI2NtM8CUfLAHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QlxgUnxO+Gg=;x1/tJ3UEsXUlj19rmtzQQ0Bu+/G
 YIcvK+OTSSc01X209tkGyk5j8jwQlXZ32ANqTTIePu5iRihf4ut5PA3mR7P+FWxVwabR4HXzQ
 17Wscigeq99PSTCarfj4XqQ/Z8C4YRVLrBSDK5+9Fjd7HL8o9JSxFdluCYO0wT3lVPYH/BQca
 uf0lZpBzQjqf5cybjn2CSqA8HZHEBxhOTAx+gNqI5PWoEjsrMdAp4voUezMcf23rHXn181CM3
 Z1Emz5epnsZfAegPh3EQUeAS7Q0CkLrLfa2aADvyltNUTxIF4EArIC2ssrICGKEXBDCLBruPv
 eQvNRztTrwHhiAmdJpA3fqnpshh2+yl9eqbM+UqUgy/vqKrGmI34iAhz7yTy0Mkew6JOqclvo
 lMuHgPYa1nsnyuifDQr7bWVlAIHcWrgaaJzRdpfBpLmI/Nwqtoc68LHCAf75ozIpiIFauqz/6
 VL2SewEm9CM7hgs0Hclh2ddtfgyBFbPRXf35itDLjcKS2qO90FuDCW6Oe3qm5T/fwd3Q6nUPd
 n8smSTA6h59vpOccMJekDgxsO222HBG+DEF4h5m6d7RnpzqMUma5y+s7Vp5kQhqCN+lgjGjMg
 vt4YTnfgcRcw1NgAp2t/1e6ydafGPLJFtOgBaGiL4ZsxT5uVLqZu6KiFdEqyGwPjYdtS+yHlF
 uMmnbU+hIUH4YEpBswED5dCiHnRdhF4ojLT24KlMkbxnW4IhwneZ/FrRq4xN1sfeMJYhSraVe
 381f0ddaMdKzSNPHJuakGeAS+cKIOG4qq3W+LUulGRiCCfa8W+poZUgL3P/Cx+SXWb+ogIAa6
 IPsjOQ09tJ/I3rEl8xtJsHkg==
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
Cc: Maxime Ripard <mripard@kernel.org>, Wei Liu <wei.liu@kernel.org>, Christophe Lombard <clombard@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, "Manoj N. Kumar" <manoj@linux.ibm.com>, Aleksandr Mishin <amishin@t-argos.ru>, Frederic Barrat <fbarrat@linux.ibm.com>, Shuah Khan <shuah@kernel.org>, Ian Munsie <imunsie@au1.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=E2=80=A6
> - The potential vulnerability was discovered as follows: based on our
> customized static analysis tool,

I became curious in which time range further corresponding information wil=
l be published.


>                                  extract vulnerability features[1],

Various software corrections were published through the years.

Several error (or weakness) categories are known already.
https://cwe.mitre.org/
https://wiki.sei.cmu.edu/confluence/display/c/


> and then match similar vulnerability features in this function.
> - Reference link:
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/?id=3D2d9adecc88ab678785b581ab021f039372c324cb

Another reference format can be helpful also for the commit c534b63bede6cb=
987c2946ed4d0b0013a52c5ba7
("drm: vc4: Fix possible null pointer dereference") from 2024-04-15.

Regards,
Markus
