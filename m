Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C754707A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 18:48:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9dfT6nVWz3cW2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 04:48:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62e;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9ddw3yhBz3c4w
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 04:47:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tp3EpFVEoIbK6q71p6co3cCyqFl9vde9LHpQSXOyEkwRsMMa2q59oO1+ibR0woPhbyUf2E1zjyuxVxhC4d3pqseLgrXMWVqA3/Pl2KJScYaDlDsqv73JjX9BC/185IZdPB5Oz/LhTNBcVXVU+CHmqZuffq9e18tfDqoJ05Sjtaxw2XYdyo+9JaweDYK5zKUlXLgiiIFKSyoZkLkDqy5Ifk02Ky/73jPBDqFGITpIq/O6L0CAQ9czGrH04OF8vQtVPsBrCQkNtgFLQApgCPFG+/DT9U67JFhYlNidCM37DJBbzuQ06RgpsjpubAAHF11nJa/ITKMUt4a//6zwKpHE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y09sqTGYhEAXVKbZPr2z1XWqh7WPtNgHpC+bPWSa2Ek=;
 b=RdQuFiWckCNXmlfual5sBEIP05uh+ea3pzXHmAPC8dJrU6cLLqfdTywTKc8FNjB7NgzhvKgRy1VbBx7cRpVFSbsIJNWNS666Ds3xUXx7TGvU2zKt4nNsZOnElVNfTr6RcsA2N+VIBu49Zm/7sC2fvcYLcRVOT9L6vdCJduoiUPRiJOJAGa0vOAfJziqrBkMqRpxmwjQ5wYICBt7TEYt3nlG4v+eJMfviq4k2odMR+qG0hNLMF5JU1Mw/H9j6OGoBgEtUo8amAmMBE9qs1GvxR07oWkQcNumOyMr97mYHzeiTSzd7lpeyRdDC4Wz9XCmUDmdGB1EygK1GnOtnUMgV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1608.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Fri, 10 Dec
 2021 17:47:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 17:47:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 06/10] powerpc/mm: Use generic_get_unmapped_area() and
 call it from arch_get_unmapped_area()
Thread-Topic: [PATCH v4 06/10] powerpc/mm: Use generic_get_unmapped_area() and
 call it from arch_get_unmapped_area()
Thread-Index: AQHX7FeZYbkFB7BK6kOFRdVEM/XL8Kwp65yAgAIXlwA=
Date: Fri, 10 Dec 2021 17:47:04 +0000
Message-ID: <b84d9742-2f73-3d33-b865-cb904fec4d15@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <8f54a8d097c402d808147b2044365ebfda2862dd.1638976229.git.christophe.leroy@csgroup.eu>
 <1639042828.6q5z2bujam.astroid@bobo.none>
