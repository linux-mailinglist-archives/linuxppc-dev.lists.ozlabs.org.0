Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1090283BF2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 11:43:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=k/+LJO1N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLHTx5Pgbz3cSd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 21:43:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=k/+LJO1N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLHT53snMz3020
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 21:42:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fClvVmtsB/JfzVtz0b6CbzRcIM3J731oLfltgwFWXvvKF7X5LfU3KDFJyt2oKhsMrQdeUTk4QJGURPtmIBC2mRtiYHyhUaWV6NgJZK5JU3bsE+oOB+dRORkgxgVbjXyAthNbNY4faLSIBG0X4AXrxfXrCdaXP6cLWW68XqrpK+1tA5D2V26EaKLX4gl8HJQMfGBiEmm9HOLzfR+hSOsncN7crwdH5oKFTOV6Nm0vGGVP85d+4z8QkLxczcM79FgfX5HxBJt69wA4gTND+Mhl78odOZWxrQGFpdrygbrsfydK4uHxkXVKE67Nncb66w38gyXbp+3AkMjxG9/Z9rXTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAFhSsazWfn8SAXeABWl56exsHQ4M00CWWHOc41M0/8=;
 b=de0ryIx+EMxvKPYahZAp8c9O5JsI0NneYra1VsrAwMc+KI8+CKWvbkdRmEeh4qqRQxsZN6ZEEkOUC/RBlkaqxf0cXyKLRFo3Y8EX8W3IYc2tFC9FKn8vsq2+3xItHoKFPE9J0GI6Hz3eP7emQGNq4dMiXTElmMOfazcpNlnN5x4LjPmxGJ+T6p2X9qMpSyUBX3nFmh8aByF1H2B15dLevBE9Sg/bdT/mc2EDUJ+0TSziG/LhK9OsI9rNYW7eigb83chgjcJe/hoX4ez1AsnpQ3OwyUl1oUyJRKFXEKjlimuXstATDVZVEFvQC28PBglNa9HCodCdLrbGfqIHgFcC/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAFhSsazWfn8SAXeABWl56exsHQ4M00CWWHOc41M0/8=;
 b=k/+LJO1N/3TRM7kLpnJ16w9Kt/wKGRoGHJzToKWkSwBzTdnISbQIKBC4xvKckpZ6PUY4fY71AsUQSFH/xRtLyas3X2WB06o76ZKtnLHFDjWgADp2+ijnsvxU0vOk29W4NxTUN6tjlA3RO8MJJkTIOPNOo5z9FyT4g9b8cjCIPvcPfefi9eA502+yiBHPixLoLGiyeXeagbEuMFgG0D875DUc2oRKn9Xw80mJBZ9tyHHnLtVP7tNA3RqxQKNAr/dR8nlAUVdCkh9gljjihQbUhhDKwVHxXfiE03E+So2tVRgxWN5njXGkXHHtpr+Y8fz+5+xOlp2M+BKO+gS5hZwqnQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3467.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:160::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 10:41:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 10:41:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kunwu Chan <chentao@kylinos.cn>, "jk@ozlabs.org" <jk@ozlabs.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "naveen.n.rao@linux.ibm.com"
	<naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/cell: Code cleanup for spufs_mfc_flush
