Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3ED53268E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 11:36:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6pxV43dqz3byk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 19:36:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::624;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::624])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6pwX49Zxz3bkp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 19:35:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Itqtc8hN8lCR4cH1tNMsYFe9/la8+qadMAdU62SGs7RoNEhp15CJ00i5e4u4vyOeAn/U/jVURakMb7P2H/zsWjdDJcabHxLgcCImYZ59N9tBDQC7yZ2/d36WJRHnkBJXfGy/0LuOAG2z6ka8DSPyj9WHGKIJvGdrhwF5lzA0U4GCq4dNx9W4OkntLyfOHGs5jWyEAL4sTr6LlzAikY5BHEsa4nO0ivYJyYmAUdFHrWx+skKyOP2NVOqFX+rUvIkSkcY7jxObZkOg6brh3RGy+g4TXdX6bPx8y9RkPt/b1fjlJ1An5/J1oFZX1toHLTcWJBPocNuWqBG9ltoc5EUSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L03B8B1fPF8mLmITth/biL5u1Pg0+VJEkQGuU+NPedU=;
 b=hAvS0G7Z9tBiOk0GK+/DsaouFuV1zK76/8IcQ6I15zHFAPFu6t5znJ6fodQn1hUNrrOEG4ipaHUCW4xfKFDOVdkaERhMPgzDG3aqAtjgdZzkRcKuZCHJaqsv4OkiWMNn85OY7y8g0KWuGrKWkldVkWmqQOrPKZpmupBvAZl7fEKpcNO6JhKr3MVTZyXe5c9rZgxGmjM3bkvUEbo4JEXC3HakT/UO8SPgoMr/H1yRUa2COhUs4BH7XU3scCRQOAEtlTITGA0QXfCSt8p4iDWEt6Z0goYMiJcnRiTszarCsJx1qeVntbaG8lZysOooWfJxss9cbbkJlkUx6SMfLUZJ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3623.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 09:35:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 09:35:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Thread-Topic: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Thread-Index: AQHYbs5qyDK6/X7ZxEy6GUPocR2PqK0txaCA
