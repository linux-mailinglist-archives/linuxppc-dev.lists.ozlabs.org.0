Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 074418A153E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 15:06:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=beT4DTQy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iHB5ETUr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFg2N5fJsz3vbS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 23:06:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=beT4DTQy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iHB5ETUr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.151; helo=fout8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFg1Y1k30z3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 23:06:08 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 276C0138025B;
	Thu, 11 Apr 2024 09:06:04 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 11 Apr 2024 09:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1712840764;
	 x=1712927164; bh=yj3L41BBACRzg4qgbnEqB1wd5tAnTER3vhd4irRjfD0=; b=
	beT4DTQyVXapX9VjkjPwhPXdHURnM/ZCCDls9VSQvZ8jnWlZeo/nciiuyV20/Kt5
	QSIvDXPNpWMfdNCSMEZlAg2qvGK4qSrETVZkcVNW/Rzqn9sPNV2RmNKthjLnBElO
	PSdTY8BOa2uIzcj3cNr97247hhrF5OgHkvr6e3ID3MrM82S+YN+F+ki9pH7RlaD7
	srA3Xh0N0ptDWxMRt+vxYwjHkoqjsbei9U6aDHj44C1fxYygKrdo50pNnz1vpHo3
	Gg6bTlsUiFzO70iavY0+M7qfca3ERWSO1riSHIQFgdjRIMNjUsJeC+kyips3x6zc
	gvG38wCdhwIAIuSNrQE+0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1712840764; x=
	1712927164; bh=yj3L41BBACRzg4qgbnEqB1wd5tAnTER3vhd4irRjfD0=; b=i
	HB5ETUr01AhS0wBRoP6D0jH8qNl/9c1nhUBdv0B3Dfnjh8qTr4/n0JGzsSz6Fod0
	j9JXff6yOtVRy3nmLrZt3I7ma7Dc6chD41WCFXvBGhmNow+Ctl/l/KRAf9tFUgRD
	Tep0m4+npFqHts87z7IKjSYAoR03rB2Hid0ThQ7Bs4ydXomNaxn2+48F06h+Ai2S
	8J/zdRPmKRLFOmmzvud7mcZLWBRJCdXEh/32+CnBm3vE+MQ8uH7eXLkEpBGh3CcL
	K17eDgvryQL8tDfImuaGcdv1yGumwv6nduafJtsjsuKMu+ocN9M/80ih/l3G9GRy
	PuGYHXYva62LWR1AMv3Pw==
X-ME-Sender: <xms:OuAXZpDP_dsT5ECfjNFjYbmlgwtgrsce17kShjG5fbvlQvgcU3ROoA>
    <xme:OuAXZnjcQjSF1HhAnOcj1qasYyVXOTegxXbe8Lz9NB8Jhh7zI2iHahWL8pS3dF7zN
    XaQp5szmEk_rOTvkxk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehkedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:OuAXZkkHjJhpq-znzUOIFXxPGrOSG_RbON5nK9ERCI0vIUyXSOqJ9A>
    <xmx:OuAXZjwcWgyyKd_sj3c4YoF3pahZKhxPOvFXD3pJsmp1fD988lFPnQ>
    <xmx:OuAXZuSxT4Mnc3kr-8fJgSJZipdpvdg4-mCmtR-iyMbzGtIhnSahog>
    <xmx:OuAXZmYy2Lk0FzuBtsseotdcsoHsPYFt-UOdp44tiHza0Yj3qVEt2A>
    <xmx:POAXZsnqYF5uSSbA0rka_l_foY-XGEg88Thvb2s23eW3mc1zKwaoEKRW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5E9FFB6008F; Thu, 11 Apr 2024 09:06:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <cc62b891-d636-4d70-8792-eebcb5c7c5d5@app.fastmail.com>
In-Reply-To: <e0e1518c-9319-4af9-9b7d-3eb985f2e6da@csgroup.eu>
References: <20240215162327.3663092-1-sean.anderson@seco.com>
 <20240219153016.ntltc76bphwrv6hn@skbuf>
 <e0e1518c-9319-4af9-9b7d-3eb985f2e6da@csgroup.eu>