Thread-Topic: [PATCH] powerpc/cell: Code cleanup for spufs_mfc_flush
Thread-Index: AQHaT3aHrCGsYhKDzUGaqm70sS1WurDqV04A
Date: Thu, 25 Jan 2024 10:41:56 +0000
Message-ID: <c34968b8-f6bf-4ee1-8767-ef463637d866@csgroup.eu>
References: <20240125100854.540964-1-chentao@kylinos.cn>
In-Reply-To: <20240125100854.540964-1-chentao@kylinos.cn>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3467:EE_
x-ms-office365-filtering-correlation-id: 392d95c8-6a14-4189-7687-08dc1d9240c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0lKzu2ZM0AyXcbjfZB5BgjSthQpsW72Zm0eRBmktbhnHRQ2Z8+tcwNjt4gG/dyHwGMYZmvSNqwAYfRkpYvoJGigEx4kSmt8v7CQrI8w+1ZZIZ2bjVp+Nh750U0uOwREoStGUakvErOdiFPaSTBkQIN5hahXevr3GjKTm0TRvtJDkDa6lhfASLgviI4ZgbQ/eDoXgc+e0nRBH4lj+khCtowd6RcYzbGbpqQ3c+RmnmQqgzgDgOx1cXsmEjFVSeqVmV6BlyEI9pn27NNVuRmpvX6hoNCzh8zqHH43+XuFj8UDotNrThtN77gqU0Q/WHPXvOB6bsav/+f6n5c+1qZxgxRQjCzFIaAKCU3I1aO84nPMg9uimhqjDYkMyqc2TAt0CE2lhPDuAbNU9NQ6WXI/dqDjKCiUIqgm7EfVvzGk5HlH6QKvkUf5skS42GAjRQvrsZsyo1jYHBGMsR/bqyzQ4HVocyLhDRCv2mPBoLq8x4PYFLWx+huG9I8gPwxdb9e+RtPMRNYqFU4ll36ERoGLLDbcBkwriIxF7mxQUWvJeiWEyDZYbJ1u5XVPdB2N021EuWyL8allfC9Nq8anVNRG2imvLV4eCma4xli5C10OgpCVhg5becKbhImVxlcn1jXIO7qau/8PMRdeVsXTcP5Wwej+6d33RMKruKKHBCNGdrVJyYGivmLq/MFYSOv76dykn
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(366004)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(41300700001)(83380400001)(91956017)(36756003)(31696002)(86362001)(38070700009)(122000001)(66574015)(2616005)(26005)(38100700002)(6512007)(6486002)(6506007)(2906002)(8936002)(478600001)(76116006)(66946007)(110136005)(316002)(71200400001)(66556008)(66476007)(66446008)(64756008)(54906003)(44832011)(4326008)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dlcrdEhGODgxNUMwUnZINnJlNWRWRTRkblZNUDZSdXJtUkdtQWt3d0tJUW1X?=
 =?utf-8?B?Z3BnUVpTRS9icVZMQURjRmhSckJMbStiZy9RRmI0RHlKb2JITVYxYklpVlRH?=
 =?utf-8?B?SWMrYXJsMnVtYTZFVzZISWxIdXJKMjhZUzl4YnFjRk9ENXh1VmVFbzJvQkM5?=
 =?utf-8?B?ZzBQUU9aMzIrL3VjVjBORGhFQzl1RGkzcmNzcW9pL1VIM3hnK2MrMEVTejRh?=
 =?utf-8?B?ZTVzMi83diswSHdtdktReE9KaE1KbFI2U3Y3a0tqRjkreFhMMUVMcEpFZkJJ?=
 =?utf-8?B?SmNVVHlrNll3dVZFTWJDSmhpcTlrQ1lIbFl2UFNQOFRHMys0a082eVN4YTdX?=
 =?utf-8?B?MGltL3RZeGRURHo0eGZXckp2d2x1OVZySTloOVJHUm9tUFBDNFJET2RJb3ln?=
 =?utf-8?B?SEt6VGh6eFllemozUUlIcDZXYjVjMTVaODk4S0p5MXRuK2w2ODhLVEJsejhQ?=
 =?utf-8?B?RDZDQTVRK1NOTHJSdS9ZcE1DZm9NZmwxd3pBTWhRSnVFaG9BZnB5bFJYbXht?=
 =?utf-8?B?MGJDVDRramZqdEJaZi9SQlAvL3pmRE5mMmZPajRUbVFCdnFRNGUwN3ZwSkxC?=
 =?utf-8?B?OHI5cDhHZVFKWHExcjJrR2VHZWNzZC8ralNLeDlGeHFlaXRlWXQ3M1ROMDZS?=
 =?utf-8?B?S0o3RnAwcHAySFk5RzFjZHYwdmZVSTZoK0VaNnNMdHBaZDNWQlQ4SWRNVzk5?=
 =?utf-8?B?OGNwZHhQUjcwQkxWV1FnVDNCZzVGQjFObFNzR3FxcjlrelQwQUJTcktTZi9X?=
 =?utf-8?B?VU5CRVY5SXJMM0gxMXpyN1ZVcm9FR3hrVHMxZHF3c3E0T1Z5UHpNOFpwT0Za?=
 =?utf-8?B?QVVaM1IxTm1uK29ZK1BHZkZrVW9uTGhTQlF1NmxOQkdnNFlaOWVJVVp5YU9o?=
 =?utf-8?B?NDlOUm9VVERSV083bEZWWUZhYlJWOStwaXF0WXQxekxnV0NvRzNxMEJuemx1?=
 =?utf-8?B?R0N6OXFQTjJ5cEpFK0lDTm8zZ1Jjay85SW9GeXFzTWN0Y3ZNdHRzR0Jma3RF?=
 =?utf-8?B?QnY4L3UwSmpzYWt2SEk4Ylg2V0wxdXBvUXBLaUR2VDNheDNKUzM3YWJwNWVZ?=
 =?utf-8?B?Y3hiTWljNlAvaEdtMG5RSkJMR2hkS2JIMVJZenY4NGl5VzNMV3B2VzNWZ0tL?=
 =?utf-8?B?dUNVTG5KWEUzOEl2Ky8vNVdXZG5kbXFTTmlvaUU5azUvN2ZmOG1FL3lkOFVW?=
 =?utf-8?B?aEY4NmxsMUd5MU0xWHhyZ3AzL0NDODN1QWhqa3NwdjRqYUdqRVJCcXZiblBv?=
 =?utf-8?B?WXY3S0lERXJWV1V6eWMyTmtEN3RjbTNKd1NNOWZTZEp3NUM2RWxvc3R5Tmx3?=
 =?utf-8?B?YVFnNElmallTNkV5OS9rbkZ3SDF5OVdWK244OE1zVHd4NVRLbmlidVNnaVlK?=
 =?utf-8?B?YXNJNWZXZ0xkb09Tbm1jZGJNbGVLenM0eHpHWEpOdENXNThjWjhSL1h1UjlI?=
 =?utf-8?B?UjhrUVNEdTQwS3UyN2t2cGdVaDdrNWo5RmdqeG45SUlUUlc5ejJTQzZrU2tC?=
 =?utf-8?B?RWxkb2FOU1N6dUpjYzJ2WlNEdkFtM3B2ZTVCYjQ0NlM4blJRTHZvL2EvQS9q?=
 =?utf-8?B?dUhuUkFzamFuMkZTTmR6NzdRWnVGaVk5OW1zTUQ5UlFKS1Q0RFZoQThzUlh0?=
 =?utf-8?B?cTIvYi9LdlpkUGt0Z0ZhendxRXQwUFRVMXN6d05OaUxENERuZFU1b1orQUIv?=
 =?utf-8?B?bzl3NXRsTkNKNTcyaVV3cTk5cnB6Vk0xY2R1MGw0MXRKQUpOZ3dFMVJmSzJP?=
 =?utf-8?B?d21zb2pQZnREVW14MG5xVWdBUGp3SXlDVjBrSSt2R3ZoRk14VmxLSTFuTU52?=
 =?utf-8?B?YmhFaWFTdnZDSUNLNUhQR08rT1hpTlYxWCtSV3VDdWZ6b3dKVHZvSG9lZHoy?=
 =?utf-8?B?VDZYMFQ3U2ZWNWEzZlluNGdTQ09mREh5aExpVXJHZGl3cStMKzQ2VFNud1k5?=
 =?utf-8?B?YU0wcUdzdHVLR2k3cVBrU3NoQjV5dldEeUFad1lQZWQ0NkkvelFvQTZnaUFS?=
 =?utf-8?B?RExYUlg2cnpXTW1CeExUMklMVktoZyt2SklNbi8rcG5OZm1DL0lMd1FZb1Fn?=
 =?utf-8?B?RkNQaUpHSHdIcVBsNFRHMFJ2NDhSQXJBZ2JpRnFFaVpFdHl5eDhpS2ZncVc5?=
 =?utf-8?Q?aASARbO8wlYxTBaG1AFjDBwuZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4613E6EAC3C5DC418027F9B662CED1EF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 392d95c8-6a14-4189-7687-08dc1d9240c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 10:41:56.8928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGEyuJmeDMmR3WMAOWzTf3WcWOQjpy/F9Oh4uzzDPul7ZY6zP1cyuWXFVDqnIBzsYlmifkUb2bSQajfGvp0GpPs5Nzdnaee4iz0KS7U13Y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3467
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

