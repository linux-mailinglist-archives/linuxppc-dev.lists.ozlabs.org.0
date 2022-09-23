Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763A5E74ED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:36:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYkVW1FG1z3c7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:36:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Qolh+cYv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.85; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Qolh+cYv;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120085.outbound.protection.outlook.com [40.107.12.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYkTh5Flxz30Ly
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:35:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIg4z4QWxZkzjb8zd7w4RNZtdtXYIHGqo65JVkMfBjI/I1jPww0YJxEfBWu9qfnr9cpzDpayK3gO3UzgvCFQ8xyZvs4cG7POZyUPRH5+vkr++YY510BTXa9sxfyg3s5sFTshGJJuwfF45hFp51ulLN4mCgPN0q5v0FhYSCPerAbB//k5ItPTi5LaDOhCeOwKoPBfD57nKIot62Swe1d2+VOXjQhBs/u1jlkpspLldUT072UgwBemOD2CCokJ/TiqPo1kWpHMQhrnvNk0W8AIilrqSBPOBsweW+14xno/Nr8GS6CRGOMsfmT8UpZ2grf/jLJJWtAEp7pywmVEtJ3fBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HvDQrkynP2Nyl/v6LN+vve4mVH6ba/sYrQIqn9wKfw=;
 b=Egk1gLNbGrAMdJ+WTuiTGN38OsG0bVWUIioLTfCOi1+shsiEBq0LT2vBmJqfK4gTWXnSB2UvcGJJNgsGoC5kiivHNN+avqEB4ptl84QRvAPeV20IxJSjgURN0RT2Co2MICosDL7+kBiibOymDPJOZgiminrlmwJ8PPEs3M+JKfglYHgupN1TVo6u18uGFXUyKM9lHrfu+B+9ZQ5zXu2+Eg6oc+8tGrAkc5TnYtMdWfyHvWQO34O47wNzSHDL6dTjxuR/227BIQmt0yamrmnVgKuOrnfb99cC9+51DIMsQI8ebxYyzVt5gwd9IhtSjnMyQRuAtQy+Wd5IjbQIl5466g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HvDQrkynP2Nyl/v6LN+vve4mVH6ba/sYrQIqn9wKfw=;
 b=Qolh+cYvGBBvO/azG3IvMc7iSNAjIMLlwTdxTB7crtLKoNOxM+wAupF66TCVN4ZNliGv/DY2v6Wgq7avPXCCxiMaie9BedB5Xeo2VUA2t5vNQrgv1Pz+L/u63Owxj1rEJb+dzAUg/NPhsk+jpUVZ8xVaWmhBclieOpIyuPTIWpB+1z3pLJvrngPpwxKXHHs+Q769/fSbH5ICj7ZIl5qHMLXxbv+wKAGP4gfICleC2VD9epIGZ898FOM3O4ta84gqj4BUtbDhNyniiNkZrmVpUAJmIaUAX4fYteF1yRTw8uGGwNwPZ8ObJb+LoOxrUJCb9BB3UAR5uaO+Xe00pgKubw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2978.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Fri, 23 Sep
 2022 07:35:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 07:35:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 1/7] powerpc: use 16-bit immediate for
 STACK_FRAME_REGS_MARKER
Thread-Topic: [RFC PATCH 1/7] powerpc: use 16-bit immediate for
 STACK_FRAME_REGS_MARKER
Thread-Index: AQHYzDCLjj1yY+/blEqWEWqIHuNzDK3qG/uAgAKI8QCAAADSAA==
Date: Fri, 23 Sep 2022 07:35:32 +0000
Message-ID: <16885a1f-d017-544f-326d-3ff8d39d66b4@csgroup.eu>
References: <20220919140149.4018927-1-npiggin@gmail.com>
 <20220919140149.4018927-2-npiggin@gmail.com>
 <59dafd7a-c281-c1a3-668c-079e919a6605@csgroup.eu>
 <87tu4yzgtn.fsf@mpe.ellerman.id.au>
