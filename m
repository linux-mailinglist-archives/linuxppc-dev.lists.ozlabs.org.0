Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230914CD4F1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 14:15:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K97cs5WjDz3brS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Mar 2022 00:15:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K97Z549VWz3bSq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Mar 2022 00:12:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCI1NTAKTq/pV4MPsCD9KgtZt8pyLx34lE0LVjS1cCQXaUqS+7QGUpZzgMmnGuhdt9NVIh/WVOT/Wak9/oj5hFaqmjwkfu0LMF0pzLrlC8DmQKG4ygYYSEywZJ1b7g80QpkpVRz3jn4rpkaPKsCDVkYdbTge8+nflSJw+7WnBljwJUtqbCdgp6gswMbr8wNWaaNMLhzIJEYLRIc7tpmctDqEjeGLRozFChXHoIFkxYkWyMW49EpFC35H94r8W6fYouEX+fkfXtvEzHXRKRmOdA4LbWXlLNeHcxh0vZN6w/WIcXKOjmh5naQKS74dgyrpCOkKn03sILKweGDmszOXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzsgQmIvBhRA5GbS1KuzFVlN98Fjk3vv0zmYAVRPziw=;
 b=YzuKHbdRJEVAi/+UqTM7UjShfgUeGKvCbEgDG536bsM5nDNqOVg7uABoAyhGW5KI87wAJgiupugxKphqFFfzTx6OZxHFOkQ2/e+35XmKc0yAL9S+1Fj9jFjphbezqznISdlefO6wqdcYSA3SSk/cTmEaIofN6wIqTXnT5n7lqCtAw3rwZ78hvFUq3Zk9Wl78dhps0dqsaxltI0Eecsd8Hxmi25+HedrNIAOlFKHuWFJYKE6V7uMHn5XDlFRwl5DbVDS/MlOpf6abRAXeMyYJe7V6C1JgRc94lBwM/ocuYtgNF0dB0TFgQpceMjn8Sad9GM6r+JR1Y+FdgSouXsJyaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2960.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 13:12:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 13:12:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: declare unmodified attribute_group usages
 const
Thread-Topic: [PATCH v2] powerpc: declare unmodified attribute_group usages
 const
