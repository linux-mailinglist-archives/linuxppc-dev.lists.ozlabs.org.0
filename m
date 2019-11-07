Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E98F29C7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 09:52:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477xxD4nRMzF6KV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 19:52:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.68; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="qiDxy/Db"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20068.outbound.protection.outlook.com [40.107.2.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477wXg1SCCzDrff
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 18:49:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vi/KBz4Qz2RrnpYz/cZKtYATD2tgOP9ztmSo66lJhR3hj78tgMdQzD4y1a5Duoz6SrvuddM1QPJ2rXIKjXCQ4zL34dLzMRIQWzr09M5JdMThblZElLPjTb4paODTkeeORqA15bZAP0LKCKgFdRZNjvKCB6zUfS6UP5VLIZnwfd0qHwMA1ph29nDGit8+q/Kzl2ZAx3eWSdIUffZz7OCwr5TRDHfXfRUl9NSGeEBW8NV4xX8A49ggeps1IMO9tOMdHyAJTYKzmGBuRUY7VF8Re1dgxlcd9493IzyMKxhlFhW27OYuaYZwXD7tfg6704c3PQI/2w1HSFWfPIA5etajnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDFmqqS6COuYQO74r3uSpZS1axn1dQue4H4BZuq6h8k=;
 b=UYMK3tY85zoC/GW692zYUh/j14YNWr9G6AluS+JNWRkIqIkjl7g1gWemeUk3/nJC6Nclt36h20zXNOqsz+x3iTCKY/u9jzUBHB2X7hTXr3kBCjG55qNZzJcpamivGQHo3P7DRJu5fA6vc843TMwRv96lKT1R265M1NuXfRVrTK8ORYhg3Yjlt8pzzG/T189ShdOb2A8fd+1RfPsic2z1C/+IYzAs7iT8wvAZO44JwMNvu1Q3bUtmpAAX3iHC8kPQcJgfwjsmmOBWU9TbFw3aCJYS8AKJ+e2IIRMnvvNQxgC8T3EWl4srVH/2YHort40rsadaqQJCPS26XOxXUphNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDFmqqS6COuYQO74r3uSpZS1axn1dQue4H4BZuq6h8k=;
 b=qiDxy/DbVb20O+zhmYB9Z1hh5kV0zHiwBAipOCoqRtPuzw6CY667NdikyfpgUtzY+U0pZfy0JSvFB2iK1Nn1u21W8xmNYIakI2JAXTxrhJLz5zNCArWN16W3KBP6GEIIeUwBEmobNVRbj9goE03GGRhMtcvrCld2HaRCqPwyMpQ=
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com (20.179.254.214) by
 AM0PR04MB6356.eurprd04.prod.outlook.com (10.255.182.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Thu, 7 Nov 2019 06:54:17 +0000
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::24aa:9d65:b376:5ae7]) by AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::24aa:9d65:b376:5ae7%7]) with mapi id 15.20.2430.020; Thu, 7 Nov 2019
 06:54:16 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
 tdms
Thread-Topic: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
 tdms