In-Reply-To: <87tu4yzgtn.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2978:EE_
x-ms-office365-filtering-correlation-id: 80df17ac-7fef-4f7c-13ff-08da9d363289
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ltWGZh0yK43Kl4VUN7uZviDMEpmcrpvhrlK+onnq4931BiVOSRNpwVGEvjNYAD3zbYC5dEOb/VvqFGcjvQp698wHZjC/Uj7vpAsNqW94rtN82v5EkRC6P5XWfd1jYKci/PnI3oOrB5lKVvKQtZcOL1/ZSX1tOQGd37NjJuKPwfz50/ZY+Hom9jBxOstpcHo3FdEjl1yrMllmLIW3fSq5RCswPXWAujPQhvlHKawTbGp91iUr7u19Zqsp7/dvqKDUudY0CIWz1XrI/si561K+1rKq/6TFQZIVdBzWeytDjDoSUw9smBBdnbeZ4KzmRLW/CB8pvUZRDabgG4FaA/mTKtaDlAc7oaZAm+h5U/IZHuZLz9QWceeA0Wx8QRZtxlhAYgY3ulkP2kwoPLIMiM7SDV9hSyuMurhLPgIdgNRxx0NzJ507uXKxxj2niHvKzquZctVAGezdJGR1gDwkJifsUcmT2kpDfSXk2qjoCTTH3RqTaIE91EPiM3+CL89uAXyrGAbkvyh/klGXyfVTVZRumixs93KAl/GsDHo5lEwT1biCW5fVs/VeCHNO/hhi0NCgDKsaDGxs2hOYZOUEIu5MvTfjxVOavmYMfg8WtQTtVSxqhW3ix3joX3gZdJx4zOae1tpbwTVM+Uv0xaedRvNwiY0gpCzM1GhvsF8FQ/5/mpOGlbH9+ZqATtdaFK7YmPobqI3YiOxDOKHrGSBDPrsVT3nzlIA1diEm2Pk4IJKRLIuzRXyhU5N8FbNW4Um+wtM/gxyNgJqUou4cbMawICDAt5KC30OFU23FO2Y0c+H9Z5NTA7DjnsmDiZo7FY85e1sSRHrfxWV4dWs71sKXtxihLtQszf7WKCKklx448WnAV/2YHaq4CUIBNXff0rl5ODnc
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(346002)(366004)(376002)(136003)(451199015)(41300700001)(38100700002)(122000001)(26005)(6512007)(44832011)(8936002)(86362001)(31696002)(5660300002)(76116006)(6506007)(91956017)(4326008)(8676002)(64756008)(4744005)(66446008)(66476007)(66556008)(66946007)(316002)(186003)(110136005)(478600001)(36756003)(2906002)(38070700005)(2616005)(6486002)(31686004)(71200400001)(83380400001)(14773001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M1VIQ254US91L0JKSzBxNE5yVUdqMWVuRUxJYkdxYjZQM3VsTWlRT3VKNjIv?=
 =?utf-8?B?NE45eGQvT2VEK1pBUmIwNEdpaHdmeTBrazgxa3hVYTNIWGRwLzYvTkM4ZGRa?=
 =?utf-8?B?RXBCQ0ovTm0rdHRpQm5MRmxPajdSSVFIWTNrLzRmYXRldjFMNGdMZ1V6NWFN?=
 =?utf-8?B?MWUxNEl6UjR0Zkx3UHlRUlg0V01YQWdUclZ5ek04dDJqcDdsT0tGYStCMGJR?=
 =?utf-8?B?R1VKUzl2NkNlOTA0aGo4bkhiQlZ5eWNKbDRTTmtwc2xFK3l3VksvaW5GcnVH?=
 =?utf-8?B?UTVrWUZpUWNFcjV2YWNqWUZkOEFsaFMzOGdhRGhIaCtQNEFyS3FDUWdUcmxO?=
 =?utf-8?B?dThETDR5T0FIMm1ITzBQR1ZQM25aQTQvakEvRGthQXk3Wm5uWXhNaVZ2L2FQ?=
 =?utf-8?B?L3FpZ3IvY3Y1Y0xYZHFzbUVLMlJwOEptbzg3bE9YeG1QR0dFaTdlc3NGYzkv?=
 =?utf-8?B?T2xZZGZ5aHRLNGJKdnFOS3grZVBUVW9rTmZYV3RrZGFCT25TZVJjeWk1eTYr?=
 =?utf-8?B?eTliMGN2clJZMmlvellwTjJLNDdleW9NbURHUUtLRytLT1FjcHA4dnZkbWRm?=
 =?utf-8?B?bzBsUTBoZEtyTXJmSE1la1dZZElmRjdUQjVLbnVjdEk5RWNPQ1hLVXdNNnc5?=
 =?utf-8?B?Q1llWXZsNlc4ekRHY2cxcXQrU2tNYW01dlBhOG5aSmVneHBKK1hlWVRrd1Qv?=
 =?utf-8?B?emFUcGV3bEMvd01pbFBFWE5ad0ZVQWxlaDBoZEh0YTFPbkxlS2ZwSDY5QXc3?=
 =?utf-8?B?anJ0eWlQWHp1dk9FSm9BQUlvL1BJc25VOGhRNURJWmN5aXRaVzF4dXVOSE1U?=
 =?utf-8?B?Q0orVDFnRDhYMUQwWUg4TTB0MlJyTWkzeVJmRFFsOXR1cjVhQ2tKbDlkSy9K?=
 =?utf-8?B?bUFnZEJTUS9RVy9weFVIYkdoS2lQTmlSUE1NSVhVRTV2WGtGRjE4Sy8rNEVt?=
 =?utf-8?B?RC9aWjR3ajZESW9NT1RpdTFDUFVQalBUb0pKL2VOaENYZlU5VWNTa0ErY1R1?=
 =?utf-8?B?bzQwY0VneXNtaGg1ZU02cW1lYUpCaVRlWTRnQ0VrRWU4aUNkK2lpLzMrNFp2?=
 =?utf-8?B?ZFkzR0MyS0ZXK2EwNC8xNnNTclQvNnY1RTJNd0VRN3pLdm5LNE5EcGFUdHZa?=
 =?utf-8?B?eUQyKzQwSHQyZCtDZUlXQVNNS040VEkrREVyNHNNTWRrZEZINVRoMSs3TEpV?=
 =?utf-8?B?RGFwU2RQNlJpVU9zZm1kZVEwZXpzOXN4clZKV3hkeERHMEo1ZVlXcVUvK3Fw?=
 =?utf-8?B?ZFZPUDlhS0M0azJkb0tQaVUycEFsU2Q5WEFVSGlHWm1MSU15V04rRnFKL1Vv?=
 =?utf-8?B?N29VMXZSNWxkc2xqRElraVcxRFl0OWVTK3lqZGVtZjM2cGJLakpUMTBKWVpp?=
 =?utf-8?B?aHBuMzErY29xSGhCdVF2cHh1SUovc1NQbm9vYUovK1dvMzB2R3kwY245N2cw?=
 =?utf-8?B?R2VxSTZPWm5sZFJrVGNBYTZKSWZaekZzVmVFZ1crb0M2Q3NFNEdUbEZFWVNq?=
 =?utf-8?B?amc5Qk5ma1lONHNxdmJkTGhWMStGM09YUndjazJ3NXdJTEt0RFZ4dnkrRmZK?=
 =?utf-8?B?NXZTdm1rUHowUWxOWE4rWlF2Q0dSL1kxc2l1QVVmK0tFWU5oU2FZemxDT2Vl?=
 =?utf-8?B?Ymw3V01ZRDl4MDZBaWhmZTJ4dWpmZEhHek1oUmNWVGpKQ2N1aGx6bmZnOTd5?=
 =?utf-8?B?dUd3MmNIN0UzOXQwU29wU2RjN2o4eWU2ditDa3ZiT0FDSEJlL0hRU0FldmZJ?=
 =?utf-8?B?dWd5c1dOMys4YWdrWElQcGtMYXBpZWdxZ0tkMjUrampqZU95YlFHWisxalFp?=
 =?utf-8?B?RGVQelk1cFVuaEV5b1ZuTmpQMlBVTmhDWmNaWmh5Tjl6UmpZOWxwOTZCWlha?=
 =?utf-8?B?bEhLV0t0ZjZacjR1T2lNR2tOblZBWGF6R24raHRXeSttY1dzVE5oTmFGNXZx?=
 =?utf-8?B?QS9vUmdsaVhubTRDV28zcmI4QlZ3VnBtSGRuR0luRVdpT1g5Q01qa2VjU1Ro?=
 =?utf-8?B?UlBpb0RRT3NaV3VaT0JzckJtd3FEVjNlVlBHT3RzeVQ2dVU2M0YwbkZTWkw1?=
 =?utf-8?B?Wm9aOTBYOVVxbDBFR1FrbmNLZjBOd09OUU1TS2dOTjRtUFhRaUl0YTJ2QzRa?=
 =?utf-8?B?bWFFMURyUjR6d3pUbEx4bS81c0VKV2ljY0ZZVmliTlMzN1lJSXdWQTRNa3gw?=
 =?utf-8?Q?Jy80fZQ1s9tvBvGu44F+6WY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A06A1CBFA81564D910D42F3C3327802@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 80df17ac-7fef-4f7c-13ff-08da9d363289
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 07:35:32.7673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1WnL7Uv89fOld7eItpYUCh0AtiNG0ycNQr9I83x0kQPiIM9mD41qWMlOsDorWWehVJczTuoMBAwnzey0QnDtNAYZasbB1MGOSKZpkBT134=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2978
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
Cc: Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzA5LzIwMjIgw6AgMDk6MzIsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAxOS8wOS8yMDIyIMOgIDE2OjAxLCBOaWNob2xhcyBQaWdnaW4gYSDDqWNyaXTCoDoN
Cj4+PiBVc2luZyBhIDE2LWJpdCBjb25zdGFudCBmb3IgdGhpcyBtYXJrZXIgYWxsb3dzIGl0IHRv
IGJlIGxvYWRlZCB3aXRoDQo+Pj4gYSBzaW5nbGUgJ2xpJyBpbnN0cnVjdGlvbi4gT24gNjQtYml0
IHRoaXMgYXZvaWRzIGEgVE9DIGVudHJ5IGFuZCBhDQo+Pj4gVE9DIGxvYWQgdGhhdCBkZXBlbmRz
IG9uIHRoZSByMiB2YWx1ZSB0aGF0IGhhcyBqdXN0IGJlZW4gbG9hZGVkIGZyb20NCj4+PiB0aGUg
UEFDQS4NCj4+Pg0KPj4+IFhYWDogdGhpcyBwcm9iYWJseSBzaG91bGQgYmUgNjQtYml0IGNoYW5n
ZSBhbmQgdXNlIDIgaW5zdHJ1Y3Rpb24NCj4+PiBzZXF1ZW5jZSB0aGF0IDMyLWJpdCB1c2VzLCB0
byBhdm9pZCBmYWxzZSBwb3NpdGl2ZXMuDQo+Pg0KPj4gWWVzIHdvdWxkIHByb2JhYmx5IGJlIHNh
ZmVyID8gSXQgaXMgb25seSBvbmUgaW5zdHJ1Y3Rpb24gbW9yZSwgd291bGQNCj4+IGxpa2VseSBi
ZSB1bm5vdGljZWFibGUuDQo+IA0KPiBZZWFoICJyZWdzaGVyZSIgaGFzIGRlZmluaXRlbHkgc2F2
ZWQgbWUgc29tZSB0aW1lIG92ZXIgdGhlIHllYXJzDQo+IHN0YXJ0aW5nIGF0IG1lbW9yeSBkdW1w
cy4NCj4gDQo+IEknZCBzZXR0bGUgZm9yIDB4ZmZmZmZmZmYgKyAicmVncyIuDQoNClRoYXQncyBu
b3QgYSBzaWduLWV4dGVuZGVkIDMyIGJpdHMgdmFsdWUgLi4uLg==
