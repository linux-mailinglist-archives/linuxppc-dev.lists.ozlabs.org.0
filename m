Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F337447A7A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 07:33:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnhCS6bCkz30RK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 17:33:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rohmsemiconductoreurope.onmicrosoft.com header.i=@rohmsemiconductoreurope.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-rohmsemiconductoreurope-onmicrosoft-com header.b=VHDXpq2C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fi.rohmeurope.com (client-ip=2a01:111:f400:fe0c::621;
 helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=matti.vaittinen@fi.rohmeurope.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rohmsemiconductoreurope.onmicrosoft.com
 header.i=@rohmsemiconductoreurope.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-rohmsemiconductoreurope-onmicrosoft-com header.b=VHDXpq2C; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hngw20wgNz2xRn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 17:20:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfgNqQ/GYymXB6Au/VEvRG/tP1Undq7T0QZX7E7dVU8pTqChVqWx46RV9Gi0d85hWAhlCGiKDVnkgtLqK7bwR44Waz6WWjq2uRINM5ZXnKLIzwYFhHa8mn7QPofM2OgY81JUrdKSR5mThMuc/Efq3VNjVCmMYehsDHcYCvv7ZGbWgaVkGBr/Mk7WYs9iSnkQrzLrz9sMUplfchmGse48K/I3iu1YrJc4DortF1XNAi9e8NtWG0Pn9WhxS3sbGLP0bnyWB9KvHpEmW0HkhG+emZC3r9w3XXs8+DWOc5EpR7oepfnMTFWfp9OjJhl/5bI/y2hiC572xsUm04L2Tl2CnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nc0kIp1IwybG46XcM4u27oX4CP6/VFOqSllqQEn7Phk=;
 b=dFtOXK/nDM5HPsR0VnzGeXtTtcF4bICasB0/JB9WWW7GFmCPQfmefADHkuMGL3qqWVnOpjWRvqL4hal1jyc6uG3i4nVHikNoVg9cew52gghYu/u7vKreXbkmxA+l36c+Y1IqP57AokBd/QS33IsJLKUR1+BCipj2DyDlp6HDKTIjDpMm8WH6zK9WTWADtM6sIMntQfE+7B51Yio3II01ahZdh5WA3sUZiANM4eY9K6tB1yMaJDvZeL9ANi+7JSs5lNv/gnRLXLGJRQRz3yKN/eu0nU+IbD64PyLBSVg0b1dSdMCZTaWe75JeqTaKTfLjHKyd67MDoaQc/VWfCz2MPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nc0kIp1IwybG46XcM4u27oX4CP6/VFOqSllqQEn7Phk=;
 b=VHDXpq2CQN+Hs1n8pLP6qy4aA/VNlidQQX8F4P8rM6nPU9DZ0TzJ5wiXD1KpVWlgGV0Gg3OH6jubiof/Za/FIshlzO8DSYXtrk9reQjmt89RR1evnrX53w9vro4heRN9Rk/MSLXD5djNY6DT4Ya/XubRHMExLkPwd0cTIeubBgc=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2410.eurprd03.prod.outlook.com (2603:10a6:3:68::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.15; Mon, 8 Nov 2021 06:20:05 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::d535:e3e:baf4:2d60]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::d535:e3e:baf4:2d60%5]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 06:20:05 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Steve French
 <sfrench@samba.org>, Jonathan Corbet <corbet@lwn.net>, David Howells
 <dhowells@redhat.com>, Russell King <linux@armlinux.org.uk>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Lee Jones <lee.jones@linaro.org>, Jeff Layton
 <jlayton@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd
 Bergmann <arnd@arndb.de>, Ronnie Sahlberg <lsahlber@redhat.com>, Guenter
 Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, "linux-cifs@vger.kernel.org"
 <linux-cifs@vger.kernel.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-cachefs@redhat.com"
 <linux-cachefs@redhat.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-sh@vger.kernel.org"
 <linux-sh@vger.kernel.org>, linux-power <linux-power@fi.rohmeurope.com>
