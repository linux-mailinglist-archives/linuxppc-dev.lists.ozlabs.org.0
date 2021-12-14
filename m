Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0556D474396
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 14:36:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCztY3nwtz3cDr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 00:36:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCzt06slzz2xvv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 00:36:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhhYUn8086SPMfE/GfQBMqLJkPSgvGMqmp8KqxJ3dTvdJ3+2B6EnrkYBW+e9ayy5zteqiZC1OrqZmc0xicGGPx5vXfsnj5ymAh/UsylrMtEKemw/gCjAipNCOFKxeNt0XyoKvPeDr0vVgIQHUPB4c5z5IEV1LQRIqj3OQYlKBsiDBcE3d3n8hOOgLfYqWSUcg11NnnGzhcO3Or4FHpUxore8/2mpTRXpsla3/LUOoeDas02prk9yoZAMyv1MM3/TvupUyMo8ZmDLksTZhy3u/WBi7GJrCj/89SQ+VrhzZTtDtxaI/qWZT4NXrPaMRNCNpEpGu89tD+qmT2gnBPIhQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2t30Xioe0UO4bN9eWuGCRpWivKeVSxgwAGIP16XBPKQ=;
 b=gu/1ObKydaperHT2aD8YziEHnCPA8DWrCVA4iCwKbjb3Q5LEtj6NTiX/OVS7bYKCX/0aQMU2ILvCbedQLb14TK9jeJKsYksq4trQ/uMBT1KEn4sZxXBUo7aGJE9G95Qqy5772dquwVXzr6PDq9aQxnJPp818NS25CrhkfmQ67ZhnfQ3iWXYMixoxRA8Cz8vDyG0Oo+gkxbVo+dQEpsbFjwpbPNvblIX4elIHeMmk4+pLrCMXSkJPr66S2a9cAG76GuOpMRhxf07AhRborVvZf3oe67Wr5gyMBSp683Bn1wh28UTM+nc1QNkYeYaJI/ZtKxsaOAX1v8nO5hMoC8gAbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Tue, 14 Dec
 2021 13:35:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 13:35:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Joe Lawrence <joe.lawrence@redhat.com>, Russell Currey
 <ruscur@russell.cc>, "live-patching@vger.kernel.org"
 <live-patching@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
Thread-Topic: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
Thread-Index: AQHXzspJJmoyNvOd+UCDOrmbjdknXavuZfuAgABKxICAQZuGAIAAducAgAAeaoCAAA4TAIABQ1yAgAAEcwCAAAnyAA==
Date: Tue, 14 Dec 2021 13:35:46 +0000
Message-ID: <66aaf299-7e2b-7c8d-f80c-ce40b3a9f0c8@csgroup.eu>
References: <YX9UUBeudSUuJs01@redhat.com>
 <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
 <f8a96ac1-fda3-92da-cf27-0992a43a2f3f@redhat.com>
 <bed88ff4-e5d3-4b78-4f28-29fc635c2f97@csgroup.eu>
 <919a79b8-feff-b0a4-b96a-73f376b7f6dc@redhat.com>
 <61a5f29c-5123-5f0f-11aa-91cb0ac95a69@csgroup.eu>
 <8a68ffef-7e0d-b1ff-1102-2e6f2c999455@redhat.com>
 <27cee0a4-aa34-7a52-f98c-ab8c13aafb12@csgroup.eu>
 <af1eb0c3-4beb-bbc4-39da-da42f104f6c7@redhat.com>
