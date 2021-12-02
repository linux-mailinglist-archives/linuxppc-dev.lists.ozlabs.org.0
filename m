Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6D466D26
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 23:46:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4rfF15ntz3cDw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 09:46:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector2 header.b=TG1WHqfB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.244.58;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=TG1WHqfB; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4rdQ5GFjz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 09:45:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIvwvvX9StGnHqCxFcLQ2h8TNT38kvISEL+f6Zadkf6g2lgiriww86GrN3GIbR3eiKGLUnYLveZhMCMKbuoBSt0Q3RLahzr7bftnxjugddimMC8Gw6+pfBfy2LigZhGcW5p1AidYimE8OYb3gmEf9D+vnwqEmeG6mzmJAm+TaPFc+wd29r1uTN+R7NeBpR9rkHJFxTASqQKj5oWRY/IvWqFvjpx1N3kt9TsihVtk9cuD/lIIZ0FGkVQQdnbfckXCM+LkPgHL6oL9ZzFJl93JHBAYFnoai/HmRtlOMaQjpwXLobJoVBve0uMIaZQFI4Sb1DaMV2YxwP+S6Sy/twXE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+M7Nc51eAjGYbvKmtqbplyge1/ts1ZbkGSInuXj4F4=;
 b=lh/Dago9EAtxt3R4pq4rHCS/Tq8vqvDZ9pfZ7dr1BBm9lkMNJZh8Rj7fi4HbYq0myxPBz4Pi+8JuzUQIvu6bkgEPs9QfzJUqV0DShCOVfgvpTTcCOvlodMsfIh1BnYNn/M2SplOG3gX47YV3pryYbcucebzeATrfvREaGSEQ/loUUTJPNes2ztuzN5mbOi1vOtOdFpFW6yskpjqGVf+aaVOf4unOG56LaNYzlkLBDcao3P/pdhUsNZ/L8LSuGEDSltcgxp/hE+dU5m+k0aq5UB6ZMemrz2ZnlhJRQZe6UGCk1/JVkKLlmblPIkslYNm87HoXxaNXdtdTwXQi0AcViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+M7Nc51eAjGYbvKmtqbplyge1/ts1ZbkGSInuXj4F4=;
 b=TG1WHqfBI5iDouk2PXfp1HbG23he1OMLkM7/edNq/DVwFXAl+HOJmshYIWzgqHVwSAAxse/OgsGluGjYp3WdaAiPizeisEN7cNVt9Il/CKCJtqFugz53FylHkQa/DiV7lptHMeSF8Ey5rdVhDiWsAN4Qk/ojz8AlKKyyWoCNPkA=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB5848.namprd10.prod.outlook.com (2603:10b6:510:149::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 2 Dec
 2021 22:45:10 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::112e:1c94:4171:1db7]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::112e:1c94:4171:1db7%6]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 22:45:10 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "Eugene_Bordenkircher@selinc.com"
 <Eugene_Bordenkircher@selinc.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oACc0lYgABIbVXQAbnCUAAA0DL90AAM8XwQAABPhqAAGbtsgAA3RpcAAD9HUaAABKxzgA==
