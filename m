Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E705587ACF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 12:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxrzz0h1Sz3bl0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 20:38:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Lit7JMyY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.52; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Lit7JMyY;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90052.outbound.protection.outlook.com [40.107.9.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxryQ48c3z2xHL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 20:36:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6H+uZAlvs2w5uTACsQSxbX8a6LCpfpEUzlb8Lhnpy8dZJ+apKnzw85TOkRWpgdIiODe4b0bmiuRKMDToDiV3jozBVNkKOGce8ctaruRRy0pBWegy+GUtJxTxZUDHi5bk8BfSa6/t2SZIxz81XjizEN3WIwFgljPJymESVjlGs275M70vs7vtPpaYTJKulBlhLuJS0XO4n1GUD1QL6SfRze2vTbeygIeO8Fi0iPYBX42NITiQLLq0GDycnNjYk0XZ5xb3n5MuyA6PohMHAkY4XHJuEoieP5mDVqCBMnqq+K0/u3HZKAcozgwc0ZMybsT3gU1yXwyyWKyJkp9lys0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4Wy0WCWbCA3D+HHh7pt5budaIobndDegGGuf6wy/pk=;
 b=Ez4cJKILYoweP8lHqcCoN50CdeDraDRnQUVLVJ2fAF7+16Wff6SbJYkJNZABwKjeEbuS92No0Xp4zJkfY0v1b9q6AF56+ekaXQn3XORu8pp5z3WzhAlPxw4l7Ry22FIcAt8uBwlMTPMgLN0gGAnXOIylIMAnRer+85AZXZivSLoJvKZc7oqB5zqii4AwCPyAnYQIpXKDsH0kSuILRRayrT4qc7387D4XR/GtOXxM7V00zsKkj+aFBiI0tcwFKC7uGz9u7Y60MdOGpDqKyB/Gc48Cm5D50cEJqkZlUJJ2pUJd8yKdXuTl14IUZPL69KCWKSuCUPFwRrZ/5/g80aPntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4Wy0WCWbCA3D+HHh7pt5budaIobndDegGGuf6wy/pk=;
 b=Lit7JMyYkdMh5wxNEDnNaIWOlSPrO1XjHiiTUKSZJ8CT0D/wOivEL1YiR9B0Nmsw3v9D5HqvbRQfgDZD2J8IvzyftU33POppkpxuFDU1sJyy1w0ZF6Bmsqd0IW6QAg5tJVV0b6VA+VLKFXDDNnIBJLx4KQmJaY/i+SvaHciTHeTB5iWc8wDQcWM9OZw8Ba8zCCcoMf/+QUU3HiDtEhwiA2qXQ/yXpuC4RW9s++PekriNTZ/PMUfdmONqQToMjCvlSbjSLunoynuqyVNtOLPCbKUKeDldWsqBWeeoAxHYjSM0BRDMCNYwEN6743IFQybenFDDlOgtwuujP6kmBcABFw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB4196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:42::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10; Tue, 2 Aug
 2022 10:36:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 10:36:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Fwd: [PATCH v12 33/69] powerpc: remove mmap linked list walks
Thread-Topic: [PATCH v12 33/69] powerpc: remove mmap linked list walks
Thread-Index: AQHYm+FLXx8z6el5bEyF7TxQ/X9k762bf76A
Date: Tue, 2 Aug 2022 10:36:41 +0000
Message-ID: <2199dddc-8fb3-34ce-9eb1-128288ae2042@csgroup.eu>
References: <20220720021727.17018-34-Liam.Howlett@oracle.com>
In-Reply-To: <20220720021727.17018-34-Liam.Howlett@oracle.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1399acfa-7454-4a0d-a963-08da7472e376
x-ms-traffictypediagnostic: MR1P264MB4196:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qwzEQJISiqevdY2DcsjjaYG8V71prZ/uPz/bQMFxhleTTn+cxkjPC3dcQ3VP4C8lOReCbYzR/3eaQOc/lqST5jda9O3vVNm/8EMmoolcHRkidE326V1IlTgwzEzrBfs4nGFX4PF1Hl08uAT6eAYRiPFtB6TmaPCu566cdF8KYWr7ZlYB4BiUCNCGf9K/F6Z067izbaLmh5aVUHDl7zYQdrHA3L5WTli7t762jOac4EY8gq5KssgwSRODCkPQga8mPlK5J+8gXxtEX/jVClX/RF5Da+USgde1KtpetsO2b27PzQmjrcyI2oEGBdLq8mwPKxwODr76GKYbcXZ8U7Eg/IN3BZMrigizcoSaZICDPKnbRj3rXyQhTt3/ZGfwh3JIZNtZikzd4SbCLJgiaDBqDtjpCZfQHcfLauE2pgsoroaccR8xViCiok2UUPYmZlzBjrmwjVtHY3oRxhSyLJm2vWOQWpGnULrh+Jrx9JLELjaHPq9vx6cNkgI/eeuPst+USC3EhOe8UocY3o4AOOPkClqpX3UeBJohNC8lKXT7t5G0GzerxAHKz/uQ6ZpAafXAiUAw37k5Cl8/ohJ1JKvNhIYelDn+PMCJcPi1UJq5mdhpDzPgpRjlXrN5BmihIC4Tq9WwjBgseeZFxPvrCSfneGlWreN4mAr5fJpH/7lcak3RlH8A/XuO4A+dT+Iw61XRGOd2lU/5+lH4ZIwrQ20pRYLiniatEiJVFjFOu8Z78Lu8fwVGcGHwbtRUqC6N4BQhwm7279J3LQjlWlKRUxoZPRmBoRd+KohcAyIk0J33cR86DGSLsKEYkT+NNw29NoTWHPqPjbvVPqTnNXJNVbsoGhNIEtnF38S+lkbHgG9z865GoINhFtUqddB7bl5QpTmcfZDj6wZ8CHwLGjG3jKwxxg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(136003)(376002)(39850400004)(41300700001)(31686004)(2906002)(83380400001)(2616005)(86362001)(6916009)(6506007)(122000001)(44832011)(36756003)(26005)(6512007)(38100700002)(186003)(6486002)(5660300002)(8676002)(71200400001)(66556008)(66476007)(66946007)(91956017)(8936002)(66446008)(64756008)(478600001)(76116006)(66574015)(31696002)(316002)(38070700005)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bG5EOE9TZHdWZ0tBSE90OVRnNVpVTC9jS1pXVnRhQmF5N1dlMTMzOFJiNDRT?=
 =?utf-8?B?Z1Z1WWJybFVhSjBsb3NNaHdtWWJtdVFIQVdUTkZiYkQ3TmdqRFFBaTBQUUs1?=
 =?utf-8?B?RjBVRklTcFc0MStHa2pCb1NSWFdGMkVCVERTbWpHT213K3Z1SUVaWHpuUkNY?=
 =?utf-8?B?bWxCSDdYb1Vza2FweVpmbUEyVC85cXBHRmd6NnloM3VRcktFenBNRDZXWlph?=
 =?utf-8?B?KzBsVkk3NTJBRXpkRmdBZnJZVG9TcmQ0cUJycG9LR1RxNWFxSlZVanVZL0dj?=
 =?utf-8?B?M21MWkl6QnBlaUJnZDRxZmVaaW9JS3NiS0RMektYb1NLcC9kVlZBKy9rekJ3?=
 =?utf-8?B?TmNJdHk2c2JxTlM5em1LUHRZTXN2cVc3TG43S0dUOEViMEIrRDdSL1JONEEr?=
 =?utf-8?B?V1JPb2w4cjgwc0gxUXBGNUVNYWlYMVF1emJ0U0VzaEZJalNrTlZyNTg3SFlh?=
 =?utf-8?B?VUw4R1JuUHNyaC8rT1hJamFoclVPVTZlaVY0eHhuRk9yeDdYQzRBTUNtcklV?=
 =?utf-8?B?VTVMQlNtM1MxSWxKbDMvd0JWUlVHYjU3YzAwNllzM2pVaWpUaUZFZVYrWHNn?=
 =?utf-8?B?eXVjNEo4UlhNV2wxUkpKMEhRU1JBOEVwaE00eUY1ZnMwSkVDbWg4S0dsbm5a?=
 =?utf-8?B?VThTanZvdWJpVmVHMU5LUEU0QkhCM2xINE1vZzc2MWp1N1NmUWhBOUFGZjFG?=
 =?utf-8?B?SDdKQ1krTTZWSFoyU1RESGpucVo0M0F4VmNVRHJQSGxXdmVRSk9oN1psWHNt?=
 =?utf-8?B?OXhJL1FGNUVZOXJ0aGNmY25RajhFdmtqQTNjSzRzem5iSU5SaFBNd3I4OVJy?=
 =?utf-8?B?QjNMeXpnR2hDQ3hPVklrWFplUWN2dG1Ud1lPSE4rbCtFendwcWhMTU9JNWpS?=
 =?utf-8?B?VWE2cnRlOHkvbXhKWHhnS1JoWlRzTFZRTHRIUjNlTFl1VUdPTU9VVW9rTWJa?=
 =?utf-8?B?TTdDSVMzMWVYUVZ1Y3Fxa3ZuVmRCOTcyY1FKN0dIYm9rMmdjV09ycFA1NWxZ?=
 =?utf-8?B?emI3ZGVLVWFpR1dZeE1aNTUyWFliYlhmNi9HZzY1Rmx4ajhDUFJ0bm9xNG5y?=
 =?utf-8?B?VVBva1JtY1IxR1FzRDNGNytoSHlWaXNiUVhiUWkvUjdJQUdXa2lJM3c4b24r?=
 =?utf-8?B?blB1dTF0a2lFMktkQVlZVG9xYVNWa1YrVEFXQTNTN3NJekhrN3UvZUNrOExv?=
 =?utf-8?B?aVAyenRnbERacUVzSjNWS2lJQ0dzSCszZ0diakNEQUttZXAzeW5XMU42OG1I?=
 =?utf-8?B?OGZDdWFRZVNoZjd4ZFExTE1iZnhhT1JsVC9ZU2tXK21EVXYybk51eUU3SXU5?=
 =?utf-8?B?ak9JOVdCQVFIQlZWWVdzOVlaVDFsMktUY1dCNjhOVG1BTG4rYmZvWFpTU2g4?=
 =?utf-8?B?Q2pxOWJhNExqU1JGQ3JPRTU4T2JvUDBscGhzdFFjRGZUZWhzRUMveFJuSmRF?=
 =?utf-8?B?b055QzhEK0p3MklWa1VmV3pqSFZWZWZ2NE5TOGN4dU1lRDNZaGp5M3F1RWZ1?=
 =?utf-8?B?UUlxM1lteVVFODBNQThmd1NqeUxrd3JRT3RqMmlKWXZpMnJrOXZYZWwzUXVL?=
 =?utf-8?B?Z3o3enpmMVRzc3FiQjFHOC9Rc01MNjVmU1MrRnpPeEk4dFQ5dEtQZk12aXBP?=
 =?utf-8?B?SVZPbUF3TGNUTGtTS3ZubGZlTkJHRE5Od25RRnNtSEtaR2NGbnZGdVRxTGE3?=
 =?utf-8?B?Y2ZXTGFUSzlxaE41WmtUUDdUMEMzVHdNQlc5STQ0ampTUlRXUHBCSDJhc3Vo?=
 =?utf-8?B?RVgwQ1dQOVhtbVJZT2ZXaWZuNnBVdWpKc29idWd0bE82eUhLWTlTaTRUU1Rm?=
 =?utf-8?B?R3J0ekYvRmtNcHg0aG9rem8zVVQ4S1puZ29kK0FhbnlETENFQUcwUXVDalpa?=
 =?utf-8?B?cFdZK0FtVyt5SkFSSmE5N3pVRlNLUmhWbjQvZy9TeXVhb05RVVdnMTRwL1k2?=
 =?utf-8?B?YlZxUUpycmt1bGtsL0pRQ3UyL0xNNnF4M0Q2ZlpFNER4b2poamlqaGZBczd2?=
 =?utf-8?B?eTQzbDJPNHdEQXJkdTIxRzRTMmxFbzlQcGl1SVFiNnRVM21rUzJzbCtvQnor?=
 =?utf-8?B?a2gzWkV6cVNvck5BdER0THN4VXZLc0FtMmFESVR0MlRJTHhtNWhKbFFjbnQ0?=
 =?utf-8?B?VjZ4MGYvbHJDL0dvbldFOWwyanpGeEdKSXZMT2poT1pQdzlHT2hUa3lrNUMw?=
 =?utf-8?Q?t0iEdmec5QpnTRHy9GJRseA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64D74C61C05AD34F9802D613DD3B5F8E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1399acfa-7454-4a0d-a963-08da7472e376
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 10:36:41.7332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LzrKQZtfKWQ4FOmZzei6aYqSkpRd3wDSIQYXSPfLSdnjmtmSwfrxrWwrAYVeuRHtWPnBUuCjiKD0TmHl97kRH+4fjkvBxYYD6a0jL1RsdFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB4196
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

DQoNCg0KLS0tLS0tLS0gTWVzc2FnZSB0cmFuc2bDqXLDqSAtLS0tLS0tLQ0KU3VqZXTCoDogW1BB
VENIIHYxMiAzMy82OV0gcG93ZXJwYzogcmVtb3ZlIG1tYXAgbGlua2VkIGxpc3Qgd2Fsa3MNCkRh
dGXCoDogV2VkLCAyMCBKdWwgMjAyMiAwMjoxNzo1NCArMDAwMA0KRGXCoDogTGlhbSBIb3dsZXR0
IDxsaWFtLmhvd2xldHRAb3JhY2xlLmNvbT4NClBvdXLCoDogbWFwbGUtdHJlZUBsaXN0cy5pbmZy
YWRlYWQub3JnIDxtYXBsZS10cmVlQGxpc3RzLmluZnJhZGVhZC5vcmc+LCANCmxpbnV4LW1tQGt2
YWNrLm9yZyA8bGludXgtbW1Aa3ZhY2sub3JnPiwgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZyANCjxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgQW5kcmV3IE1vcnRvbiANCjxha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnPiwgSHVnaCBEaWNraW5zIDxodWdoZEBnb29nbGUuY29tPg0K
Q29waWUgw6DCoDogWXUgWmhhbyA8eXV6aGFvQGdvb2dsZS5jb20+DQoNCkZyb206ICJNYXR0aGV3
IFdpbGNveCAoT3JhY2xlKSIgPHdpbGx5QGluZnJhZGVhZC5vcmc+DQoNClVzZSB0aGUgVk1BIGl0
ZXJhdG9yIGluc3RlYWQuDQoNCkxpbms6IA0KaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDIy
MDUwNDAxMTM0NS42NjIyOTktMTgtTGlhbS5Ib3dsZXR0QG9yYWNsZS5jb20NCkxpbms6IA0KaHR0
cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDIyMDYyMTIwNDYzMi4zMzcwMDQ5LTM0LUxpYW0uSG93
bGV0dEBvcmFjbGUuY29tDQpTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8
d2lsbHlAaW5mcmFkZWFkLm9yZz4NClNpZ25lZC1vZmYtYnk6IExpYW0gUi4gSG93bGV0dCA8TGlh
bS5Ib3dsZXR0QE9yYWNsZS5jb20+DQpSZXZpZXdlZC1ieTogVmxhc3RpbWlsIEJhYmthIDx2YmFi
a2FAc3VzZS5jej4NCkNjOiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29t
Pg0KQ2M6IERhdmlkIEhvd2VsbHMgPGRob3dlbGxzQHJlZGhhdC5jb20+DQpDYzogU2VvbmdKYWUg
UGFyayA8c2pAa2VybmVsLm9yZz4NCkNjOiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPg0K
Q2M6IERhdmlkbG9ociBCdWVzbyA8ZGF2ZUBzdGdvbGFicy5uZXQ+DQpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KLS0tDQogIGFyY2gvcG93
ZXJwYy9rZXJuZWwvdmRzby5jICAgICAgICAgICAgICB8ICA2ICsrKy0tLQ0KICBhcmNoL3Bvd2Vy
cGMvbW0vYm9vazNzMzIvdGxiLmMgICAgICAgICAgfCAxMSArKysrKystLS0tLQ0KICBhcmNoL3Bv
d2VycGMvbW0vYm9vazNzNjQvc3VicGFnZV9wcm90LmMgfCAxMyArKy0tLS0tLS0tLS0tDQogIDMg
ZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28uYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwv
dmRzby5jDQppbmRleCAwZGEyODc1NDQwNTQuLjk0YThmYTUwMTdjMyAxMDA2NDQNCi0tLSBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvdmRzby5jDQorKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28u
Yw0KQEAgLTExMywxOCArMTEzLDE4IEBAIHN0cnVjdCB2ZHNvX2RhdGEgKmFyY2hfZ2V0X3Zkc29f
ZGF0YSh2b2lkICp2dmFyX3BhZ2UpDQogIGludCB2ZHNvX2pvaW5fdGltZW5zKHN0cnVjdCB0YXNr
X3N0cnVjdCAqdGFzaywgc3RydWN0IHRpbWVfbmFtZXNwYWNlICpucykNCiAgew0KICAJc3RydWN0
IG1tX3N0cnVjdCAqbW0gPSB0YXNrLT5tbTsNCisJVk1BX0lURVJBVE9SKHZtaSwgbW0sIDApOw0K
ICAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7DQogICAJbW1hcF9yZWFkX2xvY2sobW0pOw0K
LQ0KLQlmb3IgKHZtYSA9IG1tLT5tbWFwOyB2bWE7IHZtYSA9IHZtYS0+dm1fbmV4dCkgew0KKwlm
b3JfZWFjaF92bWEodm1pLCB2bWEpIHsNCiAgCQl1bnNpZ25lZCBsb25nIHNpemUgPSB2bWEtPnZt
X2VuZCAtIHZtYS0+dm1fc3RhcnQ7DQogICAJCWlmICh2bWFfaXNfc3BlY2lhbF9tYXBwaW5nKHZt
YSwgJnZ2YXJfc3BlYykpDQogIAkJCXphcF9wYWdlX3JhbmdlKHZtYSwgdm1hLT52bV9zdGFydCwg
c2l6ZSk7DQogIAl9DQotDQogIAltbWFwX3JlYWRfdW5sb2NrKG1tKTsNCisNCiAgCXJldHVybiAw
Ow0KICB9DQogIGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzMzIvdGxiLmMgDQpi
L2FyY2gvcG93ZXJwYy9tbS9ib29rM3MzMi90bGIuYw0KaW5kZXggMTlmMGVmOTUwZDc3Li45YWQ2
YjU2YmZlYzkgMTAwNjQ0DQotLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzMzIvdGxiLmMNCisr
KyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3MzMi90bGIuYw0KQEAgLTgxLDE0ICs4MSwxNSBAQCBF
WFBPUlRfU1lNQk9MKGhhc2hfX2ZsdXNoX3JhbmdlKTsNCiAgdm9pZCBoYXNoX19mbHVzaF90bGJf
bW0oc3RydWN0IG1tX3N0cnVjdCAqbW0pDQogIHsNCiAgCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
bXA7DQorCVZNQV9JVEVSQVRPUih2bWksIG1tLCAwKTsNCiAgIAkvKg0KLQkgKiBJdCBpcyBzYWZl
IHRvIGdvIGRvd24gdGhlIG1tJ3MgbGlzdCBvZiB2bWFzIHdoZW4gY2FsbGVkDQotCSAqIGZyb20g
ZHVwX21tYXAsIGhvbGRpbmcgbW1hcF9sb2NrLiAgSXQgd291bGQgYWxzbyBiZSBzYWZlIGZyb20N
Ci0JICogdW5tYXBfcmVnaW9uIG9yIGV4aXRfbW1hcCwgYnV0IG5vdCBmcm9tIHZtdHJ1bmNhdGUg
b24gU01QIC0NCi0JICogYnV0IGl0IHNlZW1zIGR1cF9tbWFwIGlzIHRoZSBvbmx5IFNNUCBjYXNl
IHdoaWNoIGdldHMgaGVyZS4NCisJICogSXQgaXMgc2FmZSB0byBpdGVyYXRlIHRoZSB2bWFzIHdo
ZW4gY2FsbGVkIGZyb20gZHVwX21tYXAsDQorCSAqIGhvbGRpbmcgbW1hcF9sb2NrLiAgSXQgd291
bGQgYWxzbyBiZSBzYWZlIGZyb20gdW5tYXBfcmVnaW9uDQorCSAqIG9yIGV4aXRfbW1hcCwgYnV0
IG5vdCBmcm9tIHZtdHJ1bmNhdGUgb24gU01QIC0gYnV0IGl0IHNlZW1zDQorCSAqIGR1cF9tbWFw
IGlzIHRoZSBvbmx5IFNNUCBjYXNlIHdoaWNoIGdldHMgaGVyZS4NCiAgCSAqLw0KLQlmb3IgKG1w
ID0gbW0tPm1tYXA7IG1wICE9IE5VTEw7IG1wID0gbXAtPnZtX25leHQpDQorCWZvcl9lYWNoX3Zt
YSh2bWksIG1wKQ0KICAJCWhhc2hfX2ZsdXNoX3JhbmdlKG1wLT52bV9tbSwgbXAtPnZtX3N0YXJ0
LCBtcC0+dm1fZW5kKTsNCiAgfQ0KICBFWFBPUlRfU1lNQk9MKGhhc2hfX2ZsdXNoX3RsYl9tbSk7
DQpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3N1YnBhZ2VfcHJvdC5jIA0K
Yi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc3VicGFnZV9wcm90LmMNCmluZGV4IDYwYzZlYTE2
YTk3Mi4uZDczYjNiNDE3NmU4IDEwMDY0NA0KLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0
L3N1YnBhZ2VfcHJvdC5jDQorKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc3VicGFnZV9w
cm90LmMNCkBAIC0xNDksMjQgKzE0OSwxNSBAQCBzdGF0aWMgdm9pZCBzdWJwYWdlX21hcmtfdm1h
X25vaHVnZShzdHJ1Y3QgDQptbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsDQogIAkJ
CQkgICAgdW5zaWduZWQgbG9uZyBsZW4pDQogIHsNCiAgCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hOw0KKwlWTUFfSVRFUkFUT1Iodm1pLCBtbSwgYWRkcik7DQogICAJLyoNCiAgCSAqIFdlIGRv
bid0IHRyeSB0b28gaGFyZCwgd2UganVzdCBtYXJrIGFsbCB0aGUgdm1hIGluIHRoYXQgcmFuZ2UN
CiAgCSAqIFZNX05PSFVHRVBBR0UgYW5kIHNwbGl0IHRoZW0uDQogIAkgKi8NCi0Jdm1hID0gZmlu
ZF92bWEobW0sIGFkZHIpOw0KLQkvKg0KLQkgKiBJZiB0aGUgcmFuZ2UgaXMgaW4gdW5tYXBwZWQg
cmFuZ2UsIGp1c3QgcmV0dXJuDQotCSAqLw0KLQlpZiAodm1hICYmICgoYWRkciArIGxlbikgPD0g
dm1hLT52bV9zdGFydCkpDQotCQlyZXR1cm47DQotDQotCXdoaWxlICh2bWEpIHsNCi0JCWlmICh2
bWEtPnZtX3N0YXJ0ID49IChhZGRyICsgbGVuKSkNCi0JCQlicmVhazsNCisJZm9yX2VhY2hfdm1h
X3JhbmdlKHZtaSwgdm1hLCBhZGRyICsgbGVuKSB7DQogIAkJdm1hLT52bV9mbGFncyB8PSBWTV9O
T0hVR0VQQUdFOw0KICAJCXdhbGtfcGFnZV92bWEodm1hLCAmc3VicGFnZV93YWxrX29wcywgTlVM
TCk7DQotCQl2bWEgPSB2bWEtPnZtX25leHQ7DQogIAl9DQogIH0NCiAgI2Vsc2UNCi0tIA0KMi4z
NS4xDQo=
