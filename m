Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF37535B3A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 10:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8d0K062yz3btD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 18:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Sd2hl9Gq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bp.renesas.com (client-ip=2a01:111:f403:700c::702; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=prabhakar.mahadev-lad.rj@bp.renesas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Sd2hl9Gq;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20702.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8czX6NMwz2yhp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 18:14:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRiIRN9tJEpGVB4wFuib0I6YbQLF5KU1nbRnAkfQg/Hn2W3+i0ICBxSeX6l1yAGocob/JneaxpjzfpX3jEBROvPG2TteUpy6BSpOtZa+xuh9vqP54jU0lI/FUPwT5A/5MBxIO5CPB7YJA2IcN/2rxis6+l8HUb8QTkdHf8h2LHMqlYhfP3s8Xe8frlWpz/UpjUYdFvPkmADQMuF6SPXMbDQzflu/PFmYo14vfkdqqtraw2inqSa4OhRTiTubkOm7gTeZh1JR8L0cMdHJ/Ve1z8oHIzYURretHioHn6waaHiyxHIWVaE/mR8zFHVqgHsVsc3+Ap/gfB7rKjZhBguEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjIjIq8GCxzBPyhdvu2U+LD4BCd4zsxtIxIadmes8z4=;
 b=HDnbxbTRaKTAiIyBbRspk6by/7zix7gTzBsfybUPBpgqQhFWyF1K946E5CyTnLd9AriZleBYzMaIrPK16t21zXxD+xw8b5OtAKCj2LWppvF5QgDOBRQCWNpNlrx5BRcDNK5JCN/1u4r8Uq1hVcoIukCNPpurfFv81nhxvn5LlJPzB9+CwrFoo5Bv0ZCf0XvZtvLL1Gw9/nRAelWgkVc2Zqpu8Le8krWUqmuvy6EVN+z2IcHL/Bq6IpJiF7yg8hlTywbupZw65i8pAUP+4WWXgmqeb8L9yPzqG7kojgxY7ZnVaLkf0TR6oIa0VRjnE5+QkJbaFKvBq5L/cezfGdFLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjIjIq8GCxzBPyhdvu2U+LD4BCd4zsxtIxIadmes8z4=;
 b=Sd2hl9GqT1lsfJ7tQ1Kg1jSZfOnqFmeYL9YG7UvaJe8Zikf+1MQ7lLes6jME3HKL/KA/+vY74xGHjlnpIVYiWGnxvIdlzTU4TE81bSCIJo1+6jS8En6ia1d6IytLsTY6Wq1zwatY4U2PB2jLGqqj7sabIsGV+cKOD0IF34CmGTI=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OS3PR01MB9833.jpnprd01.prod.outlook.com (2603:1096:604:1eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 08:14:27 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::d40b:1321:7bd3:34b0]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::d40b:1321:7bd3:34b0%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 08:14:27 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Rob Herring <robh@kernel.org>
Subject: RE: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Thread-Topic: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Thread-Index: AQHYcSj+9qLJZNI0xk+8W6rmCSktpq0yUuSAgAAIiQCAAAOEgIAAAFrg
Date: Fri, 27 May 2022 08:14:27 +0000
Message-ID:  <OSZPR01MB7019313DCB5A79F91BE6D91CAAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu>
 <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de>
In-Reply-To: <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0882d2d4-e701-42eb-cf3f-08da3fb8ead9
x-ms-traffictypediagnostic: OS3PR01MB9833:EE_
x-microsoft-antispam-prvs:  <OS3PR01MB9833B652B04F68ED47D1875CAAD89@OS3PR01MB9833.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  RNLTsddCSzG7e/zRFAY0g3krKu0fsiDvAlRnsDruGWtupjWvL86U1NVqwfDbPjC+BED5SpNCd/cM53gqYMP+Dw4J/fhIcX1/LDOmyj/T4tT+vbqDXu3p1+LncggKcHCrii+QTMY9nLJ7frhE06Fcz01PcAUGhXGZK7fGk8nf31mLmNxb9lZO0nx2YkpzyLsblfKTWb6z0lLT30h5FGOKnKiZEC87aIqk33Wnfga5ZuyOVmfzloYzzM7ywnAdIm5P4lU1jh3y0XFsy7zldeBiFiH1leP6inLPIRbcFMED3RdJCU3L6LfNJxyidMOhQK/GjPy+izRD9iXtqWKB8Rg8EqQKtxS4vrjy6Ug4WqXuRgu5F/Ar5ixsCFgkFP73c1gq5bRKK8++Hzp5Syv/Moh+/8MRBgd9wJtLTmSKorVtQjHVURvQDojxkmqlwedFr8+ePb6BAXKfL7TKeNZqNkwvvlkkr9Fb86qh2Y1S4VRM/R72UouGQMOln4xDnrepGeq/zwTJuel2DwZhqVOQ+TG1eW63P9Ihz9TxZoPU7S26PxysmSfiG0OklcnVZ9ltXdEY1WoriBOPkS4j0T3O2McDxxj0E4E7fs+HCXb+xLVOd4P+9fx4NME1627XXA3Hbf0fH0braZzNSc9ENv4uBXiK0EdZD2/rgttVMNXj+tt4yG5pRJLo0isHlEL62dVDw+L5r4/4zDgh9ZU+xk6crIBZUCa7lmos4R18ni9pdHc0QmLLdCJepLROSNYp6s24L1ZA7sZ8KkfJ/4QVX+KnNyZ+xHYJt30y6bgNLW6RDKWVwYpBJNZQNDyx7S2JnHVn4EaXTJqo94/dRZaL36oFRQBnG3Dg2n55jBUzeebsX6Vz9dMDNS6CIvQPPnS8V2W4nZ6k
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(45080400002)(52536014)(5660300002)(16799955002)(86362001)(508600001)(4326008)(6506007)(7696005)(38100700002)(2906002)(55016003)(15650500001)(71200400001)(8936002)(110136005)(33656002)(8676002)(54906003)(53546011)(64756008)(66476007)(186003)(38070700005)(66556008)(76116006)(316002)(66946007)(66446008)(966005)(9686003)(83380400001)(122000001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?hNA/y+vW2Dw/QAr3tb5lgCV1bn+PicaC1QtBwJgGBvINCEq6swu16CZtCM?=
 =?iso-8859-1?Q?bZTCmfvvHrxS0217tn4CcFIr7uU/JZNB9JKonnamjiE3RZZpgOxbbFH52i?=
 =?iso-8859-1?Q?xa2N59SsZ+eSoxldouZMjL4vIsWlJUuVJpBKe5vxkH9tetBG0htKiPQs74?=
 =?iso-8859-1?Q?uwa3fDFCJLQkqe2Nc9wfomWDBWfhbonD1VQWdSg5TY1tkEWQWUKm2tP1Db?=
 =?iso-8859-1?Q?MtL3vMINuT2L0v0ofZ8wb0zb3/X5OFN4k3koAVJeypEXequI69E+LBne5f?=
 =?iso-8859-1?Q?4t4oDLV2x3kGV+w8No+glYpy+Hm4ZMo5fU8T4ayhX85scxnmESPHJIsoAS?=
 =?iso-8859-1?Q?4fTcVS1yDWPi0TGtAtdhAYuPEFf1Y/2wq4lm46KN/56+cAOOJBDCz5Dht4?=
 =?iso-8859-1?Q?VZ+Y5w/MNuJeRuPHTCffVzbzuvTHPOJKrjkTMUrxCnrwfxPQL8BioS3tqE?=
 =?iso-8859-1?Q?RHXlFTvXHejJalmB0KhQip6qCtqkbn30G9mbgK0GltOn6/O2LYxCeaTmry?=
 =?iso-8859-1?Q?i5LgKXnGHfsl4qYuAJgMxpaxxB60q4DCtK6Ol4y77B7tY/BMs5PoESqfNY?=
 =?iso-8859-1?Q?C/3y4WP+BAGTWhGxktGE9EZyejMVGcEmlniEveY3yOUsk5jnkqVoWJ6HZA?=
 =?iso-8859-1?Q?Ze/K71+ai7ctdpNz/dDtS+tWWWkM8qK+KOGyoXKhWoyNikiySBAhIC1Izv?=
 =?iso-8859-1?Q?0LVd2kZ9vmrBDrpF20ZvbDaPQmB+iMV7v+IlTqwvXpXRWLN3pvM2CwEgEb?=
 =?iso-8859-1?Q?PzmPTBe88v3f1l+T6ILwKcG9YqPgyVcXbarSkDz5ekCivHb5N1JTH5GaB2?=
 =?iso-8859-1?Q?cn+PyTCC6eNa+C2aUBF/2E+k5lg4TabEyV41iLy6n+X4yRFRzznulW9eXD?=
 =?iso-8859-1?Q?O64NHWeju+wrBLyMS5iirpnrqoGnyrLlnPdxYXrVZsigzSNBdKDqayME/z?=
 =?iso-8859-1?Q?TZGqVTejHsXSQY5rf02Z0Qf1Bodx8GmTgwWxvI3FbcCQRxA9KEEUEHPNc8?=
 =?iso-8859-1?Q?rmlIVqmZ7QHoIJ9yvbMlZYdT2pyLS1QHb1ZjUhxC0t/39yTyVpc4tKp4oI?=
 =?iso-8859-1?Q?UpcM64o5UGs4+Ykyz4DKlCGq2wpjJIFNND6CGivy9DESdJsl3ZD99JBUJU?=
 =?iso-8859-1?Q?f1rEP8SVzHa24JH0sL4b8EN0ouEKT+reB6z5jjhOGB6/iiSnZSecoW5oeA?=
 =?iso-8859-1?Q?45Zizv7WAf1vAk6ThLrT8VTqCbJVDhSYpZBz4+SxpwhFnRazYVrHinQYFQ?=
 =?iso-8859-1?Q?tO+nMLWGWKVfapO9JUGjNw/kpZweiALYEKLW+oB+7lcVUwjDz6ZkMIbGHb?=
 =?iso-8859-1?Q?uFeemmYTJ4yQrImf0uISNuwwlFX7GdN2BbZ79bum9BdvIq7DJmVb63kNF+?=
 =?iso-8859-1?Q?gCVNRU1nomTvceEoQWGqzN+egDXgTtR3kSuthWuOqk5owqyEaCPhzEPx6t?=
 =?iso-8859-1?Q?JA2Kd7QTJEa9gaVVvo7E/lKZYBIWlc9pq3v1JP3qXx5Ll6P2OU5DbgQaGU?=
 =?iso-8859-1?Q?DSwRR+j28EPlhWC09qRpNpSQat0OlbA7R6gq/R08MzP35WvnwD+X2zLeTx?=
 =?iso-8859-1?Q?TgPMYr8LBf361mM2p+2LtgDYfg7U8uZ/mwdUc+1ywEYpVPyvgAotZ3uva6?=
 =?iso-8859-1?Q?OGfRhy4fMXdCWSPZhfnF9g6fYLI60ycaftC1KJGknUhQ6eZabYsUXjbB4M?=
 =?iso-8859-1?Q?H4hCBffbRBYQ+yPNIlS62Kclh++is5a/JvDRYomS6mkvJg0swpkp7Thm1x?=
 =?iso-8859-1?Q?WxXCEkg9k6sAySyXOZkeHWSEvlpYlT8wLr8WMiP3vFvtNkD5Crf0khsQYr?=
 =?iso-8859-1?Q?Y4VSmCfSJQITniIlUn8Dce/3n1jSDSPaP+Qz7DuurKmuq18xa+AU?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0882d2d4-e701-42eb-cf3f-08da3fb8ead9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 08:14:27.2865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KN14XQbT9HkTBRQNwqnyhSaeaVwEoJHEXagQq6eddcC6aM7Edm9HiI/cjzipPIpRXCtZYebvWUv79u9dRgvwhMt4kV1Tq2Nl+gDNF9ZN6c5L/vOHMLK1zGLAXhbzCqxW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9833
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> -----Original Message-----
> From: Christian Zigotzky <chzigotzky@xenosoft.de>
> Sent: 27 May 2022 09:06
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> Christophe Leroy <christophe.leroy@csgroup.eu>; Rob Herring
> <robh@kernel.org>
> Cc: Darren Stevens <darren@stevens-zone.net>; linuxppc-dev <linuxppc-
> dev@lists.ozlabs.org>; mad skateman <madskateman@gmail.com>; R.T.Dickinso=
n
> <rtd2@xtra.co.nz>; Christian Zigotzky <info@xenosoft.de>
> Subject: [FSL P50x0] Keyboard and mouse don't work anymore after the
> devicetree updates for 5.19
>=20
> On 27 May 2022 at 09:56 am, Prabhakar Mahadev Lad wrote:
> > Hi,
> >
> >> -----Original Message-----
> >> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Sent: 27 May 2022 08:23
> >> To: Christian Zigotzky <chzigotzky@xenosoft.de>;
> >> rob.herring@calxeda.com; Prabhakar Mahadev Lad
> >> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> Cc: Darren Stevens <darren@stevens-zone.net>; linuxppc-dev <linuxppc-
> >> dev@lists.ozlabs.org>; mad skateman <madskateman@gmail.com>;
> >> R.T.Dickinson <rtd2@xtra.co.nz>; Christian Zigotzky
> >> <info@xenosoft.de>
> >> Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after
> >> the devicetree updates for 5.19
> >>
> >> Hi
> >>
> >> Le 26/05/2022 =E0 19:42, Christian Zigotzky a =E9crit=A0:
> >>> Hello,
> >>>
> >>> My keyboard and mouse don't work anymore with my Cyrus+ board with a
> >>> FSL
> >>> P50x0 PowerPC SoC [1] after the devicetree updates for 5.19 [2].
> >>> After reverting the devicetree updates, my keyboard and mouse work
> >>> without any problems.
> >>> I figured out that the issue is in the patch for the file platform.c
> >>> [3].=A0 I created a patch for reverting the problematic code. (see
> >>> attachment)
> >>> After reverting the changes with the attached patch, the keyboard
> >>> and mouse work again.
> >>> Please check your changes in the file platform.c [3].
> >>>
> >>> Thanks,
> >>> Christian
> >>>
> >>> [1]
> >>> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwi=
ki.
> >>> amiga.org%2Findex.php%3Ftitle%3DX5000&amp;data=3D05%7C01%7Cprabhakar.=
m
> >>> ah
> >>> adev-lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53
> >>> d8
> >>> 2571da1947e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%
> >>> 7C
> >>> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> >>> VC
> >>> I6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DfSABvBDi%2FYlqU1eydQB6%2F4BzxXkq=
R
> >>> M0
> >>> Ln9hdInyTp6w%3D&amp;reserved=3D0
> >>> [2]
> >>> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
it.
> >>> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git
> >>> %2
> >>> Fcommit%2F%3Fid%3D86c87bea6b42100c67418af690919c44de6ede6e&amp;data=
=3D
> >>> 05
> >>> %7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34
> >>> bd
> >>> 4208da3fb1c007%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63789232
> >>> 99
> >>> 12063922%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI
> >>> iL
> >>> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DENkjlza0J7x=
F
> >>> iI
> >>> aPUwMBxHBIkXJNkT%2BLTZ3xuPz%2B10Q%3D&amp;reserved=3D0
> >>>
> >>> [3]
> >>> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
it.
> >>> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git
> >>> %2
> >>> Fdiff%2Fdrivers%2Fof%2Fplatform.c%3Fid%3D86c87bea6b42100c67418af6909
> >>> 19
> >>> c44de6ede6e&amp;data=3D05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesa=
s
> >>> .c
> >>> om%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d82571da1947e49cb4625a166a
> >>> 4a
> >>> 2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
> >>> Lj
> >>> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C
> >>> &a
> >>> mp;sdata=3DyEJUK%2BGK2dzWARC5rfhsSSFSwD%2BLZm8aNNHqQhPYP7Y%3D&amp;res=
e
> >>> rv
> >>> ed=3D0
> >>
> >> Based on your patch I would say the culprit commit is
> >> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t
> >> hub.c%2F&amp;data=3D05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.co=
m
> >> %7Cbf899ff2084643971c7908da3fb7d4b9%7C53d82571da1947e49cb4625a166a4a2
> >> a%7C0%7C1%7C637892356025845542%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> >> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C&
> >> amp;sdata=3D%2FzI4yueF6Pc%2Fpvh7Ax9WilnaYX8ozFTRyQpiVaaacbg%3D&amp;res=
e
> >> rved=3D0
> >> om%2Ftorvalds%2Flinux%2Fcommit%2Fa1a2b7125e1079cfcc13a116aa3af3df2f9e
> >> 002b&
> >> amp;data=3D05%7C01%7Cprabhakar.mahadev-
> >> lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d82571
> >> da194
> >> 7e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZs
> >> b3d8e
> >> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> >> 000%7
> >> C%7C%7C&amp;sdata=3DONR1CiaSID6q4%2Fo%2BI6MlPA4ij89BJphQRpEu5tQxvYQ%3D=
&
> >> amp;r
> >> eserved=3D0
> >>
> >> commit a1a2b7125e1079cfcc13a116aa3af3df2f9e002b
> >> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> Date:   Wed Mar 16 20:06:33 2022 +0000
> >>
> >>       of/platform: Drop static setup of IRQ resource from DT core
> >>
> >>       Now that all the DT drivers have switched to platform_get_irq()
> >> we can now
> >>       safely drop the static setup of IRQ resource from DT core code.
> >>
> >>       With the above change hierarchical setup of irq domains is no
> longer
> >>       bypassed and thus allowing hierarchical interrupt domains to
> describe
> >>       interrupts using "interrupts" DT property.
> >>
> >>       Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> >> lad.rj@bp.renesas.com>
> >>       Acked-by: Marc Zyngier <maz@kernel.org>
> >>       Tested-by: Marc Zyngier <maz@kernel.org>
> >>       Signed-off-by: Rob Herring <robh@kernel.org>
> >>       Link:
> >> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flo=
r
> >> e.ker%2F&amp;data=3D05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.co=
m
> >> %7Cbf899ff2084643971c7908da3fb7d4b9%7C53d82571da1947e49cb4625a166a4a2
> >> a%7C0%7C1%7C637892356025845542%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> >> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000%7C%7C%7C&
> >> amp;sdata=3DR%2FhdNkjna6kT31Fy9L3HjrDscWR743O%2BAY8sITu9pVE%3D&amp;res=
e
> >> rved=3D0
> >> nel.org%2Fr%2F20220316200633.28974-1-prabhakar.mahadev-
> >> lad.rj%40bp.renesas.com&amp;data=3D05%7C01%7Cprabhakar.mahadev-
> >> lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d82571
> >> da194
> >> 7e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZs
> >> b3d8e
> >> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> >> 000%7
> >> C%7C%7C&amp;sdata=3Dri76vfLpmxe7vFDAlsBjyrSSkuTMz0ydftu3XObLGLA%3D&amp=
;
> >> reser
> >> ved=3D0
> >>
> > Looks like the driver which you are using has not been converted to use
> platform_get_irq(), could you please check that.
> >
> > Cheers,
> > Prabhakar
> Do you mean the mouse and keyboard driver?
>=20
No it could be your gpio/pinctrl driver assuming the keyboard/mouse are usi=
ng GPIO's. If you are using interrupts then it might be some hierarchal irq=
c driver in drivers/irqchip/.

Cheers,
Prabhakar