In-Reply-To: <1639042828.6q5z2bujam.astroid@bobo.none>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a03f7d1-8ed4-44ef-48e5-08d9bc051433
x-ms-traffictypediagnostic: MRZP264MB1608:EE_
x-microsoft-antispam-prvs: <MRZP264MB16081F60B5349248AE6F38DCED719@MRZP264MB1608.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mD77MfelZtIyoxw7IVkT/ROjoAtc/RUjDcPBsF0fEqm0SggPsGjoR8MWlQ62tBkn0tjwR5fmZR10KXEMbR3DRSQkYSWMQ1JlZTgWNbJSkZidigEpeVG9P0Y943kpGHu9wsZiGcqdJS1KnFZaqsssf5Mpr/VUvKNEt+ELGtzVaTfjlgKTNSjNAdnY0P8kUvo1Ao5/izFGlUP15p1/MOvfdCFwSwPvUto8hU3naDowWOtVw15P+87yhT4plKwP5BoqOAqsDg1a0b4T8nPHH1ARdOY0i/ffmo842BVOCx9lteQtt8IENgzxRQeH9e7T6XgQeiH+WT+1RSzLp9eu/Bkk8kJCe4iL79BvWOK2+mo6FYhUv5Ru6FCknnukGJEbFFoBLKRzczXSDsAzhQk7EL6NiOBJ6OoBCuEnesRH2PT9PumX0frPPkcRfxizIoePGqX7jj9TCM696AWLQyfk8kgaxLBprwbTmsq0umAbjIydIx9nDectDbZ3o7srWLTPc6aurWA8Ycx+cWOGvCZS5D64BtOVEWYP1spJxTTiNanWkgJzGR56mkrBPakJsWQVEWxtswdy3kHeF2L9+RGb9QB7a8tn5SN5Uuso2kwFUn+E9dsYzYQWTRsZvvGbdslbJ2g0FyGUjqJrLDNblDiomN9TRfluU4NwfiSn+eEMV2iaLVqSpOrBhCdXUqlJ4zfBUKVszSfQNlJRvcwPc1f/rnflWvSsJhcYh2nNuxmT3Pr+lKJh5uGuz9GW4iO+ZuIRLpHfYXGtMWcFpJppS7AU5zS4FMEJfOE/vi66Tl8sYjbU5Uo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(86362001)(66574015)(6506007)(4326008)(8676002)(8936002)(2616005)(36756003)(122000001)(54906003)(110136005)(26005)(508600001)(316002)(186003)(66476007)(6486002)(31686004)(71200400001)(38070700005)(83380400001)(66946007)(64756008)(2906002)(91956017)(66556008)(76116006)(31696002)(66446008)(44832011)(38100700002)(5660300002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDFVU2o3dUxPOWVxL29BZHZ5QzI3UmhPcGFlUFhSSmRQNzU3cFVxWkFEYzV6?=
 =?utf-8?B?M3Y0N0ZkSmZEVUh2ZDhGaGZnNE15MVIzQ1FJM2w0dDdld0NKanpBTGxKaktZ?=
 =?utf-8?B?ejRjV0xsaHZHUldwdEZWOUxOcW1iODl5UHM2NlAvRFFhWWViN05QYU4wZyt3?=
 =?utf-8?B?MWdCYURqQzg3TFRJRzh5OVltcEJ0ZTFmSXhmSk4zeGJoTVpLQXVobGlSS2dU?=
 =?utf-8?B?cjEvYkRHWUZ5SzQxYzF1dko4eFdKbEh1M2NsZmdzOEx3bGVkdWFjRGM4NnlR?=
 =?utf-8?B?T2V0QjdkckFKWi9HY2pKTkY1cVhMQlViMWZpRlBXZE85RkU3bUhFMVRjOVVR?=
 =?utf-8?B?LzVJVFB3Tkt4TXQ3RVpsRGp4QXVtUWZZVnpVUitHRkhNUkpaMGM5K2o4dlNr?=
 =?utf-8?B?ZFlkTDNueVFENlowUndHMktuK1EwV0E4ZUxiTEZNY29DWmh1TDZiU252eWR5?=
 =?utf-8?B?ZW1jVXVwMkFxd1A5d2w5QzBUQ0JtVlZUQm95SHdpd29pVWdjZ0FZTTRrcFZ2?=
 =?utf-8?B?dTZ4Y0JVNkVWYUM1bG5rU2ovbnFhWW5IQ05ZSFd2TXh2UHdMckY3Rk9MQUFZ?=
 =?utf-8?B?UmZOaVhKdVIvZy9wRE0wQUtvSjFGczRTUnIwdHd4Y2g0c21mSFdHTklydTlP?=
 =?utf-8?B?cTNUc014T1F3WnVHa0lSUWF2YmlLcmFpNjNmRyt3MFJIbmV4bmRrdkEwNFlB?=
 =?utf-8?B?OXNKR1cxRnQ1WXB6bzY2dUdpajNVTU1nR0JxMUhlQ3NzRHM0U2JtRDhWSjVt?=
 =?utf-8?B?OFhhMVhaMDZJaXorcEZMKzVyUnFNdjIrY2lLeG9zRWpsK1Y2aGZOQ1J2ZStn?=
 =?utf-8?B?Yk9ZeXZvVjVQa1NLaGllUFVJdXlKdHFEWFZ0eWsreHhQSTZubWlpcmtnUkVP?=
 =?utf-8?B?RTRJSDRVVWE3NVR4TENVWmdmSXozbDMrY05sbjhnVjRiYldtR05lZ1UrSTdD?=
 =?utf-8?B?OER1ZWlpbmZVbXl5cjByMGZkUmYzOUhycXVMWGZNT2dJNjJYTTVQY0w3VTVj?=
 =?utf-8?B?citIL0pncUUrdTlqMGdXYWNjOHdxL1NvcGtMS21RTmx3UVFwYm9LQmM2a24w?=
 =?utf-8?B?WHA1eitDK2hFOWZIM1VuWnNnSmZiZHpobXdFWVNPN3pjWXBiTmdzekU1MUIr?=
 =?utf-8?B?WmpDZFNSQXZKMWNtajNaMnJTOTVzZURvNS96THNBZDQrRlBvVlFMOGVNMmgy?=
 =?utf-8?B?WVg2aE9ROERPQTJNaWxuU296c2lsaE1DRTU5OGJPUDQ3T3dBUGlqczhxak1q?=
 =?utf-8?B?dVhxTGZGWkNqQ1c4bXNSbHIrVnE3NlQ3TnpBMk9aRVJTS2tyZUJPczRRMG9v?=
 =?utf-8?B?cG5pd2Z0TjdmSWRJVTFLQXB5V1dmTHZyelp5amZGcVFEZHFSbnowdDZQd29R?=
 =?utf-8?B?dmdaTEZ0RkVxUkh6Z1lBakFMdnZtbzVrNVZDRHJVTU91a1NQM3pYUzROUDNn?=
 =?utf-8?B?RGlnOGlKcGkwdDd3WHhnclZ2b1RURndSNmx0TGVtUjkzYkl2MjlzS3ZWV0FV?=
 =?utf-8?B?OWY0V2dvUC9ncEdwVndWY2dJc1RoMGVheXdNNkNXRFhNSXlIR29Yb01mTjlq?=
 =?utf-8?B?YmEwY3pjQjl2OGF0UGF5Y0IyVHB4R0VVY25GenJhTlplZlBHYkR1TFhwdm5y?=
 =?utf-8?B?NWlzeTEzYUZjUXlOd09tbWduZCtWa0pYTTJBbkcvNmQ4akk5MlhEa3M5dEsr?=
 =?utf-8?B?eXJjYzh3bkV4cy9BK0NrR25jeEZ6K09uOEFsZGZkK2JxYTVZOFRWY0V4S053?=
 =?utf-8?B?L3MxTXdUQ1ZaRG8xd3U5VHFiT3pPcGRHK2xGRlg3OEtpT3R4cFc4WmVvQVVa?=
 =?utf-8?B?YmZDMnI2dzAwRENnZlpXM1AzZFcwa3ZqZGU2cVV5RGZ0Mjd2UTJONFQvdVhI?=
 =?utf-8?B?YXI4emd1TVhjcktVNTgvN2MrL2swRnorcEZyS1U5NnRHZ0dXZWR4a1lSSEZU?=
 =?utf-8?B?ZVJTZ29BK3NxRkRRVlFRc29qOUpsblZsYWlJUml6ZDl1SWt4ODZvTVBVUmNn?=
 =?utf-8?B?R1M4UFgxZXAzZm85WmNHV21BREdiLzFyMlcrOHdaSTF2ellVVGd6SXoyUjRu?=
 =?utf-8?B?aFFWeGZGUlpFYmdmK0N4Wkc2SXoxQU5rS3BuZEdSU1prWmRnL3NLSE1vR1FW?=
 =?utf-8?B?NHd2SlJmRzlyS2lVSC9UblgxUW1mMFE5Q3RtcFNqVHFQaHM4dXBqa2pXYXdu?=
 =?utf-8?B?M0dmaUVFNnM2ZkhJMWx0T1pTNHI4ZmlyUGNqcTl5RkdpdG5ieGxSV1dEUnMz?=
 =?utf-8?Q?nfrXyeAWbJp4pj11sSTBXo3sKhkCLyy5YNje6Rsmwg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45AA9F600EB9E447942595E810E674A6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a03f7d1-8ed4-44ef-48e5-08d9bc051433
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 17:47:04.8075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FXyGHCSXMB3p+GVfSxL8CKXFlb9M0Pu0bRvyyK05SAJcS3pMv/vNFVBLsjoDOka6f3nsXKEUKA6WlajC6Bb1sXv7+wvdf+MJM3wP/E5BqJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1608
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzEyLzIwMjEgw6AgMTA6NTAsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBFeGNlcnB0cyBmcm9tIENocmlzdG9waGUgTGVyb3kncyBtZXNzYWdlIG9mIERlY2VtYmVyIDks
IDIwMjEgMzoxOCBhbToNCj4+IFVzZSB0aGUgZ2VuZXJpYyB2ZXJzaW9uIG9mIGFyY2hfZ2V0X3Vu
bWFwcGVkX2FyZWEoKSB3aGljaA0KPj4gaXMgbm93IGF2YWlsYWJsZSBhdCBhbGwgdGltZSBpbnN0
ZWFkIG9mIGl0cyBjb3B5DQo+PiByYWRpeF9fYXJjaF9nZXRfdW5tYXBwZWRfYXJlYSgpDQo+Pg0K
Pj4gSW5zdGVhZCBvZiBzZXR0aW5nIG1tLT5nZXRfdW5tYXBwZWRfYXJlYSgpIHRvIGVpdGhlcg0K
Pj4gYXJjaF9nZXRfdW5tYXBwZWRfYXJlYSgpIG9yIGdlbmVyaWNfZ2V0X3VubWFwcGVkX2FyZWEo
KSwNCj4+IGFsd2F5cyBzZXQgaXQgdG8gYXJjaF9nZXRfdW5tYXBwZWRfYXJlYSgpIGFuZCBjYWxs
DQo+PiBnZW5lcmljX2dldF91bm1hcHBlZF9hcmVhKCkgZnJvbSB0aGVyZSB3aGVuIHJhZGl4IGlz
IGVuYWJsZWQuDQo+Pg0KPj4gRG8gdGhlIHNhbWUgd2l0aCByYWRpeF9fYXJjaF9nZXRfdW5tYXBw
ZWRfYXJlYV90b3Bkb3duKCkNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95
IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBj
L21tL21tYXAuYyB8IDEyNyArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMjEgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9tbWFwLmMgYi9hcmNoL3Bvd2Vy
cGMvbW0vbW1hcC5jDQo+PiBpbmRleCA5YjBkNmUzOTViYzAuLjQ2NzgxZDAxMDNkMSAxMDA2NDQN
Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9tbWFwLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9t
bS9tbWFwLmMNCj4+IEBAIC04MSwxMTUgKzgxLDE1IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQg
bG9uZyBtbWFwX2Jhc2UodW5zaWduZWQgbG9uZyBybmQsDQo+PiAgIH0NCj4+ICAgDQo+PiAgICNp
ZmRlZiBIQVZFX0FSQ0hfVU5NQVBQRURfQVJFQQ0KPj4gLSNpZmRlZiBDT05GSUdfUFBDX1JBRElY
X01NVQ0KPj4gLS8qDQo+PiAtICogU2FtZSBmdW5jdGlvbiBhcyBnZW5lcmljIGNvZGUgdXNlZCBv
bmx5IGZvciByYWRpeCwgYmVjYXVzZSB3ZSBkb24ndCBuZWVkIHRvIG92ZXJsb2FkDQo+PiAtICog
dGhlIGdlbmVyaWMgb25lLiBCdXQgd2Ugd2lsbCBoYXZlIHRvIGR1cGxpY2F0ZSwgYmVjYXVzZSBo
YXNoIHNlbGVjdA0KPj4gLSAqIEhBVkVfQVJDSF9VTk1BUFBFRF9BUkVBDQo+PiAtICovDQo+PiAt
c3RhdGljIHVuc2lnbmVkIGxvbmcNCj4+IC1yYWRpeF9fYXJjaF9nZXRfdW5tYXBwZWRfYXJlYShz
dHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhZGRyLA0KPj4gLQkJCSAgICAgdW5zaWdu
ZWQgbG9uZyBsZW4sIHVuc2lnbmVkIGxvbmcgcGdvZmYsDQo+PiAtCQkJICAgICB1bnNpZ25lZCBs
b25nIGZsYWdzKQ0KPj4gLXsNCj4+IC0Jc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBjdXJyZW50LT5t
bTsNCj4+IC0Jc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7DQo+PiAtCWludCBmaXhlZCA9IChm
bGFncyAmIE1BUF9GSVhFRCk7DQo+PiAtCXVuc2lnbmVkIGxvbmcgaGlnaF9saW1pdDsNCj4+IC0J
c3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvOw0KPj4gLQ0KPj4gLQloaWdoX2xpbWl0
ID0gREVGQVVMVF9NQVBfV0lORE9XOw0KPj4gLQlpZiAoYWRkciA+PSBoaWdoX2xpbWl0IHx8IChm
aXhlZCAmJiAoYWRkciArIGxlbiA+IGhpZ2hfbGltaXQpKSkNCj4+IC0JCWhpZ2hfbGltaXQgPSBU
QVNLX1NJWkU7DQo+IA0KPiBEb2VzIDY0cyByYWRpeCBuZWVkIHRvIGRlZmluZSBhcmNoX2dldF9t
bWFwX2VuZCgpIHRvIGRvIHRoZSBhYm92ZSBub3c/DQoNClN1cmUsIGdvb2QgcG9pbnQuDQoNClNl
ZW1zIGxpa2UgSSBnb3QgaHlwbm90aXNlZCBieSB0aGUgY29tbWVudCAiLSAqIFNhbWUgZnVuY3Rp
b24gYXMgZ2VuZXJpYyANCmNvZGUgdXNlZCBvbmx5IGZvciByYWRpeCIsIEkgZGlkbid0IGNhdGNo
IHRoYXQgbGl0dGxlIGRpZmZlcmVuY2UuDQoNCj4gDQo+IE90aGVyd2lzZSBncmVhdCB0byBjb25z
b2xpZGF0ZSB0aGlzIHdpdGggY29yZSBjb2RlLCBuaWNlIHBhdGNoLg0KPiANCj4gVGhhbmtzLA0K
PiBOaWNrDQo+IA==