Date: Tue, 24 May 2022 09:35:36 +0000
Message-ID: <6be5c941-07b0-64d5-7f36-fe5770fb5244@csgroup.eu>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-5-sv@linux.ibm.com>
In-Reply-To: <20220523175548.922671-5-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a268fdd8-7fd5-405d-a2dd-08da3d68c1c1
x-ms-traffictypediagnostic: PR1P264MB3623:EE_
x-microsoft-antispam-prvs: <PR1P264MB3623F85589E327924524F327EDD79@PR1P264MB3623.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WcNwR04NS+wO/VpVp/KodwVn4pgxbtFyRI0/yG6Mnbi5n/wHSZHKE6Nx6cwdHD3CjyDDNk7wnI3JKiwdFiCKa7D225QyfY7ZbwB8vOl/z+24GzL2e6vBNSissJFlO3n0So62U9BZxWTNyl/4MUvymOP+uLfHHn6N0NfS5/VbMAVtqSph1XtMjeq5l8QuUY+VNGzGjt26h5UEGaLc7GqlAhzNUP0g7PHFmPORHnMRyglzFyw/1P/QD1Zf+IvinGK/yUBmiK32vGJa+hfSG8DZ3/eL31PH9W8mS8Z9wWEFary8TI/5zoAyXd6A76w2E2/ncbp4Qd3OmmGKkTuQyKT/r37oBhuhTfqDuZLAVw1LS+DlJdwcO9vO8KkaLAFOQXV16qlBHa0qaMBg2yjbztCbRqsQhxW+rW6Qks4LynoUpc9iTmXbD4QfPCO/156fzJKmhTAcJEtSzZi0knb+MQcb2TpVu4yGPKBXh650Yy/YV9Z8wlN2pUcrieqFaZsbsgoCEOzCV3Djc1l0i5oDTU5kZJjNuuYjy7Yuf/wDXulAI4ZWIt0mU+UT22vDspwwNJGbUWcZbZsYhcrMwys7afyxSHwbaecDP9qwZIASTWmMTWTte+WNXOARHMf++XNMTSuD1svpoID0VrO/iiTLIoMD7kQxsc7lud6A4RNx2rLxBHd1Qrqe4UZHSGQSoO+2pWsojSk0pU5H9/74bwqaCTnwWkQSh1mjI7QEhF2LHHBG64CI4D4z7MS3RisnY7wfp21J3Y9RMUY057d+zCFxc8c6hc2pnOeqCR99UN40I47EBzCVLCJPANqql6fFjDynGIgj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(8676002)(44832011)(66946007)(4326008)(66556008)(91956017)(66446008)(76116006)(64756008)(508600001)(66476007)(54906003)(110136005)(316002)(6486002)(71200400001)(8936002)(7416002)(2616005)(26005)(186003)(5660300002)(6512007)(6506007)(2906002)(36756003)(38100700002)(31686004)(86362001)(31696002)(122000001)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVE0aE5kNkRqTUJndjhYK25OeWZxOU1MK1pKaW13REsvRUxaT0lUd3ozL1JD?=
 =?utf-8?B?VjB1TnFVUDlEL2hiUGhxb3p4ODl3ZzdaaURMN0puYVEwY0F3Q2s0L0F3a0Zo?=
 =?utf-8?B?M0VzejE2VDdaM1FxWU1jbGNrTXY0UXVYMWlhOXdHbGtuNEl5MXZ3VzVvaTNR?=
 =?utf-8?B?NnJqWEttaWVtMC9rdzlhOGcrM2FtSDRsRUl5S0pPNjFtSWNyVWk3N2thNTdC?=
 =?utf-8?B?ZlJSRGRhYnhuNG1BSzBYSkhhNVdlM1YxbTdWYU5razArMVhWSCs2KzFCSUNZ?=
 =?utf-8?B?cGVZNjgvanhsTlBEYVNRK2daTkZrN3ZvaGFFVkZRakhEcWVTUEJkMUtYSGxa?=
 =?utf-8?B?T3dXWTJudUJTeHpwS1JTRW9tczV4UjAxUG4vTGVRdU9jM0tpaTJ4cU1IRVdu?=
 =?utf-8?B?b0ROa0hWSVYweXV4N2xqUm1RdS9NVWY5TDRqcGFiWEgvWVlCeUp0ZlBZcWZt?=
 =?utf-8?B?ZHI5aHhaY09Eem4vanp5VFVXZ01HSnRZb3hrWktQVWFjZG1HMVNPa1VzS3hT?=
 =?utf-8?B?Z0ZZY3lXQnh5TUZyZzBBcVlxdWpFMy9uYUNsbFYrSitsY2RwT3c5OXQ0ekQ2?=
 =?utf-8?B?cHBQbFJsQ2Z4RHBCcXdwelY5NkZBQjJDdlBhelNyOXlZcWVZd3FmaE1RYzBJ?=
 =?utf-8?B?M1B3cnFBSkVtMjZRdjd5RlpVUXFMSDFRTUtvUnJGVm5HYnY4S2QycG5RRTFK?=
 =?utf-8?B?YUlsZHhVTjBBcjVqVTVlWWlSUjIvZWg3aHFUQlBLNGdNc2NTNlRGWi9DRk1k?=
 =?utf-8?B?OFBlR1o1V2NXK2RtcXVNWUZsT0c3U2tNWVJqemdQcU10cUl5UXlEc2lmQTNY?=
 =?utf-8?B?YzIyam1MeGhJblZLVUFiTzFDbDlpRWVTL1d3MngweEp4a2RUZmFDaTNLMlhr?=
 =?utf-8?B?bEtwSG8vbzd1RnZYeFAzVDJWTmZ4KzRyLzJybnZUZUtoYXVZOFZnaUhCS0xN?=
 =?utf-8?B?TXZTMldmbGcxTVJCZnFlMzNueUNGQzN3S00yNmtyeGs4aTZicXI1eEVENHAx?=
 =?utf-8?B?UnMxMStDNkNkYit2VkJHY09yL1ZhYTlKVGxvaTJMT1JiY0g4NGxEWStXWlVY?=
 =?utf-8?B?QVE4dHBMeCtzcmprZEhTQnZhMnN2U0VMTmE2TnFDTjlqSHQwYWpyV0JzN3lB?=
 =?utf-8?B?VkVySk5NT3p1bzE5WUhHMWJHUXBzbE9GbG9DR3phVDVtT3RHL2N6aDI3bGdy?=
 =?utf-8?B?WUdpKzhleEU2THlGSWJ3VGtGZmxHRGVFUWR4bW84MjB3NmErTzhJazN5YUh3?=
 =?utf-8?B?WHhpMzl0cGNKZXpMb0Z4RS84bDBJSUlFb2lGWTYraDFwS0JtN2NxZjZRN3Vi?=
 =?utf-8?B?b1M4ZlgzNzVaYWRQRWdYV3NFT2NxVWFISXNGSTh4dytRanA4WklyY1JCY2F3?=
 =?utf-8?B?RmkxT1ZmcHFVMDM0NEp5TlJ0eDU0RVkzQ3FyNjE5TmF2TmJFTkp5UG1HeXFZ?=
 =?utf-8?B?UzVWRmJuV3kxVGxzOGw0SE11aFJzQ3g1elg1d25yRXRUb0E0MEVCZElaelNW?=
 =?utf-8?B?VjZ3Q0JKdVlrYUtGQ0pPSVh1V2hrbTBWZWI4R25lMkZYMGtvNFBFVkgyb0lw?=
 =?utf-8?B?eS9tenlIeHVYYTlDa1FqcnlBQUdTNUJFZzllS0gzWTJJWHRReGRvTlFOT1Fk?=
 =?utf-8?B?WWRVYnFUZ1pEQ1NVRWxiQ3FSTGU3bm9WUDBkdk1OdEZOelhUaERnU3FOelEv?=
 =?utf-8?B?YzN3dUY4bjlOT1BMeGp1R3Q2WlNNc1ZwL01zV2U1T09TZzZTY3ArZE40NjlB?=
 =?utf-8?B?d3FWTC9sV2Rhd2JwTFl0R0IxTC9ac3p6RU5oUlZkMWxaQkkzLzVjZ2RocWZX?=
 =?utf-8?B?NnNrY3hvRjk2MXQ2c3M4WkZTeExYazRLMUhDeSt0KzBOazJ3czhZWHdjS1J6?=
 =?utf-8?B?RC9OdG9GdFpOWVFWUkVwUFprOGlPVm9URVAwL052d1Q1RUVsbEd6dEpoYnA2?=
 =?utf-8?B?ZHVUZUxOaEd1K0VBcm5CUGdheTg0U0VqK29RTXdIYXRzdU9xcGIvUnNaTURy?=
 =?utf-8?B?WE82SHp3ZGxHc0JrQ0FlSS9tQTNkc1dmOFFVMXlFRFFoejhRMUxDV3h4R1JV?=
 =?utf-8?B?b0prUTZVQkF3R1R0MG0zbWFpQTNwTGh4V3Bsa1RWQVZPOVdGMGcwdG9xcGhP?=
 =?utf-8?B?V3RqOVoxdkViMkQyUnFZK3V2U014aTJXUm1DU05KVTNFM1JoMG9kQ0tpRHhU?=
 =?utf-8?B?SXVIOXc0dVY5NjBBcFl3c3dFUEZxdDdGQkFPZDVkSWNkN25ka3BNaFZkSCtL?=
 =?utf-8?B?N0FJOVVMcFRhSEQ0WDZyK21iakMyV0YreEZwNjhoMWJkamg3bElCd09HRjAw?=
 =?utf-8?B?UTVvcHpmTHRSVUtCVURhY0dXWk1jcyswaiszdXgwYkYvVTVReHVqMEMybE9F?=
 =?utf-8?Q?AT14KyPnZ9SLp9s1rvTCRgym9cCBCbN3xHnVX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FB7F29D7273E34ABD7EEA366D01A71C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a268fdd8-7fd5-405d-a2dd-08da3d68c1c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 09:35:36.2463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2MZwA/8BgWY35OPbeeEmrT5KkWexTuxO/sI9WC4SUefqXkdpfNnG8rEJ7IGbKzXcgu9au3lDLuBXpdAaIyAWWJVHCq+xSwy6PNFG7DYYMng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3623
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
Cc: "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzA1LzIwMjIgw6AgMTk6NTUsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBUaGlzIHBhdGNoIGVuYWJsZXMgb2JqdG9vbCAtLW1jb3VudCBvbiBwb3dlcnBjLCBhbmQN
Cj4gYWRkcyBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyB0byBwb3dlcnBjLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAxICsNCj4gICB0b29scy9v
Ymp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYyB8IDE0ICsrKysrKysrKysrKysrDQo+ICAgdG9v
bHMvb2JqdG9vbC9jaGVjay5jICAgICAgICAgICAgICAgfCAxMiArKysrKysrLS0tLS0NCj4gICB0
b29scy9vYmp0b29sL2VsZi5jICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrKysNCj4g
ICB0b29scy9vYmp0b29sL2luY2x1ZGUvb2JqdG9vbC9lbGYuaCB8ICAxICsNCj4gICA1IGZpbGVz
IGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBpbmRl
eCA3MzJhM2Y5MWVlNWUuLjMzNzNkNDRhMTI5OCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBj
L0tjb25maWcNCj4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gQEAgLTIzMyw2ICsyMzMs
NyBAQCBjb25maWcgUFBDDQo+ICAgCXNlbGVjdCBIQVZFX05NSQkJCQlpZiBQRVJGX0VWRU5UUyB8
fCAoUFBDNjQgJiYgUFBDX0JPT0szUykNCj4gICAJc2VsZWN0IEhBVkVfT1BUUFJPQkVTDQo+ICAg
CXNlbGVjdCBIQVZFX09CSlRPT0wJCQlpZiBQUEM2NA0KPiArCXNlbGVjdCBIQVZFX09CSlRPT0xf
TUNPVU5UCQlpZiBIQVZFX09CSlRPT0wNCj4gICAJc2VsZWN0IEhBVkVfUEVSRl9FVkVOVFMNCj4g
ICAJc2VsZWN0IEhBVkVfUEVSRl9FVkVOVFNfTk1JCQlpZiBQUEM2NA0KPiAgIAlzZWxlY3QgSEFW
RV9QRVJGX1JFR1MNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2Rl
Y29kZS5jIGIvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvZGVjb2RlLmMNCj4gaW5kZXggZTNi
NzdhNmNlMzU3Li5hZDNkNzlmZmZhYzIgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29ianRvb2wvYXJj
aC9wb3dlcnBjL2RlY29kZS5jDQo+ICsrKyBiL3Rvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2Rl
Y29kZS5jDQo+IEBAIC00MCwxMiArNDAsMjYgQEAgaW50IGFyY2hfZGVjb2RlX2luc3RydWN0aW9u
KHN0cnVjdCBvYmp0b29sX2ZpbGUgKmZpbGUsIGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzZWMNCj4g
ICAJCQkgICAgc3RydWN0IGxpc3RfaGVhZCAqb3BzX2xpc3QpDQo+ICAgew0KPiAgIAl1MzIgaW5z
bjsNCj4gKwl1bnNpZ25lZCBpbnQgb3Bjb2RlOw0KPiAgIA0KPiAgIAkqaW1tZWRpYXRlID0gMDsN
Cj4gICAJbWVtY3B5KCZpbnNuLCBzZWMtPmRhdGEtPmRfYnVmK29mZnNldCwgNCk7DQo+ICAgCSps
ZW4gPSA0Ow0KPiAgIAkqdHlwZSA9IElOU05fT1RIRVI7DQo+ICAgDQo+ICsJb3Bjb2RlID0gKGlu
c24gPj4gMjYpOw0KDQpZb3UgZG9udCBuZWVkIHRoZSBicmFja2V0cyBoZXJlLg0KDQo+ICsNCj4g
Kwlzd2l0Y2ggKG9wY29kZSkgew0KPiArCWNhc2UgMTg6IC8qIGJsICovDQo+ICsJCWlmICgoaW5z
biAmIDMpID09IDEpIHsNCj4gKwkJCSp0eXBlID0gSU5TTl9DQUxMOw0KPiArCQkJKmltbWVkaWF0
ZSA9IGluc24gJiAweDNmZmZmZmM7DQo+ICsJCQlpZiAoKmltbWVkaWF0ZSAmIDB4MjAwMDAwMCkN
Cj4gKwkJCQkqaW1tZWRpYXRlIC09IDB4NDAwMDAwMDsNCj4gKwkJfQ0KPiArCQlicmVhazsNCj4g
Kwl9DQo+ICsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvb2JqdG9vbC9jaGVjay5jIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+IGluZGV4IDA1NjMw
MmQ1OGUyMy4uZmQ4YmFkMDkyZjg5IDEwMDY0NA0KPiAtLS0gYS90b29scy9vYmp0b29sL2NoZWNr
LmMNCj4gKysrIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+IEBAIC04MzIsNyArODMyLDcgQEAg
c3RhdGljIGludCBjcmVhdGVfbWNvdW50X2xvY19zZWN0aW9ucyhzdHJ1Y3Qgb2JqdG9vbF9maWxl
ICpmaWxlKQ0KPiAgIA0KPiAgIAkJaWYgKGVsZl9hZGRfcmVsb2NfdG9faW5zbihmaWxlLT5lbGYs
IHNlYywNCj4gICAJCQkJCSAgaWR4ICogc2l6ZW9mKHVuc2lnbmVkIGxvbmcpLA0KPiAtCQkJCQkg
IFJfWDg2XzY0XzY0LA0KPiArCQkJCQkgIGVsZl9yZWxvY190eXBlX2xvbmcoZmlsZS0+ZWxmKSwN
Cj4gICAJCQkJCSAgaW5zbi0+c2VjLCBpbnNuLT5vZmZzZXQpKQ0KPiAgIAkJCXJldHVybiAtMTsN
Cj4gICANCj4gQEAgLTIxODMsNyArMjE4Myw3IEBAIHN0YXRpYyBpbnQgY2xhc3NpZnlfc3ltYm9s
cyhzdHJ1Y3Qgb2JqdG9vbF9maWxlICpmaWxlKQ0KPiAgIAkJCWlmIChhcmNoX2lzX3JldHBvbGlu
ZShmdW5jKSkNCj4gICAJCQkJZnVuYy0+cmV0cG9saW5lX3RodW5rID0gdHJ1ZTsNCj4gICANCj4g
LQkJCWlmICghc3RyY21wKGZ1bmMtPm5hbWUsICJfX2ZlbnRyeV9fIikpDQo+ICsJCQlpZiAoKCFz
dHJjbXAoZnVuYy0+bmFtZSwgIl9fZmVudHJ5X18iKSkgfHwgKCFzdHJjbXAoZnVuYy0+bmFtZSwg
Il9tY291bnQiKSkpDQo+ICAgCQkJCWZ1bmMtPmZlbnRyeSA9IHRydWU7DQo+ICAgDQo+ICAgCQkJ
aWYgKGlzX3Byb2ZpbGluZ19mdW5jKGZ1bmMtPm5hbWUpKQ0KPiBAQCAtMjI1OSw5ICsyMjU5LDEx
IEBAIHN0YXRpYyBpbnQgZGVjb2RlX3NlY3Rpb25zKHN0cnVjdCBvYmp0b29sX2ZpbGUgKmZpbGUp
DQo+ICAgCSAqIE11c3QgYmUgYmVmb3JlIGFkZF9qdW1wX2Rlc3RpbmF0aW9ucygpLCB3aGljaCBk
ZXBlbmRzIG9uICdmdW5jJw0KPiAgIAkgKiBiZWluZyBzZXQgZm9yIGFsdGVybmF0aXZlcywgdG8g
ZW5hYmxlIHByb3BlciBzaWJsaW5nIGNhbGwgZGV0ZWN0aW9uLg0KPiAgIAkgKi8NCj4gLQlyZXQg
PSBhZGRfc3BlY2lhbF9zZWN0aW9uX2FsdHMoZmlsZSk7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0
dXJuIHJldDsNCj4gKwlpZiAob3B0cy5zdGFja3ZhbCB8fCBvcHRzLm9yYyB8fCBvcHRzLnVhY2Nl
c3MgfHwgb3B0cy5ub2luc3RyKSB7DQo+ICsJCXJldCA9IGFkZF9zcGVjaWFsX3NlY3Rpb25fYWx0
cyhmaWxlKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICsJfQ0KDQpJIHRo
aW5rIHRoaXMgY2hhbmdlIHNob3VsZCBiZSBhIHBhdGNoIGJ5IGl0c2VsZiwgaXQncyBub3QgcmVs
YXRlZCB0byANCnBvd2VycGMuDQoNCj4gICANCj4gICAJcmV0ID0gYWRkX2p1bXBfZGVzdGluYXRp
b25zKGZpbGUpOw0KPiAgIAlpZiAocmV0KQ0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9l
bGYuYyBiL3Rvb2xzL29ianRvb2wvZWxmLmMNCj4gaW5kZXggYzI1ZTk1N2MxZTUyLi45NTc2MzA2
MGQ1NTEgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29ianRvb2wvZWxmLmMNCj4gKysrIGIvdG9vbHMv
b2JqdG9vbC9lbGYuYw0KPiBAQCAtNzkzLDYgKzc5MywxOSBAQCBlbGZfY3JlYXRlX3NlY3Rpb25f
c3ltYm9sKHN0cnVjdCBlbGYgKmVsZiwgc3RydWN0IHNlY3Rpb24gKnNlYykNCj4gICAJcmV0dXJu
IHN5bTsNCj4gICB9DQo+ICAgDQo+ICtpbnQgZWxmX3JlbG9jX3R5cGVfbG9uZyhzdHJ1Y3QgZWxm
ICplbGYpDQoNCk5vdCBzdXJlIGl0J3MgYSBnb29kIG5hbWUsIGJlY2F1c2UgZm9yIDMyIGJpdHMg
d2UgaGF2ZSB0byB1c2UgJ2ludCcuDQoNCj4gK3sNCj4gKwlzd2l0Y2ggKGVsZi0+ZWhkci5lX21h
Y2hpbmUpIHsNCj4gKwljYXNlIEVNX1g4Nl82NDoNCj4gKwkJcmV0dXJuIFJfWDg2XzY0XzY0Ow0K
PiArCWNhc2UgRU1fUFBDNjQ6DQo+ICsJCXJldHVybiBSX1BQQzY0X0FERFI2NDsNCj4gKwlkZWZh
dWx0Og0KPiArCQlXQVJOKCJ1bmtub3duIG1hY2hpbmUuLi4iKTsNCj4gKwkJZXhpdCgtMSk7DQo+
ICsJfQ0KPiArfQ0KDQpXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gbWFrZSB0aGF0IGZ1bmN0aW9u
IGFyY2ggc3BlY2lmaWMgPw0KDQo+ICsNCj4gICBpbnQgZWxmX2FkZF9yZWxvY190b19pbnNuKHN0
cnVjdCBlbGYgKmVsZiwgc3RydWN0IHNlY3Rpb24gKnNlYywNCj4gICAJCQkgIHVuc2lnbmVkIGxv
bmcgb2Zmc2V0LCB1bnNpZ25lZCBpbnQgdHlwZSwNCj4gICAJCQkgIHN0cnVjdCBzZWN0aW9uICpp
bnNuX3NlYywgdW5zaWduZWQgbG9uZyBpbnNuX29mZikNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29i
anRvb2wvaW5jbHVkZS9vYmp0b29sL2VsZi5oIGIvdG9vbHMvb2JqdG9vbC9pbmNsdWRlL29ianRv
b2wvZWxmLmgNCj4gaW5kZXggYWRlYmZiYzJiNTE4Li5jNDNlMjNjMGIzYzggMTAwNjQ0DQo+IC0t
LSBhL3Rvb2xzL29ianRvb2wvaW5jbHVkZS9vYmp0b29sL2VsZi5oDQo+ICsrKyBiL3Rvb2xzL29i
anRvb2wvaW5jbHVkZS9vYmp0b29sL2VsZi5oDQo+IEBAIC0xNDQsNiArMTQ0LDcgQEAgc3RhdGlj
IGlubGluZSBib29sIGhhc19tdWx0aXBsZV9maWxlcyhzdHJ1Y3QgZWxmICplbGYpDQo+ICAgc3Ry
dWN0IGVsZiAqZWxmX29wZW5fcmVhZChjb25zdCBjaGFyICpuYW1lLCBpbnQgZmxhZ3MpOw0KPiAg
IHN0cnVjdCBzZWN0aW9uICplbGZfY3JlYXRlX3NlY3Rpb24oc3RydWN0IGVsZiAqZWxmLCBjb25z
dCBjaGFyICpuYW1lLCB1bnNpZ25lZCBpbnQgc2hfZmxhZ3MsIHNpemVfdCBlbnRzaXplLCBpbnQg
bnIpOw0KPiAgIA0KPiAraW50IGVsZl9yZWxvY190eXBlX2xvbmcoc3RydWN0IGVsZiAqZWxmKTsN
Cj4gICBpbnQgZWxmX2FkZF9yZWxvYyhzdHJ1Y3QgZWxmICplbGYsIHN0cnVjdCBzZWN0aW9uICpz
ZWMsIHVuc2lnbmVkIGxvbmcgb2Zmc2V0LA0KPiAgIAkJICB1bnNpZ25lZCBpbnQgdHlwZSwgc3Ry
dWN0IHN5bWJvbCAqc3ltLCBzNjQgYWRkZW5kKTsNCj4gICBpbnQgZWxmX2FkZF9yZWxvY190b19p
bnNuKHN0cnVjdCBlbGYgKmVsZiwgc3RydWN0IHNlY3Rpb24gKnNlYyw=
