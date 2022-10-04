Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B01F45F428F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 13:59:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhbq23sc7z305p
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 22:59:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CeBfYwui;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.77; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CeBfYwui;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120077.outbound.protection.outlook.com [40.107.12.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhbp359knz2xYy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 22:58:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klqgaw0WPoDi2ZyvZwRgu3tz7zYMl8XuCsZm4UB1QE3Z2wSRPFRJNvok6gRbElcb3Yb6LdIiYTwYJ27DGj6+w8rLYPRB6xh5iAwPA2WgBrZ2pMWUJCdUkzny1xGiKKeNMBJF/dG7of4hYvLIABw3oyg0kt9qxvowphC5G2hUGSSfzSmlNunyoiXC/XrTRukpwirb1lJmGr4Ps3VpGti5ccwpBS5bqnmn/9N51YV3hxUbvEPZgsndati7hEAQSRWPZ+jSv9TN7XSIDShTVWFxl8eUFQ74CIX6L8PK+Bly5woJ2VJ+3uUc9Une4+vftFcH9epsmO/FtY2RQA7koSl2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFmylmg9ma17m08RWLR9Cn/hIULbHayGrfqssGbLI3s=;
 b=n2/DuWecIRDRsy3m+BAY3qbJBxl5WQiRyKaaPYlJHmJzNCYRE4bs7cjk4h5w/6VQ39pGiSToDViwIcK7dmPl2MpMc7Io+SMx6r3U6hcJ3o8m9LDaODdY2FvrAbn7ivyiywJ0gAM8uX+CpHyBj7cV9N/XXksH8YG1kcDFD509TTdsuRYRgo2duboPVREPvbR32DdZHU8AHY3DCzarTzHY2kqKdpLbkYxGLXutEj+HfOcfx2IRPZT2MQ4WiMiAM7ivgtSXv6Mf/UYE598ilHsULkkhz6ojWfnkpXNQb/HCPUqhD9su4gEKX6hyJk4rOfJSnyTreVf4DOqfjFxXNJRKyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFmylmg9ma17m08RWLR9Cn/hIULbHayGrfqssGbLI3s=;
 b=CeBfYwuitC9OjVDuMZwyR4AljMadgzYosdQS+7XnLHVRYc9qd7dRLIjEm649wu915lwSXtS9zMTxuB14w29LNJd2O/E8LcFYQhCpqHOzyUd0HuU6uUvXWOFwlUKCU5KDFN6iziq7YsRAPxFPhq+M/sAH7zxVdJX/a2ppfUYkgKnBYpLN/F0a8DC/2wE6Zo98IH/xnhqFBUPX3pO/3BXxAbw5r1hpMOqNudnPD6k3vIlZrksOD5rb6S5ZHt2Hh/JEjwA/bIggr4rzOzBwsNoey6TMNykxhoD9+oX8/bfiCbx7sWqZeOdYgP+PsqdgVlBl8WxBFHwcWyinzVftsI4C9A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1843.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 11:58:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.028; Tue, 4 Oct 2022
 11:58:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 0/3] powerpc/32: nohz full support
