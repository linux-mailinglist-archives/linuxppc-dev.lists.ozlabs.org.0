Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F423D538F25
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 12:41:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC83J6T6Gz3byL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 20:41:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::625; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC82s1ytdz308M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 20:41:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9qEXOjYbemWe9mUNJ/mBGhss+B0lGJPipnNJ2FdKcbbUTvFczSB6HGwTNsRnY/8cJtLaAZny1H6rX1g7fjZH2G3fvRsypXMJjqgPmIUZxUJ0/1m6J7bwQsPebMsB16rUvX+TD8x0eB2MZvSKR6jgA7KjBrAGbkc9OJIZpWtfH5uGUssSHUHzH9vR3QQX8MSKMEgtFhx2oEFR2FuTMO8Bn89OYUpCMzy1UyMrMPQ1Vq7bhfTvPYPGsGwGcOterCzOCaA+q03WMuZkf2Jt+tWrltEiOnPhxUb3UnqH582wXJpSPAsN2EXJ/44GqyVH6z8E44NcWs2kTAaczWEJytpNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sRwA/uYoPoQZWL3T8VXY/KRpJlR9ghP+R5RP13X3O0=;
 b=D+S6g+vsHmpKsNv8QcggG2hqcjgOSOTJ/yWCABWftXjjFA/bzyHoy7Ddy0ZHSfkKW0uCX758FxDAIuKpHwKtbrh2HYAAVc+U6A0gpV3CbAjnpy4uq6FUYtXedm9YzHTN+YAAEgEyPVwLAPYxt+TyjabDMPz0MfU2oxj0ePnX0goY7t1+2mARFYLUetBZGImdMO/DD+Dj0cEKILPC3ky+q6MfL48UN4I8OzNs4it+yBm0463seGtXnUV4a3sUEVfEd19f0RHMF6qJLQM6012WztLRYBtpSQ/8f61WUNiXF5Yqhr2gr59lceyZjYS/fK03NIawAkur7rYae9yNajFd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1883.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:167::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 10:41:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 10:41:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christoph Hellwig <hch@infradead.org>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/Kconfig: Force THREAD_SHIFT to at least 14 with
 KASAN
Thread-Topic: [PATCH] powerpc/Kconfig: Force THREAD_SHIFT to at least 14 with
 KASAN
Thread-Index: AQHYdD6k3X7WzR6IMEigNl/a6UYJ6K04g2SAgAAXugCAADI5gA==
Date: Tue, 31 May 2022 10:41:00 +0000
Message-ID: <51ed905f-6206-0402-1986-af27f09de9bc@csgroup.eu>
References:  <cc1190008368a3305d424a98be756fedec6348c1.1653926503.git.christophe.leroy@csgroup.eu>
 <87h756kz0s.fsf@mpe.ellerman.id.au> <YpXGmilyOWmAh4WA@infradead.org>
