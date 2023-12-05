Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D02DB805173
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 12:02:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TYBNSeaG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkyL427dDz3dLK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 22:02:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TYBNSeaG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::621; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkyK65mYvz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 22:01:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W60pU0UfqyNf1SECfGMyMSnleh/wAd0ytWPYZ6kv6ZQuxaxgGMW1qcuYo2iIn7k/J+kIHYQ52nmfMwPWdP68t4w01R4UjOkU+ufKUTln6ypumGRCXJ8PCfE9o/BVwRfWewKlriz26uLBbF5LoP/EvhVfyMDUFTwVeZENIs6PPanlp57VT3kDGXEv1OLZ6hRBpE7UfIomjo5pTB9Jykfy9vD7fjGyGPj5UDS26j4eYzQwmFxkoEEgfi/etEaYLtYW10JBWIO+NqjzvRSA8ioe/jShOFYTZKuqFvjlhSwzF9IelL59lE8LWdVmjwDtDUcRHblHhV1Iclty81nbZlriZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIK0AA1DOrdlGJ2o2r/Sqx7e6GLDUWSMhUplrn/W79s=;
 b=k9QBX9L5c602C36AhB1j3qVZNT12zn0IjYeXIMsafjDMP8fpIicPSeIYaZHHXmY3Mb2n0p+WpKpI3cc53coCAXZK07mgX02x7IHcF1uWPPedrPsEJ1h23bwIEzu2nAMhGnxGJjIJnrGUhBE9SkPA90ESsOKfGwx3kqX/eGHGSEu2W0xvIJ/r27DZ+HLJC9SO/KXNGrw1gOBwIFbE+J8Sy3rkKdtLjMGufKj0cufW9dbimdFGmDFlZK18YVLUvbd1Jh+BZtQlrexr/N0HNQeD7na6vWXjhwp3p2P2vB07gxhq3D80tJIILcktHBkaO1Wt9ei76nZYt0UnXsgFsO0ZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIK0AA1DOrdlGJ2o2r/Sqx7e6GLDUWSMhUplrn/W79s=;
 b=TYBNSeaG6rCL8SnBYTU9Vliavjf8sRpKDG390Ih1YLY8Ly0TmyPKMar8rycXdfxmooaZ+xKtwqX43zgFOFG9fKofMT219pQZGC8FX+ijAL8Q4CCGUxrEaJUFdXgKck65tf2PVpC6d8MHQmKz/R6mOccdkT97PGbda8hyMpTkh6Oq2tbQRJ7sfBrwRx3auuVl7y/nXuEqxeGNXXGQdGGKIAYxEmg1IpJcaX9guMMjiqNzT5QJC77iPn86BO+8g+7H7p7zCbs/yJWK/X87hEEDWNVRLsIoqXlYRZE8rv4PiKI24domXrkHr1sHt2pj627/Da3t+hFTVdvh5o+EKbSOJw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3330.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:28::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.24; Tue, 5 Dec
 2023 11:01:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Tue, 5 Dec 2023
 11:01:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from
 PAGE_NONE
Thread-Topic: [PATCH v2 1/2] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from
 PAGE_NONE
