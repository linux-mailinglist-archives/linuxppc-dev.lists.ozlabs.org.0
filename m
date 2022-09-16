Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814E05BB261
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 20:46:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTjhX3N35z3c6y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 04:46:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1n3PxgCT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=104.47.25.107; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1n3PxgCT;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0107.outbound.protection.outlook.com [104.47.25.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTjgl2vjTz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 04:45:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kmw6sZmvAOCydj8ShkHyA1tVuVdgLWw2LFDLoIo6lD6W7R0ae4FZJ1fYOwZhUyLA16+6zry15+DOLjPQidg4+Rw/GOUhd1Ltwcbqyzdz7pgHo8KMN2yd4vHc7xQ7g/OzEi+T7fL0e8+6CGgirPOE+RF7AddPXAuJNtZBTFusEV17LkIigczOUybw5iIhmNAACyrKM0y/5/sD99ONAu446pliUj1aySo2s+HKwAvHwry1zjHOkxznt8JudnKCHOSopBUpGoATnbk2WB3Dt7ZAGJF2G7e6QtLr8gsQ87jelfWa5Tyb8ZRQjJA8Tk4AO8uf124GKUbAH8FpsFJ67CX+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sab9qn3j4dOmVYR4qbqUDB9CuSL3P7UePtIy17cwtdU=;
 b=eJvbM4NGrtPeU8vYtTgFNFc88wbSc3Pqc3Hh6rWRK3xKNi3pKVTsobZe7tEVxyN6IrkaDjKGFAS0XQjGcM+TNPp4ZASopcpzf6nHKRMdExwYtCD7YEz8iNaTZf2RzOJ4xAppSQl6mtcIFUn/7MVkA61FWOLsq8Ym7e5/XwjOC5h+s16B0VqFc/LYpPuY5V0hBcdn73safddIqlJiFpCINB31PI0Npny+5fqx+YPEx52Vh5Z+yl9gDr4YzjIS6OR8ARA5X60HbTaEtCgPWeDc1tq2CRBiy55y68fLZIV/kIqr2WDfXfCXnivJMWguO/l8tLivC6KhM2oj7Y12PCfuyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sab9qn3j4dOmVYR4qbqUDB9CuSL3P7UePtIy17cwtdU=;
 b=1n3PxgCTowjs4HdWd516v/u4z2MWkV2yYeraR7GZX2WcwMvXtdl46jvJOc35mqctzxirnBJ+d1IF/STHm2nP7Bc6He6zt4SGsBHtGv5i4TaBTNqe/2umEbFsw/CK0Lw38mCMjiR+A3maHnFdlobZJhIih8v+9DhfN5njOLDfR8aNkQigRl/aTARTbCfVHxLf6Tl573WKjt7y787G//eDeHUnnpw/U806PE2Aod1Ll0dlWM4L+jLiOognad5lbt4UhvbsALhrXcUGJTBsjkHFvVOJ2azVBvRCUMU3pNu7W0J4FNf80ZXz3lzy22sJlFrW6GKQT0vZYqwx8cGom+Uaiw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1595.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 16 Sep
 2022 18:45:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.023; Fri, 16 Sep 2022
 18:45:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 6/7] powerpc/64/build: merge .got and .toc input
 sections
Thread-Topic: [PATCH v2 6/7] powerpc/64/build: merge .got and .toc input
 sections
Thread-Index: AQHYyYH4t8jwdPXhFUK6K5W2EITwIK3iZemA
Date: Fri, 16 Sep 2022 18:45:17 +0000
Message-ID: <d54b206c-0254-9def-d558-50c82a89f461@csgroup.eu>
References: <20220916040755.2398112-1-npiggin@gmail.com>
 <20220916040755.2398112-7-npiggin@gmail.com>
