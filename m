Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 878B65B126D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 04:23:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNNGV2zyzz2yRH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 12:23:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=Y+05XEfh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oQpnM2VS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=Y+05XEfh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oQpnM2VS;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNNFk0P6Zz2xHN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 12:23:05 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id DD02C5C00CB;
	Wed,  7 Sep 2022 22:23:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 07 Sep 2022 22:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1662603780; x=
	1662690180; bh=sslWQeYlXXX3sxKJwHGva/SaJ90eKmToiXu0iIghmoU=; b=Y
	+05XEfhbpEhg888QUK0Rha0o0/OOVqnzfLoqpP8Oi6VSNdZAX9miauR7aUpWXMio
	v7cEMrt0pBO4xCCTuyRUcRCiUzntUnXnUHpgP35QQRgi+pW3JBuCcipEZG1wdnNR
	dAUEFtwpO1t6h7/Ddyz8msgtNz10w6iqyMbWUmXdjhD97SG6WBUje1iebr7VWo2Z
	F66bJAIstMk4nr0phLJa3C9rS2NUoVkBYHoo5s3DU54IBiuRHMWhi4mdxlHmOUH7
	oTfOBYixr/fjG2yIEZgYWrwKP6XhToNagMsQALUYmJ3y7VhmQBY2PesyT08lylkK
	9MkQoauedNB4EKtHDOVcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662603780; x=
	1662690180; bh=sslWQeYlXXX3sxKJwHGva/SaJ90eKmToiXu0iIghmoU=; b=o
	QpnM2VSALQUrtF/lbKSrICiPxVV6V9EX0OA2hNTmoNv72ZkYZF9cWFHjXJG76RWs
	WmZafn76AU4yG3ERByuxwstyMz1KF8LBSLHbHPyIDPBpEk6xC0ZBdM6s+yintbOr
	GWg1Lu5j9Q9NM/4FLDBQt5BRjOXNg2bW/inxzBBzPl53/RPEeP+mJ6St4hk0GnO8
	QJRwvuYrxDY0nCNUrDGrA79IxObI9edahHQPjN8ncNXZaHlpSdY537OuuJPY3X87
	VRFUwi35cDwAyxlQYwSOiZkZhQ6lT37yEN41IV+Lb/VdUbYDP3KfSn8k2Fe2+KsU
	olglz/zW0j1XOpoNGqaaQ==
X-ME-Sender: <xms:BFIZYw_1vQjxysJZdLuDH4n0cOfcOTEtWWSxx6cojc5keVeLzKvXyg>
    <xme:BFIZY4vt1paNRpAECy2EU8z44JLRgRhezTb0SF9zQSlqM42I74ZdubN2LXNrd4nAt
    oOckSZHl8EY-VkmUQ>
X-ME-Received: <xmr:BFIZY2BectC0XAMdDaifqFgs_99ultMzokSXMrfapKygBItW-Sz1xFZ_1IYAGYd3iwDxCgBaxiHhap4pT-R-wqmZ5Xt84XHpFTS1dyqE75ZhhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtuddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepkeeutdeiffegffefffffleekheff
    tdelueelhfeifefhvddtkeekvedtleekgeeunecuffhomhgrihhnpehgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehr
    uhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:BFIZYwfb3waviqr_YvHZpI1R_pmWYUp1G-0rFa2yM3loogne8fFLXg>
    <xmx:BFIZY1NQ0EQYVyS1zhdq_BD-RW4Ojz89kaiMTc-wO2ClgWKBGGh63w>
    <xmx:BFIZY6lhR_yyEU2cNX7wdZwPNDozCZHv5Q_2WGzGz4YauwQlAqvDhw>
    <xmx:BFIZY2Gdhy-m_tJD63cvCBkA88XhqSwTSv_tkUe_Jynt-XLj2IHhgg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 22:22:57 -0400 (EDT)
Message-ID: <0be6de8ef17c046d923ad832edf36936084c10f3.camel@russell.cc>
Subject: Re: [PATCH v5] livepatch: Clear relocation targets on a module
 removal
From: Russell Currey <ruscur@russell.cc>
To: Joe Lawrence <joe.lawrence@redhat.com>, Michael Ellerman
	 <mpe@ellerman.id.au>
