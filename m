Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 277D2569DAE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 10:44:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdqhX1McDz3c2n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 18:44:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=atKNDpPk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.49; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=atKNDpPk;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120049.outbound.protection.outlook.com [40.107.12.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ldqgj3TXGz3blQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 18:43:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZubUMzFOwXZz6aUxXLypzF4QuEt0spLtXiXBcc34aogDOhHCrblr64x2IoB7ditw/SXog+IdESMYGWbacg6L7SXIUyMo4sKGdHxu/nC6fHwEuqWlvG2OJnJ973jJADOWJfHczhbUJwSDxJg6xyPv/bxrASj0TfsSljNWZrcrwWveb4ZqP7jR3Oi2R1f1bGUrhq2MIujXCdjvOgUPPNiLi37OWvyZx0ni8KWmkJYOYTIm2UgHA0i2Anx5ZFWz4QkvG5A01vUH9tE1RKh5i9lXND3ulFcx+3QFzWgawfVhNxCNE8tpQqKTpm/0r3xPGb5wHnQVshIP+jH4R+bnsQX9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EU9dZ1PkkMwIOPEW2TzjAGz7gSG7I0lDx5/boIibeE=;
 b=cKS3s0oFIU32EWjjgj41CLXRukTY/UBbGwE+fcqfOgsIg2I7z5wJ56SqVokaV2bdKkZaJLwe6beBewaSE151MBKA4f1tRfq1qGsH+uxspVAU8kn909GrUV3XYNDzyutj729BSfz77Zf7BpxxfjMKQ+SI+l8HCqQ7xgz7YDLcMQG/4pe7xAcRkvM+Ka1xY88Vl+h0AL0zWW0zh8VnqpmFnxmBzB4Csb36s4sFpIOPmwT0OGWgM+Izf6+//Y/Y0dvBNxYpKws6ltc89I16LfEGlRiduFhPhPqMKEM9HGsTFemeKAoWuFZ/gt5SxVER5BC/X+FhPw33UIKKnXX5qo1qWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EU9dZ1PkkMwIOPEW2TzjAGz7gSG7I0lDx5/boIibeE=;
 b=atKNDpPkTeGFs/whJduDrIuuAkxRjS+KKMOPo/LhDVr/M4SWogKPKgVvryeo5+m8uQlh7b7AzeJCW2Xyhz3fAqOP4WHEoKTYpznztp3mRzLnQN/2QOoJ3Uh1c5PyG/lEFHHbVZ9HbYB91uzYPlrcCB92+Laej6D7nb1Z1URj9CZkBUkXQvmb8qj2uGLvJeu7w5ELYskPZFrfjle6/gotHXFhMrEcAzyxeYmNQmTz59f3dO8t7V3q62NQa0K9IdoY2QWe9upV+5RbCcxV+TGLBCftLPnBWzs57pWBJmaqffB8iv3jLFt3x/siUjA1zMOdY7DKgk62iHksqW1I1sXsew==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2630.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 08:43:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 08:43:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	Scott Wood <oss@buserror.net>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] powerpc/platforms/83xx/suspend: Reorder to get rid of
 a forward declaration
Thread-Topic: [PATCH 1/3] powerpc/platforms/83xx/suspend: Reorder to get rid
 of a forward declaration
