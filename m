Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFAD6F6579
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 09:08:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBlJw2Bd4z3fC2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 17:08:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EjkBSZ/f;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=BUeVd8ah;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EjkBSZ/f;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=BUeVd8ah;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBPTJ6LYDz3bqx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 May 2023 03:44:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1683135855; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VkdDCklfOBaFIT91p9mQxURPjpOn/KVWbJ8rUwOHDbCv0X2WzYFGbnGFrxasRRmQlk
    Z/+58TW67pBmxpFSL1LDpq9bTAhtQTVyOJbqkwQIIPxwtTjsilKjzmNwVCFBlIL4n3Ej
    zqq3zPU7G6KA6Whr4rfjQCA6ISG6BRmUuZ+mYojd/am1RdLTYAiNp/IIv4eDgKgcYkgV
    n1Gq1ijSvnfAH88oJQqG8bxhkvpMW3CDG+LbOUNk1Q4Q9jqvXYWZlIHBlVuALUL0Ca/9
    aU/Zk5Zd+HYz3mle3NnGxwbv0h8/KDikXhEgWmWVc1toW9LkEH//acUJCacl/VQ5x530
    Ld0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683135855;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=APBmeZax7aoMjjZd9ORoi4qMUHA9Ju+6bMTI7MBRFZ0=;
    b=gIOQaaZ5E01STGul5FC4zHTpU78r0SPCXxgJxi4KT4gPT9klHhDQP5BGj+nsneK/Uj
    WXjQcFxTx9VApuFjOgpl4uH3JnIN4z3W2CSdgQ1tuxZO3VzqxJxxsQ1g/RXnG24e13uW
    g4vSZj7pnVqPNyuu0KMnK5fZxDrsndJy6ElllgY3/7kKMQYkJDRj2xNNEF1KTtcVL9qF
    psOtI67W0AYzAeGtnhyD1wfXr/P/kjyhuwlXB6hoDL/TGdgbNP8lf7rwE1o+WvENglih
    Ksvy544y3Ge3sk8kpN4juX4+qxJCzRM3/xRAZ1qmlJ6AqOYIA+ETVlB138mozmCEaUGx
    wQtA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683135855;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=APBmeZax7aoMjjZd9ORoi4qMUHA9Ju+6bMTI7MBRFZ0=;
    b=EjkBSZ/fwQdG44gLFLqXyhLuaDNKyz/CRw2RUxvUGMCqDQaz54O/KbLxe8rJ3h6GX3
    5l17SC+UeJuatsXH6mt8pShX/jRXzvDuzfZHkDmf2Fb2sF1D40Mf2mqXsRun4A41OVOJ
    VSqztWkx6P7EEkv9P9a3Stpa9dclwYc1gfi9uDrDcNR1SG/Io8geZRH/uyeT1UU9tWL2
    2rk8oNxdVS9vp/vUXnkWub6Kx3TqHulAUXjayFq5a/D8l4zIc2yVYDEyq3z6WThGAuZo
    6je5GzDS70An4udXiJ5xjqsmkuQ7aHtlZA+yE1WxK51lz27dmrYidlAwOnEsyS0F9kua
    G5cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683135855;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=APBmeZax7aoMjjZd9ORoi4qMUHA9Ju+6bMTI7MBRFZ0=;
    b=BUeVd8ahaEcnr9B5/iXEfbXxT3ZAGhJWCOzL2XPq5brC/cC4BnQF3gstYjydPCU50h
    RgFHcEQBsmkIqpBDHFBA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2dy2rpszH/2dGwexNKSEZ7snWI3viyNB0RBiPjt"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id w2b3aez43HiFOaX
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 3 May 2023 19:44:15 +0200 (CEST)
Content-Type: multipart/alternative; boundary=Apple-Mail-C25DFAE7-F84A-4F9D-ADB6-7607E26C36CB
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
Date: Wed, 3 May 2023 19:44:04 +0200
Message-Id: <E8CD3619-3B29-4602-B340-C5178FC6D54B@xenosoft.de>
References: <77078121-46E6-48D6-9D73-0C6D586FE410@xenosoft.de>
In-Reply-To: <77078121-46E6-48D6-9D73-0C6D586FE410@xenosoft.de>
To: Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (20E252)
X-Mailman-Approved-At: Thu, 04 May 2023 17:07:32 +1000
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail-C25DFAE7-F84A-4F9D-ADB6-7607E26C36CB
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 3. May 2023, at 19:28, Christian Zigotzky <chzigotzky@xenosoft.de> wrot=
e:
>=20
> =EF=BB=BF
>=20
>>> On 3. May 2023, at 18:51, Rob Herring <robh@kernel.org> wrote:
>>>=20
>>> =EF=BB=BFOn Wed, May 3, 2023 at 11:27=E2=80=AFAM Christophe Leroy
>>> <christophe.leroy@csgroup.eu> wrote:
>>>=20
>>> +Rob as he's the commit's Author.
>>>=20
>>>> Le 03/05/2023 =C3=A0 17:46, Christian Zigotzky a =C3=A9crit :
>>>> On 02 May 2023 at 11:28 am, Michael Ellerman wrote:
>>>>> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>>>>>> Hello,
>>>>>>=20
>>>>>> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.4-1=

