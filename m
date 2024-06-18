Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A5E90CD49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 15:10:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=QxBJP4p0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3Rty6p2Tz3cXD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 23:10:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=QxBJP4p0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f400:7e1a::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3RtD3X4yz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 23:09:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICyxyEkFmYekRJp67bVE4C7h8m+1ImJ1ZXGEFpKG2kNlK3SFLKBapn+v83IyyVb5dJ/7+R2luF9H+WFVarbOLIfZ/JuLdeOGQiEdLuwbVkLonLhd704NzE39dgskFoId+kdQ+hdQrSTfLj5U+kTAQcr/CHut9/4n55yA/GVQARx9c8D/nQtQ+tIzoWv9x/h1OZanKRt4aoBBRkDs8qwsWKIB/QFqt9JMDT0WiSMYLZ8fOzcToqt6I4HiAFpn3Dbq57JZO+9oTcPTR7eepv2JJrhQMRmHnKqcwuhkgsKidsCqe4soVNCQU76KO06U9KMm6PKO6Ami40E8gLSbFDZUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndiSN8ndKe9lwpIwqhKfQQcmSjV/KTwmSpDrPhUdx88=;
 b=HkUwQhArTq3VJvG1fqYV0toPqDfsv64HQR7GGPZ5o41luRSIqwIP71JSUqFai7G9TTZvaMFD8mM6Ye9vnGNE414wPBDBrQZ1rf/m3TDpYBR4Cj+TnkLClyv6Mij/9EPagneHdF54qUmIg0db7dKM7gV1+Qd4AYy1pzV+jA0WjKSg74YUvYCY5Zd6rtRRKiKdyhDq2TDvivLM7uTX3iVxT//Em5iz89AXRqZognb4G9H3870sYP2nCihswbZgVJMiAIFqN7Ww3DcMbEXz8bMFru9e7nDMxIrEUO0gaE/Q1wMVRRADRW0zpQRQJ7nPgy3XtgmE1Z0BrJGL1D4oML8VXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndiSN8ndKe9lwpIwqhKfQQcmSjV/KTwmSpDrPhUdx88=;
 b=QxBJP4p0pUhvK+D5OFhJ/uxF7UHSxwYnSvRZROoCsHk2FATRcyFmmWIDM1dTLllq8yhgM2t8kOp8gnd5eSSNV4RwiY0M8p8A0NUnD08Tp7wVf6urA3QTfKUwJEbr3X2K9ctBlO2jlgJtO3OVKI9pdoYmspqT6w/ahnt1qgToPkw2RphJO2/M2yMCsmMLhtnKtI7+G8P9/XP6oO+gZ2HiI49jutZZ3fCRpKrVQU8HhjPv6qhZGkEhCrhXtNPK0cJrlplLXyygan1CYrcnHXCJS9jafd1JowGNGauFZDz/wnGL10ZXaWNiLcL4lSHiO1G4sWZwP1Jku9Tpd2+gdmWrwA==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PAWPR07MB10011.eurprd07.prod.outlook.com (2603:10a6:102:38f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.17; Tue, 18 Jun
 2024 13:09:09 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7698.017; Tue, 18 Jun 2024
 13:09:09 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v12 00/11] Support page table check PowerPC
