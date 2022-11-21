Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9006319B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 07:30:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFyDh1DNjz3dvf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 17:30:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=K3mh/SXy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61a; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=K3mh/SXy;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFyCf6qkkz3c7B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 17:29:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltUhMkGQzIeyMSUln8U6UKhEyQ4CjQVnNRs759YGJL0hdssg5bFdnikLRfAeutAyyOvBR0ynjZ9HuiWeYk/sadaxhKwGbABo8f6h5Qy308axbek7x4cI4tvDr76FPHHfnJP364zyaN7Ka4O3sZN1+gAyWRSjWOmpLXF6W1BfYt7YPjuJcX9gx9qOjB3gxqfzBaIeIsR4dOTlwPP9f1S4qjNX8ZteCWlrVJq5N31OzXDJmm2uoV9SJ3J9sdKd0SpcBT9gKv6/THnoGN2GyrEGIeBQje6w/MyGASXUWEDkR8aBXhfQKgoXAQ5Ge2GbHbI+Ec/9JbMcKNDPKQDwnos1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qCRM65VlOG4etV7jbDupmv0dk4D6MfSj4NlCbgaj8s=;
 b=VjyoAmXuGdJfbOVMaS+UTLBbIHVo7LsAJ1wtUlgmT+zEryYQFYVEwGoB986bDrEi4G+wNy0e2xYqQLVfiA5C3jd+IEq5bVx4Bytmxnvy9fqN9IvNfYdkSIj5vqdHIeYNWbkyyLygcaVGrLQu8qKByjrapV42XuVJrS41mYVlFSh990vo+OBc6U/J9p9KV8bjqxMQ0RyOwNeP/6fepViIHA9JQS91QvuyiAtSMTqdmcf0d59u2SXTvoN5w5OXdyW1hr1jcUVHtLE/wWGmP1cdTm5lGWFysa9dJ88q7h+xTgF8mWDDyFqwPJXwEzJ5XrgR2D0rfEw1pMHc/9tlIv3Brw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qCRM65VlOG4etV7jbDupmv0dk4D6MfSj4NlCbgaj8s=;
 b=K3mh/SXy9ugkzKmBLfXcyE+5E6S9qx4eZJGJGHcpG/3RpZlaC9mfdfUn3mT8rpLf5zYo1n0Ttn0IKCDVZPNwUOXzs75OEaQYfk4KISp4nlaxXAwkHQyZYFCqehANcLHxQ92p25JboHWFKQvhf1NDEuJwEIXd/jG0ETXZbc9bNa/resRPswc90nH/WUeg642RGIHxo6BoKglWHZkp1+u4fuznKGpxCiGOIszCokLAONNfU5selUp1g51Nd0saxx4S4EIgFtrSVKu2DluOHEQEzgTT3mkWg8kf3Ripj0XuPXqOP7McS3HEMDgVCIMd5bHkcuy7p0Vz5Fv/GZDhPbsWug==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1703.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Mon, 21 Nov 2022 06:28:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 06:28:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Yang Yingliang <yangyingliang@huawei.com>, "fbarrat@linux.ibm.com"
	<fbarrat@linux.ibm.com>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
Subject: Re: [PATCH] ocxl: fix pci device refcount leak when calling
 get_function_0()
Thread-Topic: [PATCH] ocxl: fix pci device refcount leak when calling
 get_function_0()
