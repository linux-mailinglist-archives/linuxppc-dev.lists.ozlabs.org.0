Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960A58D361
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 07:52:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M22Kh0t96z3bls
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 15:52:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FQxRby78;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.58; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FQxRby78;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120058.outbound.protection.outlook.com [40.107.12.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M22Jy3WzLz2xmm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 15:52:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNSJGvVzglHHxXf576Va5sJnkl44k9qp3/QpjcTZgE9e4h8iF6oD/FpSb6WC9R1uuk32oYNLEoOo4ETsuAYke/rMHOaZ0wCpKcyOe8blikUTmWJkolisqUabLZAP8UnpNUyLLAi57bZEcIdsQYR8HRQ20ids+Vvda0ivQn1vSH79BLM+QnvP2XLTDUkICbRIskdetQaRsw9Qmc/HgdgAFSI0qMLhgmJHAw8jb4Y/GonldX5teUSjHXmyJgv7wgwHqws/sraLto4nWf7C0gcafAvet/4YWG/EYtMhN+sTdmp3EWI2VX3Cf9ZntNuLlGhIHE3AH5NeNDb5HBh3b3xIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg4hpU2Ye1iYtZS7LDpyAk0h8VZI5wmfvzJhd46+78w=;
 b=l0NiI4Xsl6oUEDqNkWusDWV1JbbYDstMxLDoTKk5uS3wq7YueIzE5R+zMfXewSKeICSG6/2eI237OwgtdfjRkYv7Iogt4tRRlMpyTnWcjal9WZKFU9gE3/+tjjTfzJcKKLIgFnfU7f5BavrHidCboJhhO0fhaCQmYyWH6kYV18Qo6Bo0FqhP2k2W1GzNXxAKb/fVXXAwXIvS1uxr9mBTtiX740bztPDocckbW3cVOjMK1NbDqLdIZ5BjTStA3IasLP+/Bw1ByjCdamznd4SVvpY9q+OXWM2vsRx+Oogb0IiPqP5C+8L1KmQduFZZBaJ6rkspf72eTS9HDBvbryutRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qg4hpU2Ye1iYtZS7LDpyAk0h8VZI5wmfvzJhd46+78w=;
 b=FQxRby788hk1qtw2i/gVm9J7b6fIFJ/Ocl+PL1pS7h+5+p4dsH848MRJ+NL51rNUFPbre6Rt1pDct8UHZsvfBgKtf898tufRuT3/OS31TAYrTqQvJPlzD1VZAg4urfS3NntCCReeAY0CiCScKv8Frk+oTWVFXRzEJKB5id4YmZJK+kTHnAVA8i+pDbPLRkJGp/26qUfSSdMgv/WWobX3+GrUB7L3xF6zHPTb5hYl8tLj0WyCXGF0jAHLvkXqQJBxoZEe3o7SkjwjBsBQmSbZXmHnfO8vHXv5F2V9vyguqzXWpGCltWMaK4qxFZZQ+kPAXnLx2epDkKgUyKtQLgMPeQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2801.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:36::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 05:51:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.021; Tue, 9 Aug 2022
 05:51:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Russell Currey <ruscur@russell.cc>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3] powerpc/mm: Support execute-only memory on the Radix
 MMU
Thread-Topic: [PATCH v3] powerpc/mm: Support execute-only memory on the Radix
 MMU
