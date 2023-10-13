Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4FD7C866E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 15:13:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OFxjv9zI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6RlW0Xclz3vXX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 00:13:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OFxjv9zI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::604; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Rkd5sRjz3cPN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 00:12:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2OK+AoNd9bv0q6d8dwCfaaCSJ+seBu7TEdVrRJfXEnS86En1s6W09kdoMAxpQy78HSz8yuTJ4ln51QGL70Su3CFRW8Jr8ZduvupwS/UWoNdp2RDX/vFXwumwvh7+eDD7bTtG4RsCO53B8/XzFCL8PbTkEQ+z2XxMvjbOimeyZtWkp4LZT6K4tp4W6YaSddCXIx4kbouYa0GCCHGPD6RBudjVF9/ToownUqpp+Bwqq5OIUn797eYI86yMDAim52w31ImdB+sI9Fa9nPqlyJLbUgwPKXCANFixuiqEejdByyWTZXfDOWv9sg30J65Ty1k1JcKGuORieI9oo/7trr2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=970t3Rea2WdceyFmA728fi1xdO2BFCJiagrPw0h8Pgs=;
 b=Wyfr6/wXI1foBiK4Uyl3KBNcCgG8XoQh9n6/C58Jr/nEqi14/uxGiJNdznU752395rihlPLQUhef+jUSHDNrHYKJ4ybAxzsQjP8vIcu8xCsYVYnQUwwiHfm/zwxVTin5Eoy9xLHAAUiLg5ECKgp+ZNF4WFB1+dJ6hkNx0LXqAYlsBf/l7hvKz0fGnn4s3cH3om/dxo41hQOGGTnGynbPtgHZhOmQlMIy684MU+C4GYTOQpayj+orxXe0H4WIW1Yrl9eZsCNweGu3C1teJlijdMW2tC1giUF2uT/7Pk6DONLCtlPNDYaXNw9z7Ft38Bb65i2LP2OJZIqmJ9TvM0FRPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=970t3Rea2WdceyFmA728fi1xdO2BFCJiagrPw0h8Pgs=;
 b=OFxjv9zI+fP3ZBZz07BZ/Tix8HH73P6srRjL/vY9RUhvRLmuZpXadKj5vCLt/1cLVMHeSVt+Tc0igzHyA9PkzphmRV4zIyWo2kWKzhpfTETwBxRl/pM1ssXISXXCptAtAlCF7BT7Y4ELiomMXTjQZ61AI+Jj8zc/XGWmh5slhrQbhAYDCJR9xU4jZSAehVqkqY47cmfMeT9Ca+0NcUBjyAlGUjSMF2a0r26YF55NznbSL+1xX8nyBGsEzwzup+i2nBLKgTFi4pr/hgTbpYiREwc++Mqe7lXcLMMi5u/kZ4mvZhstcgzwiFNu1V2KfprK3vzq0qBtL8hbBgA2WCgRhQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1764.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Fri, 13 Oct
 2023 13:12:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049%3]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 13:12:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [PATCH] lazy tlb: consolidate lazy tlb mm switching fix
