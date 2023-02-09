Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8E690127
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 08:23:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PC7cn6G9Lz3bZn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 18:23:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=YI/VJEP4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe0e::62c; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=YI/VJEP4;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PC7br3t0tz302m
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 18:22:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iepmaGlDgaHKmwAyts0WYzVztntRyz48hGINWi3p328OpfyYP0/md+x+2ECAGJAtYN/2tA65lKbeE2V8koVy+7YatZZoCfis8p2/v9UemAQ0r3oHU93RVya5ztNqGDb0vkVCh7eYB2RyQZ9X5EDU9KyOvbkmZPzShI21pILOQCGW/p5ux7S+z9cb7WH9v9JgbDPjegWk7LMinq8wbJfS9bIDgboN9lsMgWi5vv85R8p0FDLI5+tGF4EnPHxiDROFTd3cRr7rp/BBZzbaRPbp6LQLTFZ8xqzUi0LZUQnsq7qB7JFM65W4/16gOQRRESTdkdrnbnJbOuMWOa2+TGTfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUFSn78f7Zf0yxoqarw0OuKCmi4x7sg4Jis2f7fFbAU=;
 b=ETKi0EDWDYhLuIFggbkmMwcxby+xUGSNIYwp6W3GFHIJbdlXMDVAzwqkXVYkRW1hHDQc7hYJivDKXiu3ETD1Mau5p96XHpITpfMQnIevjZvKr1xzf3AIHERezGq91OhAPGqauGlALIv8z6CBINIsv/1W+F8mg3+UsaC7pO6f0pIpOUtysP0yKLf5kinWILxJysv3nKKiBAC/UZVi3/BN4FCNzuMpzUmbV8MNp+FCQKdrpIkNP40Dws6tClRmDKp6vXLNOqAasqndSzMdEumbW3XTdJemHXxqgp3QmpsGHKRUJgC2G8rmeg1UfRjGH8tlhand685hMXAhuDfzYi0gWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUFSn78f7Zf0yxoqarw0OuKCmi4x7sg4Jis2f7fFbAU=;
 b=YI/VJEP48s3WpFqm1XpiZHtDtld0blwVRyuT1uXg/vfqA+G3HsxhmA6dUtmogzmpGAozDDIkL2rk+ygMqjrfuNXP+qzM51rM9qUg/t6v0mfGrkTCp0TRHT7mOM9RU57hGfkiNdTcNo5d1BZ+USUXR4oWbUmRytK+6x+Rl4PlH5enP3wFMyvldWD5HMRCumBLiI0JSUuRHJ0xHut8tykK7SySwLaYyRzgWcGKRxLan+/Yxd7wvRdyJoF3/3zQexelciZPdkD3ANzy2GeVC+TUk7YsOMAzFyGgGTbCZXIPJSxeE+kH2R8CO2zYYcqP1Haxi471qtiYNHFQZqM01EXPKQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3150.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 07:21:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 07:21:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>,
	Erhard F. <erhard_f@mailbox.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: Bug: Write fault blocked by KUAP! (kernel 6.2-rc6, Talos II)
Thread-Topic: Bug: Write fault blocked by KUAP! (kernel 6.2-rc6, Talos II)
Thread-Index: AQHZN2DKX2ogXpzH/kiDJxjL5usifa68eIWAgAAL7QCACbssgA==
Date: Thu, 9 Feb 2023 07:21:55 +0000
Message-ID: <65f1c4b4-a1f0-9eac-0ce3-70196a331052@csgroup.eu>
References: <20230203004649.1f59dbd4@yea>
 <5f0714428e4c696e3d5c00f3bafb4d2970cb6e2b.camel@linux.ibm.com>
 <CQ8L0O2CYDIX.8HICM7H2PCMN@bobo>
