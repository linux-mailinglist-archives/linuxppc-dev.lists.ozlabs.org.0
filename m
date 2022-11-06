Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B9761E4B8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 18:15:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N51GC069zz3f3F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 04:15:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=SB0LcgYv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.85; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=SB0LcgYv;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120085.outbound.protection.outlook.com [40.107.12.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N51DB0YFXz3cD2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 04:13:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4GScZicQGNMbun9fZlyFUjxTtQ9el3bVbYO1q6mriGsneCI0b8WX79POopJSrm+7jdDa3n9rF3JsCl6Fi0gbLZ5TRjTKd4UlPTj27FwmgaWDRjBXY8jLS0xIySIcrp1HI79u1Dok+7s2M8neA/Mqqna21vjOc40/NhCSiTOLtlyzy9cYdT6et1bhl3yyS6CUxQ+PkQTdVJ1N5sdXaJ27/eJMzGVRVJVMDWRsL0iJXhzM0R8aQ4K1NSer6kLHj3pwBHwt4g/yPHu3HiaSRwWVqimaWvBrVVFMRZO4AvCu6ztxaf9+n+HFUmVKjOl8Kmj73cILLueNQUlQyxeYSnekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqppGyX25iYByRNYAyP/L5G0NW6hViQjqcgdD8iggJc=;
 b=ibCmYCzo444PKAsh9MltqQohuZx9koFFA1rXkUPUhYZ/0RW4uqfRI0vVsWXORcwfE4E25LEqgMDYxMldrWlEbytXuMN4ktBpThooxGZhi3DU0jOuSV0RTa/yJrWjk6eL5PSibjnCx7MZfcuizXLElCERuDYWQOoGfU4b0noSeZrmsLQJLzzME1wEbnxBlzgbSlh2vqRiEosoM76oM87VhEMTSrvp0HAxwPgp3j7J+4h6mxwqY2wzlmANp2ImNhXdEzZhyKw0towlhA0O/WvWxbfH7UQ3Ee+WFaqXVKSl4LzUmDcTtmWWM0j5osoALpxXU/9bpR/FZyeaalGTj0GLUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqppGyX25iYByRNYAyP/L5G0NW6hViQjqcgdD8iggJc=;
 b=SB0LcgYvNLZP7yHNHoojk9RYh4RIwaqilvZckJ4Y+L8BEv07yo0d240qmm2DY/Zk0Zzz7cX62GvT58Gs931vx/SryFNlIcwBUNzZzZEC2z0xg1yIWtLdzHryRSqhdzDmzv8C0fqm/5KF2izsjBaLKGfcpbl/4BwRFCLkMd1Xkal2B4iFhsnOguUfc+mFcY4j1JizLqBK+Sg0JoGBjdLf0gAJMUz/XRA6tSedrQvGX24bNpqI0b+btr8HQ3SaVrtAuOrBSxbQ6Z9tWhOedtnH9caZHG0peOBF2ETxM5DO1Fvf6/+KuPw9qY0zNd3aaFZlebKHwM/daLaarFYCZp+Njw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1657.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Sun, 6 Nov
 2022 17:13:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%8]) with mapi id 15.20.5791.025; Sun, 6 Nov 2022
 17:13:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "wangkailong@jari.cn"
	<wangkailong@jari.cn>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH] macintosh: Fix warning comparing pointer to 0
Thread-Topic: [PATCH] macintosh: Fix warning comparing pointer to 0
Thread-Index: AQHY8foL+picuDSHYkG34nuBIYkWEa4yIjMA
Date: Sun, 6 Nov 2022 17:13:35 +0000
Message-ID: <ba17991a-0e66-11f4-1480-2663e71c70c4@csgroup.eu>
References: <c31207c.c3.1844d85a6aa.Coremail.wangkailong@jari.cn>
 <f4c81b9a-ba70-3dea-e4f6-9ff62a3e27e8@wanadoo.fr>
