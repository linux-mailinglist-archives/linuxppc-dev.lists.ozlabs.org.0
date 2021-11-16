Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EF54534CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 16:00:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Htq4Y59pbz3bVs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 02:00:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Htq434Y3qz2xDq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 02:00:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb3An6L6wXyVnUXKz76YGnn5SnA8CKoByp/YTIEY8phA7yFLgeXjBSuIQTiqW+/JC01tsk+5u7xZDPPWwADp741hgxx9Gc52AXF1cBO5nxXE3Nb1+9UU3XzTWG34MgIAj1mMEZ2aZlj4wIjllCddAbRuWcucejEaFBBG5Eb2r4dterNqYYdCgjMbprav368wAUFTaYV1HnWNSX/UdVx12OVFs5LmG7foTzAlRElSzs5TxoasrM1xdkY4Z3P4YuNLJic+g5n1z6E63A8yFRAHCibpTvBOy0TFB4AOmjNBrKhJL8WzumkMY4StCqokPJOlFisVIeuXuJTGZIUJ6k6Q7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rJubBbCb04tyqrxwz3NUPyev9UvhoylI4ouCC99Z7Y=;
 b=Te3ZzN9rWnRSSmMdBYkGxA17zS1h+EeaxjfXkJ/3aVbwjm67Fl5Gq5Ab1KZRKGHlQYtLnD2AxOMoNt1AkNXMmHQMk34VwwloKwrqCGiKNowYtRaxLt3UOjaIhsF7VYcxc4h08lJsUzMcbqzo4X+ShR8UCI9ITETGMh6T3/9ybZOr7aNT/XDZ5v3csQGXllApJfaB1Zy8dvRfmeJuX6iDVDgQn67B8LsX1VG+SF37cs06xF1ee4nCihNFUHNwWmbh42rWLfrfq85OHcQnvVMidC3XA3VkH7e+lHU//vocpYR2EPwn+ONdsAVJme0aklwndrNvEAy/jKt9yiHJWblaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1778.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 16 Nov
 2021 14:59:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 14:59:57 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: Kajol Jain <kjain@linux.ibm.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "nvdimm@lists.linux.dev"
 <nvdimm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "peterz@infradead.org"
 <peterz@infradead.org>, "dan.j.williams@intel.com"
 <dan.j.williams@intel.com>, "ira.weiny@intel.com" <ira.weiny@intel.com>,
 "vishal.l.verma@intel.com" <vishal.l.verma@intel.com>