Thread-Index: AQHYL14XKpQKsLjDOEGgndAuTeXRjqyvND+A
Date: Fri, 4 Mar 2022 13:12:27 +0000
Message-ID: <e111d334-6551-5eb9-f814-f072b4b1ba71@csgroup.eu>
References: <20220304002130.46185-1-rmclure@linux.ibm.com>
In-Reply-To: <20220304002130.46185-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df3d81b9-81bb-4a9a-f80d-08d9fde0a15c
x-ms-traffictypediagnostic: PAZP264MB2960:EE_
x-microsoft-antispam-prvs: <PAZP264MB2960CAE8DA547FE92FFE7788ED059@PAZP264MB2960.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9v4qBmVnBQyZiucbgr3DLGIp/vxY4JxIHgld6VQj4BBjVnp4/ntUv2nVIBJLNl2UHsy/SVBItPReKvjZBR/FFJol5xYMxhV/LAagddjPtAONeWXo/0rYz0RImNER0B8mytJP4RKf/v96wHGJynIDQjEt9sUxB6qpoBoHiaBAEPaJxnAbkGCQnnpZMjZJQUQheny8cz42KLXa9chwwa5NIN0MMRF31MQmKYjjte/NF48Rzvn1R0aOoYMebttBgOBatR846Yapr7M3bvVnj2f10gHANby/4hoPd4sQouVdcM10YWGyWHWglo2d5SWfyQjZR907LdGiGC+wTuzHQI0fFm1+DV35wcypHPWVAOGg5AojD59+20LF5+AVheIvPytgpCBmoPF6iSy5XX+Jp4bk8r6vhP3PxgM457HBuXut61n6p+4/n9CzVHt2zCM2Q0bMc6ZQKOznEZ+DVmbHwuRsawNFtw/zD93Cj+U7xn8ou7gqk9lLHaBtdVyOr4cQkhraR6bJJ4oo4tHCLAxeg4hKtnyVql8WpX+NxIMbMc/4V/yyQcLcnit4nsi/4bV/nHnCV3Z7qCTo2PuSJ6of91cM8gI/WHsjO5aPNGo+Y3yUjAZssUsjkW8bqnCIe3DxdkGWD0FHTbCKzojZRtCnDGBAAljcagh2nwstf08DjmkbS3e1p90eCgi7W2Lxcm/PV8IqzOAH/qL2jJiKGKxdQDySAQm+vezLWpyw9K8utGROPeI4WhfBpLWj9BNKSETTLlFUkjhY9NkodhCNu5nohRPGwKZnL1aBIO9vwpvSGLW5KbkCCrS6gW28F13xcvra4/cHBTG94u9baGoD95uzW2ePNH56Dx3qFlLyy4lQSAmc8VY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(38070700005)(86362001)(31696002)(36756003)(8936002)(508600001)(110136005)(66476007)(66446008)(64756008)(8676002)(76116006)(66946007)(91956017)(966005)(5660300002)(316002)(6486002)(186003)(26005)(66556008)(71200400001)(44832011)(2616005)(83380400001)(2906002)(31686004)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnpINnN0dmFYRWFRVGxMNHRzMnh3YzAveWRRcU51Q0FaalFRaDJZamZJZzk1?=
 =?utf-8?B?bStzSWh5MjJKK2RVNFh2YldPMk03U0lzWXlqa0ZMY0lXdkF6WkhWS0hxbWtV?=
 =?utf-8?B?bnZLTUpyZm5qNldCdDZaUFVqVGxsT2tnc01ZMk5tYlBiRHJTalVCdXVpVG94?=
 =?utf-8?B?a215RFJvYXF6TlNBWjdxbVpndTlXMVZGWmw4YkZneXNUMFJTbjVlRHBvWHVr?=
 =?utf-8?B?WUFCUEtEU0lmTDg5QkxvcXFuUEMrMnJVc1BMeGhNcGtuaXl6eFJYaDF0WC9D?=
 =?utf-8?B?Q2FZK2h1ZGlHRUY3clRZSFo4S3VHcUg2NnVxUFRYa09wS0ZsbU1MNTVxaFlv?=
 =?utf-8?B?UHY0YXlPM042aXJzdGtCZktSS1FTWlJBNGtUU0NnVm4xalppcHY4SlR5T3dz?=
 =?utf-8?B?R3p2YkZycHIzc09DcW44OHJmUDk2T3o3Y3ZWZFNaT0FzTmI5OVRRVGFkUkls?=
 =?utf-8?B?bytHZnhaWk5kMkJNR3N6YjhTVngxU2tzeDdrYTYweXY4cHVoSEpDTEtMbWZz?=
 =?utf-8?B?RlFaYS8xeHdWOThCamxWeXJ1d0xmTjBPcTMrY2Fyc1Bycmo0SFRyYlRldTVV?=
 =?utf-8?B?UU5PNTVrRmdrRysyNVdZRlNTM0FmN1RVSzltTnp4N1lTM2tGd0JoZzNqbHEz?=
 =?utf-8?B?YUxRYVIzazdCUFRVYjNGWjloY3BSTE9lbVI0cEpGc2hjZ2tRSzRPUm5xdFNR?=
 =?utf-8?B?dDFLQ3FrMFRac29wKzZrem5YRDFFTmFpYllnMDN0M3FheFE4UURHUTl4R3Rk?=
 =?utf-8?B?c3M3WENXbXpISzdlQTA2djQxK1dxZW1DVmFSZnlKcFE0eDZHTW9wbTlOajRV?=
 =?utf-8?B?cVpXU0RDOW55MFhubzQ4V2EzZjlnK01yTjk5U3lkcUtLZVVxbmVYTnhqcDRr?=
 =?utf-8?B?OU8yUGJwMmVBMlVDdjd3U3NzWjMrLzhja0RLTzFNM1AwL0FPNEo2QWlpZnBQ?=
 =?utf-8?B?ZWNZNUpJQ2pQRTVEWmFjSnVuOUMzVmVQVW9TUE9YZ21QYVVzQlBrNFZBbnlG?=
 =?utf-8?B?TG9QVFJ0TlJqM1BWZTdOd0grR1laRVBjQ05IS0t2cW5MTG9vaks3czZtRHI3?=
 =?utf-8?B?SHMrMmVsVm9laHJYL2hEc2xtTks5RW1Zd0ZxTnVkelBoMWV2bUQ0NzZUTyta?=
 =?utf-8?B?MEtTUnV0R0RFazNzejNyRHpNZ2JIbzNscEFET3dOcXR2UTFJVUdhaWFVeWRu?=
 =?utf-8?B?SnEzeitPUFQ0OGcvUkt6RmZrYkxuSzVkVzd5Z1J0Q0EwLy8xM3JlTEJlSnlR?=
 =?utf-8?B?S2wzOEQ5VWN1M055d1NFYnE4eTZVM3dPdFdrNGh0NlJFeTFDM0E0UThVUEpE?=
 =?utf-8?B?bWJJRXBxeUwySXgxWWpob0tCLzZvNWlXUnFxUTVDSEkwdmprRTN0TlhRQm1z?=
 =?utf-8?B?c0xXZ1RtaHNNcCtJbDUxbm12UnJ2TGczL2lRaXNDeS9QTVdPeW8yY3dUc0dx?=
 =?utf-8?B?aDlYSHQ0Q3ZjNHVBVSs0NFdDanQyZEIwSzBZR1RsTGpNQklMMlRBVnhPRWdu?=
 =?utf-8?B?d3F4L2xSRGR2ZUFqdWRLZWYxOHRzK3ZiSDhCN3huYXlCNjZKNXNWUUJvZjZa?=
 =?utf-8?B?MktySEhxbFRVNDAxNk41RlhDcSs1dnJRUU5BWGZVUXF0UVAyR01WQTQyV3k3?=
 =?utf-8?B?RmxHZzNKRThxc3l6eHd0NDdpSjZ0Wko4a3pSVkpLY0VCa1Q1eFpqbHNRRy9I?=
 =?utf-8?B?aStGRFZVbldGNDYwbDZIRkdJL0dVSWI5bGx0Y1pBeHVpc0xrQndtVHliUHBI?=
 =?utf-8?B?Wk5yN3NwZzRGSThUR1Q3SmRBVm9MTzlKVUtYRW44bEZKUC92UlVHMDBYTmJy?=
 =?utf-8?B?azZVY2w1Um11Ri9yNnlONzl1Z2xZOTh5MUQxdlNJM0diS2Z0WTlPcnVLS1FE?=
 =?utf-8?B?NEVIQW5KYlJLYUltSml4eVY5QVQ1NTh6MFpPRjBqbW9ZN1hyT0dKL21zeUsx?=
 =?utf-8?B?d0xIOC9QdmtTWmE2MkZCQWJnOEtZMTZBdVZHZDlZWk9tc1BOWGk5aDNDdGJq?=
 =?utf-8?B?ZmhIYTJKS1VBUGgrT2J3Ylo0RGNYQTlVUGRmS3FKaEZ1N2QxZGN1MERYY0ky?=
 =?utf-8?B?dHp2emdJeWgwS3BHcm5STmFGSzlnNzZTVUtKV0Z5TGhGU2VlZE54bVlZSWlm?=
 =?utf-8?B?cGNwd296Sy9IU2lJcjBBWnZ1N01RVVFIeC9KbkJ4Vk1wNDJUaG1zWmdPN1Bl?=
 =?utf-8?B?amRZWmZaaTFQcmQ0S3RCMGVvVHpYTW1UZDVBcENDY1lKMi90ZXZidUdnOVYw?=
 =?utf-8?Q?IeKZ4jZ5pU84ahCJbyZXKMXo2B9k1BR36yVH9ZgKuA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <489D028ECEA6C645AAB4B311CCE88D59@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: df3d81b9-81bb-4a9a-f80d-08d9fde0a15c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 13:12:27.0424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/7hujcpNEAuysx684NV8Qb+nxgMtt5mugbqlF2P/GX8DTx20ye7veQeEMa7IwugZKEiFb8shSh+hjUpDPFpJtUy0Xgzmk+XnJYzjksokEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2960
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzAzLzIwMjIgw6AgMDE6MjEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBJ
bnNwaXJlZCBieSAoYmQ3NWI0ZWY0OTc3OiBDb25zdGlmeSBzdGF0aWMgYXR0cmlidXRlX2dyb3Vw
IHN0cnVjdHMpLA0KPiBhY2NlcHRlZCBieSBsaW51eC1uZXh0LCByZXBvcnRlZDoNCj4gaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8yMDIyMDIx
MDIwMjgwNS43NzUwLTQtcmlrYXJkLmZhbGtlYm9ybkBnbWFpbC5jb20vDQo+IA0KPiBOZWFybHkg
YWxsIHNpbmdsZXRvbnMgb2YgdHlwZSBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIGFyZSBuZXZlcg0K
PiBtb2RpZmllZCwgYW5kIHNvDQo+IGFyZSBjYW5kaWRhdGVzIGZvciBiZWluZyBjb25zdC4gRGVj
bGFyZSB0aGVtIGFzIGNvbnN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxy
bWNsdXJlQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9wZXJmL2dlbmVy
aWMtY29tcGF0LXBtdS5jICAgICAgfCA0ICsrLS0NCj4gICBhcmNoL3Bvd2VycGMvcGVyZi9odi0y
NHg3LmMgICAgICAgICAgICAgICAgIHwgNiArKystLS0NCj4gICBhcmNoL3Bvd2VycGMvcGVyZi9o
di1ncGNpLmMgICAgICAgICAgICAgICAgIHwgOCArKysrLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9w
ZXJmL2ltYy1wbXUuYyAgICAgICAgICAgICAgICAgfCA2ICsrKy0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9wZXJmL2lzYTIwNy1jb21tb24uYyAgICAgICAgICAgfCAyICstDQo+ICAgYXJjaC9wb3dlcnBj
L3BlcmYvcG93ZXIxMC1wbXUuYyAgICAgICAgICAgICB8IDYgKysrLS0tDQo+ICAgYXJjaC9wb3dl
cnBjL3BlcmYvcG93ZXI3LXBtdS5jICAgICAgICAgICAgICB8IDQgKystLQ0KPiAgIGFyY2gvcG93
ZXJwYy9wZXJmL3Bvd2VyOC1wbXUuYyAgICAgICAgICAgICAgfCA0ICsrLS0NCj4gICBhcmNoL3Bv
d2VycGMvcGVyZi9wb3dlcjktcG11LmMgICAgICAgICAgICAgIHwgNiArKystLS0NCj4gICBhcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwvY2JlX3RoZXJtYWwuYyAgIHwgNCArKy0tDQo+ICAgYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L29wYWwtY29yZS5jICB8IDIgKy0NCj4gICBhcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC1kdW1wLmMgIHwgMiArLQ0KPiAgIGFyY2gv
cG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9vcGFsLWZsYXNoLmMgfCAyICstDQo+ICAgYXJjaC9w
b3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3BhcHJfc2NtLmMgICB8IDIgKy0NCj4gICBhcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvcG93ZXIuYyAgICAgIHwgMiArLQ0KPiAgIDE1IGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQ0KPiANCg0KL2xpbnV4
L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9jYmVfdGhlcm1hbC5jOiBJbiBmdW5jdGlvbiAN
Cid0aGVybWFsX2luaXQnOg0KL2xpbnV4L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9jYmVf
dGhlcm1hbC5jOjM3MDoyNjogZXJyb3I6IHBhc3NpbmcgDQphcmd1bWVudCAxIG9mICdzcHVfYWRk
X2Rldl9hdHRyX2dyb3VwJyBkaXNjYXJkcyAnY29uc3QnIHF1YWxpZmllciBmcm9tIA0KcG9pbnRl
ciB0YXJnZXQgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVyc10NCiAgICBzcHVfYWRk
X2Rldl9hdHRyX2dyb3VwKCZzcHVfYXR0cmlidXRlX2dyb3VwKTsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvbGludXgvYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9jZWxsL2NiZV90aGVybWFsLmM6NDA6MDoNCi9saW51eC9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vc3B1Lmg6MjUyOjU6IG5vdGU6IGV4cGVjdGVkICdzdHJ1Y3QgDQphdHRyaWJ1dGVf
Z3JvdXAgKicgYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUgJ2NvbnN0IHN0cnVjdCBhdHRyaWJ1dGVf
Z3JvdXAgKicNCiAgaW50IHNwdV9hZGRfZGV2X2F0dHJfZ3JvdXAoc3RydWN0IGF0dHJpYnV0ZV9n
cm91cCAqYXR0cnMpOw0KICAgICAgXg0KL2xpbnV4L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2Vs
bC9jYmVfdGhlcm1hbC5jOjM3MToyNjogZXJyb3I6IHBhc3NpbmcgDQphcmd1bWVudCAxIG9mICdj
cHVfYWRkX2Rldl9hdHRyX2dyb3VwJyBkaXNjYXJkcyAnY29uc3QnIHF1YWxpZmllciBmcm9tIA0K
cG9pbnRlciB0YXJnZXQgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVyc10NCiAgICBj
cHVfYWRkX2Rldl9hdHRyX2dyb3VwKCZwcGVfYXR0cmlidXRlX2dyb3VwKTsNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvbGludXgvYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy9jZWxsL2NiZV90aGVybWFsLmM6Mzg6MDoNCi9saW51eC9pbmNsdWRlL2xp
bnV4L2NwdS5oOjQ3OjEyOiBub3RlOiBleHBlY3RlZCAnc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAN
CionIGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlICdjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3Vw
IConDQogIGV4dGVybiBpbnQgY3B1X2FkZF9kZXZfYXR0cl9ncm91cChzdHJ1Y3QgYXR0cmlidXRl
X2dyb3VwICphdHRycyk7DQogICAgICAgICAgICAgXg0KL2xpbnV4L2FyY2gvcG93ZXJwYy9wbGF0
Zm9ybXMvY2VsbC9jYmVfdGhlcm1hbC5jOiBJbiBmdW5jdGlvbiANCid0aGVybWFsX2V4aXQnOg0K
L2xpbnV4L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9jYmVfdGhlcm1hbC5jOjM4MDoyODog
ZXJyb3I6IHBhc3NpbmcgDQphcmd1bWVudCAxIG9mICdzcHVfcmVtb3ZlX2Rldl9hdHRyX2dyb3Vw
JyBkaXNjYXJkcyAnY29uc3QnIHF1YWxpZmllciANCmZyb20gcG9pbnRlciB0YXJnZXQgdHlwZSBb
LVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVyc10NCiAgIHNwdV9yZW1vdmVfZGV2X2F0dHJfZ3Jv
dXAoJnNwdV9hdHRyaWJ1dGVfZ3JvdXApOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
DQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2xpbnV4L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2Vs
bC9jYmVfdGhlcm1hbC5jOjQwOjA6DQovbGludXgvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Nw
dS5oOjI1Mzo2OiBub3RlOiBleHBlY3RlZCAnc3RydWN0IA0KYXR0cmlidXRlX2dyb3VwIConIGJ1
dCBhcmd1bWVudCBpcyBvZiB0eXBlICdjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIConDQog
IHZvaWQgc3B1X3JlbW92ZV9kZXZfYXR0cl9ncm91cChzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICph
dHRycyk7DQogICAgICAgXg0KL2xpbnV4L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9jYmVf
dGhlcm1hbC5jOjM4MToyODogZXJyb3I6IHBhc3NpbmcgDQphcmd1bWVudCAxIG9mICdjcHVfcmVt
b3ZlX2Rldl9hdHRyX2dyb3VwJyBkaXNjYXJkcyAnY29uc3QnIHF1YWxpZmllciANCmZyb20gcG9p
bnRlciB0YXJnZXQgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVyc10NCiAgIGNwdV9y
ZW1vdmVfZGV2X2F0dHJfZ3JvdXAoJnBwZV9hdHRyaWJ1dGVfZ3JvdXApOw0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2xpbnV4L2FyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvY2VsbC9jYmVfdGhlcm1hbC5jOjM4OjA6DQovbGludXgvaW5jbHVkZS9s
aW51eC9jcHUuaDo0ODoxMzogbm90ZTogZXhwZWN0ZWQgJ3N0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAg
DQoqJyBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSAnY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91
cCAqJw0KICBleHRlcm4gdm9pZCBjcHVfcmVtb3ZlX2Rldl9hdHRyX2dyb3VwKHN0cnVjdCBhdHRy
aWJ1dGVfZ3JvdXAgKmF0dHJzKTsNCiAgICAgICAgICAgICAgXg0KY2MxOiBhbGwgd2FybmluZ3Mg
YmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMNCm1ha2VbNF06ICoqKiBbYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy9jZWxsL2NiZV90aGVybWFsLm9dIEVycm9yIDENCi9saW51eC9zY3JpcHRzL01ha2VmaWxl
LmJ1aWxkOjI4ODogcmVjaXBlIGZvciB0YXJnZXQgDQonYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9j
ZWxsL2NiZV90aGVybWFsLm8nIGZhaWxlZA==
