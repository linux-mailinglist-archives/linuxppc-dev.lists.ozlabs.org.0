Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 113CC6B17C0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 01:17:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX8rD6lDCz3cTk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 11:17:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=eeX5oeIz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=rcLheJYa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=eeX5oeIz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=rcLheJYa;
	dkim-atps=neutral
X-Greylist: delayed 654 seconds by postgrey-1.36 at boromir; Thu, 09 Mar 2023 11:16:08 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX8qD0nf5z3bV1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 11:16:07 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 0E83032000CC;
	Wed,  8 Mar 2023 19:05:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 08 Mar 2023 19:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1678320307; x=1678406707; bh=4iyVJ4N7edbrxfcyvsdNPy42ln5kQX3T6aR
	UhzsWpqU=; b=eeX5oeIzi6BzR/+nDKOGJmPkapLWMEVwfO/hNm9/4Rdk0WXMTsZ
	Y3GBivYrvL8HxXGZayJQCGPW4oZP81yRdpo/hnOaAWQEjLMa7/uXXasxJu5NRVTT
	ww9fraptjbh1Lilv59g6rmJiTqXI95HV/FVEuUn7OO9EpsAcHLr3/p8tKs0+nqIc
	TL/Bru6q3r0Z/WSfx27KQPO4MoN1TXyNJZFwO2F1jZtUFX95J1Re9oBOyyFbeKjU
	BCNoxExzLKK8UVfwaxIXE/C+fYU13lgkHvSb645EkGLEJLQQbUb1XLtm3OIrGhq/
	DQvUCJ0++6xrn7CjUbevAsPmQQgPB1UAz+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1678320307; x=1678406707; bh=4iyVJ4N7edbrxfcyvsdNPy42ln5kQX3T6aR
	UhzsWpqU=; b=rcLheJYaKEPd31MtqYaWxQbQQ1ocXlUYYbA3I97S+lOSg9XXvMi
	FvKZNGAqTsdWzR2rZ8W4jYSTtqngk068T2fvtEEiglLZVMvq9MQAvlRGncl3337E
	grd07qJB+js0BSYW1H18mE4/m5Ak7vs8V0RHitp1hM2FFeZnCWIMBAtuJVWCxx/L
	5CORt9IS/8vVdomSF8rsKihif942qdlVm2RGISggjhwznuZLCprIpZApzoEHZa4G
	Xr3+f+af5Cguuot80PVGVQQD1Xwptd7cDbtkhZKJ2wfU+F2+ykfzSJyNW0d0EaUy
	lmwW3MhL0FAJgWzegum4nwgDkzkg0VNPqQg==
X-ME-Sender: <xms:siIJZOWuD0gsNp28rY5Fkags5opUv38yWitbMIY0_vE1VA5KPbjZdA>
    <xme:siIJZKlR4d5iy-GL3oX5iiZyQtQiDJb50iAccSGt9w_M40fLt52IN2x5w-kESOEdm
    aJMW6zY2Va43XUtLw>
X-ME-Received: <xmr:siIJZCbzeSJzzTMgFn1ALPA04zCGFT1d8kn9eGu-vkDlxljfTHQX0Qyxpcqz3WbXIhLRxjuhwy-MBVEOIF4WowTGysqAOV-WzGFjLo4RYb-AUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddugedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdluddtmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepgfetvdffkedtueejgeduteehtddu
    vefhveevudffgfejueehuedvtdeguddvfeegnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghdpphgrghhurhgvrdhiohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:siIJZFUXTJ7nG2NqzrppI9H37okEY8PQ18S0B7hliOktMsjbItCQqg>
    <xmx:siIJZIkR_Dd4J39WNO4Tqj9zIRuq2lHxT9HGEv7oTSw80gjCu3zGlQ>
    <xmx:siIJZKcpR8f6kMupsttzxqkxjK5dfDTBuKqNosL5B0anlrKoTY1G2Q>
    <xmx:syIJZC7xw1nTZ2mzPLm48YI-KbuGNpzmZhwiIW3G3BDS8aTxC7xbWg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Mar 2023 19:05:03 -0500 (EST)
