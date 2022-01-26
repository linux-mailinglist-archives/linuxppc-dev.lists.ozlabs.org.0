Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2C49C987
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 13:22:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkNCW07scz3cKK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 23:22:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::626;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkNBx6GV0z30Mg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 23:22:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbj3ze/cTRFqHxheF0oOmXYuH5F/Sa/Dovsh2pZsMsgtIQWL5lUp8sARQOOW+TtQAG5pN3dbkvIPUFHW2fbSP4RkNfgYfLBQLZEsjbHUUC1U7IHIsCkd8MI2RseedIN74xzfJkGOeV6CHpNVWJxttLhVgwGwT6MyX2Dwr4Ag574uN8Na1zQU7+SUEMbzrha6qPDEAxzMBGEuvVrv8QBDy6QXC7sDATd9I8Zilny0VP/CcXKiQuWM0OvzdqHbNhfUeaNY68bSlRjxQAs5JgeQvOwu/H0LmDlY55ZFUXdU9rURQdLzm3ElZRkfztyoXAGQ/KjIqjfEjxH4zf1RxdZSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgzLMV7ZCKIzlnbVqCwrzhdXZfFx2x7mHAdf9yMwfMU=;
 b=bDN/AkXKtejAWZiZ7KR7tfyGXyJpCeomDnluiCsdbApLqNQY0QTMT0M4aOjV2m81ieokuRl2WaGnz3WDp+fp9UGUazpcKicWEVUrYXIqO0kiHP+AM3bOudBgBVbuuQPS/bRCZg3sBp2H2Zoq07W47ruS0luoX+sK7WH90G/A0sU4pXj93gNg0pOm8Rn/zR4/4VMihlgS9PzXjW2TSQsLeujPe8jJSetTEspq/hhAKUEaFwWlYColpRHtyA5LewCNEoNRFm0prVUB2/9dRvEFySMnsxufhfaoU77IVxXZb3PMqQChykFEe+XfCAh5FaxlFuqfhJom2hupwpakxSArjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0546.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 12:21:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 12:21:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Dan Carpenter <dan.carpenter@oracle.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: Re: WARN_ON() is buggy for 32 bit systems
