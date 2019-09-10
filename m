Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 222FFAE251
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 04:23:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S83L6ZJnzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 12:23:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.74; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="dOPrJrhE"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130074.outbound.protection.outlook.com [40.107.13.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S81g6PL7zDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 12:22:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hac85i4Ybze1qWltxjXPi/UP7J3gvUJc5kvSt5tWowEMUi5Yyniwm+bqF7pKHU99iD5ePul57+0YW8n/GIXra1K67Gr1vBK0HLWp3ksmg2LpMOHvCXGg8jlrfoOPt+W2w5C9826NihtmlL+LTBnTwejJITaZVpN0h1Sks8GAuFHXL0ffo030UCqljAiy76GoyRnHckkrjvgMPXWZrEVyEdOvBOOtqb441jTGTJiDoQwAgNTDBgImafBDC9W143DqGFiKoUcqw4dgpUh/TK/xLg5jnq6g9gtSTZzUhY/7Yo9kVtgYy/2FmM8+RM2pSLUGPpSJwAokzGu9RhM+yjfKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=No3ctTFpXzweRSedArjwO/8+SYHAoCvKdfZu3TKJWx8=;
 b=VNVNNeYPCXBW6yahBmsT2HBbm5zqwDQBuQdZNQzoHABQMAXoTA3n9ectaurTGi91OdPT/aea6l+1LWI91eCzzp9M4OO3ssJysHPx0LdxiQb4o/HsvlsbslsXMPEXNQka2UPDmKcgEcLiJfcUEN9APKvQVTpVLaKYirj6nZ8ZoyfCC4gv70szWt/9Wi0NGGcybiCXHdFIRUsJxPML+0KR5vxL0EXrX0zRjM/2x3ZmC1H9+pK5XXGf64WIJhl08cR1xIMVpsmGwdBH48epoMRna3ftXjvkL3GvMiOtaPXCecQRFtBONsob13Cw2Ug/QCDcZKFUfujC0dz1FGQXBSPI5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=No3ctTFpXzweRSedArjwO/8+SYHAoCvKdfZu3TKJWx8=;
 b=dOPrJrhEM5zMXtKC5R+XK2U8DoBe39Iw2Vl6OQv3CLCQP58tRTfsXih/5sd0G1cwXHp3UveYxgdqs6jJzEEcyzEujVReTMjv+mNXzPJuygkaJDUp3rFSFYH3Ayjld1KzSYUJLL9EfzSao7zEqrp8jjJPg5RxjxPuKQGoQll4ogg=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Tue, 10 Sep 2019 02:22:06 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 02:22:06 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: RE: [EXT] Re: [PATCH 1/3] ASoC: fsl_asrc: Use in(out)put_format
 instead of in(out)put_word_width
Thread-Topic: [EXT] Re: [PATCH 1/3] ASoC: fsl_asrc: Use in(out)put_format
 instead of in(out)put_word_width
Thread-Index: AQHVZ0mAeLH1tmnz60SUVq7w0GAb7KckKplg
Date: Tue, 10 Sep 2019 02:22:06 +0000
Message-ID: <VE1PR04MB6479D271F4271ECF404473E7E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <65e96ca15afd4a282b122f3ea8b13642cf4614c7.1568025083.git.shengjiu.wang@nxp.com>
 <20190909200156.GB10344@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190909200156.GB10344@Asurada-Nvidia.nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9990b7f9-2712-4b84-72a7-08d73595acf7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6479; 
x-ms-traffictypediagnostic: VE1PR04MB6479:
x-microsoft-antispam-prvs: <VE1PR04MB6479DE5863AF1C44681D582CE3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(53936002)(81166006)(14454004)(7736002)(55016002)(26005)(305945005)(52536014)(76176011)(2906002)(33656002)(6916009)(316002)(7416002)(9686003)(6436002)(54906003)(6506007)(102836004)(66476007)(66556008)(256004)(25786009)(1411001)(64756008)(8676002)(66446008)(229853002)(86362001)(3846002)(66066001)(476003)(71200400001)(446003)(4326008)(8936002)(71190400001)(5660300002)(76116006)(478600001)(66946007)(81156014)(99286004)(186003)(486006)(11346002)(6246003)(7696005)(74316002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6479;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: khDdeqQSy4Adt0azYaGDX/+ZEyZNC/8e4RSyezJqKWpUKqhCPwBTwbBG+6jJ9QfvcO5G9H14nsxuTqQ5qs0JWU1X99kVMu2k4VNnGDHC79dVc+EIba4ssRJ3ErgRK1bX6nAciANbeSe5FJIZb+8vWBvluqBbaZgOHciuXk6aFLDCu1hAlms3UrRLzdLv1V0rYkK+IZyAzhBmjvR4hC2RJiNyol8n98sbSF3st4F/hsgG0uAvIbLoFnL5w8LPGKnNvvwUjJMgj1Dsa1eKEzd9SfrtxjRMqMCfswS0XSyQZbOjwHhhA4b/eR88Xg0PONUM4tpPCe4mpDNUkwbR0CwOOguV3bMx1JkkdCBZ1wPUNdapVjha1xZg4PGEqthBKzHCGpuZUU4FPobBuu3z4mkZ6vAowgwybRun57H5cNPVN2A=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9990b7f9-2712-4b84-72a7-08d73595acf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 02:22:06.4121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8JJLXM9+bDxisu84w9pfEKEWxO28mnYvOIng2F9yuDc9r7dPaWbNGniCfgbNE6UEJsaDmq9NCdwwXflaRyTBQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

>=20
> On Mon, Sep 09, 2019 at 06:33:19PM -0400, Shengjiu Wang wrote:
> > snd_pcm_format_t is more formal than enum asrc_word_width, which
> has
> > two property, width and physical width, which is more accurate than
> > enum asrc_word_width. So it is better to use in(out)put_format instead
> > of in(out)put_word_width.
>=20
> Hmm...I don't really see the benefit of using snd_pcm_format_t here...I
> mean, I know it's a generic one, and would understand if we use it as a
> param for a common API. But this patch merely packs the "width" by
> intentionally using this snd_pcm_format_t and then adds another
> translation to unpack it.. I feel it's a bit overcomplicated. Or am I mis=
sing
> something?
>=20
> And I feel it's not necessary to use ALSA common format in our own "struc=
t
> asrc_config" since it is more IP/register specific.
>=20
> Thanks
> Nicolin
>=20

As you know, we have another M2M function internally, when user want to
Set the format through M2M API, it is better to use snd_pcm_format_t instea=
d the
Width, for snd_pcm_format_t include two property, data with and physical wi=
dth
In driver some place need data width, some place need physical width.
For example how to distinguish S24_LE and S24_3LE in driver,  DMA setting n=
eeds
The physical width,  but ASRC need data width.=20

Another purpose is that we have another new designed ASRC, which support mo=
re
Formats, I would like it can share same API with this ASRC, using snd_pcm_f=
ormat_t
That we can use the common API, like snd_pcm_format_linear,
snd_pcm_format_big_endian to get the property of the format, which is neede=
d by
driver.


Best regards
Wang shengjiu


