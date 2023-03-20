Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E278C6C0B37
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 08:15:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg5br5K5Zz3fXN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 18:15:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TMYa2jLW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::617; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TMYa2jLW;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg5Zw2fTgz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 18:14:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awwYbKDs5sMuumEq1Cylc6Fr4xAgyyT7bj/uqJXFpaXjir0x6tmrux9j6Vnk9Ahh+julULL/Jg3kGcJqOL9mGaPejS5BRZLnJuTEQ3u4cbgreB1IQysWLTqyL6gi29XiYvYz9/K4LjyXNnj/cghCqFno4yl0Pdsunrl3c8VvgdfLozILa8/AWPOyY+ZJSnM3iJd7/m7h5BxwPys2dZWjWMoKhQuiOVc7bjCYEG+BWV68RYUFq82BonwiiIWadPntTxHrSjLVS0o4HlGDW6nkBVAOaw9QwmN0HbbME0mcsykWGcRJUz7EkT2iB1f80riLr9cl/5otKI247kv237Ui+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKD6AKQOina7JIdTkSUz++cbYoupV+flM2uqV+yLZN0=;
 b=nu42siiDWtU0QeAcwuD79N8CGjuUnhTkEwoLYouKYhKbZHfROtdAJEm4v5fOaaGXxzO4NG5BiRHVlnIamrUoAu0CiDfvsf8LqFeRkOlxaeklgRO+puPMGqhs3aJTc156J2g8D9wewY3vGJcyBII16gWVDFJNzS1bIWa7A6+mJ4BC5FB5Zghz1zDbBcCBQucHI/uajSVi08dXB4FoKSNJ8Wo3jMH1A90zHGPCrI3xvuQmxJVGVZhvjrNVUxKYpwNIWtNTi5ICe1kCWYTSv4rXS/j/TPR5IrTbzSGH8IqRv7xQpR25rV/EpM5R/u1LEDYLlK2dFwzXYpKstIr3eWzQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKD6AKQOina7JIdTkSUz++cbYoupV+flM2uqV+yLZN0=;
 b=TMYa2jLWLPiUS8kTrc7xidx/BESovv+LOFw4YHSjqNNUYFA1eJ5i34nxfaix8JEgBrfRUnZ7OPnHa4BArvsm55T/YhxN/w2URb8pmFuC7Z4LAaeMt4ojrNGb2Exiyb4FtAybQFTlcUtZb345SXweLUvEyNge41KVvm83ng74Mem9YYj8aDcED/8wDzbxO8bNzlYTHdCn+LnK2kHZts9A4aviBzuw75RrmXRZBmUx5l4yPiOYFsivjC/CVxho5B9J5F/C9IOV/YfKi3ud/S+XKpPtF8QwJJnlF7tBgvrF/8x/IJX658rL1keow91nBX3Re21mEJof99jqpYCYflLo4g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2049.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 07:14:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 07:14:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Tom Rix <trix@redhat.com>, "qiang.zhao@nxp.com" <qiang.zhao@nxp.com>,
	"leoyang.li@nxp.com" <leoyang.li@nxp.com>, "nathan@kernel.org"
	<nathan@kernel.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>