Thread-Topic: WARN_ON() is buggy for 32 bit systems
Thread-Index: AQHYEqvJvGpkC2hnp0+20faDvnKo3ax1OTwA
Date: Wed, 26 Jan 2022 12:21:49 +0000
Message-ID: <8bfa7bbe-7343-2d2f-d20b-d4789523c89c@csgroup.eu>
References: <20220126115616.GY1978@kadam>
In-Reply-To: <20220126115616.GY1978@kadam>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc94a8b2-b943-4b56-af76-08d9e0c66de0
x-ms-traffictypediagnostic: MR2P264MB0546:EE_
x-microsoft-antispam-prvs: <MR2P264MB05464D501749F04F3EC46539ED209@MR2P264MB0546.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NkDDDiGEVr0xpFd6QTkCI8EqrDnPZ77rTM6G7GgStac4XJoD6VsvNtZIuzdyn5PlrV112M/j/F7NUoq0sn9uRV40ixeYuiv2FZ3TQc0jjbzMJe8W6cDOPMdcVr9OWY3H/e4GmO4oeDAiKyI+qdAGCxtmhNfxnmX6+ri4MYxeKpfEWYvPZMBPqIVCRWsWIbAxpHkp7BHhXH3xyIlyOe5ekwi1pbR6DR8KR35xygMTIXMhhkE9POHKbtzSbCWtMaakHRfwF047gBM008KX2WmCFxtet20G1V/oLZSuv5EHB/GWsjDycf5MX1XarqdcmKb3BcADcRabRviRXrhvHEqXIPZRu+7QSuUFr1Qu8pxMZ0ZD1NQskeSR9vaDh/uJc/9HEzA4u0mzJK+PAufAMM2nAz2csNlwPBh7yWm+JbN/xkAuEo7RsSWOyZXHUt+xGK/k71tsBZrKTJCuWrmS2WVp/n7lDdWKGbU/OU/miFPWIM4dsk852Vi/RyFZJ2+8QWhiZoGnv8mXF8Dy0c1rrd8hMn2rWx+G+JDWnYKvVlJQqJ4RRzk4o6G2miCsMofirbGWic7bokczvmtQ6pVtX5D2wdzr31NGrrSicFgLZHVT5NbDssPseWgoRyyAM6GWun036REbprg2SohWqlZHkbWU+AQ+PZh0Qbq1zmgeZtzgyJrjNujZGrFc8pIoTIOQkn5c862BV82YXv4EEpXCiUODM36BinsDWc6aoIewFMsxI3I7qxOf/YN5Idf0SOAAbmAvyaw56nxCU9oR6Sx8JOI1XA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(6506007)(508600001)(6512007)(110136005)(31696002)(86362001)(66574015)(6486002)(122000001)(316002)(71200400001)(83380400001)(64756008)(2906002)(66946007)(66476007)(66556008)(2616005)(186003)(38100700002)(26005)(8936002)(44832011)(31686004)(5660300002)(8676002)(76116006)(91956017)(66446008)(36756003)(4326008)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFlGQjQ3akVaLzBtd2lNRmtwSFJrcDYvTnc2UFNKNnovRVh1UVMvK3B6Nis5?=
 =?utf-8?B?cFZEZ0Z3Ti9vRFgybmlUSGp5VGg1dTl0Sk5hMllEUTl0eTFSZzEwWXdVUGZB?=
 =?utf-8?B?NHBDVXhUZGs5SnRTUzRQZGlwL045YmszcE51Qk9WOVF3UkpxNy9Ha2N4dm1x?=
 =?utf-8?B?YXIwSkNjR3NDNUdyZnduR1V1ZDlDaFRVbVplODJhbmpoWkdJSXFkZjUxTmhU?=
 =?utf-8?B?OWl5TTFIdnJBTWMxend3dWRWdDFybDNDYzhML2FPUTVUdTFNZ1gzM25LTGJO?=
 =?utf-8?B?RkFNNGFWNGx2Vlp5bWlCYUE5VXNBbmdQd0FMNUY5Qk10NmtQM2JSY24rbUVU?=
 =?utf-8?B?NnN2SFRSYkd3UllqM1JEb3ZBSGtLR1NNRTNOUWcwdDVYSTVSNXIyd1M2TDRj?=
 =?utf-8?B?eHhtTGE0ZnVwSHY0R0VtcklvcDNVZE1XMlJOY3dSNEtPd2dXekluamM4ckF1?=
 =?utf-8?B?dmZVYU8wMlFXcCtIZmZnMVRHZnhkTStuMHBFbzhUTC9ZNFNnNHdHU2Nzc21h?=
 =?utf-8?B?dG1FYlB0RTRxbDZwSis2cXltOThPc2FtTk1ZTGJXTjJrRjN1MlBTTm9TQkFD?=
 =?utf-8?B?c3cxZVlJSkNjT0ZXTTkxZko1dzhqR3JUakNFNnVLbUZoaXQ2OFlsVkNseGUy?=
 =?utf-8?B?aEM5ZDAxK3cycTRtUUk1aDUxY29tem9lYXd3TXpaeWsycEhJOEY4aWl3TE5s?=
 =?utf-8?B?MUJGOUsxbnI3SG1ZWWhQbDlnblJrR2FvMWltc3g2Z3gzK0g0SGRWL1pmakV3?=
 =?utf-8?B?K2Rha2ZUUk9PQ0czK0JwUUp0REU1QTV1TG4ybmZHcno3d3hNcmxqZW9Qc01n?=
 =?utf-8?B?UG80SDBGbm1KekxSeGRURnE2ODZYYWRPcTU0WERibmV0alB6WEpPVkZuRXV2?=
 =?utf-8?B?ODQwRHExYWZTWkh5QTVFL1lxY0tNTzBQVjJ4OWhwQ0RWMFNVcUNFWHJGc3JH?=
 =?utf-8?B?OWdNT3ZjN29IdmhPUmpYTjZWRnVEb3hwMVg3ZkkzTWlzcGJLc0FpMzBURHM3?=
 =?utf-8?B?RjU2MEg1K2UwaUFLU0ZtOXY0ekQvQXJ1c2toWWljSk8zaTdqdGRBQlNIZlBn?=
 =?utf-8?B?cktySDVkQ1hjNE1nMlU2cE9pL2MvL1hjQ0NFUGlWWld4TGhYb0pJR1ZnRTNs?=
 =?utf-8?B?Y3ZwY3ovVUpCRWpwb3haRkJXRU5WS3RuWEY0ai9sKy9DYThYYVpBODBGbzE2?=
 =?utf-8?B?K2JrZXVFS3BUbmRqZytLK0lhdkhkc3lWQVk1WHl0VjNCU2ZUanNuWTVKRE1m?=
 =?utf-8?B?YTh1N255emduK2t2alhaaVF3dDM0c1E2bUozL1hqT0tVMUhhblNuUlNuN2FK?=
 =?utf-8?B?VWNETGFuWDFueUxFdUYwTHpwb0xVS2M4NlY1eFB3Znp5NUx2bGo2ZXlvOWpX?=
 =?utf-8?B?YWpYemdMZ1k3aXF6RW5zakRMcjhPQmVSR2g0RHhGakxMN2ttT0EwKzY1S25u?=
 =?utf-8?B?TktncmFnaU9WMnc4VnA0YzB5SSt4R2pmSElLVWhmcVgvS1NyeGtVWjVoT0NU?=
 =?utf-8?B?SDNjUDFra1NETWVwOWY0d2w0bmpYUWNlc25JWGtEZkpvWWEwZDhYRllYMXBZ?=
 =?utf-8?B?RmpYN05HbXh3YmNSY3dEcjZiSEZBWndOOFAzcDhqQmlEYXh6ckhkUjIrY0pL?=
 =?utf-8?B?bHAvTy9lNE9FYjJvbzlqVGlDV3VoWFZldDZjeDl3aDFYc3lMTUZtZERWL1hj?=
 =?utf-8?B?SjZKZU9GM2F0djk2YzhyY2ZFT3Y3YlRKZVZ5S1RHWE1KYXFJN3duMndENzBV?=
 =?utf-8?B?TUdqVHhMRGthM3lCOVlIVENxZHh5bUhENHJJSGpGQUlTcFVYcGFsR2FGYUNX?=
 =?utf-8?B?Z2cxTVFjeTJnbGExYitUTnFKUEtMM2xVSnNZRlp2ODFEbUZBR3owRGVFWS9R?=
 =?utf-8?B?QVNBOExjZGRSdjVQQ25WYjhlNWhMaEdRbGZuMGJSNkNHQ0pQQS9xY0RQbUJ0?=
 =?utf-8?B?NEhsZVhZRk9nYWtTbDBrdnU5aS93SzM4Z0tyMWVTVDNhc2ozcTg0dE91alI4?=
 =?utf-8?B?NXlGTm5Tc2hBeDJxK0dML0xkeG5vZnZBbHhKV2dmUWNzYXJlR2R5em5aRW9x?=
 =?utf-8?B?c1NwbzY3Mzd5RENRYTAzT1hOV1ppZWNpaXRhQzN4U09Tb01CMU5iSS9UZFE2?=
 =?utf-8?B?RHp3YXk3Nys5ZktsVVY4ZHUxNGJnMmhQaUhySFUvZzNheUxkMy9xOUk0eHVk?=
 =?utf-8?B?S21EdlEwYWNteGVXanV1OWFwR0lnSVIyKzJaWllyOXJ3YlMydTM0dnRoSWdi?=
 =?utf-8?Q?YqV08as0DBsvrVaaCJ/EM3yAzOADsjjWWaS4qqRyUM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57E660AB343BC34188F1ADEED36EF631@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cc94a8b2-b943-4b56-af76-08d9e0c66de0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 12:21:49.8568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ib+ABsDueYlQ3AVdk2PGVmeNVmR0I7SVsvUkGt8ro8EF9QknUr4eKwl/RQZP109PlIOGn9ifPtJUgcgBQ0dYXWlXis9dymByF1RYK6l0sF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0546
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgRGFuLA0KDQpMZSAyNi8wMS8yMDIyIMOgIDEyOjU2LCBEYW4gQ2FycGVudGVyIGEgw6ljcml0
wqA6DQo+IA0KPiBIaSBNaWNoYWVsLA0KPiANCj4gQ29tbWl0IGU0MzJmZTk3ZjNlNSAoInBvd2Vy
cGMvYnVnOiBDYXN0IHRvIHVuc2lnbmVkIGxvbmcgYmVmb3JlIHBhc3NpbmcNCj4gdG8gaW5saW5l
IGFzbSIpIGJyZWFrcyBXQVJOX09OKCkgZm9yIDMyIGJpdCBzeXN0ZW1zLg0KDQpJIHRoaW5rIHlv
dSBtaXNzZWQgY29tbWl0IGRiODdhNzE5OTIyOSAoInBvd2VycGMvYnVnOiBSZW1vdmUgc3BlY2lm
aWMgDQpwb3dlcnBjIEJVR19PTigpIGFuZCBXQVJOX09OKCkgb24gUFBDMzIiKQ0KDQo+IA0KPiBh
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYnVnLmgNCj4gICAgIDEwOSAgI2RlZmluZSBXQVJOX09O
KHgpICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAg
IDExMCAgICAgICAgICBib29sIF9fcmV0X3dhcm5fb24gPSBmYWxzZTsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4gICAgIDExMSAgICAgICAgICBkbyB7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgIDExMiAgICAgICAgICAg
ICAgICAgIGlmIChfX2J1aWx0aW5fY29uc3RhbnRfcCgoeCkpKSB7ICAgICAgICAgICAgICAgIFwN
Cj4gICAgIDExMyAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCEoeCkpICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwNCj4gICAgIDExNCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgIDExNSAgICAg
ICAgICAgICAgICAgICAgICAgICAgX19XQVJOKCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4gICAgIDExNiAgICAgICAgICAgICAgICAgICAgICAgICAgX19yZXRfd2Fybl9vbiA9
IHRydWU7ICAgICAgICAgICAgICAgICAgIFwNCj4gICAgIDExNyAgICAgICAgICAgICAgICAgIH0g
ZWxzZSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgIDEx
OCAgICAgICAgICAgICAgICAgICAgICAgICAgX19sYWJlbF9fIF9fbGFiZWxfd2Fybl9vbjsgICAg
ICAgICAgICAgIFwNCj4gICAgIDExOSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgIDEyMCAgICAgICAgICAgICAg
ICAgICAgICAgICAgV0FSTl9FTlRSWShQUENfVExORUkgIiAlNCwgMCIsICAgICAgICAgIFwNCj4g
ICAgIDEyMSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCVUdGTEFHX1dBUk5J
TkcgfCBCVUdGTEFHX1RBSU5UKFRBSU5UX1dBUk4pLCBcDQo+ICAgICAxMjIgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgX19sYWJlbF93YXJuX29uLCAgICAgICAgICAgICBcDQo+
ICAgICAxMjMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInIiICgoX19mb3Jj
ZSBsb25nKSh4KSkpOyAgICBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeXl5eDQo+IElmIHRoZSBjb2RlIGlzICJpZiAoV0FSTl9P
Tihzb21lX3U2NCkpIHsiIHRoZW4gdGhlIGNhc3QgdG8gbG9uZyB3aWxsDQo+IHRydW5jYXRlIGF3
YXkgdGhlIGhpZ2ggYml0cyBzbyBpdCdzIHdyb25nLiAgKE9yIGF0IGxlYXN0IHRoYXQncyBob3cg
aXQNCj4gd29ya3Mgb24geDg2LCBJJ20gd29ya2luZyBvbiBhIHdvcmsgYXJvdW5kIGZvciBTbWF0
Y2ggdG8gYmUgYWJsZSB0bw0KPiBwYXJzZSB0aGlzIFdBUk5fT04oKS4gIEkgZG9uJ3Qga25vdyBh
bnl0aGluZyBhYm91dCBQb3dlclBDLikNCg0KVGhlIGNvZGUgaXMgZW5jbG9zZWQgaW4gYSAjaWZk
ZWYgQ09ORklHX1BQQzY0LCBpdCBpcyBub3QgdXNlZCBmb3IgUFBDMzI6DQoNCi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYnVnLmgNCiAgIDk5ICAjaWZkZWYgQ09ORklHX1BQQzY0DQogIDEwMCAg
I2RlZmluZSBCVUdfT04oeCkgZG8gewkJCQkJCVwNCi4uLg0KICAxMDkgICNkZWZpbmUgV0FSTl9P
Tih4KSAoewkJCQkJCVwNCi4uLg0KICAxMzIgICNkZWZpbmUgSEFWRV9BUkNIX0JVR19PTg0KICAx
MzMgICNkZWZpbmUgSEFWRV9BUkNIX1dBUk5fT04NCiAgMTM0ICAjZW5kaWYNCg0KDQpDaHJpc3Rv
cGhlDQoNCj4gDQo+ICAgICAxMjQgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICAxMjUgIF9fbGFiZWxfd2Fybl9v
bjogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAg
ICAxMjYgICAgICAgICAgICAgICAgICAgICAgICAgIF9fcmV0X3dhcm5fb24gPSB0cnVlOyAgICAg
ICAgICAgICAgICAgICBcDQo+ICAgICAxMjcgICAgICAgICAgICAgICAgICB9ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICAxMjggICAgICAgICAg
fSB3aGlsZSAoMCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
DQo+ICAgICAxMjkgICAgICAgICAgdW5saWtlbHkoX19yZXRfd2Fybl9vbik7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcDQo+ICAgICAxMzAgIH0pDQo+IA0KPiByZWdhcmRzLA0KPiBk
YW4gY2FycGVudGVyDQo+IA==
