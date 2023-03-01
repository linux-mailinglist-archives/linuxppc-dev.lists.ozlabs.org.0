Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7A6A67FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 08:10:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRQNb2Zttz3cf8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 18:10:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lRy9r2gb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::619; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lRy9r2gb;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRQMQ04RKz3cdL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 18:09:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3F/ZMMVTzvzl6SUCYMOttqGlzHMyHktePAfVHEE2+UhyX019KC6Q9njCxikYWfrR6gseVPEFhzmQNq0nNlWvkQ4M+nj8eCNCf/nBL1MQn3ezqy1SRGf+kLaru9RWP+P7jSOAiJsz2syGgzaklz1ZbZZ8AL+0TH2i2Y3ZMZiGeKR2xdS0VmVF0Iu6/3bPk+hx9iV1gk48ZwIX20V95JHYbSFEGlD1FD5EOqsqdOi2tXekBZ3Yw9A1VwyogyXCPJnB67UZC+EOHQVrUwrVbFV67KUbKLNIOciCAkT3VJdNM37vr515S9qpA1UhIdrrm6wogdoyhDKr2EvHF+gvLvVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SK06v0SexPeyAuMFjcNI9VYl9NXc6NlSXzv8bfLICdU=;
 b=cjXDe04O7aNDGjx5V5Mxb6fkPAOt7AMSvHtfvidxVGT0x5GzV2XxOer03/8n9SfFEdRGREIcnhb+1PpP/Kr0kJoQGdg9mS19Vo/Zi8OBvIHGjlcfwyhjbgzM23vx1BrSxrx3i7TrS4/wDwcnIbIHf0mC8L3MuW2ukvmSVwg2A4sl0IrS1c0TzEENQi8EV77ceJmsIjUpiz+RTgHTSfZ79bACr4e3VPqzOk1WLEzms7H9wHbGYn+9dvdNP6CRF07MT9nTPSSm8ClmDwfJRTwlgJV1Bz+psupasTqAwnukpSpaXHU2YRTYEmguW8JhdFYFvILT/s+mqfaXpBypFIxi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SK06v0SexPeyAuMFjcNI9VYl9NXc6NlSXzv8bfLICdU=;
 b=lRy9r2gb48eR4iuvNjSrMYCbyWyZZjmfrggwPZM+jhoIuPpI3DlsEa27TEgtY2lHH5G8i5Y5GDGPT3vRA7o8s1yrW2ZjiZKZX7TCnas9MkvOFYIGaBG8o7Q3BY6A/vH/Q5q67kVKFwc7kI4WtNWxjuZljYhU+zERZhvPhsU/Nr+UQBBaM5tYe0iGNnzaOy3RTDnf4iiUPvy0/RIUTNy4SGvi4Uo25RA32fiwFUQMIbMfuvlImnB0pbqOOB5ngRnoEzldk8wCwi+0ew6R9Zi+VcTtGJjDEB+N3MU/nLR60LAkoAnFVyVE9YYPOPetg0j580bL9GXv2Pqc0fAx9tCqqg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 07:08:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%6]) with mapi id 15.20.6156.017; Wed, 1 Mar 2023
 07:08:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "mail@thaison-nguyen.de" <mail@thaison-nguyen.de>
