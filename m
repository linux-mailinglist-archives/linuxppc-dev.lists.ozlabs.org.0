Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB094BB6C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 11:22:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0SRt2ZCPz3cX0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 21:22:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector2 header.b=SlCPkIur;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=2a01:111:f400:fe5b::62a;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=SlCPkIur; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0SR31y0tz3cCJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 21:21:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEr81ozKmp0+r1LMUWyzbPqCkHhxb11FKeoCghg7j2TsZyAnURZFo9DZlSa1VYmXV45BedxYseWzYWpHxuj2D5kTRuRgs76bvB3l5WJqcC+UuEWTGcniGXZneYvNbT9wrxLKYMBuMKp9KcXSujebsfZDJm1TVQiAoOyo5oGbP5U5RHkj1ejfwliRodHpFDkU3dtgoBgncL3RWux5E0ZO2nka1b+83cSmInDR1PS835sc6x2NQNahBORHIRpk9Q6GlYHGyqbWW07U5LWw1JJ4iO2xbiGGNl4VbVzOIeRCiUv2qeIxCkO1AdVPTettVvTvvz6uPomGA0vDCRRgU39GZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6dJSbSQzC/LwupH0OUSZVwVWJ4d+sz2w6qg1mqCNtk=;
 b=ZDYBzKmWQY382LVhRWgcG9k7tlz2Ict8Qa6uXP+XwROxJK3QOJ5UFE0Rm+4UOkYTYDIGzqu0eEHdrgFSf9Pqonu/llsslxoM89fThl493Rn+m1WH2mMYKr9YkcUkN82dQ9/ZdUCCI/xEC45jzvWjKqTJlHIbO7MUtNuNC+09NODtZ+e3PQ94M3ugDasKFWLWc5TTEKNpnAjdm8aYDZ4bUOzdQrSlVzyn0zGiDL6UZj/Ytal9Monq6WAjY2a6vbGt60uU1Or5rOwTeGx70JgvClDbUwa+kJhMF2wddU//YBJ2z+JK9qdYy5jkeoH21ffHkkqvMtW57tB8o6gc+Ses8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6dJSbSQzC/LwupH0OUSZVwVWJ4d+sz2w6qg1mqCNtk=;
 b=SlCPkIurBzkGf6WXbqqJwwoHCMz01t1o26CdpeozcdXZZu6xljEchGMn+updUMFoohDZeezkasCG9Hbp5tkvjEW1m55acqTJdI5G64o34EUOrERMkgcBGc+jV6bzk3NyQu4AOCI8aZu4hWZkdmBRDy0svWc3YeM7DqjyOcQjxtE=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DM6PR10MB3964.namprd10.prod.outlook.com (2603:10b6:5:1d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Fri, 18 Feb
 2022 10:21:12 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::b4c9:b890:c6c2:1d48]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::b4c9:b890:c6c2:1d48%8]) with mapi id 15.20.4975.021; Fri, 18 Feb 2022
 10:21:12 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Leo Li
 <leoyang.li@nxp.com>, "Eugene_Bordenkircher@selinc.com"
 <Eugene_Bordenkircher@selinc.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oACc0lYgABIbVXQAbnCUAAA0DL90AAM8XwQAABPhqAAGbtsgAA3RpcAAD9HUaAABKxzgAA1v9lwCVXoO4AFpnkjgAAGlK90
