Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D178627EB6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:50:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9q141tmvz3cd2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 23:50:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=YV67cYRo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9pzg3fDTz3cMM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 23:49:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=YV67cYRo;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4N9pzc0X8Nz4xtw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 23:49:32 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4N9pzc0T9Tz4xZq; Mon, 14 Nov 2022 23:49:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::612; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=YV67cYRo;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4N9pzb5rk7z4xZj;
	Mon, 14 Nov 2022 23:49:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1zcpv6JJebfWGHtkqR5oQ5Rkf6m5/rCDHgZPTV7ZBIyGJ9BIDjet07wohQjJQsoSwhZb4uloV2+NRrfHzZq0QEt4tCEXt2fytYJJWMy7DS9/k4troJ5PMdXO9FllsSsWfgqihDE4W9gcliU0qBLrp/InTidKWO8UOvMnCiH2NaW/ZQd+UumPuJiBjoSa1GLtOrSvQU7B5JUmvFkW+VRMd6fhMZaDYnfNfFnFq5SJrq8TghdqBpk8dHE4/Zj0cQGI/5bkZs71UhFxsFMFjZzHeWV4uKXKCpxQacJVxdIKkivXwr+ZkwY6+SgepQbbGFuHucmEGPx00wJybPhTTllDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg++l95zQguSxGDuuCOWooHb6inO76GMELf/ZebgGAM=;
 b=CDlXFFsBEkTSc54TekH6OyuLPsYg5vGl7aQ3lTMNC6J9OiOH9rRpfzaf2o/0r4YRZ9kocoKQMucU583M22kEtw2DWqtAV7c7FRw0T0GJTagl9YyBdgvtwuvijv60Tbs09VJyHEJcN0lst79len5Hq5ndyn9bZQTsuNIlD+B6/hC7AX+NjT1MxbwmEq8qUnooEcKb26vZf3cLZj60E1UN4nTnDzUEU4dlqEt0IK4qMvbmKFyDiD2M8Nrfypg4hUz3giDPczH3TAwRfc3+5poH5ph557xLPWqiDWcUIgmr7lrXYWY7wQ0YKXNFDRWFGhH7Z0MCWLgOFA9Zibs4crqoAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg++l95zQguSxGDuuCOWooHb6inO76GMELf/ZebgGAM=;
 b=YV67cYRoATbxpsY6Z/0FdMdWftARtiCyokzvd1gC5VjrcMiNFoJDGvMp+NiSX3hIn3rKfBazVx2YE75ugbNlieGGpnTqHk6kaupLMJMwiPnUlJymwGDooB+CL12wsRJd0O7NHMKLioguNWCNcdg1AbRzeu+Y8gRugywkF+tTPmW/XzoVyQY4p4o0FNEoYREfz90etMR5aK/crDcgi1BPtk9TEjvwc3S5u/1/2OCNxNIRg6O4moSBSurykCowDBOqPzMLKpzCfhL5QXgJUr2rMJbtOm/FjUaQLQHVtqMhy0WZ15QuIoVq+u+2GoMC36K1e3Rfp5eiNrx4czJbxBuaTw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2236.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:49:26 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 12:49:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Paul Mackerras <paulus@ozlabs.org>, "linuxppc-dev@ozlabs.org"
	<linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v2 6/6] Documentation/kasan: Update details of KASAN on
 powerpc
Thread-Topic: [PATCH v2 6/6] Documentation/kasan: Update details of KASAN on
 powerpc