Date: Thu, 08 Sep 2022 12:22:53 +1000
In-Reply-To: <YxCotV69C14hntYh@redhat.com>
References: <20220830185313.76402-1-song@kernel.org>
	 <Yw+4xxiONngOTqin@redhat.com> <875yi8uju3.fsf@mpe.ellerman.id.au>
	 <YxAc87dTmclHGCUy@redhat.com> <8735dbvk4p.fsf@mpe.ellerman.id.au>
	 <YxCotV69C14hntYh@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
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
Cc: pmladek@suse.com, x86@kernel.org, jikos@kernel.org, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-09-01 at 08:42 -0400, Joe Lawrence wrote:
> On Thu, Sep 01, 2022 at 01:39:02PM +1000, Michael Ellerman wrote:
> > Joe Lawrence <joe.lawrence@redhat.com> writes:
> > > On Thu, Sep 01, 2022 at 08:30:44AM +1000, Michael Ellerman wrote:
> > > > Joe Lawrence <joe.lawrence@redhat.com> writes:
> > ...
> > >=20
> > > Hi Michael,
> > >=20
> > > While we're on the topic of klp-relocations and Power, I saw a
> > > similar
> > > access problem when writing (late) relocations into
> > > .data..ro_after_init.=C2=A0 I'm not entirely convinced this should be
> > > allowed
> > > (ie, is it really read-only after .init or ???), but it seems
> > > that other
> > > arches currently allow it ...
> >=20
> > I guess that's because we didn't properly fix apply_relocate_add()
> > in
> > https://github.com/linuxppc/issues/issues/375=C2=A0?
> >=20
> > If other arches allow it then we don't want to be the odd one out
> > :)
> >=20
> > So I guess we need to implement it.
> >=20
>=20
> FWIW, I think it this particular relocation is pretty rare, we
> haven't
> seen it in real patches nor do we have a kpatch test that generates
> it.
> I only hit a crash as I was trying to write a more exhaustive test
> for
> the klp-convert implementation.

I'll revive my proper fix.  I stopped working on it since my previous
version was hitting endian bugs with some relocations & it didn't seem
necessary at the time.  Shouldn't take too much to get it going again.