Date: Fri, 18 Feb 2022 10:21:12 +0000
Message-ID: <PH0PR10MB4615990F8589556B65005387F4379@PH0PR10MB4615.namprd10.prod.outlook.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
 <MWHPR2201MB15209AA4F2457934BDD3293B91999@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <726d3561-1842-72c7-d4cb-9a99211bb05c@leemhuis.info>
 <MWHPR2201MB1520A85FE05B281DAA30F44A91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <MWHPR2201MB15205A333F1F610D332038AC91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <d0c52d26742b082f5a953a05630a9d70e0eb1356.camel@infinera.com>
 <527ebc333daa2a1d513ea217e5beb61a5acea3fb.camel@infinera.com>
 <AS8PR04MB894614C61E57A80EB4FF7C758F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <f31008a0f4e71ff029aa611b0ebcfd83f10ec67f.camel@infinera.com>
 <AS8PR04MB89464D90D2E92A5D401474BD8F6B9@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <ce653a10-c004-75b1-5f70-e23c0c2aee68@leemhuis.info>
 <b6aa24cc-6ddc-7dda-b098-0033e4f6aa03@leemhuis.info>
In-Reply-To: <b6aa24cc-6ddc-7dda-b098-0033e4f6aa03@leemhuis.info>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: b0d03e82-a63e-d67a-7421-bc71ea97240b
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ace759d-5df1-411a-ba7a-08d9f2c86389
x-ms-traffictypediagnostic: DM6PR10MB3964:EE_
x-microsoft-antispam-prvs: <DM6PR10MB39647D74124DF556EC28CE22F4379@DM6PR10MB3964.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hti0iohu7JJ9FXFGx2jngaFCsXMxXHCzx0auZtnN50X6Dl+AWGS4Y1pXEzQF/ggV5it3BcNzDAjAZmvoJ5oEfpSzAAXPhUGyHdI9N9yQVAdOg2NlIzsHOwsshOwgXpJt8jjYONYXLHclFeQEcfeLI73ooXpy6AhDeYfh4DV2JjYBfA2Li9yr2hfbO7EsP5H8XjjAvaxfs5lIl+Fd4kiKQkD01APfQgQnqPv//AMwyKTDb9/cxmlD/HYEU+lzOJrcInYSV5kZ5oZGGBv/IRD1kjmALgKAW/QlTkBo01h/fXANJKThNu0ZS9sKDo5TQyzFn85AkF+0HH2QwyK+X91AvYVz4Cw23HH2l2hyBfa9XRxcxHg8ri24mOTm0ztTbPzR7qz0jA6mHmsr0/pIJF884niccGfKqTjCuspId1L1W3vqtXh09SGZECEUD7MkUsjTlZOfuEkdU4+gha3awKmDCUXrq6Ok4YgPVm2Q8Z+x5gwpa2BDypGVrVBTNf5ye1vvqhN+0jviFxWlrn3RekGvFY+90U4qgiCa5z6R8KUZHnZERRZ1oeNUK1zlWopjArV/Ue0RpzJIzo1bqr+cMwyxv4cuMpAF4Ki2rx/VdCkfEjvLZN1LrZiVk3aYuhGWiDsPzsrF/P9/1lDVZZdCqOHkAkEeFAna6yAzLPfx69unb9rKjX/JGZF6Bb0ZSQ6CMFKJ1TgHqfFw29Z3nhGVWVFDibX6OrVUk1Pn1GU4V98WMn1HLpYlBDlJL0l8mO5lO009lSV0b6iJNTpOsVTFU3sbqlm2p9/G4YgRuBRIrwJbxoE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(508600001)(45080400002)(91956017)(2906002)(4326008)(8676002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(83380400001)(122000001)(7696005)(33656002)(6506007)(110136005)(54906003)(26005)(38100700002)(186003)(53546011)(5660300002)(52536014)(9686003)(8936002)(86362001)(38070700005)(316002)(55016003)(4001150100001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?akIwpjl8N35EPf+34Krj7a1aXkkYKS4oNfN4X/JqDP2BVG3JbKSUIPEnrw?=
 =?iso-8859-1?Q?7kR5cH3Uv118QYFJnAq1uyKfgyFMGsf3GHO9VCl7eGiW9z4fjfm7AxnCkr?=
 =?iso-8859-1?Q?1K5eZpcHGTzGGknGtoK2Nxj4c/oxHILFlhEb799iiga9WuUgdSlJAC4lH/?=
 =?iso-8859-1?Q?JF/WfzLql2A0Jjlj8RPQDcEdHiRokmOmX1wmwRA7VNusRt3t7FbzsbbzvL?=
 =?iso-8859-1?Q?a2dEjh4Q/dlWMTnIEBGg0GpQtOFDYQfPq0561KUKB7A+zeXjskEgyouSJ5?=
 =?iso-8859-1?Q?h5IOHsDg4BJil4T2lz+xXe1DyjvONH4leKqB0Pizta5z+yf6sO5FQszY7J?=
 =?iso-8859-1?Q?5j29yXZ1eg8oVQv8yD6UWFeiuumUhr1zdurnmqyY7tq78u4g7T+Oc1o8si?=
 =?iso-8859-1?Q?OzDlxfS3votSBSbY/wmXCWsWJieLuo7t2GOoUMdDXmVRMvOCaJwpcvi7WM?=
 =?iso-8859-1?Q?Rrusq4AzcvAof7acmA2L/8KIAUCAkGTgphT1TtjUwEOub+le4EL+DgnA4K?=
 =?iso-8859-1?Q?27MXyti2yrfJAwjBElXpbdM7DSjYBneR0wgpZ6v/XqEGPDZDbFZhLPm0uG?=
 =?iso-8859-1?Q?LHO5XmLb4ndca6ApW1dnb+Pz4hO80vugmj3zAz73aG+j3qedvrOv50m/DR?=
 =?iso-8859-1?Q?zxYfv1+/NMb2O7pHWV7BrophGEGzsjQbK7qIPCdX0/L/poXJES84a1Uxo6?=
 =?iso-8859-1?Q?Mvl6cy1ovmPP6nbMAS53Xv6bxDueRvztGGW5CRiquU+PxJykNBT4yhjNob?=
 =?iso-8859-1?Q?iTyDC2u0zu8frtGazlqmoTGPdgvYoCpZimfaSfKXmMWQRmuvYtbsj2IGH5?=
 =?iso-8859-1?Q?vTHgKhqs45fRvKS/NBU02k6CujdNiG9lv/Z59eMeb2cxsxnlP71apsY/2R?=
 =?iso-8859-1?Q?SehtEriITcJqbjpXwSagBt4fpdWywSWhyB2lljVwi3k+XajxFiCfZftt4P?=
 =?iso-8859-1?Q?b/Iog231MwmEQ+EW4Ok27W2Gg+dD7fauVcf5u2vdOADWFaLWxDYrYfsxh2?=
 =?iso-8859-1?Q?fvjDSKz5HgRQEPqwNG2xAfCzadX1f+GYYfNLVT2bSeMsYFFo0vWQHG3uE3?=
 =?iso-8859-1?Q?DjFLHd5Y2S0KdMoX8sdnWxMENtSCaZ7WMWrhN6AlmVh4AnflD8kGYRYd1q?=
 =?iso-8859-1?Q?Lv6oiHqNAv+0hljtSu8Nv2WJYv9d9I/BOg3BrmHtYB+oH9vbsPbhGAPNDa?=
 =?iso-8859-1?Q?oLt3Qikwx0nAcbkmqwhxsscyUWB+ioSyA1QMlscsl5OYcyudfePI1u8ij3?=
 =?iso-8859-1?Q?SIuTrki06iGlb9I2/q6mKM0QiPeOFnH0g6MejDAdnEYuFzfFFDbYdDowe6?=
 =?iso-8859-1?Q?m+IAm/L4t5LYK4UuhFzzwArL53WCOQnWRSMBjyDDefa4jBualrwxfuCf0X?=
 =?iso-8859-1?Q?mDZ+SPYA91N9imxwKZHfMM2BT2GzZpUJeg061i9Augba9OtgAKxZHbTpmw?=
 =?iso-8859-1?Q?hV7pOHOXMQ5G0AQWsIIjBxx1qFzmuuYOeqzJ2PR1a5mh1cK9pAlp8AUGA6?=
 =?iso-8859-1?Q?2Xj99C/fr+XFYiOEI+lOzvOnYLDq5KnJAt9CIBF495btnx9Q4xHUBJVLiE?=
 =?iso-8859-1?Q?K9+rHKCN+V/sXV9bwtz16cs2yVCFKMv0XZYHkFEx7G9+ftrWigT/1+Y7fH?=
 =?iso-8859-1?Q?YPL6G1h9jS7OLEZl4raS6OAKGDWaJarR0itPEa+cccyarCb6Zn3Hy4dBvB?=
 =?iso-8859-1?Q?Jyzxth8uo+bqM6CfaXY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ace759d-5df1-411a-ba7a-08d9f2c86389
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 10:21:12.5425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpQcWeavhCK9vynp9ut2gLI0fjG5pnedxbHWlxcLYxj4bd6MuhGRba5pKwD8VW+Z02wrzM+Hre00e84QCxZ+8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3964
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "balbi@kernel.org" <balbi@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I think you could apply them as is, only criticism was the commit msgs.=0A=
=0A=
 Jocke=0A=
