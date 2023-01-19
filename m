Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6D67356E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 11:25:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyJfn0PmTz3fDh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 21:25:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=NzwxmBsk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.51; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=NzwxmBsk;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2051.outbound.protection.outlook.com [40.107.9.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyJdm3Xpxz3fBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 21:24:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClXp8CgJGIPZyUt/Nik54w1ypIUfI7FN0Vwis5B1ip3BOoUThfNXsVI/CfofL1u3/CRw6HXTaCbBxf/WNJRL/89t8eKB2Slr9MITELmzQrkDpVz70rlMddtRXH3sXe7PtxrrLNKSeQd7APf8+FWl7ZTqzJmIjWdAOqzoBTCXgIw+/MVFKkjXIUb5O26ofSI9s7yskrmax/fZ1xiZ06n0WN0rKOZE5/cfZSHt6eNq+2hQoEPSrGwNUz7f90j5wUb0YKX1dAm/Y6ANzZpMF1NqBHF9sB3zPRIcffRZZb/iCaRw2N0lCp/vliHMAVYYmXibods6sTvrzuPRWb3yH/MDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtAbNd4vr5fLQuJPeoByxsCc+ZJQv4L/9tzt6sH6ko4=;
 b=l09FGo9atBen/bvqsTZCGKnz1nB/GwoYhkiXw8x1A0+mqSNPIgoOEBwIg4HHDyHlJvwCIVD5crDeafu/6LeL8fy3Ru6v1UFjEP9pk8gqU/6Jpb4TVBIZM0K7B3i6SDSLWFFt2E8BIrxZj4dv7Tq2iBLqfD8+a/ZK/Eyzjc41jzf78N/CfKI0QEenEACcuStidFPLN0RR1MvuK9FQ01SEFsg477kPm73QAeTq0yewrIgakuJWSf5e3rcUJ8XpUEW1LAIKT+7OT4qCCB43UeImxC+eyJ6VcyWxVH7BmhDPHNhjDLZ0aRUwSB6RrNfxxTiFGoIsOT4yB8Cw4t3GuXi3AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtAbNd4vr5fLQuJPeoByxsCc+ZJQv4L/9tzt6sH6ko4=;
 b=NzwxmBskAk/AGIHh2oP5hLgul5PH7zLcyXwKVfOwpg6YdKNWqsmjEbKq7GZXPsjs5rfmjupLYArmMk05tnELnO3iUKCOzIA/VZpD+KXtWevqB2sBHH/VEbrLFmxeHmZYhWLAk12vrE5+U4Iy5Sc6BdLcstQHFZkMm9WRK5YchTpN8egRrWwraJPlAMopblgAW1zJlxOTqWrNzEEl1wUM8x8lMa19pLI7TQ7kEAzKurO/R5SSWNr5LMcqThrECZSNBNdU0z7XE009Uq5CeH2NzkL2WFqtq01Mh3qR0V1WSE04aEPagyB53+0FzKOP9xz5XwPd+XyZUWxEQkJW3JZIlg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1434.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:164::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:24:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%9]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:24:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michal Suchanek <msuchanek@suse.de>, Erhard F. <erhard_f@mailbox.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
