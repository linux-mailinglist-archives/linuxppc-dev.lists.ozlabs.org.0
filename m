Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4687F6367
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 16:56:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QF1gGEWE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbjQf0vlxz3vX0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 02:56:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QF1gGEWE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::602; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbjPj6FlBz3dKw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 02:55:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYfnuhVslhBHu0cu5+qeISTdxwei9F/CYdDJThar+WeRHDfnnUanPYE1e+rSmgp/apaD5a7Dh9AGOQNa3H/8aqaWDQt2ZvJxbV6UrWpGuyTDTk7nr9NDGwyH8hMaL9+YPTIeWAS5Vdk+DDxOeYGgjFl2Jqr/HXV5x7nNa9QTqQCeu1KEvU/Rk78Yf73zAAfuI7phEDzE0d5DsenRVJNxcernSwxgCXvgO1AUdPOqHWxWEPo68XrzH0Vw9sufGA/2FjS8kghPrbCQ1AtKV6+bSiqePJVU6w1pIACh5R71A0n/wsS/R7mGMZdnWfFyMaSuE2Hn8uU8qZdITqByqrHriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwGTbCY0pkccA43cJ28hhNG70HnU6EhmCjzovW7b7mg=;
 b=IuxwLXRTXcGwSyXP4izk+dcXSZBSebEKXMlSb4uS9VISF/HbgahsgGua3xwajEgEhg2p0t+78gRtpZsi5nfsZawpp7y9dVlRs4t+im7sbMt53CCH5sac2cxbO1kqpUcvnhxZQxdX0+ZHHsAzcu/1yGGWnFbUVUfuIwq5fhuWupTp/4BbRMcYSlxSDynggcUBChBxoSNCVhfgnZ+IA517x6XvGpwiDELVwo2ExczBNU7EMWS35MyPVy42Bw5UMr1yienQ5faJIenwCChDW9wKSCCKXEhn80T76p+bZ6j6UnOwjqqQwT4PDGAOG8uMvH2xqlJJr4q2Qz71Qg5XkiHRvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwGTbCY0pkccA43cJ28hhNG70HnU6EhmCjzovW7b7mg=;
 b=QF1gGEWEoDCVJI5pAo4UJ/8cLkK41iiTffclt8TU+3SMPIxKrlZE0+DrTluuXbjNUPk/5dSVmmHgOvqy+9354wLum+gJlETMQ3TXOAJzY9bDzp8Q2FXEhnQDBIbbXYWey8+nSv1OusiKlprlIZAwIiI304YEZEwSA1aaCVsfCctSFuHrGXfpMu4HMUeTAX73skY+1JTF1V4CbjZINe3riaQt5uyKl0w+egMHihMODMsQDrGOpQ59H2LTuBec8Z2LTMimRUron1r9NldhKuveI4RnQExolX1z6R96mHda6zhJuKIjdWt6laW/n6gPaHC9FFMJHLvqgVGWn5vT8DbaDA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1735.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 15:55:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 15:55:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 29/37] powerpc/nohash: Replace pte_user() by pte_read()
Thread-Topic: [PATCH v2 29/37] powerpc/nohash: Replace pte_user() by
 pte_read()
Thread-Index:  AQHZ796VGrFRjZzNY0e1MZG5pRhZKrBj5oQAgAmiDwCAAZXrAIADdLyAgAXD+wCAEBPoAA==
Date: Thu, 23 Nov 2023 15:55:07 +0000
Message-ID: <981ff165-19bd-4e69-8d57-6b4f92e6f194@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
 <72cbb5be595e9ef884140def73815ed0b0b37010.1695659959.git.christophe.leroy@csgroup.eu>
 <877cn39jyp.fsf@linux.ibm.com>
 <02c4b724-f503-31ea-eb77-4b3cd6776fd8@csgroup.eu>
 <87zfzpznz5.fsf@linux.ibm.com>
 <a67c0d93-f4e9-d5c5-a5ee-3347c80f0a64@csgroup.eu>
 <8734xa9ck1.fsf@linux.ibm.com>