Subject: Re: [PATCH 6/7] include: mfd: Remove leftovers from bd70528 watchdog
Thread-Topic: [PATCH 6/7] include: mfd: Remove leftovers from bd70528 watchdog
Thread-Index: AQHX0lzMDNIdtW14e0WCkmlQyrtX/Kv5LJ2A
Date: Mon, 8 Nov 2021 06:20:05 +0000
Message-ID: <38c3dcf9-588c-323d-4630-ec6bc8af7313@fi.rohmeurope.com>
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
 <20211105154334.1841927-7-alexandre.ghiti@canonical.com>
In-Reply-To: <20211105154334.1841927-7-alexandre.ghiti@canonical.com>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9de774b5-ed75-4d36-2ab2-08d9a27fce8d
x-ms-traffictypediagnostic: HE1PR0301MB2410:
x-microsoft-antispam-prvs: <HE1PR0301MB241059E462984531F8906E0BAD919@HE1PR0301MB2410.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yare5VyqhT8p+QMDPl27wWH7WCbQqMHW4eIZKH0pys0jjAXxEmUuIGhKSA7QpLug/1Oy0yJVn57ZSI80dQegOPP2iaFawluLEDbQLSLN2gD38HPMhxugXBGOp0OpGvnQ6P5kKLeoYDjJznTfj/AXxJLVGK83y5E5qU9nV6Bf97bdzoEB4bftyJTtoQAxy29jQZWiGucSkG5b+916Oo96CjgTwpIA8zSet1kOR3oyH4n7oCnat4mJpDOQFSm7pgZevUf3fFzzCpicRksNxBdx1n6QDxEgVSGlkSczk9EngXAVsJGTu8YvQ1voQBX+ts8YHgl7aqRiU/g361uJUJ9t1X6v5vwxDcxGjyBAa533lc4UM6NvjVArGDqPsligzuBzZIRgcwkt2gsvuzdZqEiePaKhwISwdmKEAZfM4gVj5wNM8fqZyzopnAYRS/tFwO1ypQ2LS/5QyHsHHaUOPoiF+VMnGs8w7OevCKK+S26JxVsCfxbH6ZcRYzDokEyNaO//0Yvf4lBQkTp2HGfXlAeFCcqEvlgzfTRGswlu0PG0imMgx4yfilZyc2P+/cnX4HEgDl0yEH14niu4NdAoUJwElCcmnVKM46IeOIx2e4yRsKzHs8U0rz7fhTV7WoBbvmjHHDAsTEcXS3it69avhC7gTUZJikMOWQBemmyIpANv+bhu6VeXUdRio5MbqA0YaDkg+nH3/rOL5zPO38TXT1/h4rNMPMRmh3cz0/1BvBewCD2a60NeGFXqqAzeWS36xop+uAsYDg789VyDRhP76GrOZBs7xP895huUFOkcUcYN6AliLmKjJMCaWMF2q3ekJs+I9WnfoopNIszqZbIhFu6rneLIj6U5UhsdQ4MQAykarCwaU7DE6FFJE0NmMPxebSy4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66946007)(2906002)(31686004)(31696002)(7416002)(7406005)(86362001)(508600001)(6512007)(76116006)(66556008)(64756008)(921005)(66446008)(966005)(6636002)(83380400001)(186003)(110136005)(6506007)(5660300002)(38070700005)(53546011)(71200400001)(316002)(2616005)(8936002)(6486002)(122000001)(8676002)(4744005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3ZpV0hNWWwyMlIrQkhjQXBTTmZIRTdLTndHSmN4c1ZWbWxXNXhEdUlTN0JV?=
 =?utf-8?B?TktTaDVaLzN2SEoxSmcrMGdpcmRTa1NWOWtzNW9oZ1NGUTRFUXQrOGhzTlNq?=
 =?utf-8?B?MGRMLy9ZdTdLQUVMb1U1YzVSQTQ4NGViQUwzVVdCWXVYUkJhdnhjQUM3NGRu?=
 =?utf-8?B?MEc2dVRXWFRQTkt1RmtNeGNTbFROeTF4ZnJpalkyeUhweFFmUjBWTENHQkU3?=
 =?utf-8?B?Y1lDbEdJaW9peFd3KzFGRlloMjFtMTY0ZVhSdWhYOGxkR3B2YzB4MTFwVnVp?=
 =?utf-8?B?a09JTks1YVRPakhhV3VKajY3eWRTMFlhTHZCeURlNDNHWWZnSkhEZklKZVlu?=
 =?utf-8?B?UEt6N2w3Q2paamNqaktkODFJTE0xNGwzdk5pMTVBRHBNYTk3RldFdng4WHRG?=
 =?utf-8?B?dHlIb1RyUUVHdXFsc0l3RFk3TytCUUtMcDl4R1d1MWFCNy9FTzhSZS9EM0hU?=
 =?utf-8?B?dFdKaFI4UW5UeEN0Z0tHcy9HS3REbTR4V0h4TGo2SUN2a2I4SWNFZDFPZS8z?=
 =?utf-8?B?NjJYemh4UjFuTkNqbHRKUStsdlcvbllFQ0Iwc3dMZTVhSkZNWEMxNVE4elJv?=
 =?utf-8?B?MkNOV0ZMQmNhOGdRNUJUZ1dmZ0thYUlVN3RmSE4wUjQyVEZoOXA1NVBpZ1ZV?=
 =?utf-8?B?SWg2dEYrMTlhdUFObkRZcjAxU0o2cThoU0NXMU5LS1VpS0hzY2p5UDk4SFN2?=
 =?utf-8?B?bFc2U2sxTW0vUEpSNlRHMzU1ZzhaRDVRYSsyaWtHaHZpRlRiWExrQ3JOdzIw?=
 =?utf-8?B?RVlqUFdicGVCL010UTVMZXl6Sko2NFErcGY2b1RkZjQwL3pqU3BhMlpZcExF?=
 =?utf-8?B?NzRpcitmaW83S0dYQ3Y3TXRWZ085TXEvUEhnK2FVek8wejJIb3NRbU0rM255?=
 =?utf-8?B?YlBZdjEwalJGckpsMWFaZmdzSUpJZU1GYnBubEkyTW9oZ284bExKRFpDVDk3?=
 =?utf-8?B?aEYxdmowZ1ZCMytKYURRaEJtZllPTS9WQmtpcWF4WG5Fa3c1SHVtSmdJZGRV?=
 =?utf-8?B?MnRSRVlnVmx2RG5SMUVMQSs2bzUxeGdQVElWUmF0ZGlPWnJQbnVFdUtjWFJE?=
 =?utf-8?B?d29lNWZaWm0vVUZUYXFveVFRMDc1ZWlGc2R4Mk9kV2dSQXJNMkhnTFU4VWxQ?=
 =?utf-8?B?TTA3cmlFU1FjbGFDY0NGS0dUQThBM1JqMStzMVU2S25IajZLQ216dWFGa3F5?=
 =?utf-8?B?WnEzRXg3eWwxV0dJRUlZdFBFS3lBN1FvdkxjRVBSNjgrMUdXK2hwYUxRRW9Z?=
 =?utf-8?B?b0xpZStRb3dic0s2TkVKeDN5NnNQVkZYK2pMc2RJQytxdnhZT1hyTlBBVUsy?=
 =?utf-8?B?KzhSR3ZQN2JIM0phMHBIRU1HWFU2ZGs0MXZrdUJMbDgxWUNQRmovNFB5WEV1?=
 =?utf-8?B?VVYrOVo3K3lOa3RqVm0wc25QT3hINHhGT2lqQlZQeFp1V3hJZ2FkK3dmQ1Jj?=
 =?utf-8?B?eWEwNGt2S2lrWUxjM0R1b1poNDJxYWc3WG9BdmFTa0VJYWlieVp3Y1U2RTlT?=
 =?utf-8?B?dGoxZGlPQUk1NS94T2hOZWFGN21yZmpUY0hYVUduenFmU1FiU0JaWDdJa3E3?=
 =?utf-8?B?b2ZpWXUxSHpSejRtK0hMck92RGxQdlloUUNCV0hUVEk2aE9nU2MxWEh6ckVn?=
 =?utf-8?B?dTdLMWlnSy8xeHJnVEljU1RBdDRLSmVjR0Z6dHMxcnlPS2R3NGlGYlhlS1N0?=
 =?utf-8?B?bWxkSEUwUk9xK0ovVHdFUDFoYzFQMlNzRk1yZWt0Um4xbHE1cnRiUy9Qdk1O?=
 =?utf-8?B?R0tVR3VJWE8xbStwUDBtZCs2d2ZqNS9XMENPMlo4VmVBcHRxOG4vSmZrUDBj?=
 =?utf-8?B?V0xzOHpRd2d6bWNtU2hGSjRkRXF6U2dIdjZkdU9USjg1dVUrWW80MlI3UE5M?=
 =?utf-8?B?Ry9JWVlUcDZYQXhxVURrWDRCN3ZUVXBGT0tuTGZMTEErNExnaVhoZmZzMG1P?=
 =?utf-8?B?aE5WMUJqT0lhdU81ODBpenB5aGduSzdEYjZ3cjNmRVpyN0tOcVUrWVRhU0pq?=
 =?utf-8?B?TmpxNWpmaExITzhOV2RmS1ZOZWhKMisrakhFNFZoVjBiYlNtLzBHaXR0OVdV?=
 =?utf-8?B?cno1UVJFeUhabHJVQko5WXJPOHlTMGhzVm02L0RnU2Jjak9BMS9sbDB1MEdt?=
 =?utf-8?B?S1liRVd0QnhkbmsxZlgxd01paFU4N1VXNWc1UmFhVmpMRGt1TEw0RHYrZHFh?=
 =?utf-8?B?NTVxWHB5SFVvR3pZTHhRSjJXbzU0U1FZMXpoVWFRd3hyWGw1TDNldVNGSW83?=
 =?utf-8?B?d3NzS3hjNHpCTTNOdldPUXNRUEJ0cGhEYVdXZE5UWG5nS1JrU0hUalJkNkU0?=
 =?utf-8?B?NzNEQnhxOHUraDJ6ZVFrTS9rYW1XK1U5WGpLZWQ1M2hETDR0eVFhZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5740C52C37300439D6B722B54F9E72C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de774b5-ed75-4d36-2ab2-08d9a27fce8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 06:20:05.8100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNwa5VAZJUZw3wLPAlkIHlzcU3MAxrVRV1FQw+xgUBK/0VWF4fLs6coh7eFKImRyuE6YP4vhuxGYoRvKYHpIefUd5XKxj0ei6oXv0dWBPzr85iAh58JRMeYIQFB1FJMr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2410