In-Reply-To: <af1eb0c3-4beb-bbc4-39da-da42f104f6c7@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 770b1255-386a-4e4d-4a1a-08d9bf06a2a4
x-ms-traffictypediagnostic: MR1P264MB2178:EE_
x-microsoft-antispam-prvs: <MR1P264MB2178A593A5405F6602FBBCCAED759@MR1P264MB2178.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9dSnZ+N576f//AQ/afM/TF12E98BUH7nP/DuO89aDBOdfWxwl6VXiziFnexdoFzgk3Bdk7xdg6a8xap5ALWlfGy2aQMOhDqP4y7QI40303gPezNAUpv6CStIaSyh6MDMXwV3ev0rAfSCO0LhfxQlSuTY6YburCtnqw3fa9bkmKMgcWmCQMtDSX3dh39UCFur2lXUDfK74frpY2w+OuFT3KuM8Yu4joi5Wtow12nIFtceyCObhi/6ynnyr+qGb3jXUeTDERE4s9jvP0hzKe5mA5rJ61WjuWQWRd7uGmDcV8+3RffAH100Qx/6dW+UDQbWR2nXNHMnAwGScHndZUsHq10Lm/3ItiAWidYsLxA4+H6QD0runERENB4TzvA9q9Tr8bucYsDvnDvEbGz+s/4CatHEzCJZNJDLFgHpFNC8Ks2khSIBKbJrNld86I3788My3KxX17olVZ3mNvjrvIIw1haI2kmL6X59mjI26Mouls+eEgLhyCrMmWVSXwa3DGOjrf5uQpj79pWoHHM/+t1DwEBEY8fpJutT8Pn2c+RVTChVim/p+3tygXcXw8AWOcpSuRLSrvN2n8Pit2uNkxKOB5HZPwQBdJePBYzElJqdhJZQjJMH3p/x+grh0TF1tIKraJvfStsKzIltzFuFt+bTEHgKetcClMtEQrZooT7ULqq2vAAcqJ0h6AMpVNjmQdde3xIWJhMmVp61OKzIkiymkZlyUJMpKByi1IkW+TlWTGsZvfHnHcsxA731PKOoBaJTtRxIB/b3rjbWIeRtmMMc9Ni4LFcl3H9OIJ+BFALYGCe6/hIV9Wj90bw1vs6X1mnyOhbSUuWVOYFYG1ETeCCDSbLddNB728wybHlQNjRxhvg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(508600001)(83380400001)(6486002)(36756003)(44832011)(99936003)(6512007)(31696002)(31686004)(86362001)(66574015)(4326008)(2906002)(26005)(122000001)(5660300002)(316002)(8936002)(91956017)(6506007)(2616005)(38100700002)(38070700005)(53546011)(186003)(71200400001)(8676002)(64756008)(76116006)(66946007)(66476007)(66446008)(66556008)(110136005)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzFUNjFUUTAzSzNMcTJpZEhEODlzRjRsT0NyczI3VFc4SENMaEdGN0pKajI4?=
 =?utf-8?B?Z1JucHBLYzArUGxWRWtHZUcwcWdOa2k4cXhRNHlTdFJ4enBKTGlCQktYWmlU?=
 =?utf-8?B?UXdXOXlPU1NxM1pQT2xSenQ4VmYxKzlxRFhBUXFrRkxxK0ppWUR6ZWdMbUxY?=
 =?utf-8?B?WDdZcjl4UjZ4eGN5MTIwelBDaEtwRWJLNVMxY0hmckY1aHBvaWh1Ky9aM2pR?=
 =?utf-8?B?alNsZVhlQmIwL0F2V3lTeXlJSnlpdTZ3aHZuMVAxWXhXT0VqOFJ2MmJaY2R1?=
 =?utf-8?B?aHNiMklHYVNteTZnajI0MjNxSTNlSHhiNTZqdHl3K1Y1bVRRNnNyb0NERFF4?=
 =?utf-8?B?c1JRdnN0RStYY0VXdFFUY3pnRjBOUHJIdVhCT3E3V2p3KzlOUzJ6Q2dMNnQz?=
 =?utf-8?B?angwK21uNis0U2xzNFo2bjZxa3F0dmtXUStwWGJsdjluOUVocDRSendaUll1?=
 =?utf-8?B?ZndEbGtQZXREckc4RUI2eGttVFh4SFVnQktBcVFaa0Z5S1E0TjV4aCs4aDZZ?=
 =?utf-8?B?TmVUV3VYSGErSlZqMjRNcTlBSDA3ZEtXb0o1QjUycnhrcHJnQzI1QmdKWmdw?=
 =?utf-8?B?NlBTTjZXc2xiSndyakg5WXJLQVZ4Y0VSUVZnSHN1ZC9pVlpOYk5HZG5kU01a?=
 =?utf-8?B?aitacmxJMVNESUFCZ1BJQlZoM1UzQXlpc3NrU1RSU0lFR2FDYmt1Y01YaytZ?=
 =?utf-8?B?blI4OFRuR3dmQUVyNFRaQ2JQU3hRT2xKNDJld3Z0TDRGWllEeXVwbmtoekwx?=
 =?utf-8?B?VUQyVHNWNTFqL1F2UldmcnJHYVVLeHQ1UE9TcHlvV2hvZmQ0dm81RE0rZHVj?=
 =?utf-8?B?MlRpKzRGSnlZMlJJb0RhOVVWRi9yUHNZKzlIb3dMQTM0WTJrOHhwdU96eWxt?=
 =?utf-8?B?dGdqeVpiS2hlYnJBMVJYY2pkZ29oMEtrZlZmN1VrMHRYN2lpS3VSMWhJYlBY?=
 =?utf-8?B?eDI3Qm9mWnNBd3JCNGdoNmFoL1Fvb0p2Qm91RnZMRDgrWVNHZ2JtOCtJSUpL?=
 =?utf-8?B?WHJzQk1nNyttZmZBTWM4OU1aaHg3cXBZdDRWTndGTFZrdGplYlhpL252UjRj?=
 =?utf-8?B?QXdmQmVCeW1yMEMyblR5cStvWDFGdkxuYjNPSlh2V056cVpITW5YYmg0dlA5?=
 =?utf-8?B?Rkloc21CSng2ZkVoMTNWcmpQL1E0WHhqZXJRUzI4VnVjcTNKaEYyWmZWNTgv?=
 =?utf-8?B?Q3ZsN21LbU1GN25waUxWaUNkZEZOTUF3cExzS3N1VEdYNWNYaHMvQjB1Vzhn?=
 =?utf-8?B?aVI3ODNzaE5qRW9GOGVoR05LMG1qdEpFRG11YXp2VUdLdXVLOUVUaFdwN2FK?=
 =?utf-8?B?b21Bc1Z3OEo2aHJ0S2xJaWF0V2FGWWowcE9NQ1VBYnZJcmF6R285VjZWQU1v?=
 =?utf-8?B?UjRHa0ZTSGhpcC9HZWZQcHBOdlowbWQwNzRGYVEvUW8wUVliZmxHQkJ3Q0g5?=
 =?utf-8?B?V1czRW5UV1o5Qmg4RGpDZ1dPajFPK3U4Y0lIM0l2a21DYlV6ODV4c1lkRzJW?=
 =?utf-8?B?TmRSMXJxc2hZSFloUnVEbFhHUkxRdzYvYkNPT3k3VHgvMXA4cDJPeUpUQ0dB?=
 =?utf-8?B?N2VtU1ZpZGRUY0V2R3FMcWxlRnVoN1pTR25mNGdwK0dRTzUwWExtUE54QVJF?=
 =?utf-8?B?UWhUcDk4cmd0eThIUzcrZjlMcUsyU0xYelh6cmdKN0l4Y3dwYWQ3RkJzWVFL?=
 =?utf-8?B?V3BBYUthaVVOUktxTTJRTmd5ZnNsL1YzUi94bnJNZ25EYjBWRDZlS0lzbWhU?=
 =?utf-8?B?UW1vQVhYTTA0Yk16bXBrQkxLNGlUbDUwbWZ6OTFOZHZlNi8weWxGd3JTeHJG?=
 =?utf-8?B?RG9STk5WM2x5RyszQjZKcnV1RFpUSkVCaE1jK3MwVU43bmo2Vlhha0I2cnY3?=
 =?utf-8?B?NHZ5V2lEUUxDbDRjczNpT0tEc0FTM2Rtc2hoM1plSHNWbkNpdXp5aElzNExs?=
 =?utf-8?B?NEptU2h0czZ3V1ZkbDV4VUZMdDFxckplVzJWRU01Rmo3bC9BcGU3UXlNMzI4?=
 =?utf-8?B?ME5pQTl1MG1XNm82SjNJRU80aHhqeGQycDlYQUpWYk16d2lYd2VVZ3Q4b2Fi?=
 =?utf-8?B?MVFEVEhaSXF6NEJyR3p0S2NudnZGN0lUMm80YXZXQTZCNHNhcmhqUmdWTTdr?=
 =?utf-8?B?bnBpK2JZeUd2MVdWM24wdjhsWU5FSFNiWXkvUC83Zm52Yk9iZWRJczJqb0Fu?=
 =?utf-8?B?U2R2NmpKZURuL0JMV3ZDRml3WTVDV2w5dG5xRXlQUjBXK1AxeUNuYU9uRjFM?=
 =?utf-8?Q?TKTD0JYkr4NiJj+ORqOALBb4CLaRkNL7VJfblvL2mw=3D?=
