Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 950FD5E9E8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 12:03:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbdcy4Dh0z3c2d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 20:03:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lRdHpjLk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.47; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lRdHpjLk;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90047.outbound.protection.outlook.com [40.107.9.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbdcB6JnRz2x9C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 20:03:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRgJ/8xwGKc8QmF4XNsWteYoyksRWw143fvRj/M783IrsvTg6m8nLMna+iFBvRzwfMixUs/HdH+KI3J2vEcVwbxjvfbsMElj6zvGDXnF9lWYB9uu9AO1ENPUuhKOUuVhfgMFHI5glrGMAm4Yx37v38cFXgcsTZN6p3mu2H+JciztyHz7s9G3iCRukJrAZnojvSsJilpAP9wmwUaPmUg4qdCRCeq89Qv9pjwmnaxZyN+q0sDdX/TGmHUWJ8kKu6iQ7t5uu1YhJjboMDllPLsENV61mw0JvbbqeHjMkwD0ZDi/fcyrjyoTS8uinVLXzTONDi3aZc5/ZPLRDJuH62GRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUOPqsEwSfgmwsgcqV62l/CSZbIwqdxPdkohpFObAIY=;
 b=bQ5qgLJRZg1LWDt3UXBnQ5aa/fycoeugtqQgDZYRXEavyVcoh7bmlBBlldoaOxdABRRQKClRadJO3b7fWSDP17gSFNVuMHe31Hh07kWfZ0nmPIsQQljQwzojfCwiGmRqAS18HUrM1L1cLspAUBtKd5am1Ne/2KBjL8QEIjxB/u3egsw1bD5CPE1uf2o2D+tTi4mChR+xneKewLP0Vpfl1vm/AR8GvF99B5IAn7rgTPvYmR0zEWZjWnTCsmiITwacBk3M99mmJrgq5h77OFXvcn08+Jzz74Ebd8jlv5wcZUeqIR7tCfyHTq2KAmLnNT8zp16AtHxf233tzax/vOgMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUOPqsEwSfgmwsgcqV62l/CSZbIwqdxPdkohpFObAIY=;
 b=lRdHpjLkTo2CjqUR4FyxAfSLJJwWEAEPK0ORaHsmfcrdsFBFcuWSPzThdMo1Tnr+/HZPGv0YBEU2WUJbBlCecOag5Ul3lv2wb/kwXJoUAn/Gm06+nCSkhqxdScTL7LzSL2cEwq1oYs4tjuLeVFsr8sb1MTGi0CBar3DZAbI7Gn98RNqaAG4fWBuzgXwjb8EjRFxmY5s7dc5DRbCjVTOs64huNv+DIdKcVjvGP93aAYYrnkWeTxPt9SK02CJZj85IXs7U2WEs9sg/4cyFweyTUR7sAzkFlGOzxfSPms4bNs1Ox39Jt502su8HdeOvaoQFi3i8/RtBGiMpmFpMX0nT9A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Mon, 26 Sep
 2022 10:02:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 10:02:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>, Sinan Akman
	<sinan@writeme.com>
Subject: Re: [PATCH 5/7] powerpc/85xx: p2020: Define just one machine
 description
Thread-Topic: [PATCH 5/7] powerpc/85xx: p2020: Define just one machine
 description
Thread-Index: AQHYtABFGMx9yEOuWkKeujjLxmnOVq3xtkAA
Date: Mon, 26 Sep 2022 10:02:47 +0000
Message-ID: <638a2f98-5c23-85ba-c835-bce276312182@csgroup.eu>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-6-pali@kernel.org>
In-Reply-To: <20220819191557.28116-6-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2002:EE_
x-ms-office365-filtering-correlation-id: d908a8d7-a391-44ba-4cbc-08da9fa6437e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZS1SkhNAeecz9C7ywXQYpLFWapGLXl5kjyJuyShVCK0FG/dcXQ0ehpP0E9p80o8w9EDASDGyOB6XSMZ3oTHAP3PzgUCu9BQW4CvlC33F4hsJnW9CndONlyZ911ro9OiPslcvb/AW8qg8nJgYN5GP/pj+1KOtnqqYSQXRPiJaHs/GZhBkqi4bpw0VI9TGafdUA8J3cUdVQ3bbv4KPXjw2xxtAVzGrMi5cG4yTNXsYG+1sPd071qDoKgBS2OkvOLOCkmmmrFUPuuo+C0L/qaQ7WBSueF0ECoMj8CNdeyQPB/glU/ino2Iwo6e6fih3Cx1KXkBrFkLu5r+hDtR2kF5kmGLz8CZ6639PFjFRn4Xed3jov1W6xf4QbXicG3e4/ECqJc6K3cFoPLMoYTXm4JgyHFvXTwwAQoUK5WdysKEu8azf1IyaS9Khn30HI5AEQxDh/LEjFT6WGBbXQktYLZNDD3Bezvs3oEu84Im+pk9Q9wgPyotDzzwcU7sdcouDbtFpbj4ZOtcyMD2umR3IB+nMB6QC22OkfR92Xx9YMuf0TYu5NUyp0WaGkl+xAlDv1Q1FU7chsfUzOxWJtS7VNK9QxxmO6P/UsI1tvWnczsNQvSm6felbobxh3uZUjzTT9I8JnDGeiYjN9nZZHqE2thP6XOQfm065zyWLixnZHvySU3yjoyVgN2kgBvX3M8FZam4aim55kL2NwoS4afdDrhqyA///7AfnTDdFukthj76DU4ExW2VbMpbqQlTkpiBar/BP36bifWeEOKOsLnEuf1sfJhTcV51sIAy9luiVdznsT/779XT8Y65b5hLAhADraTqLSdb1LXD8d89v5W2cgWcLzKXbdnkFuxhFmVnhi7Cw3go=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39850400004)(136003)(451199015)(2906002)(2616005)(36756003)(186003)(41300700001)(5660300002)(6512007)(44832011)(26005)(8936002)(6506007)(38100700002)(122000001)(31696002)(86362001)(38070700005)(83380400001)(54906003)(6486002)(110136005)(71200400001)(478600001)(316002)(91956017)(31686004)(76116006)(4326008)(66556008)(66476007)(66446008)(64756008)(66946007)(8676002)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OWtFVDh2RWg5c2tZdmhZMG55N2d0WGtWeTgyK1lNZTc2a3M3SWliNHh0cUE4?=
 =?utf-8?B?OEhMK1FtWktDelBoamJ6YVhGaWFZeU9sMm1xclZaYlQyUWZVVjVNNG42dFJz?=
 =?utf-8?B?YTU1Z0FUeFJZc2c4eUU2SmNGSDNMN3ZFV0N6RWxVTG5xWndvZms2dXZna0Jh?=
 =?utf-8?B?KzFuNk1MUUFaTmJLa3ZvbCtuNWVRampxQTNReXRqTXFPaHdFdExNckRzc3Bk?=
 =?utf-8?B?Z1lYMEpsdjEzcVhWMHhZQjVZdGlQRFpGdVExY1ZZMnIreW9ndFQydGNBdkJ4?=
 =?utf-8?B?b0kvVWlZa2Rxc016MExqV1dHTEY0RDFCSkpETlArYVlIMUtEYk9SVTBJaHVM?=
 =?utf-8?B?Ym1CMDlWV3g0eGZJR0JCMG9ZWjY1SHFSUmhyS3VsR3dGU2RBSmN6RDJGdXR3?=
 =?utf-8?B?TW5JbnR3M1RVUkZxUXZPN2MxTnFIVm5CMy9CQUpNdmQzWkdHdFkvVnhiTUxM?=
 =?utf-8?B?LytxWlBKUDJ5SFJmMGZPbzB6bFl3QUVpRVlHM3Yxd29MYjZOYzZNeDV6aWxr?=
 =?utf-8?B?VHdoWWc4dkpqUTdnVzlEZTU0WGhkSytidGZkZjZOWGN4aGZheTlabHEvTkxC?=
 =?utf-8?B?UG1Bb1BXNVMxdmZoUkZHZWYyck81S2N1Y2o1Ui9WZE1oQkx1c0xvRUMyUGhh?=
 =?utf-8?B?M3B0eVVsNFo1a0g4ME1PZ00vaHFkbm9ESDdZRnY2cGorbzVVdHdFUGQvcDZT?=
 =?utf-8?B?dDA2SUtHMUFVa1ZWdUt0U0ZwWWxFSWN4WThpdllYZWFSR3hSRStEZmp0V1Qw?=
 =?utf-8?B?UTlIZ2YyRktoTzZIbkZNZEJKaitNWXZnRDFCWWxZRmFSVzJJZmlnMDl2WUcx?=
 =?utf-8?B?cHpDWEVDMll5OVM5Y01UajFNMlYzOUVZVWF1VFBPcHhrRmJLdDZLUlJJM2ZK?=
 =?utf-8?B?dW5GeDE0dGFsMy95MHF2M3ZBUGswTmV5QnpiN05JdHFKUy9ZYnNTSGpRekhN?=
 =?utf-8?B?ZmZTVFRVbEZPVFpndVdPSUJ3LzNPd3BwQmlaeDUxVTU3Ujh6L2dGc011dGR5?=
 =?utf-8?B?dFZQTUtWRkJqTFI5UDJuUm1JaTFrV05MUk9pd0RZbHVIdlFYUUtaSFdiWVNY?=
 =?utf-8?B?cFhmcVdtSU5NRmE4cXdndjdWQ1NNVWJpNWdmU1FjeVAwaVZBQ0g2NzVoUlJY?=
 =?utf-8?B?R3A2ZmFNL2dXeS84eXZlaTA1Um11Y2lHWGdZY1ZvZzc3RjdTaVZYVnQ2dnZr?=
 =?utf-8?B?OVpPcWN4d2F1L29wdlBiM2taNENwQXJpWjVnQ011TjdIM0t0dTluejZaNXBw?=
 =?utf-8?B?WklDdVlVV08rdUd4d0pvNkRQT2d5NkFnbFVGM0doT1dvQjZ0TmZEaTVkRnhi?=
 =?utf-8?B?MUtGOURUYm5zQVRzd0EybmkwZnBNcVNjTUZLck9SWTZLZmkxSUl5MFVXbWox?=
 =?utf-8?B?MHUvd1NVUVM1N2F0Y2o5dDkrbUV3RFphRnpzanYrODd0K2VTckR1TTAybmNZ?=
 =?utf-8?B?c2FtdXlnQUtEVEF6Z2RHWDQyUjVscjZVVXNjSlYzaFpxeVkzamdOWjcwbFoy?=
 =?utf-8?B?VGpFSlZUbWZRWUY5NUJnUFJGaFA0bEtFRXZtVXpLV3U2eTNFZm5FTTZETTJ3?=
 =?utf-8?B?TVM1UGp2V3lTUndRcjVFQXA3ZVFnc3BTbVBpMzlTMGZFeG5YUVpxZ05sTVk5?=
 =?utf-8?B?T21OYnVoa25tc1JsTXVKNlZ2VUoybXlRL09uaHFrL0k0ckZoTTFiZmJta0tJ?=
 =?utf-8?B?eGlaRk81ZUhUay9zMnVKcGI4STRyb2VreUE3ODVkeGRNWFlmY3R1c1V2RXV1?=
 =?utf-8?B?NC8vRWxyUVFSY0F1Q29kRjYwcnFyb2E3WmlaYnBjQnVaWTlGVm9kVG1HcjdF?=
 =?utf-8?B?TklVYlR4WGErRXozRmtVNWpxK1BJRnhzY2dneTZ3amFLeFBXVExrNFNRMTZS?=
 =?utf-8?B?RXV0NFFSZGRkaGlkZ0VHMVpxOEZ4am9QSDFhK21tQ2E1WmI2ZGhFeWdXWVd6?=
 =?utf-8?B?aXh2MFVpaWR3NlhsYkRGSWxySmRuZnFQSEV6N205dFVJNnQ5WFNhTFZZNkJX?=
 =?utf-8?B?VUxod2YvRWYrUzVuVCtYM2JjaXAvRjhJUllsZHFuL2hJcmlld2pPNjhsVExO?=
 =?utf-8?B?eHljaGlTOEcrYm91SW9SSWhZbEVhMDZXM09wd0lBQ29rWVdNcnBXS1M0akF3?=
 =?utf-8?B?WUtiSGtBc0NCbitxZzJ6VEl5NFNvNXNEUFBPbnEwdmNucEN6QkhDdmZkbDZj?=
 =?utf-8?Q?C1ve4mEoeEnayp8arDFn4Gc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5F300ED91C71947A4723F00355D40BC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d908a8d7-a391-44ba-4cbc-08da9fa6437e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 10:02:47.1459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/B8n7aEI1y1VsZd1eMKBNAz6VfcX6NVxJypTqWeWXkSyluxaTgcu3ar44yP9IiBtJeg1fXWEZFdDsBhC/4MXVXST1epPupfaHcWk6akm2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2002
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA4LzIwMjIgw6AgMjE6MTUsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IENv
bWJpbmUgbWFjaGluZSBkZXNjcmlwdGlvbnMgYW5kIGNvZGUgb2YgYWxsIFAyMDIwIGJvYXJkcyBp
bnRvIGp1c3Qgb25lDQo+IGdlbmVyaWMgdW5pZmllZCBQMjAyMCBtYWNoaW5lIGRlc2NyaXB0aW9u
LiBUaGlzIGFsbG93cyBrZXJuZWwgdG8gYm9vdCBvbg0KPiBhbnkgUDIwMjAtYmFzZWQgYm9hcmQg
d2l0aCBQMjAyMCBEVFMgZmlsZSB3aXRob3V0IG5lZWQgdG8gcGF0Y2gga2VybmVsIGFuZA0KPiBk
ZWZpbmUgYSBuZXcgbWFjaGluZSBkZXNjcmlwdGlvbiBpbiA4NXh4IHBvd2VycGMgcGxhdGZvcm0g
ZGlyZWN0b3J5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVs
Lm9yZz4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3AyMDIwLmMgfCA4
MyArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCA2NCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzg1eHgvcDIwMjAuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4
eC9wMjAyMC5jDQo+IGluZGV4IGQzMjdlNmM5YjgzOC4uMWEzZmZlYjQ3ZGZjIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvcDIwMjAuYw0KPiArKysgYi9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzg1eHgvcDIwMjAuYw0KPiBAQCAtMTU0LDgzICsxNTQsMzggQEAgc3Rh
dGljIHZvaWQgX19pbml0IHAyMDIwX3NldHVwX2FyY2godm9pZCkNCj4gICAjZW5kaWYNCj4gICB9
DQo+ICAgDQo+IC0jaWZkZWYgQ09ORklHX01QQzg1eHhfRFMNCj4gLW1hY2hpbmVfYXJjaF9pbml0
Y2FsbChwMjAyMF9kcywgbXBjODV4eF9jb21tb25fcHVibGlzaF9kZXZpY2VzKTsNCj4gLSNlbmRp
ZiAvKiBDT05GSUdfTVBDODV4eF9EUyAqLw0KPiAtDQo+IC0jaWZkZWYgQ09ORklHX01QQzg1eHhf
UkRCDQo+IC1tYWNoaW5lX2FyY2hfaW5pdGNhbGwocDIwMjBfcmRiLCBtcGM4NXh4X2NvbW1vbl9w
dWJsaXNoX2RldmljZXMpOw0KPiAtbWFjaGluZV9hcmNoX2luaXRjYWxsKHAyMDIwX3JkYl9wYywg
bXBjODV4eF9jb21tb25fcHVibGlzaF9kZXZpY2VzKTsNCj4gLSNlbmRpZiAvKiBDT05GSUdfTVBD
ODV4eF9SREIgKi8NCj4gK21hY2hpbmVfYXJjaF9pbml0Y2FsbChwMjAyMCwgbXBjODV4eF9jb21t
b25fcHVibGlzaF9kZXZpY2VzKTsNCj4gICANCj4gICAvKg0KPiAgICAqIENhbGxlZCB2ZXJ5IGVh
cmx5LCBkZXZpY2UtdHJlZSBpc24ndCB1bmZsYXR0ZW5lZA0KPiAgICAqLw0KPiAtI2lmZGVmIENP
TkZJR19NUEM4NXh4X0RTDQo+IC1zdGF0aWMgaW50IF9faW5pdCBwMjAyMF9kc19wcm9iZSh2b2lk
KQ0KPiAtew0KPiAtCXJldHVybiAhIW9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgiZnNsLFAyMDIw
RFMiKTsNCj4gLX0NCj4gLSNlbmRpZiAvKiBDT05GSUdfTVBDODV4eF9EUyAqLw0KPiAtDQo+IC0j
aWZkZWYgQ09ORklHX01QQzg1eHhfUkRCDQo+IC1zdGF0aWMgaW50IF9faW5pdCBwMjAyMF9yZGJf
cHJvYmUodm9pZCkNCj4gLXsNCj4gLQlpZiAob2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJmc2ws
UDIwMjBSREIiKSkNCj4gLQkJcmV0dXJuIDE7DQo+IC0JcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4g
LXN0YXRpYyBpbnQgX19pbml0IHAyMDIwX3JkYl9wY19wcm9iZSh2b2lkKQ0KPiArc3RhdGljIGlu
dCBfX2luaXQgcDIwMjBfcHJvYmUodm9pZCkNCj4gICB7DQo+IC0JaWYgKG9mX21hY2hpbmVfaXNf
Y29tcGF0aWJsZSgiZnNsLFAyMDIwUkRCLVBDIikpDQo+IC0JCXJldHVybiAxOw0KPiAtCXJldHVy
biAwOw0KPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcDIwMjBfY3B1Ow0KPiArDQo+ICsJLyoNCj4g
KwkgKiBUaGVyZSBpcyBubyBjb21tb24gY29tcGF0aWJsZSBzdHJpbmcgZm9yIGFsbCBQMjAyMCBi
b2FyZHMuDQo+ICsJICogVGhlIG9ubHkgY29tbW9uIHRoaW5nIGlzICJQb3dlclBDLFAyMDIwQDAi
IGNwdSBub2RlLg0KPiArCSAqIFNvIGNoZWNrIGZvciBQMjAyMCBib2FyZCB2aWEgdGhpcyBjcHUg
bm9kZS4NCj4gKwkgKi8NCj4gKwlwMjAyMF9jcHUgPSBvZl9maW5kX25vZGVfYnlfcGF0aCgiL2Nw
dXMvUG93ZXJQQyxQMjAyMEAwIik7DQo+ICsJaWYgKCFwMjAyMF9jcHUpDQo+ICsJCXJldHVybiAw
Ow0KDQpUaGlzIGxvb2tzIG9kZC4gSSB0aG91Z2ggYWxsIHByb2JlIHdlcmUgdXNpbmcgdGhlIGNv
bXBhdGlibGUsIGFuZCBpbiANCmZhY3QgSSBoYXZlIGEgc2VyaWVzIGluIHByZXBhcmF0aW9uIHRo
YXQgZHJvcHMgYWxsIA0Kb2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCkgY2hlY2tzIGluIHByb2Jl
IGZ1bmN0aW9ucyBhbmQgZG8gaXQgaW4gdGhlIA0KY2FsbGVyIGluc3RlYWQsIGFmdGVyIGFkZGlu
ZyBhIC5jb21wYXRpYmxlIHN0cmluZyBpbiB0aGUgbWFjaGluZSANCmRlc2NyaXB0aW9uLg0KDQpJ
cyB0aGVyZSByZWFsbHkgbm8gY29tcGF0aWJsZSB0aGF0IGNhbiBiZSB1c2VkIGZvciBhbGwgcDIw
MjAgPw0KDQo+ICsNCj4gKwlvZl9ub2RlX3B1dChwMjAyMF9jcHUpOw0KPiArCXJldHVybiAxOw0K
PiAgIH0NCj4gLSNlbmRpZiAvKiBDT05GSUdfTVBDODV4eF9SREIgKi8NCj4gLQ0KPiAtI2lmZGVm
IENPTkZJR19NUEM4NXh4X0RTDQo+IC1kZWZpbmVfbWFjaGluZShwMjAyMF9kcykgew0KPiAtCS5u
YW1lCQkJPSAiUDIwMjAgRFMiLA0KPiAtCS5wcm9iZQkJCT0gcDIwMjBfZHNfcHJvYmUsDQo+IC0J
LnNldHVwX2FyY2gJCT0gcDIwMjBfc2V0dXBfYXJjaCwNCj4gLQkuaW5pdF9JUlEJCT0gcDIwMjBf
cGljX2luaXQsDQo+IC0jaWZkZWYgQ09ORklHX1BDSQ0KPiAtCS5wY2liaW9zX2ZpeHVwX2J1cwk9
IGZzbF9wY2liaW9zX2ZpeHVwX2J1cywNCj4gLQkucGNpYmlvc19maXh1cF9waGIgICAgICA9IGZz
bF9wY2liaW9zX2ZpeHVwX3BoYiwNCj4gLSNlbmRpZg0KPiAtCS5nZXRfaXJxCQk9IG1waWNfZ2V0
X2lycSwNCj4gLQkuY2FsaWJyYXRlX2RlY3IJCT0gZ2VuZXJpY19jYWxpYnJhdGVfZGVjciwNCj4g
LQkucHJvZ3Jlc3MJCT0gdWRiZ19wcm9ncmVzcywNCj4gLX07DQo+IC0jZW5kaWYgLyogQ09ORklH
X01QQzg1eHhfRFMgKi8NCj4gLQ0KPiAtI2lmZGVmIENPTkZJR19NUEM4NXh4X1JEQg0KPiAtZGVm
aW5lX21hY2hpbmUocDIwMjBfcmRiKSB7DQo+IC0JLm5hbWUJCQk9ICJQMjAyMCBSREIiLA0KPiAt
CS5wcm9iZQkJCT0gcDIwMjBfcmRiX3Byb2JlLA0KPiAtCS5zZXR1cF9hcmNoCQk9IHAyMDIwX3Nl
dHVwX2FyY2gsDQo+IC0JLmluaXRfSVJRCQk9IHAyMDIwX3BpY19pbml0LA0KPiAtI2lmZGVmIENP
TkZJR19QQ0kNCj4gLQkucGNpYmlvc19maXh1cF9idXMJPSBmc2xfcGNpYmlvc19maXh1cF9idXMs
DQo+IC0JLnBjaWJpb3NfZml4dXBfcGhiICAgICAgPSBmc2xfcGNpYmlvc19maXh1cF9waGIsDQo+
IC0jZW5kaWYNCj4gLQkuZ2V0X2lycQkJPSBtcGljX2dldF9pcnEsDQo+IC0JLmNhbGlicmF0ZV9k
ZWNyCQk9IGdlbmVyaWNfY2FsaWJyYXRlX2RlY3IsDQo+IC0JLnByb2dyZXNzCQk9IHVkYmdfcHJv
Z3Jlc3MsDQo+IC19Ow0KPiAgIA0KPiAtZGVmaW5lX21hY2hpbmUocDIwMjBfcmRiX3BjKSB7DQo+
IC0JLm5hbWUJCQk9ICJQMjAyMFJEQi1QQyIsDQo+IC0JLnByb2JlCQkJPSBwMjAyMF9yZGJfcGNf
cHJvYmUsDQo+ICtkZWZpbmVfbWFjaGluZShwMjAyMCkgew0KPiArCS5uYW1lCQkJPSAiRnJlZXNj
YWxlIFAyMDIwIiwNCj4gKwkucHJvYmUJCQk9IHAyMDIwX3Byb2JlLA0KPiAgIAkuc2V0dXBfYXJj
aAkJPSBwMjAyMF9zZXR1cF9hcmNoLA0KPiAgIAkuaW5pdF9JUlEJCT0gcDIwMjBfcGljX2luaXQs
DQo+ICAgI2lmZGVmIENPTkZJR19QQ0kNCj4gICAJLnBjaWJpb3NfZml4dXBfYnVzCT0gZnNsX3Bj
aWJpb3NfZml4dXBfYnVzLA0KPiAtCS5wY2liaW9zX2ZpeHVwX3BoYiAgICAgID0gZnNsX3BjaWJp
b3NfZml4dXBfcGhiLA0KPiArCS5wY2liaW9zX2ZpeHVwX3BoYgk9IGZzbF9wY2liaW9zX2ZpeHVw
X3BoYiwNCj4gICAjZW5kaWYNCj4gICAJLmdldF9pcnEJCT0gbXBpY19nZXRfaXJxLA0KPiAgIAku
Y2FsaWJyYXRlX2RlY3IJCT0gZ2VuZXJpY19jYWxpYnJhdGVfZGVjciwNCj4gICAJLnByb2dyZXNz
CQk9IHVkYmdfcHJvZ3Jlc3MsDQo+ICAgfTsNCj4gLSNlbmRpZiAvKiBDT05GSUdfTVBDODV4eF9S
REIgKi8=
