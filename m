Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504554C232
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:51:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNGDM34W6z3c1r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 16:51:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Xrgrncge;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Xrgrncge;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNGCB3cJHz3ch3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 16:50:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2UelEh9ezB3yyvkGWE8pk6QKSUp0tTsA/EO7WExQywRktfTEqxj/B1Juifemngh0vo1qZDN98eoNJnGrfnstyLKSTHQMhx2yK3iO+9J5V05aWviU8piAWjjuQ7++1X4HiwuBnjzZKQ2MNkESSEaLUZcKJ4AxgE07CNxDtpQ9D7ZHv0EB78MXbghYLhKXEmbxxVxUaxt4OPqm6BfRX/zRbyi27Pk95Zd6WqzIalQcJF/I40eFLgjrp350Flh7D/aMHrSyRmeqcMBFfXztrMbRt6qWvmqoIwzRupOoxJbdmuCogUS1bNHGq1cCK2oMFuFVtKQYdWPKK+oINhrQt4h5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1oHbjEXVC4CnzpaMPWSNOPasYiEM/tjlArrEg1TM1I=;
 b=NJjL0E4YvvHLvJOZx/NbYi0PaI8z6JMwMRkgOZDOU/FGZFlSPn75aOEm13r6yM+u7DtEvCGzQoRDzEXj2XFKmeoHsOzj0Fjml9IqaK312QPqE4XfoYxRCX6Ird4xzoLk0TFTv1TS4QBmZy10NIXGcufoMlEeRLv9drhrf89PUT6kUGurQOQSWFg3Dz9oH+tTTzNh0oR+4S4IPA3O7q5cHXR5q302N3tRR5PAdMwrLtlFpf4r5fdT3wKl/KryzRiWtVNqASrTU3Zu3nJAnX/NjOVmp2tg0XqBZdK5aHp0nwAuQpeuzfMgQ1UJ4kW+2edej8Oxe7XTJmMNFAenGGLZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1oHbjEXVC4CnzpaMPWSNOPasYiEM/tjlArrEg1TM1I=;
 b=Xrgrncgeblst8qtzqq+/GFBOAFkRhNwr6ZLOJkJXXV2oqTAJ9/bFYjp/cgQGO4XOQeThllaoOLb3Ush5nPqW5YjFWv1OYxnDAPfFydoXZfdTYohD3lz5m2Qz/+8X5xQ1xlU8KyrKRat8RwWccr4YfhxcHBWCfTgmhFupN6hg7I4dElNXTwzbr3CBhIzBKZSw0iOdjFX9tG8bCHjkCxxlyvs6XIcp0ECtjjCvLgynSoyhk9kkysrXLoEBR4+Mk7WFbTqoZ+aZ01FpSRYpJqqBusxIwjFNlFEfBQGifvL6uvjphinkUSdbt0e35Jso+RTEx9TVWzsDc6B+64w3T9VGVQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2957.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 15 Jun
 2022 06:49:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 06:49:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Wang Wenhu <wenhu.wang@hotmail.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"hao.wu@intel.com" <hao.wu@intel.com>, "trix@redhat.com" <trix@redhat.com>,
	"mdf@kernel.org" <mdf@kernel.org>, "yilun.xu@intel.com" <yilun.xu@intel.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "linux-fpga@vger.kernel.org"
	<linux-fpga@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCHv2 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Thread-Topic: [PATCHv2 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Thread-Index: AQHYgH0Fgton8jz2zUOUJB5+ZqL8Jq1QB0IA
Date: Wed, 15 Jun 2022 06:49:55 +0000
Message-ID: <8dc7a035-d8b1-f6f8-51ea-cc468ec49b46@csgroup.eu>
References: <YqHy1uXwCLlJmftr@kroah.com>
 <20220615055735.53585-1-wenhu.wang@hotmail.com>
 <SG2PR01MB29513533A1EA32DCB00D10309FAD9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
In-Reply-To:  <SG2PR01MB29513533A1EA32DCB00D10309FAD9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f69fc4d-b90d-45c6-a3ee-08da4e9b41f0
x-ms-traffictypediagnostic: PAZP264MB2957:EE_
x-microsoft-antispam-prvs:  <PAZP264MB29574B93E4890E9209961375EDAD9@PAZP264MB2957.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9PVuIGsoiVr9MIJHdG8EVq9d36O/TdrZMqaEgbyd6GHzvaaTzhKgF0+NV/LFCWcqVRrFdVBuOk5Z66XMf7tKupDQJkY6pLRggEcDhTdcLOzxFzbmEu4vvNQOu8xhuwdB9wLmmVe7NPc+23RC/kG+QXPbM/2gBdly1I8W+8aoQAbvILGaac5tGaMU/PQQppyCadoQKCJzToIJSxkQCWGcoVuesUI+rX7Wu056Ps/RLi8pRoU46QXqphERWQGOVJM97gcGtYypMP6/alFXO0QvHyq+ukYhPvMHa27kFMj5fwD2JcTfdUS5GAA61K+7CsNd1oBf2tSWlceJR2geTzHvUTlluSjGXTJxeLJLfMqCnR3pke7q44B/bvLgPBVc/n4QEGrraaIvLrSkQ5sfcgY3nneX0ocoj/zpn7+SAYQCCwYXjrU15sbKTYC6EEJ9/+jGL1uk0vrKN5uWhdfZPQLBVctQam4AVAoXNVF3l0QMqAyd8mUDTKAiOJBijO2wwKyRi1SnfMjGl5UGRKOJcXPyg5HIyQgNkuTZVOC+jav9FobmXwzY1YgVf+oK37iTqttpkxtDUb9HW6ypQeOCKAQA2RCSf81En2KbTHWExT6jZmTfkeP8Q9Y0ghrE1XSwDVOA7QxFVcGKNYplyZFMFnTugh0Q2wEBsGlpP+LOJK8+EddsvpIfW9COOO23DZKF/8bKgnx8YxZY5MFjw0+bfzm+WSTHYVi3CC7b2zccU/HSI4tGIEpUeg1jq9DlEXtZH4dnbi+q636CdAeEhzY4abxszmo6GZFOvOoorKGeQy6ViTUhExRwyOcwciU/tpcN6wq+URB5D/WI4DWeMd+x8RW838UgHZYJyicBgWk1GEDx42C64uiHIFhVlE0xbwFejE9m
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(2906002)(86362001)(122000001)(921005)(966005)(6506007)(31686004)(6486002)(38070700005)(316002)(508600001)(83380400001)(66556008)(186003)(91956017)(31696002)(2616005)(76116006)(71200400001)(66946007)(66476007)(4326008)(44832011)(6512007)(64756008)(7416002)(38100700002)(30864003)(5660300002)(8936002)(36756003)(66446008)(66574015)(8676002)(110136005)(26005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WEV5eEVnZk91cVhLUE5kZDhXeEJEbkpmQlp1bVczbnYwRUJMZlovY003dHlm?=
 =?utf-8?B?SlFaNHN6VnZEdlYwckMrL0tTaFg3aElBWFRIVHIrSnZPSkNqenFDUk5mc1ZN?=
 =?utf-8?B?WlpmSUpHYzNac3JkRGY2TUROM0FvOTl3TG5iOTZ2WGlDbGRpMC9EMkhOdm5h?=
 =?utf-8?B?bkxzRHZKVlQ0dDROcG1va2VwZDlXWDZQR1htUlNxUGQ2TW02cysrNkZEUGFl?=
 =?utf-8?B?Z1dZVm0xenpHSTBRdHdZK1J1c0l6MWtpVG1KbXpIeG5UR1VtaFI1RUdqOEQr?=
 =?utf-8?B?allpYmJBSzdjZnFoK2lRcEJ1aXozSUhZbTRVWDIwV2l1Wk82V1R6dytrbFZK?=
 =?utf-8?B?ek9nMTEyTTZVZDlmak1rSUlHV0EzcWxVbHl1QVJyWFIvRFdOTVkwRjk5ekhs?=
 =?utf-8?B?R2xlaVh1R1ZOTFlxcWVHcGFId2FkK1UyaHI0R3Iza3diVitYdHczZWx3SWs2?=
 =?utf-8?B?SE1rVlF1VjlJb2UzeHZqQ21OK0FSNzEzaWl5bW4vVHA5WnRxU3NnSnhrdTQy?=
 =?utf-8?B?TW5kZTU4QURVQ1A5MmJnUnlhZjB4bDRFUmNoeU9EOWpFcE52WTFFZ1FNOTNk?=
 =?utf-8?B?c0dNMHVnTHVUdlYxNTAwbkhlZy9BUnh2Q2llait5VTZRazEvRk0vdHd6bWp5?=
 =?utf-8?B?Z0hmTmJHbHhMRCtxd1hiZjJUck1LK3I1ZXhhZzBYakRhazh4WmtnVTRsTGlY?=
 =?utf-8?B?U21qbUxyd3JRMjhvdk1zeUNleFBuT2RCeEJhcVVYeVZ3alFFV0xWUTlMTSt5?=
 =?utf-8?B?VmFndmNQaXJxN0dUcGY3OEVJNEh1NEhCVW50cTd4U0JqbGkxczdCS3hoTG5r?=
 =?utf-8?B?dXZWOGlPZlpRUFFtVGJIOUJYN0pUUzhkWUlCUjVkVVNXc2FXZTJsU2NGV3Jx?=
 =?utf-8?B?SE5KODBBY0JuWWxSMFdGTXpCczZoMmhVRG43UGFtK1YzblVRSkNxSFk2bWRF?=
 =?utf-8?B?L1NLeHlkMFMrNDRNQ0tWVVdwVGtNV3EzcUg1QXBvbkRPRWlpcjM0eEZnVjhH?=
 =?utf-8?B?NDRWSitITytsLzZrUzlzWWF1L0xoNmRLVHNwUWYrbGF4MmtDdUNTUENCd3J6?=
 =?utf-8?B?OGJtVWJKRXVGT1JVRWJHaXNZZGZ1OG1nNjRTMHVBNG5GNFVPRHFuRWNCeXRL?=
 =?utf-8?B?SHBsZW11eXovd08xUVRHTm5NbERORVhnQi9ZVmxtd0k3TjVYbDY1MGlJdXMx?=
 =?utf-8?B?dUlDNnNGcGlDVnZHQTRlSXJHYmFrT1BtS0JMV0RWdHdUTDJXVGpFeldLLytw?=
 =?utf-8?B?bFoyUW52aWwwV3NQTEZrdzNEUTd6dWxrc092eGUyblVmUnhuRVhGU3hLVDIw?=
 =?utf-8?B?M09sb050V2d1bmVtcmRma1Q4QTMwdGJzdHB5ZGhzQk1ycWdtdHhVbnIzWHk2?=
 =?utf-8?B?YStuL1lWTm1zMjBQUWcrZEs1OXgzT095UDZ3cnJLYmViN0hXOGdQRHNqZmxl?=
 =?utf-8?B?REQ2eElsTG9vMUNoYW8xMDF3T0ZRSWY5VzFWd3hjeXNkUVdxRmtObFpuWGI3?=
 =?utf-8?B?YTY3OXJsT1BPWDJ5d1Nqem5CZVpZK1A4NkUrVU85aERnNmVWNkhhdnFpVFlx?=
 =?utf-8?B?aUdwaktwekhzUlRMc0ZMdDdvc0tUS3JPTWRWK1YwaUdYRTdyWXVOVW9aSFli?=
 =?utf-8?B?cWQ4a21oQXVxSnVqbFdweE5DckNxekNnYVg4ZU9GVjJ5OWZVSjFTdFpyZWIx?=
 =?utf-8?B?VWdscVJ2Z3FnSmNNUGNYaEpNVlh4RFJmTlFuZ2VvQXBiaG1QbzlEdVZrWWda?=
 =?utf-8?B?MnNiSDNVU2lWd2RNWXNVbDFtUERJWC9saWRQNFYraGZIdy9iMy82Z3ZlcW8r?=
 =?utf-8?B?R3U0R1hqbG9LVnV1ZWFpRWJnYTAraUZUOVcxcS8vQlpEY2hzN0ZGMGpEUGwv?=
 =?utf-8?B?Q0xOSmpUVmprSHZYMkZhL1h2YkRVWFB5OWRyUEZCV1o0cjFwV3ZvY2NRc1Jr?=
 =?utf-8?B?TGl3ZExOU0hpeVJobG9uZ0dBTjFRemltbkhxUCtHZlpwcjV4NXZhcCtlRUZx?=
 =?utf-8?B?b2gxajBEeFB3QXd2TjNMQWo3V1RLN05WZU5QUi9Zc1ZUQmR0YkVtZFJkMnJI?=
 =?utf-8?B?RmlFOVVLKzVrRVd3cEhRWUg5OWJqSGhJL1piZjR6SnJwYWpCNEtxNjRLYW9k?=
 =?utf-8?B?VUVYSFdEZ3djQU1LUEsxUEcyK0xlS29hcVgwSThOZ1k2TkY5Z0VQdkdwOUlz?=
 =?utf-8?B?YkRUSUxFRWtCcGI3Y2Iyb1dsa01Lam0xZmxMYmtja3VGKzFZcmQ3eGF0R2sx?=
 =?utf-8?B?d3lVSHdtQ3U5OUNVUGRTbDRHN01ObjRLMGNwRGIxUXMyaWtJVFlrQ3V6SEk4?=
 =?utf-8?B?V0dvRWJCa2gySDEwemU1UUdvcHlmSk92UHlCNUw2SFV1N28xTzJQWE1GTERK?=
 =?utf-8?Q?2OKvCTxvsltjKkqB9RFt/irD1IW+83UabiSE4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5B4C3D4F5AA3742B343FF51C304F8B6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f69fc4d-b90d-45c6-a3ee-08da4e9b41f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 06:49:55.9377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G4IKGQg9est9nNu40RHancReFkgx4T5nwGQLUqnmyDB3TyyqfPIbkrKHhA4HgDQbTriicwzJvIl5jS/Xzh7kI5mar50m8bA3qSpwATEO90Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2957
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

DQoNCkxlIDE1LzA2LzIwMjIgw6AgMDc6NTcsIFdhbmcgV2VuaHUgYSDDqWNyaXTCoDoNCj4gRnJl
ZXNjYWxlIG1wYzg1eHggbDItY2FjaGUgY291bGQgYmUgb3B0aW9uYWxseSBjb25maWd1cmVkIGFz
IFNSQU0gcGFydGx5DQo+IG9yIGZ1bGx5LiBVc2VycyBjYW4gbWFrZSB1c2Ugb2YgaXQgYXMgYSBi
bG9jayBvZiBpbmRlcGVuZGVudCBtZW1vcnkgdGhhdA0KPiBvZmZlcnMgc3BlY2lhbCB1c2FnZSwg
c3VjaCBhcyBmb3IgZGVidWdpbmcgb3Igb3RoZXIgY3JpdGljYWwgc3RhdHVzIGluZm8NCj4gc3Rv
cmFnZSwgd2hpY2gga2VlcHMgY29uc2lzdGVudGx5IGV2ZW4gd2hlbiB0aGUgd2hvbGUgc3lzdGVt
IGNyYXNoZWQuDQo+IEFwcGxpY2F0aW9ucyBjYW4gbWFrZSB1c2Ugb2YgVUlPIGRyaXZlciB0byBh
Y2Nlc3MgdGhlIFNSQU0gZnJvbSB1c2VyIGxldmVsLg0KPiANCj4gT25jZSB0aGVyZSB3YXMgYW5v
dGhlciBkcml2ZXIgdmVyc2lvbiBmb3IgdGhlIGwyLWNhY2hlLXNyYW0gZm9yIFNSQU0gYWNjZXNz
DQo+IGluIGtlcm5lbCBzcGFjZS4gSXQgaGFkIGJlZW4gcmVtb3ZlZCByZWNlbnRseS4NCj4gU2Vl
OiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wb3dlcnBj
L2xpbnV4LmdpdC9jb21taXQvP2lkPWRjMjFlZDJhZWY0MTUwZmMyZmNmNTgyMjdhNGZmMjQ1MDIw
MTVjMDMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgV2VuaHUgPHdlbmh1LndhbmdAaG90bWFp
bC5jb20+DQo+IC0tLQ0KPiB2MjoNCj4gICAtIFVzZSBfX2JlMzIgaW5zdGVhZCBvZiB1MzIgZm9y
IGJpZy1lbmRpYW4gZGF0YSBkZWNsYXJhdGlvbnM7DQoNCkkgZ2V0IHRoZSBmb2xsb3dpbmcgd2Fy
bmluZ3Mgd2hpY2ggJ21ha2UgDQpkcml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5v
IEM9MicNCg0KICAgQ0hFQ0sgICBkcml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5j
DQpkcml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5jOjk2OjE5OiB3YXJuaW5nOiBp
bmNvcnJlY3QgdHlwZSBpbiANCmFyZ3VtZW50IDEgKGRpZmZlcmVudCBiYXNlIHR5cGVzKQ0KZHJp
dmVycy91aW8vdWlvX2ZzbF84NXh4X2NhY2hlX3NyYW0uYzo5NjoxOTogICAgZXhwZWN0ZWQgdW5z
aWduZWQgaW50IA0Kdm9sYXRpbGUgW25vZGVyZWZdIFt1c2VydHlwZV0gX19pb21lbSAqYWRkcg0K
ZHJpdmVycy91aW8vdWlvX2ZzbF84NXh4X2NhY2hlX3NyYW0uYzo5NjoxOTogICAgZ290IHJlc3Ry
aWN0ZWQgX19iZTMyIA0KW25vZGVyZWZdIF9faW9tZW0gKg0KZHJpdmVycy91aW8vdWlvX2ZzbF84
NXh4X2NhY2hlX3NyYW0uYzoxMDA6Mjc6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIA0KYXJn
dW1lbnQgMSAoZGlmZmVyZW50IGJhc2UgdHlwZXMpDQpkcml2ZXJzL3Vpby91aW9fZnNsXzg1eHhf
Y2FjaGVfc3JhbS5jOjEwMDoyNzogICAgZXhwZWN0ZWQgdW5zaWduZWQgaW50IA0Kdm9sYXRpbGUg
W25vZGVyZWZdIFt1c2VydHlwZV0gX19pb21lbSAqYWRkcg0KZHJpdmVycy91aW8vdWlvX2ZzbF84
NXh4X2NhY2hlX3NyYW0uYzoxMDA6Mjc6ICAgIGdvdCByZXN0cmljdGVkIF9fYmUzMiANCltub2Rl
cmVmXSBfX2lvbWVtICoNCmRyaXZlcnMvdWlvL3Vpb19mc2xfODV4eF9jYWNoZV9zcmFtLmM6MTAy
Ojk6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIA0KYXJndW1lbnQgMSAoZGlmZmVyZW50IGJh
c2UgdHlwZXMpDQpkcml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5jOjEwMjo5OiAg
ICBleHBlY3RlZCB1bnNpZ25lZCBpbnQgDQp2b2xhdGlsZSBbbm9kZXJlZl0gW3VzZXJ0eXBlXSBf
X2lvbWVtICphZGRyDQpkcml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5jOjEwMjo5
OiAgICBnb3QgcmVzdHJpY3RlZCBfX2JlMzIgDQpbbm9kZXJlZl0gX19pb21lbSAqDQpkcml2ZXJz
L3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5jOjEwMjo5OiB3YXJuaW5nOiBpbmNvcnJlY3Qg
dHlwZSBpbiANCmFyZ3VtZW50IDEgKGRpZmZlcmVudCBiYXNlIHR5cGVzKQ0KZHJpdmVycy91aW8v
dWlvX2ZzbF84NXh4X2NhY2hlX3NyYW0uYzoxMDI6OTogICAgZXhwZWN0ZWQgdW5zaWduZWQgaW50
IA0KY29uc3Qgdm9sYXRpbGUgW25vZGVyZWZdIFt1c2VydHlwZV0gX19pb21lbSAqYWRkcg0KZHJp
dmVycy91aW8vdWlvX2ZzbF84NXh4X2NhY2hlX3NyYW0uYzoxMDI6OTogICAgZ290IHJlc3RyaWN0
ZWQgX19iZTMyIA0KW25vZGVyZWZdIF9faW9tZW0gKg0KZHJpdmVycy91aW8vdWlvX2ZzbF84NXh4
X2NhY2hlX3NyYW0uYzoxMDY6MTc6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIA0KYXJndW1l
bnQgMSAoZGlmZmVyZW50IGJhc2UgdHlwZXMpDQpkcml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2Fj
aGVfc3JhbS5jOjEwNjoxNzogICAgZXhwZWN0ZWQgdW5zaWduZWQgaW50IA0Kdm9sYXRpbGUgW25v
ZGVyZWZdIFt1c2VydHlwZV0gX19pb21lbSAqYWRkcg0KZHJpdmVycy91aW8vdWlvX2ZzbF84NXh4
X2NhY2hlX3NyYW0uYzoxMDY6MTc6ICAgIGdvdCByZXN0cmljdGVkIF9fYmUzMiANCltub2RlcmVm
XSBfX2lvbWVtICoNCmRyaXZlcnMvdWlvL3Vpb19mc2xfODV4eF9jYWNoZV9zcmFtLmM6MTA2OjE3
OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiANCmFyZ3VtZW50IDEgKGRpZmZlcmVudCBiYXNl
IHR5cGVzKQ0KZHJpdmVycy91aW8vdWlvX2ZzbF84NXh4X2NhY2hlX3NyYW0uYzoxMDY6MTc6ICAg
IGV4cGVjdGVkIHVuc2lnbmVkIGludCANCmNvbnN0IHZvbGF0aWxlIFtub2RlcmVmXSBbdXNlcnR5
cGVdIF9faW9tZW0gKmFkZHINCmRyaXZlcnMvdWlvL3Vpb19mc2xfODV4eF9jYWNoZV9zcmFtLmM6
MTA2OjE3OiAgICBnb3QgcmVzdHJpY3RlZCBfX2JlMzIgDQpbbm9kZXJlZl0gX19pb21lbSAqDQpk
cml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5jOjExMDoxNzogd2FybmluZzogaW5j
b3JyZWN0IHR5cGUgaW4gDQphcmd1bWVudCAxIChkaWZmZXJlbnQgYmFzZSB0eXBlcykNCmRyaXZl
cnMvdWlvL3Vpb19mc2xfODV4eF9jYWNoZV9zcmFtLmM6MTEwOjE3OiAgICBleHBlY3RlZCB1bnNp
Z25lZCBpbnQgDQp2b2xhdGlsZSBbbm9kZXJlZl0gW3VzZXJ0eXBlXSBfX2lvbWVtICphZGRyDQpk
cml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5jOjExMDoxNzogICAgZ290IHJlc3Ry
aWN0ZWQgX19iZTMyIA0KW25vZGVyZWZdIF9faW9tZW0gKg0KZHJpdmVycy91aW8vdWlvX2ZzbF84
NXh4X2NhY2hlX3NyYW0uYzoxMTA6MTc6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIA0KYXJn
dW1lbnQgMSAoZGlmZmVyZW50IGJhc2UgdHlwZXMpDQpkcml2ZXJzL3Vpby91aW9fZnNsXzg1eHhf
Y2FjaGVfc3JhbS5jOjExMDoxNzogICAgZXhwZWN0ZWQgdW5zaWduZWQgaW50IA0KY29uc3Qgdm9s
YXRpbGUgW25vZGVyZWZdIFt1c2VydHlwZV0gX19pb21lbSAqYWRkcg0KZHJpdmVycy91aW8vdWlv
X2ZzbF84NXh4X2NhY2hlX3NyYW0uYzoxMTA6MTc6ICAgIGdvdCByZXN0cmljdGVkIF9fYmUzMiAN
Cltub2RlcmVmXSBfX2lvbWVtICoNCmRyaXZlcnMvdWlvL3Vpb19mc2xfODV4eF9jYWNoZV9zcmFt
LmM6MTE0OjE3OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiANCmFyZ3VtZW50IDEgKGRpZmZl
cmVudCBiYXNlIHR5cGVzKQ0KZHJpdmVycy91aW8vdWlvX2ZzbF84NXh4X2NhY2hlX3NyYW0uYzox
MTQ6MTc6ICAgIGV4cGVjdGVkIHVuc2lnbmVkIGludCANCnZvbGF0aWxlIFtub2RlcmVmXSBbdXNl
cnR5cGVdIF9faW9tZW0gKmFkZHINCmRyaXZlcnMvdWlvL3Vpb19mc2xfODV4eF9jYWNoZV9zcmFt
LmM6MTE0OjE3OiAgICBnb3QgcmVzdHJpY3RlZCBfX2JlMzIgDQpbbm9kZXJlZl0gX19pb21lbSAq
DQpkcml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5jOjExNDoxNzogd2FybmluZzog
aW5jb3JyZWN0IHR5cGUgaW4gDQphcmd1bWVudCAxIChkaWZmZXJlbnQgYmFzZSB0eXBlcykNCmRy
aXZlcnMvdWlvL3Vpb19mc2xfODV4eF9jYWNoZV9zcmFtLmM6MTE0OjE3OiAgICBleHBlY3RlZCB1
bnNpZ25lZCBpbnQgDQpjb25zdCB2b2xhdGlsZSBbbm9kZXJlZl0gW3VzZXJ0eXBlXSBfX2lvbWVt
ICphZGRyDQpkcml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5jOjExNDoxNzogICAg
Z290IHJlc3RyaWN0ZWQgX19iZTMyIA0KW25vZGVyZWZdIF9faW9tZW0gKg0KZHJpdmVycy91aW8v
dWlvX2ZzbF84NXh4X2NhY2hlX3NyYW0uYzoxMTk6MTc6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBl
IGluIA0KYXJndW1lbnQgMSAoZGlmZmVyZW50IGJhc2UgdHlwZXMpDQpkcml2ZXJzL3Vpby91aW9f
ZnNsXzg1eHhfY2FjaGVfc3JhbS5jOjExOToxNzogICAgZXhwZWN0ZWQgdW5zaWduZWQgaW50IA0K
dm9sYXRpbGUgW25vZGVyZWZdIFt1c2VydHlwZV0gX19pb21lbSAqYWRkcg0KZHJpdmVycy91aW8v
dWlvX2ZzbF84NXh4X2NhY2hlX3NyYW0uYzoxMTk6MTc6ICAgIGdvdCByZXN0cmljdGVkIF9fYmUz
MiANCltub2RlcmVmXSBfX2lvbWVtICoNCmRyaXZlcnMvdWlvL3Vpb19mc2xfODV4eF9jYWNoZV9z
cmFtLmM6MTE5OjE3OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiANCmFyZ3VtZW50IDEgKGRp
ZmZlcmVudCBiYXNlIHR5cGVzKQ0KZHJpdmVycy91aW8vdWlvX2ZzbF84NXh4X2NhY2hlX3NyYW0u
YzoxMTk6MTc6ICAgIGV4cGVjdGVkIHVuc2lnbmVkIGludCANCmNvbnN0IHZvbGF0aWxlIFtub2Rl
cmVmXSBbdXNlcnR5cGVdIF9faW9tZW0gKmFkZHINCmRyaXZlcnMvdWlvL3Vpb19mc2xfODV4eF9j
YWNoZV9zcmFtLmM6MTE5OjE3OiAgICBnb3QgcmVzdHJpY3RlZCBfX2JlMzIgDQpbbm9kZXJlZl0g
X19pb21lbSAqDQoNCg0KPiAgIC0gVXNlIGdlbmVyaWMgaW9yZW1hcF9jYWNoZSBpbnN0ZWFkIG9m
IGlvcmVtYXBfY29oZXJlbnQ7DQo+ICAgLSBQaHlzaWNhbCBhZGRyZXNzIHN1cHBvcnQgYm90aCAz
MiBhbmQgNjQgYml0czsNCj4gICAtIEFkZHJlc3NlZCBzb21lIG90aGVyIGNvbW1lbnRzIGZyb20g
R3JlZy4NCj4gLS0tDQo+ICAgZHJpdmVycy91aW8vS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8
ICAxNCArKw0KPiAgIGRyaXZlcnMvdWlvL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgIDEg
Kw0KPiAgIGRyaXZlcnMvdWlvL3Vpb19mc2xfODV4eF9jYWNoZV9zcmFtLmMgfCAyODggKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDMwMyBpbnNlcnRpb25z
KCspDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdWlvL3Vpb19mc2xfODV4eF9jYWNo
ZV9zcmFtLmMNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vpby9LY29uZmlnIGIvZHJpdmVy
cy91aW8vS2NvbmZpZw0KPiBpbmRleCAyZTE2YzUzMzhlNWIuLmY3NjA0NTg0YTEyYyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy91aW8vS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL3Vpby9LY29uZmln
DQo+IEBAIC0xMDUsNiArMTA1LDIwIEBAIGNvbmZpZyBVSU9fTkVUWA0KPiAgIAkgIFRvIGNvbXBp
bGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU7IHRoZSBtb2R1bGUNCj4g
ICAJICB3aWxsIGJlIGNhbGxlZCB1aW9fbmV0eC4NCj4gICANCj4gK2NvbmZpZyBVSU9fRlNMXzg1
WFhfQ0FDSEVfU1JBTQ0KPiArCXRyaXN0YXRlICJGcmVlc2NhbGUgODV4eCBMMi1DYWNoZS1TUkFN
IFVJTyBkcml2ZXIiDQo+ICsJZGVwZW5kcyBvbiBGU0xfU09DX0JPT0tFICYmIFBQQzMyDQo+ICsJ
aGVscA0KPiArCSAgRHJpdmVyIGZvciB1c2VyIGxldmVsIGFjY2VzcyBvZiBmcmVlc2NhbGUgbXBj
ODV4eCBsMi1jYWNoZS1zcmFtLg0KPiArDQo+ICsJICBGcmVlc2NhbGUncyBtcGM4NXh4IHByb3Zp
ZGVzIGFuIG9wdGlvbiBvZiBjb25maWd1cmluZyBhIHBhcnQgb2YNCj4gKwkgIChvciBmdWxsKSBj
YWNoZSBtZW1vcnkgYXMgU1JBTS4gVGhlIGRyaXZlciBkb2VzIHRoaXMgY29uZmlndXJpbmcNCj4g
KwkgIHdvcmsgYW5kIGV4cG9ydHMgU1JBTSB0byB1c2VyLXNwYWNlIGZvciBhY2Nlc3MgZm9ybSB1
c2VyIGxldmVsLg0KPiArCSAgVGhpcyBpcyBleHRyZW1lbHkgaGVscGZ1bCBmb3IgdXNlciBhcHBs
aWNhdGlvbnMgdGhhdCByZXF1aXJlDQo+ICsJICBoaWdoIHBlcmZvcm1hbmNlIG1lbW9yeSBhY2Nl
c3Nlcy4NCj4gKw0KPiArCSAgSWYgeW91IGRvbid0IGtub3cgd2hhdCB0byBkbyBoZXJlLCBzYXkg
Ti4NCj4gKw0KPiAgIGNvbmZpZyBVSU9fRlNMX0VMQkNfR1BDTQ0KPiAgIAl0cmlzdGF0ZSAiZUxC
Qy9HUENNIGRyaXZlciINCj4gICAJZGVwZW5kcyBvbiBGU0xfTEJDDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3Vpby9NYWtlZmlsZSBiL2RyaXZlcnMvdWlvL01ha2VmaWxlDQo+IGluZGV4IGYyZjQx
NmExNDIyOC4uMWJhMDdkOTJhMWIxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Vpby9NYWtlZmls
ZQ0KPiArKysgYi9kcml2ZXJzL3Vpby9NYWtlZmlsZQ0KPiBAQCAtMTIsMyArMTIsNCBAQCBvYmot
JChDT05GSUdfVUlPX01GNjI0KSAgICAgICAgICs9IHVpb19tZjYyNC5vDQo+ICAgb2JqLSQoQ09O
RklHX1VJT19GU0xfRUxCQ19HUENNKQkrPSB1aW9fZnNsX2VsYmNfZ3BjbS5vDQo+ICAgb2JqLSQo
Q09ORklHX1VJT19IVl9HRU5FUklDKQkrPSB1aW9faHZfZ2VuZXJpYy5vDQo+ICAgb2JqLSQoQ09O
RklHX1VJT19ERkwpCSs9IHVpb19kZmwubw0KPiArb2JqLSQoQ09ORklHX1VJT19GU0xfODVYWF9D
QUNIRV9TUkFNKQkrPSB1aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5vDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3Vpby91aW9fZnNsXzg1eHhfY2FjaGVfc3JhbS5jIGIvZHJpdmVycy91aW8vdWlvX2Zz
bF84NXh4X2NhY2hlX3NyYW0uYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjZmOTFiMGFhOTQ2Yg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMv
dWlvL3Vpb19mc2xfODV4eF9jYWNoZV9zcmFtLmMNCj4gQEAgLTAsMCArMSwyODggQEANCj4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsvKg0KPiArICogQ29weXJpZ2h0
IChDKSAyMDIyIFdhbmcgV2VuaHUgPHdlbmh1LndhbmdAaG90bWFpbC5jb20+DQo+ICsgKiBBbGwg
cmlnaHRzIHJlc2VydmVkLg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC91aW9fZHJpdmVyLmg+DQo+ICsjaW5jbHVk
ZSA8bGludXgvc3RyaW5naWZ5Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICsj
aW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5o
Pg0KPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ICsNCj4gKyNkZWZpbmUgRFJJVkVSX05BTUUJ
InVpb19tcGM4NXh4X2NhY2hlX3NyYW0iDQo+ICsjZGVmaW5lIFVJT19JTkZPX1ZFUgkiMC4wLjEi
DQo+ICsjZGVmaW5lIFVJT19OQU1FCSJ1aW9fY2FjaGVfc3JhbSINCj4gKw0KPiArI2RlZmluZSBM
MkNSX0wyRkkJCTB4NDAwMDAwMDAJLyogTDIgZmxhc2ggaW52YWxpZGF0ZSAqLw0KPiArI2RlZmlu
ZSBMMkNSX0wySU8JCTB4MDAyMDAwMDAJLyogTDIgaW5zdHJ1Y3Rpb24gb25seSAqLw0KPiArI2Rl
ZmluZSBMMkNSX1NSQU1fWkVSTwkJMHgwMDAwMDAwMAkvKiBMMlNSQU0gemVybyBzaXplICovDQo+
ICsjZGVmaW5lIEwyQ1JfU1JBTV9GVUxMCQkweDAwMDEwMDAwCS8qIEwyU1JBTSBmdWxsIHNpemUg
Ki8NCj4gKyNkZWZpbmUgTDJDUl9TUkFNX0hBTEYJCTB4MDAwMjAwMDAJLyogTDJTUkFNIGhhbGYg
c2l6ZSAqLw0KPiArI2RlZmluZSBMMkNSX1NSQU1fVFdPX0hBTEZTCTB4MDAwMzAwMDAJLyogTDJT
UkFNIHR3byBoYWxmIHNpemVzICovDQo+ICsjZGVmaW5lIEwyQ1JfU1JBTV9RVUFSVAkJMHgwMDA0
MDAwMAkvKiBMMlNSQU0gb25lIHF1YXJ0ZXIgc2l6ZSAqLw0KPiArI2RlZmluZSBMMkNSX1NSQU1f
VFdPX1FVQVJUUwkweDAwMDUwMDAwCS8qIEwyU1JBTSB0d28gcXVhcnRlciBzaXplICovDQo+ICsj
ZGVmaW5lIEwyQ1JfU1JBTV9FSUdIVEgJMHgwMDA2MDAwMAkvKiBMMlNSQU0gb25lIGVpZ2h0aCBz
aXplICovDQo+ICsjZGVmaW5lIEwyQ1JfU1JBTV9UV09fRUlHSFRICTB4MDAwNzAwMDAJLyogTDJT
UkFNIHR3byBlaWdodGggc2l6ZSAqLw0KPiArDQo+ICsjZGVmaW5lIEwyU1JBTV9PUFRJTUFMX1Na
X1NISUZUCTB4MDAwMDAwMDMJLyogT3B0aW11bSBzaXplIGZvciBMMlNSQU0gKi8NCj4gKw0KPiAr
I2RlZmluZSBMMlNSQU1fQkFSX01TS19MTzE4CTB4RkZGRkMwMDAJLyogTG93ZXIgMTggYml0cyAq
Lw0KPiArI2RlZmluZSBMMlNSQU1fQkFSRV9NU0tfSEk0CTB4MDAwMDAwMEYJLyogVXBwZXIgNCBi
aXRzICovDQo+ICsNCj4gK2VudW0gY2FjaGVfc3JhbV9sb2NrX3dheXMgew0KPiArCUxPQ0tfV0FZ
U19aRVJPCQk9IDAsDQo+ICsJTE9DS19XQVlTX0VJR0hUSAk9IDEsDQo+ICsJTE9DS19XQVlTX1RX
T19FSUdIVEgJPSAyLA0KPiArCUxPQ0tfV0FZU19IQUxGCQk9IDQsDQo+ICsJTE9DS19XQVlTX0ZV
TEwJCT0gOCwNCj4gK307DQo+ICsNCj4gK3N0cnVjdCBtcGM4NXh4X2wyY3RsciB7DQo+ICsJX19i
ZTMyCWN0bDsJCS8qIDB4MDAwIC0gTDIgY29udHJvbCAqLw0KPiArCXU4CXJlczFbMHhDXTsNCj4g
KwlfX2JlMzIJZXdhcjA7CQkvKiAweDAxMCAtIEV4dGVybmFsIHdyaXRlIGFkZHJlc3MgMCAqLw0K
PiArCV9fYmUzMglld2FyZWEwOwkvKiAweDAxNCAtIEV4dGVybmFsIHdyaXRlIGFkZHJlc3MgZXh0
ZW5kZWQgMCAqLw0KPiArCV9fYmUzMglld2NyMDsJCS8qIDB4MDE4IC0gRXh0ZXJuYWwgd3JpdGUg
Y3RybCAqLw0KPiArCXU4CXJlczJbNF07DQo+ICsJX19iZTMyCWV3YXIxOwkJLyogMHgwMjAgLSBF
eHRlcm5hbCB3cml0ZSBhZGRyZXNzIDEgKi8NCj4gKwlfX2JlMzIJZXdhcmVhMTsJLyogMHgwMjQg
LSBFeHRlcm5hbCB3cml0ZSBhZGRyZXNzIGV4dGVuZGVkIDEgKi8NCj4gKwlfX2JlMzIJZXdjcjE7
CQkvKiAweDAyOCAtIEV4dGVybmFsIHdyaXRlIGN0cmwgMSAqLw0KPiArCXU4CXJlczNbNF07DQo+
ICsJX19iZTMyCWV3YXIyOwkJLyogMHgwMzAgLSBFeHRlcm5hbCB3cml0ZSBhZGRyZXNzIDIgKi8N
Cj4gKwlfX2JlMzIJZXdhcmVhMjsJLyogMHgwMzQgLSBFeHRlcm5hbCB3cml0ZSBhZGRyZXNzIGV4
dGVuZGVkIDIgKi8NCj4gKwlfX2JlMzIJZXdjcjI7CQkvKiAweDAzOCAtIEV4dGVybmFsIHdyaXRl
IGN0cmwgMiAqLw0KPiArCXU4CXJlczRbNF07DQo+ICsJX19iZTMyCWV3YXIzOwkJLyogMHgwNDAg
LSBFeHRlcm5hbCB3cml0ZSBhZGRyZXNzIDMgKi8NCj4gKwlfX2JlMzIJZXdhcmVhMzsJLyogMHgw
NDQgLSBFeHRlcm5hbCB3cml0ZSBhZGRyZXNzIGV4dGVuZGVkIDMgKi8NCj4gKwlfX2JlMzIJZXdj
cjM7CQkvKiAweDA0OCAtIEV4dGVybmFsIHdyaXRlIGN0cmwgMyAqLw0KPiArCXU4CXJlczVbMHhC
NF07DQo+ICsJX19iZTMyCXNyYmFyMDsJCS8qIDB4MTAwIC0gU1JBTSBiYXNlIGFkZHJlc3MgMCAq
Lw0KPiArCV9fYmUzMglzcmJhcmVhMDsJLyogMHgxMDQgLSBTUkFNIGJhc2UgYWRkciByZWcgZXh0
IGFkZHJlc3MgMCAqLw0KPiArCV9fYmUzMglzcmJhcjE7CQkvKiAweDEwOCAtIFNSQU0gYmFzZSBh
ZGRyZXNzIDEgKi8NCj4gKwlfX2JlMzIJc3JiYXJlYTE7CS8qIDB4MTBDIC0gU1JBTSBiYXNlIGFk
ZHIgcmVnIGV4dCBhZGRyZXNzIDEgKi8NCj4gKwl1OAlyZXM2WzB4Q0YwXTsNCj4gKwlfX2JlMzIJ
ZXJyaW5qaGk7CS8qIDB4RTAwIC0gRXJyb3IgaW5qZWN0aW9uIG1hc2sgaGlnaCAqLw0KPiArCV9f
YmUzMgllcnJpbmpsbzsJLyogMHhFMDQgLSBFcnJvciBpbmplY3Rpb24gbWFzayBsb3cgKi8NCj4g
KwlfX2JlMzIJZXJyaW5qY3RsOwkvKiAweEUwOCAtIEVycm9yIGluamVjdGlvbiB0YWcvZWNjIGNv
bnRyb2wgKi8NCj4gKwl1OAlyZXM3WzB4MTRdOw0KPiArCV9fYmUzMgljYXB0ZGF0YWhpOwkvKiAw
eEUyMCAtIEVycm9yIGRhdGEgaGlnaCBjYXB0dXJlICovDQo+ICsJX19iZTMyCWNhcHRkYXRhbG87
CS8qIDB4RTI0IC0gRXJyb3IgZGF0YSBsb3cgY2FwdHVyZSAqLw0KPiArCV9fYmUzMgljYXB0ZWNj
OwkvKiAweEUyOCAtIEVycm9yIHN5bmRyb21lICovDQo+ICsJdTgJcmVzOFsweDE0XTsNCj4gKwlf
X2JlMzIJZXJyZGV0OwkJLyogMHhFNDAgLSBFcnJvciBkZXRlY3QgKi8NCj4gKwlfX2JlMzIJZXJy
ZGlzOwkJLyogMHhFNDQgLSBFcnJvciBkaXNhYmxlICovDQo+ICsJX19iZTMyCWVycmludGVuOwkv
KiAweEU0OCAtIEVycm9yIGludGVycnVwdCBlbmFibGUgKi8NCj4gKwlfX2JlMzIJZXJyYXR0cjsJ
LyogMHhFNGMgLSBFcnJvciBhdHRyaWJ1dGUgY2FwdHVyZSAqLw0KPiArCV9fYmUzMgllcnJhZHJy
bDsJLyogMHhFNTAgLSBFcnJvciBhZGRyZXNzIGNhcHR1cmUgbG93ICovDQo+ICsJX19iZTMyCWVy
cmFkcnJoOwkvKiAweEU1NCAtIEVycm9yIGFkZHJlc3MgY2FwdHVyZSBoaWdoICovDQo+ICsJX19i
ZTMyCWVycmN0bDsJCS8qIDB4RTU4IC0gRXJyb3IgY29udHJvbCAqLw0KPiArCXU4CXJlczlbMHgx
QTRdOw0KPiArfTsNCj4gKw0KPiArc3RhdGljIGludCB1aW9fY2FjaGVfc3JhbV9zZXR1cChzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KPiArCQkJCXBoeXNfYWRkcl90IGJhc2UsIHU4IHdh
eXMpDQo+ICt7DQo+ICsJc3RydWN0IG1wYzg1eHhfbDJjdGxyIF9faW9tZW0gKmwyY3RsciA9IG9m
X2lvbWFwKHBkZXYtPmRldi5vZl9ub2RlLCAwKTsNCj4gKw0KPiArCWlmICghbDJjdGxyKSB7DQo+
ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgImNhbiBub3QgbWFwIGwyIGNvbnRyb2xsZXJcbiIpOw0K
PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwkvKiB3cml0ZSBiaXRzWzAtMTdd
IHRvIHNyYmFyMCAqLw0KPiArCW91dF9iZTMyKCZsMmN0bHItPnNyYmFyMCwgbG93ZXJfMzJfYml0
cyhiYXNlKSAmIEwyU1JBTV9CQVJfTVNLX0xPMTgpOw0KPiArDQo+ICsJLyogd3JpdGUgYml0c1sx
OC0yMV0gdG8gc3JiYXJlMCAqLw0KPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19QSFlTXzY0QklU
KSkNCj4gKwkJb3V0X2JlMzIoJmwyY3Rsci0+c3JiYXJlYTAsIHVwcGVyXzMyX2JpdHMoYmFzZSkg
JiBMMlNSQU1fQkFSRV9NU0tfSEk0KTsNCj4gKw0KPiArCWNscnNldGJpdHNfYmUzMigmbDJjdGxy
LT5jdGwsIEwyQ1JfTDJFLCBMMkNSX0wyRkkpOw0KPiArDQo+ICsJc3dpdGNoICh3YXlzKSB7DQo+
ICsJY2FzZSBMT0NLX1dBWVNfRUlHSFRIOg0KPiArCQlzZXRiaXRzMzIoJmwyY3Rsci0+Y3RsLCBM
MkNSX0wyRSB8IEwyQ1JfTDJGSSB8IEwyQ1JfU1JBTV9FSUdIVEgpOw0KPiArCQlicmVhazsNCj4g
Kw0KPiArCWNhc2UgTE9DS19XQVlTX1RXT19FSUdIVEg6DQo+ICsJCXNldGJpdHMzMigmbDJjdGxy
LT5jdGwsIEwyQ1JfTDJFIHwgTDJDUl9MMkZJIHwgTDJDUl9TUkFNX1FVQVJUKTsNCj4gKwkJYnJl
YWs7DQo+ICsNCj4gKwljYXNlIExPQ0tfV0FZU19IQUxGOg0KPiArCQlzZXRiaXRzMzIoJmwyY3Rs
ci0+Y3RsLCBMMkNSX0wyRSB8IEwyQ1JfTDJGSSB8IEwyQ1JfU1JBTV9IQUxGKTsNCj4gKwkJYnJl
YWs7DQo+ICsNCj4gKwljYXNlIExPQ0tfV0FZU19GVUxMOg0KPiArCWRlZmF1bHQ6DQo+ICsJCXNl
dGJpdHMzMigmbDJjdGxyLT5jdGwsIEwyQ1JfTDJFIHwgTDJDUl9MMkZJIHwgTDJDUl9TUkFNX0ZV
TEwpOw0KPiArCQlicmVhazsNCj4gKwl9DQo+ICsJZWllaW8oKTsNCj4gKw0KPiArCXJldHVybiAw
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0
IHVpb19jYWNoZV9zcmFtX3ZtX29wcyA9IHsNCj4gKwkuYWNjZXNzID0gZ2VuZXJpY19hY2Nlc3Nf
cGh5cywNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBpbnQgdWlvX2NhY2hlX3NyYW1fbW1hcChzdHJ1
Y3QgdWlvX2luZm8gKmluZm8sDQo+ICsJCQkgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEpDQo+ICt7DQo+ICsJc3RydWN0IHVpb19tZW0gKm1lbSA9IGluZm8tPm1lbTsNCj4gKw0KPiAr
CWlmIChtZW0tPmFkZHIgJiB+UEFHRV9NQVNLKQ0KPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gKw0K
PiArCWlmICgodm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0ID4gbWVtLT5zaXplKSB8fA0KPiAr
CSAgICAobWVtLT5zaXplID09IDApIHx8DQo+ICsJICAgIChtZW0tPm1lbXR5cGUgIT0gVUlPX01F
TV9QSFlTKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwl2bWEtPnZtX29wcyA9ICZ1
aW9fY2FjaGVfc3JhbV92bV9vcHM7DQo+ICsJdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3RfY2Fj
aGVkKHZtYS0+dm1fcGFnZV9wcm90KTsNCj4gKw0KPiArCXJldHVybiByZW1hcF9wZm5fcmFuZ2Uo
dm1hLA0KPiArCQkJICAgICAgIHZtYS0+dm1fc3RhcnQsDQo+ICsJCQkgICAgICAgbWVtLT5hZGRy
ID4+IFBBR0VfU0hJRlQsDQo+ICsJCQkgICAgICAgdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0
LA0KPiArCQkJICAgICAgIHZtYS0+dm1fcGFnZV9wcm90KTsNCj4gK30NCj4gKw0KPiArc3RhdGlj
IGludCB1aW9fY2FjaGVfc3JhbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiArew0KPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOw0K
PiArCXN0cnVjdCB1aW9faW5mbyAqaW5mbzsNCj4gKwlzdHJ1Y3QgdWlvX21lbSAqdWlvbWVtOw0K
PiArCWNvbnN0IGNoYXIgKmR0X25hbWU7DQo+ICsJdTMyIG1lbV9iYXNlXzMyOw0KPiArCXU2NCBt
ZW1fYmFzZV82NDsNCj4gKwlwaHlzX2FkZHJfdCBtZW1fYmFzZTsNCj4gKwl1MzIgbDJjYWNoZV9z
aXplOw0KPiArCXUzMiBtZW1fc2l6ZTsNCj4gKwl1MzIgcmVtOw0KPiArCXU4IHdheXM7DQo+ICsJ
aW50IHJldDsNCj4gKw0KPiArCS8qIGFsbG9jIHVpb19pbmZvIGZvciBvbmUgZGV2aWNlICovDQo+
ICsJaW5mbyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmluZm8pLCBHRlBfS0VS
TkVMKTsNCj4gKwlpZiAoIWluZm8pDQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiArDQo+ICsJLyog
Z2V0IG9wdGlvbmFsIHVpbyBuYW1lICovDQo+ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5n
KG5vZGUsICJ1aW9fbmFtZSIsICZkdF9uYW1lKSkNCj4gKwkJZHRfbmFtZSA9IFVJT19OQU1FOw0K
PiArDQo+ICsJaW5mby0+bmFtZSA9IGRldm1fa3N0cmR1cCgmcGRldi0+ZGV2LCBkdF9uYW1lLCBH
RlBfS0VSTkVMKTsNCj4gKwlpZiAoIWluZm8tPm5hbWUpDQo+ICsJCXJldHVybiAtRU5PTUVNOw0K
PiArDQo+ICsJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImNhY2hlLW1lbS1zaXpl
IiwgJm1lbV9zaXplKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwg
Im1pc3NpbmcgY2FjaGUtbWVtLXNpemVcbiIpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9
DQo+ICsNCj4gKw0KPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19QSFlTXzY0QklUKSkgew0KPiAr
CQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3U2NChub2RlLCAiY2FjaGUtbWVtLWJhc2UiLCAmbWVt
X2Jhc2VfNjQpOw0KPiArCQltZW1fYmFzZSA9IG1lbV9iYXNlXzY0Ow0KPiArCX0gZWxzZSB7DQo+
ICsJCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJjYWNoZS1tZW0tYmFzZSIsICZt
ZW1fYmFzZV8zMik7DQo+ICsJCW1lbV9iYXNlID0gbWVtX2Jhc2VfMzI7DQo+ICsJfQ0KPiArDQo+
ICsJaWYgKHJldCkgew0KPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJtaXNzaW5nIGNhY2hlLW1l
bS1iYXNlXG4iKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKG1l
bV9zaXplID09IDApIHsNCj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiY2FjaGUtbWVtLXNpemUg
c2hvdWxkIG5vdCBiZSAwXG4iKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+
ICsJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImNhY2hlLXNpemUiLCAmbDJjYWNo
ZV9zaXplKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgIm1pc3Np
bmcgbDJjYWNoZS1zaXplXG4iKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+
ICsJcmVtID0gbDJjYWNoZV9zaXplICUgbWVtX3NpemU7DQo+ICsJd2F5cyA9IExPQ0tfV0FZU19G
VUxMICogbWVtX3NpemUgLyBsMmNhY2hlX3NpemU7DQo+ICsJaWYgKHJlbSB8fCAod2F5cyAmICh3
YXlzIC0gMSkpKSB7DQo+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgImlsbGVnYWwgY2FjaGUtc3Jh
bS1zaXplIHBhcmFtZXRlclxuIik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0K
PiArCXJldCA9IHVpb19jYWNoZV9zcmFtX3NldHVwKHBkZXYsIG1lbV9iYXNlLCB3YXlzKTsNCj4g
KwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJaWYgKCFyZXF1ZXN0X21lbV9y
ZWdpb24obWVtX2Jhc2UsIG1lbV9zaXplLCAiZnNsXzg1eHhfY2FjaGVfc3JhbSIpKSB7DQo+ICsJ
CWRldl9lcnIoJnBkZXYtPmRldiwgInVpb19jYWNoZV9zcmFtIHJlcXVlc3QgbWVtb3J5IGZhaWxl
ZFxuIik7DQo+ICsJCXJldCA9IC1FTlhJTzsNCj4gKwl9DQo+ICsNCj4gKwlpbmZvLT5pcnEgPSBV
SU9fSVJRX05PTkU7DQo+ICsJaW5mby0+dmVyc2lvbiA9IFVJT19JTkZPX1ZFUjsNCj4gKwlpbmZv
LT5tbWFwID0gdWlvX2NhY2hlX3NyYW1fbW1hcDsNCj4gKwl1aW9tZW0gPSBpbmZvLT5tZW07DQo+
ICsJdWlvbWVtLT5tZW10eXBlID0gVUlPX01FTV9QSFlTOw0KPiArCXVpb21lbS0+YWRkciA9IG1l
bV9iYXNlOw0KPiArCXVpb21lbS0+c2l6ZSA9IG1lbV9zaXplOw0KPiArCXVpb21lbS0+bmFtZSA9
IGRldm1fa3N0cmR1cCgmcGRldi0+ZGV2LCBub2RlLT5uYW1lLCBHRlBfS0VSTkVMKTsNCj4gKwl1
aW9tZW0tPmludGVybmFsX2FkZHIgPSBpb3JlbWFwX2NhY2hlKG1lbV9iYXNlLCBtZW1fc2l6ZSk7
DQo+ICsJaWYgKCF1aW9tZW0tPmludGVybmFsX2FkZHIpIHsNCj4gKwkJZGV2X2VycigmcGRldi0+
ZGV2LCAiY2FjaGUgaW9yZW1hcCBmYWlsZWRcbiIpOw0KPiArCQlyZXQgPSAtRU5PTUVNOw0KPiAr
CX0NCj4gKw0KPiArCS8qIHJlZ2lzdGVyIHVpbyBkZXZpY2UgKi8NCj4gKwlpZiAodWlvX3JlZ2lz
dGVyX2RldmljZSgmcGRldi0+ZGV2LCBpbmZvKSkgew0KPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJlcnJvciB1aW8sY2FjaGUtc3JhbSByZWdpc3RyYXRpb24gZmFpbGVkXG4iKTsNCj4gKwkJcmV0
ID0gLUVOT0RFVjsNCj4gKwkJZ290byBlcnJfb3V0Ow0KPiArCX0NCj4gKw0KPiArCXBsYXRmb3Jt
X3NldF9kcnZkYXRhKHBkZXYsIGluZm8pOw0KPiArCXJldHVybiAwOw0KPiArDQo+ICtlcnJfb3V0
Og0KPiArCWlvdW5tYXAoaW5mby0+bWVtWzBdLmludGVybmFsX2FkZHIpOw0KPiArCXJldHVybiBy
ZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgdWlvX2NhY2hlX3NyYW1fcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICt7DQo+ICsJc3RydWN0IHVpb19pbmZvICppbmZv
ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICsNCj4gKwl1aW9fdW5yZWdpc3Rlcl9k
ZXZpY2UoaW5mbyk7DQo+ICsJaW91bm1hcChpbmZvLT5tZW1bMF0uaW50ZXJuYWxfYWRkcik7DQo+
ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgdWlvX2NhY2hlX3NyYW1fb2ZfbWF0Y2hbXSA9IHsNCj4gKwl7IC5jb21wYXRpYmxl
ID0gImZzbCxwMjAyMC1sMi1jYWNoZS1zcmFtLXVpbyIsIH0sDQo+ICsJe30NCj4gK307DQo+ICtN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCB1aW9fY2FjaGVfc3JhbV9vZl9tYXRjaCk7DQo+ICsNCj4g
K3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHVpb19mc2xfODV4eF9jYWNoZV9zcmFtID0g
ew0KPiArCS5wcm9iZSA9IHVpb19jYWNoZV9zcmFtX3Byb2JlLA0KPiArCS5yZW1vdmUgPSB1aW9f
Y2FjaGVfc3JhbV9yZW1vdmUsDQo+ICsJLmRyaXZlciA9IHsNCj4gKwkJLm5hbWUgPSBEUklWRVJf
TkFNRSwNCj4gKwkJLm9mX21hdGNoX3RhYmxlCT0gdWlvX2NhY2hlX3NyYW1fb2ZfbWF0Y2gsDQo+
ICsJfSwNCj4gK307DQo+ICsNCj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIodWlvX2ZzbF84NXh4
X2NhY2hlX3NyYW0pOw0KPiArDQo+ICtNT0RVTEVfQVVUSE9SKCJXYW5nIFdlbmh1IDx3ZW5odS53
YW5nQGhvdG1haWwuY29tPiIpOw0KPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJGcmVlc2NhbGUgTVBD
ODV4eCBDYWNoZS1TUkFNIFVJTyBQbGF0Zm9ybSBEcml2ZXIiKTsNCj4gK01PRFVMRV9BTElBUygi
cGxhdGZvcm06IiBEUklWRVJfTkFNRSk7DQo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7
