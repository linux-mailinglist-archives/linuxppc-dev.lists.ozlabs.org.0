Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACD25A9064
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 09:34:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJCVK2HR0z3bYM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 17:34:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Ai5SU8lK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.71; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Ai5SU8lK;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90071.outbound.protection.outlook.com [40.107.9.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJCTV5yvZz2xG7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 17:33:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTGClLMjFyNcLwbV4wZcI+mf35sj/5/igb7Ne8pEmfxtdy4zikXpxNPfcJGQaFPmzmKAGcTRceF+Tj5hgtAWoUvQB1R87a3t1NZQe09ShfCdmUZ/ImjEoqLIggfHR46SPwNYC47Yf27xK7cdKQrrfdW/g84So7vxFt2znmMdzvasvMUcdH9NRukcPb2tx8CpQ61VLo3Cv0u19McIZteAvWnf1uGJxq6uGh+4DDuuiHF5J780NfNquTVucydWwHjj/7v+cIctW7PNC7Br3Q5HMmaXf6+aQ1ilCioTKmXiprnQOOKpjt6yBj9H/OSMR143Vsl9ha75+eMm5rR8qPGmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjKJ0fVQjfbKbyqxjtEcFWf+eKZ611GW1TI/5oXCPL8=;
 b=MuKiyFTNDzMQAL0WdGtRDKDAsnRnJBtKAYxhXsujkM0dRlvyH20HY5FOeqGuS8sBCGRuSFtrCLqtcJTbSALxyGXjGcPMvFQYxwRb5nmVloda5hljcI9cfyvgRlKfBPR8Vb8mqYinHzvFwRZ2nBmJlLRrYygOLESQtjH98CApX3VZkrDyJoplBTNlXv+UqCO6Qax9ZleVefv/ttFV8i10BK0tJkOroRhvtce70zAqQ2e3rJDV6KzWrKoopVIpbu5fGWrlKIyYh1LM/teGktaHzgmGpjkF+r4pnNa65ectP6NwXNSPZcxgCAQsHV1o88Vc4m7Pzb9QP0UrKMrK30fN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjKJ0fVQjfbKbyqxjtEcFWf+eKZ611GW1TI/5oXCPL8=;
 b=Ai5SU8lKjmGw8+kg33P/axO8MyUKXo35GSVuTG4+C0kWYKluIwh7/rrkIKBeoiBP9drtqBEP17t0Y0YP2lbejgjEIW+BA+XTlT1g9FA9e1GW7d8L9znNHeb2K5QAG72NgH594Vj7mlMQXFeXezaFy/8Cxttlu3qqs7dtjbK4vRx+I/mcpHjORz32y2lJRTC+hWqDKId7f70W1OqMS7F5hdK2c/Tqjhf0tvli8H3lnp1yx1yQ2X/6a86WObm5OvBSxC+gaLxpM7LS4k4Fe5eJt+eH2e74Qyl+1y2P3maY5wjUgzDPhDli4iUfNoF06i+zfe1o4sVyKfqvM5raXzjbZg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 07:33:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 07:33:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 3/4] powerpc/64: Add support for out-of-line static
 calls
Thread-Topic: [RFC PATCH 3/4] powerpc/64: Add support for out-of-line static
 calls
Thread-Index: AQHYvcfiYNI1RnUhi06pyz9nNFj/Ua3KLq2A
Date: Thu, 1 Sep 2022 07:33:28 +0000
Message-ID: <68601688-8b19-252e-57d7-da856d6b9bca@csgroup.eu>
References: <20220901055823.152983-1-bgray@linux.ibm.com>
 <20220901055823.152983-4-bgray@linux.ibm.com>