In-Reply-To: <20220916040755.2398112-7-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1595:EE_
x-ms-office365-filtering-correlation-id: 5c12ce10-8e74-4c4c-2ad1-08da98139992
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hqp3q8GtJQe8kkUOA2BKTnVAzG21ZHqS4xPM7G/DreVNKSGRUnIz1pU2xmsTnfz309U5JpTUL+SdyD9KentsEw0uRc8A30QC4sEcZ1i1XsN674wyMKUT8YRbhl9wWr2tWYj0Zj7JWS+h6vpkXrK4UI03hPuHSqsIOxbSWZ+/K1gmXaMure6Cjq/3fa66lOR2eLYhq+RjdoERBOvA4cstI+qh7s4OczLZvkuPdLjVYZX9EiOEfSsY+HBYEYmv/6Rf9qyZOmGeV0gNXnGSaXShKEgQGTQetO6su9z1HKU4pL37EYP2XOn9WKMbABaejdh4U8jhXqXgtkznmzhYrW7AMucAHcud+faHxQ2pBnCFsE0flbGgZZiL/Pzcw1TRRY0kgW8ZH+AoFiqb8lJff5JEslNFpMRiDMhLTA/8LhOSFppEoKzzLIJQxh/PdLAtO1qpBXAGpJQ3ICOzYBqFoFS5/IhTQ8PYODC4OqzbYt0EIAdOrXXDrEPhEffomJsgx2L6ApN7thyzvoAaHQgVLXTWizi0jQ5fLkzJqRElHxwNOIdDIzqVRhYpzAcPgGe7iMwebt6a4rGCU+yrcXJgDqMajgTdxHCUuzOzp8pyX9x+b9g+NqCnq109l8ugjiVqs1u6JEQrA+MSu41BztV3iLOZtBJds9+BeRvguR2iPQHyqSJ4F36V4Jf+bRNTFeIabQozq+RissIlxqG6fjD0T5nkjoxyno5g1NBgoelGWUF2CneJylrm8AGJI1omI/S4WA9IYI35cgHqXZl24JZ8ZfiwbJaoLX6FF7QO652kVnSPpzwY2t3NiGrRG1ZPfBpE4BKAWmTsKG2t1uo6/H+Hta2bVDC0ZslwMSV2N766GaTwJ9M=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199015)(122000001)(86362001)(6512007)(2616005)(71200400001)(26005)(66556008)(38100700002)(8676002)(64756008)(6506007)(5660300002)(110136005)(44832011)(6486002)(41300700001)(2906002)(316002)(66946007)(76116006)(31686004)(83380400001)(478600001)(91956017)(36756003)(66476007)(8936002)(66446008)(31696002)(186003)(38070700005)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SnpBTkVtdTFFZWRicnNXNVpNUjBpSEtlYUV3aHhwZFgwb1ZwT01WQldMYXh4?=
 =?utf-8?B?enNxY0pqYmdETTBFbDZVNHZQaERFN3Z4ZmhmN0hFRys1emVmMWNjR1Fuamo4?=
 =?utf-8?B?ZXpwY1lFSW92UDN5MHhLY3hVelBqR1ZFQ2pJYzh2UElhSFdVQ2RSbE1CaEIz?=
 =?utf-8?B?THJYcWlLMkFPUHBkaUEvWXlObFdyeGlmL0pXcWhSMENiUTBOQ0FqZnFnV05h?=
 =?utf-8?B?QmFXUTV3cEFucTUyTWFyNzhseTJSRW93UzdiSmUyUmZneW42eDdOK3RRRlBt?=
 =?utf-8?B?bUxiRlZRS3NtWXU0bTJsczY4eW82YmFVNVo3SFpLTmJ3K3FGeUJJSXRPaUY4?=
 =?utf-8?B?YTlqbXkrTnNueFpvMW1GUWtndkZ3SUpNY3JyN2hLUjlNSEVCKzk3WnNKY1dm?=
 =?utf-8?B?K21MWXdqdGE1Y1luc2t1eFllbEJZcW1ieXV4eHkwL2d2N0VuZXgya3lKbTRR?=
 =?utf-8?B?TGFLbEJkd08va0tpMG93bDlRbDdrckhPMmNEUVlGQzBoQzg1dVVMdW90WVNR?=
 =?utf-8?B?dTg3a3pKMTZLWnVRemxhRHBHZlhORnFGTXdJdElXb0dJRzlLMEpoZ0Nsd2hI?=
 =?utf-8?B?MloxZ3dBeXUveWpscldPQTc3MlRadS9iV2ljcWlCakE2L0I1Njc0VVBiWnBQ?=
 =?utf-8?B?dGJTM3dlb2dJWVFtY3ROK1Q1c21ibkFuRGRWZ3F1c3RObkN3cTV3aUFqOFV3?=
 =?utf-8?B?Tk91c2xNQlloTzNINStvbkxzekFXMFZrZmJSem9aRGEwSkI4K1JBeE02OG1U?=
 =?utf-8?B?RXl5NTY3VEhmRklncCtETnUvQUNJZHNMSGFTT1piS05EbkJyWmowR0xHZUhQ?=
 =?utf-8?B?TEpzZUg4QzVwZFdBQ0dMellWMmdwdlhLSm90UmltL251L2JHUnk4WXFTL1Ry?=
 =?utf-8?B?Zk9teWp1S1lpcVczVC9YSGxwY0VJSXoxNTJDa09yUXFzZ3ZyN1RwWTd4Ymxv?=
 =?utf-8?B?a0kxSXdkZjZrckxzeEtQOStoR3JnK014RFdPTGI0ZTJ0a3ZIYlAzc1MwbXpt?=
 =?utf-8?B?MThia2xHZ3laQURSTmJxUWlXRVBQSlRtQVVKUS83amw0SVVaaVVTREV1azlq?=
 =?utf-8?B?VFlzM2grUEMxWVJRRDF4bVAyN3hvNFlOaEM5SkdOeldFWC9zTTFhK0pIMVU0?=
 =?utf-8?B?MmcvUTdHWElsemdqTGtHYTZsMW1EQzU0cjgyNjJOdHNLWTFFbS9SMVZsajhQ?=
 =?utf-8?B?eUpOaEZGU1RZWUNabDNzSSt6bldLZUF5Wi9rVkNlNXNoWnBheU9PSWY3aE90?=
 =?utf-8?B?MHFNdXlHVXhtUTJXY1ZyTlVwRWc4TE5la3AzUXVNaGRZeitsN2NncTArdVRE?=
 =?utf-8?B?eHJlVExyVjZJNEova1BYRDFYOUtqdnZOalMyY2V5VnN5Mk9LeTZDekNhKzdq?=
 =?utf-8?B?ZWlsQ1dZbjRHMzBnamVwNUcvbGgvSThFVDRQV0s3R3Eycm9JN1dmcDFLZWNH?=
 =?utf-8?B?c2M4ekY2eFJmNTY2QnpuVTNSRmZpYlhPN0ZMc282czNFTmplV3Iva1BWRnVU?=
 =?utf-8?B?R0g2Z2w0amZ2cU1CRU5ibUxDdXdVbnVFYmwveTJTRjUwYlgwSkE3emY2eWxS?=
 =?utf-8?B?R0JEY3UyK0VTUUFoZDY2amdaQXhzYU5ZeTVUdVN5MENpTmx2SExJL3diMUp0?=
 =?utf-8?B?RmVQQko1eDNUL0huRi9qT1lhSU9kNEJIbSt6UjYzQVNCVVMvWVFlMHRDMUdB?=
 =?utf-8?B?Smh2MTIxY2NwbllqSlhCZUlsMjV0RndVVkp0OUZKMTJiOHpMVnBjUHhrd2wr?=
 =?utf-8?B?enpKTHJJWkpLQy9nRlNmdWZ2N1dnOW43WVQyTDFWaHo5Vk81ZkZvOXdYSHh1?=
 =?utf-8?B?dkduaXFXeXA5TUd3K0U1R2RzbHlna1MvcWRYRW9vTEFTZEgralFTa05Cd1BF?=
 =?utf-8?B?WUd5WndDOXdHS2p4N0VxWk1SczF6d2xPcGJtbllIZzV2QW1qcUVGZ256UFRX?=
 =?utf-8?B?cDJTOFNIeGpmZFJXcTI4K050YU9jRzh3Sk5ndWQxY3JqOWIxRVdzTC9PQ1dF?=
 =?utf-8?B?L0dxdjlpcklVYnA4WlVCaWNpMFZqTVp3ckU4NHladTZpbXk2NUwrdGtJeEpL?=
 =?utf-8?B?em9JbkJ5Q1FIVFA1TEt2WTJ2bElOT2dWb3kvVGNRdWZTUWNDUjJ3amtLcjg3?=
 =?utf-8?B?N1hIdEtEZitweEJObUNhMmxZd3lyYWJUS0lOQ1RIK0p2V0ZodkhQWXNuZTQ4?=
 =?utf-8?Q?R94US3NbytD2JiKLmNMZ/es=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76384D183CD1FD4BA042ADDEA4EB880F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c12ce10-8e74-4c4c-2ad1-08da98139992
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 18:45:17.4484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 68+HYWXB3aRJD6ztr2r0agsSwKKomW0DaYyc7/cPLNlkcHQ0xA01jyYi76mdEo2PxyypAjsOp6KQ1xdwH1W9+fpgxELhkgSlWKEZmZIn0MI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1595
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

