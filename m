Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A08BE23C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 14:35:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=LK+b0sYm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYd5p1kpmz3ccN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 22:35:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=LK+b0sYm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYd512pt9z301T
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 22:34:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eExHpcSK4dPzrU7/aw1ku+58yGH0fHgjrgk8EjXbQhLjwGit0TSlRJ3ZGVWxu6WOonlS5K8LqfMtKb3k8Df+GJiRCGuozbEYbMOe1HpimxGHZMUCDJ0gYQ8M7f1tj9lx/F6Vjh8V2yiu6goQIUP1wk4zdQ3uF9stodgywVkRr8DrmFe1k5Pmiyy1NruMsHiFD1nWOznPr4+voEROQ4p+NaVHnHSS4lKHPofOhptspMexgHCriwP6XpmOj/VCZsgVFPIANMoe/CfH22jag/Dd8IaEWqm/RZVyCZ8GUeDzA/gzeH67sjkYr3uaRY02sYZywR+Tm2usBVh9D8Pg0Td04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jd7DETALDxmVVPPW6rA/a7TE/yHc2inHfiEEJ+8iU9s=;
 b=CXioui6C1sBXOBjaU3x2LADzXb9rYZoNw+5feLz3P4nx3aIxFAbRm/n5JoJK19xS9LCDLQOcH7k2CaDx3clK6ZV8p/6kSSCb9Z5uyz7irGE6WXxyCwxy+BqasHKJr4mAsq5FfGW+EAiARhXnJ+z03qDIi8wtJpxmCafqsOjXmFrcZ/PBbZf2fJDkCmVQtlOO0z7y+BQ6uWeQIqXzTbHEp3+cFihs7T/uYutLViBlu59hO0IyvRUcI7d96IDHkZnA5ihItpMndySP9jCxjdGB32rlxMLKPfvTBtg8c3Mkse1vShafx18Urxut2SbjV75Pl8P/u6x9zPn20Aafz+nWgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd7DETALDxmVVPPW6rA/a7TE/yHc2inHfiEEJ+8iU9s=;
 b=LK+b0sYmot5mfelWqfctCRcxeCHHYcE4Qlr7FjFnih5OOIRBp/0xy0IH/6UVZi+nVRwyKARhvoF8WF0o7reNWHSh8SevMgQGYPDVWD2bgCT7jS7zQuD00DyJBp945XINoQwQeyRUifxIsxDxyLopJy4ArkNbnqtZzDAcLtecYX+pcK57RwVP1YU5lTLPS3cq9nQuMDMQfNLx1+ketrZ1IMrVy21Dli0jq/J/lQOvzDZeI/lMg+4ETPchBIsPtr6+OIrym7q537vYJhZyESSh4+9tiSVEi/350vTyqXh0QmyjJgpokoj4iH4DVx6ANM/enFcD8uXFZHWQ9Yuu92yCRw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3299.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 12:34:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 12:33:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] radix/kfence: map __kfence_pool at page granularity
