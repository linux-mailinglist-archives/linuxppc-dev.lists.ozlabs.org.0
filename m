Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8EC6958AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 06:50:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG9Kl5TnHz3cJM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 16:50:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LHtC+0up;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e1a::607; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LHtC+0up;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG9Jl3pKrz3bgg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 16:49:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1Uvt+6TLlWnTLfnJ4t5pAp9bCp58GCh/jHg052NgmtEyIxfjIDFttbWLYADhwR5NePvVVQub0VFFk1KJgXXRdUuibOp2N22hfLj+nrI0v9Cxl6+nVYaau6IrSu0/wx0EpSQyOe3m7GNP5PmqCFIxYdl5QHyaRynUN/GLlsIyIxnKHlk4G1f5vI2CARlZqSob86k+L9XrOdi9sY/6vC0Yzy1x6ktYiUglaUup4rG+hIoulP2Pb7aBB+5rJZY79YfQiQfN+jflv5NNtuVb2usza4B8jtJTlShzOM6NhDjLhzLACDfhJ65QS4/8hZiOUeyKuANpr0EuWafHsp7ASuSFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYBITLPCdovp09OBCwPjuIZiKrekMtKefLlj1pV79BM=;
 b=QTLnW5gB9ke3BvVPBQtHv6WGnadI6eQ0EjfwmfIlW9TMi4UFmP/I8+brB+GOVEQ9MbeH1wcIuWqautIOJXrdq5uzURit89i6QYyOOKZmDNjmEcVSYlQuCe8/j5QZwkvWy6hLWyi3oP8Wgt35odAtdtQVv79mWM1A4eFn5pqHk4uZHmGYOSGEbdJjYE2HAyvFMm0zw7qFcGmMxnrE02u5iFAEFNLkA6UYmC0xS93wBpTOhJCz/hEBGJtJtYT8909b3Gy/mvqL8cG2BLWIBHwJ1cKmb6gBw7TcI2w+1XljNYda4pIPzWP7BFzny7arFVdNpnVG4nSHk/pker3TEuY1Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYBITLPCdovp09OBCwPjuIZiKrekMtKefLlj1pV79BM=;
 b=LHtC+0upmRAI1ZnRBYA9c5M/tgyecVr2Tb+LyHNhm6zLSLBvhtsH/sofwG8ZCKThdMZo7w9dv/CV9fx3yL7FzDAu/2jb815r78i7zOzRvRhc19YhLs1DUvHjpGHrbhi1NOp8Ce1AxQwbeeHjbJYhvnMcDuiQ7KtPSbmh8ueokikjuv0Ib+x5l8owDcvoS/wy/68iXJssMWK+b+58URMIIUHxdsPfFX2PUx4HGMV6QHm44jpDHgJLbgrjBWEqaffur5N2dZXr8bzKqXdHEbWva+5GEtTvNjBlNlAzAGsdZ+tLzJTl5mxMlPlmwxiW0VSTcyKMadvyR0xSem739rYsxQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1885.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 05:49:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 05:49:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v2 3/8] powerpc/85xx: p2020: Move all P2020 machine
 descriptions to p2020.c
Thread-Topic: [PATCH v2 3/8] powerpc/85xx: p2020: Move all P2020 machine
 descriptions to p2020.c
Thread-Index: AQHZF90Ep1SZn0et2ESTXgSoszX3AK7NnTYAgAACxwCAAKB3AA==
Date: Tue, 14 Feb 2023 05:49:24 +0000
Message-ID: <b0763d5d-20a1-1ece-f9c1-2ef91c196629@csgroup.eu>
References: <20221224211425.14983-1-pali@kernel.org>
 <20221224211425.14983-4-pali@kernel.org>
 <f5738fd1-fa0b-c0bf-f604-9c81703dc639@csgroup.eu>
 <20230213201504.ovc6jf5iyo4s47pf@pali>
