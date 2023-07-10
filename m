Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C474DC81
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:30:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cHECE2ao;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R09yP65Csz3bpq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:30:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cHECE2ao;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::624; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20624.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R09xY2NtQz3bVG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:30:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uq7n9uX+8IoTDy6ji9DmIMamykQH/IzsGMg7FJBPkunQwcGURGYrX9BQSKMBjUHEu0ZxHTZCuIGnGXYgcMhZr1Ohc6QcpztczEwfMy7CCYnGfzZBydffNWtNsRijMPdq3Y3cJO5PWmVvCxAELlx7cH9Ih7LsZzqDbcxBlnikTEePYGqjGRafNSrx2Ktmhp1LEUs0snoAv1zlvdXs+ELhbhlDtCrN6zQ+1b5IcGTcxm16d2cX7fKPPPwCBzM4EuDDOI3k9SW9s6igl/gLZDsRouDUaks5sHtPv05b1NXDgFyGV6D/FsPpnfz85qq+VBXnl/vqYAZGZjc9g8qd6ceYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GgmGFaMjkrfIx/04SIla3pnhz/kL5sc8UkqE10JRcc=;
 b=A4aie1eRl8h87x5kNLig6Ul4LnImQpjTI6X1SXAMrc1uM2xsSOBPijF3pQLoufm09VFKvWhYgQ4i3mbyE4kwfy7ODszlhprhgXlEbiNEAC+DKubtCraQ8ZLe2G+5gImpOgFBrgTcvmG5it7NijLqdRVfvqgskx1wSW+3wJtDnwoGOLAtqt3Ekgw/vA83+NrRI/jxXwXuFB0F0e28yw9fZJvB38y5tJnVJaZVT0BdTV4XckQejVV8lw7PS8DW5yAmiWs9bIy1Uw6sxssgnQdF5uApISD9wy33Nm6esprC0jJ5ZvqG9X40jkeANsaJvpUwmozyak28BFx9QbGo2mi5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GgmGFaMjkrfIx/04SIla3pnhz/kL5sc8UkqE10JRcc=;
 b=cHECE2aoENy6gcObPoYmgaTlHGAxzwaHBW67PkYIeL4ZitTNPBnepth3Lro4StR2KtLyYG8Z8SiAZcv/JCq0TaQurwTZG1qP5ZLksyv9xbtD7Az0mvFIJJYAaoYGlovMPZi4YeXIby3hljCoeT6yxF3Z12mwCf67CSqcYXKg0E39ehcotEVr4nF+QJiTWe/hzAs7f24QUpIOs6K3dVtKEu1CHHWjT+RtvV/aShovmXBsaeCcaubHHqQYl2V4XdwU1FkNQ+mBh2P6EWH1te0hx7SwsiWKHq1Ezcanu1tw9p8+wACfY8pkmUmNGz/eemq/63GKWbvdvAX6BTKI3DndKQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 17:29:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 17:29:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] mm: Add __HAVE_ARCH_PUD_SAME similar to
 __HAVE_ARCH_P4D_SAME
Thread-Topic: [PATCH v4 05/13] mm: Add __HAVE_ARCH_PUD_SAME similar to
 __HAVE_ARCH_P4D_SAME
Thread-Index: AQHZs0jqZyq4R50Iu0udRl+irLM3QK+zQa4A
Date: Mon, 10 Jul 2023 17:29:47 +0000
Message-ID: <f9a84c8f-614b-bee4-62b7-97aca037abe1@csgroup.eu>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
 <20230710160842.56300-6-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230710160842.56300-6-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2046:EE_