Subject: Re: [RESEND PATCH v5 0/4] Add perf interface to expose nvdimm
Thread-Topic: [RESEND PATCH v5 0/4] Add perf interface to expose nvdimm
Thread-Index: AQHX2qWPVF3tyajtJ0Cl8OM2T83R+6wGP++A
Date: Tue, 16 Nov 2021 14:59:57 +0000
Message-ID: <8bc3f62b-881f-d919-8726-95610d1bc133@csgroup.eu>
References: <20211116044904.48718-1-kjain@linux.ibm.com>
In-Reply-To: <20211116044904.48718-1-kjain@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff4b4a48-1f6e-4dee-55a4-08d9a911c150
x-ms-traffictypediagnostic: MR1P264MB1778:
x-microsoft-antispam-prvs: <MR1P264MB177854B1EEDC7522A81A7B4DED999@MR1P264MB1778.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xFgVsBBZaB5p/ssZ7eGNT/eKYpg9FUGvwTwmdey/4KmhsJ1W+NkW0rlVxgM3YyHhvFpyUxahAecA9ydXSgABTkxexG7vO/J/EOwSj0LtHe4ib2gpf4yuav36wSbC4TFqG52PbdFj5xZiywIomxQUm9pbAb/HDawNAmYQtszmWY7VDIkxUpZ6juYpJAzruWyAk5ZyJSvmXG0iqHY/wfF5CGUMzTFoi7TorUFqfwIZbLpGjh7wRCtfg96hav+OGW6j2/wSqtekOq5kHbnfSQSAfduUhgrHEnuHfVri9CZlXSzRTyIW58RYEiUO8qiqlg554Lh1LDRHWUjmmvlVsNCOQb6vWY8DFmXOWaSmbEZ9HFGFDiwUovoT3KaSED72xhdnA5PwuBMMJ2cjxoH8X0RZNCLIoLVPtZouzKlVbJobY//BRG/sPNaL5VCkVEImVfB0aDFB5yL7UKxgW3vBr37n2aV4EWCKcaiqujfwB2W5zMl0Qs5y08dyCILwFa/yEf6AN1MJKa6cAcboadA1QxZJOKNPwaMc/25PpEb2yS1yiTV3si6bEz+8uNv/jFDSX8A3wXdstFc7+GllCfKiAKOIiFFS+jV4cccNHAq1phlqNKIUCTtiCBKB9do+FBaJyXNELf6QlfKlwGoKZMCAfOEJN7YiDchB2/SFvFNvauCj0ex6/VRsPJuSyY6OBPZJwLoQZGlatB3GVMXlUrd14FG1LgoLPblNwfoOQe4SuMuEr7Ows3Zw3RbBlWGa+APCzlZA160UgDQNA+TjnFN2RZZ0SUzh0KMnetjTV/A7BKIAS6eI94YWPaFrvMdua3QlMqvEW3VFZv/FNFjz8rss8tGpu2NGdsPuKbsN3WrQYunqr+g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(316002)(6486002)(2906002)(26005)(6506007)(36756003)(7416002)(38100700002)(4326008)(76116006)(186003)(64756008)(66946007)(66446008)(66556008)(66476007)(31696002)(83380400001)(86362001)(2616005)(8676002)(6512007)(54906003)(110136005)(5660300002)(91956017)(8936002)(38070700005)(966005)(31686004)(508600001)(66574015)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVl2eG9LaHIvN2twRU5xR3pHMFBrSk9jSFFYVEttenZxaWhIWW9tdklhNWd1?=
 =?utf-8?B?bDR0L1I4cnlZRkpPVmJ6d1R5bUU3YnFTWURrb1VCd1RGSVRJUHp3ai9SQUdZ?=
 =?utf-8?B?eDN6V0lNRldlMmhSRGFmYStoMlZrMzRlM25HUktGYnhnbzM2MW5ncGVQWTA5?=
 =?utf-8?B?MWxCOTg1TVhFMFBBZXBtSHVpWGxLV0VRVWNBTHdyeGJNWHRScm5mZzM2OWtE?=
 =?utf-8?B?cllhWDZEWDFVdjNvZXBuN0dvaTh4MC9TUGF0YUVwUlZSa0U0ZzRyMnhGQWxB?=
 =?utf-8?B?ZCs2bjZ0SUxhWkxpUFdReGI2MUpuV21iNytic3h6c0RiQ05ZVlFoMm5qbG0v?=
 =?utf-8?B?ckxKWGxVY1ZjRldBK2sraFRpR3U4dllwZkdhdVUrOVcxbGkrVFpmM2ZHSm5a?=
 =?utf-8?B?eTdWOHJ4cDVrQmdSbzFtTGdvSFpENmJ3M2h6VXhZS3htSUVhZEphU0xOc1Ax?=
 =?utf-8?B?VzZGZHowSnlCSHhCWkowZzBEQTJ6V2ZPZmJBRHpkRS9Qd3Z0NGY5U2JtVDdK?=
 =?utf-8?B?VS9lSXZaaW9adDcvRGxmY1hLd3UxZ3ppSFM0a01oMjdyQ2tTdlVMNkNncnA1?=
 =?utf-8?B?OURVRHlKSzhSZXJuYUh4T3QyOTJTN1pVMi9ROHlQdEk2Z3VWTjdUbDNZb216?=
 =?utf-8?B?RFZXb05BYUgxQzhMUG5WclBRWmxTZEl5NUQ0NWF5b2lpVlFBSUg2Q093QktX?=
 =?utf-8?B?dndnWUVMVkNrcnE3MzU3MXR1eUpwUzFBdFhTeU5KeUdTSjh2dGxaRjFaaVA0?=
 =?utf-8?B?MFFkSGNBNFVHTTNnU2tNeW9uSUVPaEYyUUpvR3R2cU9pclJnL01xRXNDNGQz?=
 =?utf-8?B?LzJTTU9CMHB3emJ1YUFDU0d2KytLdk44bTdyQ1NQUnNoRE01dG1lb2JCZE91?=
 =?utf-8?B?WEFHYURkQ1Y5NFl6RUR5RUVnVVNPY01kVUx6THdkUkpyY0Foc2FQckFoWnpU?=
 =?utf-8?B?U083KzdPSXJ3aHNIL3lTTjBDSnJNR2ZPYWx6UkFGd2xZT3A1K2s1Qk8zaDVt?=
 =?utf-8?B?R2haT2pDbnpuaFFIemtzRGJhUlJ2U1BsVWpCbW4vd3I0WkNhQmFlNm9RbER0?=
 =?utf-8?B?V3dxRTZYeGpHdkNrbXZpZEFnMVpZWWJEMnQ0ckhuTm8wZEdIQUlCdjhqWkx6?=
 =?utf-8?B?b2phZnhtOG1jOVlnbUVXYlBFa2piaUovMzZiM2tiUUhmN2J2Q2lNdkMxOTJ0?=
 =?utf-8?B?ZlJycTJ4eUpKUklra1kwNVZIRmthNnZLckZ3eml6SERxQVRQbmlQeXUxSUdD?=
 =?utf-8?B?bXQwQ1VhK1R1eldnYXJvVExseHRoejBRT0JsaDRFRkhxNHJlV3B3Sms2cnlQ?=
 =?utf-8?B?LzJwSHJWL1drbDBSa3VqbjBWRmZSMDE3SXRKUzM4b2ZUZnpwZzVNeXFiUHhF?=
 =?utf-8?B?KzNISDdMbHdUREdmLysxZHhzYmNmNytoODVmU0d2MHVKa2ZhV0RNbWE1TkF6?=
 =?utf-8?B?NDVwVXQ3bTRaZm9TTVZ2WHRYbHFTeTJvYWQybjU5VXFuY0xTUWx2S3g1NFpx?=
 =?utf-8?B?WnI2VUl4MW9EbDk0Zzd1ODhyM09WRGhJcmV2K0FIUDAwZG1UdVNKbTkyekMr?=
 =?utf-8?B?NnNKcnVzOW9GZ0JwRlBKM1lQejFRa1B3Zlhqb3pYMmRoZkRybndPR0dJVnJm?=
 =?utf-8?B?QnpTTnJlMUZUZ3k0bmtmOUpsa3I3dmU0OTliWlJodmNPZEN4dnRqNW5UbkFZ?=
 =?utf-8?B?TVpYYVY1SFc3UEtVS3BjWklyRVltMjlLVGNLNllmNVlPMnJya3BPdkRmMnBm?=
 =?utf-8?B?LzRNZUc3MG01cHUxd2lRNEh4VTJwZ0l4K2pIa09XRW5XTlJBaEt5M2wzdVRJ?=
 =?utf-8?B?NVRQV3dJU2NTdkk0SjBvZElzZ1FISXExYlAvcGZuVEtJTjJ6OWVuN21YQTUv?=
 =?utf-8?B?Q0J2ZlJoUjY0Mm1Ec09TczNXOVU1YnFNcDZEWUQveEhGTTNXN0tEWHd0UTFP?=
 =?utf-8?B?MTJIWWxNeitUNmp1UWljWmR1OFBQbzJrM3ptb2VBUWE0eXl1UWZ4cktUYW9h?=
 =?utf-8?B?SnJkZlhyWUlJK0djV2VVclV1bXYvVjUzZ05BeTByVEZNOWp1SHBmbnRoTUZ5?=
 =?utf-8?B?d09IRE4xajNVdjk3eU1adXMrZ2N4VVUrbDhvTURwbjV3cEVXV0g5ajA1T1E0?=
 =?utf-8?B?Q1F5V1ZiYi92dS93R3ZoajNyUngvbGpyNVVHUkx3YVpyRlpzdWJmdGZUSTho?=
 =?utf-8?B?Vy91djh3V0FjY0NvRVJsYWVTNFVPbnFpdnJaY1FQRU5HUlBieHBOSEhPYnJQ?=
 =?utf-8?Q?I9ocrvy/WsqZHL57rnQoDSAtFQUdx0p0N6uIg6YLQ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D4D7B3D85EEC7408714E8865D0EBCB6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4b4a48-1f6e-4dee-55a4-08d9a911c150
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 14:59:57.0958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ne8CLoLIL09w3FzXn2oE6Bs5l4TLp9VL6DPAi5SyKSVuzC/Hty93RpUqTkLCtRTpSXvX/kqN+eCAlzGUdhKC1IYSCVAhwFpRYr2AI3jyLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1778
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
Cc: "santosh@fossix.org" <santosh@fossix.org>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
 "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "atrajeev@linux.vnet.ibm.com" <atrajeev@linux.vnet.ibm.com>,
 "vaibhav@linux.ibm.com" <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkNCg0KTGUgMTYvMTEvMjAyMSDDoCAwNTo0OSwgS2Fqb2wgSmFpbiBhIMOpY3JpdMKgOg0KPiBQ
