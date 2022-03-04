Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AB34CD670
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 15:30:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K99Hr2mzBz30NB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 01:30:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::609;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K99HJ0k8vz30BP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 01:30:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdLHlK0CUQKWAJrNT15lAHb3MSDeCXshZTiNV4oMJQYH/MWEPWsgoC0WrDHtxfIoYQ5m6K2h3kY+UmXqOPmHsV+3tyeqZmBM8hP8A07oGGa2fLiLFI8pC0UGnRPxelZe0A8Y7II7jngWUZTAh+eOJyBumaDLOzRyhDWMueVfCXY8dtu/ndXPiFIiGz0kq9Cwg6n43tRakrsa4IqXdwsO8OozxjLbZ5Fow+EuFu9vL6UKUNoDxgLjCbG0phTmeGcqS9FETLnA4I4eQThcJUQldheVNOI3myCu8eZdwHFRqRUNDBPXOEfPlOoiC5hdVuWVxyGEt4BqOvXcHWOcadq3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0REfPk3tRPacJMYxUqZlOF9zMDJmVQsftMW5mzXKro=;
 b=mvgWTD7bAui90JZxK4paAu3mFCwR4AMMokVKACBG/s6hNbLfUvsVhV13nGTB0qLMZthRa8HNSx+DYwEgHFsQdxS0QpSdPNIr8Y0CGaH+Gns/962N+eVwtLptRx+zQWBUimBud/8K7WODcUA2w1fhr3ipzPKkXr3BIxMBkD9WXlk/hnlDlIgsSldHK3rNch2NobpBybZi4hoCFcZUEZmZRKruT4dMlzh7yS7ZBSVINvEDmxL1yrpyQMSje6JTRJGhekmbC342adodQXNDZDV/pR+rCXDx7y+PwbhOIWMXufdWqVP90JQiF36L/aX9ehfoMy8HJfmUvOfgmHHG3hmTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2646.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 14:29:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 14:29:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] powerpc/sysdev: Use of_device_get_match_data()
Thread-Topic: [PATCH] powerpc/sysdev: Use of_device_get_match_data()
Thread-Index: AQHYL2XgvZ423BGGSUm3vLhUo3FmQqyvM5mAgAAVJQCAAAEEAA==
Date: Fri, 4 Mar 2022 14:29:39 +0000
Message-ID: <4d569f2f-7c56-e5a0-e9e0-981cbca21468@csgroup.eu>
References: <20220304011830.2061591-1-chi.minghao@zte.com.cn>
 <6481b730-e338-294d-3602-bb899654ed2b@csgroup.eu>
 <87o82l23rb.wl-maz@kernel.org>
