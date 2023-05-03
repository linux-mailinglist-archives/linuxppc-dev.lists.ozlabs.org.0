Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC5C6F5D09
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 May 2023 19:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBP8505gfz3fDP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 03:29:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Y2OudcoH;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=tm2WLOsa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Y2OudcoH;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=tm2WLOsa;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBP7B4S0tz3bg3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 May 2023 03:28:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1683134908; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gC/hRnQ1p09jsAmcVMtfir2oUav2STeektaJq2yUu12LQO7hZvfsd3K1Akz1WKPWar
    Ll0PtLhnOGe84hncHEGoDJ9sjyaLlHhLiS7IAvOOxkGr9+PLX0Knkf7Z8OouqBIg3g62
    UWTBimRMd/A1voHBBHtfEVPqnU25Hq4SHgm932IbA/V+Lb2TAEvfnCxdAe6Mcl3mlF+u
    vfIr0cQr9bi+xhW9JfZogtyWSUGSloQdnyCcb5cLjR0/LZ73jxzqHybLw6k8adRCiQSS
    AaVAk4CoVLPWSv+dbHr3Rg2I0F9+F1t78gNHCtvjrDXHP5BckVYzvLzfQ8IlTAqEHYl5
    8gKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683134908;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Hg6PglwMqq/DratcSuzvpAfJiqitDcI6fpgGS3vXcNk=;
    b=E/Eph6xq1i13t4VzQGuSqyQtsam2eaf4BBN1PnfvqBVxDFog1OxHBaeIXwibMM+wjJ
    FYsSnEenwdyLo99g7ck69rf23BzaarsjZHL90tANKZ+ffO/RwY7Ot7x1+3W6BSPxb7Rt
    VwGHa7jsDybgRp7bAXmJgY7THVmkUnuBjv53mK3IAiiMDro7HGujYPTioaSfC1SdA8pa
    brWc07/ivGcJlf9f7dN+CGzWEyC8hSi8zk/5RJAYrE1upjIGFAiqO1yJciZrybDmvTsk
    fbnScykjkBgQL2pebT/IWjQ9JMHkpkOwL6f5P2YbN3NnGa8nKK7gxD6eLS/+Zea6OvfY
    1PvA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683134908;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Hg6PglwMqq/DratcSuzvpAfJiqitDcI6fpgGS3vXcNk=;
    b=Y2OudcoH/iwNS15fXN2WGVtKRkEbrJ1n/+hP1dQZ8IL8ESZh9YCv5LdVhq/g1jPp9F
    Yv3G8E3d8Me3HWRn1fTlOEXhhTnvQdoL3zMa5NplalvzrkxSLMuO07cWMg3XwTVDhBs7
    qFzzEiB8/lzSupL86l+R1cRN0SzbiLs1fO3uPyc6MqSSBLl913Y8Dy3ONtulnW5hcVS2
    OeHF0qcYhM273ab8EUA7t8N6EEiDZt8xtYpx5GseEvzYPzxlxQKn8i0Gdcq4LoDrj7EJ
    LISYAL2rZW263o8xSV2DRCDdAezx++MFQHDbCbt4HfCYLxDtrofbMmrLuXpoIJk4z/pN
    3BIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683134908;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=Hg6PglwMqq/DratcSuzvpAfJiqitDcI6fpgGS3vXcNk=;
    b=tm2WLOsahrYXOXEom4e+Qv6YR37Mx0emMRvHM4dQAwlZmOHk5wvfJ1QKNkVwgY/YcB
    p9dyPN4Jh0jQ/gvIZhCQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2dy2rpszH/2dGwexNKSEZ7snWI3viyNB0RBiPjt"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id w2b3aez43HSQOYl
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 3 May 2023 19:28:26 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
Date: Wed, 3 May 2023 19:28:15 +0200
Message-Id: <77078121-46E6-48D6-9D73-0C6D586FE410@xenosoft.de>
References: <CAL_JsqLZhWZqS7mcyvAEu=m_TmkoZ5V4h54Jh25+Ms0J1_z9Fw@mail.gmail.com>
In-Reply-To: <CAL_JsqLZhWZqS7mcyvAEu=m_TmkoZ5V4h54Jh25+Ms0J1_z9Fw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (20E252)
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



> On 3. May 2023, at 18:51, Rob Herring <robh@kernel.org> wrote:
>=20
> =EF=BB=BFOn Wed, May 3, 2023 at 11:27=E2=80=AFAM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>=20
>> +Rob as he's the commit's Author.
>>=20
>>> Le 03/05/2023 =C3=A0 17:46, Christian Zigotzky a =C3=A9crit :
>>> On 02 May 2023 at 11:28 am, Michael Ellerman wrote:
>>>> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>>>>> Hello,
>>>>>=20
>>>>> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.4-1
>>>>> [2].
>>>>>=20
>>>>> The kernel hangs right after the booting Linux via __start() @
>>>>> 0x0000000000000000 ...
>>>>>=20
>>>>> I was able to revert the PowerPC updates 6.4-1 [2] with the following
>>>>> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
>>>>>=20
>>>>> After a re-compiling, the kernel boots without any problems without th=
e
>>>>> PowerPC updates 6.4-1 [2].
>>>>>=20
>>>>> Could you please explain me, what you have done in the boot area?
>>>> There's a few possibilities, but nothing obvious.
>>>>=20
>>>> To begin with can you please test the following commits?
>>>>=20
>>>> 77e69ee7ce07
>>>> e4ab08be5b49
>>>> eeac8ede1755
>>>>=20
>>>> cheers
>>> git revert e4ab08be5b4902e5b350b0e1e1a3c25eb21d76d4
>>>=20
>>> [master 0086e2cbbec0] Revert "powerpc/isa-bridge: Remove open coded
>>> "ranges" parsing"
>>>  1 file changed, 129 insertions(+), 37 deletions(-)
>>>=20
>>> After a recompiling it boots without any problems.
>>>=20
>>> e4ab08be5b49 -- powerpc/isa-bridge: Remove open coded "ranges" parsing
>>> is the bad commit.
>=20
> Could I get a DT file for this board?
>=20
> In the meantime, just revert this commit. I don't think I'll be able
> to fix it before I'm out on sabbatical.
>=20
> Rob

FYI:

Darren Stevens wrote:

The dtb passed by the CFE firmware has a number of issues, which up till
now have been fixed by use of patches applied to the mainline kernel.
This occasionally causes problems with changes made to mainline.

Patching the firmware to correct the dtb is not an option for the=20
following reasons:

It was modified by a 3rd party, and we don't have a copy of the source.

All versions of CFE used on the X1000 export the same dtb.

At least one machine suffered damage during a firmware upgrade attempt,
many people will be unwilling to reflash their system if an upgrade is
produced.



