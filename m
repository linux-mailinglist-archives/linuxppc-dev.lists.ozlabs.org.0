Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AA86958C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 07:00:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG9Y7140Qz3c6f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 17:00:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=evttTxa+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe0d::600; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=evttTxa+;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0600.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG9XB1vyFz3btb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 16:59:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qg39iCZ65TX/SiCaoiFR0c1L7E+9Rm+vaOnBidZ0t6RErvoUV5xF2YPlHwTDCxPoNahSll/8/Mtw1eRj54N3jNC2ilPX/VpSg+KDGNYTkKP2wCva/zQdbqex8jpNrKqxAHGCtWi3OM9apLziWaxgPg2r/nEsYwiPOjbqY3eeP4qrHSKF2cDwT9bipTT1zGE+eaS1spxu/Wd60ZIwZpEI6118TPgApXgogdWr/IG3O2Suy2px780fWBcPI7Jnh4g2Vff7y07xz14jtZAwscjr/xCQpjQM5eNBtXHBWgQAo+GhyeQCfyBg53sJVvUy4xM66lFhsAHu+Ze+ZM8QkVMKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz1ItzONnLnVxDppbNNfLsexugnjsFbVmjV2wQMrWEA=;
 b=KsTERIniljf5WJf8LcojYONA8Nq/ivreynLKL8Veq6b0UgwGOuWnwH+7VU/01po6dlf0OaI21KZWiqtbToTDGQvDMMBxpgfl09jIKVL5zuMh2rWhR9YGImY3YuhF6Q6NnGJ6CKkfrGh+1LEJEC82RyWsZJOI7LoxnOhNgPlvzxcw26uzrqB5rkjiMtFt4A2upbsLcMLCwc+ik7MWfndhvI6uS/S5dhsxdR0G4uMMS/vihbW44E6Ff4R9gL31KgL4oddVJ52G2+uzY5lZKUL2bWOVkb24KOnETbYCjQ9wVH2yYlEw9QaxPNFxVPZwgy652CetqmmiCR6s1QSwSOgUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz1ItzONnLnVxDppbNNfLsexugnjsFbVmjV2wQMrWEA=;
 b=evttTxa+9eD26J9clA9ezMQghHwFCclcJ8oouxH+ZC+yJOrCDzfOs8oEy27zesapz8BgGLkQtoX9JVQ+SLzEBGocY7BDfVhda1RAZnvmJkXqprWFv3bsM6scXnrOUJCaJM30LnOvOhamqAAC9+DdxhA7uXmAh6RRKPw/ARiBc41tb1Y9pvG9HAXIiPAOqaJFy5Jig9IGd8hy9hHzQFgGIDpzEgqi2VqUKYVufO+hFO3LEs+Cb+yzVPvt9fDbOIKwVnRInKUc+7n8/noylCsi8oHxS3K/mSEX61QO89Bjh5CpZCPQKV2AAwXJKomofRMrCj37khwLHE/KUpLKBzX0nw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3083.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 05:59:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 05:59:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 1/7] powerpc: mm: Separate set_pte, set_pte_at for
 internal, external use
Thread-Topic: [PATCH v6 1/7] powerpc: mm: Separate set_pte, set_pte_at for
 internal, external use
Thread-Index: AQHZQBgaAu85r6WmJUCcapY+qIdIa67N8r+A
Date: Tue, 14 Feb 2023 05:59:15 +0000
Message-ID: <da254174-8f04-b81b-f1e9-d9546eed1940@csgroup.eu>
References: <20230214015939.1853438-1-rmclure@linux.ibm.com>
 <20230214015939.1853438-2-rmclure@linux.ibm.com>