Date: Thu, 2 Dec 2021 22:45:10 +0000
Message-ID: <f31008a0f4e71ff029aa611b0ebcfd83f10ec67f.camel@infinera.com>
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
In-Reply-To: <AS8PR04MB894614C61E57A80EB4FF7C758F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bde9cd3-9b13-49cd-bc34-08d9b5e56586
x-ms-traffictypediagnostic: PH0PR10MB5848:
x-microsoft-antispam-prvs: <PH0PR10MB58481C6B7E34C6A6DBF16222F4699@PH0PR10MB5848.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cacqO/BXuyOYz/hdAyIEmcWwGy0bHtILDxyajBALomFREihGMHNmD1ba0DTQtOd27GZuEUWNL91FvYCde7k3T2lopCXSxU44f0j3PahqDHRg1LI2Mqp4p+cbXwAaVL/l68I3b3FJUY+941nDgDFZ3yb/6/OTgvZI2otRM32JFEPOAEkYBWNu2UN7CV3ynTFNqtcHL+9J7TVPz1gNSv7MgS1oZAK2PnK32mfMLdqobUyksnFy3sdcWSgzDKRRYmZgFH7JgdCCZyh+5Ias5XoqmashsGvrMPthYzE9YrDjQsTuCufYdH1C379CkR4hmLDHaHY05ektriU28Bn5MoAcU2Ul06ytsnXj3BdfFQvBaDvsQhVBLRKt+SdTtYD3hLHUHfKkyT+vuySvIju6EjpBkgGn+uwwPvtg34PWXZvmkp6gDgkjDQZ0kQLWQbXTwIr9COcegrLusrqD3M53A/z0RTfNp8nesZ9xpHA7skl4qLVVaqjExIkVV8vnvhlWOExyxPRNElugGqXyy6IRw2e0olMG6BywVbPinMUcKrsHo7DqlF313t8YDm+yZuJk0DjX6urgmsEkZvPBn4VlQXIN1cpRFB9hyQ/LBtItmxu3le4HfyIIUZyxnDZ1jg953HrKLRQfZQktSQOrLOyp9q8QGE3ST7RTnHAI77s99kwZ3SfZp3BPYt6Fb5tPtz+Qn7z2nEimb+evPH/G7YxLxYNOLw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(2906002)(4326008)(2616005)(316002)(122000001)(508600001)(5660300002)(6512007)(4001150100001)(86362001)(8676002)(36756003)(110136005)(54906003)(66476007)(26005)(38070700005)(83380400001)(38100700002)(76116006)(91956017)(6486002)(71200400001)(66446008)(66556008)(186003)(53546011)(64756008)(6506007)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWs2NS9KRDNHVjMwcE9pVGswQVJxamsrRFFPdHpGTitTTmJXbmhLY1ZrOGpQ?=
 =?utf-8?B?VXRYWWRsb21ob3QwSHJPeHlGeENMYlFlTS85RVdHcGVrT0hxbmUxZ2kyc1Vr?=
 =?utf-8?B?Yk1Tdjc0VDlsYlY3cW0ybTB2RmM5b1NXNHBSUmhPYnZCeGJCQVk4akFPU1VN?=
 =?utf-8?B?VnMweVBZd1lXQ3RFRUZ1clpKRTBuV0tHaEpmTmFhTW9yeS8wVW9RZU1EeHA0?=
 =?utf-8?B?bXhpVHcvMjIra3BDRHN1aXRNb2VYc1dvY096cVRNYURWbndpVm9sZCtmNytl?=
 =?utf-8?B?endCMnRud21NMjNVTzFVMGNEL25IbDF1bmRtbTAzVURBSVprWU5oNUZiYzFF?=
 =?utf-8?B?RFUzK1dQWTVmWkVPTGFEMU4xcE95emR3ZTdIcDh3dVM2WHFoRlh0OHhtTTNz?=
 =?utf-8?B?N2hRV2I5aUVGbE40dzBHSmtkV2xTQ0s1OFUvcmgwdTVxZ2lzeUZHbnkvMExt?=
 =?utf-8?B?L1N6SDRQdTZ5NjFJL04rYVlWamJZd2RsUmVYYkZVd2x4WXo3cjgyTkdVZGVz?=
 =?utf-8?B?YjkzQ0haTUxLUTVXZzVBNFNlbHU1MUhzYXVUcXBDaHdrTmJ3TXl4ZlNYajZ6?=
 =?utf-8?B?VlRkei8xZnBxSHA1anlUek1VSnhkWE50WHZ4MmMwWlg3ME9mTUEwdlZpZStX?=
 =?utf-8?B?Wi9PcWtLUDJsaWU4M2NjdlVSUWsvWG1lNUkwVW1YNDJ5b0F1NHAva2pMeVpE?=
 =?utf-8?B?VldrL3RBQ3RraW5YSTNXR0NFV1c0b3dEZjVEVkZCeEUwSDB5N0F6bjhCMTJa?=
 =?utf-8?B?bFVrR1BaZ3UrdHJiYmtpOXhhT3JMcS91ZWlyVm9WRGdhdDlQL2lUT0RRaURC?=
 =?utf-8?B?WmV1UGQyMGt5ZjVDQVNBNGs2RHFIUFdxVjZyMFpSQVU4ZW56YmNtS2JZL3BJ?=
 =?utf-8?B?TUJjSFE2TzRwZSs2aFE1UVBRMTIzWXVZN21FYUxKUUJ0MUdhZzg3citSK0gw?=
 =?utf-8?B?TGpqbFNJRjBjci8zRVQ5RFhsZmFLZ2pSV21LcXg1WDhsUjBENkxuR0FvR1ln?=
 =?utf-8?B?K2ptYUowa0lIdWE0MWlpbzZsT3M0VTdWU1h2ZTJBZFR6QTJNeWJtUFFzRmxM?=
 =?utf-8?B?L21KSVk4RlBRb0I2NXc2dnd2bjY3dXl4VFFPUk5qSzNISkhneFA0ZXVHcm9K?=
 =?utf-8?B?UjMzNzEvTjhTV0Q5c2t1MFVEb2dMWDVsczdnVzBybjBHN0JzdGxvaXFjTWRE?=
 =?utf-8?B?VG1xWCttQ0VtOHRYcldNWGprM1pOdHZlRXRRbTQ0eXpSWlJCM1hxMmRuT3JE?=
 =?utf-8?B?N1ZOV2JsRVlCODRycmxSTEUrejl6Qk5LeUhRVjRCa3lhNXBQRTVJVG5lbGFX?=
 =?utf-8?B?Rnp0c3gvbDBHTUdpTHJkLzBwU1d5cnBjSzR1U1FJakY0VWplMFpEdlZEdVZH?=
 =?utf-8?B?RUlnV0RxNDVjZi82Wmpld2JRdWxpYlZFNGRDY0JPUU9KUlY3dC9iU2xhWXFR?=
 =?utf-8?B?SnFWU2pEaFdaWkpKb09VUGZWU3o1QjVBQzQ4dmNqblQ4UEwxajkxOXVTSkdZ?=
 =?utf-8?B?S290dHhnaHp6NkNrZ3NYNllvR0d2eW1jV0pMbE41K29DVG10elI5bklhMk5Z?=
 =?utf-8?B?M3pVZ1JxdE5tRWkwUjNpQlJUb29DQWJUNTN5VVJrRnVGQjlFNG0rQVM1VXlB?=
 =?utf-8?B?aDZLSGtKTVFQNFNsNTVhakQwNGkyRWhDV3djR2l3TUZoVFVZUlp5dEJldmlq?=
 =?utf-8?B?Vk0xa3Y5U0lwaWd6SVBEbU03S3lkUi96T2o4aW55d1Q0UHpDN2cxL3VHbW5D?=
 =?utf-8?B?K2xKQUIzRFlob05OSGtrdG5SVnBhOWhYUXUwSFpRSWhJbXVlK211aU9hMk1F?=
 =?utf-8?B?ZTB0Zjh0Rnh5TVUxM05WZHF4N3FzS202MDRMdVVuM015YngvemFGdzVJdWFX?=
 =?utf-8?B?SXJWVlBZcU52ZnMyRDBzTVprMStGblRqT3VQOGxQeWoyR2pJV0VRUGhnWjNm?=
 =?utf-8?B?NEJWcHB2MFhtK01TWnd6WlQ4OHFrZG5lZ0h1cEtvM29OSUZJTzZFL2pTTmhZ?=
 =?utf-8?B?S0lvcUJBZG4zMkQ3dzBnbUFmZ2tXU01ZQzBGTjlyekFwNVVUWVlXdXhXRE0y?=
 =?utf-8?B?NFVBNTFOSktrQ2RUQXNmVmJFckZRZzhzUjdUUWVxUnZxTFpNUExod2FPcjFT?=
 =?utf-8?B?dk93d2I5bGVyL2J3SmpRbTU0dEM1aXFvbE0rbk5CSXROQWpTOEltOGxvVnZj?=
 =?utf-8?Q?WdTwkyjRiXI3pNyTIukHK+s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12CF3E68139AAD49A069D137FD0B0C62@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bde9cd3-9b13-49cd-bc34-08d9b5e56586
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 22:45:10.4415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTwV45uhT8efMBTo/2qoJQ0rt91ACqEl/9HWCAFcIF3FTXW+ccszP4Jy7S0P9uV0Eu5F8julTFE4XdKqQCND3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5848
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