Thread-Index: AdWVOCo8/iuGnMlWR7WHQ55etboNNQ==
Date: Thu, 7 Nov 2019 06:54:16 +0000
Message-ID: <AM0PR04MB6468D4D15E471940B1906344E3780@AM0PR04MB6468.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34df17a9-71a3-46d7-ac14-08d7634f4ea8
x-ms-traffictypediagnostic: AM0PR04MB6356:
x-microsoft-antispam-prvs: <AM0PR04MB635696F8CBDD83797B2F0DAEE3780@AM0PR04MB6356.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(199004)(189003)(476003)(486006)(316002)(54906003)(86362001)(7696005)(53546011)(66476007)(186003)(6506007)(66446008)(64756008)(102836004)(26005)(66556008)(71200400001)(71190400001)(4326008)(66946007)(14444005)(2906002)(256004)(76116006)(3846002)(55016002)(25786009)(8676002)(33656002)(8936002)(6916009)(14454004)(305945005)(6116002)(7736002)(478600001)(229853002)(7416002)(5660300002)(66066001)(81156014)(99286004)(52536014)(74316002)(81166006)(6436002)(9686003)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6356;
 H:AM0PR04MB6468.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HUnltuQYoDaFtVZXYGzwCHhojhmjxDow0LoEyWCTEiIe+xwWk2MKUKRx+Cggu/IipiSiZ4Zqs5eYbej59VTgQOwgHiYAiHpVn+snUw7zVx0+kPiidPVXugfVXX/ybc1quaGqfMKKWAGrJ/nwPXp3mU/Cos9MlziAUFgmLNgP8WJ88P7c8Nyeq3iiFehI3gaHiftEctYfU9IHQlLV7EueE/H6B3R6bzm/q/RYIcwqx9Rk4VXsFh0UMoOC2xJHUdx4pnxfvHgwqKZ+bbuySoVY21+ftPrsy28LRkd2Cna5la6iAgQWzFa5pmf5av86ykNOr7EfjxUtM4yMCw20dOLy9Zl8AToZg2FefFIm0zLftxBULhtB+QZ0WEUj1cIcKwnIzwDiptUpVuwYOfypc84m4pDyAuMdsdRYT8aIguEu4t08vlEUyCxLt0md1sTj/sg3
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34df17a9-71a3-46d7-ac14-08d7634f4ea8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 06:54:16.7798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+6k7J4ZfSgpZOEcGAWQAc6WTLOOG1sS5Vsqo8E59JIK+SGl710jPRFl5AOCDYd1Bd6nOOCYO4faIC5JwqqbCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6356
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkNCj4gDQo+IEhpIFNoZW5naml1LA0KPiANCj4gQ29tbWVudHMgaW5saW5lLg0KPiANCj4gT24g
V2VkLCBOb3YgNiwgMjAxOSBhdCA5OjMwIEFNIFNoZW5naml1IFdhbmcgPHNoZW5naml1LndhbmdA
bnhwLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBBdWRtaXggc3VwcG9ydCB0d28gc3Vic3RyZWFt
LCBXaGVuIHR3byBzdWJzdHJlYW0gc3RhcnQgdG8gcnVuLCB0aGUNCj4gPiB0cmlnZ2VyIGZ1bmN0
aW9uIG1heSBiZSBjYWxsZWQgYnkgdHdvIHN1YnN0cmVhbSBpbiBzYW1lIHRpbWUsIHRoYXQgdGhl
DQo+ID4gcHJpdi0+dGRtcyBtYXkgYmUgdXBkYXRlZCB3cm9uZ2x5Lg0KPiA+DQo+ID4gVGhlIGV4
cGVjdGVkIHByaXYtPnRkbXMgaXMgMHgzLCBidXQgc29tZXRpbWVzIHRoZSByZXN1bHQgaXMgMHgy
LCBvcg0KPiA+IDB4MS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNoZW5naml1IFdhbmcgPHNo
ZW5naml1LndhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgc291bmQvc29jL2ZzbC9mc2xfYXVk
bWl4LmMgfCA2ICsrKysrKyAgc291bmQvc29jL2ZzbC9mc2xfYXVkbWl4LmggfCAxDQo+ID4gKw0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9mc2wvZnNsX2F1ZG1peC5jIGIvc291bmQvc29jL2ZzbC9mc2xfYXVkbWl4
LmMNCj4gPiBpbmRleCBjN2U0ZTk3NTdkY2UuLmExZGIxYmNlMzMwZiAxMDA2NDQNCj4gPiAtLS0g
YS9zb3VuZC9zb2MvZnNsL2ZzbF9hdWRtaXguYw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9mc2wvZnNs
X2F1ZG1peC5jDQo+ID4gQEAgLTI4Niw2ICsyODYsNyBAQCBzdGF0aWMgaW50IGZzbF9hdWRtaXhf
ZGFpX3RyaWdnZXIoc3RydWN0DQo+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sIGludCBj
bWQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzbmRfc29j
X2RhaSAqZGFpKSAgew0KPiA+ICAgICAgICAgc3RydWN0IGZzbF9hdWRtaXggKnByaXYgPSBzbmRf
c29jX2RhaV9nZXRfZHJ2ZGF0YShkYWkpOw0KPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBsb2Nr
X2ZsYWdzOw0KPiA+DQo+ID4gICAgICAgICAvKiBDYXB0dXJlIHN0cmVhbSBzaGFsbCBub3QgYmUg
aGFuZGxlZCAqLw0KPiA+ICAgICAgICAgaWYgKHN1YnN0cmVhbS0+c3RyZWFtID09IFNORFJWX1BD
TV9TVFJFQU1fQ0FQVFVSRSkNCj4gPiBAQCAtMjk1LDEyICsyOTYsMTYgQEAgc3RhdGljIGludCBm
c2xfYXVkbWl4X2RhaV90cmlnZ2VyKHN0cnVjdA0KPiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3Ry
ZWFtLCBpbnQgY21kLA0KPiA+ICAgICAgICAgY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9TVEFSVDoN
Cj4gPiAgICAgICAgIGNhc2UgU05EUlZfUENNX1RSSUdHRVJfUkVTVU1FOg0KPiA+ICAgICAgICAg
Y2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9QQVVTRV9SRUxFQVNFOg0KPiA+ICsgICAgICAgICAgICAg
ICBzcGluX2xvY2tfaXJxc2F2ZSgmcHJpdi0+bG9jaywgbG9ja19mbGFncyk7DQo+IA0KPiBXaHkg
ZG8gd2UgbmVlZCB0byBkaXNhYmxlIGludGVycnVwdHMgaGVyZT8gSSBhc3N1bWUgdGhhdCBsb2Nr
IGlzIG9ubHkNCj4gdXNlZCBpbiBwcm9jZXNzIGNvbnRleHQuDQo+IA0KSXQgaXMgaW4gYXRvbWlj
IGNvbnRleHQsIHNvIEkgdGhpbmsgaXQgaXMgb2sgdG8gZGlzYWJsZSBpbnRlcnJ1cHQuIA0KDQpC
ZXN0IHJlZ2FyZHMNCldhbmcgc2hlbmdqaXUNCg0K