In-Reply-To: <CQ8L0O2CYDIX.8HICM7H2PCMN@bobo>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3150:EE_
x-ms-office365-filtering-correlation-id: 2de5a798-35be-4845-9283-08db0a6e52e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  L7ZnAB6INFBDJ85N73CM4Lz/i7NgxKcyOYldvn1vbVL2G0dFOFctGXvW5hdV3GSAxkJr1VS2KVbDcdhhHllJb8cZ8Wpuop9gxzULmjhfV+fMZcq0uXe4WDTlaM1k9cz3nlWE8zUDVe5qg5FlnWeKaNEwwnjjO0Fm4yckfBE/Uf1aGf9iArUfjGsfzGYEaJl5PpKbo9cl9YjiFl52ySXdLevXsOQNQKN1GlkFEdtxKUSpiY3LU4Jwp6waQ2RAYFlHYiN8rPb95OAVC6X6XXn1hrg4H5BOJi1BzSUIiIkTrrQD8ZyAvTVgvZCUR52+fEmcxz3AHdyeXsEl1frC0O65b2nShVxX41R4xdTuOBH1/2dcEJJgyAADepurh5QpyFWUNCdHuiCGB5bdq2bdh9Bv3OXnY9/vMus1fXI8ji2KqV/FkmSzN7DVxlmaF2F9d8rLTbI4V8ibzq+n4JMBiJlj7sQv9EiCPPpLsvKNdwbrad0n1658QuRhRcQLh/Nt0c3309h2qghOYHAszndv4gDps4ze1Np3uei62XP5ivfVWKsJ6hTcaeCOHDeHl5B2nJSYIF7naBVT54OzrRm2KvNLZ14uul+eQjTVpteOP/kN90ooZHL6lK3WTX3NUfE0EXIOcoCp2y8gwg8BLSW7TkNcu6s+KpaCJ6zvXXNgxO/wfgh/Z2nXm1vzgWxkMN1P8Aehsu8S8j83IgzxaUg+E9qA+DsVfKl12RkF5/0uMXlnXSXE+54EOTwWH3tqdSzbjGoazE9nbHo+uJrNhRoohyApNg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199018)(478600001)(110136005)(91956017)(38070700005)(15650500001)(316002)(76116006)(2906002)(8936002)(5660300002)(64756008)(86362001)(26005)(31696002)(41300700001)(66946007)(66556008)(44832011)(8676002)(6506007)(66476007)(186003)(66446008)(6512007)(38100700002)(36756003)(71200400001)(6486002)(122000001)(66574015)(31686004)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cHVLUm1xNnB5ZmkzZUVLZGFKbW0yVVdtS1Y2TmhyMHl0K2xZeEg1cTVXajU1?=
 =?utf-8?B?ZGtTc05oMlVTYThGSzhCN01sUVMrbzdmKzB6TCszS0FUSjJXWTZLNDNPT3RP?=
 =?utf-8?B?M3lKWDNkZTdqc2lTdnpCSVBaZWN2c0hzcC9FZlBiQ3BzdysxTExyYk1JRFZq?=
 =?utf-8?B?enBxRUdtWCtzSFpONWxBa0JHMDBnQk42RzcvRERjb2NjOGZZM29kRFIydEo3?=
 =?utf-8?B?NkJrMHZkRkdFRWdHNDU5eFkvVDY2OGNvNXUvNnpnaXMwN3lSTHRrY3ozR3ZT?=
 =?utf-8?B?ay85eCtBd1hFZncvcGhWSmtrVUJ3TEswalFlbE5tdjRUbW9tbFl0Yjd5RXUy?=
 =?utf-8?B?VDcwTmdkV1M2YnUyalRKMzZpRldxVlNpYzJ2c2ZoWURpUHh4c3QrMW92YzJ6?=
 =?utf-8?B?cmhZNzhSa09QVnVEcXF2RGZaMFFxZjVDR2l4dWp1MVZ1MldvekJxQlJ0OHBu?=
 =?utf-8?B?b2hZSlJzNmZCcFNHNGY1dlRML2ZrRUx2OUZNOHlyMVZNc3JOdytvTnhEbWtn?=
 =?utf-8?B?MzAzM3dUb0NmcXB1dXhjbHlTQkdPNTFBQkhxY1B0ZlFPT0ozVm1rQm1kUG5U?=
 =?utf-8?B?OGVJd0NyWEtzRExtTDBDRFQ5cHZHYVNYc3orbmxpVjBab3oxWS8wUDdXNVpY?=
 =?utf-8?B?WTlPb09OdjcvN1FrY3BuREtSZjM3TXJ3UHlSSUN1eFpKaXE0ZktJUzVxTzA2?=
 =?utf-8?B?VVQ0Ykc0MlRxeTU1WE5GdzZQWVZlWVJpUHVXOG5tS1JLblJwVXZZUitxcDZ1?=
 =?utf-8?B?M01vQ2FWZlVQRXgxSjNQdEhOVkdRamh2WVdFVFFHNWZ1ZnVERFBLeFUxYWhF?=
 =?utf-8?B?eGV0L0FYbzhNQzkzTmh5TFA4c3pFTEs2NGd5UVJTQ1VuRE4wRDJLRkdWazhy?=
 =?utf-8?B?VmhwcGNHc2xDS0xXalc1a0dqZzhyaytKMXQ4ZnU2Uzl3TG1od0tzdVdIV1kx?=
 =?utf-8?B?RDFwRHRJaDBQeXA5NGJRSG05WGNIWFVWMnJTaGFaTDVWUTU2TzJtb2hVbHhv?=
 =?utf-8?B?YytGV1BjbXNJZTZNdzQzeFVyUUJsLzhQRVA2bXh1ZzlWK1FFczQ0bWV0UEJa?=
 =?utf-8?B?MDBOSjFSekFoZHZlNHFPUk50R2NKaEhnQUpZdVNYdGM4cDZkQzhRWGg2Rlgv?=
 =?utf-8?B?OGtnSzNYY3hRNE5SYm9yR1hBb0hvMkZybkcweE0vZlFGcUdXaGw2NDZ1K0J5?=
 =?utf-8?B?QlpmeEV0ZE1TVXEzR2VDL3lnYVFwcDNkM0E5SVZlTURUbWpDNHdCTzA5NEJ0?=
 =?utf-8?B?U2R6MEhMaUppOFhtNDhCK0c0MFhYQ095Ym1lVTB1QjJTcmZtUmVYejBER01y?=
 =?utf-8?B?L042OWF5MGZ2UjgrNkMxRm5vNFJLZ0pzUERXbWliR2hXT1duQkJ3N1VsUG01?=
 =?utf-8?B?anR4M2tUUVlvZjVRalAxOXA3eTJ0dExsR3RTcEQrM1hsempUTmpLY2VvTEVx?=
 =?utf-8?B?Z09VWEVKRGlZdFJ5R0FhdWw0NlVRRHpVd1F3ZExYeHpoRmRvS3B1ZUt0azlV?=
 =?utf-8?B?Q3p4dEZVQ0R3dm9nbE0yNUEyTVk0dm1vSVBFdzZBeWVYOHJlSlVXWG0vb0Nh?=
 =?utf-8?B?OXJ0UHJWVDhvdVA0eUtjbXg3VzdiTWlFTmpyK0VZMHpmd1FWWTRMRy83a3l5?=
 =?utf-8?B?ZExYVXhuVkxnMFUxdENMVGZpQkxydEJ1VGVGc0lCM2prT1RiWmZldzExZUl1?=
 =?utf-8?B?SmFseS9KR2MvZjErdENTNHUxWVZPQnY2V3Z3bTJROFJlS1k5Vy95N1M0eFFN?=
 =?utf-8?B?MXZDbWZ5ZFg4TkNaZzZKdjdvSVV3SVFmNnRvL3U2WGJJUk5yOWErM1N1S0o0?=
 =?utf-8?B?em9wWDlzMEdaM0hwZzFkeEo1RGZjd3B5YklhdVlFSnVpVUxNUy8xSlM2SXhX?=
 =?utf-8?B?cmlXOTVuZm5mMVA5UnpmUDNkUitFc1JRSllwVlZId2NGRkZuMmJId1ZzaGhr?=
 =?utf-8?B?N0g2N0ZTS2lmUHhnVWRmeHdBZHVqVmRFQWo5cTBFbWhpa3ZyTzV5aStUb0Z1?=
 =?utf-8?B?aTJQVWh3TWp6cjlKbkpSYU5sZk05RFhWc1EyRlZkSDhadXU5d2ZuTGoyT1FN?=
 =?utf-8?B?VFJVZ2hId3p2NDhCcHVoWUs2cUlqeHlUZTZweWk3eStBRWNRNTMwaW5MdGNa?=
 =?utf-8?B?S3l4Nko0TWdPanZFL0tiY3lOeDcyamxPbi9zMjh6TUtzRWZ6RXNLRktvaGFI?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44F101C45608F8488B993527EBB111D4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de5a798-35be-4845-9283-08db0a6e52e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 07:21:55.6227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eMn4DdUJ+k2W3hRLirjIRL0FdPqGGKcxW+L88EJ+Le9TpK81RIi3hddq3FRx26I20j92ubUuBRjxpK8OzNTQCl7LoppE5OI6oD+kkmbnHLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3150
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

