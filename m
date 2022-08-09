Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73158D7AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 12:53:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M290g70mgz30D0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 20:53:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=2TUUCe3+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=52.100.177.235; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=2TUUCe3+;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01hn2235.outbound.protection.outlook.com [52.100.177.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M28zt3lVRz2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 20:52:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/TMMQzEo7l/LWkWFYaPZDOhonPOMcaex526SfGXjogWXw4n1omLUsYJy3IpM+KH9kwSXvkITNqWTHUcZBXcotyWE/yY/XnqVKwMAJdE63tJgYnjGa6UVS2/wyLc9a7C3/kf9Llmm89l/QqxBqTB3MxvybquZg/MDftG9NSj1Ahjynj23uvgxsUHQHCW3+IiVaJSPHNtspP0M9rDzgA1pPSS6Pgg5j7zjCAQ6a2lizaFn+B0+09IkZucpaE1vggPt2wbS8jXf2j+cOdNQe8iVSP1Q0LDMQuPSYvErL+HFMRSdOYj5acnpL0GqRA2vdR5YigMDkQttvhbNn42IJap7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZ9IkI+UMkcHx1DEUp79Pj5EVawwx0T6B3l1cfktbDA=;
 b=ClSnIA2Xp0sCyIp110WaRRP4qxiGsYPt/v9TXf0Pp7NTb6gVXW8hOIIR0lBg45kBWrPOw11p9P8ekOjbo4L5p+KoUbzkfmXxbd2wO8T2766McroonASa8DKCBGmkXA6PfyIh/v91fxiw6WfD7wfsYoDlmJMdBD7Yv3XIuTu0G6T6W7rGMySIEzZcoeBjtlQmzMwUslYq0qpTY2IRN/pAhaHRijIeDIXPQonhVtdi8ZUYVx1eSSHzOqw7gG03Gcn+5aZ2fMbJG416dcHTrgTnjN6UjU5dFrORwH+VTx+PfmEtTDJV/hCgkS1FZoI1JdabkR8xTON0pNeUBzwyc+/reQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZ9IkI+UMkcHx1DEUp79Pj5EVawwx0T6B3l1cfktbDA=;
 b=2TUUCe3+qmEOrruRs7CAIs8lECOExm1Xk3kyXNFSCHw6ZSHT1NLeKnP0A3IcrbW8j8whLFKqB3dLU4lYXPyNf9l1RgXLQEsYdXUF3KtwKHw+27ywzW3eu1ED6bjJ1iqVRd6Q0bb+a4dkEZcQAuJgdtr8XlzhhbDdbjLyYxMV0TQWgJ1lNpTTVpzkyPG4ewOJjccoLxFhwr0ULzmTZtFTrfO9zpl+4qlaybUIUxJAFGVFqy6Rvjfn8YfbQP7F3Z5Dy1U6Xm5FTmwb+ZCKhSg+3U/1VFeecT9/MAU3r/oOmSY7UL3JNLizibzZeQ0anpuEHGhXYjjHLL/nIrR9VyUY4w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2369.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:32::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 9 Aug
 2022 10:52:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.021; Tue, 9 Aug 2022
 10:52:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Russell Currey <ruscur@russell.cc>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>
Subject: Re: [PATCH] powerpc/kexec: Fix build failure from uninitialised
 variable
Thread-Topic: [PATCH] powerpc/kexec: Fix build failure from uninitialised
 variable
Thread-Index: AQHYq7ODena0GbjBe0q0dHWc08KKxa2mZNqA
Date: Tue, 9 Aug 2022 10:52:35 +0000
Message-ID: <0702c7bc-46be-d545-b6bc-6b789dfe5f0d@csgroup.eu>
References: <20220809054530.907974-1-ruscur@russell.cc>
In-Reply-To: <20220809054530.907974-1-ruscur@russell.cc>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 867f68d9-6d2b-4eac-af5c-08da79f544a8
x-ms-traffictypediagnostic: MR1P264MB2369:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  =?utf-8?B?dWgvNTZIdm56K3RXaEtHekUxVHJ2WHE5QkdYQmRkZG11T3RzZDhpcEZMQlVT?=
 =?utf-8?B?SHFkU2h1Y3pRdk1INTBDNmU1S1o0d3Y2TGMwOVR5SC9CcWprdDRidXJiVllD?=
 =?utf-8?B?bVE4NDB6TnNwTGVuazA2TWNsRjM4L2ZBTk5jNVdSUzlYdDhvY3JUa0xuczdB?=
 =?utf-8?B?ZjlEd2o0ejEvNW83OHBZZFlxOUp3Y0padkJIdzBIZHVPZnNPdnhLclBhTTJ2?=
 =?utf-8?B?dXRzTVp1dS9OUTNFSWxVNEZpV0V6d0pCZS92TTR6cldVckkxcGMzQ2hTMStO?=
 =?utf-8?B?TEpXTUhJbUY1czlpMEgzY2YwMDNPRDVNK2w3OWtBR04zZkdkRmZiVXdmQXhv?=
 =?utf-8?B?enZ2d0VrSzZ1UHZzVElvdUpkMk94dm5KQytPaThobEY4WE9JdEE5VjNKU05P?=
 =?utf-8?B?anZQUzJDTzJublAzaTFuWFpXZk10MEZzVnlZc1FZcDM0dWtoeG50NE1mNDMx?=
 =?utf-8?B?d3dCbjNseHgzOU9aTEd2SE93NG13OXJYemtWaFdYTjZ5WGNReGhQajRaSUJD?=
 =?utf-8?B?R3ZjWkhMRGFFWElaSEJYR1A5bHYwU3ZkY3BESGdER2JKOWY2Y3lNbVhqbits?=
 =?utf-8?B?MEtOejJvdE10TUhvalZoUUh2d2p4a2JMc29CWFdoakZhYTkwN3I2czQzbmhT?=
 =?utf-8?B?TWhuMFNjOHhOdzF1a01QTldFQkZUa2Y4Vis5VTZ4OE1sWSsrUXZxVmNCUnB6?=
 =?utf-8?B?OVB2OHYrNis1blovY014Z1ZUNzBQeEZtRVJ6eHBNcXlpZW94U1dMV2k2bzVQ?=
 =?utf-8?B?NmRnN3Q4dmphRXVMSGs2R1lNNUd5MGloME9EaEx2S1lFd3Q3SDBxZkZNa2lS?=
 =?utf-8?B?cnNraTZnRk1sWkhNTG4xT3ArVGl3OUdMRFNRVnRVbmpGc0RndFRpOWhUQWJB?=
 =?utf-8?B?VTlNV0JrdExsbXl6cmJYWGp3bk5lcmUxaEszRWh1NHFxRitmck9YZk9IdFZD?=
 =?utf-8?B?MkhIOTlWK2wwdzVkc3ZiMzhJcXptN3kzYWlGcENIS1hTQTRJTXJ0MkJUK3pq?=
 =?utf-8?B?TUxUZmN5UDhLNWZaRmpSTmt5L05jMnlIYjRNUnRPQmV5NDhHOXJ3aFZnUE1F?=
 =?utf-8?B?QmEzN0lBaGVnMnpMUEFRamhUcElIa1NFVnhWTFo0NlYzdHNkZ0FXc3Vac2x6?=
 =?utf-8?B?QmxzTTZWbVZjcytqeURoOWljR1dCSEFlSWJzaGZZcEk1bU84T1dVUjZsMzZ1?=
 =?utf-8?B?ekVVMTdHa2t3OEk4c0hvQUpGV3puaEpWWm9OQWtnY0lUd2tuUGMyeHc3SzRh?=
 =?utf-8?B?RUEvNTM3UDhPWTdZbUVxU1Y1WEk4ZW81YmFJSnB4T0FRaXU1K0xtdFdFRytT?=
 =?utf-8?B?ZHgzR0xZN0kvNTkvVlFxNE5ob0VkVE5ldDl5aFhwbEkyNE93b3J2M0srQWlp?=
 =?utf-8?B?WkNRTWZXeWR1TFJSVnRWTnhWS3k0RVhseG1WbXFhZUJsMVpBcndRZ2hyOVZL?=
 =?utf-8?B?c2FLMzBJdjcwbHh4NkovVXYzYUlHdXlZdmY2OXdCa24vY3pLUnc3UUc5NlFC?=
 =?utf-8?B?T2owYzNvVnAvekhSWTNVaEMvQ1FYK2tObTdJNVRNUTkrQ0Nud2MwRUljSHNO?=
 =?utf-8?B?bkNrMUpmbzJFQWlHWkhsMXRMRlBWQW12SFc3Nkg5U1FmdVFaZ0tLbjVoN29y?=
 =?utf-8?B?ODA3SG83eG5uTXJSSk5FMXR6dnRHd0QxNjV0MWJQTUdFVjJHOFEzWFAyRUxV?=
 =?utf-8?B?UDFKT3VoaE9aSGdhZ0ErQ25hL3dWdVVzbjZYZ1ZVVkxKUW5RSW9pbTAzWWNa?=
 =?utf-8?B?YWpTMk4rblZEVnRMd3JpUzI3SkllMW00N2lucWIxRC9zajV1L0o0T3p4cUhl?=
 =?utf-8?B?UzRUOFo3bVlKQVVwaXVhajhXMTV0VDJ4TVBkNTJPNURKaHNOMzZlL3l0S3h5?=
 =?utf-8?B?SFN0QXRnYjJyOFRITXNQU08yM2dXZkZmc0ErMjFmb08zRFFXU1BncEVpNnFy?=
 =?utf-8?B?Qk9zOERnOXdFQ0dUZ1ZSM2Vaa04reXJ5aS94MG1DSWhEWDVSZ1BFNmF3MENH?=
 =?utf-8?Q?vtEgo3aUXzQB8aIRzmNQZ2kwVVEQUU=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230016)(346002)(396003)(376002)(136003)(39850400004)(366004)(5660300002)(478600001)(966005)(8936002)(6486002)(71200400001)(66556008)(66476007)(66946007)(76116006)(91956017)(66446008)(64756008)(86362001)(31696002)(8676002)(83380400001)(4326008)(6506007)(186003)(2616005)(26005)(6512007)(66574015)(41300700001)(44832011)(38070700005)(2906002)(122000001)(110136005)(38100700002)(36756003)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1501;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WVBUNGpGV2ZhMnB4aXVJTWV6MlpCTVRkNlhHbEhsMVhxbzhZN0hkTWVEUGlq?=
 =?utf-8?B?dEp3WjNlK0toWjdWM1k4a0ZneWZTRUhLVFE4bW9zeEhaUmlnYWd1UFdxYlJ5?=
 =?utf-8?B?UmNYbzdlY1ZOTWdZSndoV1ltT3FBdnIzcGVUaVVZYTduUE9lajVOUE5VQXZq?=
 =?utf-8?B?WUduS3VlYnZRbGdRM3Y3dWxTVWk4cm5kVFl3czFiRmJwSmpjTzNyRlJidVFu?=
 =?utf-8?B?ckVsZTRnZEdnME9ZU096Z2xvUGc2Ly9nU0Y0UkxuclVZSGkzV0l0REpjZjZT?=
 =?utf-8?B?ZExTMXZOUlBoZksrVWNyR3NlUnFzaXpvWFExcndvZXBEMnhyV20wQWgvUWYx?=
 =?utf-8?B?UFRSUThSUGR1WHdoRVRjN1NZZHUrRmFnMDVxMlphKzlLeXJ4N2RDK2E5S2t1?=
 =?utf-8?B?SXphVlZiNWdxZXpGZ09iR050aTR1N2lMRjdUdDVRbzNRVEVVR3FPaDRZeXBs?=
 =?utf-8?B?Vnl2b1lPMEp5YXlFVDU2ZlRzd0h0blRHQ0I3cGxNSEJUK0xnNEluR0pvaU9B?=
 =?utf-8?B?YkZKUEQvcUxzRlh3TTVsYjFwSlhwTE5DSThSUUY5OEtkZkRERGNSOVN1YTF0?=
 =?utf-8?B?eUI1bnk5UnVCQ2kvaUFNMklrcDNYQlAwWW91V1ZWNTdwQkNhTDZMRlRCaE5y?=
 =?utf-8?B?ajFTekxnc3FXbS9VbE4vV3d3RXVCMndqUGY5eEYzaE5SUU5uS24rSHdTREpJ?=
 =?utf-8?B?bUdJb05xU1ZkRTAwakRKdDltKzl3VnRlUHNQVFE2NVFVZ0UvdzZpcFNMbHdl?=
 =?utf-8?B?NGVaSC9GYlU2RU9HNjRNb0ZlL1VBWFcwTnpZeWRSZytRb3pBcC9mWGZidmxV?=
 =?utf-8?B?V0k2VG1lcXhyQk1objV2Zkl3Q2JPWEx4YnJwU3M2cmhaUnBoeHVHNTRqemFy?=
 =?utf-8?B?K1R6MHI5dCtOU0UvbmY3cGtVTThDenU2Rlg1SXhuT3Nnbm5vTFFrY2VJWFBT?=
 =?utf-8?B?Qkx4dCs5enYxbE1zbmhvRlRpWjJFOUIyVGFmNGhvZ0JUdlAyVGl1SnVER21D?=
 =?utf-8?B?RmNTSUFzSzZUMnpBQmQ3bDZlYWlxUkFuM1ZheUp6OGZ2cG45YXRwNzhWa3l5?=
 =?utf-8?B?V2Y4Q0cwM2N0R2lHVXhGMWl5clNublp2OGJ3MHJ3RXYySThGZUZqVy9VUlJi?=
 =?utf-8?B?STBuSFhPZTZ0dTlQZnAvVHBsbXR1THhiQ0c3bThIOHhxSzJ3V0RERWVhQVVV?=
 =?utf-8?B?R2Vocm5rbFNRNTBOWjNiMUk4YzlxeFhkMldUWWFIY09VdkdKRHVKbU5xVGRF?=
 =?utf-8?B?SzYxaHcxMVRwMENyaGlkenRpalZLY2xVcnU3aS9SR1NVR3d0dmVTN0JWN0tZ?=
 =?utf-8?B?ZnQrbHVkZVlYT1pzTTZORGNRNkU4NmxpcGl6dnQ5YStGZUFNS3ZTTkU4c2xH?=
 =?utf-8?B?T29sSnpQL2MxUzliem10MGI1K3k2MDRndXhJaUZLN01iUWpGM05SWHFOTFhR?=
 =?utf-8?B?VFQ4K1JPS0JPZVRLMHNjenhvWWxhNVRVWHNaYnBWWmpqMU5JOHB3R2c4MjZB?=
 =?utf-8?B?K2dndEN2WXQrbzZsSnIvcFhvbmlRb0ZRT1dncm55a1JSaDRpcEZwZThUL3JN?=
 =?utf-8?B?bEtnVDVSckVGNUpkMUd4bEdTWklOQ2tZeFhHTVRIY29veEZreGlkMjRwLzc1?=
 =?utf-8?B?dWhGYy8xQ2pRV0xKSU4zMk9pN1dhRFo1cXZ3N3NwZGFyaUVERnBJOEo0NFhB?=
 =?utf-8?B?K3ZhZXh6MWw0OGJ1SC9XTE5Gb3l4cVZkbTNSd0hDSEdqYkFhNnl3QnludWt2?=
 =?utf-8?B?UzU3Ky8yOTFiYnBEWjNiY3dJMStEcTBJNytsY3RMNkprc1hNMWdub3ZKRzd6?=
 =?utf-8?B?NFVZOFJkUUtHMnpEQzd1UzhLWlJFbVpJN3cxa2ZsQkpoSnlCTndFTklLTWRI?=
 =?utf-8?B?eWdvaDFBbTJ2UXIvZ1BGOVg0K0pRWjlFU2crbW1qbzZCVmdpNGRsdjFQa1J3?=
 =?utf-8?B?S014VGNNMzk4MGt1U2NmaENlTjRkSmRsd0o1akZhRlkrMk9BRlBTV0FiVDlT?=
 =?utf-8?B?cWxZeUZCR21hUllqd2ZhYkVxWmU5ZExEb3M3MEJ5Z2tpMTg4REFpSEU5NGNx?=
 =?utf-8?B?VXdnSGdXWE5rUm9Ndkl1cnFFcGVWbVdrQ1U1a2lTSjFSZU5hUy83cWNmVmpJ?=
 =?utf-8?B?VXJERlk1QXI2QVVzSTdFZUZFaTJwY1FIOUdIb001cVVwVlRKeE1oMjFjaDl5?=
 =?utf-8?Q?GIwz2ehQr40jg73w72molIs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50D39F286952784D9FCE169D2A89DA42@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 867f68d9-6d2b-4eac-af5c-08da79f544a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 10:52:35.2045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q3Ql+vlUiVToettwlBBo1VsZRjTdSVpmZ80NgCe8C3pwiIOMp39/ZnvlSDNaOP7dhYcy2v4FtrXhfjYS0bb8Hq5Dd5BhC445ohJOqCVw0Ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2369
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
Cc: "nathan@kernel.org" <nathan@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA4LzIwMjIgw6AgMDc6NDUsIFJ1c3NlbGwgQ3VycmV5IGEgw6ljcml0wqA6DQo+
IGNsYW5nIDE0IHdvbid0IGJ1aWxkIGJlY2F1c2UgcmV0IGlzIHVuaW5pdGlhbGlzZWQgYW5kIGNh
biBiZSByZXR1cm5lZCBpZg0KPiBib3RoIHByb3AgYW5kIGZkdHByb3AgYXJlIE5VTEwuDQo+IA0K
PiBGaXhlczogYjFmYzQ0ZWFhOWJhICgicHNlcmllcy9pb21tdS9kZHc6IEZpeCBrZHVtcCB0byB3
b3JrIGluIGFic2VuY2Ugb2YgaWJtLGRtYS13aW5kb3ciKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSdXNz
ZWxsIEN1cnJleSA8cnVzY3VyQHJ1c3NlbGwuY2M+DQo+IC0tLQ0KPiBOb3Qgc3VyZSB3aGF0IHNo
b3VsZCBiZSByZXR1cm5lZCBoZXJlLCBFSU5WQUwgc2VlbWVkIHJlYXNvbmFibGUgZm9yIGENCj4g
cGFzc2VkIHByb3BlcnR5IG5vdCBleGlzdGluZy4NCg0KTm90IHN1cmUuIE15IHVuZGVyc3RhbmRp
bmcgaXMgdGhhdCBmZHRfZGVscHJvcCgpIGFuZCBmZHRfc2V0cHJvcCgpIA0KcmV0dXJuIG9uZSBv
ZiB0aGUgRkRUX0VSUl8gZGVmaW5lZCBpbiBzY3JpcHRzL2R0Yy9saWJmZHQvbGliZmR0LmgNCg0K
PiANCj4gQWxzbywgZGFtbiBpdCBBbGV4ZXksIEkgbWVudGlvbmVkIHRoaXMgaW4gbXkgcmV2aWV3
Og0KPiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0
Y2gvMjAyMjA2MTYwNzU5MDEuODM1ODcxLTEtYWlrQG96bGFicy5ydS8NCj4gDQo+IENvbnNpZGVy
IHlvdXJzZWxmIGx1Y2t5IEknbSBubyBsb25nZXIgeW91ciBkaWN0YXRvciAoaWYgeW91IGRvbid0
IGFscmVhZHkpDQo+IA0KPiAgIGFyY2gvcG93ZXJwYy9rZXhlYy9maWxlX2xvYWRfNjQuYyB8IDIg
Ky0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2V4ZWMvZmlsZV9sb2FkXzY0LmMgYi9hcmNo
L3Bvd2VycGMva2V4ZWMvZmlsZV9sb2FkXzY0LmMNCj4gaW5kZXggNjgzNDYyZTQ1NTZiLi44ZmEy
OTk1ZTZmYzcgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXhlYy9maWxlX2xvYWRfNjQu
Yw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2V4ZWMvZmlsZV9sb2FkXzY0LmMNCj4gQEAgLTEwNDMs
NyArMTA0Myw3IEBAIHN0YXRpYyBpbnQgY29weV9wcm9wZXJ0eSh2b2lkICpmZHQsIGludCBub2Rl
X29mZnNldCwgY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpkDQo+ICAgCQkJIGNvbnN0IGNoYXIg
KnByb3BuYW1lKQ0KPiAgIHsNCj4gICAJY29uc3Qgdm9pZCAqcHJvcCwgKmZkdHByb3A7DQo+IC0J
aW50IGxlbiA9IDAsIGZkdGxlbiA9IDAsIHJldDsNCj4gKwlpbnQgbGVuID0gMCwgZmR0bGVuID0g
MCwgcmV0ID0gLUVJTlZBTDsNCg0KRG8gd2UgbmVlZCAncmV0JyBhdCBhbGwgPw0KDQpJdCB3b3Vs
ZCBiZSBtb3JlIGNsZWFyIHRvIHJldHVybiBkaXJlY3RseSBpbnN0ZWFkIG9mIGdvaW5nIHRocm91
Z2ggYSANCmxvY2FsIHZhciA6DQoNCglpZiAoZmR0cHJvcCAmJiAhcHJvcCkNCgkJcmV0dXJuIGZk
dF9kZWxwcm9wKGZkdCwgbm9kZV9vZmZzZXQsIHByb3BuYW1lKTsNCgllbHNlIGlmIChwcm9wKQ0K
CQlyZXR1cm4gZmR0X3NldHByb3AoZmR0LCBub2RlX29mZnNldCwgcHJvcG5hbWUsIHByb3AsIGxl
bik7DQoJZWxzZQ0KCQlyZXR1cm4gLUZEVF9FUlJfTk9URk9VTkQ7DQoNCg0KPiAgIA0KPiAgIAlw
cm9wID0gb2ZfZ2V0X3Byb3BlcnR5KGRuLCBwcm9wbmFtZSwgJmxlbik7DQo+ICAgCWZkdHByb3Ag
PSBmZHRfZ2V0cHJvcChmZHQsIG5vZGVfb2Zmc2V0LCBwcm9wbmFtZSwgJmZkdGxlbik7