In-Reply-To: <YpXGmilyOWmAh4WA@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac8c9632-ef6c-4d8b-dcf1-08da42f20da3
x-ms-traffictypediagnostic: PR0P264MB1883:EE_
x-microsoft-antispam-prvs:  <PR0P264MB1883F90F8682488F4313E1B1EDDC9@PR0P264MB1883.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MU88vXRrK8KjLfa4j84GkoGYGff1D3xH5fo392Ig4/Eu6GIOm/kRfWFSfwl8ijCU59onr0sVZGqZshoFQCWBqJ7WQ6/l6yWc8DOS56/7P2fwBdot4tFXCjS0kG+RYWknnWgP3FrGZ5cArQs5FfFyyHLxKNKIWxU1sQ/N3MWgddpUEbn+PMvqB4TtucR8CUK0+JTuz4xpdslH5vMMAE58PcyOu0kiqQDk3BZM19hgRsN2EFrlRSlpmpDYdssjyLh1i9dj7VRKMgYlXRLswMGg44qhd2f/BHtG+aju73floDezvjvXsFUuYbM/JGTW4AmijK2vkrUY1grznWuylgr//O/pCJYFkomR6a8dueqnZzIIpc/cS63/paiVPRqMGGNtvq+A8U2VnBfEmrRpN3OKzvD101sdXlrzvnAXpNZ/LfpzdJURru/0835f0Gw6p4HAoAvCACiYUqNT/O2x1RuBWUoRxYXQEvoDAS/k7oUf0juEv4xE7bfFIZ70WV90TIG7tLYJmuDW6Z9zNeQKtJvQ6ra3D7ginOcH2PyHNdbhVrtFjHR7p0PxlGWhzHzwZS2XoHyocOVwvJw5KziTxdw9hPRnuOOHNaMAjqlbG9Y3IoZu6KI3RhDkQ6qNFUefk9YlmgO9ZfezVMOkogIIZ95rtPnuRJYONiqnQpBqV9UOF8NipBKNdhUwIdVKLQSEsh3PHQkCTEH+Y5o2bsJ1SaBjkq7/vyQsZh0ik8n0CTtkTn4Bxt5ubfw4ahtCCn1+4sABhddj+lz3sgRSrA6FCpNOlQJCdT1h4fJslqOeBMtE/yp8wZvf4lg0wour4QsZAjuCvHarJ89sqHcAgAybGL91LJMqdVNN2VpilJU54sGychs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(2616005)(6506007)(31686004)(110136005)(36756003)(316002)(2906002)(54906003)(31696002)(186003)(38070700005)(8936002)(86362001)(66946007)(6486002)(8676002)(64756008)(66446008)(66476007)(66556008)(4326008)(5660300002)(966005)(508600001)(91956017)(76116006)(71200400001)(6512007)(38100700002)(122000001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RDc0SituUTdUcjRyUmI3b3ExSjBpWHVGeU1Iei8yTVVZN1h3MURqV2lzRUlX?=
 =?utf-8?B?WVNESkZIdk9sWFNZSUJUcUVxK3RVTHp2Sy9ZRXF3dnk0bm0yNkRyZDZMVVZk?=
 =?utf-8?B?UXJVN3ZOWjZPak9aRDI0VlZyZEhGVHRST0hBYmhNV0VqVmVwS3dTL0k5Nlpk?=
 =?utf-8?B?c1oyZXByVk1pOTdISk1QamRwRE9wTnFxMDltVmtXdzFoOE9naEVKL0I1cFdt?=
 =?utf-8?B?Vyt2MFlwYmZwVFFYdEpkQVlEeDlxSXJzNkplYlVhODZ4cElPd3B2cktDenJH?=
 =?utf-8?B?VXo3OXQ0WDFkR1ppSXo3aisxTERXNjcvaDhrZHNlTGpkK0hMVWROeHltSGNu?=
 =?utf-8?B?Tk9qMFQvOGVMN1ZTMWlROG4yY1ZscCtrMnY5VlNsRjdndkhPSmFNZ0h0OURy?=
 =?utf-8?B?eEtaWS9oakhoRWQrZWlWQ3pZQ1Z6K3ZKZldIcU1xK0J2MVljSHBieEppdXFo?=
 =?utf-8?B?WHV1UDVUOElYK05ZdjZNb043dDV3U3lndkRnQ2oxY0ZCZG9YMzFNaENSQWV3?=
 =?utf-8?B?QnhsVlhRenl5V2Q5UG9jb0I3RnpWK0VNUE8reVh2a0l0Wk5EemhLQ05DVjlm?=
 =?utf-8?B?OUdaRCt5MXozaEFnMC8yV3RrMzVpNjl2clpKSlIrY1d5aDRXd2JlMCtVbksv?=
 =?utf-8?B?VWlEYUlIOFF3aDQwMnlGSWFOcHYzSHFYRzRtUFMzMEZNSkcwdVM1Z0daV0pu?=
 =?utf-8?B?aUk5N1BHTmpPemxUMjZHWHNqS0pLb1pKV1hOekU5SGEzQzJMc1RsZ09nNlh3?=
 =?utf-8?B?cGU1OFBHWHJCQWQzVXdxZnZIWUpmbTdLeFhFbU54Q0FFbHozeXRsRlVZZWw5?=
 =?utf-8?B?MDlkTjg0cDFUOTBUVlNmT21hVTI1YXVud2FBcGJqQldZcXFFNXNYVDNkbUgx?=
 =?utf-8?B?WUZwTmdLcnIxaGV0WWFZaUVuT0ttMktSMU96elVzQlZtS3Y5YzBIejdUNXIv?=
 =?utf-8?B?U2pnMnhjOWt3UkRwbFVTb1FWUFUyQng5c05ucWpHalRjSnlSUlFmZ0dqZWtY?=
 =?utf-8?B?Q0YzUmJWbDRSQTlQSVM2N1pEU0JFcG1lNGhVTzZoTWQrWDhxQnBQYnFPeG5E?=
 =?utf-8?B?NWZ3UTl3QXZtQ0J2WGhUR0ttbGFWZWJWZXVXOURiUjBnZFV6MmFrcnIwc0ti?=
 =?utf-8?B?K2lsL0xGZ2lPRmwzajNjQ1BYb1RkdGNmMTAraGlvcW0yK09wbkJaaWxlMHBl?=
 =?utf-8?B?MGV4b2JsVU1SVC9JWktxOGN4dFpzdzRCQVZwZXdxaTJQUGt6ajFzd2xHMUdq?=
 =?utf-8?B?bGVKU1VGQTdTQ3NNUUhwUGdWOWsvZEtyZ2NnNWhlalVUNmZKWVMrNVlsQzJP?=
 =?utf-8?B?TGZmeGpJRm5NOURZeWJucmFtcGtTeVVEa2tjL3VERVM2Q3Q2ZnUxWitBSHY4?=
 =?utf-8?B?UUdZM2E5SWpXVFBpQ3BzeGZ6a3NRdXpUU0IyUS94MHRuNHNVMGdNd0NPUGp0?=
 =?utf-8?B?eE1rZGZoaGFPSFdmMVFwYXRwTC90b2NiRVVYTnV2Tll1V3BPNHFUS25wV2Mx?=
 =?utf-8?B?VzZpWEppSkVaQy9UTmx6MFhhZlFzaTNCMi9QSlJhdElZNmFJa2pNelZOUEVF?=
 =?utf-8?B?Y3BuZVpXZzVnUE05bEJGVE95MW9wWWEvSGVJYU5weTJrWTAxZ01XSTdZRVBa?=
 =?utf-8?B?Q2N5LzRXVU54dm9pOGxJUmR3VFFNd2JnakkyQzFWM0VjL05ZbXQ0VW9zUUpu?=
 =?utf-8?B?RmNaOG91WGdFRHVqbXUyN0hVTGxyOFFpcmFvYjNvbk9MazJ0SFNhR1JhajZG?=
 =?utf-8?B?Z3c5dS84eGFPVTVLSHRObHVIQklIRXlVSDVIVUJpeE9zcVlwa1FsaDZmRjhQ?=
 =?utf-8?B?UW1EU2tOVTJIMVVZcW9Qa1dlcWVIV09xQXdWbTdFZ0ZSWVp4a09BNkxkMjlH?=
 =?utf-8?B?OTdzRWc2dEdmTjNVYU9GQlhIWThTZkRtaTJ3SXZNWW9rWFhHQmtQMHlWR2VI?=
 =?utf-8?B?Tjcwb21nL3dLVVJ5bmNMOXhPOGV3bHE2YngxTHVmbjlXbkRUY1NKbXFUNkNx?=
 =?utf-8?B?S3JpUUhBSDJrMk9CMTN3VTJhUXlNR1V6WU14M1FtU094QTV0YnNib1F4ajNa?=
 =?utf-8?B?Tzc1Q3RxMHFoRnJWOXFiTHN1eGltUVh4ZzdpYnByYWxKUG1WTGNYMDBBSEtl?=
 =?utf-8?B?VWg2Y0tWSkxIL0NuKzMyWWpjOG4xM0lVYWY1YU41VkE1YjBpQ2UyQkJhdmdy?=
 =?utf-8?B?dkxlaDgyTFF0WU5iWk9KbkdjWlVkMlZVdjlaeHUxMzhNamJIdzZsMDVZRW1a?=
 =?utf-8?B?SU9Mck9UNDdQUXVwbXdnWHJZRFVwYWk1UDQwVDgyeGd0M0JVaU13dXpQbkhC?=
 =?utf-8?B?L0xXcU9rTGVBWXdCRmtjZkVPQ1ZXVCtXbDZZbW5aZno2NjF0UjYyOS9IQmcw?=
 =?utf-8?Q?jNSoV7t0gsH2A72An/eBbhy4jLOLCAwoSY24h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A64555E54F5DA64AAB3A51B3123F81B6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8c9632-ef6c-4d8b-dcf1-08da42f20da3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 10:41:00.4239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7g5HVf49wdqwAq1abWJhF+d85Ci+Ntro/jjD840k5RnJF6m23Hv7jCtOjUCOau9d4iTX35exXnisNl0K2ILZ3GzrKDl3/ExxukgC9hwKfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1883
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Erhard Furtner <erhard_f@mailbox.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzA1LzIwMjIgw6AgMDk6NDEsIENocmlzdG9waCBIZWxsd2lnIGEgw6ljcml0wqA6
DQo+IE9uIFR1ZSwgTWF5IDMxLCAyMDIyIGF0IDA0OjE2OjE5UE0gKzEwMDAsIE1pY2hhZWwgRWxs
ZXJtYW4gd3JvdGU6DQo+PiBJIHdhcyB0aGlua2luZyBvZiBkb2luZyBpdCBpbiBDLCBzaW1pbGFy
IHRvIHRoZSB3YXkgYXJtNjQgaGFuZGxlcyBpdC4NCj4+DQo+PiBTb21ldGhpbmcgbGlrZSBiZWxv
dy4gSXQgbWVhbnMgd2UgYWx3YXlzIGRvdWJsZSB0aGUgc3RhY2sgc2l6ZSB3aGVuDQo+PiBLQVNB
TiBpcyBlbmFibGVkLiBJIHRoaW5rIGl0J3MgcHJlZmVyYWJsZSwgYXMgaXQgd2lsbCBhbHdheXMg
d29yaw0KPj4gcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZSB1c2VyIGhhcyBhbiBvbGQgLmNvbmZp
ZyAob3IgaXMgYmlzZWN0dGluZyk/DQo+IA0KPiBJcyB0aGVyZSBhbnkgcmVhc29uIHRvIGV2ZW4g
b2ZmZXIgdGhlIEtjb25maWc/ICBJdCBpcyBzdXBlciBjcnlwdGljIGFuZA0KPiBqdXN0IHBpY2tp
bmcgdGhlIHJpZ2h0IHZhbHVlIGRpcmVjdGx5IGluIHRoZSBoZWFkZXIgd291bGQgc2VlbSBtdWNo
DQo+IG1vcmUgc2Vuc2libGU6DQoNCkxvb2tzIGxpa2UgaXQgIHdhcyBhZGRlZCBieSBjb21taXQg
NDc2MTM0MDcwYzAzICgicG93ZXJwYzogTW92ZSANClRIUkVBRF9TSElGVCBjb25maWcgdG8gS2Nv
bmZpZyIpIGluIDIwMTcuDQpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0
LzQ3NjEzNDA3MGMwMzc4MjBiZDkwOWZmNmU0M2UwZDNlYWUzM2YzNzYNCg0KU2VlbXMgbGlrZSBw
b3dlcnBjIGlzIHRoZSBvbmx5IGFyY2hpdGVjdHVyZSB3aXRoIGl0IGNvbmZpZ3VyYWJsZSB2aWEg
DQpLY29uZmlnLg0KDQpJJ2QgYmUgaW5jbGluZWQgdG8gcmV2ZXJ0aW5nIHRoYXQgY29tbWl0LCBh
bmQgdGhlbiBJJ2QgZG8gc29tZXRoaW5nIA0Kc2ltaWxhciB0byBhcm02NDoNCg0KI2lmZGVmIENP
TkZJR19LU0FODQojZGVmaW5lIEtBU0FOX1RIUkVBRF9TSElGVAkxDQojZWxzZQ0KI2RlZmluZSBL
QVNBTl9USFJFQURfU0hJRlQJMA0KI2VuZGlmDQoNCiNpZiBkZWZpbmVkKENPTkZJR19QUENfMjU2
S19QQUdFUykNCiNkZWZpbmUgTUlOX1RIUkVBRF9TSElGVAkJKDE1ICsgS0FTQU5fVEhSRUFEX1NI
SUZUKQ0KI2VsaWYgZGVmaW5lZChDT05GSUdfUFBDNjQpDQojZGVmaW5lIE1JTl9USFJFQURfU0hJ
RlQJCSgxNCArIEtBU0FOX1RIUkVBRF9TSElGVCkNCiNlbHNlDQojZGVmaW5lIE1JTl9USFJFQURf
U0hJRlQJCSgxMyArIEtBU0FOX1RIUkVBRF9TSElGVCkNCiNlbmRpZg0KDQojaWYgZGVmaW5lZChD
T05GSUdfVk1BUF9TVEFDSykgJiYgKE1JTl9USFJFQURfU0hJRlQgPCBQQUdFX1NISUZUKQ0KI2Rl
ZmluZSBUSFJFQURfU0hJRlQJCVBBR0VfU0hJRlQNCiNlbHNlDQojZGVmaW5lIFRIUkVBRF9TSElG
VAkJTUlOX1RIUkVBRF9TSElGVA0KI2VuZGlmDQoNCg0KQW5kIG1heWJlIHRoZSBDT05GSUdfUFBD
XzI1NktfUEFHRVMgY2FzZSBpcyBhbHJlYWR5IGJpZyBlbm91Z2ggYW5kIA0KZG9lc24ndCByZXF1
aXJlIHRoZSArIDEgZm9yIEtBU0FOLg0KDQo+IA0KPiAjaWYgZGVmaW5lZChDT05GSUdfUFBDXzI1
NktfUEFHRVMpDQo+ICNkZWZpbmUgTUlOX1RIUkVBRF9TSElGVAkJMTUNCj4gI2VsaWYgZGVmaW5l
ZChDT05GSUdfUFBDNjQpDQo+ICNkZWZpbmUgTUlOX1RIUkVBRF9TSElGVAkJMTQNCj4gI2Vsc2UN
Cj4gI2RlZmluZSBNSU5fVEhSRUFEX1NISUZUCQkxMw0KPiAjZW5kaWYNCj4gDQo+ICNpZmRlZiBD
T05GSUdfS0FTQU4NCj4gI2RlZmluZSBUSFJFQURfU0hJRlQJCShNSU5fVEhSRUFEX1NISUZUICsg
MSkNCj4gI2Vsc2UNCj4gI2RlZmluZSBUSFJFQURfU0hJRlQJCU1JTl9USFJFQURfU0hJRlQNCj4g
I2VuZGlmDQo+IA0KPiAjaWYgZGVmaW5lZChDT05GSUdfVk1BUF9TVEFDSykgJiYgVEhSRUFEX1NI
SUZUIDwgUEFHRV9TSElGVA0KPiAjdW5kZWYgVEhSRUFEX1NISUZUDQo+ICNkZWZpbmUgVEhSRUFE
X1NISUZUCQlQQUdFX1NISUZUDQo+ICNlbmRpZg==
