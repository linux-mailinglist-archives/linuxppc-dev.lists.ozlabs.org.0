Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5405F6FC5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 22:51:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk3Wx5ZGgz3drR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 07:51:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PLYw7z9c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.75; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PLYw7z9c;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120075.outbound.protection.outlook.com [40.107.12.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mk3Vx6JdGz3c6r
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 07:50:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j58ggyKVqlpXomvOqvNMfvQCTJE4MIEkGQEoHCaHoPH8g/7O/153jF8sc6EVFu3/oynKIGUMBASJa9FOcbjcbKGxOJU/9XfFpgqlQ2ZUrUjX7j+E6QavGpbzK/sEE/Y3zMgGQDtM9l4EmuEWmoPbXP6UagoBFO+KUOFoJs5mITmUlT9xMk7x/Kbpkhbr22NQC9ao0AL88BDBPnt+zSFPyYCl28AaYqolu2+TEyclp0UIK5JhF3zraORI28P/3LheLoy/Ub6rpXOLGRbZ7ivNpvkV6OfVBwheix6GTU4FyeBs8U/HDmFGIGvMspnj2qQjKoF83WKuB5sDRjxNdPQI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOXTSsf7csV/Lp0eXihSsQAZ6PZB2nV55gXnQ4juDiY=;
 b=miP9eR+26FsdTsU5Zo6NVoWYO+xAalNV1kAPtq4fsTLIdhfxezrktHyaBBFEe8Cdft7HQ0VBUdrp36sMegefuATM+69J/k5SFeEnKdJ+GRvlCnSPkQPJCebBR5KOo8euOzgzD8Yv0NuthQZ46H2F6foSa8zT4vtdSBZBWCgWlVnuMGcu8uKdqBgUre5ieE0ZahwyMNAxU0/mwvMGZ9bBcJOMVi3Qxx3OTE4kdnZYzHJ71xn8d08THAaoHtu+TsMP00lrVT9d9tJCUhyGNFrXfyQulix27G2/YF6m10x/u1rfoJonvx3bisI+hDY322/Ilh/3a/qmi/WMjRRyOs5EIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOXTSsf7csV/Lp0eXihSsQAZ6PZB2nV55gXnQ4juDiY=;
 b=PLYw7z9cZ9Lg464LnnUYBCQQM2Uo1ec5/UIRnE/uCIkmukvOuLi8uteFyUfjSOMmLrgUB1s/65AvUs0kOjT5v4dyfgxvT7y5tO/4nZERcvh6RJ2BOa+dFTG1UkmZE8tQYhG8HJYNWA7YsqF7U2F5Ril8HlPKOr9ltcbYweARomsYKITuz+UWhB+SK/LMGt0qwONL93A0v4GF92o4t2/0i2wwC+dGbdw8xoliS9d9pB1u0zxk2J61U5QDOuLMK/xwbn9lQOpT30Cv4ZQnZXnqpvP+iRIKDH57i/Ehx+JrKWDGUiBLPPgQKrCJ0bjLQeU8k3qMDiZAbUHfD5g4xLWXgA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2174.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 20:50:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 20:50:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v3 5/6] powerpc/64: Add support for out-of-line static
 calls
Thread-Topic: [PATCH v3 5/6] powerpc/64: Add support for out-of-line static
 calls
Thread-Index:  AQHY2Hvw77zNAtfUm0aSr4Prvs66h64AMxyAgABUNACAASkFAIAABDeAgAAjpICAAAFiAA==
Date: Thu, 6 Oct 2022 20:50:31 +0000
Message-ID: <0c92ba89-4cad-524a-4c02-8064d451b7b6@csgroup.eu>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
 <20221005053234.29312-6-bgray@linux.ibm.com>
 <b76d122b-5487-b677-11e1-58e53a6b521f@csgroup.eu>
 <878rltpyy1.fsf@mpe.ellerman.id.au>
 <20221006182254.GR25951@gate.crashing.org>
 <2bb8accb-30c0-67e6-7ad5-36c02d46a2cd@csgroup.eu>
 <20221006204533.GU25951@gate.crashing.org>