DQoNCkxlIDAzLzAyLzIwMjMgw6AgMDM6NDUsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBGcmkgRmViIDMsIDIwMjMgYXQgMTI6MDIgUE0gQUVTVCwgQmVuamFtaW4gR3JheSB3cm90
ZToNCj4+IE9uIEZyaSwgMjAyMy0wMi0wMyBhdCAwMDo0NiArMDEwMCwgRXJoYXJkIEYuIHdyb3Rl
Og0KPj4+IEhhcHBlbmVkIGR1cmluZyBib290Og0KPj4+DQo+Pj4gWy4uLl0NCj4+PiBDcmVhdGlu
ZyA2IE1URCBwYXJ0aXRpb25zIG9uICJmbGFzaEAwIjoNCj4+PiAweDAwMDAwMDAwMDAwMC0weDAw
MDAwNDAwMDAwMCA6ICJQTk9SIg0KPj4+IDB4MDAwMDAxYjIxMDAwLTB4MDAwMDAzOTIxMDAwIDog
IkJPT1RLRVJORUwiDQo+Pj4gMHgwMDAwMDNhNDQwMDAtMHgwMDAwMDNhNjgwMDAgOiAiQ0FQUCIN
Cj4+PiAweDAwMDAwM2E4ODAwMC0weDAwMDAwM2E4OTAwMCA6ICJWRVJTSU9OIg0KPj4+IDB4MDAw
MDAzYTg5MDAwLTB4MDAwMDAzYWM5MDAwIDogIklNQV9DQVRBTE9HIg0KPj4+IDB4MDAwMDAzZTEw
MDAwLTB4MDAwMDA0MDAwMDAwIDogIkJPT1RLRVJORlciDQo+Pj4gQlRSRlMgaW5mbzogZGV2aWQg
MSBkZXZpY2UgcGF0aCAvZGV2L3Jvb3QgY2hhbmdlZCB0byAvZGV2L252bWUwbjFwMw0KPj4+IHNj
YW5uZWQgYnkgc3lzdGVtZC11ZGV2ZCAoMzg3KQ0KPj4+IEtlcm5lbCBhdHRlbXB0ZWQgdG8gd3Jp
dGUgdXNlciBwYWdlIChhYTU1YzI4MDAwMCkgLSBleHBsb2l0IGF0dGVtcHQ/DQo+Pj4gKHVpZDog
MCkNCj4+PiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4+PiBCdWc6IFdy
aXRlIGZhdWx0IGJsb2NrZWQgYnkgS1VBUCENCj4gDQo+IEtVQVAgaXMgYSByZWQgaGVycmluZyBv
ZiBjb3Vyc2UsIHRoZSBLVUFQIHRlc3QganVzdCBjaGVja3MgaWYgdGhlDQo+IGZhdWx0aW5nIGFk
ZHJlc3MgaXMgYmVsb3cgVEFTS19TSVpFLg0KPiANCj4gW3NuaXBdDQo+IA0KPj4+IC0tLSBpbnRl
cnJ1cHQ6IDMwMCBhdCBfX3BhdGNoX2luc3RydWN0aW9uKzB4NTAvMHg3MA0KPj4+IE5JUDrCoCBj
MDAwMDAwMDAwMDY0NjcwIExSOiBjMDAwMDAwMDAwMDY0YzJjIENUUjogYzAwMDAwMDAwMDA0OGVl
MA0KPj4+IFJFR1M6IGMwMDAwMDAwMjNiNTc2MzAgVFJBUDogMDMwMMKgwqAgVGFpbnRlZDogR8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUDQo+Pj4gKDYuMi4wLXJjNi1QOSkNCj4+PiBN
U1I6wqAgOTAwMDAwMDAwMjgwYjAzMiA8U0YsSFYsVkVDLFZTWCxFRSxGUCxNRSxJUixEUixSST7C
oCBDUjoNCj4+PiAyNDIyMjI0NMKgIFhFUjogMDAwMDAwMDANCj4+PiBDRkFSOiBjMDAwMDAwMDAw
MDY0NjJjIERBUjogMDAwMDBhYTU1YzI4MDAwMCBEU0lTUjogNDIwMDAwMDAgSVJRTUFTSzoNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXiAgICAgICAg
Xl4NCj4gRmlyc3QgYnl0ZSBvZiBwYWdlLCBzdG9yZSwgbm8gUFRFLg0KPiANCj4+PiAxDQo+Pj4g
R1BSMDA6IDAwMDAwMDAwMDAwMDAwMDAgYzAwMDAwMDAyM2I1NzhkMCBjMDAwMDAwMDAwZTdjYzAw
DQo+Pj4gYzAwODAwMDAwY2UzM2ZmYw0KPj4+IEdQUjA0OiAwNDFhZTEzMDAwMDAwMDAwIDAwMDAw
YWE1NWMyN2ZmZmMgMDAwMDAwMDAwMDAwMDAwMA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5eXl4NCj4gTGFzdCB3b3JkIG9mIHByZXZpb3VzIHBhZ2UuDQo+IA0K
PiBQcm9iYWJseSBmcm9tIGNyZWF0ZV9zdHViIGZ1bmN0aW9uIGRlc2NyaXB0b3IgcGF0Y2hpbmcs
IHdoaWNoIGlzIG5vdA0KPiBhY3R1YWxseSBwYXRjaGluZyBpbiBhbiBpbnN0cnVjdGlvbiBzbyBp
dCBwcm9iYWJseSBnZXRzIHVubHVja3kgYW5kDQo+IGdldHMgc29tZSBkYXRhIHRoYXQgbWF0Y2hl
cyBwcmVmaXggb3Bjb2RlIGFuZCBzbyBpdCB0cmllcyB0byBzdG9yZQ0KPiA4IGJ5dGVzLg0KDQpB
biBlYXN5IGZpeCB3b3VsZCBwcm9iYWJseSBiZSB0byBhbHNvIGNoZWNrIHRoZSBzdWZmaXggYXMg
YSBwcmVmaXhlZCANCmluc3RydWN0aW9uIHdpdGggMCBhcyBzdWZmaXggaXMgbm90IHZhbGlkIDoN
Cg0KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnN0LmggDQpiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9pbnN0LmgNCmluZGV4IDY4NGQzZjQ1MzI4Mi4uODcwODRhNTI1
OThiIDEwMDY0NA0KLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2luc3QuaA0KKysrIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2luc3QuaA0KQEAgLTg2LDcgKzg2LDcgQEAgc3RhdGlj
IGlubGluZSBwcGNfaW5zdF90IHBwY19pbnN0X3JlYWQoY29uc3QgdTMyICpwdHIpDQoNCiAgc3Rh
dGljIGlubGluZSBib29sIHBwY19pbnN0X3ByZWZpeGVkKHBwY19pbnN0X3QgeCkNCiAgew0KLQly
ZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUFBDNjQpICYmIHBwY19pbnN0X3ByaW1hcnlfb3Bjb2Rl
KHgpID09IA0KT1BfUFJFRklYOw0KKwlyZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUFBDNjQpICYm
IHBwY19pbnN0X3ByaW1hcnlfb3Bjb2RlKHgpID09IA0KT1BfUFJFRklYICYmIHBwY19pbnN0X3N1
ZmZpeCh4KTsNCiAgfQ0KDQogIHN0YXRpYyBpbmxpbmUgcHBjX2luc3RfdCBwcGNfaW5zdF9zd2Fi
KHBwY19pbnN0X3QgeCkNCg0KDQo+IA0KPiBTbyBub3QgeW91ciBidWcsIHlvdXIgdGVtcCBtbSBj
b2RlIGp1c3QgZXhwb3NlZCBpdC4gRGF0YSBzaG91bGRuJ3QNCj4gYmUgcGF0Y2hlZCB1c2luZyBw
YXRjaF9pbnN0cnVjdGlvbi4gV2Ugc2hvdWxkIGhhdmUgYSBwYXRjaF9kYXRhX3UzMg0KPiBvciBz
aW1pbGFyIHRoYXQgZG9lc24ndCB1c2UgaW5zdHJ1Y3Rpb25zLg0KDQpUaGVyZSBpcyB3b3JrIGlu
IHByb2dyZXNzIG9uIHRoaXMgYnV0IGlmIHRoZSBhYm92ZSBjaGVjayB3b3JrcywgaXQgaXMgDQpw
cm9iYWJseSBhIGJldHRlciBhcHByb2FjaCBhcyBhIGZpeCB0aGF0IGNhbiBiZSBiYWNrcG9ydGVk
Lg0K
