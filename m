Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF6674AA08
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 06:45:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=CM/xIYL/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qy1794KK4z3c3c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 14:45:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=CM/xIYL/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qy16F5kpQz3btJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 14:45:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLBS6fRdruW2I6NypkfWDH93J0U1FeeIM/F462JMs6YHcsYKxjXqSSS12wKBzrqdlVOBQ2xcJLYJ3VyhkPP5bhUvp+qOvp9s/B8jr3ikEk2vL7m796K+qU8FvbkjZ6BwqdB752k5oea5wfviawOyS70LZ1vRIgRsUJ1v0nJQgdnjXmNioWN6D3p//TVHJLy/B/+AMLkn89n9lNYhjnQBtxFDSH6xmUqxjkDtWHXiyP+GfTenkVeCJ0+3dO+8x2IqwywMbphrcRMkPG1voxdcQOIRfaV14y2FI4r7Hus1VR03S+sl3NlBlrsMrq+iFZwcNsDGCOFgocWr9CF906FlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzrA8EUcIt8RcTZHmFIA7oCtGH1K2Pu2y+qtHX4zGX0=;
 b=kt68vMv6Gbv5MYkw8Ol4irGBGqknRFltv6KgVqXZi82xbGeACwghGwuZDx7HQY1dAqIBTF8FDFJwyh6m8gP5jRVjS6S8AKKJGBrn/wukHBtnx8ShnpgOaDVk5Wzp4EKjbkXzNqXJIw3oFzb17LVmguLniEY6jDDwFudNtUHsIPf4yITtA07oRqfogft35TH5KLIyDJNBi9Mc6Na71Hih3eE+/UgF+li4+cxCsgdDTQ2lS50ailX4yfovFSxc1LViO1qABgyCnPSHFCtrhI7V7B7sEfBpm7xLa7hGGeATgoRwig6pZaovc0N9N4NO93XUl3bd0E7o+RV020FePWXBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzrA8EUcIt8RcTZHmFIA7oCtGH1K2Pu2y+qtHX4zGX0=;
 b=CM/xIYL/rwsP1gy+iYvZ0IUfe90pGLC82tNebCTMkDioEUqNHoS9HPo9plAAizGXiEagLDTCykIefIBmQP2cslwIIh5g6cEeEMcC6MwGwujnmbW9w0d2evh94SeZpi7rMWbELziXp+tH17NKkt1T46u+O8X68ZEcXFhidExdL3CvIDYuXmfRvXTNlWw/bJI0Lwc6dkaWYTAKrXuIbTDkqpt2LPxKyfvxQc3RpoC7+WD8/q22bvgs7gdj7Mq/AID3AJL7YylZDz0bgQRcAEy8JFaL3Z5ocxsC55TwVuuVDrHBkuM4HpzXHyNMfwDkEx/AJ1gSCJ6i3AvoqfAQLSZSsw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1572.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 04:44:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 04:44:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc64/kasan: Call kasan_early_init() after PACA
 initialised
Thread-Topic: [PATCH] powerpc64/kasan: Call kasan_early_init() after PACA
 initialised
Thread-Index: AQHZsHLfOkky4mHuhESmRsZPgdoIYa+tklOAgAAoSwA=
Date: Fri, 7 Jul 2023 04:44:50 +0000
Message-ID: <97941853-478b-6363-1e8b-69d9ea71ac39@csgroup.eu>
References: <20230707013110.215693-1-bgray@linux.ibm.com>
 <165bbaa18642d165b3831c84d335b5313bc1446e.camel@linux.ibm.com>