DQoNCkxlIDI1LzAxLzIwMjQgw6AgMTE6MDgsIEt1bnd1IENoYW4gYSDDqWNyaXTCoDoNCj4gVGhp
cyBwYXJ0IHdhcyBjb21tZW50ZWQgZnJvbSBjb21taXQgYTMzYTdkNzMwOWQ3DQo+ICgiW1BBVENI
XSBzcHVmczogaW1wbGVtZW50IG1mYyBhY2Nlc3MgZm9yIFBQRS1zaWRlIERNQSIpDQo+IGluIGFi
b3V0IDE4IHllYXJzIGJlZm9yZS4NCj4gDQo+IElmIHRoZXJlIGFyZSBubyBwbGFucyB0byBlbmFi
bGUgdGhpcyBwYXJ0IGNvZGUgaW4gdGhlIGZ1dHVyZSwNCj4gd2UgY2FuIHJlbW92ZSB0aGlzIGRl
YWQgY29kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEt1bnd1IENoYW4gPGNoZW50YW9Aa3lsaW5v
cy5jbj4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9jZWxsL3NwdWZzL2ZpbGUu
YyB8IDEyIC0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwvc3B1ZnMvZmls
ZS5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9jZWxsL3NwdWZzL2ZpbGUuYw0KPiBpbmRleCAw
MmE4MTU4YzQ2OWQuLmQ1ZTFhZjQ4MzYwMSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9jZWxsL3NwdWZzL2ZpbGUuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1z
L2NlbGwvc3B1ZnMvZmlsZS5jDQo+IEBAIC0xNzA1LDE5ICsxNzA1LDcgQEAgc3RhdGljIGludCBz
cHVmc19tZmNfZmx1c2goc3RydWN0IGZpbGUgKmZpbGUsIGZsX293bmVyX3QgaWQpDQo+ICAgCXJl
dCA9IHNwdV9hY3F1aXJlKGN0eCk7DQo+ICAgCWlmIChyZXQpDQo+ICAgCQlnb3RvIG91dDsNCj4g
LSNpZiAwDQo+IC0vKiB0aGlzIGN1cnJlbnRseSBoYW5ncyAqLw0KPiAtCXJldCA9IHNwdWZzX3dh
aXQoY3R4LT5tZmNfd3EsDQo+IC0JCQkgY3R4LT5vcHMtPnNldF9tZmNfcXVlcnkoY3R4LCBjdHgt
PnRhZ3dhaXQsIDIpKTsNCj4gLQlpZiAocmV0KQ0KPiAtCQlnb3RvIG91dDsNCj4gLQlyZXQgPSBz
cHVmc193YWl0KGN0eC0+bWZjX3dxLA0KPiAtCQkJIGN0eC0+b3BzLT5yZWFkX21mY190YWdzdGF0
dXMoY3R4KSA9PSBjdHgtPnRhZ3dhaXQpOw0KPiAtCWlmIChyZXQpDQo+IC0JCWdvdG8gb3V0Ow0K
PiAtI2Vsc2UNCj4gICAJcmV0ID0gMDsNCg0KSWYgeW91IGFycml2ZWQgaGVyZSwgaXQgbWVhbnMg
cmV0IGlzIGFscmVhZHkgMCwgb3RoZXJ3aXNlIHlvdSB3b3VsZCBoYXZlIA0KanVtcGVkIHRvIGxh
YmVsIG91dDosIHNvIHlvdSBjYW4gYWxzbyByZW1vdmUgdGhhdCByZXQgPSAwIHNldHRpbmcuDQoN
CkFuZCB3aGlsZSB5b3UgYXJlIGF0IGl0LCB0aGVyZSBpcyBubyBwb2ludCBpbiBhIGdvdG8gdG8g
anVzdCBhIHJldHVybiwgDQpqdXN0IHJldHVybiBpbnN0ZWFkIG9mIHRoZSBnb3RvLCBhbmQgdGhl
biB5b3UgY2FuIHJldHVybiAwIGRpcmVjdGx5LCANCnNvbWV0aGluZyBsaWtlOg0KDQoJcmV0ID0g
c3B1X2FjcXVpcmUoY3R4KTsNCglpZiAocmV0KQ0KCQlyZXR1cm4gcmV0Ow0KDQoJc3B1X3JlbGVh
c2UoY3R4KTsNCg0KCXJldHVybiAwOw0KDQoNClRoYXQgd291bGQgYmUgYSBiZXR0ZXIgY2xlYW51
cC4NCg0KPiAtI2VuZGlmDQo+ICAgCXNwdV9yZWxlYXNlKGN0eCk7DQo+ICAgb3V0Og0KPiAgIAly
ZXR1cm4gcmV0Ow0K
