Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B74F58773D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 08:48:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxlvV37bNz3bpr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 16:48:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jqOK3dK0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.73; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jqOK3dK0;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120073.outbound.protection.outlook.com [40.107.12.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lxlth06kbz2xHm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 16:48:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCxWjhWeKjyTPqOi7XWsQmzlylTiW9xW9lO/qzBY6zGFTFN39G9dw/W+04N6OeaY4bpNz9J/+HsejPO2xpHS/AVhrCIdzdIwv7Agi4+JDZXpvmgqamDqntiRk4W5FutltWaclRypcHQjoymG+wMw/YUo/Y5de5q/lH9D6RcNRbcdMELaaK7LBFXpSFO+0IT0JKG1mn5A8KHHMAkEunESvHhG6O3Vmz363QKzHHrW9cW3gQFxTS7YyLtKni6cMlK/+ASgyRZ72X1tyWNJ+97DJKvUjAmNnVTGEUcT+f3QhEosLmTE9weFj0hIWLOGSrSsEWuPUfkhJDoB2isVBE+baA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxxGNsYPoxttE/HjCViQlBV4fPMlfFxwRqDclNzq/dU=;
 b=Hg3WMphzFsBKtJiAZQbltkws6+tZv4cdnq6iOr9oa4O2hGQHXAJxAk4VHEAFnH+wff9UTAQ4F+qNcFx08x95dAVEtpdmNrECjIk7CCitvNqGrkQL8LoXGkMosOJij6zNtM7bqI+5FsGkCq5w7MNAFV+XY60tV7M7ioCtMgC4ra+dLBUK+4GQ+evXl+CIrrqp4VDI/PAiS0ClO+X+ykeNBLP4xMUzUNbW2xTScq4t7r9reVRpar4vScRHD3wD8G/le4D4sOCphrq230ANrSecuE54L3kzryEEMQVWMLOBuAnFs2qqrlo67d4jmZ3ycEnB5TE5yUJ7ypb39OBzpV+RkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxxGNsYPoxttE/HjCViQlBV4fPMlfFxwRqDclNzq/dU=;
 b=jqOK3dK0FwHvfT0q+oj14O60j7pGVus37k4VDcjGrhKFAO7sV+8PTyytfKpF3HELdm0aZ12Uq5lf+lSWYpxHGg4FT2hKZVJqCXDaYChAWNzu21UUFiyse/SWZ0fggQVkLDYSMwixeK97k7UrVckZezfcJeAlC11nL7QPVx/ypuK0cbfthQ61JKM6uWNK7H0wK+1mIJ930pevX+/ZAUSDyPU5FEuliVqsZeHqck9PKP1F5BgIT+jOHmGhF2N88kDYSJyM4H/t2mgD0gCy8nkIjx4uaS5/y4E5NtelliPV3tLTBFBc0pPbBzuzKOFhwdgLQEyVKAptPWp2glEMEnYIeQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2574.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 06:47:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 06:47:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>, Arnd Bergmann
	<arnd@arndb.de>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
Thread-Topic: Regression: Linux v5.15+ does not boot on Freescale P2020
Thread-Index:  AQHYnarFcL6sKMJcmk+y5CiOp18nOa2MCX8AgAAG5QCAArLxgIAATEEAgAA6FYCAAEATgIAAHRcAgACyxACAAAgSgIAAToqAgAqMBIA=
Date: Tue, 2 Aug 2022 06:47:49 +0000
Message-ID: <7e7feffd-1f22-83bf-1c74-4ec48d973514@csgroup.eu>
References: <20220722090929.mwhmxxdd7yioxqpz@pali>
 <6b227478-73b8-2a97-1c78-89570d928739@csgroup.eu>
 <20220723150702.jecerkhxhy65dgww@pali> <875yjld2oe.fsf@mpe.ellerman.id.au>
 <20220725125256.cg6su4d2ageylvp6@pali>
 <e2487668-b6d9-9ddb-1bb4-9f4d37fae1a7@csgroup.eu>
 <20220725201009.gwuchzswcqaxntrk@pali>
 <20220725215416.GV25951@gate.crashing.org>
 <20220726083406.tcjvny6d2di6q7ar@pali>
 <CAK8P3a2iM+RoySWEC2e0==rwBSVrZoRa8c4ADyFNB24JZM=hkw@mail.gmail.com>
 <20220726134405.GX25951@gate.crashing.org>
In-Reply-To: <20220726134405.GX25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 496d161c-6e9a-4dd5-004c-08da7452eab6
x-ms-traffictypediagnostic: PAZP264MB2574:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  v6pltD37rzF+j6xiIG8EjJII6C99cDsZgPXsLPV4zlz6buPSIXyW2YlxQAyHSa1SaMT9H51HcNDRn/KqeqRO2hsaNtRWUsYQCgkAokgXAq17pOb8yqOI2kNZs4XBereoWEPp1iTEcT2HXmRUv70SwFBK+B1fD0+mEfV98PgI0Sq1zzsNaQgaOY2uYASwBI48kSXfQpKTH/937bTnTN/7BaRXcbrmh3IIg+foDG3A9G3jpdWpwJjt1Fd/iMafbB7p0kWx5PZjvA/wyPVmVguRMgwUHbFq48tKv7NDJydhYvTZVilPWRpf8EEKCkxFpMho/HenU+hxOrcDKHxHVZ4ziLVs/muRUU8WjvfQzlAp3A0WOKQCjd92QFrDPU6PAN/ClHuh7bDkY+KqB/ns71Azd17xdfG14X+PzgAmxkHGRAPYNOosyH12BkRveDP+IYIOJLd+qyvUka0Xji86fguMud+adbBQwh40qS2i4+QV8GB9NfWW9sw9dp9HxPPqDMS2qQErZjETF0VTfZz3AK+15SHAhUSU/rOrvmm6PuiFUrrt8qOLbzsijIWnOpUYH1b0Nv4QrDh4o+iLO2xtJ+r5sTmMf2Ug5lkIjcKcug2qPU1tNUFbeBNhHUIqtEkPIqIjoEAJEItmYPPPzfLtDzgZk/QfAtFeTSrVKyryy5i4uGtKpMgOPxY/JaSo1DWcRcphC6nkNrMEWSDTC7sGmaYDA8ALWF7u78QQ1nA+MBM8KkseT2ylNUW+s8hSci5k3SFOX0wG4Kt9eksNt6on1yrPnY5Ro55/N5KHSSz6zTa7G7PRyUjTs9/HoPAaB4ue/E9expLjRdfAdqSVytt7/q9VyMl/yNECVicr0M3TCmFA0MyJWeADt78cel1rPpoXlhxCQXzqHvhJLG4Ohl1quiajpw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(346002)(136003)(376002)(396003)(366004)(91956017)(2906002)(66574015)(71200400001)(478600001)(76116006)(66946007)(66556008)(66446008)(64756008)(8676002)(4326008)(5660300002)(66476007)(6486002)(6506007)(966005)(44832011)(53546011)(8936002)(26005)(41300700001)(38070700005)(2616005)(54906003)(86362001)(110136005)(83380400001)(38100700002)(6512007)(31686004)(316002)(31696002)(186003)(36756003)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cFhLdkJkQkt3aWN2ZU40aXJiTXF0WEpnYlNUbHBvZjRUa2tqaFhLQWVhaHcv?=
 =?utf-8?B?b01Jay9mMXJ2L0x3L0VXcUxLVW40NDJjVEhiams0TzE5UXBwc2ZYbnR0ODND?=
 =?utf-8?B?MDZOcE1yZWhjQkdVaU5RMjBkN2E5NEw1bHRSRDZEMEZyd3E3NWJYTmw1RFNT?=
 =?utf-8?B?ZEVYS3ltYjIzVFhFTHVrZ254dFhHNHA5N1lJWlFySkFXWUhmU2gyYnh6M05N?=
 =?utf-8?B?TWJNcXJzZFJiL1JzM1BPTENOa1NWSUpKbktrcWlXbkxJeG1XSU9uVFU3dEZF?=
 =?utf-8?B?ZkI0TitUOWhNcmd4UUcvOTJsSE43MTBJdDZkNlJjNUpkb1Evb1hja1VHU1ph?=
 =?utf-8?B?K1IwQm1IMFJkcTVhcDQrZWhrejN1VzkzS3hrd05pOVhVci9PL1J6c1NmVFBv?=
 =?utf-8?B?MjlNdDFaeHNlZWhNUThZMUYrbW1mNmZTc3RXUWRxQXdnejRieDcwdmJlZ3RN?=
 =?utf-8?B?UCtuekltWUhoVjhFdXVMdXptMXFrUmViN2ZCaHhKRXpCaEl2OHhxb3dpcEp4?=
 =?utf-8?B?VWlmMmZ3SStJN3NIVmFEZnAxYk8vSGxiYUxyNDFTMHo5bkMyNHkxTVY3VEk3?=
 =?utf-8?B?a2FJUTZ6NDFjdzZianowUzB5RnZzUFN4SE9qZ2FXRnVPakt3VzNUOUhjYkZs?=
 =?utf-8?B?S21ma0FNMVR0N3ZJSHVTL0oyVDhNM2x5ZVNHdFZldVlBaUJ4aWo4bXlqOTQy?=
 =?utf-8?B?Z1JYUEgvdGVwai96ZUJhYTNMMitYNS8wNU5CSlVVVzVnR1V6VnZwa2FscHRG?=
 =?utf-8?B?SndNdVl1Y2xyOVp3Rnl1T3VhMjVqOHdIaWs1QW40R0M1c0wxd2NCU1I0SVZu?=
 =?utf-8?B?US9rN2tQckhIUHBvWi9nRU93MmRJVlliVXlyMVBDQ09kTW1sNlNQYWg2Unln?=
 =?utf-8?B?VHFtbnRTcFJycXpjM2dTYlMyNHdRMXlmcUpGWFBMUnFSc2dleUxJTGVGQm1m?=
 =?utf-8?B?cC84eWpmaFBvVTF6Wk1vNGFtalhHa0REM2JjNmtaWityT2VXSzFuWHptNmto?=
 =?utf-8?B?MGVHLzFxWXNXdlFVMUoyblpielNvSnI4aUE5SEZEelE1ZTc0eUZpTmJDSmtU?=
 =?utf-8?B?MUFMaERnYjdiSEY2eHVubkg0R21SZHdnc05MZG9qSU5McUtMcEs1MEFsMUtH?=
 =?utf-8?B?TVVETEZRV1d3NEh4YzNDTFNxVUhnV2FnbktVUXI1NnlBZEVjdllMMi9VNzZO?=
 =?utf-8?B?eCt1Q2dpMVp1akpSYVIwSW51Ui9MbkhYRnBzOTl4a0tCdjdGeTRmcVorVlpi?=
 =?utf-8?B?Vi8wOFV3cjlvUWZJamdoYzdBSGtXeHRNMEE2V0N2Mkd2NVRYMHRRV0gwNHA1?=
 =?utf-8?B?N3pMbjhQeW1yNC80U09lSEs2ZU4yaUZsbmxjQ01ubFNXOTQ2Z0ZFNzJwRFA5?=
 =?utf-8?B?YnpzVDdIeW9vQkQxVURMUWZDbjg4QjVPeGVLc0lqUjhPZEgvSWdoZG5MNXpS?=
 =?utf-8?B?SGxMSXNKYXR5TFB2MU9KSW45eFhFVWhpYnJiSEZaVTZGeG9aeXVKcjkzN2Fm?=
 =?utf-8?B?dnZKekhVbnNxY3dtVXhXQ0ZPaUxPMWF3VDA1azJSRlBJTmU3dk43dDhhakNG?=
 =?utf-8?B?UjlWWFkzRjZHTG5SQmFmaXlOaDFUcFVzNFJ1VlFoenZ0cGVSbUFuaFdNa3dG?=
 =?utf-8?B?Q2lVWm5EYkgvM2E4WHJyYlUzS3JVWXhpak5PRGNpaEpKWDZYTW5wSkdDNEV6?=
 =?utf-8?B?NW9JNnkxYlphMnBKbGUwakxwd0xyejV0SUNBTG4wU1dvaFBqV2xZdCtGSith?=
 =?utf-8?B?eVhKbjhrMGNrbnZIYlNYMmhpMUdub0x1anVKbnZkYTdwRlI3RkxBamVZajNK?=
 =?utf-8?B?ZDJTUVRyMHBYNEJYMkVHZ0J3dlJDNVYybVIxTGE5TTBnRUN6TW9QZnI5aXBG?=
 =?utf-8?B?SHJKMXJSN0wrOWY5RHYvRm1BSFprdmN4UkY3U3o2Z2ZlZnlxNjh1Y1REMkxS?=
 =?utf-8?B?TXAvZEFGYXBGUXhVbzdaa2I4K0ZwRXZYMHNUUVJGR0VHbkkzTG13K1dOU2R2?=
 =?utf-8?B?d0tjdDI1dXIyVmswK1V5MnI3ZHprbWhKL0doWGlLdWJLTGhLd1NuN005d2Ix?=
 =?utf-8?B?ODhjclNHZDhITEtzMTd0cmQrd1lSbFRjc0ZNVWpsT0dSZUkxKzh1M2x3Rm5p?=
 =?utf-8?B?VHoydWs3WlBmSkZRcnM5a2NRQTZ5bjlEUXo0bGpIelZBTHVGeEtXQnNoTEwz?=
 =?utf-8?Q?K+AjEYICQzMnTe0hR7o56UI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9554CF7DDBF7046B3B6D04D1DF1DB2C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 496d161c-6e9a-4dd5-004c-08da7452eab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 06:47:49.9813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +IqT1HMoaP1lH4r+My0OT0/s3HpeLW+HvczvLChHME2fEec8o+T70Dx7LLm1wvqNtShqUa57B78LYgUqj5jgU5xjwG5rUFCNNIsd22dHpr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2574
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
Cc: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzA3LzIwMjIgw6AgMTU6NDQsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBPbiBUdWUsIEp1bCAyNiwgMjAyMiBhdCAxMTowMjo1OUFNICswMjAwLCBBcm5kIEJlcmdt
YW5uIHdyb3RlOg0KPj4gT24gVHVlLCBKdWwgMjYsIDIwMjIgYXQgMTA6MzQgQU0gUGFsaSBSb2jD
oXIgPHBhbGlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gT24gTW9uZGF5IDI1IEp1bHkgMjAyMiAx
Njo1NDoxNiBTZWdoZXIgQm9lc3Nlbmtvb2wgd3JvdGU6DQo+Pj4+IFRoZSBFSCBmaWVsZCBpbiBs
YXJ4IGluc25zIGlzIG5ldyBzaW5jZSBJU0EgMi4wNSwgYW5kIHNvbWUgSVNBIDEueCBjcHUNCj4+
Pj4gaW1wbGVtZW50YXRpb25zIGFjdHVhbGx5IHJhaXNlIGFuIGlsbGVnYWwgaW5zbiBleGNlcHRp
b24gb24gRUg9MS4gIEl0DQo+Pj4+IGFwcGVhcnMgUDIwMjAgaXMgb25lIG9mIHRob3NlLg0KPj4+
DQo+Pj4gUDIwMjAgaGFzIGU1MDAgY29yZXMuIGU1MDAgY29yZXMgdXNlcyBJU0EgMi4wMy4gU28g
dGhpcyBtYXkgYmUgcmVhc29uLg0KPj4+IEJ1dCBpbiBvZmZpY2lhbCBGcmVlc2NhbGUvTlhQIGRv
Y3VtZW50YXRpb24gZm9yIGU1MDAgaXMgZG9jdW1lbnRlZCB0aGF0DQo+Pj4gbHdhcnggc3VwcG9y
dHMgYWxzbyBlaD0xLiBNYXliZSBpdCBpcyBub3QgcmVhbGx5IHN1cHBvcnRlZC4NCj4+PiBodHRw
czovL3d3dy5ueHAuY29tL2ZpbGVzLXN0YXRpYy8zMmJpdC9kb2MvcmVmX21hbnVhbC9FUkVGX1JN
LnBkZiAocGFnZSA1NjIpDQo+IA0KPiAocGFnZSA2LTE4NikNCj4gDQo+Pj4gQXQgbGVhc3QgdGhl
cmUgaXMgTk9URToNCj4+PiBTb21lIG9sZGVyIHByb2Nlc3NvcnMgbWF5IHRyZWF0IEVIPTEgYXMg
YW4gaWxsZWdhbCBpbnN0cnVjdGlvbi4NCj4gDQo+IEFuZCB0aGUgYXJjaGl0ZWN0dXJlIHNheXMN
Cj4gICAgUHJvZ3JhbW1pbmcgTm90ZQ0KPiAgICBXYXJuaW5nOiBPbiBzb21lIHByb2Nlc3NvcnMg
dGhhdCBjb21wbHkgd2l0aCB2ZXJzaW9ucyBvZiB0aGUNCj4gICAgYXJjaGl0ZWN0dXJlIHRoYXQg
cHJlY2VkZSBWZXJzaW9uIDIuMDAsIGV4ZWN1dGluZyBhIExvYWQgQW5kIFJlc2VydmUNCj4gICAg
aW5zdHJ1Y3Rpb24gaW4gd2hpY2ggRUggPSAxIHdpbGwgY2F1c2UgdGhlIGlsbGVnYWwgaW5zdHJ1
Y3Rpb24gZXJyb3INCj4gICAgaGFuZGxlciB0byBiZSBpbnZva2VkLg0KPiANCj4+IEluIGNvbW1p
dCBkNmNjYjFmNTVkZGYgKCJwb3dlcnBjLzg1eHg6IE1ha2Ugc3VyZSBsd2FyeCBoaW50IGlzbid0
IHNldCBvbiBwcGMzMiIpDQo+PiB0aGlzIHdhcyBjbGFyaWZpZWQgdG8gYWZmZWN0IChhbGw/KSBl
NTAwdjEvdjIsDQo+IA0KPiAgICBlNTAwdjEvdjIgYmFzZWQgY2hpcHMgd2lsbCB0cmVhdCBhbnkg
cmVzZXJ2ZWQgZmllbGQgYmVpbmcgc2V0IGluIGFuDQo+ICAgIG9wY29kZSBhcyBpbGxlZ2FsLg0K
PiANCj4gd2hpbGUgdGhlIGFyY2hpdGVjdHVyZSBzYXlzDQo+IA0KPiAgICBSZXNlcnZlZCBmaWVs
ZHMgaW4gaW5zdHJ1Y3Rpb25zIGFyZSBpZ25vcmVkIGJ5IHRoZSBwcm9jZXNzb3IuDQo+IA0KPiBX
aG9vcHMgOi0pICBXZSBuZWVkIGZpeGVzIGZvciBwcm9jZXNzb3IgaW1wbGVtZW50YXRpb24gYnVn
cyBhbGwgdGhlDQo+IHRpbWUgb2YgY291cnNlLCBidXQgdGhpcyBpcyBhIG1hc3NpdmUgKmRlc2ln
biogYnVnLiAgSSdtIHN1cnByaXNlZCB0aGlzDQo+IENQVSBzdGlsbCB3b3JrcyBhcyB3ZWxsIGFz
IGl0IGRvZXMhDQoNCiJQcm9ncmFtbWluZyBFbnZpcm9ubWVudHMgTWFudWFsIGZvciAzMi1CaXQg
SW1wbGVtZW50YXRpb25zIG9mIHRoZQ0KUG93ZXJQQ+KEoiBBcmNoaXRlY3R1cmUiIMKnNC4xLjIu
Mi4yIHNheXM6ICJJbnZhbGlkIGZvcm1zIHJlc3VsdCB3aGVuIGEgYml0IA0Kb3Igb3BlcmFuZCBp
cyBjb2RlZCBpbmNvcnJlY3RseSwgZm9yIGV4YW1wbGUsIG9yIHdoZW4gYSByZXNlcnZlZCBiaXQg
DQooc2hvd24gYXMg4oCYMOKAmSkgaXMgY29kZWQgYXMg4oCYMeKAmS4iDQoNCj4gDQo+IEV2ZW4g
dGhlIHZlbmVyYWJsZSBQRU0gKGxhc3QgdXBkYXRlZCBpbiAxOTk3KSBzaG93cyB0aGUgRUggZmll
bGQgYXMNCj4gcmVzZXJ2ZWQsIGFsd2F5cyB0cmVhdGVkIGFzIDAuDQo+IA0KPj4gdGhpcyBvbmUg
YXBwYXJlbnRseQ0KPj4gZml4ZWQgaXQgYmVmb3JlLA0KPj4gYnV0IENocmlzdG9waGUncyBjb21t
aXQgZWZmZWN0aXZlbHkgcmV2ZXJ0ZWQgdGhhdCBjaGFuZ2UuDQo+Pg0KPj4gSSB0aGluayBvbmx5
IHRoZSBzaW1wbGVfc3BpbmxvY2suaCBmaWxlIGFjdHVhbGx5IHVzZXMgRUg9MQ0KPiANCj4gVGhh
dCdzIHJpZ2h0IGFmYWljcy4NCj4gDQo+PiBhbmQgdGhpcyBpcyBub3QNCj4+IGluY2x1ZGVkIGlu
IG5vbi1TTVAga2VybmVscywgc28gcHJlc3VtYWJseSB0aGUgb25seSBhZmZlY3RlZCBtYWNoaW5l
cyB3ZXJlDQo+PiB0aGUgcmFyZSBkdWFsLWNvcmUgZTUwMHYyIG9uZXMgKHAyMDIwLCBNUEM4NTcy
LCBic2M5MTMyKSwgd2hpY2ggd291bGQNCj4+IGV4cGxhaW4gd2h5IG5vYm9keSBub3RpY2VkIGZv
ciB0aGUgcGFzdCA5IG1vbnRocy4NCj4gDQo+IEFsc28gcGVvcGxlIHVzaW5nIGFuIFNNUCBrZXJu
ZWwgb24gb2xkZXIgY29yZXMgc2hvdWxkIHNlZSB0aGUgcHJvYmxlbSwNCj4gbm8/ICBPciBpcyB0
aGF0IHBhdGNoZWQgb3V0PyAgT3IgZG9lcyB0aGlzIHVzZSBjYXNlIG5ldmVyIGhhcHBlbiA6LSkN
Cg0KTWF5YmUgdW5saWtlIGU1MDAsIG9sZGVyIGNvcmVzIGlnbm9yZSB0aGUgRUggYml0IGFuZCBk
b24ndCBtaW5kIHdoZW4gDQppdCdzIHNldCB0byAxID8NCg0KQ2hyaXRvcGhl
