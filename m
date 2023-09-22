Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225B87AA9C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 09:10:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GYS9cX1t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsNh96mdxz3dM2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 17:10:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GYS9cX1t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62e; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsNgK0Fxrz3cn0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 17:09:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJbdmu3KZ0TyoGBWoxOJXvGo1FSBJHNO3C2qAtfkDpyMq8LhA7uITW5oAC5hzp/+tMPTQEDk5eZ6pTb/3Ip7O+kS9qAYT9jLjZpDCdpZb6bvWd+HUfNOpDjiPc0e6JyiwYBC3GE2ddpHp6YJWC5mTNamveFw05t2q/fZWQe51HPcyhqtN26cN5xvUPd7MprijVoXXi5MacBoETc+Mtn3nIV+RWSy3Dazwd6eBbvzYXv9RdbZVb5hVe13lNDiFlnjdTYq4Z3nPUUJJY5h55UHxdZuQz9zvjpJExxk2CHfZsRGmV9EXo6uoEAHO41jfW+Ap7b/PTYqL8uAZeX8lZcEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGu4N7kdL3YD+AsEPWMXhpRRJ+zQAhioQY39cWaVdIs=;
 b=kfuqRYozDy6vCCeZpIXep3sxhM3/HWxkchjZhT7sAwBvVmgCYMoXz9roROmsxMD1PIPqTRzbwuoh8hZk87iipeccYhCMdW4+vKAjH7LOSDzd2j+eXEHYcsqVTLeToiPvkh6/5aOyOKTZ03DNVRw1V8YAUzVvQj4kozpxdkm2poTKvqNfzHbMUI791LJX4/xSwaVOAEGnx4OQrGxmN93fmntNOaPG3faaYNRHyxfVgCrJ2/6JtcChvO/XHIkeimmAdZ91VYQX/pPiPE+1yuVy1kAZjpHC2U/w7X2HPN3swoDdrXf/3GsntckXBKbaUK4OqtK5Nxtse2JCyh/6A1Tqjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGu4N7kdL3YD+AsEPWMXhpRRJ+zQAhioQY39cWaVdIs=;
 b=GYS9cX1tnqSDz3WLmFpLFXla1NtOegrGxW2nY1LWP8yjgwk6WgqoQFZNs+UFtQz7Udz086CFw2bwwDBn6LuguDbRcrTYCXDXTXMLSImmxZoN1yaY+wiMYoI8VNv/GcAV+Y74otBRz52CeMkrdPJDljyHbuaCCTYZhTsoBW0xLNTQzipCORhZT5y/TLufETwamm6PKW5Ccz8L5qj1ghFHgzN4SPZk07+OyJQAV6UvA3aef6M201AhTOqco+aHGOwM8MZ5BJOBg3se9oYFRRWN9gD64ZPknB2419GVLEUXIfACl7W/MwVBpjFm8utGVyVw6l7Dtsjmucwgqqcfg7Ps1g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2975.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 07:09:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 07:09:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexandra Diupina <adiupina@astralinux.ru>, Zhao Qiang
	<qiang.zhao@nxp.com>
Subject: Re: [PATCH v5] drivers/net: process the result of hdlc_open() and add
 call of hdlc_close() in uhdlc_close()
Thread-Topic: [PATCH v5] drivers/net: process the result of hdlc_open() and
 add call of hdlc_close() in uhdlc_close()
