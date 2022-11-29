Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C988863B9D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 07:34:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLsxk2zzbz3cMt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 17:34:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ok3SRZ0u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::611; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ok3SRZ0u;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLswm4CLsz2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 17:33:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/5YsvtWjv1McMtA97oU55VQLdM1biF7gPktYfkvr7PRPM8ICzQvIs7pSR2s7R0iAYyZsQhOzYWMApjbPHFo132sDppAwXu9jF+0KMB4BjX2BMtgikJtdN7KU6QPQk1W2pvycA8a3HNSQ9ALc2cMsHrgmRum4m76jkTT+cBMeaJLIvmVyErY+PlnY/L75DGix/cBEIW8TM6JWfTuHTEbzc1AJ5JJJ81/LnAKhbslFaCW9LsGpQYp85/5FYYmpSLx/oDpVbI5n8tlySL3ecVOecyk7FjC6pwTjsLFvVpmMSKYRXnaETFmuRJSjoEp8q40QjrCWniCdMwXYH3GGVgKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7wbjeyfoeuLWq4tdYjyQbFK2lqqeA4egMb3r9R0ScE=;
 b=mL443OCQfhBRwux9YEn4WjYSfKr6SNAiy5vefyT4M4SfX1GBaHhAP2I+Cs1Xc2wdJqWeRuif4cSrF6UukjW94y+xgtt59CclQ4aD24cmP0J/bSzmq59N8vcA1Q98K59Dc/U2XShAbwNbKgCp8Upn+hWAShwhSNMfyM3EaCJqKy+bEIl3gGP4iSk2eiCy5O56aYhQ7OlLjOYSVYUYb935sIWWI+fjBzNtGryF0+Kk8letnQ3vf1EsbYwVXMvwcWgzklK7bIoyI5jdnVukDXjr9RixXCPIVzP3mb2r02V8tbd6FKuVfAaACFQQxs1W7GQwi7KEkXalBt/S70Uq8eE+rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7wbjeyfoeuLWq4tdYjyQbFK2lqqeA4egMb3r9R0ScE=;
 b=ok3SRZ0u+EPiIuLBgtiXR//0LW5hBPNf7e8ymU1ueVgV1rWKJQcIdNuHyUa707761/3m+XZZqZrx3NIXj+DmxXY3BnehSdoXK5ql/qGHgO/zDDr20MLgHXoPeTDsIqQFrPs1lPvi5UpTa6vOChzSA634MmRmE0OnzU6Kdy6U3YICJX34Kd3Tnhtcvikg/fJDM4neb1xkDakdX+Mwv5U8aoCdl2a3ssTJH6uXQlmhuombYBfOfXBrICp0L+0BZw7hJc1XdKJ4ga4zvZSfAdL79Cd6gZx+2RkmxnaJg4OnISUAzXm0wsMObeodWl/xJWqUhszKL9dvyvfnSroWq01FzA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2268.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 06:33:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 06:33:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] driver core: fix up some missing class.devnode()
 conversions.
Thread-Topic: [PATCH] driver core: fix up some missing class.devnode()
 conversions.