In-Reply-To: <8734xa9ck1.fsf@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1735:EE_
x-ms-office365-filtering-correlation-id: 4544bcf7-16ca-42bf-c76a-08dbec3c90ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QmjMHDFjox+FAXd799FrCITCRK12T3S0mujG4LaPWpZSjwAaEzV8sSKx/fdLq9zzOwF+8pybrIIE7eioirZsuoRhmZHn5qzIbwRQlwkk10SRUsTGGbRXWMVeoBRwiQPS97bqG4F7CQgUdnVJ72nayHlBM95pe7ct93ZiUbVm/bNb+zMP5KNUq3STqxWTluaRv1d7/9ZFf9qD7NPCV4P/R9HiQHyolg6zIVUpArHvrmCxI9RuNqhin1SvLBkUKCE2Ua70WgBPIikpu/EVJFRapoDzVB/sQaimeyS8JorSMDquR0qdp47cuRcauRRoq1qVWL/ImNi4jwEAAGgnyPvasXhB7O8CbdqFTAr4VR3Yp9i1ypYQzgxrLHF/pyOlYwziOWv2j5823bI3gt7KnaxxphLL+LuJdSlm8BlMoPYNZNV1fpnRDXWiZnWjSlh6Gi5JFLAOpzJv0XOXxhKzfcEXXSouLtWbeuZ5mP5BCybFb/QlAQoCcMqv34oF3hfHGeO5yhvUg2Qy/yMzM181BZvtDCstmdJwLM+jYQ3d5SL6BZ+7gw4LSQGzBRAv0Y3XTPwNLnTC95BzmM4QKM3LiHxw7hnIGehl2NMfsbCdXZjuoNlbargTpn4xkIK5PQ8IQwYLz7rFoamfb6eA+M+z4GC6u/iisOmsYHzA73lVD06C0MJhzRE/n/m5ccpQqZqhvnHY
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(38070700009)(66946007)(66446008)(91956017)(76116006)(64756008)(54906003)(110136005)(38100700002)(122000001)(36756003)(31696002)(66476007)(86362001)(66556008)(71200400001)(83380400001)(2616005)(6512007)(6506007)(478600001)(2906002)(6486002)(316002)(4326008)(66574015)(8676002)(8936002)(5660300002)(44832011)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OWdNY2dqMC8rYmVjUnJiVlF0SGpwSkMzd1VOZU1iS2RrNTZYdUl0Z2JoU3hx?=
 =?utf-8?B?VjZuRWxJdUsxM3FKcWxKQmM0VG9aZVFWZSt4QkNxN09CR0hocWNscWR3R2pz?=
 =?utf-8?B?VnpPMmVVMDhxb2JnaWpGaWFjNm1aa0IrUUlEeEw5OW9vd2xNb1l4UStDbWo0?=
 =?utf-8?B?d1d5c0MxeUh6elFBNEdyOW5MenNVc3VWek1kTGVPT0FhaUNjaGRSbUYwWUE2?=
 =?utf-8?B?M1BuUVdTY0JFbkdpK21JaGJDbWIyc2NwbEtLUnhLODN6clN5dEdMOXZEVlcr?=
 =?utf-8?B?Qm1zR2ZLWnRMdmFIVy9ieEZ0T05CdmVGbW5FM2RUQTNXcTZnRGZBWGk5MmtU?=
 =?utf-8?B?MXVXZHpYWE8rVUN4Q2hDNG85MGlBaXlzYzQ3NmozWVRwQUdadXNuczlMZnRW?=
 =?utf-8?B?SVpGd0ZaeDIxTlR6R0Jic1ZDMm52dzJ1cHZ4UW1aQndVUnpwQXB2WlZDVllJ?=
 =?utf-8?B?QWhSeHNNSXhINzhnS2Y2WE82NWYrek5jL1JOQWU5dXVKTU0zVllvUXFKWWNj?=
 =?utf-8?B?OVAvZTF6ZkRwdEIzTVA1aVp4WXRqYnFheWdYRW9FYllqQ2RrOGVkZmNCaDRS?=
 =?utf-8?B?THVtVWxtbm1xMEp5ZE5EbGpXdGd2c2UrK1A1TGtlS3NMVU9FV0NyNFRCVTFH?=
 =?utf-8?B?TVQvelo4N0lzZ1JHUzExNWpNc04zck8zN1hpVWVkenppeUtnTFNFK2Jmc0ZV?=
 =?utf-8?B?REpGZUZpaEV3aXBQU2JPbTdGcDlPcUgxcWtsbjIraFo2RDNOMndsSmlZVW5q?=
 =?utf-8?B?akk3RFovY1dFMjlQRGxwTEhjUGxhYnBYQTdidlh4Q3RML1BhR1hPZHYrdXYz?=
 =?utf-8?B?eHB1REpDSzFoVnBnRWdPa3pmWEFTWGVLR0lhemhRd0s1WXlsUWQ3Q0VENVli?=
 =?utf-8?B?L0dVOTd0eEUvUUpGYUFOSThzRUQ1UzVuRW9mSFF5VkVYVjV2d0xVOVRJQWVk?=
 =?utf-8?B?ZGRNN3lLblVXdkNhdGJNbW1BU0E5NnlONEhHZkdVdElvMnpQb2N5T3dQYWsx?=
 =?utf-8?B?SjJEYmtRMXI5K0hHRmh6bURDMnRIcWVBSUI1NTZhZVh4Tmh2WTc3aTZjR1BS?=
 =?utf-8?B?NzVkSXRCRGIwY01QU0pZdVNYdlRQYjJabnQ3RW9LV1MvbkxuNmF6OFpGeFor?=
 =?utf-8?B?bUxINXg5RllSUGhqVFc2Qzl2a0owN2RSZTZjdXBocS9vNDZ0dnJrVWlVZ1Y0?=
 =?utf-8?B?bnM1WlE2VGkyMEpUZHhFYkY1Ri8yMERMZlhQMkU5RDhNQjVPT0xjZFJNamNo?=
 =?utf-8?B?YlRDRWJMb2crVEtQQkk2d3J3UXhUd0pCTmZPYXNQdkYyRGlGTmcvUnNoclZu?=
 =?utf-8?B?S0NrTVdkUzEvUHdVUWdCNnFUTE9QdUVkNFBvSUoxR1pLOVlxOVlzM1A5TDkx?=
 =?utf-8?B?a0FCeDA1d0dBaXEyV291cy9iVlg1VldGaTFGTmw3MzNkT2k5Nkw0cDdNTlNS?=
 =?utf-8?B?NEdWY05BMG9hendPVkRBWkFMd2pvMmU5NEtGSWg4VWswRkc0Uk5WeVc5c1JE?=
 =?utf-8?B?U2FyKytmS2VoTzFXMWFGck83QUZqekdWd0x3SGJQeGxtM1czNEhad2Zlbk5u?=
 =?utf-8?B?OU16RXNCdjNvOE5qeGZVVnNNbHJFWUZQS0NjMlkybllRZFhHQ3UrMC9tTjN2?=
 =?utf-8?B?RmhmcGl1YnJDUmgxdEhHUkxIUGNrUlgvS3hiNDhvWk5tWi84MjFZYTIzcURR?=
 =?utf-8?B?UWppZUx3WGw5V2w3ZHk2cys3clpwTWM2TWZtMHkwMmRkV0pRN0t2L01Bc0RI?=
 =?utf-8?B?ZmhobjNnT0k0Uk5ZVFJzQUZjSXZjQlM4TUk3aWxLQzN1RjZvdEI0Sk5Xcmpy?=
 =?utf-8?B?TzdYdVQ0U2xIdm5hU1J2WWk4ZkY4bDM2L05nMzNTTXdBNDRtNERkN0lIMUpD?=
 =?utf-8?B?NmM0TGFDcmQrUTgxTkRXSitPckZWS1NNQ3MvdHJJcEdlNVM4eUhtWXFQRzZV?=
 =?utf-8?B?ZUdTWGFuYmY5QVI0cVVNdEJzeUtUNTNoZGlXQU5PWUx0SERWOVFYOExVc05B?=
 =?utf-8?B?Sk5GN0F6SU1oSi9aMTdvMmFVZ0gyMngwMERWRmFtdk9iM3hYOGNEZVk1dU9R?=
 =?utf-8?B?SkM0enp5VlA3VzRNUzFHa3Nza25SSU91Qi9ZVW1ZMWRKbzdKY0lVRXhDcnhi?=
 =?utf-8?B?ODZLNVhtakhXRGFDRE15QXNIRmJRcTFNOHpieXZwTkQramJJWjM4cXlyVEhE?=
 =?utf-8?B?eDJSSXNaZ2NUMGwzdnlUQ0VwUzRPbnduWE05S0xkRWgwWlBsYkVsTy9SRjI4?=
 =?utf-8?B?Wjl1WG90czlsZnYvMHBNODRVWnBRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6388CF8AC4550346BDCC3BDAAFCFEC91@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4544bcf7-16ca-42bf-c76a-08dbec3c90ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 15:55:07.1936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R4AMMgAiFb+rvpGDyXS1xqlFrJuVCAet/lyiQC0q50UYrelR8MWc0oBXkAZIby9lSepgvtlGsgH7SOXTmMyhCO9fW/h0SwbZaCgGXCxz88o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1735
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

