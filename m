Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46416D3E13
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 09:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PqjD75Gmxz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 17:28:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.a=rsa-sha256 header.s=selector1 header.b=WMACoM0M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bang-olufsen.dk (client-ip=2a01:111:f400:7eaf::704; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=emas@bang-olufsen.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.a=rsa-sha256 header.s=selector1 header.b=WMACoM0M;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20704.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqjCG1Vzqz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Apr 2023 17:27:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aad9n3L8G/y+AuIk+6VCMXdtKTKplX8IRj2QwqwzZoqACl25BPQ42O93GCu4ndpxBSrMRXAz9z5WbqcI3p95lIyV+jCz9fX5yGHOCn6qr02PyKVFhGkv0GtNXmJHfBeKLHHVhuDM8A3ofKZs++hRqfOpQGG3ov/+ieMTPLu0M0cILqcjc3yZWzmUbFLqBqVKnMXxsj27lo+SKU2Yh0IIOpPed4HBL3fnfYoCZ7oMCKkVHXLFlcgg/7BPcEDS0SPTloW41wxFrfqiO2OoeZsAl7y9EkfanVpcDAfjGtXYqK4KWfzX/FtjGIBSegvcZx4Tim4ZV7mi8Yp+GJUCYCBrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imcJbQm5i2oqDsiQa7uPqji5g21iPkLD3rwBiB0YzrU=;
 b=IatWMGu5oO5vS6pQL67TsIR/3In8a7oov6CffgFILKtYQEJhMIagCLTxgNOMCSxvacc1VWcJFBHcChYWbM18AJ7QS1VdWMMcnvVku3fNy31mp87N5dObd0Da3LZ6EJI4nva/JPS2Uh0vkM+G55VFnz91VO+d+nP4HXFGF+gMpHHxSyU7XDhetgY2tHUClT+HVWAuCvgH309QBmMexXm632fsBZs0IoTVmQO99UkvFXlmV9quXEfVyO567flJ+RVbInlvY0J+C7YwCGMDStzjs3peltTYCTe+hQLdAmHB3Ja5gNfqZtTIm5SfGW/TaDkD3Wtldlii1Sfr+qZ4GkEEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imcJbQm5i2oqDsiQa7uPqji5g21iPkLD3rwBiB0YzrU=;
 b=WMACoM0MEeBNx4jpAAvp3eFYs8su9M8TytCQLvbwmLv46YvtkhMCZJ354qRPWYiWGS71qB5bb1Uk4savJx4+mgKF4Cj3eSZrU/h/psUGUFWZHFFqQHHF4GnuZdiKJF/eYyKdhmqPKHgYgin+qf1TpQ5fFFz6dNwkATUbxvAsxDU=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by PAWPR03MB8913.eurprd03.prod.outlook.com (2603:10a6:102:331::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 07:26:58 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::39bd:559b:e92c:3871]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::39bd:559b:e92c:3871%3]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 07:26:58 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: fsl_sai: Use physical format width