Thread-Index: AQHY/CXN+EgRSh9wC0K8J+vLNeBoaq5I7MGA
Date: Mon, 21 Nov 2022 06:28:52 +0000
Message-ID: <cb876db2-0f45-f254-84e6-046003eb86f7@csgroup.eu>
References: <20221119144433.2454759-1-yangyingliang@huawei.com>
In-Reply-To: <20221119144433.2454759-1-yangyingliang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1703:EE_
x-ms-office365-filtering-correlation-id: 73c11937-a5f9-47c4-56a9-08dacb89a8bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EGR/Jn1cPP5qlQaDE1lGSInC6jTKDdbxXKnEhpYmyn3gZ3k1R81mBsk6LptGzapOVv+C09wxfWPnllFgKf0IKbHDvUwegzg61wZ2BieCnT1l7G6aLxXCeLmayI2+p1yrgW0qY+jnNB00q+/Cyq9JXWa6n98qDEDcMY+47tuoq3pSWuG21ikbFwEXTXD+8SgiWPNXerEEiVJUMczccQ2BXGz8NZdQ8cKMcapfRP7jgwfgz9P1WNlHsBeBHdo7EFvYkywV4O78FFaL2mP0pvxASQbC0mJ+2Zhl7ZqhdFdWRYW/EpFsxohLAXd15Xl81c3a5vdf6H59G6PJhBqldKeRBbLhtE+++xWXpEsKeo7T18Y3XeDIjLJ0bssV130BRDD8IF3lL0MRqaOy2JaRuZ/ezAuZ9/4cK5+MKBaemuWPgTfupnu/3cTbnOAoVdFdsB3HrW8AeFJJ72AYbYGpqh+kov0Z13TjP0Nhl8nB9zMacGi7lzon1NijZ02D+wR5ysvCc0ZOXWbRp6O2TwVwMnxqsaUpNdC4WGWvoIlJNV0a0SA5WtXKWN0Dos0kSPMc/i3bqnsAj+SQyFlYqWkqjtL9BfP605yhgnfqPhiJzoK/TExboP6psuMkT0dRo9TBaHpWZxYnU2uDN9M4ShTikdDtb5N2RKdt7Gd1dpj2rlL7nJ0CvuR0ZFCYCwon61itjD5QXmpS/SaFdAfnkqV0Drm2fpcKxNVPrd3bVJS9jMYAGuCs7xFgM+NBMOH2c73LK8uroPUOZRC/GxeBw8uX5cESmQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(376002)(136003)(346002)(366004)(451199015)(6512007)(2616005)(186003)(66574015)(122000001)(83380400001)(38100700002)(64756008)(76116006)(44832011)(26005)(2906002)(5660300002)(71200400001)(6486002)(478600001)(6506007)(4326008)(8676002)(8936002)(41300700001)(316002)(66946007)(66446008)(110136005)(66476007)(66556008)(91956017)(36756003)(38070700005)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aWEzdS9NRTZubXRBb1FycTg3WFppZnZsSlZpdllPdit6NFp0QzJsRkhQa2U4?=
 =?utf-8?B?TWM3OXpzV2FYU0NlLzhTZ0llSlB6bWJyYUN0WldjM0I4VzgwZ1JpTFZGQjRG?=
 =?utf-8?B?NEd6N041OE9oMzlrZ1A3eHZnbVU1SFIxdFN4NTgxdW1qVkVENVI2RFB4YTZy?=
 =?utf-8?B?UWlUN1lQZkw3RlBjaFkrZkRhaDdpSTl3NXhTS1dtSTcwdWgwek5ObC9sYlBx?=
 =?utf-8?B?LzBXRnFwaElWRStGM0tQY1dCd29INVlMOU9VNTlNd2Rxb0FDK1dUUGR5QWU2?=
 =?utf-8?B?TVUrTjNmN1VJZXVWZFp6alQzU3R0dmp4bktQdzdUZmVielkxZlQwTWV6WHRO?=
 =?utf-8?B?bHY5Wkk3RTJmdDNDWWozQXNwMUFWWWVUOGJqRmJyT3hKbGZ5TUJlUHNZUGRt?=
 =?utf-8?B?STlSdU9yNGRWaDc5bE00ZXl0aEZCaXJ4aC9QNVZzRzJhWEY5RFdsTDlJNlYx?=
 =?utf-8?B?bngwenVZc2c5WmVXNUdUOWxFM2Vwb1JkelBIVGRnbkF2OWZGZnZ1Z0R3azlI?=
 =?utf-8?B?MkV2RlpheEpsMVhWR0R0TnFyakQ0OWJYMnVQeE11RzQ0T0U3RDhxREc1QmNj?=
 =?utf-8?B?S3dENnBhZ0w1dGZmRGovY3UvY2xUb2lBb2U0K05ybGRGS1lydWo5Z3FwNjVx?=
 =?utf-8?B?UVZ1RHFBaUM1YWo1RWh2RjhNMGNBTUtnOW5oUXJqNm9SUXhneWtUQ0RFQnlY?=
 =?utf-8?B?WVNhOHhQWlhSZkFxRnJRWG9XV0hEZ1dnNFArMFVFQ0Mrb0xsZzBaRkdwTWNX?=
 =?utf-8?B?VkVEb3VZNERzYVVvRW14NEtjbUd6c0RrREJFNzhKa0YrVUxYUGVxL1BSUWt3?=
 =?utf-8?B?dVFjSWVJSkxVeTdBRjhEeTBHSkNzMWh3SzM4ZHE4U0xCd2QvMEZXazR2WTlj?=
 =?utf-8?B?ZzJpcnRRbTVPTHJyRUc0WUxKU3NxRmVLcFlRejNVaisweUo5T2dPQjRsQ2p6?=
 =?utf-8?B?SnUyL1B1Q0F1ZnJ5eU1OcmU0Ym1VYXpOU05VakxVVEJDaHh4T1JzbTBxdmJL?=
 =?utf-8?B?dFRlTzE3VldXRXI2U1pHenRNU0VaSTQvbEYwRDNPN0R0ZDRvVzFyRjVBeG1N?=
 =?utf-8?B?V0ZiYXpURit3dWFzSXphanZJd1dKWEpDKzZmSERoeHJPWVNDMjREV3NucEoy?=
 =?utf-8?B?NEgyWC80bEk0aHhYMFNDa040ck40dHl1dVhDS3RBVmtZVTNIUlhCbjhQZU1B?=
 =?utf-8?B?NEdmVUV5VXpBaUxpbFVjbVRyalFkeURsbjRvenMreXFHVUI0ZFR1djhNK1V3?=
 =?utf-8?B?UkVleXo5dHJFZFpURFNRYUJreGN4OUJpYUJFZDAwQ0UyVDBrOUpXYlhIUE5x?=
 =?utf-8?B?Zy9hdUJpbGFFRzlWRTkxU3grRFBvck9yVVBWMTNFSTYreTlreDhiZktXVHk2?=
 =?utf-8?B?RDB0UkIySU5XdXBGN0RPcGQ1WURwWXd4M00wVlQydVlCZzY3TEMwRld4Rnc0?=
 =?utf-8?B?NTNsdUtKc0pCVm0wRmdqZXZtN1hsdVJqSnhxWjVhaXVabklsTGhaRE5vYmJF?=
 =?utf-8?B?SmszZ1ArVVlQYlVEb1RXYW9RRTlSMDM5cVRieWZoeEpqZkozcXlQdUpJazRo?=
 =?utf-8?B?dzh2TFJERUYvMVNzSWxQYkZGTWJjM051MWtKRlQzYktmbGRVdXlHZVQ0ZGJE?=
 =?utf-8?B?ak9yc1VSY3dScktwVU0vS0FjbXNpeDNEc1gxeDF5NUJjeDZXZ0tvOFFOditu?=
 =?utf-8?B?V1gyNWxxVS9nTHlVYU1BaHdsbGZpMjNGcGpBRzZNRmpWaDI0Y0lJT2dmOEM5?=
 =?utf-8?B?SW1QRVYzUmtQa2FiSld6T3ZXV1hoVFNFTlhJNFhHZVcyeHJOOERHeTVVc3dE?=
 =?utf-8?B?TWtJVG9MdjVmSFd1ZlQwbVFpaVVHakFPYm9Kb2JzcVRBSlFCak96QmJ3WHJL?=
 =?utf-8?B?RGt3NlUyT0dHZk4zMzNIWVh3VWFZU0hoSE5icjM4MFB0UGRHeTg4Mm1QMWFH?=
 =?utf-8?B?MXNRMU9UNlh2VEVQMWQ2eEgyM2E4eVF4TjdPdEthQjRGVW5tZWhWQ0J5WVp6?=
 =?utf-8?B?bFp3empxOGRsS1RjUUgrbVdjMXNLVGpmQkNTT054YU92RFdLRnJkRkN2Ukw0?=
 =?utf-8?B?U1ZpUXdDTWx0VUhCTGg1MitSNzFXYzJYSE9HMFdKK1NtUW96c3R1NWVaK0ZF?=
 =?utf-8?B?NjRkak9ZNHFaZW5CSzJrN2oxZk9vZC9TUitGRmZCV3gzUFF3TmZ2Yit5dTBN?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D3A1B59A2C34D4E8AAEF94E4DD73A95@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c11937-a5f9-47c4-56a9-08dacb89a8bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 06:28:52.7947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R50Mkcsh7oyBBKG+rsiW8uLV0NKyyDRrTaYGFFGCCZhEHY1qpHudzvwvfG2Mu+5JfeHbcZ8vxy0H14J+z/9iB1LWlpwqJxpE8hlEtke9K20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1703
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzExLzIwMjIgw6AgMTU6NDQsIFlhbmcgWWluZ2xpYW5nIGEgw6ljcml0wqA6DQo+
IEFzIGNvbW1lbnQgb2YgcGNpX2dldF9kb21haW5fYnVzX2FuZF9zbG90KCkgc2F5cywgaXQgcmV0
dXJucw0KPiBhIHBjaSBkZXZpY2Ugd2l0aCByZWZjb3VudCBpbmNyZW1lbnQsIHNvIHdoZW4gZmlu
aXNoIHVzaW5nIGl0LA0KPiBwY2lfZGV2X3B1dCgpIG5lZWRzIGJlIGNhbGxlZC4NCj4gDQo+IElu
IGdldF9kdnNlY192ZW5kb3IwKCksIGluIG5vcm1hbCBwYXRoLCB0aGUgcmV0dXJuZWQgcGNpIGRl
dmljZQ0KPiBpcyBwYXNzZWQgdG8gZGV2MCwgc28gYWZ0ZXIgdXNpbmcgZGV2MCBpbiB0aGUgY2Fs
bGVycywgaXQgbmVlZA0KPiBiZSBwdXQsIGluIGVycm9yIHBhdGgsIHBjaV9kZXZfcHV0KCkgYWxz
byBuZWVkcyBiZSBjYWxsZWQuDQo+IA0KPiBwY2lfZ2V0X2RvbWFpbl9idXNfYW5kX3Nsb3QoKSBp
cyBjYWxsZWQgd2hlbiBQQ0lfRlVOQygpIHJldHVybnMNCj4gbm9uLXplcm8sIGNoZWNrIHRoaXMg
YmVmb3JlIHB1dC4NCj4gDQo+IEZpeGVzOiA4N2RiNzU3OWViZDUgKCJvY3hsOiBjb250cm9sIHZp
YSBzeXNmcyB3aGV0aGVyIHRoZSBGUEdBIGlzIHJlbG9hZGVkIG9uIGEgbGluayByZXNldCIpDQo+
IFNpZ25lZC1vZmYtYnk6IFlhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWlzYy9vY3hsL2NvbmZpZy5jIHwgMTEgKysrKysrKysrKy0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9vY3hsL2NvbmZpZy5jIGIvZHJpdmVycy9taXNj
L29jeGwvY29uZmlnLmMNCj4gaW5kZXggZTQwMWE1MTU5NmI5Li40ZGE1YTJiODUxNGMgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvbWlzYy9vY3hsL2NvbmZpZy5jDQo+ICsrKyBiL2RyaXZlcnMvbWlz
Yy9vY3hsL2NvbmZpZy5jDQo+IEBAIC0xOTYsMTYgKzE5NiwyMSBAQCBzdGF0aWMgaW50IHJlYWRf
ZHZzZWNfdmVuZG9yKHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+ICAgc3RhdGljIGludCBnZXRfZHZz
ZWNfdmVuZG9yMChzdHJ1Y3QgcGNpX2RldiAqZGV2LCBzdHJ1Y3QgcGNpX2RldiAqKmRldjAsDQo+
ICAgCQkJICAgICBpbnQgKm91dF9wb3MpDQo+ICAgew0KPiArCWJvb2wgbmVlZF9wdXQ7DQo+ICAg
CWludCBwb3M7DQo+ICAgDQo+ICAgCWlmIChQQ0lfRlVOQyhkZXYtPmRldmZuKSAhPSAwKSB7DQo+
ICAgCQlkZXYgPSBnZXRfZnVuY3Rpb25fMChkZXYpOw0KPiAgIAkJaWYgKCFkZXYpDQo+ICAgCQkJ
cmV0dXJuIC0xOw0KPiArCQluZWVkX3B1dCA9IHRydWU7DQoNCldoeSBpbnRyb2R1Y2UgdGhhdCAn
bmVlZF9wdXQnIGJvb2xlYW4gPyBXaHkgbm90IGp1c3QgdXNlIA0KUENJX0ZVTkMoZGV2LT5kZXZm
bikgIT0gMCBhcyB5b3UgZG8gaW4gb3RoZXIgcGxhY2VzID8NCg0KPiAgIAl9DQo+ICAgCXBvcyA9
IGZpbmRfZHZzZWMoZGV2LCBPQ1hMX0RWU0VDX1ZFTkRPUl9JRCk7DQo+IC0JaWYgKCFwb3MpDQo+
ICsJaWYgKCFwb3MpIHsNCj4gKwkJaWYgKG5lZWRfcHV0KQ0KPiArCQkJcGNpX2Rldl9wdXQoZGV2
KTsNCj4gICAJCXJldHVybiAtMTsNCj4gKwl9DQo+ICAgCSpkZXYwID0gZGV2Ow0KPiAgIAkqb3V0
X3BvcyA9IHBvczsNCj4gICAJcmV0dXJuIDA7DQo+IEBAIC0yMjIsNiArMjI3LDggQEAgaW50IG9j
eGxfY29uZmlnX2dldF9yZXNldF9yZWxvYWQoc3RydWN0IHBjaV9kZXYgKmRldiwgaW50ICp2YWwp
DQo+ICAgDQo+ICAgCXBjaV9yZWFkX2NvbmZpZ19kd29yZChkZXYwLCBwb3MgKyBPQ1hMX0RWU0VD
X1ZFTkRPUl9SRVNFVF9SRUxPQUQsDQo+ICAgCQkJICAgICAgJnJlc2V0X3JlbG9hZCk7DQo+ICsJ
aWYgKFBDSV9GVU5DKGRldi0+ZGV2Zm4pICE9IDApDQoNClRoZSAhPSAwIGlzIHVzZWxlc3MsIGp1
c3QgZG86DQoNCglpZiAoUENJX0ZVTkMoZGV2LT5kZXZmbikpDQoNCj4gKwkJcGNpX2Rldl9wdXQo
ZGV2MCk7DQo+ICAgCSp2YWwgPSAhIShyZXNldF9yZWxvYWQgJiBCSVQoMCkpOw0KPiAgIAlyZXR1
cm4gMDsNCj4gICB9DQo+IEBAIC0yNDMsNiArMjUwLDggQEAgaW50IG9jeGxfY29uZmlnX3NldF9y
ZXNldF9yZWxvYWQoc3RydWN0IHBjaV9kZXYgKmRldiwgaW50IHZhbCkNCj4gICAJCXJlc2V0X3Jl
bG9hZCAmPSB+QklUKDApOw0KPiAgIAlwY2lfd3JpdGVfY29uZmlnX2R3b3JkKGRldjAsIHBvcyAr
IE9DWExfRFZTRUNfVkVORE9SX1JFU0VUX1JFTE9BRCwNCj4gICAJCQkgICAgICAgcmVzZXRfcmVs
b2FkKTsNCj4gKwlpZiAoUENJX0ZVTkMoZGV2LT5kZXZmbikgIT0gMCkNCg0KU2FtZQ0KDQo+ICsJ
CXBjaV9kZXZfcHV0KGRldjApOw0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo=