Thread-Index: AQHYkckeSaTHJJtuA02VMep2s4Xlh61yl44A
Date: Thu, 7 Jul 2022 08:43:01 +0000
Message-ID: <e1aa0b38-1c10-b53f-fa63-6d3d123acd87@csgroup.eu>
References: <20220707061441.193869-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220707061441.193869-1-u.kleine-koenig@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46bd2824-d49a-4b64-c8da-08da5ff4b3d2
x-ms-traffictypediagnostic: PR0P264MB2630:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  viv0MLQsJAKetag2XQC4ExM2d3rxR8cQuX6xKj3AfrewZ1ulpiZI05kIEirL6jvn5gNG6Hr7b3HDZoGMuqaAR2li0pYtpS2qlh+QBzYsAiOvoWgfXxRSxVPl5O21dem8CspiiNdpGY6J20JRQ6xM8KsFt/JFlkHfW01mTMRXM9x/NRwQhX8t1m/LmBmRNdOvdPcK+JnlnyKXnCb/wNpB5UHt0PKbsU1KHbmKPf7azCniceBEGVjvPVi5UQqWKE8ythptay56A5D9VhbQTBE2zmJ+21rmd5VgHeIV7ev8DpKcqyYHB7rUjDDawPIQUZPnFyZZOQ/THetrsFhgYRRcBKf93ka0ALkXBLzOdAWEHie4QmjVMZJRoUKUGWfat6Yuy3bzw8yq/GXLJCwhlUcTRC5xGT361fKW5guFXYFiK16ZoKmAPKGVAgajI8VqJZg8bI+uW0RS1tVUnRV3h9XKPMYGp9V4naBzm3fDHUHoPqpM5ku1Q1jz1fTsOwxWl7EgU4CTkkvCwdCYnI8xDqOf6WmoyofSpLzWNKKdth50If+0n0GQsqxCSpERsZ2As2lNolkian6f/Pr2JFhU5J2nWNJ9fsujD6tLkEKVmuNH8HsQubTObPEvSRbnPKOQeJ6FafXIpMB7nMF50NVRZ7Rg6FOw0FHzRIH3lQiR0vcSDWUsVV3JnaKu0I432yXUYPJVmUX4wNGdPV6M0akkbdWFQbz3f6brtj5byusZy7M30BvBP2tnvQfioske2WAyCLVa/6rP7UcMwAkVJo1Z6YGvzP3xWkY+tPHxc6np0Zw3SqIg/1fAx4Bw8NUxCvRHiQ6HJusg8V+ez0DsSCldx7T6rZIBhVZTJ3U5N54GgQ1Eu9jjXqjIgJWxpMvdK4VbATaaqLfXqdE1+DpftWveJpcnq4rukw6XBSChW4ZBp+MFJvU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39850400004)(366004)(136003)(41300700001)(26005)(6512007)(66446008)(186003)(83380400001)(2616005)(36756003)(31686004)(64756008)(38100700002)(6506007)(2906002)(66574015)(76116006)(38070700005)(66556008)(15650500001)(8936002)(110136005)(6486002)(5660300002)(44832011)(478600001)(4326008)(8676002)(71200400001)(122000001)(66476007)(54906003)(91956017)(86362001)(316002)(66946007)(31696002)(26583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V0VQT3doWk51QTFVOWxVZUxQc2JtbTg3VC9MbFZHbFo1L0FGTWtrQ3hYRHZi?=
 =?utf-8?B?bXdGeFYzZjZBazNPaEVDdHBPRGpvYVU5Z09jbld6Sm1rcm1vVUhzYUZQTGUz?=
 =?utf-8?B?NXIvYXgvdDNmQUhrU3F2SkM4cTlwblRxaXJDTTZGVDhvbzl2M3czOGFzS092?=
 =?utf-8?B?ekNtblAxbUVEZjNPd0hEa3Z1dHdLdzhTU1lPVkloRWpFQUFPdUpCUzZaeTNy?=
 =?utf-8?B?ZVZub1hBSm1jOUxabGxDSUNJRHJVbi9mV2hFb1NyZk05SFlkMHoyWUFXNnA5?=
 =?utf-8?B?dmU4STBybGc2ZjExK0NrRGJoRk5mdTg1c2V6b0FqYVF6V2ZkaG10MmcwcjJj?=
 =?utf-8?B?YmlPY0M4eXBIZ1VxTEpPZklBVEZ1aDhMSEprTk5SSW9aYStKRmJDTFNwYXZC?=
 =?utf-8?B?NFRCRjR2ZmhkcjVqaU0vSzJlb3YrNU53SnYwNWdXelNibTFBMmVYeFVJZGJH?=
 =?utf-8?B?ZWJhUWFBcEFQMWJJano1cE1zRGpqbTBZanRXM09wcyt1Y2xHcUVCVThkMUpT?=
 =?utf-8?B?YWdiZzlXVlZDSzh5TWdwSEtGMUtUYXZuSk9GUVlXYmFWMlgxRitFelJIS0Vi?=
 =?utf-8?B?MVNiemZxOStGRTZORGl0djlGQ2d2bmdwaHcxUGl5L0ZIVFZYR2RXSXlKNlNk?=
 =?utf-8?B?NVJncERVRFRjWjZ0QmJpVlJ5Ni9JSHQ5TkFaY3VGR3ZBUHFwaHZrb21hM0Jx?=
 =?utf-8?B?dFFCQVJkWW45MjlhU2s1RmRkemI0eVBGS3dneko4ckh6RllQbmhNaVhUR29r?=
 =?utf-8?B?SWpBcW45Rk1xUUgwVGdKRDFncjgyZTRwdkk5VDhqVmpHZm5jVzNFOHNMLzY3?=
 =?utf-8?B?VmtZMGNOeHNYU0F4RmRiWEpCV0d3WmJvQURSUXFVT1duRllLRjlHaXlyZmdY?=
 =?utf-8?B?dHZJOFY4SUJ1K1hBK3llaHJsSU1MVGtyMEdSZGg3dlZTWTlRY0c5RGVpWkdr?=
 =?utf-8?B?UzViZTZLN2dKSkFzaExxbXVJR1greVlVdEFpc1JTK0h4dVk1UFRUY21ueC92?=
 =?utf-8?B?bW5DTFZ4b3c2YjBjd082TnlZWW8ydHZPZGZwNVRHclFlSU5qOEs4WDlrYlRu?=
 =?utf-8?B?TkhvbFZvcWVkejNqUmovOWphRDVvRWdKMC83cnVrQjYvODZQTWlOSXM5UzZQ?=
 =?utf-8?B?VHAwU1hyTVVVUXNrQ3J0SlRGaXA1UU1zaEpYTGVQRnNOc3JiTGdFNWxHYVhy?=
 =?utf-8?B?WktrSk1VUFpCbkRZcTE0MEUyaVppVGNQVGRqc0NuTWpRU2E4SG5PSzlaVFEx?=
 =?utf-8?B?WDhtRUlTMHVuUitvN25VQTh2Z3dqWmhOaDBkV2E3YnR4R2M5dTlLMUsxSWxX?=
 =?utf-8?B?Y1NpNVF5WHR5QVVrazZpaDZHSnZRMms3S2pwOW1TV1JSQTJJOVhHQ0sxL0kz?=
 =?utf-8?B?YnAyM1kraVlYRy9VdG4ySjNFLzZKUTR0RTJ2UVB3dHNMMVhOTnZ5ZFFqYmhL?=
 =?utf-8?B?NlQva1BhSit5OHNuYTErVXA5ZkxjSU5OamNrV0x0UkFmWnM5UGJ2U2d1TWd3?=
 =?utf-8?B?cUxVMGJxN0lEUUxMYWVHV0F5YUZ5VzJONVpMcHRuVjlIck51QTNpbGZOdDly?=
 =?utf-8?B?Nmp4YjVqZXlUQndSWUN3akpNNXNkNitTZzAwdnVsYXN0eE5rbS9VVk56RDkr?=
 =?utf-8?B?QlZVeEMwem1MTksxeFlvTThEbnR4UWNXcVN3MFY1WXcvdUtQNjJhYU1lMUls?=
 =?utf-8?B?OThmOVBQNlpHME9FUlZSdy91V2xmQ3o4U2xHcWhXRENKYmE5QzdTZ3ZFdm1k?=
 =?utf-8?B?azlGaWlIWUl1eldidm9qdEx2Um5rUFhuNU1GbDB6dlI5L1RRTmdidFZHQU93?=
 =?utf-8?B?M3U0ak9rSDdkVXJic1RIZm16RmRHZnRINEtmOXdvc3ZqTUZkWGkrWlM5NGdK?=
 =?utf-8?B?UExIMkJkd1JFWmZwMUI5L2pWQnlaa1BTRGpXeENGR1huL0UzTjR1OXdaRkJO?=
 =?utf-8?B?SGhzQ3FGY2czTWZCVEZ6VDBxMHhNdEJDeVVkQVE5dWJPeHRqRzJHMWZKMTZU?=
 =?utf-8?B?dU82SVBQbktrSzdMd05hOXN4SGhTY054aFE5bVV3VzM1WWlQS0dOTmo2eVUr?=
 =?utf-8?B?bU8vNlAvYlBmVklNUldaT1RWcU9hR25yNVFHbUxpYjNtNlhPNVdJTVF4dERX?=
 =?utf-8?B?VmNCa1J6ZzhxZHN3THRSTTdKZG5GUW5pcW5kbHA3cVA5d0dCOXVIQU1oNWN6?=
 =?utf-8?Q?/VybU07d0QlsB6GKS/mHYhE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEE0128004D1244D91872AE74BBFFBDA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bd2824-d49a-4b64-c8da-08da5ff4b3d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 08:43:01.9472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vo1irYE4Z5vR8CroycHTOLoLgFJ2X1Xo/8VYberiujuHQALMYpybMJMC2zGiwh9Yze4RyahO5jQW5gt87lqB4nlALKZL2DblodjpZB1znXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2630
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
Cc: "kernel@pengturonix.de" <kernel@pengturonix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA3LzIwMjIgw6AgMDg6MTQsIFV3ZSBLbGVpbmUtS8O2bmlnIGEgw6ljcml0wqA6
DQo+IEJ5IG1vdmluZyB1cCBwbWNfdHlwZXMgYW5kIHBtY19tYXRjaCwgdGhlIGZvcndhcmQgZGVj
bGFyYXRpb24gZm9yIHBtY19tYXRjaA0KPiBjYW4gYmUgZHJvcHBlZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3Jv
dXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84M3h4L3N1c3BlbmQu
YyB8IDQzICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
MSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvcGxhdGZvcm1zLzgzeHgvc3VzcGVuZC5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jt
cy84M3h4L3N1c3BlbmQuYw0KPiBpbmRleCA2ZDQ3YTViODE0ODUuLjMwYjc3MDBhMmM5OCAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84M3h4L3N1c3BlbmQuYw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzgzeHgvc3VzcGVuZC5jDQo+IEBAIC0zMTksNyArMzE5
LDI3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fc3VzcGVuZF9vcHMgbXBjODN4eF9z
dXNwZW5kX29wcyA9IHsNCj4gICAJLmVuZCA9IG1wYzgzeHhfc3VzcGVuZF9lbmQsDQo+ICAgfTsN
Cj4gICANCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBtY19tYXRjaFtdOw0K
PiArc3RhdGljIHN0cnVjdCBwbWNfdHlwZSBwbWNfdHlwZXNbXSA9IHsNCj4gKwl7DQo+ICsJCS5o
YXNfZGVlcF9zbGVlcCA9IDEsDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS5oYXNfZGVlcF9zbGVlcCA9
IDAsDQo+ICsJfQ0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgcG1jX21hdGNoW10gPSB7DQo+ICsJew0KPiArCQkuY29tcGF0aWJsZSA9ICJmc2wsbXBjODMx
My1wbWMiLA0KPiArCQkuZGF0YSA9ICZwbWNfdHlwZXNbMF0sDQo+ICsJfSwNCj4gKwl7DQo+ICsJ
CS5jb21wYXRpYmxlID0gImZzbCxtcGM4MzQ5LXBtYyIsDQo+ICsJCS5kYXRhID0gJnBtY190eXBl
c1sxXSwNCj4gKwl9LA0KPiArCXt9DQo+ICt9Ow0KPiArDQo+ICAgc3RhdGljIGludCBwbWNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wID0gb2ZkZXYtPmRldi5vZl9ub2RlOw0KPiBAQCAtNDA2LDI3ICs0MjYsNiBA
QCBzdGF0aWMgaW50IHBtY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpDQo+
ICAgCXJldHVybiAtRVBFUk07DQo+ICAgfTsNCj4gICANCj4gLXN0YXRpYyBzdHJ1Y3QgcG1jX3R5
cGUgcG1jX3R5cGVzW10gPSB7DQo+IC0Jew0KPiAtCQkuaGFzX2RlZXBfc2xlZXAgPSAxLA0KPiAt
CX0sDQo+IC0Jew0KPiAtCQkuaGFzX2RlZXBfc2xlZXAgPSAwLA0KPiAtCX0NCj4gLX07DQo+IC0N
Cj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBtY19tYXRjaFtdID0gew0KPiAt
CXsNCj4gLQkJLmNvbXBhdGlibGUgPSAiZnNsLG1wYzgzMTMtcG1jIiwNCj4gLQkJLmRhdGEgPSAm
cG1jX3R5cGVzWzBdLA0KPiAtCX0sDQo+IC0Jew0KPiAtCQkuY29tcGF0aWJsZSA9ICJmc2wsbXBj
ODM0OS1wbWMiLA0KPiAtCQkuZGF0YSA9ICZwbWNfdHlwZXNbMV0sDQo+IC0JfSwNCj4gLQl7fQ0K
PiAtfTsNCj4gLQ0KPiAgIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHBtY19kcml2ZXIg
PSB7DQo+ICAgCS5kcml2ZXIgPSB7DQo+ICAgCQkubmFtZSA9ICJtcGM4M3h4LXBtYyIsDQo+IA0K
PiBiYXNlLWNvbW1pdDogZjI5MDZhYTg2MzM4MWFmYjAwMTVhOWViN2ZlZmFkODg1ZDRlNWE1Ng==