Thread-Topic: [RFC PATCH 0/3] powerpc/32: nohz full support
Thread-Index: AQHY17sywmNzCYbA4E+ljYW63yfngq3+IcWA
Date: Tue, 4 Oct 2022 11:58:30 +0000
Message-ID: <f728293c-7176-e564-7db9-4c8d30edfcfd@csgroup.eu>
References: <20221004063306.511154-1-npiggin@gmail.com>
In-Reply-To: <20221004063306.511154-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1843:EE_
x-ms-office365-filtering-correlation-id: ff0a1661-4d4a-4830-d076-08daa5ffc156
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JakmHUg2xxllKMj8gLz8BP4L1NpuEPAC6owaVfmypk7zXIPdAjFe683+jwjblLSISC5yv8aXGLWZxLEGQ3zqfqv3zwMSlNkAWm3o2z8SQmVigD2oiuSAP5+DLGanze4ahU6c/PgqZrMjxFxDy5Vh+O3oIjYNMrbVWOsYrgGDnTJGNSZiPERyXHBjJbzZ9g8Befslq3o0IjNXTkGp9LOYst9ExnP48mJ8szplCHpqbr5Df+NTgprKOEjTuzDLVDSx4HeviQCBlYBufvu9BbOaFX/aSi7m1Si5Gg9AJdsSVkh5GNd5Ea53257WlwvkYoSqrG5grm4F5XECCNcTJe8DrjEaLPdW30WdHs/MdKDTUULZKi783AP4yzNy+sW5Z4FV6Ey2lpulc8cHIpXUXdEOXN9wj3CHzI8GQKrTwF2GlDONE1Nwlu1SSy35BCNsJPsOGbiG8F6phr8QtWZjHhRb3F+0u43gI5hXFeqiLotpVjk4qy9rkQXlaXr/Wmt0kChTWr2Jk8pMy3BYUMOu1bfSizlnnjEXi1gcKqvTUlBum1hLnqEZM7G+/EPL5BPfuVh2kUFWXJ+uArQ6q/Ro9++2STWQTWTvbjNLEGcUwIUiVaZ+YlmPm4bDQ2U0zIPCOk7r8slpm8zmEI1J55KG1tO+SiPrrNVXpc4boSnNby+125hC3FiDz3h4aVnXBAXn7GMi/RQ8jVNTpeZC9hIkVPdwEpmiy0mUDQ1Vv3Cv+WaaLxVSyQyi5PB2eMhnj0mwdfK7b3UTufd/9oOY7CuiIxAzDRh6bGwmUrIYcQ266KAe1C9nI8bHB55vvOTS9D9H2jJTg5ak/5WJHy90Ppss3yaoHw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(39850400004)(396003)(346002)(451199015)(31686004)(38070700005)(2906002)(122000001)(38100700002)(71200400001)(44832011)(478600001)(31696002)(36756003)(86362001)(66556008)(83380400001)(6506007)(2616005)(6486002)(26005)(6512007)(186003)(76116006)(110136005)(8676002)(64756008)(66446008)(5660300002)(41300700001)(91956017)(66476007)(8936002)(66946007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QzFYNC9TaFk4R25vdzhpUUlBaVlUMWVzL2NGMmVXQlN0ZVd6T0ZQcC91UUhM?=
 =?utf-8?B?M2dWdU43ci83MzhJbWptSWM0N0h2dFdMZ1kwVnV6R1NCbmVSRmRiL1FrMmZS?=
 =?utf-8?B?WGs5UStzYUsyYzlwK3Z5c3FZSTNKNnA3S1YxeUdpNXhwKzAyVHliSHZXR1RR?=
 =?utf-8?B?Yk81cXhDVmsyam5WVjJ0SDB3N24yZXo3Nk81aEZvZ2ZwTFRaS2dHMjJFWlN0?=
 =?utf-8?B?SjcrbTVUb3lUOFF4bFBIdG9KLzFlTG9FUmdSMDk4YUxPRUxhWWRiUHNQNDNW?=
 =?utf-8?B?LzJtK3JmMjNOUGFTelRWc255MmxPWkNaeDBlSXI3Y2tyTHh6MlFVOEtKSmsw?=
 =?utf-8?B?TnZPSG84Z0toYUttNno3VGF5UDduMXZabElpMDBQT2d0dG56UmxWWEtIdkp1?=
 =?utf-8?B?UHpsUTVIMW1pMnNMYTJjbVVndDVib2M5U0dVazlhKzNYa0dvRGU5YUZ4RDgx?=
 =?utf-8?B?c3U3Nkozd2YrV2g1dXYyL2pjcHBkdDZoSEw3dU5mRENncDRpZi9jNy9XcVox?=
 =?utf-8?B?M3F2VmRoQzRGanFJN25nbmFHbzRPaTNldEpGVkdBaC90aTJmbHhsN2NweEtw?=
 =?utf-8?B?MXdHSzZnUFJ0dlNwRW5DdXFmd2dhVW9NWUE3MVBhRWpQdTU4azV4RmM5aVpK?=
 =?utf-8?B?QWRCeXRTMk9kUmYrOWxWSzZrb0twNjRTNFU4WXl1R2xkcmFudWc4Ym1uSDRD?=
 =?utf-8?B?MDllcFMza3dYUmpiUjhtRG14VHRwNWhoV2Y1aS9KUDNZR3l0K0ZXc0E5NjRS?=
 =?utf-8?B?RzdScDE5QzMrWHphcmE2L1MwUTRndUNUS0x6OEZVTzl2MFJOTHZoY2hxclMy?=
 =?utf-8?B?bUNJejU4dWk1d1JJRDJXMDlGRW9Ya0RuTFpYR1FhUTFLWFBMVEpTVlFUVkpa?=
 =?utf-8?B?UWVPYWxzYlZnTWN0b05IRlNVZTFPTURzTFNHV0ZmeEdzQjYvUStlQ1Q3Z2lG?=
 =?utf-8?B?VS9SQnQ0dFNRTk83R2hOMU5oRWVvQlZGWTdUUFNRM3VabUlPdTJFdzdITXB5?=
 =?utf-8?B?UHBEcmtOaU9USmhxQjJFMzN3bFBubzdnRVh1VThIMGpQQ0JySGljNEE5UnVP?=
 =?utf-8?B?NzVDZkoxVVZSL2ZhMUlzVFBqdlJVdnBvdkowNjhId0dmaFRSak03ZXgvQUFr?=
 =?utf-8?B?SFZKUk9ZZnJmbm83c2d5MmVlVGY0N3N6WksrVnMzNDJONit0K2d5RjZlTTNF?=
 =?utf-8?B?UTkxYTdLM2Vla0kwajM3UGlNTDhIblZNTUVvVEtOWHZzbTlXK2R6NjNrRFZ3?=
 =?utf-8?B?RlBhbmNkRGRmN0RIOTBxTXZsUXRrOWNya3ZSODJySWdNR0FwOW01cHptbVA4?=
 =?utf-8?B?UDc0RG5VeUdnQkMzOThZVTc0dmxlWEVTK1dkY056SEFQWXJCbE1FdkpSNGdw?=
 =?utf-8?B?eGV6cVhhODNTdGJiZ1hhQk5PUU1HWHY4Q3JsZ0JSUlFNV0E3L0xkWmpwL1kx?=
 =?utf-8?B?cnZBKy8rOVZuMDVyKzUrSGxaQ2FmY2kycnFpUVdkNm5YanAvc1JpNUxHWDRk?=
 =?utf-8?B?QmczYnVuVWZMV3FJUGIvaWZUR2NTakhqMDErVUxQL2I4NlF5V2NhR2lCZ25M?=
 =?utf-8?B?TUpNSXlSaFQ0RW9lWXpFN2g0L0VqZ0lMZTNFbHRXeitxOHRyV2hhM3hFN0Z3?=
 =?utf-8?B?U1RSaWFqcUNXRVFRamlQbFVLRGtwOE5EOGlFRjVsZzBCWFowdTNrN2F4R0Jn?=
 =?utf-8?B?THJWaGs1RUJ2c2ZPSzZ1akdQaW16cFB0dGdGZUJtMHhIelZNYTBqNGVBWmpY?=
 =?utf-8?B?YStYR0p3WC9pTFpKYVVpNDZ4ZzhSWG53N2NaWmVUVnA2N0hIOVYxc24vS2pQ?=
 =?utf-8?B?cFR0ZitzMVlZZDBIcS9QZ0RWUThWM3RkdktDVlpZcFk1dStjc3NVL0V6bisy?=
 =?utf-8?B?SnRramxobSttSFRCaGJpSUtSMm1yM1k0c0FYamlVWnhWOWlnbngrSHZDMjNY?=
 =?utf-8?B?SDFaN0JvblNxbXZ1eDZnUFNqYm8vRFFLWktQN21oVElkUFgwVE80ZUE0cis5?=
 =?utf-8?B?RFVOZEprOWV5K2FyaEJtNWxtZzk2SmJjeU1wWkliZGQ0dlJuVno0dkFCQ3Mr?=
 =?utf-8?B?Z0VrTmFrUDYzakFXS2c2WU9jSlpNN3BHSis3cFkzc1pLaTJTWnk4NUJSNmFY?=
 =?utf-8?B?dUVNVk93Vy9yMklBOERVZmxoSnFkbDF2d3dKSTRoM1dqREZxenJuaWFSZis1?=
 =?utf-8?Q?XHeGPXZa1J+BY8fzTF0OI9E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71BAD95D8E4D4840913D43A0127141CB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0a1661-4d4a-4830-d076-08daa5ffc156
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 11:58:30.4969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VieH5qmkjNK35QjUC1M3vvrB6kpiZeScgOTl/zxvVHRbCIJ4DPMlRr/AAIzowad+ya8imPtsVZGusPduVATA9ho+cPQ67ojU+vegdSdT6j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1843
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

DQoNCkxlIDA0LzEwLzIwMjIgw6AgMDg6MzMsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBEb2Vzbid0IHNlZW0gdG8gYmUgbXVjaCBtb3JlIGludm9sdmVkIGluIGFkZGluZyBjb250ZXh0
IHRyYWNraW5nIGFuZA0KPiBnZW5lcmljIHZpcnQgY3B1IGFjY291bnRpbmcgc3VwcG9ydCBmb3Ig
MzItYml0LCB3aGljaCBpcyBhbGwgdGhhdCdzDQo+IGxlZnQgdG8gc3VwcG9ydCBOT19IWl9GVUxM
Lg0KPiANCj4gSSB0ZXN0ZWQgdGhpcyB3aXRoIGU1NTAwIFNNUCBrZXJuZWwgd2l0aCBpc29sYXRl
ZCBhbmQgbm9oeiBDUFUsIGFuZA0KPiBpdCBzZWVtcyB0byBiZSBkb2luZyB0aGUgcmlnaHQgdGhp
bmcgLS0gcGVyaW9kaWMgdGljayBpcyBzdG9wcGVkIG9uDQo+IHRoZSBub2h6IENQVXMgd2hlbiB0
aGV5IGFyZSBydW5uaW5nIGluIHVzZXJzcGFjZS4NCj4gDQo+IENvbnRleHQgdHJhY2tpbmcgd2Fy
bmluZ3Mgc2hvdWxkIGNhdGNoIHF1aXRlIHF1aWNrbHkgaWYgd2UgZ290DQo+IHNvbWV0aGluZyB3
cm9uZyB0aGVyZSAod2l0aCB0aGUgZm9yY2UgY29udGV4dCB0cmFja2luZyBvcHRpb24pLiBJDQo+
IGRvbid0IGhhdmUgYSAzMi1iaXQgS1ZNIGVudmlyb25tZW50IHRvIHRlc3Qgc28gdGhhdCBtaWdo
dCBoYXZlIHNvbWUNCj4gaXNzdWVzIGJ1dCBpdCBzaG91bGQgYmUgcXVpdGUgZWFzeSB0byBmaXgg
aWYgaXQgY2FuIGJlIHRlc3RlZC4NCj4gDQo+IEkgYXNzdW1lIHRoZSB2aXJ0IGNwdSBhY2NvdW50
aW5nIGdlbiBvcHRpb24gcmVtb3ZhbCBpcyBva2F5LCBidXQgbm90DQo+IGV4YWN0bHkgc3VyZSB3
aGF0IHRvIGxvb2sgZm9yIGluIHRlcm1zIG9mIHBvc3NpYmxlIHByb2JsZW1zLCBzbyB3ZSdsbA0K
PiBzZWUgd2hhdCBjb21tZW50cyB0aGF0IGdldHMgYmFjay4NCg0KSSdtIGhhdmluZyBoYXJkIHRp
bWUgZmluZGluZyB0aGUgbGluayBiZXR3ZWVuIHBhdGNoIDEgYW5kIHBhdGNoIDIvMy4NCg0KQ2hy
aXN0b3BoZQ0KDQo+IA0KPiBUaGFua3MsDQo+IE5pY2sNCj4gDQo+IE5pY2hvbGFzIFBpZ2dpbiAo
Myk6DQo+ICAgIHBvd2VycGMvMzI6IEltcGxlbWVudCBIQVZFX0NPTlRFWFRfVFJBQ0tJTkdfVVNF
UiBzdXBwb3J0DQo+ICAgIHBvd2VycGM6IHJlbW92ZSB0aGUgbGFzdCByZW1uYW50cyBvZiBjcHV0
aW1lX3QNCj4gICAgUmVtb3ZlIEhBVkVfVklSVF9DUFVfQUNDT1VOVElOR19HRU4gb3B0aW9uDQo+
IA0KPiAgIGFyY2gvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8IDExIC0tLS0tLS0t
LS0tDQo+ICAgYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAg
IGFyY2gvY3NreS9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAxIC0NCj4gICBhcmNoL2xv
b25nYXJjaC9LY29uZmlnICAgICAgICAgICAgICAgfCAgMSAtDQo+ICAgYXJjaC9taXBzL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnICAg
ICAgICAgICAgICAgICB8ICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NwdXRp
bWUuaCAgIHwgMTcgKy0tLS0tLS0tLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vaW50ZXJydXB0LmggfCAyMSArKysrKystLS0tLS0tLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2Vy
cGMva2VybmVsL3RpbWUuYyAgICAgICAgICAgfCAyMyArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiAgIGFyY2gveHRlbnNhL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAxIC0NCj4gICBpbml0
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtDQo+ICAga2VybmVsL3RpbWUv
S2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgIDIgLS0NCj4gICAxMiBmaWxlcyBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCA3MiBkZWxldGlvbnMoLSkNCj4g