DQoNCkxlIDE2LzA5LzIwMjIgw6AgMDY6MDcsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBGb2xsb3cgdGhlIGJpbnV0aWxzIGxkIGludGVybmFsIGxpbmtlciBzY3JpcHQgYW5kIG1lcmdl
IC5nb3QgYW5kIC50b2MNCj4gaW5wdXQgc2VjdGlvbnMgaW4gdGhlIC5nb3Qgb3V0cHV0IHNlY3Rp
b24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwu
Y29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3ZtbGludXgubGRzLlMgfCAzICst
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3ZtbGludXgubGRzLlMgYi9hcmNo
L3Bvd2VycGMva2VybmVsL3ZtbGludXgubGRzLlMNCj4gaW5kZXggNzM3ODI1YWUyYWUwLi4zZDk2
ZDUxYzhhNWYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdm1saW51eC5sZHMu
Uw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3ZtbGludXgubGRzLlMNCj4gQEAgLTE2OSwx
MyArMTY5LDEyIEBAIFNFQ1RJT05TDQo+ICAgCX0NCj4gICANCj4gICAJLmdvdCA6IEFUKEFERFIo
LmdvdCkgLSBMT0FEX09GRlNFVCkgQUxJR04oMjU2KSB7DQo+IC0JCSooLmdvdCkNCj4gKwkJKigu
Z290IC50b2MpDQoNCkF0IHRoZSBiZWdpbmluZyBJIHdhcyB0aGlua2luZyB0aGF0IHRoaXMgY2hh
bmdlIHdvdWxkIGplb3BhcmRpc2UgdGhlIA0KYmVsb3csIGJ1dCBpbiBmYWN0IHRoZSAjaWZkZWYg
YmVsb3cgaXMgcG9pbnRsZXNzLCBiZWNhdXNlIHByb21faW5pdC5vIGlzIA0KYnVpbHQgb25seSB3
aGVuIENPTkZJR19QUENfT0ZfQk9PVF9UUkFNUE9MSU5FIGlzIHNlbGVjdGVkIGJ1dCANCkNPTkZJ
R19QUENfT0ZfQk9PVF9UUkFNUE9MSU5FIHNlbGVjdHMgQ09ORklHX1JFTE9DQVRBQkxFDQoNClNv
IGFsbCBfX3Byb21faW5pdF90b2NfIHN0dWZmIGNhbiBnbyBhd2F5IDoNCg0KYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3NlY3Rpb25zLmg6ZXh0ZXJuIGNoYXIgX19wcm9tX2luaXRfdG9jX3N0YXJ0
W107DQphcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdGlvbnMuaDpleHRlcm4gY2hhciBfX3By
b21faW5pdF90b2NfZW5kW107DQphcmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5pdF9jaGVjay5z
aDpfX3Byb21faW5pdF90b2Nfc3RhcnQgDQpfX3Byb21faW5pdF90b2NfZW5kIGJ0ZXh0X3NldHVw
X2Rpc3BsYXkgVE9DLg0KYXJjaC9wb3dlcnBjL2tlcm5lbC92bWxpbnV4Lmxkcy5TOiAgICAgICAg
ICAgICAgX19wcm9tX2luaXRfdG9jX3N0YXJ0ID0gLjsNCmFyY2gvcG93ZXJwYy9rZXJuZWwvdm1s
aW51eC5sZHMuUzogICAgICAgICAgICAgIF9fcHJvbV9pbml0X3RvY19lbmQgPSAuOw0KDQoNCj4g
ICAjaWZuZGVmIENPTkZJR19SRUxPQ0FUQUJMRQ0KPiAgIAkJX19wcm9tX2luaXRfdG9jX3N0YXJ0
ID0gLjsNCj4gICAJCWFyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0Lm8qKC50b2MpDQo+ICAg
CQlfX3Byb21faW5pdF90b2NfZW5kID0gLjsNCj4gICAjZW5kaWYNCj4gLQkJKigudG9jKQ0KPiAg
IAl9DQo+ICAgDQo+ICAgCVNPRlRfTUFTS19UQUJMRSg4KQ==