In-Reply-To: <20221006204533.GU25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2174:EE_
x-ms-office365-filtering-correlation-id: 6e908db2-5d06-449d-5719-08daa7dc6852
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  RTHWz8zcznR2XyU8ra2Uo2eZIK0qlMljENzcQRCPHK4vyBPABFxNyf4lgAwbvSnXbQMnVH8oTXMoIzfSYiiY/uPQ0LMNZrZcMpvtm5TbkFnwkIV0CGq8f3P5mn3W/Rfa6TQG5qGedgkQuISAV6Af6lF83+QniEeEUwAQ7WOMsWwSSg5KW3GfWw9ZHrwRAuKYXhtymm0uM6vXAoRl/9dip8jw6qG5A9Uoyt8R64WxbIDM3YZjm0gUXgLQrVRLP0SCHCPaDE6lw/i1UtEgvh/64abKvD/uEB6EPVI++k+/wN3ZCjdIXggVw5c6xRRertha1u/U5ezfaTCvYRRyB2WWQDFoLfTCYCTWQYfoV20FBucwchzUAizFDzYB2DiMdDjXWPM5MS4nOnhneLN5/LITmiBypSO0gjWzBrrHFPe/WfVO+CkontQRvIAus8CPLw9hv6Ijo0A9ufJlVo6pEWVSJPzS2Hyv8yFa+WJBkGB+C8NsyBF4WCMtYXAiPG829Ld8IK/Fx+jcybvRonmHp3N30Y127+kPGpV6/E9crS2kuZqHpOTiCYLs/I8pvB77MwYc6FhhVqoPfyOt+pYdYk0KRgmjhf1TcQbSz5A5tmmXJRerX5BEESJU8MiFiZpXfYE5KG09LGp/BNqbqw3i3DXVrDSCGzTotG92gHlH5QgHhdwm0fq9FP7yKhAcnhtl/GbzCRWtHE1usID+4iuGXjkKBsA7rYX0Ti+2etZlHdAsIV5Y5Rl5dA+2WAxeDoEUxjbKfgWRSaNOK8sJtIfE/nur1MIa4F/3W4KiFGNrYuaTKdsWres2Ie6AH/9ikiYbHedePYuNaer/Q+CaGS36ejEZOg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(86362001)(54906003)(8936002)(38100700002)(91956017)(76116006)(38070700005)(122000001)(2616005)(36756003)(4326008)(478600001)(83380400001)(64756008)(66476007)(66446008)(66556008)(6506007)(41300700001)(6512007)(6486002)(31696002)(66946007)(26005)(5660300002)(66574015)(31686004)(44832011)(71200400001)(7416002)(6916009)(8676002)(2906002)(186003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UUtMbHRLeTdiVDBLSG52VERUaGUvZWRyQ2lrUjNtUjlzNVB6SmMvTy9mVkE5?=
 =?utf-8?B?WVFBVnVXKzEvcHRjMHJ1Ui9PczR5TFVHcUg5RlZlYURwN09JNTJtZklRSDlU?=
 =?utf-8?B?R08zVGozcFVQcE81d1VxVkk4ZzNxR1Jpa1dSRFRML1FOVjJ4SDBmWG12TUR4?=
 =?utf-8?B?LzJVZVZiZi9QcnZkdmJWUldCRGtUODltWnplb1U5L2xEZGhaSDFpNndsdUVE?=
 =?utf-8?B?QndHR1g1UGdhem5LWS9DdDVlei83bGdSclFpQ1N2N1E1emVLc1EzaVFZYVNa?=
 =?utf-8?B?cHZyTlFvWTVITHJ0bWxkN21wL1hSMjRDdzNqZlV2aDVaWHgrNlFkcklsckg2?=
 =?utf-8?B?ZWhoNEwzdWMyRGFNelp0bXhDLzNqN241ZkcrUm8vVWtwbkZYMU1OdkVwcVRM?=
 =?utf-8?B?SWIzVFE4MC94OVlKaVd4dm10QkU5ajI3YjBWVU9RUzJyanJHeGFtZzVhOG45?=
 =?utf-8?B?aGlsZ0FaMWNXdjJJVFVQQnN3aVVWa2FPdzc5TjZWRHU3bzNVeVAraU9HUytF?=
 =?utf-8?B?VFkzTXlKWnMydDVYdjkwNDR0MWZnb3B1a1lRRWwzSERselNFY3BudUt6U0FJ?=
 =?utf-8?B?aXVmN1BBUDNkMW1rcmwxVWJDWlZFNGRqUlZGKzI3Vk5ZODErbGJTZXRIdlpP?=
 =?utf-8?B?ajNZWUtvMURoQ2FFa0VvenljQUFydUc0NktKMi9UcytIZHpRbnROZmZjQWJs?=
 =?utf-8?B?eC83Qmw5MDBxSlZKTXdTbXRHdytqQXZIMUYvYnJQU3NPVHpUbUNOL084dkFu?=
 =?utf-8?B?QXRzeWpyendUWXBVbEVrNGZJUUtjTU9xTkM2Mks3WTh0ZkNsbXhLbmtIZGRP?=
 =?utf-8?B?ajJISmc1TGszQ29BS0QwL3JZbncvbGk3bkRibnhGMGIzRjRqYmtpUHFHM3Ay?=
 =?utf-8?B?aGxVNkY2aGFOQVY0NnZxdnZab1B3OFJTK21aQlpEbmx1NWVGSTd4WGdZVFNa?=
 =?utf-8?B?R0w4eFkxUHBnR3lDL0RDaVEwbVZyRjhNUDFxS0xJUXo5UXQ4TWZJd0NNR0pT?=
 =?utf-8?B?S1ZXWVlLcFlWc2piTHdCN2tCZVI0OGtBVXhRUUVUcVJkRFdlMTRHNmRjWDVQ?=
 =?utf-8?B?VjY3OFhURDhBRklnZ0pENW9ORW1tdEdUN0EyNnZaQ1l2N1Q2TXkvMFBpSG5B?=
 =?utf-8?B?eVFDR3JpWDQ5TjdSNUFPdXczWG1NRzIxOUtsMDMzZnFHZ2ZVTE1yaHp4QklK?=
 =?utf-8?B?N1h1eWpGWXFmNnc5UnZ0WUhWc1dYQmppZmxxZHRuVk5od1hxdzkrcWdXZzhU?=
 =?utf-8?B?ckZpUmVRT3RxVmtxa29GYzhGY2Z1NzhPK3pJWkVpdFl1anBHbk5ROHdLWmRz?=
 =?utf-8?B?QUZGS213aDNmRFpUVThyaEtoTVpGaHVSQ1NWRnNnemowUnF1SWtyRVVLdjA4?=
 =?utf-8?B?SGl1VktIOUs5U3pGQkFUbGVjbjVjY1FnalIrcEJIYk5DTFl0SVQ2UE5jTlJS?=
 =?utf-8?B?TWh6aXJ3TjdqY1dvS3FZcXJOSlYwZytTZ1h4OWF4eFd1NnJLbWlnNlRaMTh5?=
 =?utf-8?B?emQ3RnFuN21xc05DNUdmWlcwRXVCRTExZTBreVNDQ2svOEJjKzZmdzJMOW1k?=
 =?utf-8?B?UUxpTWVGZXo3RzAvQ1BBcDRPV1J1MEJSTlB6NnhuZTdOQkJCem5HWDJiV282?=
 =?utf-8?B?SWlEaWZ1WUkrZjR4QUl0TURBVnhnOE4vTklROXpFQ1JjSGxOL25hOFVCNWRx?=
 =?utf-8?B?YkxqYkFlSTFiME1xekdoaGl5UWpjelVCT3FwVDdQRVpGUENmeElVRzZhK0s4?=
 =?utf-8?B?VHdwQVhvSWR0eDdNRXkzTUgwaXhiTGFDRkNra1JUT2lPa2FSNVJNSEN6ZWV2?=
 =?utf-8?B?V2VPWmRNcGFxdXFFV29zYnBBUFFXMW9tcmhoQ0w3SSszVEMwQmNwMGJhSlEw?=
 =?utf-8?B?NFpRYjdMejRIWE9GTm1qdWFxL2FvU1hxcGxhRE4xdFFPdkJNWlZFV0JCSXNa?=
 =?utf-8?B?QTRXaXJUT0lZcFJTS2N6Z2FENTNrMVUwOWRiL0ZjOUtyNjBhRDJEUm9YeDlI?=
 =?utf-8?B?R2NSeWo1RmVQcTJWWkNnZlB6TjRjc081elUrMUdGMVF5ZFZDQUZway9YRi9L?=
 =?utf-8?B?VTV1dDhKSFkvNWhBcHZkQlVPRDJYQU1iZE9Gb2d5NU96aWcvVm5WOGJlQjc3?=
 =?utf-8?B?cm5WTU90Si9pK0N4ZExMYXNJRXpCWlVmUlNlYXAzcFRZVnA1QkpMeEVTU1ZI?=
 =?utf-8?Q?b4XeHcA8XmGY/uEQneVwQ4M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBB38000E50D0E47B9EADD6A0BD31200@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e908db2-5d06-449d-5719-08daa7dc6852
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 20:50:31.1061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1GHO9mQaBuSQZWzD+3cHZ9bcYjSkPN3tUeLjlVsT3UY/731txTHlwzTm8wIGvyYr+PxK0DBmAPUO8o5WD+5WLnBqUcHf+PgwWMALOaVx2Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2174
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "npiggin@gmail.com" <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzEwLzIwMjIgw6AgMjI6NDUsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBPbiBUaHUsIE9jdCAwNiwgMjAyMiBhdCAwNjozODowMFBNICswMDAwLCBDaHJpc3RvcGhl
IExlcm95IHdyb3RlOg0KPj4gTGUgMDYvMTAvMjAyMiDDoCAyMDoyMiwgU2VnaGVyIEJvZXNzZW5r
b29sIGEgw6ljcml0wqA6DQo+Pj4gTG9uZyBhZ28gSSBidWlsdCBrZXJuZWxzIHRoYXQgZml0IHRv
Z2V0aGVyIHdpdGggdGhlIGJvb3QgZmlybXdhcmUgYW5kIGENCj4+PiByb290IGZzIChidXN5Ym94
K2Ryb3BiZWFyIGVzc2VudGlhbGx5KSBpbiA0TUIsIGJ1dCBJIGRvdWJ0IHdlIGNhbiBnZXQNCj4+
PiBjbG9zZSB0byB0aGF0IGF0IGFsbCB0aGVzZSBkYXlzIDotKQ0KPj4NCj4+IDRNQiwgbm90IGVh
c3kuIEJ1dCA4TSBzdGlsbCBhY2hpZXZhYmxlLiBXZWxsIG91ciBzbWFsbGVyIGJvYXJkIGhhcyAz
Mk0sDQo+PiB3ZSBoYXZlIHRob3VzYW5kcyBvZiBpdCBzcHJlYWQgYWxsIG92ZXIgRXVyb3BlIGFu
ZCBoYXZlIHRvIGtlZXAgaXQgdXAgdG8NCj4+IGRhdGUgLi4uLg0KPiANCj4gVGhlIHNtYWxsZXN0
IG9mIHRoZXNlIHN5c3RlbXMgaGFkIDI1Nk1CIFJBTS4gIFRoaXMgNE1CIGlzIGZsYXNoIFJPTSA6
LSkNCg0KSSBmaXQgVWJvb3QgKyBEVEIgKyBLZXJuZWwgKyBJbml0cmFtZnMgd2l0aCBrbGliYyBh
bmQgbXRkdXRpbHMgaW4gYSAyTUIgDQpmbGFzaCBST00uDQoNCj4gDQo+Pj4gV2hhdCBpcyB0aGUg
b3ZlcmhlYWQgaWYgeW91IGVuYWJsZSBtb2R1bGVzIGJ1dCBkbyBub3QgdXNlIHRoZW0sIHRoZXNl
DQo+Pj4gZGF5cz8NCj4+DQo+PiBPbiB0aGUgOHh4IGl0IGlzIG1haW5seSB0aGUgaW5zdHJ1Y3Rp
b24gVExCIG1pc3MgaGFuZGxlcjoNCj4gDQo+IEkgbWVhbnQganVzdCBhbiBpbmRpY2F0aXZlIGNv
ZGUgc2l6ZSBudW1iZXIuLi4gIDEwMCBieXRlcywgMTAwa0IsIDEwME1CLA0KPiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0IDotKSAgQW5kLCBvbiA2NCBiaXQsIHdoaWNoIGlzIHdoYXQgdGhlIHF1ZXN0
aW9uDQo+IHdhcyBhYm91dCENCg0KQWgsIGRvZXMgdGhlIHNpemUgcmVhbGx5IG1hdHRlcnMgaGVy
ZSA/IEkgd2FzIHRoaW5raW5nIG1vcmUgaW4gdGVybXMgb2YgDQpwZXJmb3JtYW5jZSB3aGVuIEkg
bWFkZSB0aGUgY29tbWVudC4NCg0KQ2hyaXN0b3BoZQ==