DQoNCkxlIDEzLzExLzIwMjMgw6AgMTE6MjMsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+IA0KPj4gTGUgMDcvMTEvMjAyMyDDoCAxNDozNCwgQW5lZXNoIEt1bWFyIEsuViBhIMOpY3Jp
dMKgOg0KPj4+IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4g
d3JpdGVzOg0KPj4+DQo+Pj4+IExlIDMxLzEwLzIwMjMgw6AgMTE6MTUsIEFuZWVzaCBLdW1hciBL
LlYgYSDDqWNyaXTCoDoNCj4+Pj4+IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldT4gd3JpdGVzOg0KPiANCj4gLi4uLg0KPiANCj4+Pg0KPj4+DQo+Pj4gV2UgYXJl
IGFkZGluZyB0aGUgcHRlIGZsYWdzIGNoZWNrIG5vdCB0aGUgbWFwIGFkZHIgY2hlY2sgdGhlcmUu
IFNvbWV0aGluZyBsaWtlIHRoaXM/DQo+Pg0KPj4gV2VsbCwgb2ssIGJ1dCB0aGVuIHdoeSBkbyB3
ZSB3YW50IHRvIGRvIHRoYXQgY2hlY2sgZm9yIGlvcmVtYXAoKSBhbmQgbm90DQo+PiBmb3IgZXZl
cnl0aGluZyBlbHNlID8gdm1hcCgpIGZvciBpbnN0YW5jZSB3aWxsIG5vdCBwZXJmb3JtIGFueSBz
dWNoDQo+PiBjaGVjay4gQWxsIGl0IGRvZXMgaXMgdG8gY2xlYXIgdGhlIEVYRUMgYml0Lg0KPj4N
Cj4+IEFzIGZhciBhcyBJIGNhbiBzZWUsIG5vIG90aGVyIGFyY2hpdGVjdHVyZSBkb2VzIHN1Y2gg
YSBjaGVjaywgc28gd2h5IGlzDQo+PiBpdCBuZWVkZWQgb24gcG93ZXJwYyBhdCBhbGwgPw0KPj4N
Cj4+IFJlZ2FyZGxlc3MsIGNvbW1lbnRzIGJlbG93Lg0KPj4NCj4gDQo+IExvb2tpbmcgYXQgaW9y
ZW1hcF9wcm90KCkgSSBhbSBub3QgY2xlYXIgd2hldGhlciB3ZSBjYW4gcmVhbGx5IHVzZSB0aGUN
Cj4gZmxhZyB2YWx1ZSBhcmd1bWVudCBhcyBpcy4gRm9yIGV4OiB4ODYgZG9lcw0KPiANCj4gcGdw
cm90MmNhY2hlbW9kZShfX3BncHJvdChwcm90X3ZhbCkpDQo+IA0KPiBJIHNlZSB0aGF0IHdlIHVz
ZSBpb3JlbWFwX3Byb3QoKSBmb3IgZ2VuZXJpY19hY2Nlc3NfcGh5cygpIGFuZCB3aXRoDQo+IC9k
ZXYvbWVtIGFuZCBfX2FjY2Vzc19yZW1vdGVfdm0oKSB3ZSBjYW4gZ2V0IGNhbGxlZCB3aXRoIGEg
dXNlciBwdGUNCj4gbWFwcGluZyBwcm90IGZsYWdzPw0KDQpEbyB5b3UgdGhpbmsgc28gPw0KDQpJ
ZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBpbiB0aG9zZSBjYXNlcyBpb3JlbWFwX3Byb3QoKSBp
cyBjYWxsZWQgd2l0aCANCnByb3QgZmxhZ3MgYXMgcmV0dXJuZWQgYnkgdGhlIGNhbGwgdG8gcGh5
c19tZW1fYWNjZXNzX3Byb3QoKS4NCg0KPiANCj4gSWYgc3VjaCBhbiBwcm90IHZhbHVlIGNhbiBi
ZSBvYnNlcnZlZCB0aGVuIHRoZSBvcmlnaW5hbCBjaGFuZ2UgdG8gY2xlYXINCj4gRVhFQyBhbmQg
bWFyayBpdCBwcml2aWxlZ2VkIGlzIHJlcXVpcmVkPw0KPiANCj4gCS8qIHdlIGRvbid0IHdhbnQg
dG8gbGV0IF9QQUdFX1VTRVIgYW5kIF9QQUdFX0VYRUMgbGVhayBvdXQgKi8NCj4gCXB0ZSA9IHB0
ZV9leHByb3RlY3QocHRlKTsNCj4gCXB0ZSA9IHB0ZV9ta3ByaXZpbGVnZWQocHRlKTsNCj4gDQo+
IA0KPiBXZSBhbHJlYWR5IGhhbmRsZSBleGVjIGluIHBncHJvdF9ueCgpIGFuZCB3ZSBuZWVkIGFk
ZCBiYWNrDQo+IHB0ZV9ta3ByaXZpbGVnZWQoKT8NCg0KSWYgdGhpcyBpcyB0aGUgY2FzZSBmb3Ig
cG93ZXJwYyB0aGF0J3MgbGlrZWx5IHRoZSBjYXNlIGZvciBtb3N0IA0KYXJjaGl0ZWN0dXJlcy4g
U2hvdWxkIHdlIGNoYW5nZSBwZ3Byb3RfbngoKSB0byBwZ3Byb3Rfbnh1KCkgb3IgaGF2ZSBhIA0K
cGdwcm90X251KCkgaW4gYWRkaXRpb24gPw0KDQpDaHJpc3RvcGhlDQo=