Thread-Index: AQHYq5oL7Hhjo6rh10WQyG6gALDcLK2mEQ6A
Date: Tue, 9 Aug 2022 05:51:57 +0000
Message-ID: <a92bd3e4-a351-02a4-12df-bb08d489327f@csgroup.eu>
References: <20220809024433.17644-1-ruscur@russell.cc>
In-Reply-To: <20220809024433.17644-1-ruscur@russell.cc>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ef0dfe5-6b7c-4f21-5d7e-08da79cb453e
x-ms-traffictypediagnostic: MR1P264MB2801:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WQDQABA7TKpuJjduHA7oZlvS2sJGRV5qYjDFkBy4xKQt20DvIYc6nQz+pXLsf3nksMVYELfYsqdq+KGI4ufupNyuSShsVc9Dok64VIXYoatAxDSCaKTIql17apgo0hJcDUjYVwXAqAksKFXXvIeBXaUWAnrgn9t1MtKsblpTs3hk1Olu7K+2m09UMLToHbjK+Leu5NT3d8HKuh+yBd2H+5bC1nbhgoQvGtqk4h9hBrRNCkuKdY0V0omSqu0M8h2wLLgBz+6RNoE/B1EzRkaBpN19XFq+djQvAXPj6WRk77GcFWGzzCSY+Rg40ehqIFcD5yEXNCnbz8G5U9XcyM1JcFp48Kifz/UfkVcQF3pkVEFSvMyK775nh+DYAaA0LhGDYtpT+N4dl4U0BRfuwGiRiD0Ek2wkj6d3OeCakkh+bmnJHVLR1EH8Dsd7NDEaV3bY583rUW75NRGhnV0YPQ7LFhCn9c9GxShbWaBadCxV2iHbCrzFRHn+CSxcFwx9HYSBjLPo1k0cfPp1cfIjEBZgTmGekCIGYmSMfGKbMeC5HtZBTcJKHtQ72mVtNZbiMAMRSNRK6ffpQsuLgSo951WAkpp7rU6GxMJR3+QC7CDkEjCEOoOVH0nSlO+78Gzww4rRMwrAn3+1KxKyWEZ1BVWVBT/BB+UvfbtSkMYiTmJW0vBvvOAxIV6znEkK5VfL3yRaa2su24pRT7hPwxrZtnyP6XMflVyhvdYBQnet2OR0Acry5F+uSvOUq3loa5nZ5zrHOEBq3up8phmLyulFi9DRNxWw7VzaVF+aUYriSK+J1zWuxOhldnnAA5YxPeBgJHrwg3xEWIYpJulb/XEJzsgV6+CBO8Yo3u05Jzf7lfopsRYqRVMkNA/Pl7i+4OrU2nhdG6Kb6zLLdMXVmXVNsLhzOg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(366004)(136003)(39850400004)(376002)(76116006)(4326008)(8676002)(316002)(64756008)(66946007)(66556008)(66476007)(66446008)(8936002)(91956017)(44832011)(5660300002)(38100700002)(38070700005)(122000001)(31696002)(86362001)(2906002)(6486002)(966005)(478600001)(6506007)(41300700001)(71200400001)(54906003)(110136005)(83380400001)(36756003)(2616005)(6512007)(26005)(66574015)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NlVTTmYxay9rTGp4cU9UU3M2RnMweVdCWTVxdnphTE1Pbjh5czkxY0paWWE5?=
 =?utf-8?B?d2h0eVFOUkxKazFJUGYzaDQyTGJBUFdIdHJ5NUE5bnRrcUZGM0JpNFdVbTFq?=
 =?utf-8?B?bGRiWTFmb2lQd3ZCWWdqbGJBQjBxakJ0QWlaSzR1MFU4TWhpR05WZ05CWCtB?=
 =?utf-8?B?MXE5YVAvSlNsTEIwUmFUNzBXZVl1TkZNTXVRb2lVeFJXN3g0VFhuTVQwMnZz?=
 =?utf-8?B?dzFvbW1wcHhoNnV4d2JzZ2NjWkFXMng4eWV6QTVhNnNMTjRQc2IzOVpSZkNx?=
 =?utf-8?B?QmREZ1ZGckE3R2pob2dXV3c1OFdSUHluNXJDL2dLa29mYTRwdUZHTkJTbGww?=
 =?utf-8?B?cmU2S2lXbG8xWklmRXlpZWZrQmJEZ3FDWS9LUW44eitGUUJ6VUZxdWFIMGFr?=
 =?utf-8?B?eGs2OEFwckhOM1VjQXU3SzA2M3hrN3lDYXpDdlJNQmNLMkR4WmFFd2cwcmxL?=
 =?utf-8?B?QlpmZlIzck1UZkt5MVo4VXRQV29MWTljQ1RCWHhvNTVyU3k0dVNMWjdPeVpz?=
 =?utf-8?B?eDUvTEI3T1lLRGl1eXlPd0p3WXdML2l5bE9GMzYzemdLMEs0UGNQS3pVRzcx?=
 =?utf-8?B?cm16ZTcwR3RVeWdieklhT3R4YjlMdHU5b2tNcFFrQy9tQzE2L05DTVFBczBU?=
 =?utf-8?B?UXZBeGt1Q0NjMXkxMktLVFBXVWQrU1BOZEJrOU14Sjc5RldQSHcvVU1NRit1?=
 =?utf-8?B?Q1E2LzJYWUNlYTRhQ3F5SCt5SFhzSmJPemNYcWVZcXloWFkyNUhoeGZESitj?=
 =?utf-8?B?OVQ4U0xGcE1DL2JqcGpMZ2FUQ1JidWV1TDBVWVBzemZEYU5MQTR0VURMd2o0?=
 =?utf-8?B?d3UzK2VpbVdPVVliOGJ5Tmd0Um13dHZEWEhGR0c0Q1E1Y0YvQ3NWVUlxTVpt?=
 =?utf-8?B?Y2cxeVRGZ3dwaFVacDJwQ2ZwVWxzdVBHd1BqY1cya2VGZXQ4Sm9aTlZhSUxR?=
 =?utf-8?B?dUFmTHBGSC9MdGNBWjRSOUEvR1UwbHVPenpLSnB3dXFlZUxGRWFzTEhQREpu?=
 =?utf-8?B?VlVITk56OElteExJZm9zN3c2RS9LMWc0dmVXQjZaRzNUREtOeXlWclhURTU1?=
 =?utf-8?B?T2Vlbk9ZekMwTE5YUklZRDRQZFdtb2t0MStyM0Jod2dpNDlLYzNxb2E0d2ZG?=
 =?utf-8?B?TjlSYzZNSzhJM1p3cm9icy96bFNYdFhoeGZRODJraVNRYlNPTWJFUjNOR0VZ?=
 =?utf-8?B?ZEhXRmZkU05iYW1sR3VLVENNTjFhQmRBWDNwREEreWY3Zmd6emVBQUdhdzh0?=
 =?utf-8?B?OG1ic3VBTUxZSkFYbTlpWUh5RHhyNHNFN0hsaXEzSGs5ekQydW5LZmxIbmxl?=
 =?utf-8?B?MzlZb3Vnc1RBM2FWL0gwUFRWZ3Z3OS9ZYjFjS2V2SEFOaGFEd3p5cURWbWFH?=
 =?utf-8?B?Lzg3Tm5Qd2ZPR2hCalc2OSt5SGVha0d5QmxQb1poNHFpN3h6UFAwZmFYWFgw?=
 =?utf-8?B?eU54NVVZbENrZE0xOVFDNERqcjAxanFxck14dDRFNmd4ZVNIRDRSNDhSNUtF?=
 =?utf-8?B?azZqUDJqSU4rRitxT3hoTWtabVJ6VnI0SWlpeVRNSjg3NTJJVHRJZzJqaVE2?=
 =?utf-8?B?M3psRW5IM09WMVV3enFHV1RSOTVjc2dGR1hGV0hWa2dsWmVBemFPTERXNkZs?=
 =?utf-8?B?cU9CMXBwMUJncndBc3U2RDBjVzFXYzlpRFZWeVRWazUzUGpCWFVDNE9vYmpi?=
 =?utf-8?B?V2p2L3ZYRm9pSm9xVWVzaFdsdDc5TVpvNUxKRGFCeE45LzhRc1oxcDFtSmpa?=
 =?utf-8?B?T0Z3UGRMdHRxNHlWK2F5V0JQMjRDUGZ2TTRSZzVKN3lrT2NTL1prSWd6azQx?=
 =?utf-8?B?dXJuTWs1bStiQjJ2R3ZDcXAzbUMwU0pwdUpRNDZPcDZzTUpFSVR3WFRmVFRw?=
 =?utf-8?B?RjBwMWpxVEczdm03MXYrUUhPcFlhTFlKTUk0NWs0WHFFWGJyTlo3clJqcC81?=
 =?utf-8?B?akw4TXVtaVNGOWZ1RDM4c1RpeGs2ZmhYdlRmekNBWkdoTElKblhmK1NpZGlW?=
 =?utf-8?B?azZGcmZNOTRpWmRKanRldW9jWmJQS2pweTM1Snh3Vi9yVVNsRnU1R084MFVF?=
 =?utf-8?B?blMrZ0ZnQzJScC9XMnZ3T3J2YTVaSFE2aE1XOU52dnJ2anVIcVE0NnRrUmVO?=
 =?utf-8?B?RVBJMG9XOG9KQkhIeXBkeTNqYXFPU0dJcmd3UU5uZUdKSXp1bjIzN2Z5dFpI?=
 =?utf-8?Q?OmAmvB4At/oCoCP2deZFZHY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFBA4103295E114E9F1E0C0D2832576D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef0dfe5-6b7c-4f21-5d7e-08da79cb453e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 05:51:57.2758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: snyCFii4P+9N+f3SnnEY2uONkURdwLAIVho5hJqWkDaWvbqPERFk2leO/MEQ7uSHsDPEBdKGjV+9ISLR6HgC1JbCu0Dpbo64RqUuMK7S0s4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2801
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TGUgMDkvMDgvMjAyMiDDoCAwNDo0NCwgUnVzc2VsbCBDdXJyZXkgYSDDqWNyaXTCoDoNCj4gVGhl
IEhhc2ggTU1VIGFscmVhZHkgc3VwcG9ydHMgWE9NIChpLmUuIG1tYXAgd2l0aCBQUk9UX0VYRUMg
b25seSkNCj4gdGhyb3VnaCB0aGUgZXhlY3V0ZS1vbmx5IHBrZXkuICBBIFBST1RfRVhFQy1vbmx5
IG1hcHBpbmcgd2lsbCBhY3R1YWxseQ0KPiBtYXAgdG8gUlgsIGFuZCB0aGVuIHRoZSBwa2V5IHdp
bGwgYmUgYXBwbGllZCBvbiB0b3Agb2YgaXQuDQoNCkkgZG9uJ3QgdGhpbmsgWE9NIGlzIGEgY29t
bW9ubHkgdW5kZXJzdG9vZCBhY2Nyb255bS4gTWF5YmUgdGhlIGZpcnN0IA0KdGltZSB5b3UgdXNl
IGl0IGl0J2QgYmUgYmV0dGVyIHRvIHNheSBzb21ldGhpbmcgbGlrZToNCg0KVGhlIEhhc2ggTU1V
IGFscmVhZHkgc3VwcG9ydHMgZXhlY3V0ZS1vbmx5IG1lbW9yeSAoWE9NKQ0KDQpXaGVuIHlvdSBz
YXkgdGhhdCBIYXNoIE1NVSBzdXBwb3J0cyBpdCB0aHJvdWdoIHRoZSBleGVjdXRlLW9ubHkgcGtl
eSwgDQpkb2VzIGl0IG1lYW4gdGhhdCBpdCBpcyB0YWtlbiBpbnRvIGFjY291bnQgYXV0b21hdGlj
YWxseSBhdCBtbWFwIHRpbWUsIA0Kb3IgZG9lcyB0aGUgdXNlcnNwYWNlIGFwcCBoYXMgdG8gZG8g
c29tZXRoaW5nIHNwZWNpYWwgdG8gdXNlIHRoZSBrZXkgPyANCklmIGl0IGlzIHRoZSBzZWNvbmQs
IGl0IG1lYW5zIHRoYXQgZGVwZW5kaW5nIG9uIHdoZXRoZXIgeW91IGFyZSByYWRpeCBvciANCm5v
dCwgeW91IG11c3QgZG8gc29tZXRoaW5nIGRpZmZlcmVudCA/IElzIHRoYXQgZXhwZWN0ZWQgPw0K
DQo+IA0KPiBSYWRpeCBkb2Vzbid0IGhhdmUgcGtleXMsIGJ1dCBpdCBkb2VzIGhhdmUgZXhlY3V0
ZSBwZXJtaXNzaW9ucyBidWlsdC1pbg0KPiB0byB0aGUgTU1VLCBzbyBhbGwgd2UgaGF2ZSB0byBk
byB0byBzdXBwb3J0IFhPTSBpcyBleHBvc2UgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSdXNz
ZWxsIEN1cnJleSA8cnVzY3VyQHJ1c3NlbGwuY2M+DQo+IC0tLQ0KPiB2MzogSW5jb3Jwb3JhdGUg
QW5lZXNoJ3Mgc3VnZ2VzdGlvbnMsIGxlYXZlIHByb3RlY3Rpb25fbWFwIHVudG91Y2hlZA0KPiBC
YXNpYyB0ZXN0OiBodHRwczovL2dpdGh1Yi5jb20vcnVzY3VyL2p1bmtjb2RlL2Jsb2IvbWFpbi9t
bWFwX3Rlc3QuYw0KPiANCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3Bn
dGFibGUuaCB8ICAyICsrDQo+ICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3BndGFibGUuYyAg
ICAgICAgICAgfCAxMSArKysrKysrKystLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9mYXVsdC5jICAg
ICAgICAgICAgICAgICAgICAgIHwgIDYgKysrKystDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gaW5kZXggMzkyZmY0OGY3N2RmLi40ODY5MDJh
ZmYwNDAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQv
cGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0
YWJsZS5oDQo+IEBAIC0xNTEsNiArMTUxLDggQEANCj4gICAjZGVmaW5lIFBBR0VfQ09QWV9YCV9f
cGdwcm90KF9QQUdFX0JBU0UgfCBfUEFHRV9SRUFEIHwgX1BBR0VfRVhFQykNCj4gICAjZGVmaW5l
IFBBR0VfUkVBRE9OTFkJX19wZ3Byb3QoX1BBR0VfQkFTRSB8IF9QQUdFX1JFQUQpDQo+ICAgI2Rl
ZmluZSBQQUdFX1JFQURPTkxZX1gJX19wZ3Byb3QoX1BBR0VfQkFTRSB8IF9QQUdFX1JFQUQgfCBf
UEFHRV9FWEVDKQ0KPiArLyogUmFkaXggb25seSwgSGFzaCB1c2VzIFBBR0VfUkVBRE9OTFlfWCAr
IGV4ZWN1dGUtb25seSBwa2V5IGluc3RlYWQgKi8NCj4gKyNkZWZpbmUgUEFHRV9FWEVDT05MWQlf
X3BncHJvdChfUEFHRV9CQVNFIHwgX1BBR0VfRVhFQykNCj4gICANCj4gICAvKiBQZXJtaXNzaW9u
IG1hc2tzIHVzZWQgZm9yIGtlcm5lbCBtYXBwaW5ncyAqLw0KPiAgICNkZWZpbmUgUEFHRV9LRVJO
RUwJX19wZ3Byb3QoX1BBR0VfQkFTRSB8IF9QQUdFX0tFUk5FTF9SVykNCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9wZ3RhYmxlLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvcGd0YWJsZS5jDQo+IGluZGV4IDdiOTk2NjQwMmIyNS4uNjJmNjNkMzQ0NTk2IDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcGd0YWJsZS5jDQo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9tbS9ib29rM3M2NC9wZ3RhYmxlLmMNCj4gQEAgLTU1Myw4ICs1NTMsMTUgQEAg
RVhQT1JUX1NZTUJPTF9HUEwobWVtcmVtYXBfY29tcGF0X2FsaWduKTsNCj4gICANCj4gICBwZ3By
b3RfdCB2bV9nZXRfcGFnZV9wcm90KHVuc2lnbmVkIGxvbmcgdm1fZmxhZ3MpDQo+ICAgew0KPiAt
CXVuc2lnbmVkIGxvbmcgcHJvdCA9IHBncHJvdF92YWwocHJvdGVjdGlvbl9tYXBbdm1fZmxhZ3Mg
Jg0KPiAtCQkJCQkoVk1fUkVBRHxWTV9XUklURXxWTV9FWEVDfFZNX1NIQVJFRCldKTsNCj4gKwl1
bnNpZ25lZCBsb25nIHByb3Q7DQo+ICsNCj4gKwkvKiBSYWRpeCBzdXBwb3J0cyBleGVjdXRlLW9u
bHksIGJ1dCBwcm90ZWN0aW9uX21hcCBtYXBzIFggLT4gUlggKi8NCj4gKwlpZiAocmFkaXhfZW5h
YmxlZCgpICYmICgodm1fZmxhZ3MgJiAoVk1fUkVBRHxWTV9XUklURXxWTV9FWEVDKSkgPT0gVk1f
RVhFQykpIHsNCg0KTWF5YmUgdXNlIFZNX0FDQ0VTU19GTEFHUyA/DQoNCj4gKwkJcHJvdCA9IHBn
cHJvdF92YWwoUEFHRV9FWEVDT05MWSk7DQo+ICsJfSBlbHNlIHsNCj4gKwkJcHJvdCA9IHBncHJv
dF92YWwocHJvdGVjdGlvbl9tYXBbdm1fZmxhZ3MgJg0KPiArCQkJCSAgKFZNX1JFQUR8Vk1fV1JJ
VEV8Vk1fRVhFQ3xWTV9TSEFSRUQpXSk7DQo+ICsJfQ0KPiAgIA0KPiAgIAlpZiAodm1fZmxhZ3Mg
JiBWTV9TQU8pDQo+ICAgCQlwcm90IHw9IF9QQUdFX1NBTzsNCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9tbS9mYXVsdC5jIGIvYXJjaC9wb3dlcnBjL21tL2ZhdWx0LmMNCj4gaW5kZXggMDE0
MDA1NDI4Njg3Li41OWU0Y2JjZjMxMDkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9m
YXVsdC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9mYXVsdC5jDQo+IEBAIC0yNzAsNyArMjcw
LDExIEBAIHN0YXRpYyBib29sIGFjY2Vzc19lcnJvcihib29sIGlzX3dyaXRlLCBib29sIGlzX2V4
ZWMsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hDQo+ICAgCQlyZXR1cm4gZmFsc2U7DQo+ICAg
CX0NCj4gICANCj4gLQlpZiAodW5saWtlbHkoIXZtYV9pc19hY2Nlc3NpYmxlKHZtYSkpKQ0KPiAr
CS8qIE9uIFJhZGl4LCBhIHJlYWQgZmF1bHQgY291bGQgYmUgZnJvbSBQUk9UX05PTkUgb3IgUFJP
VF9FWEVDICovDQo+ICsJaWYgKHVubGlrZWx5KHJhZGl4X2VuYWJsZWQoKSAmJiAhKHZtYS0+dm1f
ZmxhZ3MgJiBWTV9SRUFEKSkpDQo+ICsJCXJldHVybiB0cnVlOw0KDQpXaHkgZG8geW91IG5lZWQg
dGhlIHJhZGl4X2VuYWJsZWQoKSBoZXJlID8NCkV2ZW4gaWYgaXQgZG9lc24ndCBmYXVsdCBkaXJl
Y3RseSwgcmVhZGluZyBhIG5vbiByZWFkYWJsZSBhcmVhIGlzIHN0aWxsIA0KYW4gZXJyb3IgYW5k
IHNob3VsZCBiZSBoYW5kbGVkIGFzIHN1Y2gsIGV2ZW4gb24gaGFyZHdhcmUgdGhhdCB3aWxsIG5v
dCANCmdlbmVyYXRlIGEgZmF1bHQgZm9yIGl0IGF0IHRoZSBmaXJzdCBwbGFjZS4gU28gSSdkIGp1
c3QgZG86DQoNCglpZiAoISh2bWEtPnZtX2ZsYWdzICYgVk1fUkVBRCkpKQ0KCQlyZXR1cm4gdHJ1
ZTsNCg0KPiArCS8qIENoZWNrIGZvciBhIFBST1RfTk9ORSBmYXVsdCBvbiBvdGhlciBNTVVzICov
DQo+ICsJZWxzZSBpZiAodW5saWtlbHkoIXZtYV9pc19hY2Nlc3NpYmxlKHZtYSkpKQ0KPiAgIAkJ
cmV0dXJuIHRydWU7DQo+ICAgCS8qDQo+ICAgCSAqIFdlIHNob3VsZCBpZGVhbGx5IGRvIHRoZSB2
bWEgcGtleSBhY2Nlc3MgY2hlY2sgaGVyZS4gQnV0IGluIHRoZQ0KDQpEb24ndCB1c2UgYW4gaWYv
ZWxzZSBjb25zdHJ1Y3QsIHRoZXJlIGlzIG5vIG90aGVyICdlbHNlJyBpbiB0aGF0IA0KZnVuY3Rp
b24sIG9yIGluIHNpbWlsYXIgZnVuY3Rpb25zIGxpa2UgYmFkX2tlcm5lbF9mYXVsdCgpIGZvciBp
bnN0YW5jZS4NCg0KU28gbGVhdmUgdGhlICF2bWFfaXNfYWNjZXNzaWJsZSh2bWEpIHVudG91Y2hl
ZCBhbmQgYWRkIHlvdXIgY2hlY2sgYXMgYSANCnN0YW5kYWxvbmUgY2hlY2sgYmVmb3JlIG9yIGFm
dGVyIGl0Lg0K