>=20
> > > =3D=3D=3D=3D=3D TEST: klp-convert data relocations (late module patch=
ing)
> > > =3D=3D=3D=3D=3D
> > > % modprobe test_klp_convert_data
> > > livepatch: enabling patch 'test_klp_convert_data'
> > > livepatch: 'test_klp_convert_data': starting patching transition
> > > livepatch: 'test_klp_convert_data': patching complete
> > > % modprobe test_klp_convert_mod
> > > ...
> > > module_64: Applying ADD relocate section 54 to 20
> > > module_64: RELOC at 000000008482d02a: 38-type as
> > > .klp.sym.test_klp_convert_mod.static_ro_after_init,0
> > > (0xc0080000016d0084) + 0
> > > BUG: Unable to handle kernel data access on write at
> > > 0xc0080000021d0000
> > > Faulting instruction address: 0xc000000000055f14
> > > Oops: Kernel access of bad area, sig: 11 [#1]
> > > LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
> > > Modules linked in: test_klp_convert_mod(+)
> > > test_klp_convert_data(K) bonding rfkill tls pseries_rng drm fuse
> > > drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sg
> > > ibmvscsi ibmveth scsi_transport_srp vmx_crypto dm_mirror
> > > dm_region_hash dm_log dm_mod [last unloaded:
> > > test_klp_convert_mod]
> > > CPU: 0 PID: 17089 Comm: modprobe Kdump: loaded Tainted:
> > > G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 K=C2=A0=C2=A0 5.19.0+ #1
> > > NIP:=C2=A0 c000000000055f14 LR: c00000000021ef28 CTR: c000000000055f1=
4
> > > REGS: c0000000387af5a0 TRAP: 0300=C2=A0=C2=A0 Tainted: G=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 K=C2=A0=
=C2=A0=C2=A0
> > > (5.19.0+)
> > > MSR:=C2=A0 8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>=C2=A0 CR: 8822=
8444=C2=A0
> > > XER: 00000000
> > > CFAR: c000000000055e04 DAR: c0080000021d0000 DSISR: 42000000
> > > IRQMASK: 0
> > > GPR00: c00000000021ef28 c0000000387af840 c000000002a68a00
> > > c0000000088b3000
> > > GPR04: c008000002230084 0000000000000026 0000000000000036
> > > c0080000021e0480
> > > GPR08: 000000007c426214 c000000000055f14 c000000000055e08
> > > 0000000000000d80
> > > GPR12: c00000000021d9b0 c000000002d90000 c0000000088b3000
> > > c0080000021f0810
> > > GPR16: c0080000021c0638 c0000000088b3d80 00000000ffffffff
> > > c000000001181e38
> > > GPR20: c0000000029dc088 c0080000021e0480 c0080000021f0870
> > > aaaaaaaaaaaaaaab
> > > GPR24: c0000000088b3c40 c0080000021d0000 c0080000021f0000
> > > 0000000000000000
> > > GPR28: c0080000021d0000 0000000000000000 c0080000021c0638
> > > 0000000000000810
> > > NIP [c000000000055f14] apply_relocate_add+0x474/0x9e0
> > > LR [c00000000021ef28] klp_apply_section_relocs+0x208/0x2d0
> > > Call Trace:
> > > [c0000000387af840] [c0000000387af920] 0xc0000000387af920
> > > (unreliable)
> > > [c0000000387af940] [c00000000021ef28]
> > > klp_apply_section_relocs+0x208/0x2d0
> > > [c0000000387afa30] [c00000000021f080]
> > > klp_init_object_loaded+0x90/0x1e0
> > > [c0000000387afac0] [c0000000002200ac]
> > > klp_module_coming+0x3dc/0x5c0
> > > [c0000000387afb70] [c000000000231414] load_module+0xf64/0x13a0
> > > [c0000000387afc90] [c000000000231b8c]
> > > __do_sys_finit_module+0xdc/0x180
> > > [c0000000387afdb0] [c00000000002f004]
> > > system_call_exception+0x164/0x340
> > > [c0000000387afe10] [c00000000000be68]
> > > system_call_vectored_common+0xe8/0x278
> > > --- interrupt: 3000 at 0x7fffb6af4710
> > > NIP:=C2=A0 00007fffb6af4710 LR: 0000000000000000 CTR: 000000000000000=
0
> > > REGS: c0000000387afe80 TRAP: 3000=C2=A0=C2=A0 Tainted: G=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 K=C2=A0=
=C2=A0=C2=A0
> > > (5.19.0+)
> > > MSR:=C2=A0 800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>=C2=A0 CR:
> > > 48224244=C2=A0 XER: 00000000
> > > IRQMASK: 0
> > > GPR00: 0000000000000161 00007fffe06f5550 00007fffb6bf7200
> > > 0000000000000005
> > > GPR04: 0000000105f36ca0 0000000000000000 0000000000000005
> > > 0000000000000000
> > > GPR08: 0000000000000000 0000000000000000 0000000000000000
> > > 0000000000000000
> > > GPR12: 0000000000000000 00007fffb738c540 0000000000000020
> > > 0000000000000000
> > > GPR16: 0000010024d31de0 0000000000000000 0000000105f37d50
> > > 0000010024d302f8
> > > GPR20: 0000000000000001 0000000000000908 0000010024d32020
> > > 0000010024d319b0
> > > GPR24: 0000000000000000 0000000000000000 0000010024d32040
> > > 0000010024d303f0
> > > GPR28: 0000010024d31e00 0000000105f36ca0 0000000000040000
> > > 0000010024d319b0
> > > NIP [00007fffb6af4710] 0x7fffb6af4710
> > > LR [0000000000000000] 0x0
> > > --- interrupt: 3000
> > > Instruction dump:
> > > 0000061c 0000061c 0000061c 0000061c 0000061c 0000061c 0000061c
> > > 0000061c
> > > 00000288 00000248 60000000 7c992050 <7c9ce92a> 60000000 60000000
> > > e9310020
> > > ---[ end trace 0000000000000000 ]---
> > >=20
> > > $ readelf --wide --sections
> > > lib/livepatch/test_klp_convert_data.ko | grep -e '\[20\]' -e
> > > '\[54\]'
> > > [20]=C2=A0 .data..ro_after_init=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> > > PROGBITS=C2=A0 0000000000000000=C2=A0 001a58=C2=A0 000008=C2=A0 00=C2=
=A0 WA=C2=A0 0=C2=A0=C2=A0 0=C2=A0=C2=A0 8
> > > [54]=C2=A0 .klp.rela.test_klp_convert_mod..data..ro_after_init=C2=A0
> > > RELA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000=C2=A0 0426e8=C2=
=A0 000018=C2=A0 18=C2=A0 Ao=C2=A0 49=C2=A0 20=C2=A0 8
> > >=20
> > > I can push a branch up to github if you'd like to try it
> > > yourself.
> >=20
> > That would help thanks.
> >=20
>=20
> This branch should do it:
>=20
> https://github.com/joe-lawrence/klp-convert-tree/tree/klp-convert-v7-deve=
l
>=20
> Boot that and then run tools/testing/selftests/livepatch/test-
> livepatch.sh

Was able to reproduce, and confirm that using text patching for
R_PPC64_ADDR64 works fixes it.

- Russell

>=20
> -- Joe
>=20

