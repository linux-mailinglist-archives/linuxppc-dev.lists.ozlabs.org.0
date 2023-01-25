Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 343AE67B3D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 15:05:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P25Fn0LV7z3fB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 01:05:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gLdasYd6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=52.100.177.239; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gLdasYd6;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01hn2239.outbound.protection.outlook.com [52.100.177.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P25Dn2Hw1z2ynB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 01:04:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkq+yTjcRw9jGA/1dNsaYv8mjcZjVfAHWfi88EciSVY/rCKYdYn6Tz+StjB2nznXiL280jTg1H4orUAhNAbqIgCmZKNz4wCiafEEjoke/wP0uqfmtaEpeEFIdppzTAdRapFCNleGA1XxdJXPEAssJ63RIa3fwlGcqON4lRG04gfok6Bd3Px9zTlBzMN4j29ln4wdiUsGzMmPprxRIWq+MkliSzMLJT8/n9CHcTW9J0pCbZCGMCCebfK5BzydPjk6BhH0i/MPHPqqFlykhZn0NVJftFniA1NMz8adHIqpHnHEWqowJD8pAMJXJvC9E2u+G42+J1oA5foMxZq2z8+zoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko14XxoFVSRX7AWWVdfPW/tF2Izt61W8mOgza1bmnbM=;
 b=TRd00YybAO//xd3WwFMu3PD/rp7Td+pCI2qUr5GtkE4ehbLOjcfzgkLDc/uBAumBXl5ZLHWNlLHp5K8ILzYFvYXEA6GSoWVHXiYtxcanJ4Vwd3i7QWBD8jFJlTpmVCMS7eiL03YUODXjVZMwj+8cOkM1GoitsBd2epi/hgifW29chcpKH15DwmL5Foqg442FpnTfN0ZtbZUSBI67glM0VctlzvKxSKTzew0nUMsKyf1kWFTayce780AsBnx+ByIDB+0RcpE5otqIu/OF3s1G1NL93mPvAiluIyJ9wvrYsjkEVda9MJuDZnmsXFHYfd0kZMJU3BcgZ6yJU6qtorm/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko14XxoFVSRX7AWWVdfPW/tF2Izt61W8mOgza1bmnbM=;
 b=gLdasYd6lE5ONnPoDLBzt/xj5fpLYR4jiYPIq2rNOBbi58nShcHesVlTyyDDCY6x10QGPaUZ203JblwtX9hI63hmobZjJYzZlFHn8lpui1HFooUjqz5IcU8HX6XnR6/PcMzBvYOSzFq7P1GfJT5Cyu7L+da0ua5Wc2L1LtUhkeoNQ6kz6TzUwtQZfoN6PmS29AFovXGntNGn2TGQQMWQq8SKsG0ncqyr6zw1srcvIpd+7pjP/0rJSXwnehNJmsO9nR8JiUsOJMY/6j0DKUTTzsq3+HbBLPHsL1srsnTTNPfDWO95wLTOy70zTa5Y+a8FUgW0K8XPPYRV8h1Fyr+I1g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3300.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:43::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 14:04:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 14:04:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ganesh <ganeshgr@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [RFC 0/3] Asynchronous EEH recovery
Thread-Topic: [RFC 0/3] Asynchronous EEH recovery
Thread-Index: AQHYsSBSmuGccO5pVEG8GG5wUhviIq3LYSsAgBUU0oCAz7OBAA==
Date: Wed, 25 Jan 2023 14:04:00 +0000
Message-ID: <51d42778-c0d0-1326-6908-ed354c45bcf3@csgroup.eu>
References: <20220816032716.108297-1-ganeshgr@linux.ibm.com>
 <YxFMJEWSfSBkcwyq@ziepe.ca>
 <f49d73c7-6f80-53d5-9a54-43ea2ace860e@linux.ibm.com>
In-Reply-To: <f49d73c7-6f80-53d5-9a54-43ea2ace860e@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3300:EE_
x-ms-office365-filtering-correlation-id: 28c7ca2f-d0eb-4da7-cfb1-08dafedd020f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  =?utf-8?B?SndhNzhtOXNBdmdBTnFkZkJNWmgwNnZPc1QrOUJ1Ti84UyswRFNJUnRpU1JP?=
 =?utf-8?B?ODZOTW9xSU13bjJSazhFdUExMWVmWXhxNTgvTHN6bUQ0bmEyTnNvbDZoSDFD?=
 =?utf-8?B?OU56U2ZybWRNclRFWGJ6NzFxS090UUI5RDZmVEFMRjRCUTZCRE1NcnZNb1dJ?=
 =?utf-8?B?VTE5OW1IMU0reWtoZnhEN1JVSmd6SjhmZDVuckFoNWVIeElMYWJ2K0d1M1M1?=
 =?utf-8?B?VDFpbmpvMnhBZWJWRWFRR0YxbWhHcUpjSHhFQTBpcG81dU0xMG9TdWUrSUJ1?=
 =?utf-8?B?UXhrL0k3T3dUekluRlhMZHhEK1VXQ0VmZHY2RkNMR1FqRUlJa0xtbi9za3ZK?=
 =?utf-8?B?aFQwK2hOSXg0REl6MXVraW5tNmxzSXJQNldhMExLSjV3Um9qQk5ZemdLMDNp?=
 =?utf-8?B?TzJ2K2V3aEszOXVtSzNwWW96dEZuUmNDZHNxV0xTeTZmaVhnYkZwNnNRNXJq?=
 =?utf-8?B?aDJtM2JKdWJHK3JGMkQrNjBBR3kzL2FmcG5XVHVjdDd0QmpVYlN3MkVwRjJa?=
 =?utf-8?B?MGhQVGlCaVNBNlVGcVVJbFNDZ1RPRDVhUXFvait5dldPcTZ4YnRIbHJmdFda?=
 =?utf-8?B?VVZ1TXE0bnFOaCtGMWF3MTlLODA1QmJhOGNCMCtzbjJrR0FsTTI1Z1pEUEJQ?=
 =?utf-8?B?c2NXQ2ZQNmllMjhrMEQwMThMOXZWNUlVb1ZqOWpOWnlyVFQzVW0weTM4d1Ju?=
 =?utf-8?B?UTUxUW5IenZqZW1xNm9Na0Y0REtYRnhVSTkveEtNK09seFBYd2RxYnY4Ly9U?=
 =?utf-8?B?VWk5ZDU4L1RjSjZGbUlvNTRXVkpsYkMvYWhaK0ZmRjZieWlKcXdtNUR4SnZZ?=
 =?utf-8?B?WmcyenRjK3F5c3lHNCtMc3ZtdXRhWnJkZmd5OGlzRlF2aEd3dHgxcjJPKy92?=
 =?utf-8?B?aFlFZzFSaGEwRisvcm0zQ1JKZFl2K0VRb2hPT2JITFI0V2FMNGdPRVlRWW9x?=
 =?utf-8?B?cXhHdjJJRXpzL014R1JDL3JDM0V5VWYwT2o4TkdSSGtMMTV2S1JMUDF0RlVN?=
 =?utf-8?B?MVlLSS94M3hTZUgzN3Z5b0JCRjFpaVE3RHp3QVdYaVNWd0hMaEZvQzZ4V3Bq?=
 =?utf-8?B?NnFBODlSN3NQejdiQXRId3lqYW44TW5EczB4SWNZOFBXNmdLdmFza1ZHSFEy?=
 =?utf-8?B?eDNvTHMxS3VrY2hmUjllZWlPME5YeCtYUm9yQi9WaC9WdTV6TFVTV1pOcHlC?=
 =?utf-8?B?WXg5bExONTdnY3BHNm8yTXJ5VjZKUVdBVnU2amZOdTR6UU1ENDFweU45YXdI?=
 =?utf-8?B?ZDVpRks1NmRETWNpeE1WUHc4SjR4bTZTakFSYkRIaGYrUXFVZEt2L2xqZWJL?=
 =?utf-8?B?L0QvTUs2Q2p6SHJWNzZEN1BreVhkY2pFcm13SVM1cHVBYTdsOHhIcVF6U0dO?=
 =?utf-8?B?UHRvdCsza1Z0ZVlwTmV3T0l6QUhSNTBxWEpWWFpTZHI3djBLb29LanBmWU1O?=
 =?utf-8?B?UlU2YVZvbmFPYzBtM0xIN3hDZHRFUjhPSlFqa29POUwzNzRZM1dpTitFQlpi?=
 =?utf-8?B?UENZVnVMK0ptZHlaQmxIRlV6dXkxMUp4THl2cHBnWnNxclVuVWp0TUNqQyts?=
 =?utf-8?B?cWdKQWx2QncxeW1XWjRmTkwxbmQrM3I3bEN1SVY2ZkE5RWI2STNXK3FCUFRh?=
 =?utf-8?B?UjVEajFGdkpZNjhUOXF6bzB4cm1GejdoSUtOb1ZTRFE3TlhjWDFVYTFGYkJW?=
 =?utf-8?B?UXNvZWJQSElXWGVPSVdXNldFWG8xMndIZjcwSDRtaGhwNFdvTFU1VXZrQlEr?=
 =?utf-8?B?UExMWEJ2MnRXbnM1QkhLbzBGRHRoeFRjMkNEM2xzMTlYcEZsL3ZVODNPb3JZ?=
 =?utf-8?B?aTI5c1FDbG5wS3ZOK2x5R0cvQ0Iyc1FvLzBuWUF1YUV2WTZrYTZRZjEyUElp?=
 =?utf-8?Q?qMUSJCfDXLIQ6?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39850400004)(366004)(451199018)(38100700002)(53546011)(66556008)(2616005)(66446008)(54906003)(64756008)(478600001)(66574015)(8676002)(186003)(66476007)(71200400001)(31686004)(6486002)(36756003)(31696002)(91956017)(122000001)(76116006)(38070700005)(110136005)(66946007)(966005)(4744005)(2906002)(86362001)(41300700001)(26005)(5660300002)(316002)(6506007)(6512007)(4326008)(44832011)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1501;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V2lTOGdmdWZWamlRMEM1cWQrdFp2eGs3VHY1amRzMmZMcmtxYlQ0cVNGZFZJ?=
 =?utf-8?B?VERhUkFiWHg2ajhDbHFFZUtJSjV0UlBBYTNmdzJLNVFhb3NCTkxWclN1UHV4?=
 =?utf-8?B?UmNVV2VLRUQ3WldDZHhiMWdHZUNmYm9NeHJucmQrSllaaEszd1gzNTFCU1p2?=
 =?utf-8?B?RzJJeWVuREtsUU9jcW4yaTZCZnpBYk8xZGVWZm8xQW5OTzlyWFhUWHc1eFYx?=
 =?utf-8?B?R21waGpxakNwM0pxeVZ0cDRTUmd6L0J0R0tVK1dwdy9kd3lKMFgvK3BVdUQy?=
 =?utf-8?B?c09Rb0E0UDhrNTVOcE9WNUowTlVJVE1nVmVBYjVERVFRS0ZWK0krRWVWeFh6?=
 =?utf-8?B?TXQ0Nk9PTWpGU3FadzZiL2dVMkl4R1hBaXBjaklOYVJ6amptRVFGbXN4YWxM?=
 =?utf-8?B?bmtqZzNramVRbXgveGhPOE5Wa016MlhvYzM1Z0p5M3dYeGR3RGdhanRHUXVl?=
 =?utf-8?B?RlJmdlBSYmE3MVhJN1dkWGdPcURMMkI4YTd4UDdOMEN0NU1PUXVlVDhvbWZ1?=
 =?utf-8?B?clpBK0pIT3ExUkxXK3dpVDlnNElwUTJZRDRvQzdkZnk2SVc5aFMvWUFuTE12?=
 =?utf-8?B?RVRUdXpzOFVYTE5ralVKTURsVTU4VTNVbUExR1dJYkNKU1FTU2pjTGlCZFBt?=
 =?utf-8?B?M3FlVU83VDIyTEJsOVFnSk5yYkMyQTk2RTZmOFA5ZVAxeFk2b0JoOEJVQ0s3?=
 =?utf-8?B?elRzNzlrL3BvTmFVcmZzRTcyR2grdzI0bW0vQWxoZWl0RFA0NU9QKytnWFhi?=
 =?utf-8?B?d1lEWEJHeDdhMjZmQWVhN0trS0ZraWpzQjd3VW9tM1h5MmdOcklxMWJsZW5J?=
 =?utf-8?B?OHROTkZFVUVnUUhEbHI2SHBGU2c5dmtOekIwUEg3Y2xIRUNpSmFFY21pMTB2?=
 =?utf-8?B?TXl6clBMcXVMK0FSOG53Tk1tS3k5OER5MFk0Tlo0b3VhQjhKaUFVOFdua2Fk?=
 =?utf-8?B?c0Ezb0E2MDN4N3lxUlF6cHJCNE9yejU0MXZXaU11VEdNUmpCREI3TmdiclVn?=
 =?utf-8?B?eVEyck1pcDZ1RnZ4SVcxcGNoQ2YvU3BZZzNvaUV5cytlemlDSGRRQzI0WkR4?=
 =?utf-8?B?ZWVnV0VCdkFHdkhna2dRMjlyamJ2SXZnWlZSMzRzdmtVWG5CL1ZuLzNwRWxO?=
 =?utf-8?B?eTIxS2xYV0dGNEZWVkt3RHBwSmpnd1h0S1Vnd2QzY0Z0UFFORCtLSWxLRnpo?=
 =?utf-8?B?UG52aHBCQUJEcmdxMEpjb3dLZ3FpeHByNW00M3VNK3BuUXNsTFUxcGtWTUIx?=
 =?utf-8?B?WE01UkJwSDZVd0lqazZOZVIrUTRZNUhFdDFubksvbHNVOERVeC9zUUtTbk5a?=
 =?utf-8?B?N0NYSzJLZFZJZ2VEU09kN1JuNWtHUjg0TTVtYXpOQm1TS2I0Q1QxcVdTa2Mr?=
 =?utf-8?B?WlN3VUZVYy8rU1Jva1owNWVsREhTQWhoWWVIWmdxZkptZExlZTJGU2tDM2NE?=
 =?utf-8?B?OUhEN2NmVGlvbVYvbG5mZDB2allVcVZ5b0JQT3ZrSHc5SnhuUDByKzIvN3M5?=
 =?utf-8?B?V2IxZ0dVM0tqVS9iUnV1bDhMUEhnclZ6MjJ3VW16MzBUcXUvL0FQZzBsRkNB?=
 =?utf-8?B?aFJnK0d3SkRUU3lCVUpWV1BoTjl3UUhHUko2K2VVVDZaZ0kyY3BId2J6THNq?=
 =?utf-8?B?Q1I2ZnArRjcxV3hVaS9UWWhEdXRpdmFWUnNVQXhSV2JlanJlTDJnR25XNWJy?=
 =?utf-8?B?TW5rOGo2eEw4VVF6dW5xK1Y4VVk2cVM1cEpZT0NaK2lGZVRueDlMaVhrWlh4?=
 =?utf-8?B?NUlMaDRLcWJHWW1rM1lWYjhuMzJ2ZmxaTGpWWmsvVmZ6ejF1RnE4S1NpM21L?=
 =?utf-8?B?TVpUQVNWaGsxdWxVWkk1dVpuSXlQWiswSVg5SWdRSjRidHU0ZTY1L1hmbnBs?=
 =?utf-8?B?RXR2S2xHTUlTWXdzWlFLZkpOSzRwQTBDMDBZaEx5OFBOQWprc1Y5bnhMdExZ?=
 =?utf-8?B?bnZzczZWT3p5Mll6SExPUUtCOWora3owNTgzUFpjbVBPcU9FMzRMeDVndVlE?=
 =?utf-8?B?LzVBdVZMd2ZRS25xL1RWWWdsZmlXSDZLU3F4a3dWenZYRDJpTTBxaGpMK1Aw?=
 =?utf-8?B?My9oMnkyVVdyd0pYTFNxWjdSYmR0V3R6MnBNWklEcnNBT3pYRzVyUVIwSU5P?=
 =?utf-8?B?NmoycWdMTCtPY1lGWWxrQ2oxUGFWUm55RlZtMnFBdjBnVXlid2VGUDZCT2dF?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05069CCC7B2AC042BE53C99BCABEA521@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c7ca2f-d0eb-4da7-cfb1-08dafedd020f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 14:04:00.1696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0Ylk5UiCznxGwUdhW7SyM6+uF+ax25IIRk/QNrbH5ZVbDH++w5Lz7PpCrHEg/fmuIe6WKqGQgn3KFAfFL88pB2ge1m7Tp8jS0LmHR3NNVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3300
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDE1LzA5LzIwMjIgw6AgMTI6MTUsIEdhbmVzaCBhIMOpY3JpdMKgOg0KPiBPbiA5
LzIvMjIgMDU6NDksIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gDQo+PiBPbiBUdWUsIEF1ZyAx
NiwgMjAyMiBhdCAwODo1NzoxM0FNICswNTMwLCBHYW5lc2ggR291ZGFyIHdyb3RlOg0KPj4+IEhp
LA0KPj4+DQo+Pj4gRUVIIHJlb2N2ZXJ5IGlzIGN1cnJlbnRseSBzZXJpYWxpemVkIGFuZCB0aGVz
ZSBwYXRjaGVzIHNob3J0ZW4NCj4+PiB0aGUgdGltZSB0YWtlbiBmb3IgRUVIIHJlY292ZXJ5IGJ5
IG1ha2luZyB0aGUgcmVjb3ZlcnkgdG8gcnVuDQo+Pj4gaW4gcGFyYWxsZWwuIFRoZSBvcmlnaW5h
bCBhdXRob3Igb2YgdGhlc2UgcGF0Y2hlcyBpcyBTYW0gQm9icm9mZiwNCj4+PiBJIGhhdmUgcmVi
YXNlZCBhbmQgdGVzdGVkIHRoZXNlIHBhdGNoZXMuDQo+PiBIb3cgZGlkIHlvdSB0ZXN0IHRoaXM/
DQo+IA0KPiBUaGlzIGlzIHRlc3RlZCBvbiBTUklPViBWRnMuDQo+IA0KPj4gSSB1bmRlcnN0YW5k
IHRoYXQgVkZJTyBvbiA2LjAgZG9lcyBub3Qgd29yayBhdCBhbGwgb24gcG93ZXI/DQo+Pg0KPj4g
SSBhbSB3YWl0aW5nIGZvciBwb3dlciBtYWludGFpbmVycyB0byBwaWNrIHVwIHRoaXMgc2VyaWVz
IHRvIGZpeCBpdDoNCj4+DQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0vMjAyMjA3MTQw
ODE4MjIuMzcxNzY5My0xLWFpa0BvemxhYnMucnUvDQo+Pg0KDQoNClRoaXMgc2VyaWVzIGRvZXNu
J3QgYXBwbHkgYW55bW9yZSwgZm9yIGluc3RhbmNlIA0KZHJpdmVycy92ZmlvL3ZmaW9fc3BhcHJf
ZWVoLmMgZG9lc24ndCBleGlzdCBhbnltb3JlLg0KDQpJZiB5b3Ugc2VyaWVzIGlzIHN0aWxsIHJl
bGV2YW50LCBwbGVhc2UgcmVzdWJtaXQuDQoNCkNocmlzdG9waGUNCg==
