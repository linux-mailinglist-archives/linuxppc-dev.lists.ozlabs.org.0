Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 454AC46817F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 01:42:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5W9R1S1tz30RK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 11:42:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=OAWtwVGG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1f::604;
 helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=OAWtwVGG; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5W8Z1tlVz2ynt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 11:41:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0syJGOK7aqhdmAZHOij/5Wms4vJQaZht48WLlHtB88j4jqtmKOqDLQoGl9wuz3lXnwHUOhVu7m/ES0wFMVD3B+AV2qk0jMIkkKEbei3OveX/yXIHlbTvE3qoX6/m/PdXKa64kHoOvz6R/FWDAUd2NquWnS0/MZNSZuUxHUU0drLQXiGv6pqK76fDeKVsIUyDhFQY+tfxfKCmyHBDikS2D7+L8nQGYEN5VaD2Do4Y8I32UNQmKT0+FPHGKv6WvW24l0Dv8iMXd9NDrgz+M2oKlctpGqcbcKFAW6XhMVXJaOTsorQBrzLZ3UFj6Sle13TqVHDnwokq8MryDtoG7sfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tNeaJOZGLTV8aOf2Lrf4VAECzon5XbUkWOFCLAKlCw=;
 b=oS2WkypYgfKaiR9xatPBNhpQ/sl5SQ8/EmZpm65+XM+agbCmOTohXxt4xPjgG+V4xPuUKnVjc3u5XmQjYLSPYsHfodLvZ7rBZXYBJLbD8j7qqW8OlATuFcjKdHL0ejfmD/HQnkp3+h2e0WiXBIhZqtyqarE/Iz+lfA0R0Nh3S4fvrzwdPWfs9KWYqKcmXN6Z7UensV5i819P3yTv8B7hLAmskGzBWsr/BKeN50n7oQsfX6wW5CR7p5dq3mkn0s636ammDOmASOUPrKvNiNbKgn4HHMNLj9MJ5Wm+ROI9cwnAxC4cQmKRZQwJN3RZyfeeFk0rphL92H5sRF4/BSjoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tNeaJOZGLTV8aOf2Lrf4VAECzon5XbUkWOFCLAKlCw=;
 b=OAWtwVGGuspN1gGXUTp62Fa/oFXOS2sls2gE8ZgTEquNG1ZPBKlasTXY3OBFESP6PLYj+eoJPGzaVJoTsZfxF5BXHrcg5qGU69GHfm0PeI05oSjumQ2he5ZuAGycpaP4mrCGRNutsQY9fkS3lN4L9S6t4XMs0ANkrCIBjI8T9wk=
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 by AS1PR04MB9311.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Sat, 4 Dec
 2021 00:40:52 +0000
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b]) by AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b%5]) with mapi id 15.20.4755.016; Sat, 4 Dec 2021
 00:40:52 +0000