Content-Type: multipart/mixed;
 boundary="_002_66aaf2997e2b7c8df80cce40b3a9f0c8csgroupeu_"
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 770b1255-386a-4e4d-4a1a-08d9bf06a2a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 13:35:46.8373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1fu3MAfzQPv4fDPhjDTa/vdgNbmYD1c/AN4F4Fjgy4GeSsU+ihBIms0/tfU0RfQEPRGZu+AvMTrju8nwmOTPdE6H0ADYhMJzAnexLx4l+w0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2178
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_002_66aaf2997e2b7c8df80cce40b3a9f0c8csgroupeu_
Content-Type: text/plain; charset="utf-8"
Content-ID: <03D7BA00DB541348BD67A835F3C11C54@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

DQoNCkxlIDE0LzEyLzIwMjEgw6AgMTQ6MDAsIEpvZSBMYXdyZW5jZSBhIMOpY3JpdMKgOg0KPiBP
biAxMi8xNC8yMSA3OjQ0IEFNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+DQo+PiBM
ZSAxMy8xMi8yMDIxIMOgIDE4OjI2LCBKb2UgTGF3cmVuY2UgYSDDqWNyaXTCoDoNCj4+PiBPbiAx
Mi8xMy8yMSAxMTozNiBBTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+Pj4NCj4+Pj4NCj4+
Pj4gTGUgMTMvMTIvMjAyMSDDoCAxNTo0NywgSm9lIExhd3JlbmNlIGEgw6ljcml0wqA6DQo+Pj4+
PiBPbiAxMi8xMy8yMSAyOjQyIEFNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+Pj4+DQo+
Pj4+Pj4gSGVsbG8gSm9lLA0KPj4+Pj4+DQo+Pj4+Pj4gSSdtIGltcGxlbWVudGluZyBMSVZFUEFU
Q0ggb24gUFBDMzIgYW5kIEkgd2FudGVkIHRvIHRlc3Qgd2l0aA0KPj4+Pj4+IFNUUklDVF9NT0RV
TEVfUldYIGVuYWJsZWQgc28gSSB0b29rIHlvdXIgYnJhbmNoIGFzIHN1Z2dlc3RlZCwgYnV0IEkn
bQ0KPj4+Pj4+IGdldHRpbmcgdGhlIGZvbGxvd2luZyBlcnJvcnMgb24gYnVpbGQuIFdoYXQgc2hh
bGwgSSBkbyA/DQo+Pj4+Pj4NCj4+Pj4+PiAgICAgICBDQUxMICAgIHNjcmlwdHMvY2hlY2tzeXNj
YWxscy5zaA0KPj4+Pj4+ICAgICAgIENBTEwgICAgc2NyaXB0cy9hdG9taWMvY2hlY2stYXRvbWlj
cy5zaA0KPj4+Pj4+ICAgICAgIENISyAgICAgaW5jbHVkZS9nZW5lcmF0ZWQvY29tcGlsZS5oDQo+
Pj4+Pj4gICAgICAgS0xQICAgICBsaWIvbGl2ZXBhdGNoL3Rlc3Rfa2xwX2NvbnZlcnQxLmtvDQo+
Pj4+Pj4ga2xwLWNvbnZlcnQ6IHNlY3Rpb24gLnJlbGEua2xwLm1vZHVsZV9yZWxvY3MudGVzdF9r
bHBfY29udmVydF9tb2QgbGVuZ3RoDQo+Pj4+Pj4gYmV5b25kIG5yX2VudHJpZXMNCj4+Pj4+Pg0K
Pj4+Pj4+IGtscC1jb252ZXJ0OiBVbmFibGUgdG8gbG9hZCB1c2VyLXByb3ZpZGVkIHN5bXBvcw0K
Pj4+Pj4+IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5tb2RmaW5hbDo3OToNCj4+Pj4+
PiBsaWIvbGl2ZXBhdGNoL3Rlc3Rfa2xwX2NvbnZlcnQxLmtvXSBFcnJvciAyNTUNCj4+Pj4+PiAg
ICAgICBLTFAgICAgIGxpYi9saXZlcGF0Y2gvdGVzdF9rbHBfY29udmVydDIua28NCj4+Pj4+PiBr
bHAtY29udmVydDogc2VjdGlvbiAucmVsYS5rbHAubW9kdWxlX3JlbG9jcy50ZXN0X2tscF9jb252
ZXJ0X21vZCBsZW5ndGgNCj4+Pj4+PiBiZXlvbmQgbnJfZW50cmllcw0KPj4+Pj4+DQo+Pj4+Pj4g
a2xwLWNvbnZlcnQ6IFVuYWJsZSB0byBsb2FkIHVzZXItcHJvdmlkZWQgc3ltcG9zDQo+Pj4+Pj4g
bWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLm1vZGZpbmFsOjc5Og0KPj4+Pj4+IGxpYi9s
aXZlcGF0Y2gvdGVzdF9rbHBfY29udmVydDIua29dIEVycm9yIDI1NQ0KPj4+Pj4+ICAgICAgIEtM
UCAgICAgbGliL2xpdmVwYXRjaC90ZXN0X2tscF9jb252ZXJ0X3NlY3Rpb25zLmtvDQo+Pj4+Pj4g
a2xwLWNvbnZlcnQ6IHNlY3Rpb24gLnJlbGEua2xwLm1vZHVsZV9yZWxvY3MudGVzdF9rbHBfY29u
dmVydF9tb2QgbGVuZ3RoDQo+Pj4+Pj4gYmV5b25kIG5yX2VudHJpZXMNCj4+Pj4+Pg0KPj4+Pj4+
IGtscC1jb252ZXJ0OiBVbmFibGUgdG8gbG9hZCB1c2VyLXByb3ZpZGVkIHN5bXBvcw0KPj4+Pj4+
IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5tb2RmaW5hbDo3OToNCj4+Pj4+PiBsaWIv
bGl2ZXBhdGNoL3Rlc3Rfa2xwX2NvbnZlcnRfc2VjdGlvbnMua29dIEVycm9yIDI1NQ0KPj4+Pj4+
IG1ha2VbMl06IFRhcmdldCAnX19tb2RmaW5hbCcgbm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9y
cy4NCj4+Pj4+PiBtYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUubW9kcG9zdDoxNDU6IF9f
bW9kcG9zdF0gRXJyb3IgMg0KPj4+Pj4+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTc3MDogbW9kdWxl
c10gRXJyb3IgMg0KPj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gSGkgQ2hyaXN0b3BoZSwNCj4+Pj4+DQo+
Pj4+PiBJbnRlcmVzdGluZyBmYWlsdXJlIG1vZGUuICBUaGF0J3Mga2xwLWNvbnZlcnQgY29tcGxh
aW5pbmcgdGhhdCBpdCBmb3VuZA0KPj4+Pj4gbW9yZSByZWxvY2F0aW9ucyBpbiBhIC5rbHAubW9k
dWxlX3JlbG9jcy48b2JqbmFtZT4gc2VjdGlvbiB0aGFuDQo+Pj4+PiBleHBlY3RlZCwgaS5lLiBu
cl9lbnRyaWVzID0gc2VjLT5zaXplIC8gc2l6ZW9mKHN0cnVjdCBrbHBfbW9kdWxlX3JlbG9jKS4N
Cj4+Pj4+DQo+Pj4+PiBBIGZldyBwb3NzaWJpbGl0aWVzOiB0aGUgRUxGIHNlYy0+c2l6ZSB3YXMg
aW5jb3JyZWN0bHkgc2V0L3JlYWQgYnkNCj4+Pj4+IGJ1aWxkL2xpYmVsZiAoSSBkb3VidCB0aGF0
KS4gIE9yIG1heWJlIHRoZSBsYXlvdXQvc2l6ZSBvZiBzdHJ1Y3QNCj4+Pj4+IGtscF9tb2R1bGVf
cmVsb2MgaXMgbm90IGNvbnNpc3RlbnQgYmV0d2VlbiBrZXJuZWwgYW5kIHVzZXJzcGFjZSAoSSdt
DQo+Pj4+PiBtb3JlIHN1c3BpY2lvdXMgb2YgdGhpcykuDQo+Pj4+Pg0KPj4+Pj4gQ2FuIHlvdSBw
b3N0IGEgY29weSBvZiB0aGUgYnVpbGQncyBzeW1ib2xzLmtscCBhbmQNCj4+Pj4+IGxpYi9saXZl
cGF0Y2gvdGVzdF9rbHBfY29udmVydDEudG1wLmtvIHNvbWV3aGVyZT8gIEkgc2hvdWxkIGJlIGFi
bGUgdG8NCj4+Pj4+IHN0YXJ0IGRlYnVnIHdpdGggdGhvc2UgZmlsZXMuDQo+Pj4+Pg0KPj4+Pg0K
Pj4+PiBJIHNlbnQgeW91IGJvdGggZmlsZXMgb2ZmIGxpc3QuDQo+Pj4+DQo+Pj4+IEl0IGxvb2tz
IGxpa2Uga2xwLWNvbnZlcnQgZG9lc24ndCB1c2UgdGhlIGNvcnJlY3Qgc2l6ZS4gSXQgZmluZHMg
YQ0KPj4+PiBzdHJ1Y3Qgb2Ygc2l6ZSAxMiBoZW5jZSAzIGVudHJpZXMgZm9yIGEgc2VjdGlvbiBv
ZiBzaXplIDQwLg0KPj4+Pg0KPj4+PiBPbiBQUEMzMiB0aGUgc3RydWN0IGhhcyBzaXplIDggKHZv
aWQgKiBpcyA0IGFuZCBpbnQgaXMgNCkuDQo+Pj4+DQo+Pj4+IEJ1dCBJJ20gY3Jvc3MtYnVpbGRp
bmcgZnJvbSB4ODZfNjQgd2hlcmUgdGhlIHN0cnVjdCBpcyA4ICsgNCA9IDEyLg0KPj4+Pg0KPj4+
PiBDYW4gaXQgYmUgdGhlIHJlYXNvbiA/DQo+Pj4+DQo+Pj4NCj4+PiBJJ20gcHJldHR5IHN1cmUg
dGhhdCBpcyBpdC4gIEkgaGF2ZW4ndCBoYWQgbXVjaCBydW50aW1lIHdpdGgga2xwLWNvbnZlcnQN
Cj4+PiBhbmQgY3Jvc3MtYnVpbGRpbmcgKEkndmUgb25seSBmb3VuZCBvbmUgYmlnL2xpdHRsZSBl
bmRpYW4gYnVnIHdpdGgNCj4+PiB4ODZfNjQtPnMzOTB4KSBhbmQgd2FzIGdvaW5nIHRvIGFzayB5
b3UgaG93IHlvdSB3ZXJlIHRlc3RpbmcgOikNCj4+Pg0KPj4+IERvIHlvdSBrbm93IGlmIHRoZXJl
IGFyZSBvdGhlciBrZXJuZWwgYnVpbGQgdG9vbHMgdGhhdCBkZWFsIHdpdGggc2ltaWxhcg0KPj4+
IHNpdHVhdGlvbnM/ICBUaGlzIHNlZW1zIGxpa2UgYSB0cmlja3kgam9iIGZvciB0aGUgdXNlcnNw
YWNlIGJ1aWxkIHRvb2wNCj4+PiB0byBkZXRlcm1pbmUgbm9uLW5hdGl2ZSB0YXJnZXQgc3RydWN0
IGxheW91dC4NCj4+Pg0KPj4+IEluIHRoZSBtZWFudGltZSwgaGFja2luZyBpbjoNCj4+Pg0KPj4+
ICAgIHN0cnVjdCBrbHBfbW9kdWxlX3JlbG9jIHsNCj4+PiAtICAgICAgIHZvaWQgKnN5bTsNCj4+
PiArICAgICAgIHVpbnQzMl90IHN5bTsNCj4+PiAgICAgICAgICAgdW5zaWduZWQgaW50IHN5bXBv
czsNCj4+PiAgICB9IF9fcGFja2VkOw0KPj4+DQo+Pj4gZ2V0cyBtZSBnZW5lcmF0aW5nIGFuIG91
dHB1dCAua28gZmlsZSwgYnV0IHRoZSByZWFkZWxmIG91dHB1dCBkb2Vzbid0DQo+Pj4gbG9vayBy
aWdodC4NCj4+Pg0KPj4+IEknbGwgYWRkIHRoaXMgdG8gdGhlIHBhdGNoc2V0IFRPRE8gbGlzdCwg
YnV0IG1heSBub3QgZ2V0IHRvIGl0IGZvciBhDQo+Pj4gd2hpbGUgLS0gaXMgdGhlcmUgYW55IGNo
YW5jZSB0aGUgYWJvdmUgaGFjayB3b3JrcyBvciBjb3VsZCB5b3UgdGVzdCBhDQo+Pj4gbG9jYWwg
bm9uLWNyb3NzIGJ1aWxkPw0KPj4+DQo+Pg0KPj4gTm8gSSBoYXZlIG5vIHdheSB0byBkbyBhIG5v
bi1jcm9zcyBidWlsZC4gTXkgdGFyZ2V0IGlzIGFuIGVtYmVkZGVkIGJvYXJkDQo+PiB3aXRoIHNs
b3cgQ1BVIGFuZCBsaXR0bGUgbWVtb3J5Lg0KPj4NCj4+IEkgdGVzdGVkIHdpdGggeW91ciBoYWNr
LCBJIGdldDoNCj4+DQo+PiByb290QHZnb2lwOn4jIGluc21vZCAvbGliL21vZHVsZXMvdGVzdF9r
bHBfY29udmVydDEua28NCj4+IGluc21vZDogY2FuJ3QgaW5zZXJ0ICcvbGliL21vZHVsZXMvdGVz
dF9rbHBfY29udmVydDEua28nOiB1bmtub3duIHN5bWJvbA0KPj4gaW4gbW9kdWxlLCBvciB1bmtu
b3duIHBhcmFtZXRlcg0KPj4gcm9vdEB2Z29pcDp+IyBpbnNtb2QgL2xpYi9tb2R1bGVzL3Rlc3Rf
a2xwX2xpdmVwYXRjaC5rbw0KPj4gaW5zbW9kOiBjYW4ndCBpbnNlcnQgJy9saWIvbW9kdWxlcy90
ZXN0X2tscF9saXZlcGF0Y2gua28nOiB1bmtub3duDQo+PiBzeW1ib2wgaW4gbW9kdWxlLCBvciB1
bmtub3duIHBhcmFtZXRlcg0KPj4NCj4+DQo+PiBJIGFncmVlIHdpdGggeW91IHJlYWRlbGYgc2hv
d3Mgc29tZXRoaW5nIHdlbnQgd3Jvbmcgd2l0aCByZWxvY2F0aW9ucy4NCj4+DQo+IA0KPiBUaGFu
a3MgZm9yIHRyeWluZyB0aGF0LiAgQ2FuIHlvdSBwb2ludCBtZSB0byB0aGUgY3Jvc3MtY29tcGls
ZXIgc3VpdGUNCj4gdGhhdCB5b3UgYXJlIHVzaW5nIGZvciBidWlsZCBhbmQgcmVhZGVsZj8gIEtl
cm5lbCAuY29uZmlnIHdvdWxkIGJlIGhhbmR5DQo+IHRvbyBhbmQgSSBjYW4gdHJ5IHRvIHJlcHJv
ZHVjZSBsb2NhbGx5IGZvciBkZWJ1Z2dpbmcuDQo+IA0KDQpMaXZlcGF0Y2ggb24gUFBDMzIgaXMg
V0lQLCBicmFuY2ggJ2xpdmVwYXRjaCcgb24gDQpodHRwczovL2dpdGh1Yi5jb20vY2hsZXJveS9s
aW51eC5naXQuDQoNCllvdSBjYW4gdXNlIGJyYW5jaCAnam9lJyBvbiBodHRwczovL2dpdGh1Yi5j
b20vY2hsZXJveS9saW51eC5naXQgd2hpY2ggDQppcyBhIG1lcmdlIG9mIHlvdXIgYnJhbmNoIGts
cC1jb252ZXJ0LXY1LWV4cGFuZGVkLXY1LjE2LXJlYmFzZTEgd2l0aCBteSANCmxpdmVwYXRjaCBi
cmFuY2guDQoNCkNyb3NzdG9vbDogDQpodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1
Yi90b29scy9jcm9zc3Rvb2wvZmlsZXMvYmluL3g4Nl82NC8xMS4xLjAveDg2XzY0LWdjYy0xMS4x
LjAtbm9saWJjLXBvd2VycGM2NC1saW51eC50YXIueHoNCg0KZGVmY29uZmlnIGlzIGF0dGFjaGVk
DQoNClRoYW5rcyBmb3IgeW91ciBoZWxwDQpDaHJpc3RvcGhl