=0A=
________________________________________=0A=
From: Thorsten Leemhuis <regressions@leemhuis.info>=0A=
Sent: 18 February 2022 08:11=0A=
To: Leo Li; Joakim Tjernlund; Eugene_Bordenkircher@selinc.com; linux-usb@vg=
er.kernel.org; linuxppc-dev@lists.ozlabs.org=0A=
Cc: gregkh@linuxfoundation.org; balbi@kernel.org=0A=
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to=
 unrecoverable loop.=0A=
=0A=
Hi, this is your Linux kernel regression tracker speaking. Top-posting=0A=
for once, to make this easy accessible to everyone.=0A=
=0A=
Sadly it looks to me like nobody is going to address this (quite old)=0A=
regression (that afaic only very few people will hit), despite the rough=0A=
patch to fix it that was already posted and tested in this thread.=0A=
=0A=
Well, guess that's how it is sometimes. Marking it as "on back burner"=0A=
in regzbot to reduce the noise there:=0A=
=0A=
#regzbot backburner: Tested patch available, but things nevertheless got=0A=
stuck=0A=
=0A=
Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)=0A=
=0A=
P.S.: As the Linux kernel's regression tracker I'm getting a lot of=0A=
reports on my table. I can only look briefly into most of them and lack=0A=
knowledge about most of the areas they concern. I thus unfortunately=0A=
will sometimes get things wrong or miss something important. I hope=0A=
that's not the case here; if you think it is, don't hesitate to tell me=0A=
in a public reply, it's in everyone's interest to set the public record=0A=
straight.=0A=
=0A=
#regzbot poke=0A=
=0A=
=0A=
=0A=
On 20.01.22 13:54, Thorsten Leemhuis wrote:=0A=
> Hi, this is your Linux kernel regression tracker speaking.=0A=
>=0A=
> On 04.12.21 01:40, Leo Li wrote:=0A=
>>> -----Original Message-----=0A=
>>> From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>=0A=
>>> Sent: Thursday, December 2, 2021 4:45 PM=0A=
>>> To: regressions@leemhuis.info; Leo Li <leoyang.li@nxp.com>;=0A=
>>> Eugene_Bordenkircher@selinc.com; linux-usb@vger.kernel.org; linuxppc-=
=0A=
>>> dev@lists.ozlabs.org=0A=
>>> Cc: gregkh@linuxfoundation.org; balbi@kernel.org=0A=
>>> Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list lead=
s to=0A=
>>> unrecoverable loop.=0A=
>>>=0A=
>>> On Thu, 2021-12-02 at 20:35 +0000, Leo Li wrote:=0A=
>>>>=0A=
>>>>> -----Original Message-----=0A=
>>>>> From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>=0A=
>>>>> Sent: Wednesday, December 1, 2021 8:19 AM=0A=
>>>>> To: regressions@leemhuis.info; Leo Li <leoyang.li@nxp.com>;=0A=
>>>>> Eugene_Bordenkircher@selinc.com; linux-usb@vger.kernel.org;=0A=
>>>>> linuxppc- dev@lists.ozlabs.org=0A=
>>>>> Cc: gregkh@linuxfoundation.org; balbi@kernel.org=0A=
>>>>> Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list=0A=
>>>>> leads to unrecoverable loop.=0A=
>>>>>=0A=
>>>>> On Tue, 2021-11-30 at 12:56 +0100, Joakim Tjernlund wrote:=0A=
>>>>>> On Mon, 2021-11-29 at 23:48 +0000, Eugene Bordenkircher wrote:=0A=
>>>>>>> Agreed,=0A=
>>>>>>>=0A=
>>>>>>> We are happy pick up the torch on this, but I'd like to try and=0A=
>>>>>>> hear from=0A=
>>>>> Joakim first before we do.  The patch set is his, so I'd like to=0A=
>>>>> give him the opportunity.  I think he's the only one that can add a=
=0A=
>>>>> truly proper description as well because he mentioned that this=0A=
>>>>> includes a "few more fixes" than just the one we ran into.  I'd=0A=
>>>>> rather hear from him than try to reverse engineer what was being=0A=
>>> addressed.=0A=
>>>>>>>=0A=
>>>>>>> Joakim, if you are still watching the thread, would you like to=0A=
>>>>>>> take a stab=0A=
>>>>> at it?  If I don't hear from you in a couple days, we'll pick up the=
=0A=
>>>>> torch and do what we can.=0A=
>=0A=
> Did anything happen? Sure, it's a old regression from the v3.4-rc4 days,=
=0A=
> but there iirc was already a tested proto-patch in that thread that=0A=
> fixes the issue. Or was progress made and I just missed it?=0A=
>=0A=
> Ciao, Thorsten=0A=
>=0A=
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports=
=0A=
> on my table. I can only look briefly into most of them. Unfortunately=0A=
> therefore I sometimes will get things wrong or miss something important.=
=0A=
> I hope that's not the case here; if you think it is, don't hesitate to=0A=
> tell me about it in a public reply, that's in everyone's interest.=0A=
>=0A=
> BTW, I have no personal interest in this issue, which is tracked using=0A=
> regzbot, my Linux kernel regression tracking bot=0A=
> (https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flinu=
x-regtracking.leemhuis.info%2Fregzbot%2F&amp;data=3D04%7C01%7Cjoakim.tjernl=
und%40infinera.com%7C8784242cb55d4627e61608d9f2adec23%7C285643de5f5b4b03a15=
30ae2dc8aaf77%7C1%7C0%7C637807651100768999%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=
=3DdQS2xwqJjHY4DqSawLZKoe0XZaBAqPLul5YgPdQWFio%3D&amp;reserved=3D0). I'm on=
ly posting=0A=
> this mail to get things rolling again and hence don't need to be CC on=0A=
> all further activities wrt to this regression.=0A=
>=0A=
> #regzbot ignore-activity=0A=
>=0A=
>>>>>> I am far away from this now and still on 4.19. I don't mind if you=
=0A=
>>>>>> tweak=0A=
>>>>> tweak the patches for better "upstreamability"=0A=
>>>>>=0A=
>>>>> Even better would be to migrate to the chipidea driver, I am told=0A=
>>>>> just a few tweaks are needed but this is probably something NXP=0A=
>>>>> should do as they have access to other SOC's using chipidea.=0A=
>>>>=0A=
>>>> I agree with this direction but the problem was with bandwidth.  As th=
is=0A=
>>> controller was only used on legacy platforms, it is harder to justify n=
ew effort=0A=
>>> on it now.=0A=
>>>=0A=
>>> Legacy? All PPC is legacy and not supported now?=0A=
>>=0A=
>> I'm not saying that they are not supported, but they are in maintenance =
only mode.=0A=