X-Mailman-Approved-At: Mon, 08 Nov 2021 17:33:16 +1100
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

VGhhbmtzIEFsZXhhbmRyZSwNCg0KT24gMTEvNS8yMSAxNzo0MywgQWxleGFuZHJlIEdoaXRpIHdy
b3RlOg0KPiBUaGlzIGRyaXZlciB3YXMgcmVtb3ZlZCBzbyByZW1vdmUgYWxsIHJlZmVyZW5jZXMg
dG8gaXQuDQo+IA0KPiBGaXhlczogNTJhNTUwMjUwN2JjICgid2F0Y2hkb2c6IGJkNzA1MjggZHJv
cCBiZDcwNTI4IHN1cHBvcnQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhhbmRyZS5naGl0aUBjYW5vbmljYWwuY29tPg0KPiAtLS0NCj4gICBpbmNsdWRlL2xpbnV4L21m
ZC9yb2htLWJkNzA1MjguaCB8IDI0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAyNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L21mZC9yb2htLWJkNzA1MjguaCBiL2luY2x1ZGUvbGludXgvbWZkL3JvaG0tYmQ3MDUyOC5o
DQoNClRoaXMgd2hvbGUgaGVhZGVyIHNob3VsZCBiZSBkcm9wcGVkLiBJJ3ZlIGFscmVhZHkgc2Vu
dCBhIHBhdGNoIGZvciB0aGlzIA0KZHVyaW5nIHRoZSBwcmV2aW91cyBjeWNsZS4gSSBndWVzcyBJ
IG5lZWQgdG8gcmVzcGluIHRoYXQuDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYjI4
OGI5N2QtNGM1Zi0xOTY2LTkyYjAtZTk0OTU4OGJhOTdlQGZpLnJvaG1ldXJvcGUuY29tLw0KDQpC
ZXN0IFJlZ2FyZHMNCiAgIC0tTWF0dGkNCg0K