--_002_66aaf2997e2b7c8df80cce40b3a9f0c8csgroupeu_
Content-Type: text/plain; name="defconfig"
Content-Description: defconfig
Content-Disposition: attachment; filename="defconfig"; size=1974;
	creation-date="Tue, 14 Dec 2021 13:35:46 GMT";
	modification-date="Tue, 14 Dec 2021 13:35:46 GMT"
Content-ID: <03C77D21C73D39438E8DB4025B980757@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

IyBDT05GSUdfU1dBUCBpcyBub3Qgc2V0CkNPTkZJR19TWVNWSVBDPXkKQ09ORklHX05PX0haPXkK
Q09ORklHX0hJR0hfUkVTX1RJTUVSUz15CkNPTkZJR19CUEZfSklUPXkKQ09ORklHX1ZJUlRfQ1BV
X0FDQ09VTlRJTkdfTkFUSVZFPXkKQ09ORklHX0xPR19CVUZfU0hJRlQ9MTQKQ09ORklHX0VYUEVS
VD15CiMgQ09ORklHX0VMRl9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFTRV9GVUxMIGlzIG5v
dCBzZXQKIyBDT05GSUdfRlVURVggaXMgbm90IHNldApDT05GSUdfS0FMTFNZTVNfQUxMPXkKQ09O
RklHX1BFUkZfRVZFTlRTPXkKIyBDT05GSUdfVk1fRVZFTlRfQ09VTlRFUlMgaXMgbm90IHNldApD
T05GSUdfUFBDXzh4eD15CkNPTkZJR184eHhfR1BJTz15CkNPTkZJR19TTUNfVUNPREVfUEFUQ0g9
eQpDT05GSUdfUElOX1RMQj15CkNPTkZJR19HRU5fUlRDPXkKQ09ORklHX0haXzEwMD15CkNPTkZJ
R19NQVRIX0VNVUxBVElPTj15CkNPTkZJR19QUENfMTZLX1BBR0VTPXkKQ09ORklHX0FEVkFOQ0VE
X09QVElPTlM9eQpDT05GSUdfTElWRVBBVENIPXkKIyBDT05GSUdfU0VDQ09NUCBpcyBub3Qgc2V0
CkNPTkZJR19NT0RVTEVTPXkKQ09ORklHX1BBUlRJVElPTl9BRFZBTkNFRD15CkNPTkZJR19ORVQ9
eQpDT05GSUdfUEFDS0VUPXkKQ09ORklHX1VOSVg9eQpDT05GSUdfSU5FVD15CkNPTkZJR19JUF9N
VUxUSUNBU1Q9eQpDT05GSUdfSVBfUE5QPXkKQ09ORklHX1NZTl9DT09LSUVTPXkKIyBDT05GSUdf
RldfTE9BREVSIGlzIG5vdCBzZXQKQ09ORklHX01URD15CkNPTkZJR19NVERfQkxPQ0s9eQpDT05G
SUdfTVREX0pFREVDUFJPQkU9eQpDT05GSUdfTVREX0NGSV9BRFZfT1BUSU9OUz15CkNPTkZJR19N
VERfQ0ZJX0dFT01FVFJZPXkKIyBDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzEgaXMgbm90IHNl
dAojIENPTkZJR19NVERfTUFQX0JBTktfV0lEVEhfMiBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9D
RklfSTEgaXMgbm90IHNldAojIENPTkZJR19NVERfQ0ZJX0kyIGlzIG5vdCBzZXQKQ09ORklHX01U
RF9DRklfSTQ9eQpDT05GSUdfTVREX0NGSV9BTURTVEQ9eQpDT05GSUdfTVREX1BIWVNNQVA9eQpD
T05GSUdfTVREX1BIWVNNQVBfT0Y9eQojIENPTkZJR19CTEtfREVWIGlzIG5vdCBzZXQKQ09ORklH
X05FVERFVklDRVM9eQpDT05GSUdfRlNfRU5FVD15CiMgQ09ORklHX0ZTX0VORVRfSEFTX1NDQyBp
cyBub3Qgc2V0CkNPTkZJR19EQVZJQ09NX1BIWT15CiMgQ09ORklHX0lOUFVUIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VSSU8gaXMgbm90IHNldAojIENPTkZJR19WVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFR0FDWV9QVFlTIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9DUE09eQpDT05GSUdfU0VSSUFM
X0NQTV9DT05TT0xFPXkKQ09ORklHX1NQST15CkNPTkZJR19TUElfRlNMX1NQST15CiMgQ09ORklH
X0hXTU9OIGlzIG5vdCBzZXQKQ09ORklHX1dBVENIRE9HPXkKQ09ORklHXzh4eHhfV0RUPXkKIyBD
T05GSUdfVVNCX1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19ETk9USUZZIGlzIG5vdCBzZXQK
Q09ORklHX1RNUEZTPXkKQ09ORklHX0NSQU1GUz15CkNPTkZJR19ORlNfRlM9eQpDT05GSUdfUk9P
VF9ORlM9eQpDT05GSUdfQ1JZUFRPPXkKQ09ORklHX0NSWVBUT19ERVZfVEFMSVRPUz15CkNPTkZJ
R19DUkMzMl9TTElDRUJZND15CkNPTkZJR19EWU5BTUlDX0RFQlVHPXkKQ09ORklHX0RFQlVHX0lO
Rk89eQpDT05GSUdfTUFHSUNfU1lTUlE9eQpDT05GSUdfREVCVUdfRlM9eQpDT05GSUdfREVCVUdf
Vk1fUEdUQUJMRT15CkNPTkZJR19ERVRFQ1RfSFVOR19UQVNLPXkKQ09ORklHX0ZVTkNUSU9OX1RS
QUNFUj15CkNPTkZJR19GVFJBQ0VfU1RBUlRVUF9URVNUPXkKIyBDT05GSUdfRVZFTlRfVFJBQ0Vf
U1RBUlRVUF9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0JESV9TV0lUQ0g9eQpDT05GSUdfUFBDX0VB
UkxZX0RFQlVHPXkKQ09ORklHX1RFU1RfTElWRVBBVENIPW0K

--_002_66aaf2997e2b7c8df80cce40b3a9f0c8csgroupeu_--