>>>>>> [2].
>>>>>>=20
>>>>>> The kernel hangs right after the booting Linux via __start() @
>>>>>> 0x0000000000000000 ...
>>>>>>=20
>>>>>> I was able to revert the PowerPC updates 6.4-1 [2] with the following=

>>>>>> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
>>>>>>=20
>>>>>> After a re-compiling, the kernel boots without any problems without t=
he
>>>>>> PowerPC updates 6.4-1 [2].
>>>>>>=20
>>>>>> Could you please explain me, what you have done in the boot area?
>>>>> There's a few possibilities, but nothing obvious.
>>>>>=20
>>>>> To begin with can you please test the following commits?
>>>>>=20
>>>>> 77e69ee7ce07
>>>>> e4ab08be5b49
>>>>> eeac8ede1755
>>>>>=20
>>>>> cheers
>>>> git revert e4ab08be5b4902e5b350b0e1e1a3c25eb21d76d4
>>>>=20
>>>> [master 0086e2cbbec0] Revert "powerpc/isa-bridge: Remove open coded
>>>> "ranges" parsing"
>>>> 1 file changed, 129 insertions(+), 37 deletions(-)
>>>>=20
>>>> After a recompiling it boots without any problems.
>>>>=20
>>>> e4ab08be5b49 -- powerpc/isa-bridge: Remove open coded "ranges" parsing
>>>> is the bad commit.
>>=20
>> Could I get a DT file for this board?
>>=20
>> In the meantime, just revert this commit. I don't think I'll be able
>> to fix it before I'm out on sabbatical.
>>=20
>> Rob
>=20
> FYI:
>=20
> Darren Stevens wrote:
>=20
> The dtb passed by the CFE firmware has a number of issues, which up till
> now have been fixed by use of patches applied to the mainline kernel.
> This occasionally causes problems with changes made to mainline.
>=20
> Patching the firmware to correct the dtb is not an option for the=20
> following reasons:
>=20
> It was modified by a 3rd party, and we don't have a copy of the source.
>=20
> All versions of CFE used on the X1000 export the same dtb.
>=20
> At least one machine suffered damage during a firmware upgrade attempt,
> many people will be unwilling to reflash their system if an upgrade is
> produced.
>=20
>=20

Nemo=E2=80=99s DT:  https://forum.hyperion-entertainment.com/viewtopic.php?p=
=3D54406#p54406=

--Apple-Mail-C25DFAE7-F84A-4F9D-ADB6-7607E26C36CB
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><br><blockquote type=3D=
"cite">On 3. May 2023, at 19:28, Christian Zigotzky &lt;chzigotzky@xenosoft.=
de&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D=
"ltr">=EF=BB=BF<span></span><br><span></span><br><blockquote type=3D"cite"><=
span>On 3. May 2023, at 18:51, Rob Herring &lt;robh@kernel.org&gt; wrote:</s=
pan><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote=
><blockquote type=3D"cite"><span>=EF=BB=BFOn Wed, May 3, 2023 at 11:27=E2=80=
=AFAM Christophe Leroy</span><br></blockquote><blockquote type=3D"cite"><spa=
n>&lt;christophe.leroy@csgroup.eu&gt; wrote:</span><br></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+Rob as=
 he's the commit's Author.</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>Le 03/05/2023 =C3=A0 17:46, Christian Zigotzky a =C3=A9crit :</=
