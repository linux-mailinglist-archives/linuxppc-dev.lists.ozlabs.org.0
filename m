Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21BC6271B1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Nov 2022 19:39:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9LpD45Zmz3cK2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 05:39:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FEVAqtCV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.72; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FEVAqtCV;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90072.outbound.protection.outlook.com [40.107.9.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9LnJ073kz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 05:38:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY0jOx5AUlKHTsn6eFF+ZgTaRF0rzslSarHquXRPqnUAFfoi42pJwiQL76ogUk5TMNSGDJu7jygBRyoOV3sUdRYAxqFSSYk+aIAeJucAUOGzJufnVZgXAsELx4cQJ6zNiuBnJr8dO206dDb5zLCfVkvTGCFboYT0/5FGBUOttaEuqLY+pgi3dkBSu2sRBxPDSLXD+nH6uVR1z+xgKq3bkbnHjW5ElDPAg3/oYNK0Qk1N7EOnoYhEvtImPwt1A37xPGFV3oU4Ce5nnrfbSc0fciGb0rjOnZJAbTm7kwRMfYHXlkUUFF3R2zOqyKx4lksLYu3nzGHczI932Wl6vEMyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYiy1PCms7iTSccK8sCwZrxA4neGrSVhj0j3p7qCLSc=;
 b=eXENNjR4W/w5zCynrEVY9MjxnmB8xVBXr5E/QACBjXaLgFjLf1CEw73QHT0B1ayu6T89Uk0u9RLAKXqk9ZD7gYVHmpEczsHl/PuAVxunkKz5tDZzSgM/YpqouMJjKUA5WHwsStwO8RxdHClk5jWKM6s8dPHj+8ghgd3euz/Utt+P0oCRsVTRFEVO8LtUpaHYhKGctTxn/DbuhUmZT0L7MDQn9Gtup4zfHN54fQz62igGHvhvPLwZ3/viPi246s/J85tL9cSqkHnTxkmNgDjDek83I57Mcbe7/TOcq1kiK1Kt7kRx15g/5dpmaCC0JX3soBTbxKGIWzlnCFajZU47pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYiy1PCms7iTSccK8sCwZrxA4neGrSVhj0j3p7qCLSc=;
 b=FEVAqtCVoqEhu9mbssqsfUKM3UI3OyNjBXBKyepgpr6U/YR9glMFuUw7PG9YYDnCegoq7XZCJFykx2qkxfCischFglusWCiRWYIejDjfpShhsMF/YmsVrejuwFu0chyz9konfnGIQLmXDr65roO1ARLTm1eQRGFB8JbavW2XYFdCAQhZfeRIjS3cdE7ezQt0G/ZFx7tcz7VwJyKTKvXj8WGZYj4QZFFH14O5Tk7V9aupbS7zTdSKSeRma7jXox43m5G3d+JYJMZfwJbEKd/VgqPCMmW9ZEUYRo4Typ9cSocnhmjUpK0GKOFBsyKhklbdrI3SqCJhm+4xEJYfs0/wXQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2918.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Sun, 13 Nov
 2022 18:38:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.017; Sun, 13 Nov 2022
 18:38:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: wangjianli <wangjianli@cdjrlc.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/kernel: fix repeated words in comments
Thread-Topic: [PATCH] powerpc/kernel: fix repeated words in comments
Thread-Index: AQHY9mzAYHjVnS0R50eSmQTC4fbQsq49MXSA
Date: Sun, 13 Nov 2022 18:38:41 +0000
Message-ID: <0110254a-b37b-4ca1-552e-215b5183fc4c@csgroup.eu>
References: <20221112075833.37730-1-wangjianli@cdjrlc.com>
In-Reply-To: <20221112075833.37730-1-wangjianli@cdjrlc.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2918:EE_
x-ms-office365-filtering-correlation-id: f08ab219-ff7d-4d99-8aac-08dac5a64976
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0dRZPSerNC1Lcq8uXK2ZIw3hDkGvOBjSEnTSQczCJpVk0SNfLQ575GzJM1X0XZTF+LoF9qO0AI4R1ozuf8uvQdvmtoNC0LlJKpopxLrmE26ihqRV/OqPoSoujGyHtr0PPpIwvPSXW/YvvoKWO4zA8HZAVVKXhRxZmajmoBerEDwdRwxLsr/NYZ02q8L5YPOhiokl4w2Q0EymAQN4pfk1FmYn6t2Qc2j/z7BlwyZVfFmjZQMiiT1tu28owb4fw0BnBcbggJEPdPOoBYZqoGOUVNGUTkQ6EQVEmW+h+GxrmnzUmjluuD2XdAOLUWUFN54eRcwnIEdxKuytZli/Dt/DibukDkWBhdE7M48MtzdxHRY5eHfYB2rnMhGGEbl2YgKjDd8YdK5J6cgYmFTWqYLs/arZEGQMOpL9qIAi6m55Bb2C0G05ODcN4sZq7fDL1YcuUN67wldsJyTIYIRej1dX7LlSddfy37Hx+U3ZFDQ3VyjmUaEE0DA+c8EnATFfqEEsIg0gKUMTHyVw2GUQDLMsaGvPAF0HzycMee7NCojscjOM+Z7vL6XflsSuVDu8QtIH/JVvrbQaqU8HQ5qm09deQoxhkIF6pUZlUQEwDe4zU4omWBYZlRbTBsfu1CkXf0gzShh++agtHTYymigkbGsLjxxYfTsrbWoPuAxnx9KQSMO2MwDmT8bsqYj0phLpU3xGZdTJDamPKBzMoPlBhbInEu8YtMGJtIz1Sss7xablAVyfmx9ij5ULBoWX02QfyUoV8ZcOp313PTebmpSsVUWJKOrRyKoebU+dOJUmedmrazRb2CnDSCsOgZOWuQb2xOJDABzhmqmFzWoQA/QnWPtemg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(451199015)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(91956017)(44832011)(26005)(6512007)(4744005)(36756003)(8936002)(186003)(5660300002)(2616005)(41300700001)(316002)(122000001)(31696002)(38100700002)(86362001)(83380400001)(66574015)(2906002)(38070700005)(6486002)(71200400001)(31686004)(6506007)(478600001)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Q3dHZ0VUUlBGQ05sTy9RV1hRb2NLTWJ4YXEyVDlHd1lVaTJMRC91MHNtaWtP?=
 =?utf-8?B?THVrSjhMSzA1VmtybVB6eXdpZVRFNkFVRFNFZzAzYnlkeFNJVEZ2L1pUai9T?=
 =?utf-8?B?OXhlWTFRTTFrUlVCRVNNNWlxb3d1akxiZ1ovRzVZUzI5SFFMTXBxd1B4dnQ2?=
 =?utf-8?B?QXU1MmxaZVlaNHNmMFRJTURZcno4LzFXRXcyK2U4ZiswR3ZRZUNNV2NONVU0?=
 =?utf-8?B?NDhtMkR0NWZJU3BMVElmaUg3SUhaYjhCT3dFeVdYODArRndDMHV3anRNTlo5?=
 =?utf-8?B?S2xkb2J5NUptOVlqbGZZUzlpSGJWSE5Pc3lvOEJqKzRzV0RabDRWTmNkZGJr?=
 =?utf-8?B?bnVWS1RyaUdSTnc0KzVEajRsbnZlcENFRnVDVEtlZndKNXMzN0ZmQ2xPMmVp?=
 =?utf-8?B?YldPSDBDWkJOL2szWDJ0dHdnOWNWZ3pZd1NSdXduYjRJMFpkckhSS0tpcE1L?=
 =?utf-8?B?MmRnSUtuNXQ2cVNyTTVFZ0E5TWVpMGFvTHVEbmFVeHVjVkdKR3RtTDdwRGta?=
 =?utf-8?B?aWgzbGdseFZQeE9jUTgzeHRNekhHL1lzTGxKQXpTY2RHOWNVVHVpVnE1YnhI?=
 =?utf-8?B?VEhqY3VwTnA4QlJ4bVdNMHkrNE9DVUx0aWk4bjVVYzlsTHIxNVVQT09DZmVZ?=
 =?utf-8?B?OXVJZVNsY21aTWxXOExsZEQvcWxicWw2TDM2TmhmbVpsaUxPN3NmTXFUdzZh?=
 =?utf-8?B?TWVqVDhsVjU1MFNBU0NXRjlZelZYQldtRlg1TFdjVk5hT0JpL1VUOEI0ckly?=
 =?utf-8?B?MzdBbFZncnpUVWl3RHJVdVl6MmtRVldpem9OYk1mWkdQeThmTVh2Wk90M3g4?=
 =?utf-8?B?dDNEVmZ2azludnR3ZFdEb0dzZ05zdU5VRHVvRm9hRVZqaGdBQU1ydlFDTWRz?=
 =?utf-8?B?WDZIY1VnQlZid05tQjdZbm8yNFQwalBXVFBINlMxZ1Y1THhkUU9HclpaYmtw?=
 =?utf-8?B?d1UxZEpjdlFObkFQdFZoMHVBdjdwand2eUVDOUJOYi9JSmNJMFA0TldUbmhY?=
 =?utf-8?B?bHI0TDFhTjdhdVcvekw1ZzlYU0greDJVd3dGMUpwajFpVWUxZWxFTXdmY2Rm?=
 =?utf-8?B?clljV1lmZStoQXBtQ2Z6VzdYdG1kYnpTQ2RaaGRiUlJjbStRenVBc1BTaGhV?=
 =?utf-8?B?RW1lNElmUWVEYjFqSk9LVXhHZXk4d2xYai9rT2pqV04xN3NkWklMSy9Ed2Yv?=
 =?utf-8?B?L2pLejVxbXdDTmh4SFFnN1NvTTU4UmpnR0wxcVZXT0NBVUdwK2pvVUJMMUxE?=
 =?utf-8?B?TG9rRUJkbklKMW9PTWRFVXpaL3JBWm5UUHdGa1prdGFsajZZODFZVjVTTkxy?=
 =?utf-8?B?ZjlHS0F2anRkNkVTQVdKa2VLLzFsYnJxOEI0QlJNS2FCVWR4V292QmFLSDVX?=
 =?utf-8?B?cnh5SWRJQkxLUktpSUNtRUhocm53Sm4vblVFYWpGSG1SUG9pRnNKMGxlVURD?=
 =?utf-8?B?cDBvM1hSVkY3enNxZ3dDZU15dE5LV09EdjYza25ud09XZVlhaDJyQ3FnNGZ2?=
 =?utf-8?B?Q1dPcG0vZnRpMDgwNU9qN0RkcU1IeitZNUtIbVRiMGdDblR6Wi9rVktJRGVS?=
 =?utf-8?B?UTNCenM3WnpRdG5sQ01nbHhBWTJvd2tCRCtYRXI4anlxZDBVeEVwKzRBeWxH?=
 =?utf-8?B?OU9wNk9CK3Q2MHd0Ry9sTytKK1grdFIxajhTKzVwVUxSQzNRZFdKUlN3dlZ0?=
 =?utf-8?B?c1ZEVlFIdGhQOHRBWW5xb3VDdmYrQ1dtUVZSWHdRaGVSOTJsNWxqYkxtYk5x?=
 =?utf-8?B?bzRGUldvREp3OXg3dU4rSWdkUC9SWkxVVWxuMHdqNU81d3M5cHBiUCt4dGtF?=
 =?utf-8?B?eWIyLzcxSStVdU4xNk1BZm8yMEZWN3p2VmRvWHdOcGhnTXl2RGNOQXhqMGFP?=
 =?utf-8?B?MTdsaTFCT2ROQjgrNHp3eC96U2h0UWl4ZTI0QzNvcXZ3SElBbytNdjJncklC?=
 =?utf-8?B?QVJHWDUrUEhjRWM0QjZ4ZHlFUFM0TjN0blpxNG5uamJOT2swZ1RmRk1MUXEy?=
 =?utf-8?B?dzl1TUFVQ3dvUkh2akJodTBsVkJJYmdQL3l1WDV6cGhvZTZkMWdxZEQzZ09r?=
 =?utf-8?B?TGtEcjZKUUJEMGc0bkYxQ0RlK0FoRm1HUGNJckh1QzYybGdMei8xOFhPdW8w?=
 =?utf-8?B?UmhTZTA2d0xKRnVKS1U1d01FZmhGSVlqVUVFYmZ4emNDenB5SmZ4bFRNNUZl?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF7D6E7D8083204684CA3181690AD030@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f08ab219-ff7d-4d99-8aac-08dac5a64976
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2022 18:38:41.3626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvkYDdkG6rqqka12c70p5mIE4TFMRdHC9C1Elw87M4dETE2Xzmk+jYT/wg507HopT3wUNjpJtxkBLunr0UAzYA42D8z1Dhzp9QFz8FKxVRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2918
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TGUgMTIvMTEvMjAyMiDDoCAwODo1OCwgd2FuZ2ppYW5saSBhIMOpY3JpdMKgOg0KPiBEZWxldGUg
dGhlIHJlZHVuZGFudCB3b3JkICd0aGUnLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogd2FuZ2ppYW5s
aSA8d2FuZ2ppYW5saUBjZGpybGMuY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVs
L3Byb2Nlc3MuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nl
c3MuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5jDQo+IGluZGV4IGFiNzg2ZGE4YzMw
Yi4uNmZhNGRkZWM2YzExIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nl
c3MuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYw0KPiBAQCAtMjgxLDcg
KzI4MSw3IEBAIHZvaWQgZW5hYmxlX2tlcm5lbF9hbHRpdmVjKHZvaWQpDQo+ICAgRVhQT1JUX1NZ
TUJPTChlbmFibGVfa2VybmVsX2FsdGl2ZWMpOw0KPiAgIA0KPiAgIC8qDQo+IC0gKiBNYWtlIHN1
cmUgdGhlIFZNWC9BbHRpdmVjIHJlZ2lzdGVyIHN0YXRlIGluIHRoZQ0KPiArICogTWFrZSBzdXJl
IHRoZSBWTVgvQWx0aXZlYyByZWdpc3RlciBzdGF0ZSBpbg0KDQpUaGVyZSBhcmUgbW9yZSB1bm5l
Y2Vzc2FyeSAndGhlJyBpbiB0aGlzIHNlbnRlbmNlLg0KDQpJIHRoaW5rIGlmIHdvdWxkIHJlYWQg
YmV0dGVyIGFzOg0KDQoJTWFrZSBzdXJlIFZNWC9BbHRpdmVjIHJlZ2lzdGVyIHN0YXRlIGluIHRo
cmVhZF9zdHJ1Y3QgaXMgdXAgdG8gZGF0ZSBmb3IgDQp0YXNrIHRzay4NCg0KPiAgICAqIHRoZSB0
aHJlYWRfc3RydWN0IGlzIHVwIHRvIGRhdGUgZm9yIHRhc2sgdHNrLg0KPiAgICAqLw0KPiAgIHZv
aWQgZmx1c2hfYWx0aXZlY190b190aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICp0c2spDQoNCg==