Thread-Topic: [PATCH 1/2] radix/kfence: map __kfence_pool at page granularity
Thread-Index: AQHaljgah7ANVfcXJU2ATCgno2aPG7GLyTqA
Date: Tue, 7 May 2024 12:33:59 +0000
Message-ID: <a15752b4-011e-4a4a-82c2-9aa6b3b6d655@csgroup.eu>
References: <20240424110926.184077-1-hbathini@linux.ibm.com>
In-Reply-To: <20240424110926.184077-1-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3299:EE_
x-ms-office365-filtering-correlation-id: 5a0888db-7676-4855-a240-08dc6e91f88b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?UkdGUGVIQ2pHV0daUGNMdjJyeXpqeWlEOHkySTdESDJnWDJaY0RTS2h1VjVr?=
 =?utf-8?B?K0FSUWZ4ZCtDTWw5ckdjYkUyNjhJK0ptZ1BtRm9VdzFFY0VrUU1uSUF3bDI0?=
 =?utf-8?B?ZWRScGpMVE9kNzRGOFlON250eGJBanVXQTdzbllkUWVCK0FSMzJyWUgwckZW?=
 =?utf-8?B?ZVlnMDVRdnNTb1lrYTRNQkEzc1lqUlZNVUU4ejFUeGx4aFI0WUEvY0twdk4y?=
 =?utf-8?B?OGRsK3c1MVVXK1FOYURKWjhmZDVORUJyMlBndWI1WEkrZWcxZmtEMnhOOXdK?=
 =?utf-8?B?Z1pFQWlBczVkeVhTR3AvZmZSaERMcXZCWGN6bWZRVFYwcHhYQ2l4WUN5VHE2?=
 =?utf-8?B?OWRJVmZkM1JURTZkWHFaL3JMYzRFZFNUNUNyUlM5N2pEZG94NkYwcTZJQjVx?=
 =?utf-8?B?YUNsblAva2tmMm90MzZtYjg4Vm04RkZFRCtjY2NqTlJoTS9Gc3pCYTEyYjAz?=
 =?utf-8?B?VXhpeDQxb3JiYkl6MEIyUWk4SiswM2d1cWlpZFNRTWJIT29IbGUvL3NhVkdR?=
 =?utf-8?B?dW91V2pJYTZ6SE1RMnoxNHhmY1Rpc0NEdnFvdlJGOFhyS2FLQ21rd2JyM29s?=
 =?utf-8?B?dXMyUmZvYkE4RGYzYWhBRFVYbXZJQnErTDJLRGFHdkpCNk9YejFGR0pMZGg2?=
 =?utf-8?B?a240bm1FK29wY0tRSTBxSGFiOVhkdGgrUGhYaUgzTjJrSHZ3SW9tdXEvR1Ax?=
 =?utf-8?B?ZkJLZE5KdmdWTVRPNyszcE1tTmI3bzBSdUdDcU9Md1NCdnN4QkJvc25IQVZt?=
 =?utf-8?B?NFZmL3ZUaVFickhKN2pIbGZsWkU5aVhvS3ZsYUpLTGV2ZlFScHVOQ3hJUEgy?=
 =?utf-8?B?czROL2dDbldRWEpLdDZuSWhRNUQ3SE1WbWx0OHlGd3l2SEcyR3I3aGZhZlRm?=
 =?utf-8?B?WFNudXhtWHN5TTc1YjlURm1EUzFaZUpRZW9obmtVK1BoaXAvd1luNmd4VjJz?=
 =?utf-8?B?UlVYT056L0xpTUFzTXBBbVZONkJ5T1NmTGhRK1NxSHR2b3gyR0ZuaE9Ba0kz?=
 =?utf-8?B?RnhTcnpPRmt3SUFCZVhyaWIvcElQWXdoc2s3UlJkN2FLclRrT2gxcWNkTmZR?=
 =?utf-8?B?TFBZclpMK2Q4RDZBUjFVMVdPNlBCUTlCMWJ2M0t5UWU3dG1TWG5vVHV6bEF3?=
 =?utf-8?B?VVpkYnB5VE0wdHl2bzREbTJNQll2QlhJcFdPb3lURUxWaXNMeU1OOEJCRzk4?=
 =?utf-8?B?QTFpVGNVNE8rdDZRR1ZvVmZQTThoMVZHTU1Nd0RqNGxZSVduWGw5STdTYnlH?=
 =?utf-8?B?TENGSTNydi9uT0xiaW80NjJBb1lUYWd1UU5KbmFGSS9xTjRGbDBnQ25mV0VJ?=
 =?utf-8?B?OGlqbVFZaVhsMkVES1hqU0hnbVdGM0FmS09OellPUzBWTkxZdmQxay81bmY0?=
 =?utf-8?B?TG9MVlhrWHpHSzlZSlY1dHI3SHU2K2dSeURmb200aytxeG13Ymc0OWpmcTlV?=
 =?utf-8?B?cE1sNWh6bStDSURqZVZ5Mzg1U1BYcTdiWUd6TjEzZjhxNUNUKzRNT3NOMG5E?=
 =?utf-8?B?eU1wMTNzVEtNdkNXTE81WlpPRlNHL3BOUFVDaFpGdkdnTlZORms2MWVFeDZh?=
 =?utf-8?B?dkVpWmhCQS9PTklDK0premV4VTlQZWliZnR4SzVaUnlIMWNuZ1VWOU5neW5F?=
 =?utf-8?B?QVRrSjhZenNNamhrOFBuZ01taEMvMzRpeFFwNUM0YkkxUmFlZWY5NXRrSzk5?=
 =?utf-8?B?NjdKQXM5N2J2aENad1lXRXJ1RnBpdldJZTBuMEEwVjBkYmJQN25LeURBPT0=?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?U3lGaTdhWm1GVm5wYUwyWm9FMXBBbVhiNDM1dW0wY0g4eDVDNVRUdVRNTXN1?=
 =?utf-8?B?ZkYwS0NaYmUzY2d4SU5GdHdwMVhOKzBnT09qdXNCS216ZnVoWGEwYTJQYXl0?=
 =?utf-8?B?WVcvOUdBSW1kdkZMWFZEODNZeTBKaWdGTEhFalhFNFkvbjhtWmZYamVNTXU3?=
 =?utf-8?B?Y1VORlc2N2FsTnh3NHN4aVhUUVYrcGpidW5UUU5MZE1pSkFCZ3dlS2F3ZXRU?=
 =?utf-8?B?c00zODBxUm1NWlppSjNGQzB2ejlubnhVb0NDR2xqOVlOOHRqL1AvWXBFRFVG?=
 =?utf-8?B?Q2VsY2RnckRUTmlVbWJkK000cFJFK0RvdnpWVjVoQnlSaFN3d0F1RXhnZFVK?=
 =?utf-8?B?TTZGYjNEU21DVTVkczFBaVR5SXM0RnJtQ1ZGWGpRWWxwak11UFpEQzRheVM2?=
 =?utf-8?B?QXR3Q1Y3RGt1ZWxWeVVYSjhHcUhRYnQ3bVBjNGFJN3doUXdDVjVveEFBcE8z?=
 =?utf-8?B?RjgxUzYrcHcveWM5QVorNExxZFdSWXljQm9Ud0JHU2JuUHByVVFIZEkwSEVy?=
 =?utf-8?B?bXQwaFpVekNDQnNScCtJNkhFR0hEcUNEcmRKZzBxYlZKdW9JaUt0dG1KRzNG?=
 =?utf-8?B?VzhJN2QvWklpcnlzeW5GT0gvZVNLNjA3Mm9HSmo0bi85RkduR3NQSGplMEhm?=
 =?utf-8?B?OWlmcTd3Ri9VZXhKM3U3UFhlTG5TYzVDU3ViaWpQSFdOOGZaaGxhMW16elNC?=
 =?utf-8?B?WXVVK2h4QkFqTXJQQzBSRjYwS0o4YTROWHlaQjdqYThSeUFYTUpDRzY0VVFU?=
 =?utf-8?B?YkhvaDU1ZVRTR2hHWDMyUnh3d0JNa3h3KzJETWdqVlFKaXFwNDN3ZkljeW03?=
 =?utf-8?B?Q3pBeUpZcHdIbGYwaTU3T3M4bW02bnd2SmxxYXo5OUdwOXZpVFA4cVJ0TkJy?=
 =?utf-8?B?cmwweGVIei9JbmlHV2k0dmMvY054ZEM1cWFYMG5jMnV3V1hjUGw0TDdwa3g2?=
 =?utf-8?B?ZUpreG83SS9SbURBL3g4ZHhsbnNyeUxWLzVtV0lVMXh1bldzK016cDZ4YlRx?=
 =?utf-8?B?RjNpUDBGWmd4cm52RDF6WmlZTVkwUnpuM0dudC96d0V5QXViR29xNDVLT1c0?=
 =?utf-8?B?UXhxTS83S2grQjZqSWhOaFVGQVd6Y0h3a3h1N2NMYmRmdklwejFndDZTSzl1?=
 =?utf-8?B?KzdleWRrOURvTk1ucENhNGVGd2hxekZWbDl3dzVYTUdHbkR2eXo0eVZYb0Nr?=
 =?utf-8?B?dlQ1UTEyN2RDT0xTaDl0TlEwR0ZmRjQwS2VkOEh2aWxHVUppMWFiMlVYbjVO?=
 =?utf-8?B?NXUyUG9ndnVqQjVUMjZYcmd6cFZZUkxEZXA1bW5Qb2VTdmVSYkNCK2o4Y1Fv?=
 =?utf-8?B?U1lKbmx0b0x4eUJyaXlvRUZUUlIraFFXMlAxL0lIOFNDcGthMGszTk5oUklp?=
 =?utf-8?B?eWdRZnRiYnBUZ3VDcHJJSUd0S1hJSDZhdUhMSUQ1a1h2Y1duOGtYQVA4eVgr?=
 =?utf-8?B?R0Jha1F4eWRrZVdXT3ozc24zQjA3WVpzZStudmVIWEZ4TURJTzZwbVBhTTY5?=
 =?utf-8?B?UDhkS2xSaUFFb3BZZjhUWkZ4V2t4ZE5LeVBuWTBGcjRUL1NMOWxDU0FVM1pS?=
 =?utf-8?B?bndrMWNjNW1HcEdEOHA1ZmtVSUF5WFFYQ3VKTzlyRHNnVnY3eDBkNFJuSmVJ?=
 =?utf-8?B?NGlyRmJsTlNpMjFDZGRNdjZWVktMeTBzdlhRWG1oUlI2eVJ0L0drRUQvdXhN?=
 =?utf-8?B?RXVqc1JzdkhqdFYyNkMzNDJRUGd5UlNOSExCeW8wcWVUcFVKd1RPOEZSQzlz?=
 =?utf-8?B?OTZFbHBDSHB1RnRyK3VnMldJd0tjdlNzZUQ3Y2g4aENTSmZSZk5zVWZFVFRL?=
 =?utf-8?B?ckdBTnpuaVdLM0kvUGJiZ1VGYW9pUlYwZnllYTVIZWtna1cvbVl6bWJPQkd5?=
 =?utf-8?B?b3FxWFRMUmo1dWU2Z3J2SVVnMFp6Tlo3Mjd4QW1jUS9uWXNKSmVNZDAycUZx?=
 =?utf-8?B?K3RNN0RDRjhSbkl1c0M0NlJCYWtIQ3JxZjUwcHRPeDlxMkh3N241RGlBQ1pl?=
 =?utf-8?B?Z2ZCRWtxSTBoSVBLNWt4WmpaN1RkSDU0RWhZbzVBWThxQk5FUXRxU0NMTVVn?=
 =?utf-8?B?N1BsUklnSEYzRVcvUzR4YzVrRlNjN1UwNUs0RHoxSjJrYWg5dm9YWS9odlMz?=
 =?utf-8?B?RERGSWpYdE1nblZFdCt1VFNDKzZGWCtxc2ozWVdJbmVxejkxUUxGditUekZB?=
 =?utf-8?B?THZDWHJXYTZlbk5ndDAreVoyaTZjQVNkSUlDY1NYdXEzU0hEaXk3T3lrUGUv?=
 =?utf-8?B?WXV2UXRCV1N3Z0ZLWHdmcXJHcDNnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <954A9B07B1335448B084A3016624FAC5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0888db-7676-4855-a240-08dc6e91f88b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 12:33:59.8384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4BYCpeP7wPqFfcC/p5y1aDz6iQS2EOAHnL4u+orOQrVYggU2lyvTDnP5ic/U5U8Gu6SrRg12LdI3pmtswyFDce12UFeiWx8+U/qY2mu9ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3299
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
Cc: Marco Elver <elver@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Potapenko <glider@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA0LzIwMjQgw6AgMTM6MDksIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiBX
aGVuIEtGRU5DRSBpcyBlbmFibGVkLCB0b3RhbCBzeXN0ZW0gbWVtb3J5IGlzIG1hcHBlZCBhdCBw
YWdlIGxldmVsDQo+IGdyYW51bGFyaXR5LiBCdXQgaW4gcmFkaXggTU1VIG1vZGUsIH4zR0IgYWRk
aXRpb25hbCBtZW1vcnkgaXMgbmVlZGVkDQo+IHRvIG1hcCAxMDBHQiBvZiBzeXN0ZW0gbWVtb3J5
IGF0IHBhZ2UgbGV2ZWwgZ3JhbnVsYXJpdHkgd2hlbiBjb21wYXJlZA0KPiB0byB1c2luZyAyTUIg
ZGlyZWN0IG1hcHBpbmcuIFRoaXMgaXMgbm90IGRlc2lyZWQgY29uc2lkZXJpbmcgS0ZFTkNFIGlz
DQo+IGRlc2lnbmVkIHRvIGJlIGVuYWJsZWQgaW4gcHJvZHVjdGlvbiBrZXJuZWxzIFsxXS4gQWxz
bywgbWFwcGluZyBtZW1vcnkNCj4gYWxsb2NhdGVkIGZvciBLRkVOQ0UgcG9vbCBhdCBwYWdlIGdy
YW51bGFyaXR5IHNlZW1zIHN1ZmZpY2llbnQgZW5vdWdoDQo+IHRvIGVuYWJsZSBLRkVOQ0Ugc3Vw
cG9ydC4gU28sIGFsbG9jYXRlIF9fa2ZlbmNlX3Bvb2wgZHVyaW5nIGJvb3R1cCBhbmQNCj4gbWFw
IGl0IGF0IHBhZ2UgZ3JhbnVsYXJpdHkgaW5zdGVhZCBvZiBtYXBwaW5nIGFsbCBzeXN0ZW0gbWVt
b3J5IGF0DQo+IHBhZ2UgZ3JhbnVsYXJpdHkuDQoNCg0KVGhhdCBzZWVtcyB0byBiZSBtb3JlIG9y
IGxlc3MgY29waWVkIGZyb20gQVJNNjQgPyBJcyB0aGF0IHRoZSBiZXN0IA0KYXBwcm9hY2ggPw0K
DQpDYW4ndCB5b3UgaW1wbGVtZW50IGFyY2hfa2ZlbmNlX2luaXRfcG9vbCgpIGluc3RlYWQgPw0K
DQpBbHNvLCBpdCBzZWVtcyB5b3VyIHBhdGNoIG9ubHkgYWRkcmVzc2VzIFBQQzY0LiBUaGUgc2Ft
ZSBzaG91bGQgYmUgZG9uZSANCmZvciBQUEMzMiBhbmQgdGhlcmUgYXJlIHByb2JhYmx5IHBhcnRz
IHRoYXQgc2hvdWxkIGJlIGNvbW1vbi4NCg0KPiANCj4gV2l0aG91dCBwYXRjaDoNCj4gICAgICAj
IGNhdCAvcHJvYy9tZW1pbmZvDQo+ICAgICAgTWVtVG90YWw6ICAgICAgIDEwMTIwMTkyMCBrQg0K
PiANCj4gV2l0aCBwYXRjaDoNCj4gICAgICAjIGNhdCAvcHJvYy9tZW1pbmZvDQo+ICAgICAgTWVt
VG90YWw6ICAgICAgIDEwNDQ4MzkwNCBrQg0KPiANCj4gQWxsIGtmZW5jZV90ZXN0LmMgdGVzdGNh
c2VzIHBhc3NlZCB3aXRoIHRoaXMgcGF0Y2guDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjAxMTAzMTc1ODQxLjM0OTU5NDctMi1lbHZlckBnb29nbGUuY29tLw0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSGFyaSBCYXRoaW5pIDxoYmF0aGluaUBsaW51eC5pYm0uY29tPg0K
PiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va2ZlbmNlLmggICAgICAgIHwgIDUg
KysrKw0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9wZ3RhYmxlLmMgfCAzNCAr
KysrKysrKysrKysrKysrKystLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vaW5pdF82NC5jICAg
ICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20va2ZlbmNlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va2ZlbmNl
LmgNCj4gaW5kZXggNDI0Y2VlZjgyYWU2Li4xOGVjMmIwNmJhMWUgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9rZmVuY2UuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20va2ZlbmNlLmgNCj4gQEAgLTgsNiArOCw3IEBADQo+ICAgI2lmbmRlZiBfX0FTTV9Q
T1dFUlBDX0tGRU5DRV9IDQo+ICAgI2RlZmluZSBfX0FTTV9QT1dFUlBDX0tGRU5DRV9IDQo+ICAg
DQo+ICsjaW5jbHVkZSA8bGludXgva2ZlbmNlLmg+DQoNCldoeSBkbyB5b3UgbmVlZCB0aGF0ID8g
SXQgY2FuJ3QgYmUgbmVlZGVkIGJ5IHRoZSBleHRlcm4gYm9vbCB5b3UgYXJlIA0KYWRkaW5nIGJl
bG93Lg0KDQpJZiBpdCBpcyBuZWVkZWQgYnkgc29tZSBDIGZpbGUgdGhhdCBpbmNsdWRlcyBhc20v
a2ZlbmNlLmgsIGl0IHNob3VsZCANCmluY2x1ZGUgbGludXgva2ZlbmNlLmggYnkgaXRzZWxmLCBz
ZWUgZm9yIGluc3RhbmNlIA0KbW0va2ZlbmNlL2tmZW5jZV90ZXN0LmMgYW5kIG1tL2tmZW5jZS9j
b3JlLmMNCg0KPiAgICNpbmNsdWRlIDxsaW51eC9tbS5oPg0KPiAgICNpbmNsdWRlIDxhc20vcGd0
YWJsZS5oPg0KPiAgIA0KPiBAQCAtMTUsNiArMTYsMTAgQEANCj4gICAjZGVmaW5lIEFSQ0hfRlVO
Q19QUkVGSVggIi4iDQo+ICAgI2VuZGlmDQo+ICAgDQo+ICsjaWZkZWYgQ09ORklHX0tGRU5DRQ0K
PiArZXh0ZXJuIGJvb2wga2ZlbmNlX2Vhcmx5X2luaXQ7DQo+ICsjZW5kaWYNCj4gKw0KPiAgIHN0
YXRpYyBpbmxpbmUgYm9vbCBhcmNoX2tmZW5jZV9pbml0X3Bvb2wodm9pZCkNCj4gICB7DQo+ICAg
CXJldHVybiB0cnVlOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3Jh
ZGl4X3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9wZ3RhYmxlLmMN
Cj4gaW5kZXggMTVlODhmMTQzOWVjLi5mY2NiZjkyZjI3OWIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9wZ3RhYmxlLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBj
L21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYw0KPiBAQCAtMzEsNiArMzEsNyBAQA0KPiAgICNp
bmNsdWRlIDxhc20vdWFjY2Vzcy5oPg0KPiAgICNpbmNsdWRlIDxhc20vdWx0cmF2aXNvci5oPg0K
PiAgICNpbmNsdWRlIDxhc20vc2V0X21lbW9yeS5oPg0KPiArI2luY2x1ZGUgPGFzbS9rZmVuY2Uu
aD4NCj4gICANCj4gICAjaW5jbHVkZSA8dHJhY2UvZXZlbnRzL3RocC5oPg0KPiAgIA0KPiBAQCAt
MjkxLDkgKzI5Miw4IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIG5leHRfYm91bmRhcnkodW5zaWdu
ZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCkNCj4gICAJcmV0dXJuIGVuZDsNCj4gICB9
DQo+ICAgDQo+IC1zdGF0aWMgaW50IF9fbWVtaW5pdCBjcmVhdGVfcGh5c2ljYWxfbWFwcGluZyh1
bnNpZ25lZCBsb25nIHN0YXJ0LA0KPiAtCQkJCQkgICAgIHVuc2lnbmVkIGxvbmcgZW5kLA0KPiAt
CQkJCQkgICAgIGludCBuaWQsIHBncHJvdF90IF9wcm90KQ0KPiArc3RhdGljIGludCBfX21lbWlu
aXQgY3JlYXRlX3BoeXNpY2FsX21hcHBpbmcodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQg
bG9uZyBlbmQsIGludCBuaWQsDQo+ICsJCQkJCSAgICAgcGdwcm90X3QgX3Byb3QsIHVuc2lnbmVk
IGxvbmcgbWFwcGluZ19zel9saW1pdCkNCj4gICB7DQo+ICAgCXVuc2lnbmVkIGxvbmcgdmFkZHIs
IGFkZHIsIG1hcHBpbmdfc2l6ZSA9IDA7DQo+ICAgCWJvb2wgcHJldl9leGVjLCBleGVjID0gZmFs
c2U7DQo+IEBAIC0zMDEsNyArMzAxLDEwIEBAIHN0YXRpYyBpbnQgX19tZW1pbml0IGNyZWF0ZV9w
aHlzaWNhbF9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgc3RhcnQsDQo+ICAgCWludCBwc2l6ZTsNCj4g
ICAJdW5zaWduZWQgbG9uZyBtYXhfbWFwcGluZ19zaXplID0gbWVtb3J5X2Jsb2NrX3NpemU7DQo+
ICAgDQo+IC0JaWYgKGRlYnVnX3BhZ2VhbGxvY19lbmFibGVkX29yX2tmZW5jZSgpKQ0KPiArCWlm
IChtYXBwaW5nX3N6X2xpbWl0IDwgbWF4X21hcHBpbmdfc2l6ZSkNCj4gKwkJbWF4X21hcHBpbmdf
c2l6ZSA9IG1hcHBpbmdfc3pfbGltaXQ7DQo+ICsNCj4gKwlpZiAoZGVidWdfcGFnZWFsbG9jX2Vu
YWJsZWQoKSkNCj4gICAJCW1heF9tYXBwaW5nX3NpemUgPSBQQUdFX1NJWkU7DQo+ICAgDQo+ICAg
CXN0YXJ0ID0gQUxJR04oc3RhcnQsIFBBR0VfU0laRSk7DQo+IEBAIC0zNTgsNiArMzYxLDcgQEAg
c3RhdGljIGludCBfX21lbWluaXQgY3JlYXRlX3BoeXNpY2FsX21hcHBpbmcodW5zaWduZWQgbG9u
ZyBzdGFydCwNCj4gICANCj4gICBzdGF0aWMgdm9pZCBfX2luaXQgcmFkaXhfaW5pdF9wZ3RhYmxl
KHZvaWQpDQo+ICAgew0KPiArCXBoeXNfYWRkcl90IGtmZW5jZV9wb29sIF9fbWF5YmVfdW51c2Vk
Ow0KDQpEb24ndCBkbyB0aGF0LiBBdm9pZCB1c2luZyBfX21heWJlX3VudXNlZC4NCg0KSW5zdGVh
ZCwgZGVjbGFyZSB0aGlzIHZhciB3aGVyZSBpdCBpcyB1c2VkLg0KDQo+ICAgCXVuc2lnbmVkIGxv
bmcgcnRzX2ZpZWxkOw0KPiAgIAlwaHlzX2FkZHJfdCBzdGFydCwgZW5kOw0KPiAgIAl1NjQgaTsN
Cj4gQEAgLTM2NSw2ICszNjksMTMgQEAgc3RhdGljIHZvaWQgX19pbml0IHJhZGl4X2luaXRfcGd0
YWJsZSh2b2lkKQ0KPiAgIAkvKiBXZSBkb24ndCBzdXBwb3J0IHNsYiBmb3IgcmFkaXggKi8NCj4g
ICAJc2xiX3NldF9zaXplKDApOw0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19LRkVOQ0UNCj4gKwlp
ZiAoa2ZlbmNlX2Vhcmx5X2luaXQpIHsNCg0KRGVjbGFyZSBrZmVuY2VfcG9vbCBoZXJlLg0KDQo+
ICsJCWtmZW5jZV9wb29sID0gbWVtYmxvY2tfcGh5c19hbGxvYyhLRkVOQ0VfUE9PTF9TSVpFLCBQ
QUdFX1NJWkUpOw0KPiArCQltZW1ibG9ja19tYXJrX25vbWFwKGtmZW5jZV9wb29sLCBLRkVOQ0Vf
UE9PTF9TSVpFKTsNCj4gKwl9DQo+ICsjZW5kaWYNCj4gKw0KPiAgIAkvKg0KPiAgIAkgKiBDcmVh
dGUgdGhlIGxpbmVhciBtYXBwaW5nDQo+ICAgCSAqLw0KPiBAQCAtMzgwLDEwICszOTEsMTggQEAg
c3RhdGljIHZvaWQgX19pbml0IHJhZGl4X2luaXRfcGd0YWJsZSh2b2lkKQ0KPiAgIAkJCWNvbnRp
bnVlOw0KPiAgIAkJfQ0KPiAgIA0KPiAtCQlXQVJOX09OKGNyZWF0ZV9waHlzaWNhbF9tYXBwaW5n
KHN0YXJ0LCBlbmQsDQo+IC0JCQkJCQktMSwgUEFHRV9LRVJORUwpKTsNCj4gKwkJV0FSTl9PTihj
cmVhdGVfcGh5c2ljYWxfbWFwcGluZyhzdGFydCwgZW5kLCAtMSwgUEFHRV9LRVJORUwsIH4wVUwp
KTsNCj4gICAJfQ0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19LRkVOQ0UNCj4gKwlpZiAoa2ZlbmNl
X2Vhcmx5X2luaXQpIHsNCj4gKwkJY3JlYXRlX3BoeXNpY2FsX21hcHBpbmcoa2ZlbmNlX3Bvb2ws
IGtmZW5jZV9wb29sICsgS0ZFTkNFX1BPT0xfU0laRSwgLTEsDQo+ICsJCQkJCVBBR0VfS0VSTkVM
LCBQQUdFX1NJWkUpOw0KPiArCQltZW1ibG9ja19jbGVhcl9ub21hcChrZmVuY2VfcG9vbCwgS0ZF
TkNFX1BPT0xfU0laRSk7DQo+ICsJCV9fa2ZlbmNlX3Bvb2wgPSBfX3ZhKGtmZW5jZV9wb29sKTsN
Cj4gKwl9DQo+ICsjZW5kaWYNCj4gKw0KPiAgIAlpZiAoIWNwdV9oYXNfZmVhdHVyZShDUFVfRlRS
X0hWTU9ERSkgJiYNCj4gICAJCQljcHVfaGFzX2ZlYXR1cmUoQ1BVX0ZUUl9QOV9SQURJWF9QUkVG
RVRDSF9CVUcpKSB7DQo+ICAgCQkvKg0KPiBAQCAtODc0LDggKzg5Myw3IEBAIGludCBfX21lbWlu
aXQgcmFkaXhfX2NyZWF0ZV9zZWN0aW9uX21hcHBpbmcodW5zaWduZWQgbG9uZyBzdGFydCwNCj4g
ICAJCXJldHVybiAtMTsNCj4gICAJfQ0KPiAgIA0KPiAtCXJldHVybiBjcmVhdGVfcGh5c2ljYWxf
bWFwcGluZyhfX3BhKHN0YXJ0KSwgX19wYShlbmQpLA0KPiAtCQkJCSAgICAgICBuaWQsIHByb3Qp
Ow0KPiArCXJldHVybiBjcmVhdGVfcGh5c2ljYWxfbWFwcGluZyhfX3BhKHN0YXJ0KSwgX19wYShl
bmQpLCBuaWQsIHByb3QsIH4wVUwpOw0KPiAgIH0NCj4gICANCj4gICBpbnQgX19tZW1pbml0IHJh
ZGl4X19yZW1vdmVfc2VjdGlvbl9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVk
IGxvbmcgZW5kKQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2luaXRfNjQuYyBiL2Fy
Y2gvcG93ZXJwYy9tbS9pbml0XzY0LmMNCj4gaW5kZXggZDk2YmJjMDAxZTczLi44MTU1YmZkNmMx
NmIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9pbml0XzY0LmMNCj4gKysrIGIvYXJj
aC9wb3dlcnBjL21tL2luaXRfNjQuYw0KPiBAQCAtNjQsNiArNjQsMjAgQEANCj4gICANCj4gICAj
aW5jbHVkZSA8bW0vbW11X2RlY2wuaD4NCj4gICANCj4gKyNpZmRlZiBDT05GSUdfS0ZFTkNFDQo+
ICtib29sIF9fcm9fYWZ0ZXJfaW5pdCBrZmVuY2VfZWFybHlfaW5pdCA9ICEhQ09ORklHX0tGRU5D
RV9TQU1QTEVfSU5URVJWQUw7DQo+ICsNCj4gK3N0YXRpYyBpbnQgX19pbml0IHBhcnNlX2tmZW5j
ZV9lYXJseV9pbml0KGNoYXIgKmFyZykNCj4gK3sNCj4gKwlpbnQgdmFsOw0KPiArDQo+ICsJaWYg
KGdldF9vcHRpb24oJmFyZywgJnZhbCkpDQo+ICsJCWtmZW5jZV9lYXJseV9pbml0ID0gISF2YWw7
DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICtlYXJseV9wYXJhbSgia2ZlbmNlLnNhbXBsZV9pbnRl
cnZhbCIsIHBhcnNlX2tmZW5jZV9lYXJseV9pbml0KTsNCj4gKyNlbmRpZg0KPiArDQo+ICAgI2lm
ZGVmIENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUA0KPiAgIC8qDQo+ICAgICogR2l2ZW4gYW4gYWRk
cmVzcyB3aXRoaW4gdGhlIHZtZW1tYXAsIGRldGVybWluZSB0aGUgcGFnZSB0aGF0DQo=