From: Leo Li <leoyang.li@nxp.com>
To: "jocke@infinera.com" <joakim.tjernlund@infinera.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oACc0lYgABIbVXQAbnCUAAA0DL90AAM8XwQAABPhqAAGbtsgAA3RpcAAD9HUaAABKxzgAA1v9lw
Date: Sat, 4 Dec 2021 00:40:52 +0000
Message-ID: <AS8PR04MB89464D90D2E92A5D401474BD8F6B9@AS8PR04MB8946.eurprd04.prod.outlook.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
 <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
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
In-Reply-To: <f31008a0f4e71ff029aa611b0ebcfd83f10ec67f.camel@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50f7c029-17ab-46e0-1db6-08d9b6beb9db
x-ms-traffictypediagnostic: AS1PR04MB9311:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AS1PR04MB9311608EA286A4964C3CB8118F6B9@AS1PR04MB9311.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7PajCTMryXCmaWnZs92ypuylghVkfyX306XWmg4QK6fT7bB7OZOVmGM+D85jTdNPPrRk0ugAay3KIN/GiEEt577TNQVrWmdGDDAb2KlA2KeEc3w/nlsuKnHTvwlYZb6hyjdfLNeq02n6i4J8PxsgGRHHcQjZZEFsRZwSwjDub6sQdYw+Z4xEczk5BDPMBBdbss1SN0grCp+AWWmyQ0eKzF6tZELnuxGjaPlIML3SBxBvFNXIfmyBF2GharnsH1Fgsig0x9WtRw/I7Kl2p/Ur8xkGVKRX3R940d/0H84xvAaarSNTH5s6WnVftcsB8/JCeeB86uNXjobrqIZPYsrvluQBTl87SLN7Rn++lPnhWravMBPCow3FTwNdA48hKezvZUNeG+/wCDBo7uaEtteb6ebTJ6MuGTW1pUqOjnRlYKTBDEPe5MoOr8aC233fldbQxYqDkL2ylM6WhS1ZID+sVN/1edYpCXOt2dLDpqHc9qizlv1IgYvLNCNaZdjpW1boItYTAPraYJyxKiZ6Z1gGrA1/X3uA/oYsgMl3ikuMMjAXApfOs9LpqAIedzvP5R06wChn4b2dVL1XoaZ5wah1JaOuS07cW9Xyd3zhAjFbpt2g+xY6WoV0gNgh+8JNl1K+pH3RtLCQl7aR94Vly5+sx9DWMo1J+IjioI0hkrFYJaKkfVFTotKVFUNuBRJDphjxkEItOuncaSEI1MAf0RRQyjEGD6ZPB1GqGLspXQi3lWc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8946.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(55016003)(52536014)(5660300002)(66446008)(186003)(8936002)(66476007)(33656002)(66556008)(26005)(7696005)(4001150100001)(64756008)(4326008)(38070700005)(76116006)(71200400001)(122000001)(53546011)(54906003)(66946007)(8676002)(110136005)(86362001)(316002)(38100700002)(6506007)(508600001)(83380400001)(9686003)(491001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHFmOVAvR2NWYzVyUjFZUVg3dEk5VnBOR0RFY1RNWGJTTlhXMVN4NWJZK1Nt?=
 =?utf-8?B?SGczdFNYcW9jcTR1d0NmejdHMjN0SWhRcmllMktOS2V1TklxTlZnVndIek1t?=
 =?utf-8?B?enZkaEFBNEVFTjB3ckZPM1BvUk9QRk1RYnU4b255L0dvVG9JQldOQVp1aVpQ?=
 =?utf-8?B?bmxkeGg5VE02anV3b3JZZmU4WW52bW9UQjg0ZkV0dlZIV01LcVZiRmRSY3Mz?=
 =?utf-8?B?N2tvWHF2U1hjUk03c3VnaDIrQytxc1hpek9JWmVsNXd1eFlPN3JCRDNvTGNN?=
 =?utf-8?B?elAxbmxPZnAyT256WmdrZ1JNSHNDMHl5ZVVDNUpBUWZLNzNOWEhLcGxOOEpF?=
 =?utf-8?B?UU9QQTByWE4vY013TERoUzFJYXBvL1JQcDQyR1RySWhRTHZuNlpONWxXeStt?=
 =?utf-8?B?VXQ0TlFUQnZNVmY1YlBEOHY4YWl4eVlDeEZPamEzTXU3dm9KQ2ozTS9aQTZH?=
 =?utf-8?B?eE1YeSthcDFiODA3ZEkvcTdsTTZueWlSSVN1MGx3a2pienZSNGVqMVNHUUtl?=
 =?utf-8?B?K3hCUnY2ZmxRdWpmYU5xVUxWRWN6bm5tV3Fod25uTmVjTEVjWEJvM1FUK2RM?=
 =?utf-8?B?bC9EOUNSbXNmcHU2QjFsTjh2eFNGeHR5bzR2Y1VMVTJQdWFDS3Bzd3ZzTjhK?=
 =?utf-8?B?ZDBTb2VJaC9BMjFTTnZkS010SjB6dXhMamZGNm9QaGVpRm13eDBqdnJSRnJp?=
 =?utf-8?B?OVN1eE9PWFJOVksvN3BUSVNZU0hWN3o4Yk1hTEV0QkVvUVAvOUxHS25OQW9E?=
 =?utf-8?B?N0xmVzVkc3JjblR5elYrcStPSFdJUmVFbmlaUXNlMWE5bXFKZXBYaElUenZ2?=
 =?utf-8?B?T1diRm5nU0FSdXFxczVMS3VDTWJnVjNLeEVWcjlVM1NOWm1sUFFVYndrem5h?=
 =?utf-8?B?REsyUzM1N0VjZVZFQVVwell1V2Nlb21nUjJma2pGeWc5U3haZTlkZ2tBbEZl?=
 =?utf-8?B?MkpSVHdZWXR0M0c1bVJEZGtKS1l5UHBGczVBYmZVNmRmTThIT2VYV29KdnZM?=
 =?utf-8?B?MUpjS0IxVGw5YVgzZkdvcWNkTGVnck1kM3NiNU5IeXhac2gvcFpkdmFpbTRM?=
 =?utf-8?B?L3Z5d1BVcUtvZjRlS3ZmV0taVjlHcW5JQ2JrVlB1ZnZVOW1vcHNPNGVwZW9i?=
 =?utf-8?B?YWR2N0NLK3BuclVvWUpyeWVNZEhGeU0wNGN5RjkvSTdKNTVINFh4clZhZTk3?=
 =?utf-8?B?dkdYY2w4VFMwRlJKMzJjSkRDb3VCMVVVcCs2VjlsZEpIRUViK2huZlFaVnZr?=
 =?utf-8?B?UTNKcmtrZGxEWGdjNC9oSXNJWEd0S3V3RURJOW0ySXJFRTVvWXRjdFJGMlhq?=
 =?utf-8?B?WnZPSDZrYmxGK3hBV1lPZHJPZ3Nzd1V2S2srZTVsTWdINEpPUG8vTENxeFE0?=
 =?utf-8?B?OHFmS001YU5uc0NLY0RaeEx1czlUdUtYaXBNaS8venhZZ2hZV2w3UHhyRVdE?=
 =?utf-8?B?YlJJajhheHFjRmNDTWFpeC9MUTFjSm0xaDlHYW9wNVhCYTQ5RVl0NTJvWkk3?=
 =?utf-8?B?OXV1cS90eU9NejE0SXJFMHdoaFJPR1kzbmRNOWtCb0hzdjRYVmdoZzBsTjRP?=
 =?utf-8?B?S25MU1Z1UGJUWmNvSmV5YUxxY2ZlY3Jia1lBVzQ1aTM4KzU3TnNVZjg5WVp0?=
 =?utf-8?B?K1h5dm9FVy9Wcm9UVU91ckRkK1JPTzZRWVAzWWhkQWFJcEhJWDF3cWdmbktH?=
 =?utf-8?B?aG5zWHRlS00zMXFDYmxtY3NEVEYzbTRXT0tzOFA3UzRYcUEyUlZRQnhKY3BB?=
 =?utf-8?B?YW1NZlkvY05uSzhaOTN4RFZYZDljUXRrMnViY2Uyc24vdlBwMkhXUUF5K1po?=
 =?utf-8?B?dkZGS3hXTEZnakx3bkZVekhwVnpmVUd6QUk5Zk9tOUQ5Q0J2Q2ZSOWl4OTM0?=
 =?utf-8?B?ckVwb01xanJFWENlOGVEb0FDQ0h3RlkvLzlCZkRpSXJiWmZNd2FnMU1OYnQw?=
 =?utf-8?B?cFllT1QyNzQ3Ly80VGpHeEVaWGZkWWluanRxWUhSazdWaGNpMlM5QWlOUC9x?=
 =?utf-8?B?bkNacksrSU1hNDBnZFlGWFlrVFh1U2wydkJVRDhpTjZiQXBWTHFKTkUyK25R?=
 =?utf-8?B?dVVYcXJISUJRRld2Qy9GZFVVRW05NThzUVVJbW42UzJraW1JSyttN3VqTXFx?=
 =?utf-8?B?SlIxaE9qSTlWK2QrZjVDbE53OXI2MitFUFFvZWZ5TUdRT1RGSE1iM2JoM0NP?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8946.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f7c029-17ab-46e0-1db6-08d9b6beb9db
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2021 00:40:52.6219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JAxH5/OK1w6Hoe875txmwwNmqCc+NaHNmkGvdWeF5zvb9pRuw1EP8V9Brz3eMxN7f+UCk2FQObjkTW6OGEGUXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9311
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9ha2ltIFRqZXJubHVu
ZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBEZWNl
bWJlciAyLCAyMDIxIDQ6NDUgUE0NCj4gVG86IHJlZ3Jlc3Npb25zQGxlZW1odWlzLmluZm87IExl
byBMaSA8bGVveWFuZy5saUBueHAuY29tPjsNCj4gRXVnZW5lX0JvcmRlbmtpcmNoZXJAc2VsaW5j
LmNvbTsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgbGludXhwcGMtDQo+IGRldkBsaXN0cy5v
emxhYnMub3JnDQo+IENjOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgYmFsYmlAa2VybmVs
Lm9yZw0KPiBTdWJqZWN0OiBSZTogYnVnOiB1c2I6IGdhZGdldDogRlNMX1VEQ19DT1JFIENvcnJ1
cHRlZCByZXF1ZXN0IGxpc3QgbGVhZHMgdG8NCj4gdW5yZWNvdmVyYWJsZSBsb29wLg0KPiANCj4g
T24gVGh1LCAyMDIxLTEyLTAyIGF0IDIwOjM1ICswMDAwLCBMZW8gTGkgd3JvdGU6DQo+ID4NCj4g
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBKb2FraW0gVGplcm5s
dW5kIDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNvbT4NCj4gPiA+IFNlbnQ6IFdlZG5lc2Rh
eSwgRGVjZW1iZXIgMSwgMjAyMSA4OjE5IEFNDQo+ID4gPiBUbzogcmVncmVzc2lvbnNAbGVlbWh1
aXMuaW5mbzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+Ow0KPiA+ID4gRXVnZW5lX0JvcmRl
bmtpcmNoZXJAc2VsaW5jLmNvbTsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGxp
bnV4cHBjLSBkZXZAbGlzdHMub3psYWJzLm9yZw0KPiA+ID4gQ2M6IGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnOyBiYWxiaUBrZXJuZWwub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogYnVnOiB1c2I6
IGdhZGdldDogRlNMX1VEQ19DT1JFIENvcnJ1cHRlZCByZXF1ZXN0IGxpc3QNCj4gPiA+IGxlYWRz
IHRvIHVucmVjb3ZlcmFibGUgbG9vcC4NCj4gPiA+DQo+ID4gPiBPbiBUdWUsIDIwMjEtMTEtMzAg
YXQgMTI6NTYgKzAxMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwg
MjAyMS0xMS0yOSBhdCAyMzo0OCArMDAwMCwgRXVnZW5lIEJvcmRlbmtpcmNoZXIgd3JvdGU6DQo+
ID4gPiA+ID4gQWdyZWVkLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gV2UgYXJlIGhhcHB5IHBpY2sg
dXAgdGhlIHRvcmNoIG9uIHRoaXMsIGJ1dCBJJ2QgbGlrZSB0byB0cnkgYW5kDQo+ID4gPiA+ID4g
aGVhciBmcm9tDQo+ID4gPiBKb2FraW0gZmlyc3QgYmVmb3JlIHdlIGRvLiAgVGhlIHBhdGNoIHNl
dCBpcyBoaXMsIHNvIEknZCBsaWtlIHRvDQo+ID4gPiBnaXZlIGhpbSB0aGUgb3Bwb3J0dW5pdHku
ICBJIHRoaW5rIGhlJ3MgdGhlIG9ubHkgb25lIHRoYXQgY2FuIGFkZCBhDQo+ID4gPiB0cnVseSBw
cm9wZXIgZGVzY3JpcHRpb24gYXMgd2VsbCBiZWNhdXNlIGhlIG1lbnRpb25lZCB0aGF0IHRoaXMN
Cj4gPiA+IGluY2x1ZGVzIGEgImZldyBtb3JlIGZpeGVzIiB0aGFuIGp1c3QgdGhlIG9uZSB3ZSBy
YW4gaW50by4gIEknZA0KPiA+ID4gcmF0aGVyIGhlYXIgZnJvbSBoaW0gdGhhbiB0cnkgdG8gcmV2
ZXJzZSBlbmdpbmVlciB3aGF0IHdhcyBiZWluZw0KPiBhZGRyZXNzZWQuDQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBKb2FraW0sIGlmIHlvdSBhcmUgc3RpbGwgd2F0Y2hpbmcgdGhlIHRocmVhZCwgd291
bGQgeW91IGxpa2UgdG8NCj4gPiA+ID4gPiB0YWtlIGEgc3RhYg0KPiA+ID4gYXQgaXQ/ICBJZiBJ
IGRvbid0IGhlYXIgZnJvbSB5b3UgaW4gYSBjb3VwbGUgZGF5cywgd2UnbGwgcGljayB1cCB0aGUN
Cj4gPiA+IHRvcmNoIGFuZCBkbyB3aGF0IHdlIGNhbi4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+
ID4gPiBJIGFtIGZhciBhd2F5IGZyb20gdGhpcyBub3cgYW5kIHN0aWxsIG9uIDQuMTkuIEkgZG9u
J3QgbWluZCBpZiB5b3UNCj4gPiA+ID4gdHdlYWsNCj4gPiA+IHR3ZWFrIHRoZSBwYXRjaGVzIGZv
ciBiZXR0ZXIgInVwc3RyZWFtYWJpbGl0eSINCj4gPiA+DQo+ID4gPiBFdmVuIGJldHRlciB3b3Vs
ZCBiZSB0byBtaWdyYXRlIHRvIHRoZSBjaGlwaWRlYSBkcml2ZXIsIEkgYW0gdG9sZA0KPiA+ID4g
anVzdCBhIGZldyB0d2Vha3MgYXJlIG5lZWRlZCBidXQgdGhpcyBpcyBwcm9iYWJseSBzb21ldGhp
bmcgTlhQDQo+ID4gPiBzaG91bGQgZG8gYXMgdGhleSBoYXZlIGFjY2VzcyB0byBvdGhlciBTT0Mn
cyB1c2luZyBjaGlwaWRlYS4NCj4gPg0KPiA+IEkgYWdyZWUgd2l0aCB0aGlzIGRpcmVjdGlvbiBi
dXQgdGhlIHByb2JsZW0gd2FzIHdpdGggYmFuZHdpZHRoLiAgQXMgdGhpcw0KPiBjb250cm9sbGVy
IHdhcyBvbmx5IHVzZWQgb24gbGVnYWN5IHBsYXRmb3JtcywgaXQgaXMgaGFyZGVyIHRvIGp1c3Rp
ZnkgbmV3IGVmZm9ydA0KPiBvbiBpdCBub3cuDQo+ID4NCj4gDQo+IExlZ2FjeT8gQWxsIFBQQyBp
cyBsZWdhY3kgYW5kIG5vdCBzdXBwb3J0ZWQgbm93Pw0KDQpJJ20gbm90IHNheWluZyB0aGF0IHRo
ZXkgYXJlIG5vdCBzdXBwb3J0ZWQsIGJ1dCB0aGV5IGFyZSBpbiBtYWludGVuYW5jZSBvbmx5IG1v
ZGUuDQoNClJlZ2FyZHMsDQpMZW8NCg==