Thread-Topic: [PATCH] lazy tlb: consolidate lazy tlb mm switching fix
Thread-Index: AQHZmNrsV5yY1621qEOujHduAOEuGrBIfBUA
Date: Fri, 13 Oct 2023 13:12:22 +0000
Message-ID: <340b4d49-df81-05ad-3753-c1e60ec0df06@csgroup.eu>
References: <20230607005622.583318-1-npiggin@gmail.com>
In-Reply-To: <20230607005622.583318-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1764:EE_
x-ms-office365-filtering-correlation-id: 04060da7-5ade-479e-a55f-08dbcbee0974
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xBk2o+XWq6KbLb4Qlb6Rkt17jDaj3dm9FyZJFdEEylZqml7oF4xzvDuFuUr1BamPl1zWB4pXyCVAU4AvmDp1lQl6b5J/WGD7XE5rBLfvaM8hbLjy/CkKhcSh/a+GgPZaAKFnJxcEPXuh9o3+Byv0K/eofAJ73HtjAUCNwNm5Ko8E1G1s6qW3NuLr1vD2DqV8EvIDbl/qwh54PZCluML4lhpoUMee9JDeCdalgFkyWupgkdQA5hL9I+Pvbbr6d58bpF+MIybzIgw6/YLX0fJN/i/uN117uMF3wmKGKkaD9neBHazdH/3qXs8SGThK++AN9c8RC7kcSDNj9JBr9VNsw+9c0+CNjmepZZyO7114GiRi40wXCzWpa9SBvgFN2aifjM0kB+QI+FJWA1QtE5WG8y80UfBf4qGtE84IMnilvHxUX8Jhtsp2Gxll9I6cqA2Qg5drnZRfuanM+Fgyg9f852UvxdAyq5t6lZBo6xpgntq3oaDa8sa5durePzmvkeRppoNQu/kuS44PaVlGQ9Ja3UrglzZ2IXj1LoORVERMyTPqIuxM1+NNsXXZiXX1fHYCA3x77CaDtPrOuUPWjpNxf/fsNtqiOrYJ+ll0g0xg3DopDaRMLu3Q6p/ajk2eCe2vNFbJowX8dYpZl4nncn84U+bEutkaI5Up+BHxcqTyUeU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39850400004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(122000001)(41300700001)(66476007)(66946007)(76116006)(8676002)(4326008)(31686004)(66556008)(8936002)(2906002)(71200400001)(6506007)(64756008)(54906003)(66446008)(44832011)(5660300002)(91956017)(316002)(110136005)(6486002)(966005)(86362001)(478600001)(31696002)(83380400001)(6512007)(66574015)(26005)(36756003)(2616005)(38100700002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cFNKQ2xvV2IyQUQ1MXVoUjZMUWw2TjZKV0IxZUxsclQyRDR2MHpYYjAwSExI?=
 =?utf-8?B?WTd3cnBVeDcwSVUvcXdkcDlsRFJabjFSeS8yWU5MS053QzdVZzhMTnVQU1l1?=
 =?utf-8?B?cnNmYzBJcVJJMWdXc28rdDFqbkRGYnMwenF4NEFhbytlSjYvaCtwTnBvUCtW?=
 =?utf-8?B?L2p0K29HZzBCMEVRNWM0RzdDMjFkOU5XSjZwcFBCSnFoNmd0Ui9wRkJaQnFN?=
 =?utf-8?B?eHVNWklLV3lRZ1hsMTJIVitBbTkxbGN3YmlqY3JGSk93OFJQOGJkcEZtSHg5?=
 =?utf-8?B?dWpLZTlzYmw2Tkg5bFpTSk1BbHMvanl3WFBKRDVNcGpFYlpUaVVwdnpZNndy?=
 =?utf-8?B?WWpHelBGcGM0dmpTRkhTeTBDYUF4em9aSGxLUU9IM1hPRHhJUnY0VnhUVHd6?=
 =?utf-8?B?U1R3OUVrVWViWGtBUHo4RzlYSmZoazg5R0xpT2NaRW10RkQvNmdnUkFoSVdw?=
 =?utf-8?B?TVhuaklhZUlUY0g3TENrQnA0Q0hjb3p0Q1RzcHpEYUpXY2JnV0R6SWdVNzhV?=
 =?utf-8?B?aFIyV1g3anFWZjFyYnVYNDErSHB5RUVOZE9PK0Naem13UDhrM3YwZTlUMFdp?=
 =?utf-8?B?OE5SVmhKb0E0YS9VZUdEUzByTnFYZVRhM3dCRkNSeFdjVlVUaXQwWjNrYUpP?=
 =?utf-8?B?T0VSc25Sc011MEoxNjFIYTU2Q2hLNkZtK3lsbURBR0ZWaXU2cUIxdDdHTGVH?=
 =?utf-8?B?R0dMWXZnNW82eXRyTUF5OWp6UXRTVnh4SHF4L0s3S0VuYmp0YW5NTUFFWE4z?=
 =?utf-8?B?b0VvQmRvbUZGYUp1Tzk4aWpwam9ScktGUEozUG83WGdtT1l1YXNXV2Y0MHNH?=
 =?utf-8?B?QVFqV1VnQi9NQzcvNkJ6Kzd2ek9ZK2RmNkF1OFczQzZ1WkRsTTQ0ZW5uLzJV?=
 =?utf-8?B?SWFaYlZQZkp4ZC9PSEQ2aXFsRVZHSllMRWdRSmJnSmpxRWJaUktZSERTY3NL?=
 =?utf-8?B?NXJOS1FLTlJyTEs4c25veWg3eVJNTEtnTG9oU240QnNHODV6T1M4Zzh1bFY1?=
 =?utf-8?B?QURKMEhZcjM5RklIZTJZNHVDMWt6WkwveVBIeFVFTnBNRHZsWCsrZSs2M2x1?=
 =?utf-8?B?SUkvdCsvUEF1dkVPYkVYSDBHcFBWbDhNYUlwNXhBMmpCK3B3Ti9kY0hWWFVJ?=
 =?utf-8?B?K0dEUmhvWm5paEpQTVRQZFhMRlFoL0dxdWJ5dW51cDhhbmRtNWZPdnRVeC9x?=
 =?utf-8?B?ampJK1NwRFV2TTQxUmY4SWNhUzZrSTFPeFBGWWhCd0NMNzl5cnpZbEFBNUFP?=
 =?utf-8?B?NWt4czBseGdoSXc3ZmFxeER4NTNEaHBtZFhRMVlOdDFucDVBYXA2K0tTSFJm?=
 =?utf-8?B?NEptV21RS2UwcUtJYjhOSXZ2NTMwZWdFZG40UkY0UzVHK3hRbUROajVhcDRN?=
 =?utf-8?B?WC9helBjSEtOQ000Wk5neVBvTVZqdmJTRnVaL0Nzc2UyQlNEemNDdkhNajFu?=
 =?utf-8?B?S215SDVadUdsZXI2TjhLNHJ0U2Ric0I0N1dQbllxNlAyY2dZcGdJWkEwemp1?=
 =?utf-8?B?dUdicTJadjBNMVdsZXd6aXFyaXJiSVJrZWhOeVQ2cTVGZXRZMWt3NXdzZ0Yx?=
 =?utf-8?B?Zy9QRFZ1VDJyM0FFZFZnQ2prcVlrQk84RmxpdkFwOUorSU50TGlJeUNsaUQ3?=
 =?utf-8?B?a0wyeExnZUVORVdiY2tRMEpSN3Z1WUZGNjBoSXVOWTN6djd3YXU5SVlRNEQy?=
 =?utf-8?B?aWJGQy9tYlF0SFdQb0g1VDZhSkUzQkRpdmlPT0V0MmFDalZmYWhhN2diM3ZO?=
 =?utf-8?B?a0pwejA4SHRzMWxzUmxMN1g3RDF2WWN6WVAzcHU0MzdjRVlGYjUrWTk4Q2xP?=
 =?utf-8?B?c1JmcnppdE5TNWM4RFFJTWpkM1IrRjhkcTVTYlBTUmRBMC9SUXdCa2pTVlhY?=
 =?utf-8?B?cGI3T25xclZHeG5lNk9uYXBZV1hkRENReEZaeWpjMjJocUVsdTA5M09FaGs5?=
 =?utf-8?B?WkRjRWdnVUZNbVNCM1lveEtxTzNoM0hxcW5HOExJdVR2c0QvMXN0QjVjQ21v?=
 =?utf-8?B?RXh4dFNaWjBQSjltUGtJeXpXaHV5YTRTNDdOQlBJSzFiaHoxbStTbHBwVmVH?=
 =?utf-8?B?YUpPYzJtSFYvSTMwL1NZNHplbFhqT2FVeERibHY4Q3BQaCtGQ2hmTTJ0Z0lJ?=
 =?utf-8?B?R2pTeklPNjJrQ25aTS9NZFdCTnpKY0xzS3p6RndhV1pHNmNGQ0JqTlU5SGRr?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <808F4496DA1EDE42A814174AB9513DA6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 04060da7-5ade-479e-a55f-08dbcbee0974
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 13:12:22.4020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUb6l8L76hRC5yUGc/WMCbxPn5QclhmFypqP4QWuxRgrDnuVda4B9CGvEAYqJVCMOJmFptzcD1rqjfswE7Yso9q+y2dYtaWdfgckiP7Yk4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1764
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA2LzIwMjMgw6AgMDI6NTYsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBGaXggYW4gdXBzdHJlYW0gcG93ZXJwYyBidWcgdGhhdCB3YXMgZGlzY292ZXJlZCB3aXRoIGEg
V0FSTl9PTiBhZGRlZCBpbg0KPiAibGF6eSB0bGI6IGNvbnNvbGlkYXRlIGxhenkgdGxiIG1tIHN3
aXRjaGluZyI6DQo+IA0KPiAgICAgU3dpdGNoaW5nIG1tIGFuZCB0aW5rZXJpbmcgd2l0aCBjdXJy
ZW50LT5hY3RpdmVfbW0gc2hvdWxkIGJlIGRvbmUgd2l0aA0KPiAgICAgIGlycXMgZGlzYWJsZWQu
IFRoZXJlIGlzIGEgcGF0aCB3aGVyZSBleGl0X2xhenlfZmx1c2hfdGxiIGNhbiBiZSBjYWxsZWQN
Cj4gICAgICB3aXRoIGlycXMgZW5hYmxlZDoNCj4gDQo+ICAgICAgICAgIGV4aXRfbGF6eV9mbHVz
aF90bGINCj4gICAgICAgICAgZmx1c2hfdHlwZV9uZWVkZWQNCj4gICAgICAgICAgX19mbHVzaF9h
bGxfbW0NCj4gICAgICAgICAgdGxiX2ZpbmlzaF9tbXUNCj4gICAgICAgICAgZXhpdF9tbWFwDQo+
IA0KPiAgICAgIFdoaWNoIHJlc3VsdHMgaW4gdGhlIHN3aXRjaGluZyBiZWluZyBpbmNvcnJlY3Rs
eSB3aXRoIGlycXMgZW5hYmxlZC4NCj4gDQo+ICAgICAgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXhwcGMtZGV2Lzg3YTV4Y2dvcGMuZnNmQG1haWwubGhvdHNlL1QvI20xMDU0ODg5
MzlkMGNkOWY5ODA5NzhlZDJmZGVlYjg5YmY3MzFlNjczDQo+ICAgICAgRml4ZXM6IGE2NjVlZWMw
YTIyZTEgKCJwb3dlcnBjLzY0cy9yYWRpeDogRml4IG1tX2NwdW1hc2sgdHJpbW1pbmcgcmFjZSB2
cyBrPg0KPiANCj4gSSB3aWxsIHNlbmQgdGhhdCBmaXggdXBzdHJlYW0sIHdoaWNoIHdpbGwgZW5k
IHVwIGNvbmZsaWN0aW5nIHdpdGggdGhlc2UuDQo+IFRoZSByZXNvbHV0aW9uIHdpbGwgYmUgdG8g
dGFrZSBha3BtJ3Mgc2lkZSBvZiB0aGUgbWVyZ2UgKHdpdGggdGhpcyBwYXRjaCkuDQo+IE9yIGRy
b3AgdGhlIHBhdGNoIHdoZW4gaXQgY29uZmxpY3RzIGFuZCBJJ2xsIHJlc2VuZCBpdCByZWJhc2Vk
IG9uIHRoZSBmaXguDQoNClRoaXMgc2VlbXMgdG8gYmFkbHkgY29uZmxpY3QgYXQgdGhlIG1vbWVu
dCwgaXMgaXQgc3RpbGwgYXBwbGljYWJsZSA/DQoNCkNocmlzdG9waGUNCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAg
YXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3RsYi5jIHwgMTAgKysrKysrKysrLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfdGxiLmMgYi9hcmNoL3Bv
d2VycGMvbW0vYm9vazNzNjQvcmFkaXhfdGxiLmMNCj4gaW5kZXggOTA5NTNjZjlmNjQ4Li44ZDcx
ZmU4ZjVjZGIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF90
bGIuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfdGxiLmMNCj4gQEAg
LTc5NSw4ICs3OTUsMTYgQEAgdm9pZCBleGl0X2xhenlfZmx1c2hfdGxiKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLCBib29sIGFsd2F5c19mbHVzaCkNCj4gICAJCWdvdG8gb3V0Ow0KPiAgIA0KPiAgIAlp
ZiAoY3VycmVudC0+YWN0aXZlX21tID09IG1tKSB7DQo+IC0JCS8qIElzIGEga2VybmVsIHRocmVh
ZCBhbmQgaXMgdXNpbmcgbW0gYXMgdGhlIGxhenkgdGxiICovDQo+ICsJCXVuc2lnbmVkIGxvbmcg
ZmxhZ3M7DQo+ICsNCj4gKwkJLyoNCj4gKwkJICogSXQgaXMgYSBrZXJuZWwgdGhyZWFkIGFuZCBp
cyB1c2luZyBtbSBhcyB0aGUgbGF6eSB0bGIsIHNvDQo+ICsJCSAqIHN3aXRjaCBpdCB0byBpbml0
X21tLiBUaGlzIGlzIG5vdCBhbHdheXMgY2FsbGVkIGZyb20gSVBJDQo+ICsJCSAqIChlLmcuLCBm
bHVzaF90eXBlX25lZWRlZCksIHNvIG11c3QgZGlzYWJsZSBpcnFzLg0KPiArCQkgKi8NCj4gKwkJ
bG9jYWxfaXJxX3NhdmUoZmxhZ3MpOw0KPiAgIAkJa3RocmVhZF9lbmRfbGF6eV90bGJfbW0oKTsN
Cj4gKwkJbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOw0KPiAgIAl9DQo+ICAgDQo+ICAgCS8qDQo=