Message-ID: <942163490c9cb552d93bec6ed89d7617056c6d35.camel@russell.cc>
Subject: Re: [PATCH v4 1/2] powerpc/mm: Support execute-only memory on the
 Radix MMU
From: Russell Currey <ruscur@russell.cc>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>, Michael Ellerman
	 <patch-notifications@ellerman.id.au>
Date: Thu, 09 Mar 2023 11:05:00 +1100
In-Reply-To: <20230308152702.GR19419@kitsune.suse.cz>
References: <20220817050640.406017-1-ruscur@russell.cc>
	 <166195163958.45984.15308325694886524412.b4-ty@ellerman.id.au>
	 <20230308152702.GR19419@kitsune.suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: ajd@linux.ibm.com, anshuman.khandual@arm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com, linux-hardening@vger.kernel.org, bgray@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, nicholas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-03-08 at 16:27 +0100, Michal Such=C3=A1nek wrote:
> Hello,
>=20
> On Wed, Aug 31, 2022 at 11:13:59PM +1000, Michael Ellerman wrote:
> > On Wed, 17 Aug 2022 15:06:39 +1000, Russell Currey wrote:
> > > Add support for execute-only memory (XOM) for the Radix MMU by
> > > using an
> > > execute-only mapping, as opposed to the RX mapping used by
> > > powerpc's
> > > other MMUs.
> > >=20
> > > The Hash MMU already supports XOM through the execute-only pkey,
> > > which is a separate mechanism shared with x86.=C2=A0 A PROT_EXEC-only
> > > mapping
> > > will map to RX, and then the pkey will be applied on top of it.
> > >=20
> > > [...]
> >=20
> > Applied to powerpc/next.
> >=20
> > [1/2] powerpc/mm: Support execute-only memory on the Radix MMU
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > https://git.kernel.org/powerpc/c/395cac7752b905318ae454a8b859d4c1904855=
10
>=20
> This breaks libaio tests (on POWER9 hash PowerVM):
> https://pagure.io/libaio/blob/master/f/harness/cases/5.t#_43
>=20
> cases/5.p
> expect=C2=A0=C2=A0 512: (w), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 512: (r), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 512: (r), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 512: (w), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 512: (w), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 -14: (r), res =3D=C2=A0=C2=A0 -14 [Bad address]
> expect=C2=A0=C2=A0 512: (r), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 512: (w), res =3D=C2=A0=C2=A0 512 [Success]
> test cases/5.t completed PASSED.
>=20
> cases/5.p
> expect=C2=A0=C2=A0 512: (w), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 512: (r), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 512: (r), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 512: (w), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 512: (w), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 -14: (r), res =3D=C2=A0=C2=A0 -14 [Bad address]
> expect=C2=A0=C2=A0 512: (r), res =3D=C2=A0=C2=A0 512 [Success]
> expect=C2=A0=C2=A0 -14: (w), res =3D=C2=A0=C2=A0 512 [Success] -- FAILED
> test cases/5.t completed FAILED.
>=20
> Can you have a look if that test assumption is OK?

Hi Michal, thanks for the report.

This wasn't an intended behaviour change, so it is a bug.  I have no
idea why we hit the fault in write() but not in io_submit(), though.=20
The same issue applies under Radix.

What's happening here is that we're taking a page fault and calling
into access_error() and returning true when we shouldn't.  Previously
we didn't check for read faults and only checked for PROT_NONE.  My
patch checks the vma flags to see if they lack VM_READ after we check
for exec and write, which ignores that VM_WRITE implies read=20

This means we're mishandling faults for write-only mappings by assuming
that the lack of VM_READ means we're faulting from read, when that
should only be possible under a PROT_EXEC-only mapping.

I think the correct behaviour is

	if (unlikely(!(vma->vm_flags & (VM_READ | VM_WRITE))))

in access_error().

Will do some more testing and send a patch soon.  I also need to verify
that write implying read is true for all powerpc platforms.

- Russell

>=20
> Thanks
>=20
> Michal