span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>On 02 May 2023 at 11=
:28 am, Michael Ellerman wrote:</span><br></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>Christian Zigotzky &lt;chzigotzky@xen=
osoft.de&gt; writes:</span><br></blockquote></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Hello,</spa=
n><br></blockquote></blockquote></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquo=
te></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>Our PASEMI Nemo board [1] doesn't boo=
t with the PowerPC updates 6.4-1</span><br></blockquote></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>[2].</span><br></blockquote></blockquote></blockquote></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
></span><br></blockquote></blockquote></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>The kernel hang=
s right after the booting Linux via __start() @</span><br></blockquote></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>0x0000000000000000 ...</span><br></blockquote=
></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>I was able to revert the PowerPC updates 6.4-1 [2] with=
 the following</span><br></blockquote></blockquote></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>co=
mmand: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1</span><br></=
blockquote></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>After a re-compiling, the kernel boots withou=
t any problems without the</span><br></blockquote></blockquote></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>PowerPC updates 6.4-1 [2].</span><br></blockquote></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>Could you please explain me, what you have done in the boot area?</span><=
br></blockquote></blockquote></blockquote></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>There's a few possibilities, but nothing obvious.<=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>To begin with can you please test the=
 following commits?</span><br></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>77e69ee7ce07</sp=
an><br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>e4ab08be5b49</span><br></blockquote></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>eeac8ede1755</span><br></blockq=
uote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n></span><br></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>cheers</span><br></blockquote></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>git revert e4ab08be5b4902e5b350b0e1e1a3c25eb21d76d4<=
/span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>[master 0086e2cbbec0] Revert "powerpc=
/isa-bridge: Remove open coded</span><br></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>"ranges" parsing"</span><br></blockquote></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span> 1 file changed, 129 insertions(+), 37 deletions(-)</span><br></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>After a recompiling it boots without any problems.=
</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>e4ab08be5b49 -- powerpc/isa-bridge: R=
emove open coded "ranges" parsing</span><br></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>is the bad commit.</span><br></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote typ=
e=3D"cite"><span>Could I get a DT file for this board?</span><br></blockquot=
e><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><span>In the meantime, just revert this commit. I don't think I'll be=
 able</span><br></blockquote><blockquote type=3D"cite"><span>to fix it befor=
e I'm out on sabbatical.</span><br></blockquote><blockquote type=3D"cite"><s=
pan></span><br></blockquote><blockquote type=3D"cite"><span>Rob</span><br></=
blockquote><span></span><br><span>FYI:</span><br><span></span><br><span>Darr=
en Stevens wrote:</span><br><span></span><br><span>The dtb passed by the CFE=
 firmware has a number of issues, which up till</span><br><span>now have bee=
n fixed by use of patches applied to the mainline kernel.</span><br><span>Th=
is occasionally causes problems with changes made to mainline.</span><br><sp=
an></span><br><span>Patching the firmware to correct the dtb is not an optio=
n for the </span><br><span>following reasons:</span><br><span></span><br><sp=
an>It was modified by a 3rd party, and we don't have a copy of the source.</=
span><br><span></span><br><span>All versions of CFE used on the X1000 export=
 the same dtb.</span><br><span></span><br><span>At least one machine suffere=
d damage during a firmware upgrade attempt,</span><br><span>many people will=
 be unwilling to reflash their system if an upgrade is</span><br><span>produ=
ced.</span><br><span></span><br><span></span><br></div></blockquote><br><div=
>Nemo=E2=80=99s DT: &nbsp;<a href=3D"https://forum.hyperion-entertainment.co=
m/viewtopic.php?p=3D54406#p54406">https://forum.hyperion-entertainment.com/v=
iewtopic.php?p=3D54406#p54406</a></div></body></html>=

--Apple-Mail-C25DFAE7-F84A-4F9D-ADB6-7607E26C36CB--