In-Reply-To: <20230213201504.ovc6jf5iyo4s47pf@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1885:EE_
x-ms-office365-filtering-correlation-id: 243a9424-6928-4e17-478b-08db0e4f3a54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HX2oaYS+dpCtZ+njkbLScQtDFZY69p5tjY/d0mvMZSZtSV2uoDtYWhLScsy4b//SW/1A1C4gKLXnVco6EJiqFFu927TIvwGIETZdkXxhRUTFv3J2zmjWMCTMGwKfgkwAuKVELdg6dLSxdIeu3vQyfSNUUJ7MwZ0+IBj0H/NQecRhcZEYdDp5Ug8fyzbyLabYufjA+R3f9x/5Mvz1oCRUtqRbGd6AN8L94pIDC7Gf8rWq0XUF9s1BZLhchLuqYT/vQh6c8sVIuIXrGg1qBJAv4Qu2zUo0b0TSEIZL0/WFn2gEksZzP1hdu9mXVx7Sb4iyncdgjm6euPtapBHg4MrB5AI5u/urWPr/xBfkgEAID5tK9Fyjt2pH1M/adroBu7Rx6Z/sXgfTK7+MHz404fqKc9CRKSIKjGiw7xl27KgvqnEsA4dak3soyZrf08PBHnbb0sWxU0i5UTXDFErZwKugSBefcUv6KIsXzZYMimLyqM+R/40/MnUmtFAQih+piYHFg7qNFIxSIfHq8QOvAa21mGogZ7YaraUk4r0RnWuELRdfZQMKXSLD84fP1xx0DdFt80GrwDRmeO5lT1gim2Tp8xjDY0k1z08nEYYqh1MzCveA+HXN7JqFshkRyD/ruysI7IqXQ5BNs5GirK0fqb/dEKo7vp7y2CFaorYNSpCFE/zhHtmj3Ui6vZBKjUcoAVs378NMFDfXyRrRdK10C3kNVwRs/98Yc6qnzGuvOCHRM9x+oE1++TsY9QBj0X7guCrsWLgzV4GLjjmh6Ro1BrlLLw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199018)(36756003)(44832011)(2906002)(4744005)(5660300002)(6512007)(31696002)(26005)(186003)(38070700005)(2616005)(122000001)(66946007)(76116006)(91956017)(38100700002)(64756008)(8676002)(4326008)(6916009)(316002)(66476007)(8936002)(66446008)(66556008)(54906003)(478600001)(6506007)(86362001)(6486002)(71200400001)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WUhhQmRJNWtGWnZtNnBNUzZLRkdXTzNYcFdmV1dSYlh6S3RNODVBYnF6bVBt?=
 =?utf-8?B?VnZKQm1EMGpTV0pyUEtCSklGaTgrMHF3NVlXQ1U5RmxOMlRabWFVWDRWakdR?=
 =?utf-8?B?SHN4WE8yT3pRKzRIWnZEWHBTQ1FERCtPajNqSUcvVFo0RkM5T21LZFcrdUkz?=
 =?utf-8?B?YXRNT0lRRm9LRSszcHhXZzFkNGl0azZ2d3V1cVFmTXp2akZ4czVVYkczK2w1?=
 =?utf-8?B?SWNVOGoyYnRJQ1BpS1Z4dHp6c0NOMzlORTZXYUp5aHR6bTRyS1M2eS9LbkY0?=
 =?utf-8?B?NkdKN2dHTjBJRDlCTml4b0Fra1FhSjIrSjRLTk9KeEU0QWtJRWlBNWpCc29Z?=
 =?utf-8?B?eHRUd2JpZlVPVlVRc2FWV0o0ckJXOXg0TCsyTWFBT1VVcXZKVERpZlpERm10?=
 =?utf-8?B?YXRreXJYaThHRlRhZytmMFRBclFLMkluZjZtazlQaE9VT1U5S25jWmwrVDJl?=
 =?utf-8?B?dW5DbzhDR3pZUFFJaVJkKy9NRjFaVGZ1d3I3MUZnenBNM0ZLKzVKbTRjZ1pO?=
 =?utf-8?B?ZUFabXlvQ0IyNkxIbk1IUk94dGs3YjdybkN6K01XbEVoSGowU1JqQi96ZjJH?=
 =?utf-8?B?WjlHVU5zR3lOQ1NQcTVSd1lNL1c0UEg3bXI1VFR4MGhvNm5La0xmTSt0UmV6?=
 =?utf-8?B?dHVTSG5vWXFFaER0d0dLNnI0UVJsRHU4NXNDTW5VTlJiWXN2SktxL0tNOUQw?=
 =?utf-8?B?bTdHWWxRVnBVUUxPU3drUDFTaWh3dWNjblBoa0VZOHpDK1JQT0NCRG9GWjNB?=
 =?utf-8?B?UjA4ME9keTJzUGlJS0xNb050RDU1KzgvWU9wZ0JtYTNkdmptR2VnUWlEdnpP?=
 =?utf-8?B?aDREallnOEFITm04eVY1UmZCazVBa1F5SmRBQjJ1M0RtY2ZwczBPTVpJeDZ6?=
 =?utf-8?B?ejh1eVJmVHBhc0xUR3hoMkpLWHN4NkNDNENGaytJOG0ySVlIMmpXb3BxSlJu?=
 =?utf-8?B?UmNvclRsK2UzMUhvd1NaTDZjTUE1RWRReEZWaVZjZldYRnRRK01wYlZiQjFI?=
 =?utf-8?B?eWZscDlQTCtaWmZLNEpNcG1WTGtoRUROTlRtUkU3S0o5ZUNkYXdsZXlhZURH?=
 =?utf-8?B?V3JGUjhSbHdJYmN3NGEwVFE1MlZZekZSQnJieW0vQjkrc0dYT0JiVkFSYzAx?=
 =?utf-8?B?OFJvZEtuTzYyVmtuUUFZWlNYK2luVlRmNzZTaHlIV2wzTGx5VUdXdlQ4N2FR?=
 =?utf-8?B?NnlPSzN1QnlxZlBUK3RHUi9GV3Z2SVlOamZ6eFFrdXZxTDVIRVlaK2x3L2pC?=
 =?utf-8?B?ZXlRM3pKcDR4aFFzSTBJS2FPQkczbEZDbmozbkg5bGVWaG4rWmxVcDJPN0ZU?=
 =?utf-8?B?cXhyWFVOa2dhdjVUdGNtdk1jZGZvRVR2NWw3TXBNdVpPU0pTSUxQeW9ya1pW?=
 =?utf-8?B?bm5vVWw1Mmp4bzFoYlJUeVJUVlZIR3IwZGxycjNQRG1TTW4raHVYS215ZEg0?=
 =?utf-8?B?ZUVKTjR5Wld6QUc2ZFgxeWJ4dVJ2V05QL0hnc1J0OGo0Tkg0MS9Gcm0yb0NM?=
 =?utf-8?B?YUJqRVJ3anJUUmdnVHYySHhmOFQrMk53V0VLUkY2Z2MyKzZqSjlLVmowQitX?=
 =?utf-8?B?bDZmNmRJVmlJQU9WRlk0ejVJMUpRTk02cWZUUlZMMVFnK3J6OUJQb2x1OXhC?=
 =?utf-8?B?MklVQ1VnckhIWW5MTmYwWEllbUNRNithc2Zsc3NnTE5VWi9lTTJtN3NyRTdE?=
 =?utf-8?B?SlN0YkhCTXNtT3RLa0gxcUFQczF1ckp5MDNqb3FQVllIT2V1cnZSbHR1WEhp?=
 =?utf-8?B?VDMwRWM1R1FxeEtVa3lrSjBGTFhGM0wzRTZ3T0drTk9waUxtMnNoN2FZaHQ2?=
 =?utf-8?B?ZVpKVEVzNk02dHlwakhnVTZ4YldTMXZFRi9WaVhva2t5VDNLTUxBZlVXZUZZ?=
 =?utf-8?B?TTJibzJ3R3kvOWFDTmZIa1pIL25KcTlPcmtEdE1pckdjSlVBSk5abHFHMTlT?=
 =?utf-8?B?Z0N0cmgrNmlGdHc5Y05nZ2M3ekZBaDJvMUcvbDAzMXFaeGJEdUxGWW83MnFv?=
 =?utf-8?B?Q1BCTTFGdWlsaXBCNmlTdDZhTUo5ZTBwRGZ1SlBJak52YzN6dUhBUmpFUmNJ?=
 =?utf-8?B?QTlEeUxZNHJRQ3dDY2hPNVlzRkMwMUZJd1YvZUZSZWFGSXgvQmNvZEp2YVhj?=
 =?utf-8?B?OG4wOVB0N1IvMUpEMnpObERoeC9WUGFBVk9FU1REdkx6QkNqeWFUbnpOVG5F?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88428868869DE141B1B4484F5881C27D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 243a9424-6928-4e17-478b-08db0e4f3a54
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 05:49:24.6395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3KQbUjuGDFgqevS73AGHw3E67rdVcOW22A5Yo9kg5y7Ki1rbwo3BEi0aEPZjca9kavPf7WCPLxBQK6AMIkGQ3ln7RJtdxzHIvws7NhYC2/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1885
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Martin Kennedy <hurricos@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzAyLzIwMjMgw6AgMjE6MTUsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IE1vbmRheSAxMyBGZWJydWFyeSAyMDIzIDIwOjA1OjA5IENocmlzdG9waGUgTGVyb3kgd3JvdGU6
DQo+PiBMZSAyNC8xMi8yMDIyIMOgIDIyOjE0LCBQYWxpIFJvaMOhciBhIMOpY3JpdMKgOg0KPj4+
ICsjaWZkZWYgQ09ORklHX01QQzg1eHhfUkRCDQo+Pj4gK3N0YXRpYyB2b2lkIF9faW5pdCBtcGM4
NXh4X3JkYl9waWNfaW5pdCh2b2lkKQ0KPj4+ICt7DQo+Pj4gKwlzdHJ1Y3QgbXBpYyAqbXBpYzsN
Cj4+PiArDQo+Pj4gKwltcGljID0gbXBpY19hbGxvYyhOVUxMLCAwLA0KPj4+ICsJICBNUElDX0JJ
R19FTkRJQU4gfA0KPj4+ICsJICBNUElDX1NJTkdMRV9ERVNUX0NQVSwNCj4+PiArCSAgMCwgMjU2
LCAiIE9wZW5QSUMgICIpOw0KPj4NCj4+IENhbiB5b3UgbWFrZSBpdCBhIHNpbmdsZSBsaW5lID8g
QXQgbGVhc3Qgbm8gbW9yZSB0aGFuIHR3byBsaW5lcyA/DQo+IA0KPiBBbGwgdGhlc2UgbGluZXMg
YXJlIGFscmVhZHkgcHJlc2VudCBpbiBrZXJuZWwgdHJlZS4NCj4gU28gaXQgY291bGQgYmUgZml4
ZWQgaW4gc2VwYXJhdGUgcGF0Y2guDQo+IA0KPiBJZiBuZWVkZWQgSSBjYW4gZG8gaXQgYXMgcGFy
dCBvZiB0aGlzIHNlcmllcyBpbiBuZXcgcGF0Y2guDQo+IA0KDQpXZWxsLCB0aGF0IGdvZXMgYXdh
eSBpbiBwYXRjaCA1LiBTbyBpdCBpcyBub3QgcmVhbGx5IHdvcnRoIGl0Lg0K