x-ms-office365-filtering-correlation-id: 74cb63e9-458f-47cc-ca11-08db816b4278
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ofLdUaoNeFjYkttDWAz96ErG4SOUKEJcRpFcr6PtSmCZiSq+kmERe903aYucAmwhAYvL/N1mUt/KH11FGETntKdeDzhL1wTVTdbYe7OoxGHZ4WgW4tOEnhgPfOy8TdEk/mJNtteJcX19yzSDXxQPd2f6NHL8Z77K7zkgE7AgRnaPiN8Cnqw7AoyEqwHSuOs31sSON2P0NNcEATwA91Hs4G9BWj+IqH4xmT2FeXXKIeBbjsW3Vichdwvtk5jgDw5hwiDePqOx7h7/+ZWkXyq/SZHqLxQu2foxNFmS0Vicd276r8k4Z2CXxkzY7oE9OrSJJLpg3hN9UKTlB/XmCD3CuxoCwBNrtqTQqq9LlsxXLCL6h6esn+AsGMYQeywSMErOX3Cv45sPhouPPYJIk/8Lggp77Lu+XgyC40aHOc1OTB+iW+hKHWHstg3di9A9uEXxob8FyW/i8h3OKBjorWmP+R1WrrnO7zapW8KASSHkpeYqtjTooKfmEfUDnNXG7a9eIXLc+4vp17HIz/7m1KpbghgZ/L6FgRAW6i/mdrQiYCxKmpN2d3lqImMitTBhE1Yyq3QNbim2Cys94CRXiyJ/VhLMzrfKZsvk2V0cdVdLiqRv+qh6u+CwRuN8mMImwh9axJGOGUWEFfIrkvwO8OIKsFfi+Yz8pfRgIMi/z2xfDNfVOX/hQ6mOy4mldstwBr+fYs3vQrRr21T2OHBCpiwEwQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(186003)(26005)(6506007)(2616005)(6512007)(44832011)(41300700001)(4326008)(64756008)(66446008)(4744005)(66556008)(316002)(2906002)(7416002)(5660300002)(66476007)(8676002)(478600001)(66946007)(8936002)(6486002)(54906003)(76116006)(91956017)(110136005)(71200400001)(36756003)(122000001)(38100700002)(31696002)(86362001)(38070700005)(31686004)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YThTT2ZkSjh3Ky9NS0lTSG9qUkZkYXgxK3FRSmdRcVU1NWZTbGw4Q2g1YWNN?=
 =?utf-8?B?b1pqMkM3VHY0NTBLVVhqeTIyYVhDL1VyTFFEdVJSU3ZBSFlDMGJwRVN1K2dR?=
 =?utf-8?B?Mjl5ZjhyVnEyOTZETGxUdHppQlBEZW13dHg3TDFaa0E3dEZ0SzNHcFJtRFY5?=
 =?utf-8?B?eDczZlI1QnF0aHpYSHVEQWZremdDQ1Y1M0h0RnFsYzZrbzBHb0JNNkVvK3Vw?=
 =?utf-8?B?N0VVb3pUQkN5d1VCUXV5U1pWTVV2SytvT1hENWd0Z3puaklURlVOdWkzV0xX?=
 =?utf-8?B?NlUxMnJaTU5aSk9QV0pYUVRPeHhSRkUwZDFWM1RLMTliYmtPUWlhRk9sNlRU?=
 =?utf-8?B?ZFFhU0dTUy9PckJYemlBLzc1Qy84NTJVbUREY0h6aGhaV2EvMWpwOGN6bTUx?=
 =?utf-8?B?QloyT3hKVUZScmVoL1IyaUhTbGYyL20ydVh3d29iM0gwb2RwQVNsMWtmWU9I?=
 =?utf-8?B?TFA1ZmxpNFdsa2o2V1pWTGRKSmhUazFtMGhVTjhKTkhiL0RFSlVDT1RZV3Zy?=
 =?utf-8?B?ZWRYZ0xQZjhVOVU5YVhtY2JFT1krNjVpQ0FMR1ZVL1BZbkE3U0k3M3BqZmsv?=
 =?utf-8?B?SXJmZ3RvYlI0T2tkb3ZCOHY3aFAzeEdNd2VtdmxFcjI0MFRsZ2JXbXZtYWE0?=
 =?utf-8?B?eEJpbWpIb3c2QytFTWJLNFhzY3Y2VkJmbXhuZkhrcEhNSVhoY0pqcUhybk9I?=
 =?utf-8?B?MytHSUplZ3RNWWRDZlFYc1dvZWdzbkxBenM3b1hwbFVaNmNFeWRPYU9xYlJD?=
 =?utf-8?B?Z0tCays3VCszWkFxcW81M2dNaFMvVi9YSlF2NzlqMU9xblV4a2c4MStJaXVI?=
 =?utf-8?B?M1ZJbGRPMWRIUERwOFpId3FYOC9mMWwvOUdMQ0RTZ1daRTJYTHZubmNMbnJv?=
 =?utf-8?B?eUFXZnlqSE9aY3FPUWUvL3RkSXFCWlM5SklFaHRnMTc1YnQza2c5NHd5TkJv?=
 =?utf-8?B?SVp4SURaWjgzZmdCcm95SCtCQzFiMTBXU2ZoUnMzZVNxVmJZTlNJZWxNc1Jo?=
 =?utf-8?B?bWxBRnhadDdLcVJzV2YxRnl2WVVuYm9EQ3Y2YlI0dEtIaXJvVmNyeFNsNzlu?=
 =?utf-8?B?UVYxdzYwaG0xeGFMelJHSHgyRDZjZzdrZnRUSXJHTllMQS9EZm50RzRDU0NU?=
 =?utf-8?B?UUtLUDRheGg0OTdOQ2Rqb1pEVklUY1g0YzhGcGNGWjdpVzhaZ0NoeTdmSDlD?=
 =?utf-8?B?NnhuNmNncEtYd2ZkeWxpRjlUWmR6MTRwRitsbWdML3ZBNElIZ21QZ1pxVGsx?=
 =?utf-8?B?K2RkQm53L04rRVFEc3E3OFVsMjdhTGdaVUhPSzNUaHlLYk84YzdXOVRJRDlE?=
 =?utf-8?B?bUlNcWJLVWtaRWpmOW05ZXRpaUhDejlaajkwTjYybUxxaUxzS0lCem9lbld0?=
 =?utf-8?B?N0VMTUgwczFVOUxzK3AxTDNtMEI4MkxYK0hHTi90K3YvWWJoTU9aSXVncjhU?=
 =?utf-8?B?MUlBTlRDdTlXUm1CT3YrOXFaRTduUlN2bk14VDIxbjU5a0IrUUJybjlaZVQx?=
 =?utf-8?B?ZWM0UmpxNmxaQmo1ZHJKcHl4RTlPLy92NDlkeFFRc1B1RWo4UDdUOE5QMTZY?=
 =?utf-8?B?RVhUaUJQUTduQlRNclVHYmliSVJINUcrbEFNbHlXc3VxS0ROMjZ5d0dpM1VR?=
 =?utf-8?B?dzdCaDBnV1pCQUsxRUQybzhKa2lOcVFmZWMwNFNHcmhVb0pqdXlROHFlbFMx?=
 =?utf-8?B?dkduMGxBZFdyS1NmV2FFUHFWTUZPRG52b2tDSkUyc2oyWEVRWUZtMVZ0b2Er?=
 =?utf-8?B?M1NpRWZZMEh3ODBEbUlONy96V2ZHN2VLa0loQXhoVEJsK3orYXFqci8rSGVM?=
 =?utf-8?B?TjJDWW00dXFMUlU1Z3A2Z2lCeExDRjVtejNnbTVSVW1Vb3dZNW9uOW9YR1pN?=
 =?utf-8?B?d3FhRkdFbFN6cjBWOVNYaUlVWEVOMk9wYXF4VTBVUWZtNVFpUE44aUFnbUpM?=
 =?utf-8?B?VTNic1lFSFhGYzFVclRwSHpaQmxJNEt0a2VKOHdQdWkwbHN1UkdwZ1Y2QThW?=
 =?utf-8?B?SHVkRkx6RFQ4ZWN0eWJyZFN0RGJZTzN2bm5XNGlaY0ZYRkFKNzVBVGpBbFl0?=
 =?utf-8?B?N1Z5SDFQYjBDQ0dQb1VOR0xRL0FMWjYxWngzU3M0S2pqNHdJK09MK0FtdlNp?=
 =?utf-8?Q?TADH3W7ZJb2RchMWva9/sCzox?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7829671DF6ED24FB2A27506534C621F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 74cb63e9-458f-47cc-ca11-08db816b4278
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 17:29:47.9151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vMnbGCsYzybjkFu9p2z1ks1W7DLFxLrFcDH1nrmeAY+WfBF3k5WHuRKfdgNVuNboNfr95Xln4aQx7RlgPjtzrl5u7vOcODsuRCnM7IDJZhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2046
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjMgw6AgMTg6MDgsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gVGhpcyBoZWxwcyBhcmNoaXRlY3R1cmVzIHRvIG92ZXJyaWRlIHBtZF9zYW1lIGFuZCBwdWRf
c2FtZSBpbmRlcGVuZGVudGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5lZXNoIEt1bWFyIEsu
ViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNClNob3VsZG4ndCB5b3UgZG8g
aXQgdGhlIG1vZGVybiB3YXkgYW5kIHVzZSAjaWZuZGVmIHB1ZF9zYW1lIGluc3RlYWQgb2YgYSAN
Cm5ldyBfX0hBVkVfQVJDSF9QVURfU0FNRSBsaWtlIGluIHRoZSBvbGQgZGF5cyA/DQoNCj4gLS0t
DQo+ICAgaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggfCAyICsrDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGd0YWJs
ZS5oIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgNCj4gaW5kZXggNmZkOWIyODMxMzM4Li45MWRl
ZjM0Zjc3ODQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oDQo+ICsrKyBi
L2luY2x1ZGUvbGludXgvcGd0YWJsZS5oDQo+IEBAIC02OTMsNyArNjkzLDkgQEAgc3RhdGljIGlu
bGluZSBpbnQgcG1kX3NhbWUocG1kX3QgcG1kX2EsIHBtZF90IHBtZF9iKQ0KPiAgIHsNCj4gICAJ
cmV0dXJuIHBtZF92YWwocG1kX2EpID09IHBtZF92YWwocG1kX2IpOw0KPiAgIH0NCj4gKyNlbmRp
Zg0KPiAgIA0KPiArI2lmbmRlZiBfX0hBVkVfQVJDSF9QVURfU0FNRQ0KPiAgIHN0YXRpYyBpbmxp
bmUgaW50IHB1ZF9zYW1lKHB1ZF90IHB1ZF9hLCBwdWRfdCBwdWRfYikNCj4gICB7DQo+ICAgCXJl
dHVybiBwdWRfdmFsKHB1ZF9hKSA9PSBwdWRfdmFsKHB1ZF9iKTsNCg==