Date: Thu, 11 Apr 2024 15:05:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Vladimir Oltean" <vladimir.oltean@nxp.com>,
 "Qiang Zhao" <qiang.zhao@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>,
 "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [RESEND PATCH net v4 1/2] soc: fsl: qbman: Always disable interrupts when
 taking cgr_lock
Content-Type: text/plain;charset=utf-8
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
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sean Anderson <sean.anderson@seco.com>, Netdev <netdev@vger.kernel.org>, Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Scott Wood <oss@buserror.net>, Eric Dumazet <edumazet@google.com>, Camelia Groza <camelia.groza@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 10, 2024, at 06:54, Christophe Leroy wrote:
> Le 19/02/2024 =C3=A0 16:30, Vladimir Oltean a =C3=A9crit=C2=A0:
>> On Thu, Feb 15, 2024 at 11:23:26AM -0500, Sean Anderson wrote:
>>> smp_call_function_single disables IRQs when executing the callback. =
To
>>> prevent deadlocks, we must disable IRQs when taking cgr_lock elsewhe=
re.
>>> This is already done by qman_update_cgr and qman_delete_cgr; fix the
>>> other lockers.
>>>
>>> Fixes: 96f413f47677 ("soc/fsl/qbman: fix issue in qman_delete_cgr_sa=
fe()")
>>> CC: stable@vger.kernel.org
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
>>> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
>>> ---
>>> I got no response the first time I sent this, so I am resending to n=
et.
>>> This issue was introduced in a series which went through net, so I h=
ope
>>> it makes sense to take it via net.
>>>
>>> [1] https://lore.kernel.org/linux-arm-kernel/20240108161904.2865093-=
1-sean.anderson@seco.com/
>>>
>>> (no changes since v3)
>>>
>>> Changes in v3:
>>> - Change blamed commit to something more appropriate
>>>
>>> Changes in v2:
>>> - Fix one additional call to spin_unlock
>>=20
>> Leo Li (Li Yang) is no longer with NXP. Until we figure out within NXP
>> how to continue with the maintainership of drivers/soc/fsl/, yes, ple=
ase
>> continue to submit this series to 'net'. I would also like to point
>> out to Arnd that this is the case.
>>=20
>> Arnd, a large portion of drivers/soc/fsl/ is networking-related
>> (dpio, qbman). Would it make sense to transfer the maintainership
>> of these under the respective networking drivers, to simplify the
>> procedures?

If there are parts that are only used by networking, I'm definitely
fine with moving those out of drivers/soc into the respective users,
but as far as I can tell, all the code there is shared by multiple
subsystems (crypto, dma, usb, ...), so that would likely require
at least a reorganization.

> I see FREESCALE QUICC ENGINE LIBRARY (drivers/soc/fsl/qe/) is maintain=
ed=20
> by Qiang Zhao <qiang.zhao@nxp.com> but I can't find any mail from him =
in=20
> the past 4 years in linuxppc-dev list, and everytime I wanted to submi=
t=20
> something I only got responses from Leo Ly.
>
> The last commit he reviewed is 661ea25e5319 ("soc: fsl: qe: Replace=20
> one-element array and use struct_size() helper"), it was in May 2020.
>
> Is he still working at NXP and actively maintaining that library ?=20
> Keeping this part maintained is vital for me as this SOC is embedded i=
n=20
> the two powerpc platform I maintain (8xx and 83xx).
>
> If Qiang Zhao is not able to activaly maintain that SOC anymore, I=20
> volonteer to maintain it.

Thanks, much appreciated. The QE driver is also used on
arm64/ls1043a, but I have not seen any email or pull requests
from Qiang Zhao for that driver either.

The previous setup was that Li Yang picked up patches for
anything under drivers/soc/fsl/ and forwarded them to
soc@kernel.org for me to pick up.

I would very much like to get back to the state of having
one or two maintainers for all of drivers/soc/fsl/ and
not have to worry about individual drivers under it when
they are all maintained by different people.

Shawn Guo is already maintaining the arm64 side of
Layerscape in addition to the i.MX code. Herve Codina in
turn has taken responsibility for qe/qmc.c and qe/tsa.c.

Maybe you can pick one more more maintainers for
drivers/soc/fsl/ between the three of you to collect
patches into a git branch and send pull requests to
soc@kernel.org?

      Arnd