Thread-Index: AQHYap+H2ebp6516BE6X7eaciN/10q4/ec4A
Date: Mon, 14 Nov 2022 12:49:26 +0000
Message-ID: <7d0cc2b6-c22e-b52a-1784-30b9e8713081@csgroup.eu>
References: <YoTEb2BaH3MDkH+2@cleo> <YoTFctxWJIkI9yGy@cleo>
In-Reply-To: <YoTFctxWJIkI9yGy@cleo>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2236:EE_
x-ms-office365-filtering-correlation-id: cd816e9c-4319-4fbe-b5ef-08dac63ea9eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +epv91C+F/xM8epwSacKIam7veSv0+vKeNOvbubaQKBTMC66w52j3tSDYK74qp494M3ylwhLLDI2Iw6xJ6jJ3BpSA55ga6GTUSNOWFu2M/9ug5n3S8j+rGyHbw3z4ctieWLLGoCVqyEk1+1XWYH56t4PFm7I11mn09haCnv99grQO5Z8k4hBHDmbiuG3yfRltZ0Dz0skC/f0tuuG17BAZULZmh/Hc20REKAo1tZFkcNXBEDOAiIcnq2k+QBoECf+8bNfpuaPRWwCe0Dx1DnUzhnLr19YY6IfCPx/vkoBhLWNckeGgSa9utlWxRBWnLAv8G+GOYPUAX02VIgordyhoUgp0MCqIznBHCmZ4MA8bRusMwpjWm+U6GzNo0MIx5JszPEjcVzGZ2OiJiHRBjRULNOGtvZE7RisOTe1FIzG3IpPSWVRoROeQnJ6nMkAmaBpVru7oNP7yiORGOCO1JOTIbu9OmbI4ePTEl9JTj4AE6MtZmv9j18jSZ5fFZ5olHOMVYM8PmpWqC6bjKAeRPzTK0tCYnil1V277Xvi1BpxoHlfR+x/VYuJR/R9SX+gXpN156or2utXEuDws+DGgcwqO49mhWSMZym33s8IC1GgIf+2q0P5DnUFL4NkH/HrnycctxOrxod1hQITK7LpmnQ9c7BNpDZzUXYHyrUz/XDE/5jq3ugJsH7ZjAVEV+yyG0jBjlczD7Rj2FdhM9F0C2R3jDQaYrcE2KE8VIe+IMsetLZ+o7n4/P99C2zLVBrhfDzYYJQWcC58y5EDC4UafSl+cjdx/1IrN9ZxLWF5p8SzEdYd06CVXN85JfbdOzLDRXdVeIUynIFuxywf9Dlc500VEGvrQt1qpLbCikt3XqdZjs1vOBcblY4aoDjrl4F/j8zh
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(346002)(39850400004)(451199015)(83380400001)(31686004)(66574015)(8936002)(186003)(5660300002)(2616005)(44832011)(41300700001)(38070700005)(122000001)(6486002)(6512007)(26005)(38100700002)(66556008)(66946007)(64756008)(66446008)(4326008)(478600001)(36756003)(76116006)(66476007)(71200400001)(316002)(8676002)(91956017)(110136005)(6506007)(2906002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YkFOWS9SOVZTVXZPSTRtcDlyUUx0S085R3JrOXhxanlMTDY5cmF2eXRHWlB2?=
 =?utf-8?B?K0hPemh1UHVUQkt3a3EzVTJaV29FamRTeU5BdG5HM0tyQWVPS0ZlN2dKSEc3?=
 =?utf-8?B?OXBhd1VzelZQVkdtM3Q1bHlLYS9RdzRKQ0ZuOXJoODI4VmF2WGhMREF4NFJx?=
 =?utf-8?B?alFCZW9UYit3Uk5FbWx5WjRiUzFNR0pUTC9hYUlob2g5ZGZQMjE5KzFlOXF1?=
 =?utf-8?B?WUVFUmU2dkFod25samczNDZ5U0xOdGR2S0RUSm56dEhHRkFxMWZQYnlNYU1D?=
 =?utf-8?B?UkJtb2pHMTVSV3VQZitIR05kVVV2TldVbU1DSFRtL3h5Y0Y3R0YrcmNtOTZ3?=
 =?utf-8?B?NWhkKzBtdS9zZnNhdEcyTU9lczBtV0RFeEloR3B6US9JamE5Kzd3QlVYVEg4?=
 =?utf-8?B?WXhSeHR0Z0Ewckt2ZFZLM2p0M09qckd4Z1ErL080VzI2MTFMeVo2WEFNYkdj?=
 =?utf-8?B?M3BpcDZmTy9Vb1doejJnMDkrczZKTGZmeExCSnJPYXZ1SjdjU2Vpcm5TMW91?=
 =?utf-8?B?UHErRHJ5NWYvTW96TkYreWdnWE40ZTRwV2psRlpHTTM2Q2ZiNGJLWW9oUlNC?=
 =?utf-8?B?VEt1blIrWlVXVnpubFhVT1dHZ29POG9kL0kyMlBXc1RBaW56WG5qZ05HNnMw?=
 =?utf-8?B?aWMzRFpRMmVxeEhhYXI4TnFOVlBIamlWTUlyVkYycys5SUtwWEs2bkM1S24v?=
 =?utf-8?B?U1NHb0dPZ3ZYQ0tXZ2NQNnBJdHZIUlFYZW9weXcxUk05ZUczeXp1aTJrWmtp?=
 =?utf-8?B?NFl5OWF5NEFYNHcyWVRLM2hwc2orS1RIV0JEMmRnMUdSaEVCRTRYRkdBL251?=
 =?utf-8?B?VFhieXh3V1lOdkJ5a3hSeWxSc1ljbVhYaXh1bC9rcGV6K2lTeFprc1p2T0NM?=
 =?utf-8?B?Q1lxNHQwRndSUVFYT0YwVDFMbHU4MXBycVhXT1pvUWkyQ05oUTJnUVo5SWpE?=
 =?utf-8?B?Ly9Kd1BHOXYxdXljck56V1dWOXpmMkVxOGttaExsdFBDRDViYUFPYzlDNmEv?=
 =?utf-8?B?Ny9FcGE1WnVKbUtwQWtaMmNjcXZtVEd5NXpMVmZsVHkrQW0wTy9uUUlCY1py?=
 =?utf-8?B?UDdObjNyTGEwL3hMRzVPbEo2TGljVTdzVXJET05aS1ZZQUNyVDI1Y1dTWGFO?=
 =?utf-8?B?SVNjMUxTTVZiSEVKajNTeXJ3YUdPVi96d2cwUjJoUUJVYmVrRm9vNE5HWmE4?=
 =?utf-8?B?MVBZb3pZc01TRFo5R24rcnpYWTlVbFRpZTJUUVFqeEQ5QTR5Z1l1NzhMQUNL?=
 =?utf-8?B?bVJzb1RiY1RwT1dIL0lRS2IwWjA0RUhmVmw5eVpwb3o5d2J2MHJjSEJkTUtw?=
 =?utf-8?B?RXZldy93c3RLSU1CWkdYc29OR1h6THR2MTQrOFRmME55b0JDMm9SakRxanhQ?=
 =?utf-8?B?V3JpcUhFU3ZSMTVUVlJnWG5TSVZrME5XdHE2ZFdaVWRFNXRNL3llRVZpaHMx?=
 =?utf-8?B?RGNmVlQxdC9RdCtnWHBFZldnQmVtZ1BhSTlFZkowZkRETlJ6aHhzaEhPOEZO?=
 =?utf-8?B?T2xvQWtoTEJ4cGt6WFkvbTI3bXptWTIxemNXVWE0bjVqVnBwQmdDKzc1VFZD?=
 =?utf-8?B?Tzh1Y09sRGw0WkJudFMzUFlzQTMrNzJNSEp5QkFGVUQrekxNWkI5SWxpL0tV?=
 =?utf-8?B?S1dibXlzQnhucXJ3NXA0TGVncWtTRjVxeDJOWmJYaUFFMUdZKzN0dWZmRWV5?=
 =?utf-8?B?VWd0OCtwMmw3UCtDanBCc1VmNUhJMFdGWlQ5QjFNTklCaDd5Nko4QjVGcnlq?=
 =?utf-8?B?Q2k4YzlteUFia0c2RzhqelQva0NJYkZlUzErOGdNOWVrbEt0UkVGZVpCTk1l?=
 =?utf-8?B?cGFkQ2lRbUJBeUN0MkNiNHBjOEhhSXViMFdac0l4WUFjd2d5MExPcVVHZzFt?=
 =?utf-8?B?Q1FtQmZBa1ZKNHUya0RaOSs0RFg4QVhmZ0xpK1hXK3gxeDBnU1Q4VGNEeEtV?=
 =?utf-8?B?SDJ0bGxmNzVIckhiQWxDSHc0OXRwRWlMK1lIelRhTzB4eVorcWx3eVFVQ1JI?=
 =?utf-8?B?N1B6TFFlQXo0KzNRZXBkNjdjNHQ3V2pDR1I4ZXNQNFBJWll5UHZ6Y3Iyb3Zr?=
 =?utf-8?B?bHV6bmlxeXByUFV3RHhIK0FyeXdtRG81RUtKVEJ2UWpENkRSY1NWZDByUFRw?=
 =?utf-8?B?Y1Y0TE1rRXFKVkNRYW83L29KZXBlbXNvejl4NHdtS0dpUjFUcVo2WDZaMG5O?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7ACB41FC10A13F4A8FA93ECA14392D70@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cd816e9c-4319-4fbe-b5ef-08dac63ea9eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 12:49:26.7259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DW/YFo/zlJt4UHTiXtt366w4wWewncOXSuK7AQAhF1oUtHBjq16D1Zhl1KivMrJQCt/DI3aNwl0fJrGLMiT0wqmksvl06crJjrmdR8quz2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2236
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA1LzIwMjIgw6AgMTI6MDcsIFBhdWwgTWFja2VycmFzIGEgw6ljcml0wqA6DQo+
IEZyb206IERhbmllbCBBeHRlbnMgPGRqYUBheHRlbnMubmV0Pg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUGF1bCBNYWNrZXJyYXMgPHBhdWx1c0BvemxhYnMub3JnPg0KDQpUaGlzIGNoYW5nZSBkb2Vz
bid0IGFwcGx5LCBjYW4geW91IHJlYmFzZSA/DQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQo+IC0t
LQ0KPiAgIERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2thc2FuLnJzdCB8IDcgKysrKysrLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9rYXNhbi5yc3QgYi9Eb2N1bWVudGF0
aW9uL2Rldi10b29scy9rYXNhbi5yc3QNCj4gaW5kZXggODA4OWM1NTlkMzM5Li40NDg5OTVjMTFi
ZWUgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2thc2FuLnJzdA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9rYXNhbi5yc3QNCj4gQEAgLTM2LDcgKzM2LDkg
QEAgQm90aCBzb2Z0d2FyZSBLQVNBTiBtb2RlcyB3b3JrIHdpdGggU0xVQiBhbmQgU0xBQiBtZW1v
cnkgYWxsb2NhdG9ycywNCj4gICB3aGlsZSB0aGUgaGFyZHdhcmUgdGFnLWJhc2VkIEtBU0FOIGN1
cnJlbnRseSBvbmx5IHN1cHBvcnRzIFNMVUIuDQo+ICAgDQo+ICAgQ3VycmVudGx5LCBnZW5lcmlj
IEtBU0FOIGlzIHN1cHBvcnRlZCBmb3IgdGhlIHg4Nl82NCwgYXJtLCBhcm02NCwgeHRlbnNhLCBz
MzkwLA0KPiAtYW5kIHJpc2N2IGFyY2hpdGVjdHVyZXMsIGFuZCB0YWctYmFzZWQgS0FTQU4gbW9k
ZXMgYXJlIHN1cHBvcnRlZCBvbmx5IGZvciBhcm02NC4NCj4gK2FuZCByaXNjdiBhcmNoaXRlY3R1
cmVzLiBJdCBpcyBhbHNvIHN1cHBvcnRlZCBvbiBwb3dlcnBjIGZvciAzMi1iaXQga2VybmVscyBh
bmQNCj4gK2ZvciA2NC1iaXQga2VybmVscyBydW5uaW5nIHVuZGVyIHRoZSBSYWRpeCBNTVUuIFRh
Zy1iYXNlZCBLQVNBTiBtb2RlcyBhcmUNCj4gK3N1cHBvcnRlZCBvbmx5IGZvciBhcm02NC4NCj4g
ICANCj4gICBVc2FnZQ0KPiAgIC0tLS0tDQo+IEBAIC0zNTEsNiArMzUzLDkgQEAgV2l0aCBgYENP
TkZJR19LQVNBTl9WTUFMTE9DYGAsIEtBU0FOIGNhbiBjb3ZlciB2bWFsbG9jIHNwYWNlIGF0IHRo
ZQ0KPiAgIGNvc3Qgb2YgZ3JlYXRlciBtZW1vcnkgdXNhZ2UuIEN1cnJlbnRseSwgdGhpcyBpcyBz
dXBwb3J0ZWQgb24geDg2LA0KPiAgIHJpc2N2LCBzMzkwLCBhbmQgcG93ZXJwYy4NCj4gICANCj4g
K0l0IGlzIG9wdGlvbmFsLCBleGNlcHQgb24gNjQtYml0IHBvd2VycGMga2VybmVscywgYW5kIG9u
IDMyLWJpdA0KPiArcG93ZXJwYyBrZXJuZWxzIHdpdGggbW9kdWxlIHN1cHBvcnQsIHdoZXJlIGl0
IGlzIHJlcXVpcmVkLg0KPiArDQo+ICAgVGhpcyB3b3JrcyBieSBob29raW5nIGludG8gdm1hbGxv
YyBhbmQgdm1hcCBhbmQgZHluYW1pY2FsbHkNCj4gICBhbGxvY2F0aW5nIHJlYWwgc2hhZG93IG1l
bW9yeSB0byBiYWNrIHRoZSBtYXBwaW5ncy4NCj4gICANCg==