Thread-Topic: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
Thread-Index: AQHZK+wL6R/O48Mb4kSuI2ynfHDbya6liHqA
Date: Thu, 19 Jan 2023 10:24:07 +0000
Message-ID: <8a9f7ba5-37a4-0927-4ab2-d212f1b098a9@csgroup.eu>
References: <20230119095323.4659-1-msuchanek@suse.de>
In-Reply-To: <20230119095323.4659-1-msuchanek@suse.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1434:EE_
x-ms-office365-filtering-correlation-id: 2e578a3a-b3eb-47d5-df22-08dafa074c05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  mYYQcHrPCZHnVbHvYzbnc+4UDfqxqegdxZ7dAOaXJjf2izIYp0FIfVRTD5wzAmmlV4lHpJCbNU+0uC7/yRPCsECq64DwTr6Bb6Viug5G0GUNfwceiYkm2BTjw/Fc6pEumlRYvqNLnEheEqkulvUyw4vhkqp/r9sV5Y6kMMDIph98cX3DdBSOAzhNRTbyaA6XY75qQXtmhuuPEq7IUrRbCshfCx6jPYpsm0Z7KIgHGmYlIByumcO23jFQJITl23MxnFSASwKaax3yAgNvPfvo3xf7aTN+ZX8GHpmztK6u8GcQf3o8pVKqTI2CZCk+pZ4DE0SeQQ/SGn4cCgxdFEuItemx87MOhFd5artRqgUgDtSVcjtc9wryV91crcAA74pLYKcI5GG6EEKZjAabVKT6YAz346Sxn+frZzjX51qvFiPUfsWSKGV+VZlF5bNYjDdKLsZBV6vIS80ncuCZNT5bsJVqsnEME0rApeBva5eoEfFvZiNAzt1s9a8AnfB5yKYi1evAZ04Iy40wJH6clM05QRuv5LMWtXOXKpWLTuh/NAECdYOGyJJSb0V/iV9vwlxvNzrFlaJKUB+IjGrrKmeca52HUzpA+72sNVce+d8HUxfFMLOHmXo4n+xWTy8Sy7ex0hkbQscca9WniMB04wYcq8PrCGiPVVhEHSjjLclIElDm8zXCttb2E/oOQd6QqxXwdjzfq4ZW47UjFck5eBLXikjdW0eRCZgMhzECS+nPgLvuR4xZa2pGdrH8Bijv1fI6FvAhULy8cBVYQ9J4zpx23HKeb/BWix/ckgHgE835xy0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(451199015)(86362001)(6506007)(31696002)(6486002)(966005)(478600001)(36756003)(71200400001)(8936002)(122000001)(5660300002)(316002)(38100700002)(66556008)(66946007)(66446008)(91956017)(66476007)(4326008)(8676002)(64756008)(76116006)(41300700001)(26005)(186003)(6512007)(2616005)(38070700005)(2906002)(44832011)(83380400001)(110136005)(54906003)(66574015)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TXoreXA2enVpWnhaMVlWLzBwK3VtS3FlZS9MeHZzdlczdzdzQWxMc1hGOFZM?=
 =?utf-8?B?NHdUaUVBaWdPRlg4YW13QWMwK0JrRUt5YThPeG9aZTU2dXR5d3FIcmhjQ1pM?=
 =?utf-8?B?YWhzUXY1M2Y4bjg0cnhwZVZMY1NQK2NIVWpvQmtOekNMOU1KcVhYbGNzTHpI?=
 =?utf-8?B?QjJRR3ZXNFh3OWdRMlh0V1RsZ1dJVkJZV0pkZ3Z0c0dPcTRIckY1ZVlUempm?=
 =?utf-8?B?SkxCajFmN3JEQjlTQUNRY0VaTEQzejFHdWIycDlGZ05ncFFCYU83VWE3ZGtw?=
 =?utf-8?B?SnRxbjNEZXhHbXBOU0dDVTYzZmFxbkNlQWZOVVAzSUsxKzFjNVpBdzZJR3E5?=
 =?utf-8?B?ei9iKzdzTFR1d2Z4RHJwck9WZUJaMkg0bkNFUGRYQmNGTDB3NjhvN0htYjZN?=
 =?utf-8?B?QUVwS2VZVXFSVGRKTXdsQVlOT29KME1uMFM5SFh2SWh3NG9SYmJyUkFhSHZU?=
 =?utf-8?B?dkNweFZjMWJhbjFkSjJwK21JZWtiemdBSEV2cDR6YUp0a0VPc1lyR2NYYmEr?=
 =?utf-8?B?WlpqbXRZZnFDZFJhV1UwYkJSUFhTbVE4ekQ0MFZqRFFBd1lTamZjWFpvRlFU?=
 =?utf-8?B?YXgydGUwSVdPMDFKWnhJSE81RjhLMUVROGRSRWg3MldDS1NxOWUyMHJDTXg2?=
 =?utf-8?B?a1NqMkJFNlVIeHlveWh3Q0RrZlRwUERwNjJzci80Y0VYRTZkSGpNdENnc2FW?=
 =?utf-8?B?cU1WZEs5cG1oYWFWQ2xzODNWZGY0Q0VqVExPL2ZhRVoxUk51WG1oRThpQU5k?=
 =?utf-8?B?eCswSENjL3M5Ky9SNmdEUjV6VklMK0NxNmFrS1BQbVZaT2s0TGZpdjZHYnRR?=
 =?utf-8?B?OEJzTElvcnRFck5QODB2N2s2cXIxenIzN1RwNi9WR3FXWnVKYVBKc0N1MGNj?=
 =?utf-8?B?akRZMU1WaEwwNktkcmplYzlvNVF2SzZjcXZjZ0hOQ0NqWng2VllTaVNyUjlH?=
 =?utf-8?B?VERWeW0vRWt1VGIyYmpKTEpXalJ5Zm9sU2RzenRrYU9Mb1F1LzBjd2VzdW9k?=
 =?utf-8?B?WjYzQ2tsb1kycU02a2pMUVhuOVJaNmxoWDNqdE5tR0RtbERkQWQ4cjJkd3VG?=
 =?utf-8?B?MndxdW5haERrQmI0MGk1aWhlOEVmbEN3aDdob2o4RGd2YkRDTk1tcm0wbWtq?=
 =?utf-8?B?V3RhTk9kYnRQR2ZSYTlwMWxFVVpsdVkwZzV1c3p2MGNMVDVtNFFrRVlQQ3Ra?=
 =?utf-8?B?NEdqYWJtWWdxM2NpYzZCWWxmSGVzUUtOOGN3dkpYOWdKU0laS1Y0L0JxK2Ey?=
 =?utf-8?B?MzgwS1ZJaDVqM0Fuckx1eU1ZUHVZUWlKS3kyV3JEWTIwSXMxc0t3a2hKY0or?=
 =?utf-8?B?UDdqSTJlNTFDNm1PTGt1T08wWHh3dDFjaVJFTVA3UmlvMWFBTWN3RkpWZE5Z?=
 =?utf-8?B?cUFEamF1M3drb3I2emVXbnpoMEt5ZWVNNHNiRkxCQWl0WGxLd2N2RFZVeUg1?=
 =?utf-8?B?d1RsMExyMitWZWFJVFdRU24xVm1wUlJZN01lQi9hQ1UwcU1VSnMrUG9sdEhr?=
 =?utf-8?B?VFpxZVRrWllkQTFJa1NNdDNHRXVuVURlMzJ4bHNpZk9xT1M4QkwvZFNQbWZv?=
 =?utf-8?B?MjR1YzRURmtNU1JzU2x5WWZxSGRhYXd5c0dBTVJ3VStOWmlNekMvYVczZmpL?=
 =?utf-8?B?cHVSYTdCZVVUT1dFWVNBbU9qeEJXczlMclRIUk9WT2hMNTVSMHdYTzNjbHVy?=
 =?utf-8?B?WlJhamNyRnhlSkNYQUJ3anRKeG9kTXlUZmFLTUtWYVVlY1ZuQXN4bDF3U25r?=
 =?utf-8?B?cTE3U04vbnlOeElkY1RxeWdrdlRjdG5xTCtLMFNsazNhZTlKWkoxWWV4QThT?=
 =?utf-8?B?RHV1M3FGRUZydlNHMlNpY01xNlRtUzFIOGQ0dHlHemxMUjg5YXgzMlBhRlRP?=
 =?utf-8?B?bURIc0hEYTdhNFphV0NrVk1EMG5SU1NTRVZMYlY0ajZGeWhJMnVvMGRUejRx?=
 =?utf-8?B?d1NkbnY3V3pxdk9WRHZlYk4zS0xDY0ZpVkVTbkdGSzJmbDFaWDRKUU1Bc3Yy?=
 =?utf-8?B?SXd3aUliNUQvL256L290RTlVL1hEQXhvOEFueVdwOVlVdTB0MmJxV1kza1Ez?=
 =?utf-8?B?Y01XQ0Z0SGhSMjlTdCtnWXZ4Unl3Y2QwOHlNaHpRRSszTE5KVGE1NExMMkNp?=
 =?utf-8?B?UkRJQk90N2YwL2NDUGtaTFF6M1ZrMDlWc3ZzSUtPRFdFdDU3TTlmTjFjMG1I?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F9589D83659264594C5BF87FC86F410@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e578a3a-b3eb-47d5-df22-08dafa074c05
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:24:07.3202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQhtwNSfOhkgFFP0KNA0aNGFaWjBM1C0fC3eWTn02tAuS0VJKrqQN1MgOIKysY37oZa9fOZ/E/fjiNvas2e9+zSr9vVCika9du54zQy4r28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1434
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Frank Rowand <frowand.list@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzAxLzIwMjMgw6AgMTA6NTMsIE1pY2hhbCBTdWNoYW5layBhIMOpY3JpdMKgOg0K
PiBUaGUgY29tbWl0IDJkNjgxZDZhMjNhMSAoIm9mOiBNYWtlIG9mIGZyYW1lYnVmZmVyIGRldmlj
ZXMgdW5pcXVlIikNCj4gYnJlYWtzIGJ1aWxkIGJlY2F1c2Ugb2Ygd3JvbmcgYXJndW1lbnQgdG8g
c25wcmludGYuIFRoYXQgY2VydGFpbmx5DQo+IGF2b2lkcyB0aGUgcnVudGltZSBlcnJvciBidXQg
aXMgbm90IHRoZSBpbnRlbmRlZCBvdXRjb21lLg0KPiANCj4gQWxzbyB1c2Ugc3RhbmRhcmQgZGV2
aWNlIG5hbWUgZm9ybWF0IG9mLWRpc3BsYXkuTiBmb3IgYWxsIGNyZWF0ZWQNCj4gZGV2aWNlcy4N
Cj4gDQo+IEZpeGVzOiAyZDY4MWQ2YTIzYTEgKCJvZjogTWFrZSBvZiBmcmFtZWJ1ZmZlciBkZXZp
Y2VzIHVuaXF1ZSIpDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBTdWNoYW5layA8bXN1Y2hhbmVr
QHN1c2UuZGU+DQo+IC0tLQ0KPiB2MjogVXBkYXRlIHRoZSBkZXZpY2UgbmFtZSBmb3JtYXQNCj4g
LS0tDQo+ICAgZHJpdmVycy9vZi9wbGF0Zm9ybS5jIHwgMTIgKysrKysrKystLS0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL29mL3BsYXRmb3JtLmMgYi9kcml2ZXJzL29mL3BsYXRmb3JtLmMNCj4g
aW5kZXggZjJhNWQ2NzlhMzI0Li44YzFiMWRlMjIwMzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
b2YvcGxhdGZvcm0uYw0KPiArKysgYi9kcml2ZXJzL29mL3BsYXRmb3JtLmMNCj4gQEAgLTUyNSw3
ICs1MjUsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBvZl9wbGF0Zm9ybV9kZWZhdWx0X3BvcHVsYXRl
X2luaXQodm9pZCkNCj4gICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQykpIHsNCj4gICAJCXN0
cnVjdCBkZXZpY2Vfbm9kZSAqYm9vdF9kaXNwbGF5ID0gTlVMTDsNCj4gICAJCXN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKmRldjsNCj4gLQkJaW50IGRpc3BsYXlfbnVtYmVyID0gMTsNCj4gKwkJaW50
IGRpc3BsYXlfbnVtYmVyID0gMDsNCj4gKwkJY2hhciBidWZbMTRdOw0KDQpDYW4geW91IGRlY2xh
cmUgdGhhdCBpbiB0aGUgZm9yIGJsb2NrIHdoZXJlIGl0IGlzIHVzZWQgaW5zdGVhZCA/DQoNCj4g
KwkJY2hhciAqb2ZfZGlzcGxheV9mb3JtYXQgPSAib2YtZGlzcGxheS4lZCI7DQoNClNob3VsZCBi
ZSBjb25zdCA/DQoNCj4gICAJCWludCByZXQ7DQo+ICAgDQo+ICAgCQkvKiBDaGVjayBpZiB3ZSBo
YXZlIGEgTWFjT1MgZGlzcGxheSB3aXRob3V0IGEgbm9kZSBzcGVjICovDQo+IEBAIC01NTYsNyAr
NTU4LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGVf
aW5pdCh2b2lkKQ0KPiAgIAkJCWlmICghb2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICJsaW51eCxvcGVu
ZWQiLCBOVUxMKSB8fA0KPiAgIAkJCSAgICAhb2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICJsaW51eCxi
b290LWRpc3BsYXkiLCBOVUxMKSkNCj4gICAJCQkJY29udGludWU7DQo+IC0JCQlkZXYgPSBvZl9w
bGF0Zm9ybV9kZXZpY2VfY3JlYXRlKG5vZGUsICJvZi1kaXNwbGF5IiwgTlVMTCk7DQo+ICsJCQly
ZXQgPSBzbnByaW50ZihidWYsIHNpemVvZihidWYpLCBvZl9kaXNwbGF5X2Zvcm1hdCwgZGlzcGxh
eV9udW1iZXIrKyk7DQo+ICsJCQlpZiAocmV0ID49IHNpemVvZihidWYpKQ0KPiArCQkJCWNvbnRp
bnVlOw0KDQoNCkNhbiB5b3UgbWFrZSBidWYgYmlnIGVub3VnaCB0byBhdm9pZCB0aGF0ID8NCg0K
QW5kIGJ5IHRoZSB3YXkgY291bGQgaXQgYmUgY2FsbGVkIHNvbWV0aGluZyBlbHNlIHRoYW4gJ2J1
ZicgPw0KDQpTZWUgZXhlbXBsZSBoZXJlIDogDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC92Ni4xL3NvdXJjZS9kcml2ZXJzL2ZzaS9mc2ktb2NjLmMjTDY5MA0KDQoNCj4gKwkJCWRl
diA9IG9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGUobm9kZSwgYnVmLCBOVUxMKTsNCj4gICAJCQlp
ZiAoV0FSTl9PTighZGV2KSkNCj4gICAJCQkJcmV0dXJuIC1FTk9NRU07DQo+ICAgCQkJYm9vdF9k
aXNwbGF5ID0gbm9kZTsNCj4gQEAgLTU2NCwxMCArNTY5LDkgQEAgc3RhdGljIGludCBfX2luaXQg
b2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1bGF0ZV9pbml0KHZvaWQpDQo+ICAgCQl9DQo+ICAgDQo+
ICAgCQlmb3JfZWFjaF9ub2RlX2J5X3R5cGUobm9kZSwgImRpc3BsYXkiKSB7DQo+IC0JCQljaGFy
ICpidWZbMTRdOw0KPiAgIAkJCWlmICghb2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICJsaW51eCxvcGVu
ZWQiLCBOVUxMKSB8fCBub2RlID09IGJvb3RfZGlzcGxheSkNCj4gICAJCQkJY29udGludWU7DQo+
IC0JCQlyZXQgPSBzbnByaW50ZihidWYsICJvZi1kaXNwbGF5LSVkIiwgZGlzcGxheV9udW1iZXIr
Kyk7DQo+ICsJCQlyZXQgPSBzbnByaW50ZihidWYsIHNpemVvZihidWYpLCBvZl9kaXNwbGF5X2Zv
cm1hdCwgZGlzcGxheV9udW1iZXIrKyk7DQo+ICAgCQkJaWYgKHJldCA+PSBzaXplb2YoYnVmKSkN
Cj4gICAJCQkJY29udGludWU7DQo+ICAgCQkJb2ZfcGxhdGZvcm1fZGV2aWNlX2NyZWF0ZShub2Rl
LCBidWYsIE5VTEwpOw0K