Thread-Index: AQHZA0/Z+sN/TmHaCEK8/6gw90dH9a5Vcj2A
Date: Tue, 29 Nov 2022 06:33:04 +0000
Message-ID: <9da4f875-7fb3-803f-379e-0352eb824d8f@csgroup.eu>
References: <20221128173539.3112234-1-gregkh@linuxfoundation.org>
In-Reply-To: <20221128173539.3112234-1-gregkh@linuxfoundation.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2268:EE_
x-ms-office365-filtering-correlation-id: 9c23075c-ccc9-430f-f063-08dad1d391e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  twHsJrpyWEAKXwezh+u1xfNkBfRJugHUrW+K7UYHYeiccV0ObPPTG50Vm3wizFZHrKy0AkdbYhpkoY5LUSMpyE18yRS6NOBxhNn7+9w4BtDONzuwYQ1XTpa0xyzGUYi/4ck4A2M1cZVoj4DEHfXGFgOOLIz+9k49Y4Oe8i3mll5YhLnQp57KzQuIzS8UcdqFIxQARWtFoafu/Oa65MlMkTOeOwK2u6Mpfbcaz3RfpCFaOIeTamOup7FesFA3iywYVTREe/cMrGAmf1Aq6Ub1Q4mIAGB+s0vZLubSDOWrRhK5UsKsqI7LomM6c7Brngq5JxDmW3rm12XlaBn405JMlzucuAq5pJX/sX6RgQftpgU70/hWuHUDlstErZ3oXkJhh/5+VHLA5hnL/6F/zR0GgWs49w6SiJs1lb0a264PE1QSxl+0/MDzf6iuO0KClpPCxto0u9FqsjBynb7Fx9/MyiQ4YsDtJr0krEYEy8/ojMCnxwij6+3MMO8hOx0V27HSaTwm69lsdHvDHt2ok+6rAh9MpjAnW6u1pB7fkbhVJH3KTgMtL8sFCF00j/qkKpo1OZ1zEy1Xrn4h6qBcAJfs7sIAPRMl5v3c7l/5F2681W9Q1JZyhEF0/32j7MC87NijJYRrEew34EGiWPMYAu3R2mwcIHPs+4iR7l3G4sX8tjOI536VtsuIHT0jT3vMvaHBdz0rqfIwO47A3rmK2kzoCkI701ZfCbKAWBnAzdUYOIIqzFKKUGWl5fIwlbG1nemiDRoavIaUeEKL1GiOVwp/ww==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(451199015)(186003)(122000001)(2616005)(41300700001)(31696002)(8936002)(8676002)(2906002)(36756003)(86362001)(91956017)(110136005)(66476007)(66556008)(64756008)(83380400001)(66446008)(316002)(76116006)(66946007)(54906003)(5660300002)(71200400001)(4326008)(31686004)(38070700005)(478600001)(6486002)(6506007)(6512007)(38100700002)(26005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bmxOSmNPZHU2OGxKNTB4RUdRNitpeURZRkl0NC9kWTNyV1hpVkdoTURSZWxI?=
 =?utf-8?B?TDI5d1RZbStkanltZVczSm1oVWJ1ekxsTSs0M2U0dldkbm1Sb05tQXZWSmZJ?=
 =?utf-8?B?UGNuTmxrRWtRSS9vYUhGYWFxT1Z1T0RKbzh5SzFEVFc4YysvdkVpVUpldUJW?=
 =?utf-8?B?L01BMUxlMGw1eGRjTzJMcm5WVU9vMGVOTmRyc0JpUWR6U3RVdERzL1NTVFgx?=
 =?utf-8?B?WUs3UlI5MWxjVFI4Q3pjTHpzWnZ1S0xTQkRtS01RV3dZUkErVVpSc2xYMDlo?=
 =?utf-8?B?QTg2ek5VR0NCVWJzWlFKajNNTnNqdG5QamU0NnJDVHpIdDU5Nm8relR3Nzhi?=
 =?utf-8?B?ZWRPRklRTzZYZi9LZFUzNUhOOHBpUFUxdDl3UURlWTdMNmoxUi9xSENwOUpW?=
 =?utf-8?B?dWlteUpFT0xrdC9ETTUycjB3Y0dqY0x3MnBEYjRVY1lXc2huNWpZMVRRZWpB?=
 =?utf-8?B?YVk1bGRIRHZZcG5nNTBtQW80L3ROc0xPcHBuckdKc0szcFdOcjNIcnU4TCs3?=
 =?utf-8?B?YkFPbUVuMkppY3ZuOU5SUEo5MzhDVEE0SVJXTnlpNjlweDJnZ0RnNDdSTzdP?=
 =?utf-8?B?dkV1MmxOT0hEK08vd3hIYzR6czluWUlKZzBHYWFmYlo1VkYzenZKRng4SzhY?=
 =?utf-8?B?eVUxMzZ1Y2dNeDJGMm1HcXlGMGdRN1pQMVpxZGNEQWYvcXdJbzZlRzljVk9k?=
 =?utf-8?B?dXB1cWdHdnh2U0hoSDE3UXlDNXRUQUNsQ0kwYnE0T1JiK2daeXNXY1NSUzBB?=
 =?utf-8?B?M09obU01MWxvTFRnYmNKYXZXMHd5dWV1bWw2TWY3WitKYWEzeCtPTmw0ZG1z?=
 =?utf-8?B?S3FkQ1VaSlNuRHp0Q29SZ3VNTTJreE14S3N1cXh2Y2lkcEc4VXVHNTFuYTRK?=
 =?utf-8?B?RjhmR0JVSnNKYlFxa2U5Y2o4NDNRS3dpTHhsaUluWFZodC9mVFVQbEJhSVJS?=
 =?utf-8?B?b3JqeUVNQlZ3VWIxS2NMR2M3eTIyYkc3eU9SbWhWN1FIMFR0MXYvUDJuUjJ5?=
 =?utf-8?B?MzREQ1p3eXA0SmFSUW9GWUp5R0xZRUdOWWpuQ2lOdWFpNnNUOWo2OEF6dU9v?=
 =?utf-8?B?aVNvZk5hZm1FNFJGTWpUVnlCRjY2Y2FXM2NDSmF1S3VmdEdVbWFvQUZ2alh3?=
 =?utf-8?B?NllUQ1ZGcDZ4YTltQ3UwSkIyN09GREpRL3ZQMGpNOWx6YmRCQ2MwTThuVVhG?=
 =?utf-8?B?YlRnLzFQMlk0VWVVSG1GTm1PbllwRWxDQTJEY3U1RGwxYTJoWmFBRHBrZjUw?=
 =?utf-8?B?MzlmM0VrNDUybHJiSmtoNGNVU2lwcXZvMlZyV0NwWnFyRk5hTHUvcjJ4NVNL?=
 =?utf-8?B?blZMRVhZNlVSWGQ2OXdMVTM1NWpRdWJKQmJueDNuWXVwSk83Vm1BT3l6aVEw?=
 =?utf-8?B?N1BtdVhoeHVDdXJQdGxubHJ1R2ZkeFdBbWdEN20xL1NjM0d0cjB2SXA0cGlQ?=
 =?utf-8?B?MndQeUVRYmh6L3ZESEl4cUdvQ2I5b01USTk5TkwzWkh6MWFRVVhNbmpDbVhl?=
 =?utf-8?B?bGRMME9hVFBSSFh0S0hCdEwvemVoQTAwWVlENDhiemxURWlnaVY0N1gybFF0?=
 =?utf-8?B?cGhlQ1RJVFBYYnJIN3ZuVlc0RWk4azFCbGp4SGhPK25qL3NaRVU3K2o3dHdw?=
 =?utf-8?B?UVJZRHpzdzVqUmZSUmJPeFlINk1adlR4OFR1TGFRUEsxQmV4QkUyWmZWT1M5?=
 =?utf-8?B?OFUzL2ZIcUF0WmZJTFlyYXNCcXVpeHY5WEg2UE9yUmM3R2JuU3hidnQyMCs2?=
 =?utf-8?B?Q2VoemJVVGNtY2VlYkFibEZhQ0Z6RW5vaXV6Mm5NTjhYbGpXWUFObWRwbG9s?=
 =?utf-8?B?NGFxMHV1YS9yRmxEVkRBUCtTQmVuQk5nSFllK21MUEtPdUVIeGxreHZZcjlI?=
 =?utf-8?B?dVV4bkpGOXVoSW1FeWQxREZvV2dFT3NYYVF6MXZrQ3FjQ0FTNEVCZlVxZzJp?=
 =?utf-8?B?bzNyTDlpaTlNNUdZeDhMSE5XL2ppNjg0dFZTS0lxNlMzWEZNMzVhTU1vYTh3?=
 =?utf-8?B?NW9rUE5Ra1pndFBhSkltYjUydHAzdnM2MGw4QzUzdHVONjJ2VEFsYnhtTTRn?=
 =?utf-8?B?VjdpN2h0TXE0RkxyU09rNGhmSDh3T05JSWx5Uy9oTzlENDZFS2NTSFUzdmd3?=
 =?utf-8?B?enVJeEpTdEc4UFhQVlMvd1JUZkRBZVR0S3FFdjJlbkhyUFdIMEMxSTBoUE1C?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D36A06E15316674BA67D170C908FF181@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c23075c-ccc9-430f-f063-08dad1d391e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 06:33:04.1777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jsP79xycairGUqzm6hT/9qO82g35Nh9VCMANvzkxIMaHa1E0WQKep1g5sSwQL3jvjPJZtLJSU18QzRTwwiz3ueZya1t0SsEOOcA0ARUP5UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2268
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzExLzIwMjIgw6AgMTg6MzUsIEdyZWcgS3JvYWgtSGFydG1hbiBhIMOpY3JpdMKg
Og0KPiBJbiBjb21taXQgZmY2MmI4ZTY1ODhmICgiZHJpdmVyIGNvcmU6IG1ha2Ugc3RydWN0IGNs
YXNzLmRldm5vZGUoKSB0YWtlIGENCj4gY29uc3QgKiIpIHRoZSAtPmRldm5vZGUgY2FsbGJhY2sg
Y2hhbmdlZCB0aGUgcG9pbnRlciB0byBiZSBjb25zdCwgYnV0IGENCj4gZmV3IGluc3RhbmNlcyBv
ZiBQb3dlclBDIGRyaXZlcnMgd2VyZSBub3QgY2F1Z2h0IGZvciBzb21lIHJlYXNvbi4NCj4gDQo+
IEZpeCB0aGlzIHVwIGJ5IGNoYW5naW5nIHRoZSBwb2ludGVycyB0byBiZSBjb25zdC4NCg0KQnVp
bGQgZmFpbHM6DQoNCi9saW51eC9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2Jvb2szcy92YXMtYXBp
LmM6IEluIGZ1bmN0aW9uIA0KJ3Zhc19yZWdpc3Rlcl9jb3Byb2NfYXBpJzoNCi9saW51eC9hcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL2Jvb2szcy92YXMtYXBpLmM6NTkwOjMxOiBlcnJvcjogYXNzaWdu
bWVudCANCmZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJvcj1pbmNvbXBhdGli
bGUtcG9pbnRlci10eXBlc10NCiAgIGNvcHJvY19kZXZpY2UuY2xhc3MtPmRldm5vZGUgPSBjb3By
b2NfZGV2bm9kZTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KY2MxOiBhbGwg
d2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMNCg0KPiANCj4gUmVwb3J0ZWQtYnk6IFN0
ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pg0KPiBDYzogTWljaGFlbCBFbGxl
cm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KPiBDYzogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2lu
QGdtYWlsLmNvbT4NCj4gQ2M6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nn
cm91cC5ldT4NCj4gQ2M6IEZyZWRlcmljIEJhcnJhdCA8ZmJhcnJhdEBsaW51eC5pYm0uY29tPg0K
PiBDYzogQW5kcmV3IERvbm5lbGxhbiA8YWpkQGxpbnV4LmlibS5jb20+DQo+IENjOiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5v
cmcNCj4gRml4ZXM6IGZmNjJiOGU2NTg4ZiAoImRyaXZlciBjb3JlOiBtYWtlIHN0cnVjdCBjbGFz
cy5kZXZub2RlKCkgdGFrZSBhIGNvbnN0ICoiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiAtLS0NCj4gICBhcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL2Jvb2szcy92YXMtYXBpLmMgfCAyICstDQo+ICAgZHJpdmVycy9taXNj
L2N4bC9maWxlLmMgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgIGRyaXZlcnMvbWlzYy9vY3hs
L2ZpbGUuYyAgICAgICAgICAgICAgICB8IDIgKy0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL2Jvb2szcy92YXMtYXBpLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2Jv
b2szcy92YXMtYXBpLmMNCj4gaW5kZXggNDBmNWFlNWUxMjM4Li5lYjViZWQzMzM3NTAgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvYm9vazNzL3Zhcy1hcGkuYw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2Jvb2szcy92YXMtYXBpLmMNCj4gQEAgLTUzLDcgKzUz
LDcgQEAgc3RydWN0IGNvcHJvY19pbnN0YW5jZSB7DQo+ICAgCXN0cnVjdCB2YXNfd2luZG93ICp0
eHdpbjsNCj4gICB9Ow0KPiAgIA0KPiAtc3RhdGljIGNoYXIgKmNvcHJvY19kZXZub2RlKHN0cnVj
dCBkZXZpY2UgKmRldiwgdW1vZGVfdCAqbW9kZSkNCj4gK3N0YXRpYyBjaGFyICpjb3Byb2NfZGV2
bm9kZShjb25zdCBzdHJ1Y3QgZGV2aWNlICpkZXYsIHVtb2RlX3QgKm1vZGUpDQo+ICAgew0KPiAg
IAlyZXR1cm4ga2FzcHJpbnRmKEdGUF9LRVJORUwsICJjcnlwdG8vJXMiLCBkZXZfbmFtZShkZXYp
KTsNCj4gICB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvY3hsL2ZpbGUuYyBiL2RyaXZl
cnMvbWlzYy9jeGwvZmlsZS5jDQo+IGluZGV4IDNkYmRjZTk2ZmFlMC4uNTg3ODMyOWIwMTFhIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL21pc2MvY3hsL2ZpbGUuYw0KPiArKysgYi9kcml2ZXJzL21p
c2MvY3hsL2ZpbGUuYw0KPiBAQCAtNTQ2LDcgKzU0Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZmlsZV9vcGVyYXRpb25zIGFmdV9tYXN0ZXJfZm9wcyA9IHsNCj4gICB9Ow0KPiAgIA0KPiAgIA0K
PiAtc3RhdGljIGNoYXIgKmN4bF9kZXZub2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgdW1vZGVfdCAq
bW9kZSkNCj4gK3N0YXRpYyBjaGFyICpjeGxfZGV2bm9kZShjb25zdCBzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHVtb2RlX3QgKm1vZGUpDQo+ICAgew0KPiAgIAlpZiAoY3B1X2hhc19mZWF0dXJlKENQVV9G
VFJfSFZNT0RFKSAmJg0KPiAgIAkgICAgQ1hMX0RFVlRfSVNfQ0FSRChkZXYtPmRldnQpKSB7DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2Mvb2N4bC9maWxlLmMgYi9kcml2ZXJzL21pc2Mvb2N4
bC9maWxlLmMNCj4gaW5kZXggZDQ2ZGJhMmRmNWExLi5kOTZiZTM2NDA1YTAgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvbWlzYy9vY3hsL2ZpbGUuYw0KPiArKysgYi9kcml2ZXJzL21pc2Mvb2N4bC9m
aWxlLmMNCj4gQEAgLTU4MSw3ICs1ODEsNyBAQCB2b2lkIG9jeGxfZmlsZV91bnJlZ2lzdGVyX2Fm
dShzdHJ1Y3Qgb2N4bF9hZnUgKmFmdSkNCj4gICAJZGV2aWNlX3VucmVnaXN0ZXIoJmluZm8tPmRl
dik7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGNoYXIgKm9jeGxfZGV2bm9kZShzdHJ1Y3QgZGV2
aWNlICpkZXYsIHVtb2RlX3QgKm1vZGUpDQo+ICtzdGF0aWMgY2hhciAqb2N4bF9kZXZub2RlKGNv
bnN0IHN0cnVjdCBkZXZpY2UgKmRldiwgdW1vZGVfdCAqbW9kZSkNCj4gICB7DQo+ICAgCXJldHVy
biBrYXNwcmludGYoR0ZQX0tFUk5FTCwgIm9jeGwvJXMiLCBkZXZfbmFtZShkZXYpKTsNCj4gICB9
DQo=