T24gVGh1LCAyMDIxLTEyLTAyIGF0IDIwOjM1ICswMDAwLCBMZW8gTGkgd3JvdGU6DQo+IA0KPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSm9ha2ltIFRqZXJubHVuZCA8
Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQo+ID4gU2VudDogV2VkbmVzZGF5LCBEZWNl
bWJlciAxLCAyMDIxIDg6MTkgQU0NCj4gPiBUbzogcmVncmVzc2lvbnNAbGVlbWh1aXMuaW5mbzsg
TGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+Ow0KPiA+IEV1Z2VuZV9Cb3JkZW5raXJjaGVyQHNl
bGluYy5jb207IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4cHBjLQ0KPiA+IGRldkBs
aXN0cy5vemxhYnMub3JnDQo+ID4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBiYWxi
aUBrZXJuZWwub3JnDQo+ID4gU3ViamVjdDogUmU6IGJ1ZzogdXNiOiBnYWRnZXQ6IEZTTF9VRENf
Q09SRSBDb3JydXB0ZWQgcmVxdWVzdCBsaXN0IGxlYWRzIHRvDQo+ID4gdW5yZWNvdmVyYWJsZSBs
b29wLg0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAyMS0xMS0zMCBhdCAxMjo1NiArMDEwMCwgSm9ha2lt
IFRqZXJubHVuZCB3cm90ZToNCj4gPiA+IE9uIE1vbiwgMjAyMS0xMS0yOSBhdCAyMzo0OCArMDAw
MCwgRXVnZW5lIEJvcmRlbmtpcmNoZXIgd3JvdGU6DQo+ID4gPiA+IEFncmVlZCwNCj4gPiA+ID4g
DQo+ID4gPiA+IFdlIGFyZSBoYXBweSBwaWNrIHVwIHRoZSB0b3JjaCBvbiB0aGlzLCBidXQgSSdk
IGxpa2UgdG8gdHJ5IGFuZCBoZWFyIGZyb20NCj4gPiBKb2FraW0gZmlyc3QgYmVmb3JlIHdlIGRv
LiAgVGhlIHBhdGNoIHNldCBpcyBoaXMsIHNvIEknZCBsaWtlIHRvIGdpdmUgaGltIHRoZQ0KPiA+
IG9wcG9ydHVuaXR5LiAgSSB0aGluayBoZSdzIHRoZSBvbmx5IG9uZSB0aGF0IGNhbiBhZGQgYSB0
cnVseSBwcm9wZXIgZGVzY3JpcHRpb24NCj4gPiBhcyB3ZWxsIGJlY2F1c2UgaGUgbWVudGlvbmVk
IHRoYXQgdGhpcyBpbmNsdWRlcyBhICJmZXcgbW9yZSBmaXhlcyIgdGhhbiBqdXN0DQo+ID4gdGhl
IG9uZSB3ZSByYW4gaW50by4gIEknZCByYXRoZXIgaGVhciBmcm9tIGhpbSB0aGFuIHRyeSB0byBy
ZXZlcnNlIGVuZ2luZWVyDQo+ID4gd2hhdCB3YXMgYmVpbmcgYWRkcmVzc2VkLg0KPiA+ID4gPiAN
Cj4gPiA+ID4gSm9ha2ltLCBpZiB5b3UgYXJlIHN0aWxsIHdhdGNoaW5nIHRoZSB0aHJlYWQsIHdv
dWxkIHlvdSBsaWtlIHRvIHRha2UgYSBzdGFiDQo+ID4gYXQgaXQ/ICBJZiBJIGRvbid0IGhlYXIg
ZnJvbSB5b3UgaW4gYSBjb3VwbGUgZGF5cywgd2UnbGwgcGljayB1cCB0aGUgdG9yY2ggYW5kIGRv
DQo+ID4gd2hhdCB3ZSBjYW4uDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBJIGFtIGZhciBhd2F5
IGZyb20gdGhpcyBub3cgYW5kIHN0aWxsIG9uIDQuMTkuIEkgZG9uJ3QgbWluZCBpZiB5b3UgdHdl
YWsNCj4gPiB0d2VhayB0aGUgcGF0Y2hlcyBmb3IgYmV0dGVyICJ1cHN0cmVhbWFiaWxpdHkiDQo+
ID4gDQo+ID4gRXZlbiBiZXR0ZXIgd291bGQgYmUgdG8gbWlncmF0ZSB0byB0aGUgY2hpcGlkZWEg
ZHJpdmVyLCBJIGFtIHRvbGQganVzdCBhIGZldw0KPiA+IHR3ZWFrcyBhcmUgbmVlZGVkIGJ1dCB0
aGlzIGlzIHByb2JhYmx5IHNvbWV0aGluZyBOWFAgc2hvdWxkIGRvIGFzIHRoZXkNCj4gPiBoYXZl
IGFjY2VzcyB0byBvdGhlciBTT0MncyB1c2luZyBjaGlwaWRlYS4NCj4gDQo+IEkgYWdyZWUgd2l0
aCB0aGlzIGRpcmVjdGlvbiBidXQgdGhlIHByb2JsZW0gd2FzIHdpdGggYmFuZHdpZHRoLiAgQXMg
dGhpcyBjb250cm9sbGVyIHdhcyBvbmx5IHVzZWQgb24gbGVnYWN5IHBsYXRmb3JtcywgaXQgaXMg
aGFyZGVyIHRvIGp1c3RpZnkgbmV3IGVmZm9ydCBvbiBpdCBub3cuDQo+IA0KDQpMZWdhY3k/IEFs
bCBQUEMgaXMgbGVnYWN5IGFuZCBub3Qgc3VwcG9ydGVkIG5vdz8gDQoNCiAgSm9ja2UNCg==