In-Reply-To: <165bbaa18642d165b3831c84d335b5313bc1446e.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1572:EE_
x-ms-office365-filtering-correlation-id: 0ec3fa66-82f0-4661-1ad1-08db7ea4e605
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  cVToHxh6nI2O/O/B7mxgkPJxjYY2HaOTMa5zeL/216ynr0xenmnis1kfMpEjlBX8YQZJissSAbf7faZnpq+8WsSgDxNR4nzW2batTJRspVlnetmCr4fLX78B59o+41a1cHXkKtsL3WOuJxkPGZXeaF/ZQiK8f7e2+nWuj89pALcH5g5AIrxO64TZ/7CptG7kFMuVu7G4NvIEMC/DQOH2FO610XMmjBcXzd5xX/S65LZepDFqpqmYDruosWD81VIfpaDpu32I8qwshy1VGcDiJ+jdQMGxB/qh1ojUSPv4UZormEGhgp3f6S5npKETwH1WMYBxI//ng7qfihNh82Ttw/O8RDjNcQfRqawcH7QhWzOHusL3xX+SCFNYHdwdlD1Hed3TyvC3+K7d/+EycHwDDFQu13XBoXNGutruJIrJdtnfDrSdehvLKqnilXqnqoxrB41IpNJIEeZDdkwaQnbQAkfPtiqHO0s4SUSqY1foH7vgmRXuF7DOdARTw2ScKXsDumXFVCckyHNkNKQQ6VuGHPVc+fNhd0FzNaxz75S8NEI3SRdJpy6zxOMTC/AdvfVOi9yNdp19MllA2yHWIiFJtsA3ncjYtdaed6FM/t0o7YdIl1evioYK8+QvNlRO359DUfcTgMIryo7dsKaGnXIwKfuEvL9SNcooxROs5vqJacpFbQX7woa4WfvhbqqR0ACN
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(451199021)(31686004)(2906002)(91956017)(71200400001)(110136005)(478600001)(6486002)(8676002)(4744005)(44832011)(36756003)(41300700001)(8936002)(316002)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(76116006)(6512007)(122000001)(38100700002)(38070700005)(31696002)(5660300002)(86362001)(2616005)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b0o1c0hicVVFOVBtSFFhZHpaTUI1ZHFXM3VhQjdUMWpiR0praVUveXNxcG5y?=
 =?utf-8?B?QWdQUlJ3dUpObEoySWNTeHlsTTA2MGFyZlhtU2RHOVlKOWNRSVN1UDlSZVJ4?=
 =?utf-8?B?a2JsdmtpMytHcXJhcjBBNEVXMnZONFI3SnowWVhkU0RCMkptZDdIbE9ZaEs4?=
 =?utf-8?B?Qzc5Sm5BTVFaaEJjL3lGcmdNZTZONFRLcE1Lc2gwb1BtNGpyUUxYMUI0OGI4?=
 =?utf-8?B?RmJXUnhHUFk0U0p3c0RFTW8wWnVkSWQ0MWtXR2R2T3FiYjRpd05pK2FaRXNE?=
 =?utf-8?B?aHdoS1o3ZUJyVlJMRWExMDNXbUc1UTl2UGdhQXR2WEFkcUw1SWM1S0NWZ292?=
 =?utf-8?B?MTRuOEc4Y0J3N0ErNjFSVGt1K1VLRXBQOXczTHF5dW5JYWczTjdJd3REM1NT?=
 =?utf-8?B?eVpXMkVSQ2M1bEY1cUtSRU9kSllxZHFOLzd3djFzQkx0Qmg4RkdDYWpjYnB5?=
 =?utf-8?B?d0FHakd3aHltcGdsWms5eDRiZlJZUTBNSVdrTDJyTkpuUEZtdkF2aTNqaWFh?=
 =?utf-8?B?b2thMEVIMFZaWU82bGdkMTg4THlBYzczZmpiNXhabkxRTkRoT1doQWtOUVF3?=
 =?utf-8?B?cnFYbGNaenlBL2l3NFdBWnh1Qms2c2VXamJYaGZaU1pvUkpkOVZFdXQ3bHZu?=
 =?utf-8?B?L3BhckJtdVRJSHkyNGFZZHhsRkFZWXkzY1Z1TkFjeU1aSkU0SXQxL2UycElI?=
 =?utf-8?B?YStlc3FVdXNhbWQ4eitjWXovSm02alJDOTlNb1UyaG90SmI0QUF6eStMdmEz?=
 =?utf-8?B?VThrbkNSWFpnODVaVDVzUkdib0ZrYUY5dDlwQ1E0ZVhQSnVzZVRVZ0JDcCtq?=
 =?utf-8?B?ZUFQcmZaTW1KZ3VRaDl4aVNCUnd0YVR2c2EzQzBMZW40VVNmRlM5YVkvdDFJ?=
 =?utf-8?B?T1RqV0hrNDUzYmVTSU1zSkFUMUJ1Yk10MzJvRENlMUlESHl2emw0T1Jxalpj?=
 =?utf-8?B?NHh4MUtVYWRvUWJBTnVOdmpoaXlXazhXUG9Za2RRa2gwTEU1OXVNb21LWUEw?=
 =?utf-8?B?UklMMlJNY2Y2RUtWWVo5V003Z2dtSElOdDRiT1pQS3V2ZXEwTTNrQjhBN3N4?=
 =?utf-8?B?eCsweXZJOHhNSy90bHEzdkhUMnFGQXVxN0RrNDJNNkQ2UVRwZkF1a1lMbWpw?=
 =?utf-8?B?SDJoYTlZWU5oK0hlWllTWkJ0QlBjUWp4UjVNSW00ZGVNRHdJK2hvQVFEdHI1?=
 =?utf-8?B?dy9iZldvem9HVU1abG5vRXBJNkFUdmt0R2VzcDFHT2tWNGpHZTRmdkdvR0tH?=
 =?utf-8?B?cW5MUURJM0MxdTdVSlQzb0dKSFBSRExRbWx5d3lyTWJud3o1ZndVMXQ5MlYy?=
 =?utf-8?B?bjJkSURXWWtwY2dYbmlUN1hnaE1OUnJiQUNlcVM4d1Y3RzVlZE43L3Z0YWpI?=
 =?utf-8?B?dThEUER6K2VDbXRxenQrcDRLU216cmxEenR0Z0dnZVdzTGtYQWw0QWRJZWtn?=
 =?utf-8?B?UDFjL2t0VlJRWjVML1d5RzFpcmQ2N0RLcjhtejhZSkxDZnFKT1VKeG9jWWRT?=
 =?utf-8?B?WDVtKzErUzBJNURUSFgwSEU2Nm9Eb1Rhc3lFaWFnL0c2TzkvU1hFbDNIR09Y?=
 =?utf-8?B?N2IrallmYWxoN2F0cDFKMlRXdlU5UnB1cDA5OGdjRE1EcVR4d1pBRjBlQjF0?=
 =?utf-8?B?VXRkM0J0NWUvd3FscXUvVm1hbkpaamNaY2o2bks1YzhjYS9PNVk2c09GcXpQ?=
 =?utf-8?B?MTVpTUoxOXF5TEJtRjlGc0orY2srMklzek0rMmd5b1dhbDI2MFphQmh3YUY1?=
 =?utf-8?B?TmVKMGY2ZkQ3V1ZvY2hFQzU4K1FuZkVqamRCb0krbUJoQkhmYTIvaXZXV2hD?=
 =?utf-8?B?ZDNrc0ROeForVS94VU9FZ0NkdnVNck9uTE1EVDR6azUzVDh5VHA3dERyeGpY?=
 =?utf-8?B?bmMyRTdhTG9MdkxMRFVaNFAxNmx2cFBsb2Y4Mkc3bTNZb1VUeFBTNVdOeWxt?=
 =?utf-8?B?UjhDZ05GVE8wRVFuVHR3NHdzSXRzNVBQWWdtSlZRaDhWYmJQaG8wZEwwOVN5?=
 =?utf-8?B?RmwvTDhrR2pmUmttY1FEWDBvTXhBRUlhQkRBRVNwSy9sbElHbUZTWkRuTXZz?=
 =?utf-8?B?ck5VcW5tdmEvYXpIanpEcWtMVFlhNVpTRGxsbWJUTkRzYlEwbWVUNnRreU12?=
 =?utf-8?B?alU2M3VscGVCOXVvRGJ6RElMaml3NlJKS1R3U0haMlY4MzZMNWJSQ0h0OHJB?=
 =?utf-8?B?MTFON3U1S1JFRXgwYmozVUU2cTgrRE40YjhTZ2ZpZExsd1poc0lYY1BrM1do?=
 =?utf-8?B?YkFNdzdQTmhiUURGc2VsSndIL3NBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2CA49334B55F5498DD695C0F98C3592@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec3fa66-82f0-4661-1ad1-08db7ea4e605
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 04:44:50.1501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QkpEJF2LDpww0hX+VJTkNeVq4UAW1KXYE+5ziM3bJPF6pl23SJx2Y4uFKavhyAwD1pG3rF+wq0IozFLyIrV81PoNKtz9tPi2gxXuTNfo3Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1572
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
Cc: "ruscur@russell.cc" <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA3LzIwMjMgw6AgMDQ6MjAsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIGluY2x1c2lvbiBvZiBrYXNhbl9lYXJseV9pbml0KCkgaXMgY29uZGl0aW9uYWwgb24gQ09O
RklHX0tBU0FOLCBzbw0KPiANCj4gICAgaWYoSVNfRU5BQkxFRChDT05GSUdfS0FTQU4pKQ0KPiAg
ICAgICAga2FzYW5fZWFybHlfaW5pdCgpOw0KPiANCj4gd291bGRuJ3Qgd29yay4NCg0KU2VlIG15
IGNvbW1lbnQgb24gdGhlIG1haW4gcGF0Y2gsIGp1c3QgZG8gbGlrZSBrYXNhbl9pbml0KCkgYW5k
IG90aGVycyANCmluIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9rYXNhbi5oIDogRGVmaW5lIGEg
c3R1YiBmb3Igd2hlbiANCkNPTkZJR19LQVNBTiBpcyBub3Qgc2VsZWN0ZWQuDQo=