In-Reply-To: <87o82l23rb.wl-maz@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66272100-b3b9-439b-f2fe-08d9fdeb6a59
x-ms-traffictypediagnostic: PR0P264MB2646:EE_
x-microsoft-antispam-prvs: <PR0P264MB2646C0319ABF2DCD10699ACBED059@PR0P264MB2646.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S3zs9MOV5LZH5A9rbWu0UJiGh3TfRoQ2Jlt9s1fR/aIVjpZky8rXA6ui03HJWfMYxBejWbk7oXrFTP+YuaJhY330WZu08L5NmdBjy+tzL4vhBJlJuxFXyfVdWxqD5IhkPGsPD3ldmsNKQMUt7AWwfy6ZPSEwr7Fz61rBqI6f5gMv52i3Ze5MLXa0TWra33IYNwD1ziDxpAH+Je0Xzw1S2EPt5GW1iqSteUdbjN/YHZ2/y1ne/8C2Ftu4F8NLtMwA1hoScnGKnCAYabk04w7ZUaXTPInk+fCyI4fcQhP6lbharfpD3n6G7Qsp331++UHpcUuJYbYldcXYDYFaOy72VxA/vckjO89zYQTukKghXD8EBxsaJHywa7sAqvNnSCGXh3SQuAPph2Ivq2ikkp7j4qlKqQxrcQpXd/sTg6TLm7mKCXa7rHyUzdtOity/9cIwA2zQIKc57H6xmC5VAFmMQuq9DNSNrr3j7JaZrP/zR6ef/FeKJMqbiVIPnGrF+ggUEMzv7jiEVIZGA4lg+Wbf03xwcgx0XIrKy9vvJnH2teQuYbKORtyVx1rPOojWDIuqAigJxbPjNJUemsYK2YNvidwMBdwu1na4gluoLSlNESFKnF5GtEI+5TchkFiuxrP+WpXsVs5grKhAWIgeclGvfJEBu7sqXG8dthtiKrN82Q5ZpabojazBlbp/bDyW9MdNnH91UaLx5+Ols43lMuE4H7CsD6gzUwiGhejgIUQtfDKGVLeJp+azH7bhUnE1Tw8tcBKexsa/7j5LaMg7wRPbNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(66556008)(66946007)(76116006)(2616005)(44832011)(6512007)(66446008)(66476007)(6916009)(91956017)(316002)(5660300002)(31696002)(4326008)(8676002)(64756008)(7416002)(8936002)(86362001)(36756003)(6486002)(6506007)(38100700002)(508600001)(122000001)(2906002)(26005)(186003)(71200400001)(83380400001)(38070700005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFJPd3IyQ01vdW9yd1ZXK0tOd0hHdnhzSWU0TmF0MVJnSVU5dURSYUdyUkFq?=
 =?utf-8?B?RWptZ1RIVktDRUFaMmRLMEMwYlkyTG9SdWtsQ29EU09JalFsczMwc09KWnRD?=
 =?utf-8?B?QUVxR2hnNWlUaHlWU1hybFBxRmd0QnVKVE83WHJOWVpMSDJ5aUUvNFZPOTly?=
 =?utf-8?B?TlQzejRYZHZRdy9MWWEzcjZiV0t4cnJQamEvb0lFVnRqcDJFQzNZUjdWTWdW?=
 =?utf-8?B?WWtzLzFIY1N5YlFPWDdScXM0aWtiUDd6azhVR3dtOTVscm5wbGpTMjJ4NFh6?=
 =?utf-8?B?MzRNYU1UNGhYT2lyL01zaGpBTnhPVVY5SHhqS0xPVlJlQmQ2b3oxZTBxTnMz?=
 =?utf-8?B?L0tlOWlmL3J4R0hYVWFDVGpHeWlSUHlaLzFXSFRCOTlKTW9mN0pWZ25VdDRx?=
 =?utf-8?B?dDFpLzZMMFp3aWU2amZUeDBEL3JuRCt4b2VsOFRNOWd3VkFpb2FOcnRkcjd6?=
 =?utf-8?B?ZUoyMU9EQlFsY0lQVUZKc1lGK2pSZlZFMUdieDJJdjlZK3RnVmtyejJvWmNU?=
 =?utf-8?B?VTJIckswbXdvb2RJakhNTjZBK1RFWks3Z1lGMFkzeFFxWWF6d1lJaExMdWJZ?=
 =?utf-8?B?VndrNG5VYjBRUlU0NjlTdmI3em56VGdSY2JWbHQ3SzVqNEtGUGdLSGZJK1lY?=
 =?utf-8?B?b1VyTTU1SXVTaFlrL1pEdTJXYkJjWUJnY292dXBob2lvd0t1VzJvQkhvdklS?=
 =?utf-8?B?WXM0bDh5c09DNkNtaExrWVJVY3F6QUU0SWRnZ3p0ZXorbzU3cmk0NGI3c1hN?=
 =?utf-8?B?Ui9kam9yL2FBa1NwUDBORnVkRWtKcHZrY0pWZ2k2c05UaXJ6cnUrZ2hLM1F2?=
 =?utf-8?B?elRzalFTNzNKSFJwbW5pakZjeGxmYm9zakorcFJuV3B5eVhGY1JlOXYxWlVa?=
 =?utf-8?B?VTNRcU5BenJIdkZQYnRDWGFERk9xYUVXd0ZEN0pNN2dESWFLbkQzeWw4Zzc3?=
 =?utf-8?B?VWQrRjI0eGdUZ21YbExwSlFSWDRVWXR2NHpjdW1zRG1JS2FQNUkxa1QzNTBa?=
 =?utf-8?B?Q3MyRzE1OVRJNUg0bUY3TjNoZ1VtL2poSHprOXRKQzdPNm85QkkrcnVGZHJ5?=
 =?utf-8?B?SnkrT2N2WHlmd3U1VENhM1BPcGdXSnUvN3pXVFZDTUtjTm1IUk11d0JtZXFP?=
 =?utf-8?B?Q0pTY3ROSUxIMmIzWjB5dXY3RTJlbk95alkwcTdyUlMrVmZSLzNnKzl0NEw3?=
 =?utf-8?B?S1lpMUI5clAveWgyNzlZbWpSQjNDbzFFa3FhRk9VMk1SUXhad0VNREdCNGd5?=
 =?utf-8?B?ZVdBdkF3VXdISk1taUVLcGRTekVJdjFJdWJFS0FuQUpWL3dNUFQ3TnhTUFlH?=
 =?utf-8?B?VGJ4aThPZGVFRUtWcUlXeTZPMXh3aXQxSHZGRjFnWHMyV0FhY3F0WlFvVVh0?=
 =?utf-8?B?M29WL01LNi84UzFwaCtmaHkzbC9QMUVJVWt6OC9yV3VtSSt2eURIZzZPcHJn?=
 =?utf-8?B?UGdBUzBET05zZmQ5WXVTTG1xVnE3ZXdSVDREVDFrSUczY1NKNDZUak1INzIv?=
 =?utf-8?B?am8yc1BxUjQwYzkvRzUrSit5dW5pN1k3THIzdG9JVVplNWE0a21jZ2pQbVVT?=
 =?utf-8?B?b0dTNDdNTXV4Y3lJMTkybmhWZ2NVNzQvejlqcnUveGhCdmNBS2doSThIeTBo?=
 =?utf-8?B?VGhFM3JsSW0rSEdnSGI3elNNNlp0T2V0VWtkRHdRSFAvdXowZnp3blFqSW5F?=
 =?utf-8?B?UFhhbTEzeTRSU0RSRUtZM0x0ZVNEdk5PRFVGRzhDV2VZZ2ZRZlYzNWhYYXNZ?=
 =?utf-8?B?ZzZsdFFablprbjQzald3OXVNaGpLaWVHOVgrTUx1Ymc3MXZucllrOFcrdFkw?=
 =?utf-8?B?bkNKUTZpNWtSS0JlcXNxbGl4Y2dlTWNGK3ROZmVCT2p1UW5TWm8xcTBjbVNE?=
 =?utf-8?B?aHlPSHFlRW9YTFBrN3JrV2dJaEVJZlVKcXhVVFpYS0tKZU1adVM0UUpkb2pu?=
 =?utf-8?B?VXR4WGxydEMyYlN1SjJEcFlFWk1wZkpoZVVHUzFpOFhTTWJqd3VMZFpHSUNv?=
 =?utf-8?B?Y2NOc1VIYXE1KzZJSWZCajR3TnpvQ3F4QS9yRDdlenlscG90VVVRNnQzT1VF?=
 =?utf-8?B?M2V4aUpJS1ZIMFVBOGpTSjhDQTJJYlpOcit4QXk4UmJ4cVdsSXZxZS9maXI1?=
 =?utf-8?B?bHVhdThaQzlTREEySG1VSXZKd05jUE9MME9nQWp1a3p2cFhkTzNoT1ZsVzJ5?=
 =?utf-8?B?Q08vem9UUTArRHk0NGI2MWhQRnpLbzVUS24wbm9oejNkOFB5SjBzREVEVVJu?=
 =?utf-8?Q?c3xyL0Uh5u1UtRRJ45a4NyDeL9AZAAGfC6sL8e4eMA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44EC3ABEDB0D884EB5498B153BB93CC7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 66272100-b3b9-439b-f2fe-08d9fdeb6a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 14:29:39.2120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ywyVaoAadOExOij+G05YJzkn8TunqCfUKntBJBtjDrup4/GJ/ylseFFTFyool88/YZhvL/+20XwYpljqS0DVxhneQrmlyeHvnhNeh8ID/Zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2646
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
Cc: "cgel.zte@gmail.com" <cgel.zte@gmail.com>, Zeal Robot <zealci@zte.com.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Minghao Chi <chi.minghao@zte.com.cn>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
 "paulus@samba.org" <paulus@samba.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzAzLzIwMjIgw6AgMTU6MjYsIE1hcmMgWnluZ2llciBhIMOpY3JpdMKgOg0KPiBP
biBGcmksIDA0IE1hciAyMDIyIDEzOjEwOjE5ICswMDAwLA0KPiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gTGUgMDQv
MDMvMjAyMiDDoCAwMjoxOCwgY2dlbC56dGVAZ21haWwuY29tIGEgw6ljcml0wqA6DQo+Pj4gRnJv
bTogTWluZ2hhbyBDaGkgKENHRUwgWlRFKSA8Y2hpLm1pbmdoYW9AenRlLmNvbS5jbj4NCj4+Pg0K
Pj4+IFVzZSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSB0byBzaW1wbGlmeSB0aGUgY29kZS4N
Cj4+Pg0KPj4+IFJlcG9ydGVkLWJ5OiBaZWFsIFJvYm90IDx6ZWFsY2lAenRlLmNvbS5jbj4NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBNaW5naGFvIENoaSAoQ0dFTCBaVEUpIDxjaGkubWluZ2hhb0B6dGUu
Y29tLmNuPg0KPj4+IC0tLQ0KPj4+ICAgIGFyY2gvcG93ZXJwYy9zeXNkZXYvZnNsX21zaS5jIHwg
NiArLS0tLS0NCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRp
b25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3N5c2Rldi9mc2xfbXNp
LmMgYi9hcmNoL3Bvd2VycGMvc3lzZGV2L2ZzbF9tc2kuYw0KPj4+IGluZGV4IGIzNDc1YWU5ZjIz
Ni4uOWQxMzViYmIzMGI3IDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9zeXNkZXYvZnNs
X21zaS5jDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL3N5c2Rldi9mc2xfbXNpLmMNCj4+PiBAQCAt
Mzg3LDcgKzM4Nyw2IEBAIHN0YXRpYyBpbnQgZnNsX21zaV9zZXR1cF9od2lycShzdHJ1Y3QgZnNs
X21zaSAqbXNpLCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYsDQo+Pj4gICAgc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZnNsX29mX21zaV9pZHNbXTsNCj4+PiAgICBzdGF0aWMg
aW50IGZzbF9vZl9tc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPj4+ICAg
IHsNCj4+PiAtCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNoOw0KPj4+ICAgIAlzdHJ1
Y3QgZnNsX21zaSAqbXNpOw0KPj4+ICAgIAlzdHJ1Y3QgcmVzb3VyY2UgcmVzLCBtc2lpcjsNCj4+
PiAgICAJaW50IGVyciwgaSwgaiwgaXJxX2luZGV4LCBjb3VudDsNCj4+PiBAQCAtMzk3LDEwICsz
OTYsNyBAQCBzdGF0aWMgaW50IGZzbF9vZl9tc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqZGV2KQ0KPj4+ICAgIAl1MzIgb2Zmc2V0Ow0KPj4+ICAgIAlzdHJ1Y3QgcGNpX2NvbnRyb2xs
ZXIgKnBoYjsNCj4+PiAgICANCj4+PiAtCW1hdGNoID0gb2ZfbWF0Y2hfZGV2aWNlKGZzbF9vZl9t
c2lfaWRzLCAmZGV2LT5kZXYpOw0KPj4+IC0JaWYgKCFtYXRjaCkNCj4+PiAtCQlyZXR1cm4gLUVJ
TlZBTDsNCj4+PiAtCWZlYXR1cmVzID0gbWF0Y2gtPmRhdGE7DQo+Pj4gKwlmZWF0dXJlcyA9IG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmZGV2LT5kZXYpOw0KPj4NCj4+IFdoYXQgaGFwcGVucyB3
aGVuIGZlYXR1cmVzIGlzIE5VTEwgPw0KPiANCj4gSSBkaWQganVtcCBhdCB0aGF0IG9uZSB0b28s
IGJ1dCBhcyBpdCB0dXJucyBvdXQsIGl0IGNhbm5vdCBoYXBwZW4sIGJ5DQo+IGNvbnN0cnVjdGlv
bi4gQWxsIHRoZSBmc2xfb2ZfbXNpX2lkc1tdIGVudHJpZXMgaGF2ZSBhIG5vbi1OVUxMIC5kYXRh
DQo+IHBvaW50ZXIsIGFuZCB5b3Ugb25seSBlbnRlciBwcm9iZSBpZiB5b3UgbWF0Y2ggYSBmc2xf
b2ZfbXNpX2lkc1tdDQo+IGVudHJ5IHdpdGggdGhlIERULg0KPiANCj4gU28gdGhlIGN1cnJlbnQg
Y2hlY2sgZm9yIGEgTlVMTCBtYXRjaCBpcyBub3Qgc29tZXRoaW5nIHRoYXQgY2FuIGhhcHBlbg0K
PiBzaG9ydCBvZiBzb21lIG90aGVyIGJ1ZyBzb21ld2hlcmUuDQo+IA0KDQpPay4NCg0KVGhlbiBp
dCB3b3VsZCBiZSBnb29kIHRvIGhhdmUgYSBzZW50ZW5jZSBleHBsYWluaW5nIHRoYXQgaW4gdGhl
IGNvbW1pdCANCm1lc3NhZ2UuDQoNCkNocmlzdG9waGU=