Thread-Index: AQHZ6wUxh5VROmI2HUCbAHw22u/et7AmcVCA
Date: Fri, 22 Sep 2023 07:09:10 +0000
Message-ID: <a2bd6c5c-df7e-1e98-acd9-88ac32b8e264@csgroup.eu>
References: <20230919142502.13898-1-adiupina@astralinux.ru>
In-Reply-To: <20230919142502.13898-1-adiupina@astralinux.ru>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2975:EE_
x-ms-office365-filtering-correlation-id: 6bd1ccd6-ff49-4085-7547-08dbbb3ad1a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +lWIra8Me4XFqLfKjwbIfEbtW4Lj01mmypEoKoiFfk9a8kknDpS2/r0TdwkAzs4nAPz6G75qe+Vw/8NVxFKbD9QukOSrC8J7bmKXsoYOOSqIAdf67Qd7nplCBWYUeWyBEx8AxIirWXpc0HZiz5czj1EfxnzJ620uENLomr75XP6fTHKcH2yDZ83aHXWb6KAgNkJC3vDaV3eMMIFoWyArXPy8WgWYlrlFLyLoHvMn8QKRghSnUf8GwxPOCODsGKCachYB2irOrh0OiyfmoQujtWzwpkoX+WrCPCogfioyXmz4KcL+AGx84KTu8XJRD28+BJwuWJG6g5Nh39iHJaXE/7uNIHdgOmFPqe35E0K9IJOFyujWua8I5Tpk/t77upr99hgz+75Va5zYzJqsKhJRsu+811KS5jaCeEBdXmlLCvG7HxjI9l583W/o9askm3n8i0MjgnzE4tnf7hWBu0dGjJju8HeFWWvxkUDhTMVB1B5PXGew6oxqXg9ADR/+ZbQ/13HnUlU+9zb5XZ9iRoJXmS5pI/Uo0caHnLy+2cnx4RTqhAs7y//GYd1zow4bAw+rLDoWV0XcwQVzd7NWx/WR59N1F9Xf97A1nseMWoPutNY8IME+NPauyu9ILjRFI4lDmwS9s091IcV7bQTWPQXTiWAhi0mz4qDvqz9EFTbZ0+wrjsGk9XIKi22I+6nS/35W
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(186009)(1800799009)(451199024)(5660300002)(2616005)(26005)(8936002)(4326008)(8676002)(2906002)(7416002)(66574015)(36756003)(86362001)(38070700005)(31696002)(122000001)(44832011)(38100700002)(83380400001)(6512007)(91956017)(66556008)(66946007)(66476007)(66446008)(76116006)(110136005)(6506007)(71200400001)(6486002)(41300700001)(478600001)(54906003)(64756008)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VlRFMXhXWUZ0VlJFMVN0MXYzZ0w3RGNjUllVWVdqTFpqVCs2TnlLT0ZSY3dQ?=
 =?utf-8?B?TFAvQWVLREZiU1FvK2JYa3drQklaTlJOb1dUOUlMYnJwWS9CMzVtVGhSdTJk?=
 =?utf-8?B?ZXJObDFRdmhiakM5cTQvOVZiU2NlQUl5YVJjd1lteHRYSVdnUTFTRW9jOWFl?=
 =?utf-8?B?OENXVEcrQ3JaYm5XL1kreURmL2RDbmQ2S20yckxtNzRnK2hoQjVmaFBENTBn?=
 =?utf-8?B?ems2ZE5SVVo2N2hoVkdrZVo1M0lCbDhOSTZFMExZdnhkZWhSc1dDWUhQMVhX?=
 =?utf-8?B?NVo1MXVjd0xKWFczcUFDZ1VrWUxORkxYTko5cTVCVHVKQzZtYWE1dkNQOFV4?=
 =?utf-8?B?YVk2cmEycTczYWlDbWEvanRkR2NYb2FDdXJlcTFLblV3U015a3hob2xNMVlt?=
 =?utf-8?B?bk41NEZhS2gxbklYTU9Rajc4eWZ0Nnd0M0xkZXhOZzE5NEVrc2JyS1BkaTJF?=
 =?utf-8?B?TnpyVXVTQUhKaGJxT0VRV2ZXdW5rK3FBUlI4S3VleVd3OTRmVUQ3UEVCQWlX?=
 =?utf-8?B?VlF4N3lNYkFMeU9kNzJqdkkyYWRIUHEzcG84L1BDZUQwVFNhbUJHU0NoejNz?=
 =?utf-8?B?TmpZNE1hbjIzZEtzOG5TQ3NLZk5Fekhic3dtT3dqMk1WaytLSFV6UjVMVkJT?=
 =?utf-8?B?WEV4YTNXbVlRN21RSmw4VDB2T1BPb0Y0K1JxZjc4MGpRNnd1TkdCcENieHFU?=
 =?utf-8?B?MzhlNS9YTzBlN21LZ0IxTmF4bTFjcTNzUENIUG9mL21DSE03OTUrcy9NUklT?=
 =?utf-8?B?NHhFZzdZTzZIdG5wSldhMWVxaDBaVEt3aTdEbERWUzFTRmt5S21RTExZeS9o?=
 =?utf-8?B?enpsVUdydGxTQ3RtY3JXSk5DOHdCU1BIRGtzeW95QWZFMGJOdHdKNi9BYWVD?=
 =?utf-8?B?cU5LUUhSYzhaRHhBK1JXVUNmMjdsOW54TjZ2S2Q4cFUwRmErdXdwNWNhOXpl?=
 =?utf-8?B?RXpwZUtzMURwMy9vMzNJUTdxTzRRVEllVTZSVllmdlc4WWhxZ1B2Z3gwZldM?=
 =?utf-8?B?Vy9naTY2S1RadG1URkgvNTNtQ3ZxVkdGK1pWMG16djljTzBwNXUwd3hGT1hD?=
 =?utf-8?B?b2Z3Y1A4US8xTGF5VDVEMHk2eEkrb3RCRDNnZjdFeHo2UWFLOEUrNXRCUTg3?=
 =?utf-8?B?U29NQm5iWVhkeG9pUkpkMUI2bjE3NW4yZXZ6bENZbXp1N2ZVT3kwZk1nS1lP?=
 =?utf-8?B?NlFYUDg4MzlpQ2l6a1NuRERHNm01Y3IreGFsVENSc3pOYW5OdXUvK2p1YWVU?=
 =?utf-8?B?ZFEzMXlkVFZTdFpDWUh6STBPaFErcm01WVRtOHFUSmFOTXBGc1BSMHN4cGw2?=
 =?utf-8?B?OG5GVHZyU2txTHg2VnF0aXg4eDNaVjdOenFGem5FWmNPMlNTTnhpUmgzTmI3?=
 =?utf-8?B?MkkxazY2WDArbDJSc3ZmbkNoWGhzVzJKVlFNMUZDeVhETkp2TmZsQVg5WGZN?=
 =?utf-8?B?QnR2NHBZV0tyUlRHUEJaSTZ2OHIvY3hYd0Ricmc5Z01aQzFuMXBpMmprdk5J?=
 =?utf-8?B?TGIzNDdxTXJ4dVgzTkxjM0t4Z3JKbW9zMFBaLzFEQ2Z2cVRDQzkxd3NHd0RF?=
 =?utf-8?B?WUtTMXBnUkx1YWdNcTZHcDF3RmRvNEhtMlQrdzZzV28rTVdETS9tR3lBbmJP?=
 =?utf-8?B?YVdiY3BlMERMVkQwWlYxcW4xelFvWnd1b21VV3YvN2JBZzk1blVlL1lXVWoz?=
 =?utf-8?B?VDk2R2tYQjlJdFUxRUN2a3EyaklWQTNZVVZwdTJxRmFZZUZUeGxjR2kzZE5T?=
 =?utf-8?B?TjU5MUJsem5rS2NXd2FLUU0xTzcrRzIwK2lGc0NPcEZKcTltR0Y5cUhYWE9h?=
 =?utf-8?B?L3B1ZVB3c2RkNW5lZytqampwWU9jUG5QcGxpbk52cFBraWJmS0I4NlJaT283?=
 =?utf-8?B?VlhncEVOYk9WRlYxZUJpT0J0bVM3cEl3SmY3d24rQ3p2c1BwY1kxdXRORDBw?=
 =?utf-8?B?dDZJUlp2bmJHckN1Y1NVR1pITUNzenVjbzlNbkRlSjh6djh6bVoweWQyTkhm?=
 =?utf-8?B?cmZMOXlXdHlnc2VEQktKSmFZbVFjQUY2Vk1RZHJMYm9ra3dvODFmTzE5cDFa?=
 =?utf-8?B?Zkd0Vi9WT2UvS3plNGp3ZS90UHJYN2FWUHYzU28zay85eCtqOExLRTRRWHhp?=
 =?utf-8?B?S0pGU1FROW95UUJsUkZ1ZVNpZk5jRWdwWGNMcXlpODI1WmpqTXBHbW9wQTh5?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <689F6FEB8AA9774297C58825A175582D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd1ccd6-ff49-4085-7547-08dbbb3ad1a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 07:09:10.2992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gEqVMt5ddQDojnR4+VTzPK+ZFcD8Reqe+SuNCh1wlbiPeFg9e+zTPhzpatE8/T/MqMELFcGXVHpjJ58PSRvcCo794I/Hr0H7DicHBXK6Nlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2975
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
Cc: "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA5LzIwMjMgw6AgMTY6MjUsIEFsZXhhbmRyYSBEaXVwaW5hIGEgw6ljcml0wqA6
DQo+IFByb2Nlc3MgdGhlIHJlc3VsdCBvZiBoZGxjX29wZW4oKSBhbmQgY2FsbCB1aGRsY19jbG9z
ZSgpDQo+IGluIGNhc2Ugb2YgYW4gZXJyb3IuIEl0IGlzIG5lY2Vzc2FyeSB0byBwYXNzIHRoZSBl
cnJvcg0KPiBjb2RlIHVwIHRoZSBjb250cm9sIGZsb3csIHNpbWlsYXIgdG8gYSBwb3NzaWJsZQ0K
PiBlcnJvciBpbiByZXF1ZXN0X2lycSgpLg0KPiBBbHNvIGFkZCBhIGhkbGNfY2xvc2UoKSBjYWxs
IHRvIHRoZSB1aGRsY19jbG9zZSgpDQo+IGJlY2F1c2UgdGhlIGNvbW1lbnQgdG8gaGRsY19jbG9z
ZSgpIHNheXMgaXQgbXVzdCBiZSBjYWxsZWQNCj4gYnkgdGhlIGhhcmR3YXJlIGRyaXZlciB3aGVu
IHRoZSBIRExDIGRldmljZSBpcyBiZWluZyBjbG9zZWQNCj4gDQo+IEZvdW5kIGJ5IExpbnV4IFZl
cmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGggU1ZBQ0UuDQo+IA0KPiBG
aXhlczogYzE5YjZkMjQ2YTM1ICgiZHJpdmVycy9uZXQ6IHN1cHBvcnQgaGRsYyBmdW5jdGlvbiBm
b3IgUUUtVUNDIikNCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJhIERpdXBpbmEgPGFkaXVwaW5h
QGFzdHJhbGludXgucnU+DQoNClN1Z2dlc3RlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNo
cmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gdjU6IGRvIHNvbWUgcmVmYWN0
b3JpbmcgYXMgUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPiBhbmQNCj4gQ2hyaXN0b3Bo
ZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiBzdWdnZXN0ZWQNCj4gdjQ6IHVu
ZG8gYWxsIHRoZSB0aGluZ3MgZG9uZSBwcmlvciB0byBoZGxjX29wZW4oKSBhcw0KPiBKYWt1YiBL
aWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPiBzdWdnZXN0ZWQsDQo+IGFkZCBoZGxjX2Nsb3NlKCkg
Y2FsbCB0byB0aGUgdWhkbGNfY2xvc2UoKSB0byBtYXRjaCB0aGUgZnVuY3Rpb24gY29tbWVudCwN
Cj4gYWRkIHVoZGxjX2Nsb3NlKCkgZGVjbGFyYXRpb24gdG8gdGhlIHRvcCBvZiB0aGUgZmlsZSBu
b3QgdG8gcHV0IHRoZQ0KPiB1aGRsY19jbG9zZSgpIGZ1bmN0aW9uIGRlZmluaXRpb24gYmVmb3Jl
IHVoZGxjX29wZW4oKQ0KPiB2MzogRml4IHRoZSBjb21taXRzIHRyZWUNCj4gdjI6IFJlbW92ZSB0
aGUgJ3JjJyB2YXJpYWJsZSAoc3RvcmVzIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlDQo+IGhkbGNf
b3BlbigpKSBhcyBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+
IHN1Z2dlc3RlZA0KPiAgIGRyaXZlcnMvbmV0L3dhbi9mc2xfdWNjX2hkbGMuYyB8IDEyICsrKysr
KysrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dhbi9mc2xfdWNjX2hkbGMuYyBi
L2RyaXZlcnMvbmV0L3dhbi9mc2xfdWNjX2hkbGMuYw0KPiBpbmRleCA0N2MyYWQ3YTNlNDIuLmZk
NTBiYjMxM2I5MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9uZXQvd2FuL2ZzbF91Y2NfaGRsYy5j
DQo+ICsrKyBiL2RyaXZlcnMvbmV0L3dhbi9mc2xfdWNjX2hkbGMuYw0KPiBAQCAtMzQsNiArMzQs
OCBAQA0KPiAgICNkZWZpbmUgVERNX1BQUE9IVF9TTElDX01BWElODQo+ICAgI2RlZmluZSBSWF9C
RF9FUlJPUlMgKFJfQ0RfUyB8IFJfT1ZfUyB8IFJfQ1JfUyB8IFJfQUJfUyB8IFJfTk9fUyB8IFJf
TEdfUykNCj4gICANCj4gK3N0YXRpYyBpbnQgdWhkbGNfY2xvc2Uoc3RydWN0IG5ldF9kZXZpY2Ug
KmRldik7DQo+ICsNCj4gICBzdGF0aWMgc3RydWN0IHVjY190ZG1faW5mbyB1dGRtX3ByaW1hcnlf
aW5mbyA9IHsNCj4gICAJLnVmX2luZm8gPSB7DQo+ICAgCQkudHNhID0gMCwNCj4gQEAgLTcwOCw2
ICs3MTAsNyBAQCBzdGF0aWMgaW50IHVoZGxjX29wZW4oc3RydWN0IG5ldF9kZXZpY2UgKmRldikN
Cj4gICAJaGRsY19kZXZpY2UgKmhkbGMgPSBkZXZfdG9faGRsYyhkZXYpOw0KPiAgIAlzdHJ1Y3Qg
dWNjX2hkbGNfcHJpdmF0ZSAqcHJpdiA9IGhkbGMtPnByaXY7DQo+ICAgCXN0cnVjdCB1Y2NfdGRt
ICp1dGRtID0gcHJpdi0+dXRkbTsNCj4gKwlpbnQgcmMgPSAwOw0KPiAgIA0KPiAgIAlpZiAocHJp
di0+aGRsY19idXN5ICE9IDEpIHsNCj4gICAJCWlmIChyZXF1ZXN0X2lycShwcml2LT51dF9pbmZv
LT51Zl9pbmZvLmlycSwNCj4gQEAgLTczMSwxMCArNzM0LDEzIEBAIHN0YXRpYyBpbnQgdWhkbGNf
b3BlbihzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQ0KPiAgIAkJbmFwaV9lbmFibGUoJnByaXYtPm5h
cGkpOw0KPiAgIAkJbmV0ZGV2X3Jlc2V0X3F1ZXVlKGRldik7DQo+ICAgCQluZXRpZl9zdGFydF9x
dWV1ZShkZXYpOw0KPiAtCQloZGxjX29wZW4oZGV2KTsNCj4gKw0KPiArCQlyYyA9IGhkbGNfb3Bl
bihkZXYpOw0KPiArCQlpZiAocmMpDQo+ICsJCQl1aGRsY19jbG9zZShkZXYpOw0KPiAgIAl9DQo+
ICAgDQo+IC0JcmV0dXJuIDA7DQo+ICsJcmV0dXJuIHJjOw0KPiAgIH0NCj4gICANCj4gICBzdGF0
aWMgdm9pZCB1aGRsY19tZW1jbGVhbihzdHJ1Y3QgdWNjX2hkbGNfcHJpdmF0ZSAqcHJpdikNCj4g
QEAgLTgyNCw2ICs4MzAsOCBAQCBzdGF0aWMgaW50IHVoZGxjX2Nsb3NlKHN0cnVjdCBuZXRfZGV2
aWNlICpkZXYpDQo+ICAgCW5ldGRldl9yZXNldF9xdWV1ZShkZXYpOw0KPiAgIAlwcml2LT5oZGxj
X2J1c3kgPSAwOw0KPiAgIA0KPiArCWhkbGNfY2xvc2UoZGV2KTsNCj4gKw0KPiAgIAlyZXR1cm4g
MDsNCj4gICB9DQo+ICAgDQo=