Subject: Re: Patch for audio on iBook G4 (powerbook6,5)
Thread-Topic: Patch for audio on iBook G4 (powerbook6,5)
Thread-Index: AQHZS744v2rRV7zly0K4wBIFxFjXOa7lgdUA
Date: Wed, 1 Mar 2023 07:08:44 +0000
Message-ID: <52269cbe-f383-a76d-d33e-8c96489769e4@csgroup.eu>
References:  <ey8hrui03zsh-rkihqz2n7u2i8dd3ja32qgpr-1mta0e-nkf4tu8c3cc4vwcuq-49fkuy-mta0mx-f9h480-wnl3d8-pcij4tmg3beq2a3p39-rkd67kmq9hs4iz08io-uvtksdl00562enem8stlzawo.1677618681472@email.android.com>
In-Reply-To:  <ey8hrui03zsh-rkihqz2n7u2i8dd3ja32qgpr-1mta0e-nkf4tu8c3cc4vwcuq-49fkuy-mta0mx-f9h480-wnl3d8-pcij4tmg3beq2a3p39-rkd67kmq9hs4iz08io-uvtksdl00562enem8stlzawo.1677618681472@email.android.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2180:EE_
x-ms-office365-filtering-correlation-id: d5243d99-2603-4ff6-1091-08db1a23cb5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  GFJpYRq2WvjDU0PZUkrIoUln1IXGywbDvZif00RhVLQW+aPc1963QpsSTFvN6UQ0OxFbf7oifCu8tU+UNlrnkOAN7hh1EGeMEcSeG76oWHIDpUBBvBk9hb0kkq6Wq3PVA7lcHKuHCo3VEwhna3kYM8hC2AyM7cfVT07vqUZo0OzhBbGikLeI1BNZnOMw/XRf/5I6ubwLivqSXXBFSpJnxd52ySN+NIBS8QLnMSmK3EQojn88M2m6vWGqXksPUGtjyq34Xbggm+8O4EkkVUeq2/T1MnX59okhbew3ijJQxviKtakuxvbOHfHDDlGwCq13r/VNFZagYWEyvqqbDKJiXYHOB/xgmSH6I1QSCd2FAqJLwF3yDiE5hHVSH7Mp2xTBgpYOtzCe2mtpHu1foRNmEVnJFcngkrPGZYvBT54BHl7uwFYnP8rCSwaKfzue6pNrpkLMjz5nfqIhuXWnrmPjUBjChmuvwD30FQEQ1DP1k9ya7ZndOGdOqpxP1aKjXgCHJmP7EgQWV5aUBm3Go82IWalVDH0u5yiDGFFPXfEk66TADNnF2xHWHNYylUFOqwbYpsK/HJ0xFe6m2REOPeWopA/3PMSgXB4nusPHFTSvwd85x2SOrAM8mfBVNun9IdjTBOcsi6xLwn/wmoIRlncaNpFDPsf8zc1kz+MTn6BMw704VeUED54mubBEP5LTDKURhMtEYAfJpJARN1IudYXM60vZGAHyRh3yzYeYt4jajOQaLjKYENK5kZG9qc9s4n5Q
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199018)(31686004)(36756003)(478600001)(316002)(54906003)(4326008)(122000001)(8676002)(66446008)(64756008)(76116006)(38100700002)(6916009)(66476007)(6506007)(6512007)(2616005)(186003)(91956017)(26005)(71200400001)(6486002)(966005)(5660300002)(31696002)(66946007)(66556008)(44832011)(4744005)(8936002)(41300700001)(86362001)(2906002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Tk1YaTRZZCtjSkQ3anNGNjV4cG5zUVNPYnh2UmFPMkxFdzNXZ0d3MkVIRjE4?=
 =?utf-8?B?M1pqQVl5VGtib2NXODNKSWN3VDA3YUpOb2Z5Uk01bFI5M1pyNElWdkRPM2li?=
 =?utf-8?B?WWlLekJJTnFWSm1WcCt1YXFyaG9vVWJaTGVaYlFSOHdFUXo0NXZGRCtXaGJl?=
 =?utf-8?B?cTN6MEVZZ1NxcEh0NGx2SE9OOWJTMGlhckViSERUbzdYUCsvbnV2ZGZtYkg3?=
 =?utf-8?B?WUhGenhDK0dmZjVYcVFXUDBwL2ljTnR6SFBOTEdRQ2hjRFlDSjNsS3QzRE9h?=
 =?utf-8?B?OW1DSjZzcGpHaG40bFBuemZQR3psWXU5WE4yRTkzZVpvWEk5RXZwK2ZCUVRG?=
 =?utf-8?B?T2F0azVvRmpjM3lJcTRES3VJMTF6a20ycTYyb0xXbnFUQ05uWVJ1RnBFMXgy?=
 =?utf-8?B?RllnbFl6RWl2ZW5wRmpNZkZBZDJOK0w5b014RC83ZU11LzBWNnJ6NkluY1BJ?=
 =?utf-8?B?OFlqT1JsS1k3cUdFV3VsM2RjbWIrVXZsczViWFlqUG9BT3FvZXlXcWlxbHNX?=
 =?utf-8?B?UGtQNnd0bUQ1NkRYWkNmdmtjZGUxdGthRzZlSnNHSkQ0dXBaMnpnRXVYOG9h?=
 =?utf-8?B?R2dQWDFEcWEvNXd4ckI2djVGZTBsUktDSFErR2MzSUZHU0pTaGNQZGN0MDkz?=
 =?utf-8?B?bzJlaWxXY1FrS2F1SG1iNGRCMUxZU01EZkFBMkM2OVd5bFA0RFltTFBZa1FQ?=
 =?utf-8?B?VUdydGJPVVdqSWt5VnNLekFYdjhHeGpjK0o3VHNCZklYL09NZi8zcW9RNGNF?=
 =?utf-8?B?OUJTTkk0SzY4czhsT0ZRM0hvZjBwY3JXU0NJdHU5TDAwWm1KaS8zSnZERFNZ?=
 =?utf-8?B?YytHaFc0eVY0RDBRL1luTkRnR0lPWndKelhwWS8yb0JhZXV5RHZGeFA0enRv?=
 =?utf-8?B?KzF1TmJ0Z2ZPUCt6ZENlbVJoNy9YQUQ4Z2d6ZHpodVJrOVNUNlEvODAwRmcz?=
 =?utf-8?B?NmhKNzlqNG5reDFtdDNBTlhFMll0eDB2YUNhaWVDYkJqSFl4VU1UY1lBK3NS?=
 =?utf-8?B?ekFGeXZCYnpWZEZEVjhoK3ZpUTMyMCtrRlNtRy9KZzRwRTk5YWI1bVNRZ0JR?=
 =?utf-8?B?V0QvTUFoSzVXeC9ycW4zb012QkNPK3VDeVhGTm9lYzMyQmJmTGVIQVdYa2Mr?=
 =?utf-8?B?RUxYbGZNeXp1NTk1dU81aWV3OExiaTFob1ZvanZwekpPbm55blFneEM2dVIy?=
 =?utf-8?B?ZVgyQ3JhaXJSL2ZGL1V3N1cvK1ZNZjhoL1hZWUdzM1ZNRkJXR3pVU0lCMmNM?=
 =?utf-8?B?K3NTT1lvSU15bEw1a3cwYktQVmxzL21Gc1J4MjF1Z2pjTXo3L2RxN1hNMlJ1?=
 =?utf-8?B?dVlyamJRK2liNGZ4Zk9pQVpEbk0zK3lRU1BzeExtNFFKLzdrNndoSnQwelJS?=
 =?utf-8?B?Z2R2bnVxYitzYXhtelpDc2tCVUZvYjE4TEl1VXBIelNibDNNWTVzMFMvcVh2?=
 =?utf-8?B?WlZPUWxWYjRVK0lUelR0RUdjSzdhRUxsSEhzV2xVSzVZNmh3MGNXZUpnaHFt?=
 =?utf-8?B?VHQyZlpTN0NrYXh3YnRiclU5OWtMSnZjTUdPbWMrSmZrVEJYVDZoTklJWW9i?=
 =?utf-8?B?WHJ3TWhPODQ5bVhSVlg4K0VCOEQ0TGdzeEtDMTI5NVpQVnRIYUE2RWUwckFr?=
 =?utf-8?B?QWVVY09BRUxLZ1hWUGJoNWZuL09OZWJ0NXhhR0paeWNsUWxPS3c2R2xseEpQ?=
 =?utf-8?B?Y1RxK0VWYlB6YnBnbnBaYklEcnBXYlpYYUJldU9xR2l2THhVSFY0d0dvNUhu?=
 =?utf-8?B?QWVTVFNvOENVL0dhMXd6SkZ6MmNydHlTdTN5dllPMnRJVHRCTnoxM0ZoZ091?=
 =?utf-8?B?TkZZNml4dUh5dDhRZVY2SmYwUTQ5TmRUY2dkK25Hd3VOZ3BmaU9BOW5UVDR6?=
 =?utf-8?B?VnZGQU1ZTUJBbTJJN2VEQmFxYXVETGhuUFZvd3pwNjhURm9pWkVuckErdGpE?=
 =?utf-8?B?S1VyM1ZWT3lpdldDODQ3M01iMWZQRHUyOFZqbGpnb3puK29qV2xObDRKSXVJ?=
 =?utf-8?B?QitianpmVlJxWjZnZUdhS0JoZ3pHYTRLRUpHOVhzSzhHWlBtQXN0bjdJOGVR?=
 =?utf-8?B?U2hEbUl2cDdLNE4vQ1ZGUDhQdERZMHhsRm56OEMwYUo4a1M0YUNSWXg3WXJs?=
 =?utf-8?B?QjdqS0c3OGZvZHNBejJtZ056cVl5b0pDaThQRG0xMUE5bDBLZ2xTdEozWUpJ?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20643C83213A4A42B27AC270B1F3E2A8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d5243d99-2603-4ff6-1091-08db1a23cb5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 07:08:44.0549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UUSD5OIwPUzEY/XIxxOl+6FqhOPRqtvNt5H52Pp2b+/L5RHJ7FaV8AMWOKkDlrIm3pqBte1IHsAMULn93ihHmefUKnzF537e2RaRe/XmKmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2180
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzAyLzIwMjMgw6AgMjI6MTcsIG1haWxAdGhhaXNvbi1uZ3V5ZW4uZGUgYSDDqWNy
aXTCoDoNCj4gSGkNCj4gDQo+IEkgaGF2ZSBhZGRlZCBhIGJ1ZyByZXBvcnQgYW5kIGEgcGF0Y2gg
cmVnYXJkaW5nIGF1ZGlvIGZvciBpQm9vayBHNCANCj4gKHBvd2VyYm9vazYsNSkgb24ga2VybmVs
Lm9yZyBidWd6aWxsYSwgYnV0IG5vYm9keSBoYXMgcGlja2VkIGl0IHVwLg0KPiBodHRwczovL2J1
Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNjUwNA0KPiANCj4gTm93IEkgYW0g
dHJ5aW5nIHRvIHN1Ym1pdCB0aGUgcGF0Y2ggaGVyZS4NCj4gDQoNClBsZWFzZSByZWFkIGFuZCBm
b2xsb3cgdGhlIHByb2Nlc3MgdG8gc3VibWl0IGEgcGF0Y2ggOiANCmh0dHBzOi8vZG9jcy5rZXJu
ZWwub3JnL3Byb2Nlc3MvNS5Qb3N0aW5nLmh0bWwNCg0KUGF0Y2hlcyBtdXN0IGJlIGluIHRoZSBj
b3JlIHBhcnQgb2YgdGhlIG1haWwgYW5kIG5vdCBhcyBhbiBhdHRhY2hlZCBmaWxlLg0KUGF0Y2hl
cyBtdXN0IGhhdmUgYSBkZXNjcmlwdGlvbiBvZiB0aGUgY2hhbmdlLg0KUGF0Y2hlcyBtdXN0IGJl
IHNpZ25lZA0KUGF0Y2hlcyBtdXN0IGJlIHNlbnQgdG8gdGhlIHJlbGV2YW50IG1haW50YWluZXIo
cykgYmFzZWQgb24gdGhlIG1vZGlmaWVkIA0KZmlsZXMuIEFzIGZhciBhcyBJIGNhbiBzZWUgeW91
ciBwYXRjaCBpcyBmb3IgdGhlIHNvdW5kIHN1YnN5c3RlbS4NCg0KQ2hyaXN0b3BoZQ0K