Subject: Re: [PATCH] soc: fsl: qe: remove unused qe_ic_from_irq function
Thread-Topic: [PATCH] soc: fsl: qe: remove unused qe_ic_from_irq function
Thread-Index: AQHZWnjlvpcj4HBQkUONAthkTYkvPK8DQjGA
Date: Mon, 20 Mar 2023 07:14:08 +0000
Message-ID: <78997674-5690-bb25-903b-c60ccf094dbe@csgroup.eu>
References: <20230319153749.1705822-1-trix@redhat.com>
In-Reply-To: <20230319153749.1705822-1-trix@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2049:EE_
x-ms-office365-filtering-correlation-id: 7832e4af-1d96-41b8-ceb1-08db2912b281
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qknZFsbS0nR/pmldA7jKoN992oT4RkkNLVmCLmjfdklOW/2zcqZ3SXxls++PIiLIztymqwXa99oCqZ9v6e0dEr3T+SzymjDt8r9q8egLIOJNWXJkUaNlzi8ZM9ysZMVIQakwPDXCHm8dq7rTvft/i4KY+X0Y4HpfsiXI/Lf/fJ6BxUHBPTW75gFzbHcoqLrabVicjI6c0BU/QhatogSHJuprVW5MJdKatC1UU/U4sjCVI+GUlxLcdgGoJyPgRGvO2JSgDiB0/twaRjiMdMUJx1iDXU0jJrpHrt/hFPbIo2j6PiFhiUHUw/U8flEf9W/rrvXA8sOutOgVUHZC4KkQ5J7qu7oytemtq2Vtg7MbcAKeRN0bvh8xHruGqDnDl5Z5vdyQSmHOELk+Kbw5ZezyfQwvXOI+Vufx8KSlMT0hmtgetoAvhdmFDjebTsKYiuPjamHaI+jmSIaq5pLBqXHfqNy2h47CpM2Z5j4JQs+OXTk4WS68+XjombzihkdKvV2suw8T75Ofx1FkwgwAP3zsMaDDxxk0d+w2KRVDRTqRTvT7d4pIR5Vzqe+3jbzUCLqPsGlkFjmjJwVq0tWyO/M3HkjQI6GebcZG0M0E6stzVd1C6rO6PHNN7ZBfzbFw+YGAzy+kN32uzXFi8RAh5YPMGP019WxzaK0dg6XjXQKOaD4oZNbo9nIPWUD0oXxORKuPFJL5ehVM+SpteCq0tX1YbcfKlogyRLNYgcqzKAcTFIzmTWrPmqo7luVsu4nqi8QZaoR8ajAM2ThPetC/t39mEg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(136003)(396003)(346002)(366004)(451199018)(31686004)(83380400001)(6486002)(36756003)(86362001)(31696002)(122000001)(6512007)(6506007)(26005)(8676002)(186003)(38100700002)(38070700005)(2616005)(71200400001)(478600001)(54906003)(8936002)(44832011)(4326008)(316002)(66446008)(64756008)(66556008)(66476007)(66946007)(91956017)(110136005)(41300700001)(76116006)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eW92YVVwcFgwVkliaHcvS1NjNmxPRDV3Z252amhVYTVWR2FXTEdvSnVGYjND?=
 =?utf-8?B?REloRGRhbTg2RWpJSkNZQlcrY0RNckZpU095b0FzaDdRcEoxdW5NSTREc1Ny?=
 =?utf-8?B?YnlkMHRMdGUwNzNpV3EydnVMRTl6bUpqbng3QTVwd0cwR0E3TTg4VndkK3RF?=
 =?utf-8?B?djJYUWVsMHRiWGJRWjRLeHAzSGZ5c2EyTlZrWFBiWlljTDRJTFh4WE13OFBr?=
 =?utf-8?B?ZEhFRUFIa3JNTjhLclNXeEZDWjQ3aW53UzlTalZsMXU1NnhGTEtBSW52RCtK?=
 =?utf-8?B?bGV5eUcvc2NkRGVyQm1pbHNCVVp0bTJac0dwNUYvUHp3cnJpY3RETDlialpO?=
 =?utf-8?B?dG8zbDFBVnkza0lOSmpvbmcvUEpKbkxlSEQvNFh6L2NteXFDZ3grMkhmRHdM?=
 =?utf-8?B?VHB1dE5VV2lrRml2Q3FkOEpQV0hBWjU0TUo2WlEvWDhjdDVSU3diRGdCMDlO?=
 =?utf-8?B?S2U4QXZtbm1hOE1vRjQzYUh3VEFoZzl6UjVXVjcyTHg3K29odmVHbThjelp0?=
 =?utf-8?B?VU0xaWY3ekRlZTNtNDBpbjFkNGVWd28ySEs4eDIzR2ROd1RJMmJJb1VkUmY0?=
 =?utf-8?B?SkFrU3NBemdURWw4K3VjdHFib3dDZkVoUi9qV3dFSVlsS3cwd21TWXRncC9B?=
 =?utf-8?B?di9HQkhGaElEQzI4bGJ1SGMzSVNFdlpBeS9HOVArMHYyWEdzNWdoY0dYVTNx?=
 =?utf-8?B?ZTQ2eUdmTHBnMm5JY3hCeXh1NlRyQ0JUWVhVdnZZQ0xUZ2h2TldlRk56L0dF?=
 =?utf-8?B?VGppdHpSaHp2US9yNVR0MGVjV01HNlRUbHBpc2t1ZWdPbG9jY2dmVUg0bXdZ?=
 =?utf-8?B?SGRHYWRaamtpYW1sMzlSUE4vdjhsQmZybkNnZThLRDlYdVFPcGVKOVl3dFU5?=
 =?utf-8?B?b01EeTB4YkRhUDdWMTNHZjZDOUZ2c2J1dkdqd053Yy9BNC8xaGE3Yjgrdzc3?=
 =?utf-8?B?M3Y5eWtBb2FBaDZ2eTg2Z1U2Z3V2U01BdjhJejlwbjBST3Q3dVZtZUxMRmxp?=
 =?utf-8?B?UEZvMWt0RmVWTnMxaUNiV1UyN3ZNYVZpTDYwNmtDakFBZksrYkdqNWZpOGYw?=
 =?utf-8?B?dTJlQ2ZLM1M2Z21QVE41NklrTk9aZHU1Qk0weVBybnZaT0VmTjBxUzBWbnhI?=
 =?utf-8?B?R0RKS1labDlqM0tWWmlBQS9Tb1lKdmUxVjB5VkovQi9SejdwZ21Nc3YwQVpy?=
 =?utf-8?B?K2swMFN3d240eHIyVEtwbDRvc2w1ZFFjYWszQ0dYRFN4ZXZCbmlsdThGa3NI?=
 =?utf-8?B?czZ5S3YrYWJCa1IrSjRaZXdBYlBRSXA3WituZUs4clJiVjRTQ2NHQzlwOXl0?=
 =?utf-8?B?ZnU2TWxPOFdsMHloTTFqeENXTG1XRE01ckJWMUZic2ZIdldHUS9ueWFwdXdr?=
 =?utf-8?B?c2NrMjltcHNWMHA5NE5UaldGbUREWjNsSHZDVzVscVBHWG8rTWJYWWk1WUFm?=
 =?utf-8?B?QURleVRFQ2tIWUJqY1pPU0NrdFZNZmRqSVozV0FOODFHRlU3QUJJYlBuclRB?=
 =?utf-8?B?ZnkzbmlBc3pKMUxtQ2lJYVdoa0k0UlRwRU1hRjJBWVlxUVAwTGo3VFo4Qzd5?=
 =?utf-8?B?VVNwN2t5QmhYZWNvNzdXSDA2dzNtekRyeEpIOXhmR2RiaGk1R1Zid1NDWkc5?=
 =?utf-8?B?aUVpWmViOGJXbGRsbXdTSFMzRzdrWEU5Ynd4RXJIejBiY083dS8ram5UcUN6?=
 =?utf-8?B?aFJON1dGN0g1RGxqY2QrNlBwTzRVRG95andMdjFxejRVUnZtVWlqdjJqK0dN?=
 =?utf-8?B?ZThJLzdWZ09DSFBnMXJmTzR4M0FOMEZ2UmxJT1RxQ2dUSFRPYyszSzB5QVYv?=
 =?utf-8?B?eDRUdVZ3SVp1cUR3WUtUZHJEMVo1ZEt6bkg1eHRxcTdZNE5GWGVOV2xvRE1W?=
 =?utf-8?B?REdQKzRBMDY2YzhzWmZ6Z01JaGsxOWxJSmNJdjJqQnF0ZEtxRkRxaHV0SWo4?=
 =?utf-8?B?ZUk3UHpCQ3UydFNmc0lmc2ViVHRuTHltM080cDJSa1hiRjRuUUN3UE9lSGRH?=
 =?utf-8?B?MFk0SVdmS1JFU3dPREJuclU4d2RMR0QyNXZhZU5OYTRCeWxLZ3FWRnFjcTUx?=
 =?utf-8?B?SENIcUZFNVZuVmhsNFpaVUVTS2ljN3NCWm5DbkZiVXVWakQxZVFVMDZ1aTMr?=
 =?utf-8?B?SFZJN2IwVEE5TGFvY0dRT29qTDJHM0cxT0RXcDZCQ013RFc4OXNjSWlvamtz?=
 =?utf-8?B?c2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E75A0A939CD034999B425F94E62D773@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7832e4af-1d96-41b8-ceb1-08db2912b281
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 07:14:08.3433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XE2fBcXQdYImcV7CLmXYQ3B1H4M7X3Td/ibBc9qPYjZg6StuqURX+KrPVWLiZ/lCjfqKJXKCHJsOoEW6f0kTALZ7sOrZrWsAhKB61lqT6vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2049
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzAzLzIwMjMgw6AgMTY6MzcsIFRvbSBSaXggYSDDqWNyaXTCoDoNCj4gY2xhbmcg
d2l0aCBXPTEgcmVwb3J0cw0KPiBkcml2ZXJzL3NvYy9mc2wvcWUvcWVfaWMuYzoyMzU6Mjk6IGVy
cm9yOiB1bnVzZWQgZnVuY3Rpb24NCj4gICAgJ3FlX2ljX2Zyb21faXJxJyBbLVdlcnJvciwtV3Vu
dXNlZC1mdW5jdGlvbl0NCj4gc3RhdGljIGlubGluZSBzdHJ1Y3QgcWVfaWMgKnFlX2ljX2Zyb21f
aXJxKHVuc2lnbmVkIGludCB2aXJxKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4N
Cj4gVGhpcyBmdW5jdGlvbiBpcyBub3QgdXNlZCwgc28gcmVtb3ZlIGl0Lg0KDQpZb3Ugc2hvdWxk
IG1lbnRpb24gdGhhdCBpdCBpcyBub3QgdXNlZCBhbnltb3JlIHNpbmNlIGNvbW1pdCBkN2MyODc4
Y2ZjZmEgDQooInNvYzogZnNsOiBxZTogcmVtb3ZlIHVudXNlZCBxZV9pY19zZXRfKiBmdW5jdGlv
bnMiKQ0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUb20gUml4IDx0cml4QHJlZGhhdC5jb20+DQo+
IC0tLQ0KPiAgIGRyaXZlcnMvc29jL2ZzbC9xZS9xZV9pYy5jIHwgNSAtLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29j
L2ZzbC9xZS9xZV9pYy5jIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlX2ljLmMNCj4gaW5kZXggYmJh
ZTNkMzljN2JlLi5jMGI0Zjg2NWZiYTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29jL2ZzbC9x
ZS9xZV9pYy5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xZV9pYy5jDQo+IEBAIC0yMzIs
MTEgKzIzMiw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBxZV9pY193cml0ZShfX2JlMzIgIF9faW9t
ZW0gKmJhc2UsIHVuc2lnbmVkIGludCByZWcsDQo+ICAgCWlvd3JpdGUzMmJlKHZhbHVlLCBiYXNl
ICsgKHJlZyA+PiAyKSk7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSBzdHJ1Y3QgcWVf
aWMgKnFlX2ljX2Zyb21faXJxKHVuc2lnbmVkIGludCB2aXJxKQ0KPiAtew0KPiAtCXJldHVybiBp
cnFfZ2V0X2NoaXBfZGF0YSh2aXJxKTsNCj4gLX0NCj4gLQ0KPiAgIHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IHFlX2ljICpxZV9pY19mcm9tX2lycV9kYXRhKHN0cnVjdCBpcnFfZGF0YSAqZCkNCj4gICB7
DQo+ICAgCXJldHVybiBpcnFfZGF0YV9nZXRfaXJxX2NoaXBfZGF0YShkKTsNCg==