YXRjaHNldCBhZGRzIHBlcmZvcm1hbmNlIHN0YXRzIHJlcG9ydGluZyBzdXBwb3J0IGZvciBudmRp
bW0uDQo+IEFkZGVkIGludGVyZmFjZSBpbmNsdWRlcyBzdXBwb3J0IGZvciBwbXUgcmVnaXN0ZXIv
dW5yZWdpc3Rlcg0KPiBmdW5jdGlvbnMuIEEgc3RydWN0dXJlIGlzIGFkZGVkIGNhbGxlZCBudmRp
bW1fcG11IHRvIGJlIHVzZWQgZm9yDQo+IGFkZGluZyBhcmNoL3BsYXRmb3JtIHNwZWNpZmljIGRh
dGEgc3VjaCBhcyBjcHVtYXNrLCBudmRpbW0gZGV2aWNlDQo+IHBvaW50ZXIgYW5kIHBtdSBldmVu
dCBmdW5jdGlvbnMgbGlrZSBldmVudF9pbml0L2FkZC9yZWFkL2RlbC4NCj4gVXNlciBjb3VsZCB1
c2UgdGhlIHN0YW5kYXJkIHBlcmYgdG9vbCB0byBhY2Nlc3MgcGVyZiBldmVudHMNCj4gZXhwb3Nl
ZCB2aWEgcG11Lg0KPiANCj4gSW50ZXJmYWNlIGFsc28gZGVmaW5lcyBzdXBwb3J0ZWQgZXZlbnQg
bGlzdCwgY29uZmlnIGZpZWxkcyBmb3IgdGhlDQo+IGV2ZW50IGF0dHJpYnV0ZXMgYW5kIHRoZWly
IGNvcnJlc3BvbmRpbmcgYml0IHZhbHVlcyB3aGljaCBhcmUgZXhwb3J0ZWQNCj4gdmlhIHN5c2Zz
LiBQYXRjaCAzIGV4cG9zZXMgSUJNIHBzZXJpZXMgcGxhdGZvcm0gbm1lbSogZGV2aWNlDQo+IHBl
cmZvcm1hbmNlIHN0YXRzIHVzaW5nIHRoaXMgaW50ZXJmYWNlLg0KDQpZb3UgcmVzZW5kaW5nIHlv
dXIgdjUgc2VyaWVzID8gSXMgdGhlcmUgYW55IG5ld3Mgc2luY2UgeW91ciBzdWJtaXR0aW9uIA0K
bGFzdCBtb250aCB0aGF0J3MgYXdhaXRpbmcgaW4gcGF0Y2h3b3JrIGhlcmUgYXQgDQpodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz0y
NjQ0MjIgPw0KDQpDaHJpc3RvcGhlDQoNCg0KPiANCj4gUmVzdWx0IGZyb20gcG93ZXI5IHBzZXJp
ZXMgbHBhciB3aXRoIDIgbnZkaW1tIGRldmljZToNCj4gDQo+IEV4OiBMaXN0IGFsbCBldmVudCBi
eSBwZXJmIGxpc3QNCj4gDQo+IGNvbW1hbmQ6IyBwZXJmIGxpc3Qgbm1lbQ0KPiANCj4gICAgbm1l
bTAvY2FjaGVfcmhfY250LyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0tlcm5lbCBQ
TVUgZXZlbnRdDQo+ICAgIG5tZW0wL2NhY2hlX3doX2NudC8gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFtLZXJuZWwgUE1VIGV2ZW50XQ0KPiAgICBubWVtMC9jcmlfcmVzX3V0aWwvICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbS2VybmVsIFBNVSBldmVudF0NCj4gICAgbm1l
bTAvY3RsX3Jlc19jbnQvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0tlcm5lbCBQ
TVUgZXZlbnRdDQo+ICAgIG5tZW0wL2N0bF9yZXNfdG0vICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFtLZXJuZWwgUE1VIGV2ZW50XQ0KPiAgICBubWVtMC9mYXN0X3dfY250LyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbS2VybmVsIFBNVSBldmVudF0NCj4gICAgbm1l
bTAvaG9zdF9sX2NudC8gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0tlcm5lbCBQ
TVUgZXZlbnRdDQo+ICAgIG5tZW0wL2hvc3RfbF9kdXIvICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFtLZXJuZWwgUE1VIGV2ZW50XQ0KPiAgICBubWVtMC9ob3N0X3NfY250LyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbS2VybmVsIFBNVSBldmVudF0NCj4gICAgbm1l
bTAvaG9zdF9zX2R1ci8gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0tlcm5lbCBQ
TVUgZXZlbnRdDQo+ICAgIG5tZW0wL21lZF9yX2NudC8gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFtLZXJuZWwgUE1VIGV2ZW50XQ0KPiAgICBubWVtMC9tZWRfcl9kdXIvICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbS2VybmVsIFBNVSBldmVudF0NCj4gICAgbm1l
bTAvbWVkX3dfY250LyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0tlcm5lbCBQ
TVUgZXZlbnRdDQo+ICAgIG5tZW0wL21lZF93X2R1ci8gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFtLZXJuZWwgUE1VIGV2ZW50XQ0KPiAgICBubWVtMC9tZW1fbGlmZS8gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbS2VybmVsIFBNVSBldmVudF0NCj4gICAgbm1l
bTAvcG93ZXJvbl9zZWNzLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0tlcm5lbCBQ
TVUgZXZlbnRdDQo+ICAgIC4uLg0KPiAgICBubWVtMS9tZW1fbGlmZS8gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBbS2VybmVsIFBNVSBldmVudF0NCj4gICAgbm1lbTEvcG93ZXJv
bl9zZWNzLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0tlcm5lbCBQTVUgZXZlbnRd
DQo+IA0KPiBQYXRjaDE6DQo+ICAgICAgICAgIEludHJvZHVjZXMgdGhlIG52ZGltbV9wbXUgc3Ry
dWN0dXJlDQo+IFBhdGNoMjoNCj4gICAgICAgICAgQWRkcyBjb21tb24gaW50ZXJmYWNlIHRvIGFk
ZCBhcmNoL3BsYXRmb3JtIHNwZWNpZmljIGRhdGENCj4gICAgICAgICAgaW5jbHVkZXMgbnZkaW1t
IGRldmljZSBwb2ludGVyLCBwbXUgZGF0YSBhbG9uZyB3aXRoDQo+ICAgICAgICAgIHBtdSBldmVu
dCBmdW5jdGlvbnMuIEl0IGFsc28gZGVmaW5lcyBzdXBwb3J0ZWQgZXZlbnQgbGlzdA0KPiAgICAg
ICAgICBhbmQgYWRkcyBhdHRyaWJ1dGUgZ3JvdXBzIGZvciBmb3JtYXQsIGV2ZW50cyBhbmQgY3B1
bWFzay4NCj4gICAgICAgICAgSXQgYWxzbyBhZGRzIGNvZGUgZm9yIGNwdSBob3RwbHVnIHN1cHBv
cnQuDQo+IFBhdGNoMzoNCj4gICAgICAgICAgQWRkIGNvZGUgaW4gYXJjaC9wb3dlcnBjL3BsYXRm
b3JtL3BzZXJpZXMvcGFwcl9zY20uYyB0byBleHBvc2UNCj4gICAgICAgICAgbm1lbSogcG11LiBJ
dCBmaWxscyBpbiB0aGUgbnZkaW1tX3BtdSBzdHJ1Y3R1cmUgd2l0aCBwbXUgbmFtZSwNCj4gICAg
ICAgICAgY2FwYWJpbGl0aWVzLCBjcHVtYXNrIGFuZCBldmVudCBmdW5jdGlvbnMgYW5kIHRoZW4g
cmVnaXN0ZXJzDQo+ICAgICAgICAgIHRoZSBwbXUgYnkgYWRkaW5nIGNhbGxiYWNrcyB0byByZWdp
c3Rlcl9udmRpbW1fcG11Lg0KPiBQYXRjaDQ6DQo+ICAgICAgICAgIFN5c2ZzIGRvY3VtZW50YXRp
b24gcGF0Y2gNCj4gDQo+IENoYW5nZWxvZw0KPiAtLS0NCj4gdjQgLT4gdjU6DQo+IC0gUmVtb3Zl
IG11bHRpcGxlIHZhcmlhYmxlcyBkZWZpbmVkIGluIG52ZGltbV9wbXUgc3RydWN0dXJlIGluY2x1
ZGUNCj4gICAgbmFtZSBhbmQgcG11IGZ1bmN0aW9ucyhldmVudF9pbnQvYWRkL2RlbC9yZWFkKSBh
cyB0aGV5IGFyZSBqdXN0DQo+ICAgIHVzZWQgdG8gY29weSB0aGVtIGFnYWluIGluIHBtdSB2YXJp
YWJsZS4gTm93IHdlIGFyZSBkaXJlY3RseSBkb2luZw0KPiAgICB0aGlzIHN0ZXAgaW4gYXJjaCBz
cGVjaWZpYyBjb2RlIGFzIHN1Z2dlc3RlZCBieSBEYW4gV2lsbGlhbXMuDQo+IA0KPiAtIFJlbW92
ZSBhdHRyaWJ1dGUgZ3JvdXAgZmllbGQgZnJvbSBudmRpbW0gcG11IHN0cnVjdHVyZSBhbmQNCj4g
ICAgZGVmaW5lZCB0aGVzZSBhdHRyaWJ1dGUgZ3JvdXBzIGluIGNvbW1vbiBpbnRlcmZhY2Ugd2hp
Y2gNCj4gICAgaW5jbHVkZXMgZm9ybWF0LCBldmVudCBsaXN0IGFsb25nIHdpdGggY3B1bWFzayBh
cyBzdWdnZXN0ZWQgYnkNCj4gICAgRGFuIFdpbGxpYW1zLg0KPiAgICBTaW5jZSB3ZSBhZGRlZCBz
dGF0aWMgZGVmaW5hdGlvbiBmb3IgYXR0cmJ1dGUgZ3JvdXBzIG5lZWRlZCBpbg0KPiAgICBjb21t
b24gaW50ZXJmYWNlLCByZW1vdmVzIGNvcnJlc3BvbmRpbmcgY29kZSBmcm9tIHBhcHIuDQo+IA0K
PiAtIEFkZCBudmRpbW0gcG11IGV2ZW50IGxpc3Qgd2l0aCBldmVudCBjb2RlcyBpbiB0aGUgY29t
bW9uIGludGVyZmFjZS4NCj4gDQo+IC0gUmVtb3ZlIEFja2VkLWJ5L1Jldmlld2VkLWJ5L1Rlc3Rl
ZC1ieSB0YWdzIGFzIGNvZGUgaXMgcmVmYWN0b3JlZA0KPiAgICB0byBoYW5kbGUgcmV2aWV3IGNv
bW1lbnRzIGZyb20gRGFuLg0KPiANCj4gLSBNYWtlIG52ZGltbV9wbXVfZnJlZV9ob3RwbHVnX21l
bW9yeSBmdW5jdGlvbiBzdGF0aWMgYXMgcmVwb3J0ZWQNCj4gICAgYnkga2VybmVsIHRlc3Qgcm9i
b3QsIGFsc28gYWRkIGNvcnJlc3BvbmRpbmcgUmVwb3J0ZWQtYnkgdGFnLg0KPiANCj4gLSBMaW5r
IHRvIHRoZSBwYXRjaHNldCB2NDogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvOS8zLzQ1DQo+
IA0KPiB2MyAtPiB2NA0KPiAtIFJlYmFzZSBjb2RlIG9uIHRvcCBvZiBjdXJyZW50IHBhcHJfc2Nt
IGNvZGUgd2l0aG91dCBhbnkgbG9naWNhbA0KPiAgICBjaGFuZ2VzLg0KPiANCj4gLSBBZGRlZCBB
Y2tlZC1ieSB0YWcgZnJvbSBQZXRlciBaaWpsc3RyYSBhbmQgUmV2aWV3ZWQgYnkgdGFnDQo+ICAg
IGZyb20gTWFkaGF2YW4gU3Jpbml2YXNhbi4NCj4gDQo+IC0gTGluayB0byB0aGUgcGF0Y2hzZXQg
djM6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIxLzYvMTcvNjA1DQo+IA0KPiB2MiAtPiB2Mw0K
PiAtIEFkZGVkIFRlc3RlZC1ieSB0YWcuDQo+IA0KPiAtIEZpeCBudmRpbW0gbWFpbGluZyBsaXN0
IGluIHRoZSBBQkkgRG9jdW1lbnRhdGlvbi4NCj4gDQo+IC0gTGluayB0byB0aGUgcGF0Y2hzZXQg
djI6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIxLzYvMTQvMjUNCj4gDQo+IHYxIC0+IHYyDQo+
IC0gRml4IGhvdHBsdWcgY29kZSBieSBhZGRpbmcgcG11IG1pZ3JhdGlvbiBjYWxsDQo+ICAgIGlu
Y2FzZSBjdXJyZW50IGRlc2lnbmF0ZWQgY3B1IGdvdCBvZmZsaW5lLiBBcw0KPiAgICBwb2ludGVk
IGJ5IFBldGVyIFppamxzdHJhLg0KPiANCj4gLSBSZW1vdmVkIHRoZSByZXR1biAtMSBwYXJ0IGZy
b20gY3B1IGhvdHBsdWcgb2ZmbGluZQ0KPiAgICBmdW5jdGlvbi4NCj4gDQo+IC0gTGluayB0byB0
aGUgcGF0Y2hzZXQgdjE6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIxLzYvOC81MDANCj4gDQo+
IEtham9sIEphaW4gKDQpOg0KPiAgICBkcml2ZXJzL252ZGltbTogQWRkIG52ZGltbSBwbXUgc3Ry
dWN0dXJlDQo+ICAgIGRyaXZlcnMvbnZkaW1tOiBBZGQgcGVyZiBpbnRlcmZhY2UgdG8gZXhwb3Nl
IG52ZGltbSBwZXJmb3JtYW5jZSBzdGF0cw0KPiAgICBwb3dlcnBjL3BhcHJfc2NtOiBBZGQgcGVy
ZiBpbnRlcmZhY2Ugc3VwcG9ydA0KPiAgICBkb2NzOiBBQkk6IHN5c2ZzLWJ1cy1udmRpbW06IERv
Y3VtZW50IHN5c2ZzIGV2ZW50IGZvcm1hdCBlbnRyaWVzIGZvcg0KPiAgICAgIG52ZGltbSBwbXUN
Cj4gDQo+ICAgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtbnZkaW1tIHwgIDM1
ICsrKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9kZXZpY2UuaCAgICAgICAgICB8ICAg
NSArDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3BhcHJfc2NtLmMgIHwgMjI1
ICsrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9udmRpbW0vTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgIHwgICAxICsNCj4gICBkcml2ZXJzL252ZGltbS9uZF9wZXJmLmMgICAgICAgICAgICAg
ICAgICAgfCAzMjggKysrKysrKysrKysrKysrKysrKysrDQo+ICAgaW5jbHVkZS9saW51eC9uZC5o
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQxICsrKw0KPiAgIDYgZmlsZXMgY2hhbmdlZCwg
NjM1IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9udmRpbW0v
bmRfcGVyZi5jDQo+IA==