In-Reply-To: <20220901055823.152983-4-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c44482fa-48b7-4150-ce66-08da8bec4385
x-ms-traffictypediagnostic: PR0P264MB2009:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /qp23x3NWuR2xYDjQMr+GzrJot6no0HeJYnQ0hPGs+CKINmXvhsBgzv++usdqQ/Ez/0Vq1aBtkfA7p8jBFjeCM/vBNXpDRFFhIrS3Wg/BzklXhG2Ou0mMPUQnsoSRGfL27BEc4OhS9+CHqMLZ5plC7L+wyWfB5XXIz/RxcKsl23NZzaNzU4du+g99kGUX8X0ZgxKWzXpmOPe56V8VrJGp1H3USS7OwcDM4ggQSPk81htEtpeqJG2icAmOgyYkYFQLr5Xz8uBWIY4HkG1z16IQjaEu6XKqvFXUw0CBni0XYjUmwEtoJFIbwBA60nCg2deBb9kr7AP3iEorZow3LSYFkxib+kk6jPwmHWcb8igly3kYiTqdlKoxkpVaUAh1JAsRwDoaPUhTQWOcCULOI0eXJKRr4Gy70FugpRkUUTYcZ5yTInNqMQLmlcsBrsyREw+jzhgOyBkNfN+ATC7yc6Ooz4ZNT8N1ZKE41QZ1Cx+iwaAnzYdUfLMKkIJCa5dxEs9JysCC+ERYY5gPZC+IfWUBXw96bdLOJlDa40U+TPiYrxQhbPS6DaaY2HH5WfPgdvxoilyTKQq4wRTU4KThxDGZtWzypiyx9B9IALcSly7die6q07leatSmXSpEgYsgxCedxjEF1EtPDIfg39LqStTuyWeUkAUoWBwl38+8KU7GdecWfw+0x2UQQyFg1IBB/SwnLur2J1LWqk2gcReqc4tWENMDEJpb9WRxOhmxLAR2xzjL7IIiks3UxYBlJWiTTPtv7pi8l+Rap5YiMoUQe5t3+uDOnlolRz3WROipR3nFZXADXoMVr5bqraSgFrRhwvJR72CI8kWwYva2zhTfe+x0Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(136003)(39850400004)(346002)(66946007)(76116006)(91956017)(66556008)(66476007)(8676002)(64756008)(66446008)(30864003)(4326008)(44832011)(31686004)(36756003)(8936002)(7416002)(5660300002)(71200400001)(54906003)(316002)(2906002)(110136005)(966005)(6486002)(478600001)(6506007)(41300700001)(26005)(6512007)(86362001)(186003)(2616005)(38070700005)(66574015)(83380400001)(31696002)(122000001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eGJyWTlsUGN0UHJzRm4rakNtRlgvZENnVnRZWXhLNE0yWi9nYUt4bEUwN0x2?=
 =?utf-8?B?YS9DNFF4bDVobVdkZVNKTEZNNmdyNUphV0JSU2xWalN4QzVVNXRnNVB0aUNk?=
 =?utf-8?B?NSsrT2draTkxa1huTWZvN0xRZzl2cDk2MVRpZ25RcTVNVXRFTGZDWjhnWHV6?=
 =?utf-8?B?ZUF0cSszbDlQRjNRekN3Zi82SGZEZVN0NjJYc1U2QlhuMTAzWUNGVG9Md2t2?=
 =?utf-8?B?UDFHc0IyME0zeGp3aFNPWE5UTDdOOWtlOEFBRlR2cjZMU3hiK2UrSXhHWE95?=
 =?utf-8?B?M1RiR0dqYlBDYUsrbkprZmxac2R4TS9jdzR5OHB3QVpteXd5Zm9pNTQzaS9i?=
 =?utf-8?B?NDd5cThscmVOS1FISWhUR3RhN0E3NzM2NDgvR1dhK2JmeDZwQTZVby93Q2pi?=
 =?utf-8?B?U2hFblFBanFaenBYTmhpampZb29haUcxVUhvWTByKzVPYm1kUHpZZzZQUFVo?=
 =?utf-8?B?VXFXejBlOGxFc0JtR0hpS0t2cHBwNDhMc0pqN2dmMzJyTXhEWkpGVDd2YVhH?=
 =?utf-8?B?eStGWWhFSkQrbFdDV1BTcU1NaUNXbHdaUk1YRk56RXlsRHMvREZHbzM4Rk9y?=
 =?utf-8?B?MExKRU0wWGx0OVdmd1dIUzV3N0hrMnpJS0VwQVBXdW9OK0ZlcWVDR2dDcmVi?=
 =?utf-8?B?aHpFUmNaN2hpeVN1NS8wTjVkZnZ2YngwRUxLZThyVjI3R3hsSk5qRE1wZTRS?=
 =?utf-8?B?YzlqOHNzR2lVNGZ1V29VNEY1LzJNQi9pTmpjUGpxRUFtdWY3RjNkbVRvYkUw?=
 =?utf-8?B?OWVDZkpkUFRWWmJ0b25iU1JFVUhWN3hKeUYwcnpReWpTbnBlazQrS0Myc1NW?=
 =?utf-8?B?bzNaNFlKMVFXVnBEblBFZk9ncHl1Y3E0K3dOdlYxRXNPM1Q0Zk5MUkhPMGFL?=
 =?utf-8?B?K2o4b3dQTkZDMzladllhV0J0ZVkyYWdDU09HY1hDUlVmMks2cjNEZTVoTG1m?=
 =?utf-8?B?Z245Q2wwV3c4RlRQTDJQOXlQOWlkQzNScnhoU01WL2MxUm1QTWd0S1pvY0VP?=
 =?utf-8?B?M1VscWlxUzRvalRjN2MrOXo1U0E1UFdYd01WU0lwbHJJRjcyOWpaYmJLWGlW?=
 =?utf-8?B?andkQUZORGtzd2RVSmRJL0svYmVnSVpKV3dGS0NtOEhocG0wbkRZOWhYMWhU?=
 =?utf-8?B?RVdKckkzNW0vaGprc0xpbkx4bE16d0o4Z2pNOFhMTWF1alBWZnlnaW4yQm1M?=
 =?utf-8?B?ZWF3ZVRFMGVCc3crcDlScURNV0xCNTB2TFVnUlQvV214a3JzaDEvbUV1RStT?=
 =?utf-8?B?TFJYRmphN2VSUFpNTWVTOUpJaHJ3c2Z4U3ptTXhZblV2NXpUSFM5MGx2QTVm?=
 =?utf-8?B?KzZVYVZtY3NWVjFMOTd6YWliNnpZc1NtKzN4YVlTSExKV0tnTjNyM3dldE1n?=
 =?utf-8?B?aWQ3ekQ3TVJ6YzY4cUxYNVV5V1FuYkNWWEh6OTFRK1UrYzBrbjhoWkxNcVlR?=
 =?utf-8?B?ZFVaRnllbktqZlpZUVFyVjBzSXFCaVZFRWxxWDUxalZJb2V5SjIzQkJHYlBF?=
 =?utf-8?B?d0dLYklNdGlFT3ZEcGE2WFQzZS9UVmRGMGV0TnpPWS9Ga3NWYmNCYk1MMkY4?=
 =?utf-8?B?ZWVpMHFIbVl4ZEhkTzczUnlGUncwZzdHTm9VUGh2L3RyRUE0eG9LWTdjNmFE?=
 =?utf-8?B?VXhsRUNiV2Y5bW1GTzRWbTY5Wm5jRWcyVUNzQi9GTDNsL0ZzNWt5Zno2Q1Ur?=
 =?utf-8?B?Mlk3MzFJdVlMUkZ3b0xpSUJnK3NVMEd6RUs3THplblFaOTlQRDIwVXpMRklR?=
 =?utf-8?B?K0JQcWxoUTdSZVBTQmlTYXVtekQwRlJ3ekhaQmZPS1lTOC9CRUdaK29qN1dX?=
 =?utf-8?B?aENjSWhIRC8ycEdkd0JvZi8ySzJYYStwQlJaNmgycU51VDJ3MzNxRTRmSEhZ?=
 =?utf-8?B?MHpIVEY5V0lid21kcndncy9zYnc2SDlQRitsNTFBV3N5N2M4bjlaZVNyZmNS?=
 =?utf-8?B?Q2VqTXk1eXhKTGJ1VUFMZkxoN2QzN2dIRlNBYWZVTTB2MlhlVnU2c2tsQXRm?=
 =?utf-8?B?Vm0rTkkvWVRzS1E3WVB1R1J0Tkx6YWR0NWhDR041SEdQVm1KVXc2YnhZeUFm?=
 =?utf-8?B?Wnc4NUt3djNJWkMrYVRCc1FDeVNBUFloRDFzR0dKMExELytXa24yc2IreWVZ?=
 =?utf-8?B?UndZMlRrZnlMWnlFbE82eSt2L3VWS3dDKzFkdnZYenlWT214TThGQXM2UkRi?=
 =?utf-8?Q?lf2b+Srl3A2ArQ77A76SDww=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D0337A12520954A90B686C7B3C55EB2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c44482fa-48b7-4150-ce66-08da8bec4385
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 07:33:28.7419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltTY752u7+KyZMMl4R+BKkt+oL6xEFGcU0xjV919TFbrZQlc0H6ngl4iH2g9qiBUfifRuJ4pGxeTOaB0QC9d1uT+p+BjFsftm7+GCRmVv7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2009
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjIgw6AgMDc6NTgsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
W1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgYmdyYXlAbGludXgu
aWJtLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0cHM6
Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IEltcGxlbWVu
dCBzdGF0aWMgY2FsbCBzdXBwb3J0IGZvciA2NCBiaXQgVjIgQUJJLiBUaGlzIHJlcXVpcmVzDQo+
IG1ha2luZyBzdXJlIHRoZSBUT0MgaXMga2VwdCBjb3JyZWN0IGFjcm9zcyBrZXJuZWwtbW9kdWxl
DQo+IGJvdW5kYXJpZXMuIEFzIGEgc2Vjb25kYXJ5IGNvbmNlcm4sIGl0IHRyaWVzIHRvIHVzZSB0
aGUgbG9jYWwNCj4gZW50cnkgcG9pbnQgb2YgYSB0YXJnZXQgd2hlcmV2ZXIgcG9zc2libGUuIEl0
IGRvZXMgc28gYnkNCj4gY2hlY2tpbmcgaWYgYm90aCB0cmFtcCAmIHRhcmdldCBhcmUga2VybmVs
IGNvZGUsIGFuZCBmYWxscw0KPiBiYWNrIHRvIGRldGVjdGluZyB0aGUgY29tbW9uIGdsb2JhbCBl
bnRyeSBwb2ludCBwYXR0ZXJucw0KPiBpZiBtb2R1bGVzIGFyZSBpbnZvbHZlZC4gRGV0ZWN0aW5n
IHRoZSBnbG9iYWwgZW50cnkgcG9pbnQgaXMNCj4gYWxzbyByZXF1aXJlZCBmb3Igc2V0dGluZyB0
aGUgbG9jYWwgZW50cnkgcG9pbnQgYXMgdGhlIHRyYW1wb2xpbmUNCj4gdGFyZ2V0OiBpZiB3ZSBj
YW5ub3QgZGV0ZWN0IHRoZSBsb2NhbCBlbnRyeSBwb2ludCwgdGhlbiB3ZSBuZWVkIHRvDQo+IGNv
bnZzZXJ2YXRpdmVseSBpbml0aWFsaXNlIHIxMiBhbmQgdXNlIHRoZSBnbG9iYWwgZW50cnkgcG9p
bnQuDQo+IA0KPiBUaGUgaW1wbGVtZW50YXRpb24gaXMgaW5jb3JyZWN0IGFzLWlzLCBiZWNhdXNl
IGEgdHJhbXBvbGluZSBjYW5ub3QNCj4gdXNlIHRoZSBzdGFjay4gRG9pbmcgc28gaGFzIHRoZSBz
YW1lIGlzc3VlIGRlc2NyaWJlZCBpbiA4NWJhYTA5NSwNCj4gd2hlcmUgcGFyYW1ldGVycyBwYXNz
ZWQgcmVsYXRpdmUgdG8gdGhlIHN0YWNrIHBvaW50ZXIgKGxhcmdlIGFyZyBjb3VudA0KPiBvciB2
YXJhcmdzKSBhcmUgYnJva2VuLiBIb3dldmVyIHRoZSB0cmFtcG9saW5lIG11c3QgZ3VhcmFudGVl
IHRoZQ0KPiBUT0MgYmUgcmVzdG9yZWQgYmVmb3JlIHRoZSBjYWxsZXIgdXNlcyBpdCBhZ2Fpbi4N
Cg0KQW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBhcyBpcyB3b3VsZG4ndCBoYXZlIG11Y2ggYWRkZWQg
dmFsdWUgDQpwZXJmb3JtYW5jZXdpc2UgYmVjYXVzZSBvZiB0aGUgYWRkaXRpb25hbCBzYXZlL3Jl
c3RvcmUgb24gdGhlIHN0YWNrLg0KDQo+IA0KPiBTdGF0aWMgY2FsbCBzaXRlcyBhcmUgdGhlbXNl
bHZlcyBzdGF0aWMsIHNvIGl0IGlzIGZlYXNpYmxlIHRvIGhhbmRsZQ0KPiB0aGlzIGJ5IHBhdGNo
aW5nIHRoZSBjYWxsc2l0ZXMuIEhvd2V2ZXIgdGhlIGxpbmtlciBjdXJyZW50bHkNCj4gZG9lcyBu
b3Qgc2VlbSB0byByZWFsaXNlIHRoYXQgdGhlIHRyYW1wb2xpbmUgdHJlYXRzIHIyIGFzIHZvbGF0
aWxlDQo+IChldmVuIHdpdGggYW4gYWx0ZXJuYXRpdmUgdHJhbXBvbGluZSB0aGF0IGRvZXMgbm90
IGhhdmUgYSBzZXBhcmF0ZQ0KPiBsb2NhbCBlbnRyeSBwb2ludCksIGFuZCBzbyBkb2VzIG5vdCBp
bnNlcnQgdGhlIGFwcHJvcHJpYXRlIHJlc3RvcmF0aW9uDQo+IGF0IHRoZSBjYWxsIHNpdGUuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHcmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPg0K
PiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgMTMg
KysrLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmggfCAgMSAr
DQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3N0YXRpY19jYWxsLmggICB8IDQ1ICsrKysr
KysrKysrKy0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgIHwg
IDMgKy0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3N0YXRpY19jYWxsLmMgICAgICAgIHwgODAg
KysrKysrKysrKysrKysrKysrKysrKy0tDQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAxMzIgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBpbmRleCA0YzQ2NmFjZGM3MGQuLjFk
NWFiYmViMmM0MCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL0tjb25maWcNCj4gQEAgLTI0OCw3ICsyNDgsNyBAQCBjb25maWcgUFBDDQo+
ICAgICAgICAgIHNlbGVjdCBIQVZFX1NPRlRJUlFfT05fT1dOX1NUQUNLDQo+ICAgICAgICAgIHNl
bGVjdCBIQVZFX1NUQUNLUFJPVEVDVE9SICAgICAgICAgICAgICBpZiBQUEMzMiAmJiAkKGNjLW9w
dGlvbiwtbXN0YWNrLXByb3RlY3Rvci1ndWFyZD10bHMgLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQt
cmVnPXIyKQ0KPiAgICAgICAgICBzZWxlY3QgSEFWRV9TVEFDS1BST1RFQ1RPUiAgICAgICAgICAg
ICAgaWYgUFBDNjQgJiYgJChjYy1vcHRpb24sLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQ9dGxzIC1t
c3RhY2stcHJvdGVjdG9yLWd1YXJkLXJlZz1yMTMpDQo+IC0gICAgICAgc2VsZWN0IEhBVkVfU1RB
VElDX0NBTEwgICAgICAgICAgICAgICAgIGlmIFBQQzMyDQo+ICsgICAgICAgc2VsZWN0IEhBVkVf
U1RBVElDX0NBTEwgICAgICAgICAgICAgICAgIGlmIFBQQ19FTkFCTEVfU1RBVElDX0NBTEwNCj4g
ICAgICAgICAgc2VsZWN0IEhBVkVfU1lTQ0FMTF9UUkFDRVBPSU5UUw0KPiAgICAgICAgICBzZWxl
Y3QgSEFWRV9WSVJUX0NQVV9BQ0NPVU5USU5HDQo+ICAgICAgICAgIHNlbGVjdCBIVUdFVExCX1BB
R0VfU0laRV9WQVJJQUJMRSAgICAgICBpZiBQUENfQk9PSzNTXzY0ICYmIEhVR0VUTEJfUEFHRQ0K
PiBAQCAtMTAyMyw2ICsxMDIzLDE3IEBAIGNvbmZpZyBQUENfUlRBU19GSUxURVINCj4gICAgICAg
ICAgICBTYXkgWSB1bmxlc3MgeW91IGtub3cgd2hhdCB5b3UgYXJlIGRvaW5nIGFuZCB0aGUgZmls
dGVyIGlzIGNhdXNpbmcNCj4gICAgICAgICAgICBwcm9ibGVtcyBmb3IgeW91Lg0KPiANCj4gK2Nv
bmZpZyBQUENfRU5BQkxFX1NUQVRJQ19DQUxMDQo+ICsgICAgICAgYm9vbCAiRW5hYmxlIHN0YXRp
YyBjYWxscyINCj4gKyAgICAgICBkZWZhdWx0IHkNCj4gKyAgICAgICBkZXBlbmRzIG9uIFBQQzMy
IHx8IFBQQzY0X0VMRl9BQklfVjINCj4gKyAgICAgICBoZWxwDQo+ICsgICAgICAgICBQb3dlclBD
IHN0YXRpYyBjYWxscyB3aXRoIHRoZSBFTEYgVjIgQUJJIGFyZSBub3QgYXMgc3RyYWlnaHRmb3J3
YXJkDQo+ICsgICAgICAgICBhcyBjaGVja2luZyBpZiB0aGUgdGFyZ2V0IGlzIGluIHJhbmdlIG9m
IGEgYnJhbmNoIG9yIG5vdC4gVGhleSBtdXN0DQo+ICsgICAgICAgICBhbHNvIGVuc3VyZSB0aGUg
VE9DIHJlbWFpbnMgY29uc2lzdGVudC4gVGhpcyBsZWFkcyB0byBjb21wbGV4DQo+ICsgICAgICAg
ICBwZXJmb3JtYW5jZSByZXN1bHRzLCBzbyBpdCdzIHVzZWZ1bCB0byBtYWtlIHRoZW0gY29uZmln
dXJhYmxlIHRvDQo+ICsgICAgICAgICBhbGxvdyB0ZXN0aW5nIHdpdGggdGhlIGdlbmVyaWMgaW1w
bGVtZW50YXRpb24gdG9vLg0KPiArDQoNCk9ubHkgYXMgcGFydCBvZiB5b3VyIFJGQyBJIGd1ZXNz
LCB3ZSBzaG91bGRuJ3QgbWFrZSBpdCBjb25maWd1cmFibGUgYXQgDQp0aGUgZW5kLg0KDQo+ICAg
ZW5kbWVudQ0KPiANCj4gICBjb25maWcgSVNBX0RNQV9BUEkNCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vY29kZS1wYXRjaGluZy5oDQo+IGluZGV4IDNkZTkwNzQ4YmNlNy4uMzE5Y2IxZWVmNzFj
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vY29kZS1wYXRjaGluZy5o
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmgNCj4gQEAg
LTEyNiw2ICsxMjYsNyBAQCBpbnQgdHJhbnNsYXRlX2JyYW5jaChwcGNfaW5zdF90ICppbnN0ciwg
Y29uc3QgdTMyICpkZXN0LCBjb25zdCB1MzIgKnNyYyk7DQo+ICAgYm9vbCBpc19jb25kaXRpb25h
bF9icmFuY2gocHBjX2luc3RfdCBpbnN0cik7DQo+IA0KPiAgICNkZWZpbmUgT1BfUlRfUkFfTUFT
SyAgMHhmZmZmMDAwMFVMDQo+ICsjZGVmaW5lIE9QX1NJX01BU0sgICAgIDB4MDAwMGZmZmZVTA0K
PiAgICNkZWZpbmUgTElTX1IyICAgICAgICAgKFBQQ19SQVdfTElTKF9SMiwgMCkpDQo+ICAgI2Rl
ZmluZSBBRERJU19SMl9SMTIgICAoUFBDX1JBV19BRERJUyhfUjIsIF9SMTIsIDApKQ0KPiAgICNk
ZWZpbmUgQURESV9SMl9SMiAgICAgKFBQQ19SQVdfQURESShfUjIsIF9SMiwgMCkpDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc3RhdGljX2NhbGwuaCBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9zdGF0aWNfY2FsbC5oDQo+IGluZGV4IGRlMTAxOGNjNTIyYi4uZDg1
ZmYzZjg4YzhlIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc3RhdGlj
X2NhbGwuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc3RhdGljX2NhbGwuaA0K
PiBAQCAtMiwxMiArMiw0OSBAQA0KPiAgICNpZm5kZWYgX0FTTV9QT1dFUlBDX1NUQVRJQ19DQUxM
X0gNCj4gICAjZGVmaW5lIF9BU01fUE9XRVJQQ19TVEFUSUNfQ0FMTF9IDQo+IA0KPiArI2lmIGRl
ZmluZWQoQ09ORklHX1BQQzY0X0VMRl9BQklfVjIpDQo+ICsNCj4gKyNkZWZpbmUgX19QUENfU0NU
KG5hbWUsIGluc3QpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICAg
ICBhc20oIi5wdXNoc2VjdGlvbiAudGV4dCwgXCJheFwiICAgICAgICAgICAgICAgICAgICAgICAg
IFxuIiAgICAgXA0KPiArICAgICAgICAgICAiLmFsaWduIDYgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXG4iICAgICBcDQo+ICsgICAgICAgICAgICIuZ2xvYmwgIiBT
VEFUSUNfQ0FMTF9UUkFNUF9TVFIobmFtZSkgIiAgICAgICAgICAgICBcbiIgICAgIFwNCj4gKyAg
ICAgICAgICAgU1RBVElDX0NBTExfVFJBTVBfU1RSKG5hbWUpICI6ICAgICAgICAgICAgICAgICAg
ICAgIFxuIiAgICAgXA0KPiArICAgICAgICAgICAiICAgYWRkaXMgICAyLCAxMiwgKC5UT0MuLSIg
U1RBVElDX0NBTExfVFJBTVBfU1RSKG5hbWUpICIpQGhhIFxuIiAgIFwNCj4gKyAgICAgICAgICAg
IiAgIGFkZGkgICAgMiwgMiwgKC5UT0MuLSIgU1RBVElDX0NBTExfVFJBTVBfU1RSKG5hbWUpICIp
QGwgICBcbiIgICBcDQo+ICsgICAgICAgICAgICIubG9jYWxlbnRyeSAiIFNUQVRJQ19DQUxMX1RS
QU1QX1NUUihuYW1lKSAiLCAuLSIgU1RBVElDX0NBTExfVFJBTVBfU1RSKG5hbWUpICJcbiIgXA0K
PiArICAgICAgICAgICAiICAgIiBpbnN0ICIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXG4iICAgICBcDQo+ICsgICAgICAgICAgICIgICBtZmxyICAgIDAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcbiIgICAgIFwNCj4gKyAgICAgICAgICAgIiAg
IHN0ZCAgICAgMCwgMTYoMSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxuIiAgICAg
XA0KDQpVc2UgUFBDX0xSX1NUS09GRg0KDQo+ICsgICAgICAgICAgICIgICBzdGR1ICAgIDEsIC0z
MigxKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcbiIgICAgIFwNCg0KSXMgdGhhdCBj
b3JyZWN0ID8gRm9yIFBQQzY0IHdlIGhhdmUgUFBDX01JTl9TVEtGUk0gICAgMTEyDQoNCj4gKyAg
ICAgICAgICAgIiAgIHN0ZCAgICAgMiwgMjQoMSkgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFxuIiAgICAgXA0KDQpVc2UgUjJfU1RBQ0tfT0ZGU0VUDQoNCj4gKyAgICAgICAgICAgIiAg
IGFkZGlzICAgMTIsIDIsIDJmQHRvY0BoYSAgICAgICAgICAgICAgICAgICAgICAgIFxuIiAgICAg
XA0KPiArICAgICAgICAgICAiICAgbGQgICAgICAxMiwgMmZAdG9jQGwoMTIpICAgICAgICAgICAg
ICAgICAgICAgICAgXG4iICAgICBcDQo+ICsgICAgICAgICAgICIgICBtdGN0ciAgIDEyICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcbiIgICAgIFwNCj4gKyAgICAgICAgICAg
IiAgIGJjdHJsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxuIiAg
ICAgXA0KPiArICAgICAgICAgICAiICAgbGQgICAgICAyLCAyNCgxKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXG4iICAgICBcDQo+ICsgICAgICAgICAgICIgICBhZGRpICAgIDEsIDEs
IDMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcbiIgICAgIFwNCj4gKyAgICAgICAg
ICAgIiAgIGxkICAgICAgMCwgMTYoMSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxu
IiAgICAgXA0KPiArICAgICAgICAgICAiICAgbXRsciAgICAwICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXG4iICAgICBcDQo+ICsgICAgICAgICAgICIgICBibHIgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcbiIgICAgIFwNCj4gKyAgICAg
ICAgICAgIjE6IGxpICAgICAgMywgMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFxuIiAgICAgXA0KPiArICAgICAgICAgICAiICAgYmxyICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXG4iICAgICBcDQo+ICsgICAgICAgICAgICIuYmFsaWduIDgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcbiIgICAgIFwNCj4gKyAg
ICAgICAgICAgIjI6IC44Ynl0ZSAwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFxuIiAgICAgXA0KPiArICAgICAgICAgICAiLnR5cGUgIiBTVEFUSUNfQ0FMTF9UUkFNUF9T
VFIobmFtZSkgIiwgQGZ1bmN0aW9uICAgXG4iICAgICBcDQo+ICsgICAgICAgICAgICIuc2l6ZSAi
IFNUQVRJQ19DQUxMX1RSQU1QX1NUUihuYW1lKSAiLCAuIC0gIiBTVEFUSUNfQ0FMTF9UUkFNUF9T
VFIobmFtZSkgIiBcbiIgXA0KPiArICAgICAgICAgICAiLnBvcHNlY3Rpb24gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXG4iKQ0KPiArDQo+ICsjZGVmaW5lIFBQQ19TQ1Rf
UkVUMCAgICAgICAgICAgNjQgICAgICAgICAgICAgIC8qIE9mZnNldCBvZiBsYWJlbCAxICovDQo+
ICsjZGVmaW5lIFBQQ19TQ1RfREFUQSAgICAgICAgICAgNzIgICAgICAgICAgICAgIC8qIE9mZnNl
dCBvZiBsYWJlbCAyIChhbGlnbmVkKSAqLw0KPiArDQo+ICsjZWxpZiBkZWZpbmVkKFBQQzMyKQ0K
PiArDQo+ICAgI2RlZmluZSBfX1BQQ19TQ1QobmFtZSwgaW5zdCkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXA0KPiAgICAgICAgICBhc20oIi5wdXNoc2VjdGlvbiAudGV4dCwgXCJh
eFwiICAgICAgICAgICAgICAgICAgICAgICAgIFxuIiAgICAgXA0KPiAgICAgICAgICAgICAgIi5h
bGlnbiA1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxuIiAgICAg
XA0KPiAgICAgICAgICAgICAgIi5nbG9ibCAiIFNUQVRJQ19DQUxMX1RSQU1QX1NUUihuYW1lKSAi
ICAgICAgICAgICAgIFxuIiAgICAgXA0KPiAgICAgICAgICAgICAgU1RBVElDX0NBTExfVFJBTVBf
U1RSKG5hbWUpICI6ICAgICAgICAgICAgICAgICAgICAgIFxuIiAgICAgXA0KPiAtICAgICAgICAg
ICBpbnN0ICIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXG4i
ICAgICBcDQo+ICsgICAgICAgICAgICIgICAiIGluc3QgIiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcbiIgICAgIFwNCj4gICAgICAgICAgICAgICIgICBsaXMgICAgIDEy
LDJmQGhhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcbiIgICAgIFwNCj4gICAgICAg
ICAgICAgICIgICBsd3ogICAgIDEyLDJmQGwoMTIpICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcbiIgICAgIFwNCj4gICAgICAgICAgICAgICIgICBtdGN0ciAgIDEyICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcbiIgICAgIFwNCj4gQEAgLTIyLDggKzU5LDEyIEBADQo+
ICAgI2RlZmluZSBQUENfU0NUX1JFVDAgICAgICAgICAgIDIwICAgICAgICAgICAgICAvKiBPZmZz
ZXQgb2YgbGFiZWwgMSAqLw0KPiAgICNkZWZpbmUgUFBDX1NDVF9EQVRBICAgICAgICAgICAyOCAg
ICAgICAgICAgICAgLyogT2Zmc2V0IG9mIGxhYmVsIDIgKi8NCj4gDQo+ICsjZWxzZSAvKiAhQ09O
RklHX1BQQzY0X0VMRl9BQklfVjIgJiYgIVBQQzMyICovDQo+ICsjZXJyb3IgIlVuc3VwcG9ydGVk
IEFCSSINCj4gKyNlbmRpZiAvKiBDT05GSUdfUFBDNjRfRUxGX0FCSV9WMiAqLw0KPiArDQo+ICAg
I2RlZmluZSBBUkNIX0RFRklORV9TVEFUSUNfQ0FMTF9UUkFNUChuYW1lLCBmdW5jKSAgICAgIF9f
UFBDX1NDVChuYW1lLCAiYiAiICNmdW5jKQ0KPiAgICNkZWZpbmUgQVJDSF9ERUZJTkVfU1RBVElD
X0NBTExfTlVMTF9UUkFNUChuYW1lKSAgICAgICBfX1BQQ19TQ1QobmFtZSwgImJsciIpDQo+IC0j
ZGVmaW5lIEFSQ0hfREVGSU5FX1NUQVRJQ19DQUxMX1JFVDBfVFJBTVAobmFtZSkgICAgICAgX19Q
UENfU0NUKG5hbWUsICJiIC4rMjAiKQ0KPiArI2RlZmluZSBBUkNIX0RFRklORV9TVEFUSUNfQ0FM
TF9SRVQwX1RSQU1QKG5hbWUpICAgICAgIF9fUFBDX1NDVChuYW1lLCAiYiAxZiIpDQo+IA0KPiAg
ICNlbmRpZiAvKiBfQVNNX1BPV0VSUENfU1RBVElDX0NBTExfSCAqLw0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvTWFrZWZp
bGUNCj4gaW5kZXggMDZkMmQxZjc4ZjcxLi5hMzBkMGQwZjU0OTkgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvTWFrZWZpbGUNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9N
YWtlZmlsZQ0KPiBAQCAtMTI4LDggKzEyOCw5IEBAIGV4dHJhLXkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICs9IHZtbGludXgubGRzDQo+IA0KPiAgIG9iai0kKENPTkZJR19SRUxPQ0FUQUJM
RSkgICAgICArPSByZWxvY18kKEJJVFMpLm8NCj4gDQo+IC1vYmotJChDT05GSUdfUFBDMzIpICAg
ICAgICAgICAgKz0gZW50cnlfMzIubyBzZXR1cF8zMi5vIGVhcmx5XzMyLm8gc3RhdGljX2NhbGwu
bw0KPiArb2JqLSQoQ09ORklHX1BQQzMyKSAgICAgICAgICAgICs9IGVudHJ5XzMyLm8gc2V0dXBf
MzIubyBlYXJseV8zMi5vDQo+ICAgb2JqLSQoQ09ORklHX1BQQzY0KSAgICAgICAgICAgICs9IGRt
YS1pb21tdS5vIGlvbW11Lm8NCj4gK29iai0kKENPTkZJR19IQVZFX1NUQVRJQ19DQUxMKSArPSBz
dGF0aWNfY2FsbC5vDQo+ICAgb2JqLSQoQ09ORklHX0tHREIpICAgICAgICAgICAgICs9IGtnZGIu
bw0KPiAgIG9iai0kKENPTkZJR19CT09UWF9URVhUKSAgICAgICArPSBidGV4dC5vDQo+ICAgb2Jq
LSQoQ09ORklHX1NNUCkgICAgICAgICAgICAgICs9IHNtcC5vDQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMva2VybmVsL3N0YXRpY19jYWxsLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3N0YXRp
Y19jYWxsLmMNCj4gaW5kZXggODYzYTdhYTI0NjUwLi5lZDNiYzM2MWZkYjAgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3RhdGljX2NhbGwuYw0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMva2VybmVsL3N0YXRpY19jYWxsLmMNCj4gQEAgLTEsMzMgKzEsMTAxIEBADQo+ICAgLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKyNpbmNsdWRlIDxhc20vY29kZS1wYXRj
aGluZy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4
L2tjb25maWcuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4gICAjaW5jbHVkZSA8
bGludXgvbWVtb3J5Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3N0YXRpY19jYWxsLmg+DQo+ICsj
aW5jbHVkZSA8bGludXgvc3lzY2FsbHMuaD4NCj4gDQo+IC0jaW5jbHVkZSA8YXNtL2NvZGUtcGF0
Y2hpbmcuaD4NCj4gKyNpZmRlZiBDT05GSUdfUFBDNjRfRUxGX0FCSV9WMg0KPiArDQo+ICtzdGF0
aWMgdm9pZCogcHBjX2Z1bmN0aW9uX3RvYyh1MzIgKmZ1bmMpIHsNCj4gKyAgICAgICB1MzIgaW5z
bjEgPSAqZnVuYzsNCj4gKyAgICAgICB1MzIgaW5zbjIgPSAqKGZ1bmMrMSk7DQo+ICsgICAgICAg
dTY0IHNpMSA9IHNpZ25fZXh0ZW5kNjQoKGluc24xICYgT1BfU0lfTUFTSykgPDwgMTYsIDMxKTsN
Cj4gKyAgICAgICB1NjQgc2kyID0gc2lnbl9leHRlbmQ2NChpbnNuMiAmIE9QX1NJX01BU0ssIDE1
KTsNCj4gKyAgICAgICB1NjQgYWRkciA9ICgodTY0KSBmdW5jICsgc2kxKSArIHNpMjsNCj4gKw0K
PiArICAgICAgIGlmICgoKChpbnNuMSAmIE9QX1JUX1JBX01BU0spID09IEFERElTX1IyX1IxMikg
fHwNCj4gKyAgICAgICAgICAgICgoaW5zbjEgJiBPUF9SVF9SQV9NQVNLKSA9PSBMSVNfUjIpKSAm
Jg0KPiArICAgICAgICAgICAoKGluc24yICYgT1BfUlRfUkFfTUFTSykgPT0gQURESV9SMl9SMikp
DQo+ICsgICAgICAgICAgICAgICByZXR1cm4gKHZvaWQqKSBhZGRyOw0KPiArICAgICAgIGVsc2UN
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgYm9v
bCBzaGFyZXNfdG9jKHZvaWQgKmZ1bmMxLCB2b2lkICpmdW5jMikgew0KPiArICAgICAgIHZvaWQq
IGZ1bmMxX3RvYzsNCj4gKyAgICAgICB2b2lkKiBmdW5jMl90b2M7DQo+ICsNCj4gKyAgICAgICBp
ZiAoZnVuYzEgPT0gTlVMTCB8fCBmdW5jMiA9PSBOVUxMKQ0KPiArICAgICAgICAgICAgICAgcmV0
dXJuIGZhbHNlOw0KPiArDQo+ICsgICAgICAgLyogQXNzdW1lIHRoZSBrZXJuZWwgb25seSB1c2Vz
IGEgc2luZ2xlIFRPQyAqLw0KPiArICAgICAgIGlmIChjb3JlX2tlcm5lbF90ZXh0KCh1bnNpZ25l
ZCBsb25nKWZ1bmMxKSAmJg0KPiArICAgICAgICAgICBjb3JlX2tlcm5lbF90ZXh0KCh1bnNpZ25l
ZCBsb25nKWZ1bmMyKSkNCj4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPiArDQo+ICsg
ICAgICAgLyogRmFsbCBiYWNrIHRvIGNhbGN1bGF0aW5nIHRoZSBUT0MgZnJvbSBjb21tb24gcGF0
dGVybnMNCj4gKyAgICAgICAgKiBpZiBtb2R1bGVzIGFyZSBpbnZvbHZlZA0KPiArICAgICAgICAq
Lw0KPiArICAgICAgIGZ1bmMxX3RvYyA9IHBwY19mdW5jdGlvbl90b2MoZnVuYzEpOw0KPiArICAg
ICAgIGZ1bmMyX3RvYyA9IHBwY19mdW5jdGlvbl90b2MoZnVuYzIpOw0KPiArICAgICAgIHJldHVy
biBmdW5jMV90b2MgIT0gTlVMTCAmJiBmdW5jMl90b2MgIT0gTlVMTCAmJiAoZnVuYzFfdG9jID09
IGZ1bmMyX3RvYyk7DQo+ICt9DQo+ICsNCj4gKyNlbmRpZiAvKiBDT05GSUdfUFBDNjRfRUxGX0FC
SV9WMiAqLw0KPiANCj4gICB2b2lkIGFyY2hfc3RhdGljX2NhbGxfdHJhbnNmb3JtKHZvaWQgKnNp
dGUsIHZvaWQgKnRyYW1wLCB2b2lkICpmdW5jLCBib29sIHRhaWwpDQo+ICAgew0KPiAgICAgICAg
ICBpbnQgZXJyOw0KPiAgICAgICAgICBib29sIGlzX3JldDAgPSAoZnVuYyA9PSBfX3N0YXRpY19j
YWxsX3JldHVybjApOw0KPiAgICAgICAgICB1bnNpZ25lZCBsb25nIHRhcmdldCA9ICh1bnNpZ25l
ZCBsb25nKShpc19yZXQwID8gdHJhbXAgKyBQUENfU0NUX1JFVDAgOiBmdW5jKTsNCj4gLSAgICAg
ICBib29sIGlzX3Nob3J0ID0gaXNfb2Zmc2V0X2luX2JyYW5jaF9yYW5nZSgobG9uZyl0YXJnZXQg
LSAobG9uZyl0cmFtcCk7DQo+ICsgICAgICAgYm9vbCBpc19zaG9ydDsNCj4gKyAgICAgICB2b2lk
KiB0cmFtcF9lbnRyeTsNCj4gDQo+ICAgICAgICAgIGlmICghdHJhbXApDQo+ICAgICAgICAgICAg
ICAgICAgcmV0dXJuOw0KPiANCj4gKyAgICAgICB0cmFtcF9lbnRyeSA9ICh2b2lkKilwcGNfZnVu
Y3Rpb25fZW50cnkodHJhbXApOw0KPiArDQo+ICsjaWZkZWYgQ09ORklHX1BQQzY0X0VMRl9BQklf
VjINCj4gKyAgICAgICBpZiAoc2hhcmVzX3RvYyh0cmFtcCwgKHZvaWQqKXRhcmdldCkpIHsNCj4g
KyAgICAgICAgICAgICAgIC8qIENvbmZpcm0gdGhhdCB0aGUgbG9jYWwgZW50cnkgcG9pbnQgaXMg
aW4gcmFuZ2UgKi8NCj4gKyAgICAgICAgICAgICAgIGlzX3Nob3J0ID0gaXNfb2Zmc2V0X2luX2Jy
YW5jaF9yYW5nZSgNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgKGxvbmcpcHBjX2Z1bmN0aW9u
X2VudHJ5KCh2b2lkKil0YXJnZXQpIC0gKGxvbmcpdHJhbXBfZW50cnkpOw0KPiArICAgICAgIH0g
ZWxzZSB7DQo+ICsgICAgICAgICAgICAgICAvKiBDb21iaW5lIG91dC1vZi1yYW5nZSB3aXRoIG5v
dCBzaGFyaW5nIGEgVE9DLiBUaG91Z2ggaXQncyBwb3NzaWJsZSBhbg0KPiArICAgICAgICAgICAg
ICAgICogb3V0LW9mLXJhbmdlIHRhcmdldCBzaGFyZXMgYSBUT0MsIGhhbmRsaW5nIHRoaXMgc2Vw
YXJhdGVseSBjb21wbGljYXRlcw0KPiArICAgICAgICAgICAgICAgICogdGhlIHRyYW1wb2xpbmUu
IEl0J3Mgc2ltcGxlciB0byBhbHdheXMgdXNlIHRoZSBnbG9iYWwgZW50cnkgcG9pbnQNCj4gKyAg
ICAgICAgICAgICAgICAqIGluIHRoaXMgY2FzZS4NCj4gKyAgICAgICAgICAgICAgICAqLw0KPiAr
ICAgICAgICAgICAgICAgaXNfc2hvcnQgPSBmYWxzZTsNCj4gKyAgICAgICB9DQo+ICsjZWxzZSAv
KiAhQ09ORklHX1BQQzY0X0VMRl9BQklfVjIgKi8NCj4gKyAgICAgICBpc19zaG9ydCA9IGlzX29m
ZnNldF9pbl9icmFuY2hfcmFuZ2UoKGxvbmcpdGFyZ2V0IC0gKGxvbmcpdHJhbXApOw0KPiArI2Vu
ZGlmIC8qIENPTkZJR19QUEM2NF9FTEZfQUJJX1YyICovDQo+ICsNCj4gICAgICAgICAgbXV0ZXhf
bG9jaygmdGV4dF9tdXRleCk7DQo+IA0KPiAgICAgICAgICBpZiAoZnVuYyAmJiAhaXNfc2hvcnQp
IHsNCj4gLSAgICAgICAgICAgICAgIGVyciA9IHBhdGNoX2luc3RydWN0aW9uKHRyYW1wICsgUFBD
X1NDVF9EQVRBLCBwcGNfaW5zdCh0YXJnZXQpKTsNCj4gKyAgICAgICAgICAgICAgIC8qIFRoaXMg
YXNzdW1lcyB0aGF0IHRoZSB1cGRhdGUgaXMgYXRvbWljLiBUaGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbiB1c2VzDQo+ICsgICAgICAgICAgICAgICAgKiBzdHcvc3RkIGFuZCB0aGUgc3RvcmUgbG9j
YXRpb24gaXMgYWxpZ25lZC4gQSBzeW5jIGlzIGlzc3VlZCBieSBvbmUgb2YgdGhlDQo+ICsgICAg
ICAgICAgICAgICAgKiBwYXRjaF9pbnN0cnVjdGlvbi9wYXRjaF9icmFuY2ggZnVuY3Rpb25zIGJl
bG93Lg0KPiArICAgICAgICAgICAgICAgICovDQo+ICsgICAgICAgICAgICAgICBlcnIgPSBQVFJf
RVJSX09SX1pFUk8ocGF0Y2hfbWVtb3J5KA0KPiArICAgICAgICAgICAgICAgICAgICAgICB0cmFt
cCArIFBQQ19TQ1RfREFUQSwgJnRhcmdldCwgc2l6ZW9mKHRhcmdldCkpKTsNCj4gICAgICAgICAg
ICAgICAgICBpZiAoZXJyKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+
ICAgICAgICAgIH0NCj4gDQo+ICAgICAgICAgIGlmICghZnVuYykNCj4gLSAgICAgICAgICAgICAg
IGVyciA9IHBhdGNoX2luc3RydWN0aW9uKHRyYW1wLCBwcGNfaW5zdChQUENfUkFXX0JMUigpKSk7
DQo+ICsgICAgICAgICAgICAgICBlcnIgPSBwYXRjaF9pbnN0cnVjdGlvbih0cmFtcF9lbnRyeSwg
cHBjX2luc3QoUFBDX1JBV19CTFIoKSkpOw0KPiAgICAgICAgICBlbHNlIGlmIChpc19zaG9ydCkN
Cj4gLSAgICAgICAgICAgICAgIGVyciA9IHBhdGNoX2JyYW5jaCh0cmFtcCwgdGFyZ2V0LCAwKTsN
Cj4gKyAgICAgICAgICAgICAgIGVyciA9IHBhdGNoX2JyYW5jaCh0cmFtcF9lbnRyeSwgcHBjX2Z1
bmN0aW9uX2VudHJ5KCh2b2lkKikgdGFyZ2V0KSwgMCk7DQo+ICAgICAgICAgIGVsc2UNCj4gLSAg
ICAgICAgICAgICAgIGVyciA9IHBhdGNoX2luc3RydWN0aW9uKHRyYW1wLCBwcGNfaW5zdChQUENf
UkFXX05PUCgpKSk7DQo+ICsgICAgICAgICAgICAgICBlcnIgPSBwYXRjaF9pbnN0cnVjdGlvbih0
cmFtcF9lbnRyeSwgcHBjX2luc3QoUFBDX1JBV19OT1AoKSkpOw0KPiArDQo+ICAgb3V0Og0KPiAg
ICAgICAgICBtdXRleF91bmxvY2soJnRleHRfbXV0ZXgpOw0KPiANCj4gLS0NCj4gMi4zNy4yDQo+
IA==