Thread-Topic: [PATCH] ASoC: fsl_sai: Use physical format width
Thread-Index: AQHZYuHxlyQcfrXAUkmKoqNtMdKqs68UMreAgADA14CAAAJogIAEP5uA
Date: Mon, 3 Apr 2023 07:26:58 +0000
Message-ID: <20230403072655.1556366-1-emas@bang-olufsen.dk>
References: <ZCbvZVV4+Ent9Dsx@sirena.org.uk>
In-Reply-To: <ZCbvZVV4+Ent9Dsx@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|PAWPR03MB8913:EE_
x-ms-office365-filtering-correlation-id: 0686e489-b75b-40a8-fb10-08db3414cf28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  E2XMnVbdqEJkbMEa9UXN6lc9rXQtT2yNkDFjSY6YOTdbgBJNnnghgqgmKNJsS6/l6Y4Znku703uYs6lNljOU3MPCP9ahRnZBrGRh3HwRIOkgiWKNiXt1Dhfd+9bp0xy5H54SrNWcDPijIKUI1wr1Ut2WXZ8PFbk+ZRS9i+6R9garm5lp8rUYEQaB+FWHEW6QcxG7jexjUIfoqB2Tfn/rt7hTQZq0ewAQA4pPkJBBNLuapsaX7uZ7yrEW4M0x/4OZksVQ9QhxFGHzsjalJDMUzEbaGw2jujUAf36DKhZfmUL8s0PbSycDmpPuiFRcsqlNeZPFZJW62ziSgXW/KV1DMird8xy8+y9+0wP6CpLqccYl9316exYAlnAUWszEGGhTeJp3OTXIw0v9+r1NNQh7wr/+D/3NvtNfRRYOgVMf8RX/j189Pp3ixRkrsBulvtLgzrRUBJq6K3EewgsCcd2Yk91C+ICUm7PLapnSizW/jwBqIrFOESxoLGovbZYw5hX2Z1Cqprw2J22IP/BGYkb+C5FAvS8XtQtWZJnFHdpDWmr63gS1v+o3X98KMaInXr3Jl/ZwZ4X1ZSSPXQ6YoNjGPbqNtEsz0/rfjAmwtmuW3lc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(136003)(396003)(376002)(346002)(451199021)(83380400001)(478600001)(2906002)(2616005)(186003)(6512007)(53546011)(6506007)(1076003)(36756003)(71200400001)(6486002)(26005)(8936002)(122000001)(38100700002)(86362001)(316002)(5660300002)(8976002)(41300700001)(38070700005)(4326008)(66946007)(76116006)(8676002)(64756008)(66556008)(66476007)(91956017)(66446008)(54906003)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?uvMwiyOhqXN572GhsHiKQ6T+hvO3/rZSh03a0hUhWOdDdmyPhf327r9F26?=
 =?iso-8859-1?Q?eu33lyMvGlDd7MypayBZZsInaDkgZ1LlmOBM8ABy4GCzL3h2fPTkYF2E+J?=
 =?iso-8859-1?Q?J9YYF3d2NNDWR9Qb8dbHYqskNwAbtoxUDsifr3LyhDI8VouiHJBPssBYB+?=
 =?iso-8859-1?Q?UVO6lZz+NfkHQpe1B58Uf5LbNQx7Pt8vBFTz+cuXyFzV6gTtibkPXmMvHJ?=
 =?iso-8859-1?Q?rpP2w58D9oHPnel7tQbeU8ppny3s/6XrJHNNbkN5iW9DY6jwtkgjHpODuN?=
 =?iso-8859-1?Q?NY22UAnyb648FqxrSrl7XrtJRUeZeLtEcSGIgocA6FGiz5FvJ7hS9KQXzR?=
 =?iso-8859-1?Q?HqtPKFROhXdQbWFtx2woVmB8rWgsuAHsLEyAvnUhm+W7NdBnPPGFktICJB?=
 =?iso-8859-1?Q?XR8ZUlCgo93clxW13+DlORPOe5Gbc7wbrUt3XoAR8MqsdkAnN/H0EtNTqW?=
 =?iso-8859-1?Q?tqzUTHhszCAF2KwGQyd4iTw7J2X7dNP5wGuyi329Hkv/Rftb2sBbad3tc+?=
 =?iso-8859-1?Q?ftapt7PBqdqn2MQiFsLXBK4cCnoGiKNuC0JY8yEKiw2XKUWMET9Rp5UGoB?=
 =?iso-8859-1?Q?e3oX/tc3VTz7H11grtr87Lv/u9m5ueHRH2KZEivHfMY1DDw5p+vYyu6hK3?=
 =?iso-8859-1?Q?rIJfnyaZvKwC5/pXOlqFQa4Zs5uJHgr0aPBF2ebS6Hwj74e283Rir2FDbo?=
 =?iso-8859-1?Q?l58cihwoHKz+DB7VlOXexORkvYIbfgmYRPc1UyVnClbrdd/O1MVCHBbM2w?=
 =?iso-8859-1?Q?XvqlQdt+qLvIoqdeLoz2TZpVv+e22npSmbb3Ep4ueYfSCgSmc3dDYEGKRf?=
 =?iso-8859-1?Q?OhbrKaWJOY3+ZdOnCZXqT4yEg36MotAbxG1D8FcG5pU2oKKMFeH97M0jJh?=
 =?iso-8859-1?Q?P/GHMZggso0HvCYkHTyWAhOjfCEEimU6o7VijZ9Fs+0/8Qv5YUnKP/FMCK?=
 =?iso-8859-1?Q?B4YWzJh9SRwN27LyhzH9T7zqoCpfxJw1XKCXOHtY0M99gaZGGt4iw4D348?=
 =?iso-8859-1?Q?wHB2/QLdWAcNSjXWCmdzm5q5dtK7XQHHWzrWH6AstTS6DN9AUa3BfkuHgw?=
 =?iso-8859-1?Q?8KQVGQGz3spt6uGYUQjUVx0Yls8Sjxlhmp+dhzunvEDpaqxI9ye2fdmpZJ?=
 =?iso-8859-1?Q?9A9LNNVq0SobwShlO0vA2w/s90JvGbfZDRii0/Y2dRHVklRvcdheqvDOXD?=
 =?iso-8859-1?Q?CxuFwpNTTgZkPgBCTgp0dgCoETggtvDWS+6Z1JfZm/f/TYDzJA3aiDVX5Z?=
 =?iso-8859-1?Q?XknxZ6AFaitKhB409MrhU+28iog22XRmuURmSaLA/mjQaCLZ6gZYs1jDGz?=
 =?iso-8859-1?Q?P5c7fl7f4PEp3LBbBEPp2e1bHttLYD+bpCB1queCNKe8OHZdBZHQNvQWuP?=
 =?iso-8859-1?Q?rww4ifgmzhZHsJskjQRjDLYgkPCnYy5o+ee1D29Tk4cEVDTc83H04Bguhc?=
 =?iso-8859-1?Q?bOxOPenCqtteGqkUMX1oiy82Y6XLkHLkFR3706bJLKzpaw/8GhasXC2wZX?=
 =?iso-8859-1?Q?mdp8UCezM0nX8mRgQzMRqOa355wLMZ/JFrghf33RTiGjrWZfChcOVUAPoW?=
 =?iso-8859-1?Q?qMKVON7G8ZU9xL5yxDcax7B+DmgeccYnDiym42YoMIKQoffkSmdWy/0eEC?=
 =?iso-8859-1?Q?JNx5+3KIKwJf4LmOvAotwsB9PWHfJpG8uVF0aRlwshGzNXuKNfQ4YZmg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0686e489-b75b-40a8-fb10-08db3414cf28
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 07:26:58.2380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 08EdnYLrQO24zx3YtP1DbkXfbMv8ahfKlg7FMYmj3Dye5cLNlZaj2RN1CdNtBh7zFjDRVDVo/AdMNOMdGktSFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB8913
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/31/23 16:34, Mark Brown wrote:
> On Fri, Mar 31, 2023 at 02:26:33PM +0000, Emil Abildgaard Svendsen wrote:
>> On 3/31/23 04:55, Shengjiu Wang wrote:
>=20
>>> There are different requirements for this slot width. Some need physica=
l
>>> width,
>>> Some need format width. We need to be careful about change here.
>=20
>> I might be wrong but shouldn't physical width always correspond to what
>> can be physically measured. If you need the slot width, the same as
>> format width you use a format with matching widths like
>> SNDRV_PCM_FORMAT_S24_3LE?
>=20
> The point is more that things are likely to be relying on the
> current behaviour, for example CODECs that don't actually support
> 24 bit audio due to a power of two requirement but cope fine when
> you play 24 bit audio in a 32 bit timeslot.  This creates issues
> changing things even if the new behaviour is in some sense
> better.  This is one of the unfortunate consequences of DT.

I guess if you want to do it runtime you have to create an audio card
that will do it for you. I would have preferred it to be handled as
close to hardware as possible. But that's a good enough compromise for
not breaking current behavior.

Thanks!

Kind regards,
Emil Svendsen