In-Reply-To: <f4c81b9a-ba70-3dea-e4f6-9ff62a3e27e8@wanadoo.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1657:EE_
x-ms-office365-filtering-correlation-id: a48b2826-68fe-4ac2-19e6-08dac01a3d72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IErPG7AvQC1WIDJbwM5NbpRxzyfcVHFP/rlWf9Ln7TSUTxfv2Ffj/nBXTkePnsd/KCHINfziP0wclxJljjPiY1jtEGV/rFuk5qjpP3JWpOzz0wgH/DtMs8cE0+/Xb1qxe5VG2bbVfdmCIB8k2PKIMo/v3liHY/o9VUzFaR7tafzlqyS3VKRgFookZJd2aFbFPLcquOoKYjME/jqPuuL+p7honF44MGNHW87AAC5/Qmozdfwn2YPRqdZ+7WhZVGijRo7LcJCcyZfD/gVGf3a/9twX78HD56dQINjP0E1ACxTegLsbOKEve8j6hdeBC8+xlEbXqbHzANUD9iPvgqOAlRE2ZRuFBHMo4VMgW5D50vBfrPgdG0oarehalSmFl+eTv26rkLkV3d1gpi93Dvex3MJF4PVDxXuuFBFvHYLWYr5Q58VZ6xeSvhAhf2y7oHQooov6mgWNG5HzgLX8UrOoTbJzyzl6flWWQKNMI6iyR6tvuZGVxhJs8U8hYLY8iqjd/0GgKid+nkS3rjnUdodHoGUltRos3aBK5nQATqB0vU6EBMCUke30koQnSAtU8nmmPCXjRK+UDVSNsiulsupzYEO6CAZUhsX9foRtXllNDBJkOxE7DOdk0K63jOo6arAIUJZr4/1CsQQ0U6c1j3vL4lmt8PQp9F/1QffO9SMu0WfLLbq9EAGYVMz/eJLJ9SeGpHSLcJJOO+xcKExPa+kCflgfalQhvtm1lCGvMEGlc4W7XMKsIsDEssWrUD55SZxKfB3WP1tnG0r0u5wI2v2dKmgfg99XTQSxunx2zOQxH9rARZJl+x+9bRvtnOwSlvVllkUKyN1VgwkdzyIFPtND4rGD/BAcG47nLqEiyu0EhV8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39840400004)(136003)(396003)(346002)(451199015)(83380400001)(66574015)(8936002)(5660300002)(41300700001)(44832011)(86362001)(478600001)(31686004)(31696002)(36756003)(8676002)(6486002)(76116006)(2616005)(91956017)(186003)(26005)(4326008)(966005)(71200400001)(54906003)(6512007)(316002)(110136005)(122000001)(66556008)(66476007)(2906002)(38070700005)(66446008)(6506007)(38100700002)(66946007)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TXU5WFlyQWVyZWV4Y21GdVNNSE9qZmVSUE9LYUJqa2VkaE43RnN5c01SMkNn?=
 =?utf-8?B?L0Vrak5td2NMMVNsZjZjck5VdHI4QXlvM2J2MnVZUVpDenJnd25qZDM3T2Ex?=
 =?utf-8?B?V3JrT2g3WlJCVWhoNGg1dExkUnk1YWFRclhYcmdyNTJrKzB0QTlIYXJIMXRY?=
 =?utf-8?B?V25Kb0tZQzhCa3h0UG5yV1h2R3dvQzNRaXV4eGlrSUhjbGFKbjYyUjJGdmJl?=
 =?utf-8?B?ODl0bVFCOEd5aDZmK1JuTWhtL3Jud0dyZXJSVXRDV25Db0ZrYnI4ODMvWnc4?=
 =?utf-8?B?UW1jSXJsSmJNZWcrU0psaDRCWHlucU5XZWZGczRjS1hKQUs0MlVtZlUyTmZm?=
 =?utf-8?B?YVBGSTNUM3NldUlsQ2Y3VEt1ZWVqYk56QXRnVGdvME5UdjFmOU5zTmhRc3JO?=
 =?utf-8?B?MDc5d2l2SG5XTWN3WEhheWkzTVhBekxVeERhQ0pja0M2RHRoV25XVXNLRzdm?=
 =?utf-8?B?WnBTSFdMRUltQ2NQYk01dDNFdWtGNTB5NWhMN0NTcVozcy9kdm5ZZ0lSSzlm?=
 =?utf-8?B?cGFVYVhlNlhuZFp1WVlic2oxOHRhdThHd05vakVSMk5aa25wNzZmUUpTL1Bn?=
 =?utf-8?B?ZWo5RXlQOUN2Mjg2M0ZBc3NXbzNpYmxUbG42MnU0TFFtcTdROFJ5aVZKbnQ3?=
 =?utf-8?B?REo2a0NPV3Q3TUhnSkNNbVBVRnIvUjRyZjMxUExqYXlDL3pTb3pLbWowSHFz?=
 =?utf-8?B?ckpRNDFxSHk4eSsrVG0rTEJyeHg4WTRYSkJlRkNnWWRoTS9idXFxNkE3YVp2?=
 =?utf-8?B?SngwQUxobDVkMklvQ3pUZmV1djFoWDU2K2FTZnAvNWdCMnF0SkpOcWxtSW4x?=
 =?utf-8?B?TW84dmZORnNsQ25ZNEErWUVkWHN4WFE1OXcrVUYzOUNYWWFGaUVhMnJjczFr?=
 =?utf-8?B?STgxN2VuMmJPVVpIQkJVMkZNTW9LaDNvZmZhMWhwZyt0UGNzUkh4NlpIb1Vr?=
 =?utf-8?B?N0NPVE1pRCtrZGZpMWMrQzRhUXB1d3FnN3hjdlc3UEYycTY4NGhhWG5vSGdj?=
 =?utf-8?B?cVZyakJQOE5xUTFjcmkyT0t5OTZRYWxNaGVUYVpKQzV4and2amlpRFAzVGpq?=
 =?utf-8?B?VExaYWZDZGtJenNZeE55QXRyWS91a2k4SFhTMWVjZDlHbFkrWmFrcTFidVZw?=
 =?utf-8?B?VXl1L3JoWjZxNUg3TWFkUzM2Y0orNE45T0ZSR2pqWnFSUlI3S241UnJEYmFk?=
 =?utf-8?B?ZFBFSDdpYmpER1lyRFNKaCtRL3lKUndWc29FajhBZkNSY2hHWVk3ZXNKR1hi?=
 =?utf-8?B?Q1BWc1ZpMktYUFBMTWhtakFUNWs2QjIvQlRSdENZUDFxS1ZkWFZnN2lIdnlh?=
 =?utf-8?B?QWV6UzZzdjhzYm5oWTFucUcveTlCS1pvMGZxYUNNK0NSUk5VZHEvZncvbGFs?=
 =?utf-8?B?blVFVENyejdLTExBT0J3ZWZ6REFYaUJxQXNLUjFFRjZVQzM4TDB5aTBXQUdi?=
 =?utf-8?B?M2lYZjZLWk9pWE5zMU9rL2dwM3pRVmtaaFprRjl3NjFnNHByckxoQjJaY0FK?=
 =?utf-8?B?bDFEZllPK3hvMHlzdk5FdEhTMjc1WnNhQ0NvMW5ZZHF2cTZxVWVKSWs2bHdZ?=
 =?utf-8?B?S1Rsc2FCemhTMDFRV2lSWkczTngzNDBSOFMxNy9pNnJ4dnpLckdQWnQwMkpI?=
 =?utf-8?B?OU1XVzl0SWhxalBSQVQxZnArWFVueGxkdkMyeGhWcHBzTEZ2QngwRGgzTnBZ?=
 =?utf-8?B?TTluNjhqMnRid3NNZXgrbnNqa1BsZkZWZ21sb2wxRmtINDd6eEsvamhuSVRq?=
 =?utf-8?B?MU5HS20xTEpqQzJTdFR2cFNadlZKZDFDY0szRzJKQXF0TlV0QUFMa09xUXRL?=
 =?utf-8?B?eWQyWkgvK0YyZjFKYzJrS0lvZHdyMTV3cHhKRVpPMERLSXV1a21NMmZDR294?=
 =?utf-8?B?UURzdUJjN0xUTFh5YkswUjQ5bWJiem9oOE5CWDlJQytkdC9yMEMwdnQ3Y1VF?=
 =?utf-8?B?N1RUS1NoY0RUa1dzZktST29wSnlwWE56aDA4OEpkeEZxNkhNSjFRSzI0b2NX?=
 =?utf-8?B?T3RQK04yeCtITjlvdGZvaXoyQlMwcERvVjIzWHl4QW5SeWNpR1pNUnFLRCtW?=
 =?utf-8?B?VVV5STZaMzcrRW9XRzNHSEw5c216dGZLSVQ4RXdSRlFKNk0rYVBRTUJvcHlk?=
 =?utf-8?B?dE96OHpYR3ovay9TakRRSFlkcVlGbGxYdWswQ3o4YWFHSXdQbUtGR1ZwRXg1?=
 =?utf-8?Q?9LwAyvhzNOWihf9IrI6Ty3g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <821F77BD335CE947A681B2E267337F04@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a48b2826-68fe-4ac2-19e6-08dac01a3d72
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2022 17:13:35.8292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MKD5Xs81rM+QDVHdFgJfUG5Daqss8h73OFxuRiX28T+nygwNB7pYjDcTYxblOv7sYbUidCBMNgWXV8vlx3JUXXlTx5s/rI+mJPp5m5EJjyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1657
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzExLzIwMjIgw6AgMTc6MDgsIENocmlzdG9waGUgSkFJTExFVCBhIMOpY3JpdMKg
Og0KPiBMZSAwNi8xMS8yMDIyIMOgIDE2OjE4LCB3YW5na2FpbG9uZ0BqYXJpLmNuIGEgw6ljcml0
wqA6DQo+PiBGaXggdGhlIGZvbGxvd2luZyBjb2NjaWNoZWNrIHdhcm5pbmc6DQo+Pg0KPj4gZHJp
dmVycy9tYWNpbnRvc2gvbWFjaW8tYWRiLmM6MTAzOjEzLTE0OiBXQVJOSU5HIGNvbXBhcmluZyBw
b2ludGVyIHRvIDAuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogS2FpTG9uZyBXYW5nIDx3YW5na2Fp
bG9uZ0BqYXJpLmNuPg0KDQpXZSBhbHJlYWR5IGhhdmUgc3VjaCBwYXRjaGVzIGF3YWl0aW5nIGZv
ciBhcHBsaWNhdGlvbiwgc2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2xpbnV4cHBjLWRldi9saXN0Lz9zdWJtaXR0ZXI9ODM2NDcNCg0KUGxlYXNlIGNoZWNrIHBhdGNo
d29yayBiZWZvcmUgc3VibWl0dGluZyBzdWNoIGZpeGVzIGFzIHRoZXkgbWF5IGFscmVhZHkgDQpl
eGlzdC4NCg0KVGhhbmtzDQpDaHJpc3RvcGhlDQoNCg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL21h
Y2ludG9zaC9tYWNpby1hZGIuYyB8IDIgKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21hY2lu
dG9zaC9tYWNpby1hZGIuYyANCj4+IGIvZHJpdmVycy9tYWNpbnRvc2gvbWFjaW8tYWRiLmMNCj4+
IGluZGV4IDliNjNiZDI1NTFjNi4uMWMxYzM3NWE4MTdkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9tYWNpbnRvc2gvbWFjaW8tYWRiLmMNCj4+ICsrKyBiL2RyaXZlcnMvbWFjaW50b3NoL21hY2lv
LWFkYi5jDQo+PiBAQCAtMTAwLDcgKzEwMCw3IEBAIGludCBtYWNpb19pbml0KHZvaWQpDQo+PiDC
oMKgwqDCoMKgIHVuc2lnbmVkIGludCBpcnE7DQo+PiDCoMKgwqDCoMKgIGFkYnMgPSBvZl9maW5k
X2NvbXBhdGlibGVfbm9kZShOVUxMLCAiYWRiIiwgImNocnAsYWRiMCIpOw0KPj4gLcKgwqDCoCBp
ZiAoYWRicyA9PSAwKQ0KPj4gK8KgwqDCoCBpZiAoYWRicykNCj4gDQo+IEhpDQo+IG5vLCB0aGlz
IHNob3VsZCBiZSAiaWYgKCFhZGJzKSINCj4gDQo+IENKDQo+IA0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRU5YSU87DQo+PiDCoMKgwqDCoMKgIGlmIChvZl9hZGRyZXNzX3RvX3Jlc291
cmNlKGFkYnMsIDAsICZyKSkgew0KPiA=