In-Reply-To: <20230214015939.1853438-2-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3083:EE_
x-ms-office365-filtering-correlation-id: 868cee13-5029-4b2a-1d50-08db0e509a99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oh8aY4k8l4T60wzsdfZoaxVOP4ltxJN5kyQTiqAj1x+WsKETyDbPkU9zJHLS0YZZZ0V0yuSJfQsYg0uUnbJjY13c7HGfD/gtdxF3VjWPjmuhogFdQOgpXaMORGfx+/OFeuVuuEfxAQZcKBIue5Em/Qn7pCGO/Y1+6Zz2OBpF6HhllbBub68vXaC4r6aeV/XGlw+egn6WvbqLfyQLuDnF/LEedL7EgC8A/RaZsVlCkkMVDDGlL/vgt/OWQdUiOM697BySa0ROYnXl9rqsPWYSHAVjI3XFbGApNwljxr6kq8ZEjrUUYbGXBxBZRnyuopL9NBvpptkNi6ulMXWjAVJ9y7nZB8ssnN5rJEmuLJLncBeQo6SVNx68FqHzVSX+JZCVJeQFa/IdXcCG4S/xtswBSdNzchoDA6D6G7JdtKeenTr63QasRBxfWnVXZn+TBycOC+TWEttKRMyj0TcJhJOAhwNQOvrGacp4FKd5QN1wkV955mzmc+20cpcT+kadLGK3PQdfNcHLm5BN3DjIHUcqcXrrAqSZpDYM3+PxlrMxg+vvCeaVMkmyB68IL9IW33guUB+uSEPk9DvhK8KiTHkECv5/+bo/3onuvY9Girkj24/vizt1om4CytINVJ9wOab7dOXHoUjtjvVcKvvDSbKd2ZCq40888RDKnG/Zj3HSUcbLKLhuluMzpxfobo4ZEPgyxLoX2TFCSYtpY5bOporR1BQpTAieOpIvu/CRKG5ULdiFmIVoo/fhhHS3E4JGrHQJZs+TKlAZY+s/lbW0sLIxKw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199018)(2906002)(36756003)(44832011)(5660300002)(6512007)(31696002)(66574015)(83380400001)(26005)(186003)(38070700005)(2616005)(122000001)(66946007)(76116006)(91956017)(38100700002)(64756008)(8676002)(4326008)(316002)(66476007)(8936002)(66446008)(66556008)(478600001)(6506007)(86362001)(6486002)(71200400001)(41300700001)(110136005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VlUvNnJpa0ZJZzN0dmlwZktOOUkvL3JYY1h4dDJ6Y1FaQ2RDcThkL1Q1V2RB?=
 =?utf-8?B?cTVRaDBsUjZHWVJtT1BSOXROQ28zTEhrTmxpK3gvazBFZWs1VnJvRCtEcEZH?=
 =?utf-8?B?RlVvNmZEMnIxNFg2MGgrVnRqQTBQUGw4MTRKd1VCQUxyR2lZZGhZS0l5NmZ4?=
 =?utf-8?B?b3BqVGczc0xlNlZ3cDdHV3ovL2xuTlJ1a282WDV1MmQ1anppZ2RjRWZmdjAz?=
 =?utf-8?B?OUdRemtVTHBXUlNWYW9FdUhTSEc1OXpWcmZybU1DQzRMSGtCeE5XS2RVeVIr?=
 =?utf-8?B?dkNyV3NPTVdtVnZkQ1dpVzluTnJnbk9aY3hScnIvVW92d3g1ekVLWXBxU0Zp?=
 =?utf-8?B?d3FybHZHTTRLWHQ1WG9NbzVJendGUnNjejBWWklaajZvK0NVVTE2V2JzaytY?=
 =?utf-8?B?UkppVDF3UUZqOXlzV200MWZYczZkYTkyS2ZRMllQcnZ0NGRWV2syd3FXSWx3?=
 =?utf-8?B?OWc3T1FzOFEzNFY3cFRQeGozNGRIUFg3ZTcvdktMR2dPc2xNTTh0UTU4Y21I?=
 =?utf-8?B?RWFvU2x6OUlOS2d6STVxQllMVTJqL0pnMnpHelFraHNQaDQzbHRFTWZiWFZL?=
 =?utf-8?B?b0hCcFNOeXl5VUEyRlRtaUNmV2hqWFNpL2JKbHp3NmpPcUN2a29uL0Q4ZE9P?=
 =?utf-8?B?Nm9TODljYzBrZnBMeXp5K0JuNXUrZlhjekptTnZMKzQySk9qdU96K2RIQUx3?=
 =?utf-8?B?T3k0RnI5OTlObjJyeTZ5ZG82RXZrQlUzZVZCQ3NNNmEyMERId3FyL0drQkpz?=
 =?utf-8?B?Z25NR1R2QW5ZY0FESmJaTXJONXg3ckxBaDdvYzNPWkNMb0c3ak5pQ3NMVThV?=
 =?utf-8?B?bEM2YTFrZjFReDY1K2xPYVFUbmN1N2t1NllqYzA4N1Z2aHVVZ0VLT2kvSlhI?=
 =?utf-8?B?VGxTUlFrYVdNWHpablBnMXBUWXlGV3k0S25iZWNzWnVLSTVZTlZuWHBRTExT?=
 =?utf-8?B?dDViMDhyR3ZmQW1FS1FCWGZ1YkFnMkc1dzcwT3kzcFY3OWRsSmFFdVZ3enJL?=
 =?utf-8?B?aWFzNkNrU2ZkYXpjVjhzRXdRK1VXckVaTmpIN0xaNnJ1K01EWS9oYjdoZ0xT?=
 =?utf-8?B?eGFXRWlCeTRTbHRMWHBRcUpobW1vTzhqSHhkb0llZ3NheWZYbzQzTVpUYmFU?=
 =?utf-8?B?V242VVJTZ015UjFvUXl3TnVYemRxQjZ2TFd2VkE1YWN1aTFTWXdhakszQUpV?=
 =?utf-8?B?QmJJV0REWTdsNGlOdHRPb2Q1UG85a0ZKL0NNVGRYdUNLWDhIWkdUTEkvM2lN?=
 =?utf-8?B?OUNCdm1veW9Mb1JUaEVLZVhCWDFoeXVGd0h5V0Jia09SUjJRK2VZSXU1ZmI4?=
 =?utf-8?B?WmJtOGROc0VUSkgzM216a2JFUVNReWxZM0tDSHlWMHduNTN6NHhTbzd1ejJu?=
 =?utf-8?B?bGt3R3ovMkVpTUJnSGFENUNuUG1wbE5zaFBxcEs1a0U2eFJqN1FBaXJ0ZHFP?=
 =?utf-8?B?SVc4QzFaNkhyT0U3ZDB4YkR4Rm9aMjh6eUxhTHNYbTNqb1YxeENyUHNZa3hX?=
 =?utf-8?B?L2YrRDVYNmwxdSs4di9kOWdGU2NZU2MveWNIeHJ6ZEZXYy9keWdtejY5M3g0?=
 =?utf-8?B?cGVKTTJOL2VhMmlyNmNhR3lKbk9xUit6ajh4ZkpnTHZTU3hLUU40Vkd0N3Y3?=
 =?utf-8?B?SW10dVM3MnZVU2FCcnk4aFdBWUpwMnA1NWF0UnZ1Z3FQNjhOSWMxTmdwNDd1?=
 =?utf-8?B?UFZxTjhPRFNSTnBnWmNLTloyYlRCOUtHQ2N2cVg3VER0MFVjUFJQZStKWENW?=
 =?utf-8?B?K09kV1dZNmhKdytCWXoxdWE0TUtTR1NLM2o3UzhDUFBTMzB2aTZFUjNSZ2Ew?=
 =?utf-8?B?MUF5c3BCQTZOa3BNRlkwRS90eDd4L2NjUmY5dmRDZmgwb3BHdnlTb1c3NEND?=
 =?utf-8?B?SmlSWkJCQUlkRkMxWGtUZUlyQWRNZXE5ekQ2eHF5ako3L3oyM3paM1lxeDFp?=
 =?utf-8?B?cXZWMy9DS3kvcFJXVVQ2MWxQQ21sM3VxYllvSDRoZEYyWlV3TFNEN0FTK043?=
 =?utf-8?B?MmhYbXN0Tjk2SVRlcm0vQ3dGdEpmdDZGWXl5WGNheDVPVk14d3VLeWlPdnpz?=
 =?utf-8?B?UlBvM2pBYWxRMG1HVXdLRithZFhGNUdJdFZJRFhHdkN6c2Nvc205ZE1aOEx6?=
 =?utf-8?B?NmhrVFUxMTRLdGtacFh2dVhOWmxRSVNOV2FZaE1zNExocXErNUxOU0JzK0Y5?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28B9C57BE14F9746AEA0B47AA216E3B8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 868cee13-5029-4b2a-1d50-08db0e509a99
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 05:59:15.6330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZcC4uZVyuvy8ThrZ1qqYxQrXQycSlkWW8cuFASSJwTm4BrI0l6tWsWS3SMZtfx30IEMAM/GntPVG5t6kaWsyNuAC+f1RQeuj8sQqVoRxUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3083
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

DQoNCkxlIDE0LzAyLzIwMjMgw6AgMDI6NTksIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBQ
cm9kdWNlIHNlcGFyYXRlIHN5bWJvbHMgZm9yIHNldF9wdGUsIHdoaWNoIGlzIHRvIGJlIHVzZWQg
aW4NCj4gYXJjaC9wb3dlcnBjIGZvciByZWFzc2lnbm1lbnQgb2YgcHRlJ3MsIGFuZCBzZXRfcHRl
X2F0LCB1c2VkIGluIGdlbmVyaWMNCj4gY29kZS4NCj4gDQo+IFRoZSByZWFzb24gZm9yIHRoaXMg
ZGlzdGluY3Rpb24gaXMgdG8gc3VwcG9ydCB0aGUgUGFnZSBUYWJsZSBDaGVjaw0KPiBzYW5pdGlz
ZXIuIEhhdmluZyB0aGlzIGRpc3RpbmN0aW9uIGFsbG93cyBmb3Igc2V0X3B0ZV9hdCB0bw0KPiBp
bnN0cnVtZW50ZWQsIGJ1dCBzZXRfcHRlIG5vdCB0byBiZSwgcGVybWl0dGluZyBmb3IgdW5pbnN0
cnVtZW50ZWQNCj4gaW50ZXJuYWwgbWFwcGluZ3MuIFRoaXMgZGlzdGluY3Rpb24gaW4gbmFtZXMg
aXMgYWxzbyBwcmVzZW50IGluIHg4Ni4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVy
ZSA8cm1jbHVyZUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gdjY6IG5ldyBwYXRjaA0KPiAtLS0N
Cj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzL3BndGFibGUuaCB8IDQgKystLQ0K
PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oIHwgNCArKy0tDQo+
ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgfCAxICsNCj4gICBh
cmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jICAgICAgICAgICAgICAgICB8IDQgKystLQ0KPiAgIDQg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvcGd0YWJsZS5oIGIvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy9wZ3RhYmxlLmgNCj4gaW5kZXggZDE4Yjc0OGVh
M2FlLi5kYmNkYzIxMDNjNTkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ib29rM3MvcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29r
M3MvcGd0YWJsZS5oDQo+IEBAIC0xMiw4ICsxMiw4IEBADQo+ICAgLyogSW5zZXJ0IGEgUFRFLCB0
b3AtbGV2ZWwgZnVuY3Rpb24gaXMgb3V0IG9mIGxpbmUuIEl0IHVzZXMgYW4gaW5saW5lDQo+ICAg
ICogbG93IGxldmVsIGZ1bmN0aW9uIGluIHRoZSByZXNwZWN0aXZlIHBndGFibGUtKiBmaWxlcw0K
PiAgICAqLw0KPiAtZXh0ZXJuIHZvaWQgc2V0X3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwg
dW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwNCj4gLQkJICAgICAgIHB0ZV90IHB0ZSk7
DQo+ICtleHRlcm4gdm9pZCBzZXRfcHRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBs
b25nIGFkZHIsIHB0ZV90ICpwdGVwLA0KPiArCQkgICAgcHRlX3QgcHRlKTsNCg0KUmVtb3ZlICdl
eHRlcm4nIGtleXdvcmQsIGl0J3MgcG9pbnRsZXNzIGFuZCBkZXByZWNhdGVkLCBjaGVja3BhdGNo
IA0KLS1zdHJpY3QgaXMgbGlrZWx5IGNvbXBsYWluaW5nIGFib3V0IGl0IHRvby4NCg0KVGhlbiBo
YXZlIHRoZSBwcm90b3lwZSBmaXQgb24gYSBzaW5nbGUgbGluZS4NCg0KPiAgIA0KPiAgIA0KPiAg
ICNkZWZpbmUgX19IQVZFX0FSQ0hfUFRFUF9TRVRfQUNDRVNTX0ZMQUdTDQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUuaCBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oDQo+IGluZGV4IDY5YzNhMDUwYTNkOC4uYWMz
ZTY5YTE4MjUzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNo
L3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFi
bGUuaA0KPiBAQCAtMTU0LDggKzE1NCw4IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX21vZGlm
eShwdGVfdCBwdGUsIHBncHJvdF90IG5ld3Byb3QpDQo+ICAgLyogSW5zZXJ0IGEgUFRFLCB0b3At
bGV2ZWwgZnVuY3Rpb24gaXMgb3V0IG9mIGxpbmUuIEl0IHVzZXMgYW4gaW5saW5lDQo+ICAgICog
bG93IGxldmVsIGZ1bmN0aW9uIGluIHRoZSByZXNwZWN0aXZlIHBndGFibGUtKiBmaWxlcw0KPiAg
ICAqLw0KPiAtZXh0ZXJuIHZvaWQgc2V0X3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5z
aWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwNCj4gLQkJICAgICAgIHB0ZV90IHB0ZSk7DQo+
ICtleHRlcm4gdm9pZCBzZXRfcHRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25n
IGFkZHIsIHB0ZV90ICpwdGVwLA0KPiArCQkgICAgcHRlX3QgcHRlKTsNCg0KUmVtb3ZlICdleHRl
cm4nIGtleXdvcmQgYW5kIGhhdmUgdGhlIHByb3RveXBlIGZpdCBvbiBhIHNpbmdsZSBsaW5lLg0K
DQoNCj4gICANCj4gICAvKiBUaGlzIGxvdyBsZXZlbCBmdW5jdGlvbiBwZXJmb3JtcyB0aGUgYWN0
dWFsIFBURSBpbnNlcnRpb24NCj4gICAgKiBTZXR0aW5nIHRoZSBQVEUgZGVwZW5kcyBvbiB0aGUg
TU1VIHR5cGUgYW5kIG90aGVyIGZhY3RvcnMuIEl0J3MNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0
YWJsZS5oDQo+IGluZGV4IDk5NzI2MjZkZGFmNi4uMTdkMzAzNTlkMWY0IDEwMDY0NA0KPiAtLS0g
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAgLTQ4LDYgKzQ4LDcgQEAgc3RydWN0IG1tX3N0
cnVjdDsNCj4gICAvKiBLZWVwIHRoZXNlIGFzIGEgbWFjcm9zIHRvIGF2b2lkIGluY2x1ZGUgZGVw
ZW5kZW5jeSBtZXNzICovDQo+ICAgI2RlZmluZSBwdGVfcGFnZSh4KQkJcGZuX3RvX3BhZ2UocHRl
X3Bmbih4KSkNCj4gICAjZGVmaW5lIG1rX3B0ZShwYWdlLCBwZ3Byb3QpCXBmbl9wdGUocGFnZV90
b19wZm4ocGFnZSksIChwZ3Byb3QpKQ0KPiArI2RlZmluZSBzZXRfcHRlX2F0ICAJCXNldF9wdGUN
Cj4gICAvKg0KPiAgICAqIFNlbGVjdCBhbGwgYml0cyBleGNlcHQgdGhlIHBmbg0KPiAgICAqLw0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9t
bS9wZ3RhYmxlLmMNCj4gaW5kZXggY2IyZGNkYjE4ZjhlLi5lOWE0NjRlMGQwODEgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21t
L3BndGFibGUuYw0KPiBAQCAtMTg3LDggKzE4Nyw4IEBAIHN0YXRpYyBwdGVfdCBzZXRfYWNjZXNz
X2ZsYWdzX2ZpbHRlcihwdGVfdCBwdGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAg
IC8qDQo+ICAgICogc2V0X3B0ZSBzdG9yZXMgYSBsaW51eCBQVEUgaW50byB0aGUgbGludXggcGFn
ZSB0YWJsZS4NCj4gICAgKi8NCj4gLXZvaWQgc2V0X3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwNCj4gLQkJcHRlX3QgcHRlKQ0KPiAr
dm9pZCBzZXRfcHRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0
ZV90ICpwdGVwLA0KPiArCSAgICAgcHRlX3QgcHRlKQ0KDQpIYXZlIGl0IGZpdCBvbiBhIHNpbmds
ZSBsaW5lLg0KDQo+ICAgew0KPiAgIAkvKg0KPiAgIAkgKiBNYWtlIHN1cmUgaGFyZHdhcmUgdmFs
aWQgYml0IGlzIG5vdCBzZXQuIFdlIGRvbid0IGRvDQo=