Thread-Topic: [PATCH v12 00/11] Support page table check PowerPC
Thread-Index: AQHawYCzJRxBrbYZqU666Bs6zh04XA==
Date: Tue, 18 Jun 2024 13:09:08 +0000
Message-ID: <ab298f1f-2c99-40eb-b5ba-13f3ac9260a9@cs-soprasteria.com>
References: <20240402051154.476244-1-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PAWPR07MB10011:EE_
x-ms-office365-filtering-correlation-id: 36d11ff1-435b-4fa5-f4a4-08dc8f97d702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info:  =?utf-8?B?ZjZxUmtDZ3VhNkdkeEtPdUhCTnE4ekpjM2lyUlhmU0FZUlJLaVVhS0tJb0R6?=
 =?utf-8?B?bVpqbmczc25CRHA1bkV0TUxqSmY4V3IwSjhpQ2pjcElzU21GV0Y2ZlNGMy83?=
 =?utf-8?B?SlVJdlU3WDVFajg0MW8rNDlVeWdMeHVYNGFHZWRWdFF0aUMwTDJ6K3VnVkMz?=
 =?utf-8?B?d08zMVBrOFRCSEF5ZURiaDlkVXdqQUdsbEdkMGdnYmNZODJ3RkZ0THIvYXhs?=
 =?utf-8?B?ZVN2ZXhSVXh2dk54YmdKM3d1Sk8rZjhWMFg0WFY2R3A1d0thRXBDc1J4OW01?=
 =?utf-8?B?NzRzTUd3Y0RubFBzT0IxckpFWngvY1F3Ly9xaVo0NnFzT3ZKVFNjVXRLWUwr?=
 =?utf-8?B?VHlQVk5MUEFVMUhYNHZveVJ3d1J4eGFTcjZud1VINitGRkV4VTE5OVl2L3Er?=
 =?utf-8?B?c25TYTJFcFpJeW94UHlOMUZDZGk2enY4b09aY0tWYmIyNzV1WHVkZWxSRmIx?=
 =?utf-8?B?V1E2cTFIUnpwNlNxZXY5RHRyQnlCUXFGcHpUby9hZXUrZHNUTm5HNVUzbU1V?=
 =?utf-8?B?TVBaUHJsNnBGVVBNQkQzVGRlVjRuKzRVWUE5ZktiU0swVnJGK055SmtFNHVO?=
 =?utf-8?B?SnQyS3krak1RYmFDMzR2VUYyWmJJT1JLcUxhbE1qRm9yLzB2TXh0QzFJTWdE?=
 =?utf-8?B?R0hBV2hJdEphSVJoTnh0Um9QWXVLaS9zUWxaWEFrL1lYRjlPMitLTUc1dkJT?=
 =?utf-8?B?Q3QrL2Z4ZHZscjNqdGMwSGRkSFU1TVkzeTR3Q1NoTzU2UmRTZStNS2R1WWlq?=
 =?utf-8?B?d2xkWkZ0azQ1ZHZpVG1FK2RJRWZ2ZGxiQlVEa1N5Q28zMjh5SjNVSGRuaXpT?=
 =?utf-8?B?cWhyMkljbWUyQ3E2aFpqdkU4aWVrTlMxaEZadUVYWStjY0xDZ3VEMzdmczFu?=
 =?utf-8?B?b0JSL2xtS1VWOEROdkZsTXo4Rlc1blREemU4NGhDaHQ1ZE5yUVhDSklucEcr?=
 =?utf-8?B?MmZGekpEMHFrOEdPa05PYjZISE9jRURYc3NRcHRVcVVXY0dTVUFwQ2M5bWs2?=
 =?utf-8?B?S29Pa1NrNlpqRVU4cmZER3ZKUmplVDhpTi9RWEg2azJ1c3JyUTBNWjQvOU1y?=
 =?utf-8?B?a29MaHFzQkkybGZadklVTVh5MWxxVzZnZG5rVFR4Q0syaDBHL1dyRXlFV1VN?=
 =?utf-8?B?ak9BMnZJdjJLQm5zTjBXL2paUWVIWEU2MFV1WUZuQ0U4M1cyUm1TOGtiMUU4?=
 =?utf-8?B?cm9tZ1h0eUxpSFhDWExxdGdZdzcvcEJFZ2tBbFFkMm13eXFjRFVodnRHZ1N5?=
 =?utf-8?B?OWVxZTFqcmNQbkxmSHltYXFOTW84QnRtOUoxVFJhdWxoWHk4QXJZMEg5aXpD?=
 =?utf-8?B?dndqejZFdTRiUUkrUk9kS3F6LzAwUm0wN1pQUVhGeUIySlNpS2tMVVpDL3RJ?=
 =?utf-8?B?dGZsV0NqWUpLb3JFU296WWkvemJyRVJTUm5ZOVRzSVZTQzh0NkxFOFN0ZTQ5?=
 =?utf-8?B?dVhYb1c1VitZTDc4Y3pvd21BOTNsREhHS2FudFdLdWVCQ1p5SGdqeXlKcks2?=
 =?utf-8?B?SFFpaVg5QU94RXFKQnRIMXVaNWhNUml5VnNLQldRcXlGeG5mdUlyb1htT1RE?=
 =?utf-8?B?N3VYU2p5cDZZUk0wb0lpa3h2bkhycEc4T3E1UGc1VnVYZ0U4RGtmZ1MzQTVn?=
 =?utf-8?B?OVNzbUlHRk04QXdDc0pXMU90K1JkanU1bVY3NTErcERMbjVONlJvYXBRN3F2?=
 =?utf-8?B?RTVseG41Sm1iQUZXNkdobC90NHJFVUxxejRrTTlRa2RySWI5cWVQU3dzdVZl?=
 =?utf-8?Q?B4Gdcj3SZiuej3LduxiDVcB0RsVzoRg8s/W56AZ?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZFRGQTN2THJ3M1lPMEtIbW54WlZ3ZUJmOVhSZUVTcllBZnp2UHlSbXFzdWlQ?=
 =?utf-8?B?VTVmaFhsVG04d2F6dkFxRW1mNCtQWkxBK3lCT1ZnVFhkUnc1RHpkZFFDODFU?=
 =?utf-8?B?NTEza3JwZWxwRk5wSVdTdVB1c1p4SkI0UnZUMFRsVzRhV3BncmlSTmlJdGJW?=
 =?utf-8?B?THlveDM1Slo5RGtxemh1enhwTWx1Y2MzSjl2cFduOENQZktwVTcyaXYzbDNS?=
 =?utf-8?B?NVRyWXVPcWVIa1d0VVZTTzlEWTluTFBSVWpJWDErd0hvMHZSOENVRTRub1RJ?=
 =?utf-8?B?VjkzcmtLdC9aRnN2K3ZQVzVsKzdGbTNXSG8zaFJYNm1DaGdwZnU2YlhOSzhM?=
 =?utf-8?B?a0R1RVBmbU1YWUx5RGorZThIYk52eGwyTEdvRHJUaDAvWUlxK25WR1lrbkJU?=
 =?utf-8?B?dUpLWTJHOG1kRjZmc3J3UkVQWEpiL0FSWTEycU9tYzJ0bGMvNjlmRHhYNkd0?=
 =?utf-8?B?OFo5b3A1ZVpwbk1iR3RNUk9ObXdVODE3dk90WExBbWJDVEVBcVNabHhZdEFO?=
 =?utf-8?B?WnRzS256QkxFak9Ya0l2YVdIdjZvbnpDTFFyaWN2aUZDMDJEMERXKy9KcldQ?=
 =?utf-8?B?bnA0ZWlSTzdTMlVCUkFXTWZ3MmxadGYwZHdqTFg2YnFvUXQwMysyU3hoWXlR?=
 =?utf-8?B?YmR5dCtINXVZeEZJbm1ndHZHMUxxbzdlYVNQeUc4Q0hjU0pydGcyNjBxc0xN?=
 =?utf-8?B?c1F3RHQrUWMvMjdhQ01xaURTcVV0dWdacEdVVWwyLzlXZFJNcm5jR1ZvNHZV?=
 =?utf-8?B?NUN1MUVpZ2NGWXhpNmZjaytXMGt1VHRHd0FsVGw3aUg0R0kxSGx2WXZ3OVZs?=
 =?utf-8?B?NG9NdTMwYmtJNUFPSUFpUDNSRUtUWU1Xei9SemVSZE5LeDFvTW1YaUdQWFpF?=
 =?utf-8?B?N2tkMXBsUG1QNnh5WjhxSmpzY3FIRVBIdTFSeXJ6UU9WYkZsQVloSkVqQjNR?=
 =?utf-8?B?bkNVcks1T0FLRzd2NmRVSFQwN2V3M0RDTktFNzdQdGwveHFJQjRDQVBqejNB?=
 =?utf-8?B?TU9kRnlGNGh0NXdzVkFqTTRkMVlXeXdBY0lOYytIVHpEK0V3cmh6MlVMOVpl?=
 =?utf-8?B?YnBUL0twSW91dHhVaUVqN3g0WFZuVXljaCswMzRjV1IwWUVxNDk0d2wyWVRa?=
 =?utf-8?B?eXErMWpCSnJkUnBsRTBOZDRFSnNEVDBEUTUzN05GWS9aUkJ6bjJTaXJIUjdT?=
 =?utf-8?B?UCtRVjJydVpDQzFJZ1NHcGI5VXc4NGNwQWUxS1JBS2p6bTlhT0tZYUlFKzlR?=
 =?utf-8?B?TGx2eWtTUURsSnE0dldQaDFGdTgySUllZytBODJaUkRpY00zVUdjR0xmck1y?=
 =?utf-8?B?NG44UTBwMis2YUJLUFd3L2Z2L3hVUk5UYW1vcEoyQXpyV2NOM29JdDRyMXRi?=
 =?utf-8?B?RnhnRFI5MGNwQkxRUEt4RjZPNVVLNGdqNWpzRVNvMWJINEhvcmhYemE3aHFC?=
 =?utf-8?B?RVU5NHBIQzBJMlQ5Q1RCSGs1em9pbkFqV2ZhUkd1ZGo1ZFRMSEFSUkxSTHhS?=
 =?utf-8?B?Kzh1T21JZUo0NGFObGZnWVhXWkNHUzg3NE40R1FRUVEwb3ZhRWMva0VSWWFY?=
 =?utf-8?B?bXpsK2lkQVJad0J4alArcXdMaWtBUW5DWXRvUnkyRXlEckN5TGV2VEVLbVR2?=
 =?utf-8?B?cDlFa2FHcVZFaEhOdHNLenN2VTNLT3ZuUTRhUEtRUENpbmZOWTNuZC9VTmxy?=
 =?utf-8?B?VjVNZzdpbDV6dU9FVkZUMDlPZkY2T0ptdzl0TUVCd2xLVU0vTGcxVW15akxl?=
 =?utf-8?B?am9uQTVTM2Nld2FOK0sxZ0F1dnBFU0Y4T1ppYllxcTZMTFZHcFBJYzVSUU1x?=
 =?utf-8?B?NmF5QXhzNU8ySVljSVU5RFoySFFQQ1VKTGpiMGYrelgyeEJEbFZqZk9OSjdl?=
 =?utf-8?B?OVRjT2RwbG9mNEtiMU5ZZ0krNTduL21tYTM0Skh2NXhETk5GcG5xeDhpL0Ja?=
 =?utf-8?B?VC9aTi9jdkFUdElKdXhzRnN0RmRHektoNjBRSWJHVlIxWktSNHRNUmlRL0ZC?=
 =?utf-8?B?WnY2YXpwRGxoMFZ2Z3NoMHVuS0JxT1YvUG9CYk90RFdFM1F2TUgrTDBpSUs2?=
 =?utf-8?B?ZFZlRnZsaCtZUUkyays5UDFiWmkwcnBRZTNOdjBQZjY0ZWloR1BDWTN6NnRt?=
 =?utf-8?B?c3Z0SHRXVVBiaC9ZNElmMjVBc0M2SUVYQUdrdnUzNkc1SzJBM243dmZHWUww?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F12C716BE8E6074AB6A65E58772952E3@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d11ff1-435b-4fa5-f4a4-08dc8f97d702
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 13:09:08.9496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: szBOmbU9yXoxiKkKWhhbBf3qHjC7sL0/7cyGu1MELN7Oynw5c3B8AUjngKOnki4HKRwynICyg5XICslFeRbnCuQpCp5UPZtL5U7TRkWV4Rg2CMMw00wB9qefVF/LyPp+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB10011
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 153.98.68.80
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PAWPR07MB10011.eurprd07.prod.outlook.com
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
Cc: "x86@kernel.org" <x86@kernel.org>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzA0LzIwMjQgw6AgMDc6MTEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBT
dXBwb3J0IHBhZ2UgdGFibGUgY2hlY2sgb24gYWxsIFBvd2VyUEMgcGxhdGZvcm1zLiBUaGlzIHdv
cmtzIGJ5DQo+IHNlcmlhbGlzaW5nIGFzc2lnbm1lbnRzLCByZWFzc2lnbm1lbnRzIGFuZCBjbGVh
cnMgb2YgcGFnZSB0YWJsZQ0KPiBlbnRyaWVzIGF0IGVhY2ggbGV2ZWwgaW4gb3JkZXIgdG8gZW5z
dXJlIHRoYXQgYW5vbnltb3VzIG1hcHBpbmdzDQo+IGhhdmUgYXQgbW9zdCBvbmUgd3JpdGFibGUg
Y29uc3VtZXIsIGFuZCBsaWtld2lzZSB0aGF0IGZpbGUtYmFja2VkDQo+IG1hcHBpbmdzIGFyZSBu
b3Qgc2ltdWx0YW5lb3VzbHkgYWxzbyBhbm9ueW1vdXMgbWFwcGluZ3MuDQo+IA0KPiBJbiBvcmRl
ciB0byBzdXBwb3J0IHRoaXMgaW5mcmFzdHJ1Y3R1cmUsIGEgbnVtYmVyIG9mIHN0dWJzIG11c3Qg
YmUNCj4gZGVmaW5lZCBmb3IgYWxsIHBvd2VycGMgcGxhdGZvcm1zLiBBZGRpdGlvbmFsbHksIHNl
cGVyYXRlIHNldF9wdGVfYXQoKQ0KPiBhbmQgc2V0X3B0ZV9hdF91bmNoZWNrZWQoKSwgdG8gYWxs
b3cgZm9yIGludGVybmFsLCB1bmluc3RydW1lbnRlZCBtYXBwaW5ncy4NCg0KU2VlbXMgbGlrZSB0
aGlzIHNlcmllcyBkb2Vzbid0IGFwcGx5LCBwYXRjaCAxIGhhcyBjb25mbGljdCB3aXRoIFJJU0NW
LCANCnBhdGNoIDIgd2l0aCBtbSBhbmQgUklTQ1YuDQoNClBsZWFzZSByZWJhc2UgYXMgYXBwcm9w
cmlhdGUuDQoNCkNocmlzdG9waGUNCg0KPiANCj4gdjEyOg0KPiAgICogUmVuYW1lIGNvbW1pdHMg
dGhhdCByZXZlcnQgY2hhbmdlcyB0byBpbnN0ZWFkIHJlZmxlY3QgdGhhdCB3ZSBhcmUNCj4gICAg
IHJlaW5zdGF0aW5nIG9sZCBiZWhhdmlvdXIgZHVlIHRvIGl0IHByb3ZpZGluZyBtb3JlIGZsZXhp
YmlsaXR5DQo+ICAgKiBBZGQgcmV0dXJuIGxpbmUgdG8gcHVkX3BmbigpIHN0dWINCj4gICAqIElu
c3RydW1lbnQgcHRlcF9nZXRfYW5kX2NsZWFyKCkgZm9yIG5vaGFzaA0KPiANCj4gdjExOg0KPiAg
ICogVGhlIHB1ZF9wZm4oKSBzdHViLCB3aGljaCBwcmV2aW91c2x5IGhhZCBubyBsZWdpdGltYXRl
IHVzZXJzIG9uIGFueQ0KPiAgICAgcG93ZXJwYyBwbGF0Zm9ybSwgbm93IGhhcyB1c2VycyBpbiBC
b29rM3M2NCB3aXRoIHRyYW5zcGFyZW50IHBhZ2VzLg0KPiAgICAgSW5jbHVkZSBhIHN0dWIgb2Yg
dGhlIHNhbWUgbmFtZSBmb3IgZWFjaCBwbGF0Zm9ybSB0aGF0IGRvZXMgbm90DQo+ICAgICBkZWZp
bmUgdGhlaXIgb3duLg0KPiAgICogRHJvcCBwYXRjaCB0aGF0IHN0YW5kYXJkaXNlZCB1c2Ugb2Yg
cCpkX2xlYWYoKSwgYXMgYWxyZWFkeSBpbmNsdWRlZA0KPiAgICAgdXBzdHJlYW0gaW4gdjYuOS4N
Cj4gICAqIFByb3ZpZGUgZmFsbGJhY2sgZGVmaW5pdGlvbnMgb2YgcHttLHV9ZF91c2VyX2FjY2Vz
c2libGVfcGFnZSgpIHRoYXQNCj4gICAgIGRvIG5vdCByZWZlcmVuY2UgcCpkX2xlYWYoKSwgcCpk
X3B0ZSgpLCBhcyB0aGV5IGFyZSBkZWZpbmVkIGFmdGVyDQo+ICAgICBwb3dlcnBjL21tIGhlYWRl
cnMgYnkgbGludXgvbW0gaGVhZGVycy4NCj4gICAqIEVuc3VyZSB0aGF0IHNldF9wdGVfYXRfdW5j
aGVja2VkKCkgaGFzIHRoZSBzYW1lIGNoZWNrcyBhcw0KPiAgICAgc2V0X3B0ZV9hdCgpLg0KPiBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eHBwYy1kZXYvMjAyNDAzMjgwNDU1MzUu
MTk0ODAwLTE0LXJtY2x1cmVAbGludXguaWJtLmNvbS8NCj4gDQo+IHYxMDoNCj4gICAqIFJldmVy
dCBwYXRjaGVzIHRoYXQgcmVtb3ZlZCBhZGRyZXNzIGFuZCBtbSBwYXJhbWV0ZXJzIGZyb20gcGFn
ZSB0YWJsZQ0KPiAgICAgY2hlY2sgcm91dGluZXMsIGluY2x1ZGluZyBjb25zdW1pbmcgY29kZSBm
cm9tIGFybTY0LCB4ODZfNjQgYW5kDQo+ICAgICByaXNjdi4NCj4gICAqIEltcGxlbWVudCAqX3Vz
ZXJfYWNjZXNzaWJsZV9wYWdlKCkgcm91dGluZXMgaW4gdGVybXMgb2YgcHRlX3VzZXIoKQ0KPiAg
ICAgd2hlcmUgYXZhaWxhYmxlICg2NC1iaXQsIGJvb2szcykgYnV0IG90aGVyd2lzZSBieSBjaGVj
a2luZyB0aGUNCj4gICAgIGFkZHJlc3MgKG9uIHBsYXRmb3JtcyB3aGVyZSB0aGUgcHRlIGRvZXMg
bm90IGltcGx5IHdoZXRoZXIgdGhlDQo+ICAgICBtYXBwaW5nIGlzIGZvciB1c2VyIG9yIGtlcm5l
bCkNCj4gICAqIEludGVybmFsIHNldF9wdGVfYXQoKSBjYWxscyByZXBsYWNlZCB3aXRoIHNldF9w
dGVfYXRfdW5jaGVja2VkKCksIHdoaWNoDQo+ICAgICBpcyBpZGVudGljYWwsIGJ1dCBwcmV2ZW50
cyBkb3VibGUgaW5zdHJ1bWVudGF0aW9uLg0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eHBwYy1kZXYvMjAyNDAzMTMwNDIxMTguMjMwMzk3LTktcm1jbHVyZUBsaW51eC5pYm0u
Y29tL1QvDQo+IA0KPiB2OToNCj4gICAqIEFkYXB0IHRvIHVzaW5nIHRoZSBzZXRfcHRlcygpIEFQ
SSwgdXNpbmcgX19zZXRfcHRlX2F0KCkgd2hlcmUgd2UgbmVlZA0KPiAgICAgbXVzdCBhdm9pZCBp
bnN0cnVtZW50YXRpb24uDQo+ICAgKiBVc2UgdGhlIGxvZ2ljIG9mICpfYWNjZXNzX3Blcm1pdHRl
ZCgpIGZvciBpbXBsZW1lbnRpbmcNCj4gICAgICpfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UoKSwgd2hp
Y2ggYXJlIHJlcXVpcmVkIHJvdXRpbmVzIGZvciBwYWdlIHRhYmxlDQo+ICAgICBjaGVjay4NCj4g
ICAqIEV2ZW4gdGhvdWdoIHdlIG5vIGxvbmdlciBuZWVkIHB7bSx1LDR9ZF9sZWFmKCksIHN0aWxs
IGRlZmF1bHQNCj4gICAgIGltcGxlbWVudCB0aGVzZSB0byBhc3Npc3QgaW4gcmVmYWN0b3Jpbmcg
b3V0IGV4dGFudA0KPiAgICAgcHttLHUsNH1faXNfbGVhZigpLg0KPiAgICogQWRkIHB7bSx1fV9w
dGUoKSBzdHVicyB3aGVyZSBhc20tZ2VuZXJpYyBkb2VzIG5vdCBwcm92aWRlIHRoZW0sIGFzDQo+
ICAgICBwYWdlIHRhYmxlIGNoZWNrIHdhbnRzIGFsbCAqdXNlcl9hY2Nlc3NpYmxlX3BhZ2UoKSB2
YXJpYW50cywgYW5kIHdlDQo+ICAgICB3b3VsZCBsaWtlIHRvIGRlZmF1bHQgaW1wbGVtZW50IHRo
ZSB2YXJpYW50cyBpbiB0ZXJtcyBvZg0KPiAgICAgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlKCku
DQo+ICAgKiBBdm9pZCB0aGUgdWdseSBwbWRwX2NvbGxhcHNlX2ZsdXNoKCkgbWFjcm8gbm9uc2Vu
c2UhIEp1c3QgaW5zdHJ1bWVudA0KPiAgICAgaXRzIGNvbnN0aXR1ZW50IGNhbGxzIGluc3RlYWQg
Zm9yIHJhZGl4IGFuZCBoYXNoLg0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eHBwYy1kZXYvMjAyMzExMzAwMjU0MDQuMzcxNzktMi1ybWNsdXJlQGxpbnV4LmlibS5jb20vDQo+
IA0KPiB2ODoNCj4gICAqIEZpeCBsaW51eC9wYWdlX3RhYmxlX2NoZWNrLmggaW5jbHVkZSBpbiBh
c20vcGd0YWJsZS5oIGJyZWFraW5nDQo+ICAgICAzMi1iaXQuDQo+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4cHBjLWRldi8yMDIzMDIxNTIzMTE1My4yMTQ3NDU0LTEtcm1jbHVy
ZUBsaW51eC5pYm0uY29tLw0KPiANCj4gdjc6DQo+ICAgKiBSZW1vdmUgdXNlIG9mIGV4dGVybiBp
biBzZXRfcHRlIHByb3RvdHlwZXMNCj4gICAqIENsZWFuIHVwIHBtZHBfY29sbGFwc2VfZmx1c2gg
bWFjcm8NCj4gICAqIFJlcGxhY2Ugc2V0X3B0ZV9hdCB3aXRoIHN0YXRpYyBpbmxpbmUgZnVuY3Rp
b24NCj4gICAqIEZpeCBjb21taXQgbWVzc2FnZSBmb3IgcGF0Y2ggNw0KPiBMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eHBwYy1kZXYvMjAyMzAyMTUwMjAxNTUuMTk2OTE5NC0xLXJt
Y2x1cmVAbGludXguaWJtLmNvbS8NCj4gDQo+IHY2Og0KPiAgICogU3VwcG9ydCBodWdlIHBhZ2Vz
IGFuZCBwe20sdX1kIGFjY291bnRpbmcuDQo+ICAgKiBSZW1vdmUgaW5zdHJ1bWVudGF0aW9uIGZy
b20gc2V0X3B0ZSBmcm9tIGtlcm5lbCBpbnRlcm5hbCBwYWdlcy4NCj4gICAqIDY0czogSW1wbGVt
ZW50IHBtZHBfY29sbGFwc2VfZmx1c2ggaW4gdGVybXMgb2YgX19wbWRwX2NvbGxhcHNlX2ZsdXNo
DQo+ICAgICBhcyBhY2Nlc3MgdG8gdGhlIG1tX3N0cnVjdCAqIGlzIHJlcXVpcmVkLg0KPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eHBwYy1kZXYvMjAyMzAyMTQwMTU5MzkuMTg1
MzQzOC0xLXJtY2x1cmVAbGludXguaWJtLmNvbS8NCj4gDQo+IHY1Og0KPiBMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eHBwYy1kZXYvMjAyMjExMTgwMDIxNDYuMjU5NzktMS1ybWNs
dXJlQGxpbnV4LmlibS5jb20vDQo+IA0KPiBSb2hhbiBNY0x1cmUgKDExKToNCj4gICAgbW0vcGFn
ZV90YWJsZV9jaGVjazogUmVpbnN0YXRlIGFkZHJlc3MgcGFyYW1ldGVyIGluDQo+ICAgICAgW19f
XXBhZ2VfdGFibGVfY2hlY2tfcHVkX3NldCgpDQo+ICAgIG1tL3BhZ2VfdGFibGVfY2hlY2s6IFJl
aW5zdGF0ZSBhZGRyZXNzIHBhcmFtZXRlciBpbg0KPiAgICAgIFtfX11wYWdlX3RhYmxlX2NoZWNr
X3BtZF9zZXQoKQ0KPiAgICBtbS9wYWdlX3RhYmxlX2NoZWNrOiBQcm92aWRlIGFkZHIgcGFyYW1l
dGVyIHRvDQo+ICAgICAgcGFnZV90YWJsZV9jaGVja19wdGVfc2V0KCkNCj4gICAgbW0vcGFnZV90
YWJsZV9jaGVjazogUmVpbnN0YXRlIGFkZHJlc3MgcGFyYW1ldGVyIGluDQo+ICAgICAgW19fXXBh
Z2VfdGFibGVfY2hlY2tfcHVkX2NsZWFyKCkNCj4gICAgbW0vcGFnZV90YWJsZV9jaGVjazogUmVp
bnN0YXRlIGFkZHJlc3MgcGFyYW1ldGVyIGluDQo+ICAgICAgW19fXXBhZ2VfdGFibGVfY2hlY2tf
cG1kX2NsZWFyKCkNCj4gICAgbW0vcGFnZV90YWJsZV9jaGVjazogUmVpbnN0YXRlIGFkZHJlc3Mg
cGFyYW1ldGVyIGluDQo+ICAgICAgW19fXXBhZ2VfdGFibGVfY2hlY2tfcHRlX2NsZWFyKCkNCj4g
ICAgbW06IFByb3ZpZGUgYWRkcmVzcyBwYXJhbWV0ZXIgdG8gcHt0ZSxtZCx1ZH1fdXNlcl9hY2Nl
c3NpYmxlX3BhZ2UoKQ0KPiAgICBwb3dlcnBjOiBtbTogQWRkIHB1ZF9wZm4oKSBzdHViDQo+ICAg
IHBvd2VwcmM6IG1tOiBJbXBsZW1lbnQgKl91c2VyX2FjY2Vzc2libGVfcGFnZSgpIGZvciBwdGVz
DQo+ICAgIHBvd2VycGM6IG1tOiBVc2Ugc2V0X3B0ZV9hdF91bmNoZWNrZWQoKSBmb3IgZWFybHkt
Ym9vdCAvIGludGVybmFsDQo+ICAgICAgdXNhZ2VzDQo+ICAgIHBvd2VycGM6IG1tOiBTdXBwb3J0
IHBhZ2UgdGFibGUgY2hlY2sNCj4gDQo+ICAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggICAgICAgICAgICAgfCAxOCArKystLS0NCj4gICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
Ym9vazNzLzMyL3BndGFibGUuaCB8IDEyICsrKy0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vYm9vazNzLzY0L3BndGFibGUuaCB8IDYyICsrKysrKysrKysrKysrKy0tLQ0KPiAgIGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oICAgIHwgMTMgKysrLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAgICAgIHwgMTkgKysrKysrDQo+
ICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfcGd0YWJsZS5jICAgICAgfCAgNiArLQ0K
PiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9wZ3RhYmxlLmMgICAgICAgICAgIHwgMTcgKysr
LS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jICAgICB8IDEx
ICsrLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vbm9oYXNoL2Jvb2szZV9wZ3RhYmxlLmMgICAgICB8
ICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyAgICAgICAgICAgICAgICAgICAg
fCAxMiArKysrDQo+ICAgYXJjaC9wb3dlcnBjL21tL3BndGFibGVfMzIuYyAgICAgICAgICAgICAg
ICAgfCAgMiArLQ0KPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAg
ICAgIHwgMTggKysrLS0tDQo+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAg
ICAgICAgICAgfCAyMCArKystLS0NCj4gICBpbmNsdWRlL2xpbnV4L3BhZ2VfdGFibGVfY2hlY2su
aCAgICAgICAgICAgICB8IDY3ICsrKysrKysrKysrKy0tLS0tLS0tDQo+ICAgaW5jbHVkZS9saW51
eC9wZ3RhYmxlLmggICAgICAgICAgICAgICAgICAgICAgfCAgOCArLS0NCj4gICBtbS9wYWdlX3Rh
YmxlX2NoZWNrLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDM5ICsrKysrKystLS0tLQ0KPiAg
IDE3IGZpbGVzIGNoYW5nZWQsIDIyOCBpbnNlcnRpb25zKCspLCA5OSBkZWxldGlvbnMoLSkNCj4g
DQo=