Thread-Index: AQHaJpVwEZvJxsegqEqHJNGYpe6j3bCah5gA
Date: Tue, 5 Dec 2023 11:01:22 +0000
Message-ID: <f1bd25bc-d24a-40a0-bcbe-db518f24f119@csgroup.eu>
References: <20231204093638.71503-1-aneesh.kumar@kernel.org>
In-Reply-To: <20231204093638.71503-1-aneesh.kumar@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3330:EE_
x-ms-office365-filtering-correlation-id: 5d1c0057-4c9f-4116-af56-08dbf58184c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  rZZKW1Iht2OCqPV/D1NYxpT76IX410I3pq8g4UcSzcs6WgKcSCkHaL6lxIY6aOOxhzWTbEB+ha1JU2+8eADLRNL8/G7OmUUQHdTl03YP+dhRioGN264tEC+LiVn+fezzDc07pJjR+YjK1b+buAf/kX+l6p94HDomGPSK4a5G7VTOsmXQwAV3+0WPOdSeYpihwF2WnzFg+nZWKoHy+aQ69e1XTe3C5ebWhcF4uHBSwyQrAGPriMSfRnYvYPlR3GhQOCAVoa1VUBantCz7177F8z1zMAEoCiqFyvBySwMZ2LYxbQJeUlvMRt47aelieMn546lZsxYIHUOwmgnBQI4OfTwjDWWTsfi21ce0ksNUPLcc7tbgevEt4ma2F1GlhdNtHZ39Haqhl08zvlemNvBGj6FMfKgXjtb288i0iLsediRnDa7WsQkUX3xSj9M0AS1WTlk93w7pzR97Ky7K4k2utby6Uk40QlF9hKa6wGdJsW1jboc3oGY21BETnKMotYlNbIMG51L0cQUJ689XHZdHc6E5VU2o+U8D3B5XOrFrePfYOLo8wZzMtdeqj2kTi2tAQstceuJp35PQ9b5KDBlWNreRFAAD5x9C+Zr+hyWvYu6jZrwyyff1Y9MAOOYDGtXt8lOHJRh6olE4vZXzpgD6XuWPc1zWEF62KpmLsadsCAMwqmkMPleRyQtsE3lxJ6m4
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6486002)(6506007)(36756003)(26005)(2616005)(38070700009)(6512007)(41300700001)(38100700002)(66574015)(86362001)(31696002)(83380400001)(122000001)(71200400001)(478600001)(2906002)(31686004)(316002)(66946007)(76116006)(64756008)(66446008)(110136005)(66476007)(66556008)(91956017)(44832011)(8936002)(8676002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UU0vSVkrNXo3d0Z5c1c3Y1pmZGRVNXU5QjhKd21zYktCQ2piKzhmemtIbjJv?=
 =?utf-8?B?cUhKQmNVWmw1RStCQjIzNS9SY1dUMDRTSStjeTRVRk5ldk1DY3lFbE1CODBr?=
 =?utf-8?B?a1VqYmlBeG5YRGhIMmNpaWlKbGkySTRTaDhsN0RLdE9zRUZQWVd1K0h0S3Vm?=
 =?utf-8?B?TGtoNlRzMHRNbWc0VGNqOFhyMHlQY0dlcXg5cFB1Umorb2JrTEhzL1JJWkRZ?=
 =?utf-8?B?SnY0WHg0dFozN0VPSVkzdldPaDRSUlhEUmsyUFF3NW90S28vQ1IzQ2EwMmxv?=
 =?utf-8?B?UGw2OUFPWDZuNXZuakVIRE9ENEZsWFBVUUhTVUVseVE1UHlVTXJ0b0JRcWU2?=
 =?utf-8?B?V21zcll4eEw3R3pSSm55MTlPQ0ZrSWVFK3R2bzVEdFJNclQxS01vRXppdFpy?=
 =?utf-8?B?eGVrTExjeStROXphNTBTMHhXQWVZNDg5SVNVcWF0MVJROU5CZys5d3NmdVJ3?=
 =?utf-8?B?S3RITXhJalEvbjEvdThtQmpJd05iNlV3TGZXVVZ6NUhzV0Y5b1pvUXFBQjhB?=
 =?utf-8?B?MmU5YlFJeEJlZ0YzNzlac2tJYmdqUDcvMjQ2NkFJSVFQajNLOWVMWkpxUmxy?=
 =?utf-8?B?amJFVzVkYU81dVVaUWpaNmtQRWRHUWFtZHp2NzFialVLS2ZLTm5jWmVEYTBp?=
 =?utf-8?B?VlZ4Q29zVEdNUnVqSWhhNTBKcWhpTlQvak9VeFdJd3N0U3l5MUo1M05jMmlx?=
 =?utf-8?B?RXFHNmE5ZjduZ1czbnhmdlQ2c1kxMmdSMGV3bjFSR1VxaU04WnRPZ09kTWg0?=
 =?utf-8?B?QzU1NURJYlc5Zk5GdGVHaW94UzZjcTJTbWNSV3d0Umc4bDJmbDArc2F2TGVm?=
 =?utf-8?B?ZytxVTRob0toVDI3dGF4NWtMQXE4OWZNWFAza3l1cXNhQm0rNTIwaDNLR1NP?=
 =?utf-8?B?TWRnb294UkppZGFQKzZuNExZUXB2S04vK0svZlM2RUw5WTJINytGVGhJZ3Q2?=
 =?utf-8?B?cE5ndWk2bHBzaHZlTnAwNXcxQUpqKzRZdjVHWWgrYjlZZVhsTS9jZk9JOTAx?=
 =?utf-8?B?aFhZajRQRGhCUFBNZnVkMUN6MEhnZlZUdXFDK25vbUhzay9LTVQ5TTZsT2lS?=
 =?utf-8?B?UDdZV0tDZ1R6Z3R6NWRWdHo3NFNtWWtCV1IyQ2FlQjM1SVp2clQxRUFQaCtL?=
 =?utf-8?B?YnAvVDkraXNRZUlrdm9HaG1udGp3WHorMGJHYk8rdFBzYzEyazltSm1aMzZh?=
 =?utf-8?B?M1JQUzF0M1J0SjVNeDZVMkZpRWNGWmFmMkRlSmdOdy9QYlB3S0pRTlNxNVd5?=
 =?utf-8?B?Uk10RVZudGFSNFQrYkUyS3ZVTmd3ZFdKR0V0K3JOb3Q0L1J0dVJDWVEyTjFy?=
 =?utf-8?B?SUVLNXpKYUFJS0tiUUtTNVZNNkxGdFdTWTc2MWFzOHVQZWZZOVdaN2FwQUtl?=
 =?utf-8?B?VVJmT2txRHJST3lzT2doV2pCNmtpTnpRZWZDNHdHLzJnVkFIRlhEcERrbVg2?=
 =?utf-8?B?YjB1ZTdJZ2NVRlg0VElZZDhaRE0zMGI2Lzg5aEhSYnZnN2pOdjBYbnlxZnVr?=
 =?utf-8?B?YXpBQTJ6bUpMMDBjOU5udk5ZeHZkdkpEOERKbnltYmVDVEVUU211Z1FrYnl5?=
 =?utf-8?B?eVErOTBteHBvNVp3RnlTbFZjZEdEd0tJRGY2ZytIdXFkOUkzdFhtZjFETVZ0?=
 =?utf-8?B?M1g3TFNCelNOdnhYZjhQRTZkeTMvc0lpN0FEOFB0YllORVhWNk1vTmFVWkF0?=
 =?utf-8?B?eldPY2I3a2hmNmhxNHBjeW9VQ0VvbTIrWWcxMEJFNWsrbW9GZDZ2cUdQQXQ3?=
 =?utf-8?B?akcxRUc4WkZ4bmMxa1lBZ1pTZVQrMmNvRnNwR2wrbDJNZDVvS3FLN1k1Wk1L?=
 =?utf-8?B?eHYya0lOL2V1WFVvK2FMTnpZZWpYSnNSTVZUTjFOWEl2c1ptYTZFWkx5UldP?=
 =?utf-8?B?RmZTWXVjclAwNVdlWHI4SEdMdEgra2ozUWhONFdOeGt6YklwQUJEYmVPcGZh?=
 =?utf-8?B?aDV3QVFZS1ZKaksvcC9ucE43ZCtoS2hVMHYvRVYrdnRJK1JnM0hDR0hHWVhk?=
 =?utf-8?B?c1lyS0ptSEVSb3R5TGN0TnBGejJiQTdxcHRsQmtnZ0VjYVhxUmdqajhSL0ZY?=
 =?utf-8?B?UCtTcTFjRnQ0eTZObkNPWFdES29NNUFRZnBnWThLeldtOG5kUVh0TS9IZmt2?=
 =?utf-8?Q?CjNJXKjuQZU02+zhU5McEfT++?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6979EF716C298A4A9BE496D7E46EF05F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1c0057-4c9f-4116-af56-08dbf58184c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 11:01:23.0235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: We3qNwMiRWY3cb26PnAfMvNrk0hb6Q11hiD7g38ZXv7tEBSeDZ8v9nOPd9SGjxkgh2pxqjif+oLiSQ9U6ThQ3CQow8rTzWBFdOLN2AOV2sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3330
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzEyLzIwMjMgw6AgMTA6MzYsIGFuZWVzaC5rdW1hckBrZXJuZWwub3JnIGEgw6lj
cml0wqA6DQo+IEZyb206ICJBbmVlc2ggS3VtYXIgSy5WIChJQk0pIiA8YW5lZXNoLmt1bWFyQGtl
cm5lbC5vcmc+DQo+IA0KPiBUaGVyZSB1c2VkIHRvIGJlIGEgZGVwZW5kZW5jeSBvbiBfUEFHRV9Q
UklWSUxFR0VEIHdpdGggcHRlX3NhdmVkd3JpdGUuDQo+IEJ1dCB0aGF0IGdvdCBkcm9wcGVkIGJ5
DQo+IGNvbW1pdCA2YTU2Y2NiY2Y2YzYgKCJtbS9hdXRvbnVtYTogdXNlIGNhbl9jaGFuZ2VfKHB0
ZXxwbWQpX3dyaXRhYmxlKCkgdG8gcmVwbGFjZSBzYXZlZHdyaXRlIikNCj4gDQo+IFdpdGggdGhl
IGNoYW5nZSBpbiB0aGlzIHBhdGNoIG51bWEgZmF1bHQgcHRlIChwdGVfcHJvdG5vbmUoKSkgZ2V0
cyBtYXBwZWQgYXMgcmVndWxhciB1c2VyIHB0ZQ0KPiB3aXRoIFJXWCBjbGVhcmVkIChuby1hY2Nl
c3MpIHdoZXJlYXMgZWFybGllciBpdCB1c2VkIHRvIGJlIG1hcHBlZCBfUEFHRV9QUklWSUxFR0VE
Lg0KPiANCj4gSGFzaCBmYXVsdCBoYW5kbGluZyBjb2RlIGdldHMgc29tZSBXQVJOX09OIGFkZGVk
IGluIHRoaXMgcGF0Y2ggYmVjYXVzZQ0KPiB0aG9zZSBmdW5jdGlvbnMgYXJlIG5vdCBleHBlY3Rl
ZCB0byBnZXQgY2FsbGVkIHdpdGggX1BBR0VfUkVBRCBjbGVhcmVkLg0KPiBjb21taXQgMTgwNjFj
MTdjOGVjICgicG93ZXJwYy9tbTogVXBkYXRlIFBST1RGQVVMVCBoYW5kbGluZyBpbiB0aGUgcGFn
ZQ0KPiBmYXVsdCBwYXRoIikgZXhwbGFpbnMgdGhlIGRldGFpbHMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBbmVlc2ggS3VtYXIgSy5WIChJQk0pIDxhbmVlc2gua3VtYXJAa2VybmVsLm9yZz4NCg0K
UmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5l
dT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFi
bGUuaCB8IDEwICsrLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaGFzaF91
dGlscy5jICAgICAgICB8ICA3ICsrKysrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ib29rM3MvNjQvcGd0YWJsZS5oDQo+IGluZGV4IGNiNzdlZGRjYTU0Yi4uOTI3ZDU4NTY1MmJj
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFi
bGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUu
aA0KPiBAQCAtMTcsMTIgKzE3LDYgQEANCj4gICAjZGVmaW5lIF9QQUdFX0VYRUMJCTB4MDAwMDEg
LyogZXhlY3V0ZSBwZXJtaXNzaW9uICovDQo+ICAgI2RlZmluZSBfUEFHRV9XUklURQkJMHgwMDAw
MiAvKiB3cml0ZSBhY2Nlc3MgYWxsb3dlZCAqLw0KPiAgICNkZWZpbmUgX1BBR0VfUkVBRAkJMHgw
MDAwNAkvKiByZWFkIGFjY2VzcyBhbGxvd2VkICovDQo+IC0jZGVmaW5lIF9QQUdFX05BCQlfUEFH
RV9QUklWSUxFR0VEDQo+IC0jZGVmaW5lIF9QQUdFX05BWAkJX1BBR0VfRVhFQw0KPiAtI2RlZmlu
ZSBfUEFHRV9STwkJX1BBR0VfUkVBRA0KPiAtI2RlZmluZSBfUEFHRV9ST1gJCShfUEFHRV9SRUFE
IHwgX1BBR0VfRVhFQykNCj4gLSNkZWZpbmUgX1BBR0VfUlcJCShfUEFHRV9SRUFEIHwgX1BBR0Vf
V1JJVEUpDQo+IC0jZGVmaW5lIF9QQUdFX1JXWAkJKF9QQUdFX1JFQUQgfCBfUEFHRV9XUklURSB8
IF9QQUdFX0VYRUMpDQo+ICAgI2RlZmluZSBfUEFHRV9QUklWSUxFR0VECTB4MDAwMDggLyoga2Vy
bmVsIGFjY2VzcyBvbmx5ICovDQo+ICAgI2RlZmluZSBfUEFHRV9TQU8JCTB4MDAwMTAgLyogU3Ry
b25nIGFjY2VzcyBvcmRlciAqLw0KPiAgICNkZWZpbmUgX1BBR0VfTk9OX0lERU1QT1RFTlQJMHgw
MDAyMCAvKiBub24gaWRlbXBvdGVudCBtZW1vcnkgKi8NCj4gQEAgLTUzMiw4ICs1MjYsOCBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgcHRlX3VzZXIocHRlX3QgcHRlKQ0KPiAgIHN0YXRpYyBpbmxpbmUg
Ym9vbCBwdGVfYWNjZXNzX3Blcm1pdHRlZChwdGVfdCBwdGUsIGJvb2wgd3JpdGUpDQo+ICAgew0K
PiAgIAkvKg0KPiAtCSAqIF9QQUdFX1JFQUQgaXMgbmVlZGVkIGZvciBhbnkgYWNjZXNzIGFuZCB3
aWxsIGJlDQo+IC0JICogY2xlYXJlZCBmb3IgUFJPVF9OT05FDQo+ICsJICogX1BBR0VfUkVBRCBp
cyBuZWVkZWQgZm9yIGFueSBhY2Nlc3MgYW5kIHdpbGwgYmUgY2xlYXJlZCBmb3INCj4gKwkgKiBQ
Uk9UX05PTkUuIEV4ZWN1dGUtb25seSBtYXBwaW5nIHZpYSBQUk9UX0VYRUMgYWxzbyByZXR1cm5z
IGZhbHNlLg0KPiAgIAkgKi8NCj4gICAJaWYgKCFwdGVfcHJlc2VudChwdGUpIHx8ICFwdGVfdXNl
cihwdGUpIHx8ICFwdGVfcmVhZChwdGUpKQ0KPiAgIAkJcmV0dXJuIGZhbHNlOw0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYyBiL2FyY2gvcG93ZXJw
Yy9tbS9ib29rM3M2NC9oYXNoX3V0aWxzLmMNCj4gaW5kZXggYWQyYWZhMDhlNjJlLi4wNjI2YTI1
YjBkNzIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3V0aWxz
LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYw0KPiBAQCAt
MzEwLDkgKzMxMCwxNiBAQCB1bnNpZ25lZCBsb25nIGh0YWJfY29udmVydF9wdGVfZmxhZ3ModW5z
aWduZWQgbG9uZyBwdGVmbGFncywgdW5zaWduZWQgbG9uZyBmbGFncw0KPiAgIAkJCWVsc2UNCj4g
ICAJCQkJcmZsYWdzIHw9IDB4MzsNCj4gICAJCX0NCj4gKwkJVk1fV0FSTl9PTkNFKCEocHRlZmxh
Z3MgJiBfUEFHRV9SV1gpLCAibm8tYWNjZXNzIG1hcHBpbmcgcmVxdWVzdCIpOw0KPiAgIAl9IGVs
c2Ugew0KPiAgIAkJaWYgKHB0ZWZsYWdzICYgX1BBR0VfUldYKQ0KPiAgIAkJCXJmbGFncyB8PSAw
eDI7DQo+ICsJCS8qDQo+ICsJCSAqIFdlIHNob3VsZCBuZXZlciBoaXQgdGhpcyBpbiBub3JtYWwg
ZmF1bHQgaGFuZGxpbmcgYmVjYXVzZQ0KPiArCQkgKiBhIHBlcm1pc3Npb24gY2hlY2sgKGNoZWNr
X3B0ZV9hY2Nlc3MoKSkgd2lsbCBidWJibGUgdGhpcw0KPiArCQkgKiB0byBoaWdoZXIgbGV2ZWwg
bGludXggaGFuZGxlciBldmVuIGZvciBQQUdFX05PTkUuDQo+ICsJCSAqLw0KPiArCQlWTV9XQVJO
X09OQ0UoIShwdGVmbGFncyAmIF9QQUdFX1JXWCksICJuby1hY2Nlc3MgbWFwcGluZyByZXF1ZXN0
Iik7DQo+ICAgCQlpZiAoISgocHRlZmxhZ3MgJiBfUEFHRV9XUklURSkgJiYgKHB0ZWZsYWdzICYg
X1BBR0VfRElSVFkpKSkNCj4gICAJCQlyZmxhZ3MgfD0gMHgxOw0KPiAgIAl9DQo=
