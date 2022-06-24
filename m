Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1935591D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 07:29:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTm083sFJz3dtk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 15:29:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=w13+kgFd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.89; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=w13+kgFd;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120089.outbound.protection.outlook.com [40.107.12.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTlzQ6CV6z2yMj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 15:29:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihNXv/doUP2zyiW312Tji6AIHTQNmn2ZGRgqz+rRf6YRMoB41zSLOaPg/brj79xavii7TBtJjnqFld+RpHSHYE7ozrs5wnMzWYeBidDvgJ4WstA/OobLSIGgIzXbMqXcdOOO870g794Al/9HESnVr2Xz2g8VP3XvNKxRWy0SU7P+u1QfCPVn9KaFlD5gBCpe1KQqqgUW5D4HoEjaaCdlPCMtLlWF4s5zKBx7mNchvQzUlCxADMpMVwOXCFyAOk0uO7l4OC8whtaxgOmZvvaChhrIfpUtV0TZvfEGaGGqK37d2awuhQI9LlfgknXYKHDvUwshByETtfwCF2wbl4sZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BPhLlWlkVTTHTr5F1IinMVNAN9kJfcsS5JiXbokRVo=;
 b=eFC2ljW+Ux+1d0i3P+wwL3wEoZgAxOHKZziSODodrAvk2vMzWLEfew8AYrI5eeAm3hM4VpScuW0+0QmTfNOWCkMDqW76yK9SocIWvym7Gg2QljSZfsj77SfCiMRXorTpocoiSBxj+MPWem2q/qR71ig6HozmnRdCZMj8aVjkXUvcYp3tB3YpiVE8PyQMUX/9wp2bzzoAl7zT8n0UT8i9/ONmyR4g5HqatX1irsZNX1QTmqlFrnFVcZf0hQ6T0fACYTKpNNNHBkt2kPmprCJDQUr+yN6WICljIakGCNlqQWhi1NE3tCGFiqtzJW93wHGCQTk/AtnnM8rX4iunoAqLNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BPhLlWlkVTTHTr5F1IinMVNAN9kJfcsS5JiXbokRVo=;
 b=w13+kgFdXgFmBu4hvQ1+riQz/UlE1OJXoL0197JEyZSH9FF68rzhZ8oQUNGTfzJzXaOFMrpJJSy83ypKbXkXCZuszsK99N1K/CVODIAc1fYaaQlhtmPdoGbE58rKTtJk/aMzBVy15QdHtHPekFMYEE2ScIlzEX3EcuxM1UiU3XomERlHi8+S8PNIag5KIiFX4m0OK359g8/udfVnSXDogoEgIxdqRCvDiR/8gcD0mQHJL9nXu+1xb5w0J/FSASqf5Z+bxDMkcHFs4Hi0USkWNGCxmAXypdkB/cnucGzCsiSlFtRjGo9YuFyoy2GyzPGdbC4ru90ZOxsCuvKH/yYRTA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2882.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 05:28:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 05:28:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V4 02/26] mm/mmap: Define DECLARE_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V4 02/26] mm/mmap: Define DECLARE_VM_GET_PAGE_PROT
Thread-Index: AQHYh4UNHiul1udyy0yTAklDcjRsDa1eB4IA
Date: Fri, 24 Jun 2022 05:28:48 +0000
Message-ID: <d3676fce-2dc7-6331-66f5-7009ac45f605@csgroup.eu>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-3-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-3-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5168dc01-7197-4a8d-95ec-08da55a26a38
x-ms-traffictypediagnostic: MR1P264MB2882:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  p+TbD0kGo85Cyxl46XXDUWWACZ5BUxZN7LE15FxHRUEH50LUfbvXzDfOrgM7MdpEsBGC3O8rHqFy0/IOs3wNNDaXeLXaaGqUjED6YuJ4t3KwrLY5rpr917D6jcLYYxWlRwMWrO6FDqhO0IURodTDuPGIVz8+1aQHrL6vmDdGsl1r9g4jLA8v5edWSG/YP45K2mccN/PDV8/7yOe06YdRoJu3YPLFf2BQgKI7acS+DlSUuLvEqY0+gF5+W7GVngeWOhEo9ZJv16wivfah47t2PDVrCd0NoI7dKzRCGDb2tnzdHKItACIaIy9gU3T+tbG0icD4fZEp3opw2mpyN/zcwWQnGV2rWo1bCjy9Jm37tpUvIso7RmLK23aRxARzLz/jkDT9N2J4GSOGfjvEXMGlPCuufFcNci10UUdq3oM4WkEi07aIjvMmFDeihBmbsFfddbtFO0VGvf6Nvh6TOhAmJUDwhJIKYHvV4o/mztCYbNBj+hgHht8jqWBT4vk6tvY2DU6/PaMRNPPM0aLNq4UOhET7+VcdGByhzm/4kncth/44drKpF8UnKBmS5DPl0qlBbvnt8mqHc/D6kWlvhBWzJOy1xP6bIYkJmICMjOFwRGc05vyBn3XcVlx9CuGkeQrlZYzG7ufd2msdOc/dKNQ39CitghF9XIgHPlqs0GFHLpPiwXZduQAqqKLYTrHC01yMeKamjZrpR4EKsX5oDRBsmYWoUm3d8vfaANBMlL0jBsMyz/mXtWccvBJvH3MgzYhtt5YTLTACy2V+0JA3S+Qc2MnVssZWNLrgjcZUTixhuIpXe5R/aS5X7JFhHF0Fbyi4bquvu/LHKJg7sxa6iyqgT/haQTlVxiLsmL5XnyI/QH8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(2906002)(6512007)(31696002)(26005)(31686004)(6486002)(478600001)(38100700002)(6506007)(91956017)(8936002)(71200400001)(86362001)(41300700001)(38070700005)(2616005)(5660300002)(7416002)(186003)(122000001)(110136005)(83380400001)(8676002)(66946007)(36756003)(44832011)(66446008)(66476007)(316002)(54906003)(76116006)(4326008)(64756008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dHR3WVY3MnZHaEF5dVFBTGtZelE2MVF1aVBodmRQZzVJR2p3QUpHMGcrOHA0?=
 =?utf-8?B?ZFRxOGtQdEgwOHA4TWdrd3UzQXpNK1Y2Y1NXc3RyTHpVdDlNdG4yZ1luWSt2?=
 =?utf-8?B?N3NaaWxkblVlZE9nT2N3K1F5UkFxMVVwOGl0cHZVaWFoWER2UDFzaEdCS2c3?=
 =?utf-8?B?aFEyQThIQk1SbGFVTXd4UDlwS1FFdjNTM0YxUmJBUVlPamlBMjVTK1RYU1VD?=
 =?utf-8?B?NjBSUFZuOHgvU0RscmpLTTFTbHhpSTY0U3JaWXlORnpVM3ZLcElzNkNLNkZO?=
 =?utf-8?B?LzVLRWZiNzF6U004NnhPM2FSM0owSThENkdhV3kwd1gxQ1hJVFRGQnRNRnpZ?=
 =?utf-8?B?eHhZVWNMUVJ2bnpRRkVVb3RwSlJuOURDSUxGd3Y0SXY4WDBHc280Wk12RVZo?=
 =?utf-8?B?ZjR0YnZ4d050bmdHazUxUmd5d1NGZURHVVMrNkdMTW9zdXE1RFBLMXIzT0lD?=
 =?utf-8?B?Q0xMZWRQL1gvQUJwVTFMTi9xM0poNkJsMnRCRmNJTjJTTGRtYzMyVi9adFF6?=
 =?utf-8?B?dXFIT0xKT2Q3dFU5UEJTcC9qalEzYkEzR1haVDRZbWdyVlNVdFZJL0kxN3Nz?=
 =?utf-8?B?ZXk1eUJUZ0hLMTluRUptcGsyU0t1aGZNS1c4M2FDZ0xCVFhmUEdOYnRnSWpS?=
 =?utf-8?B?SWRPU3p5RnRheGNDUWRvRUlsVjU5aXFudkh3UFE3NTE4YkthdEN0TmIyMUI0?=
 =?utf-8?B?a0Yva09VbkZ3MEpIcXhhMFhiYXl2ZmxCajJtbG4xN1pmQXZTYjRobXpLQ04v?=
 =?utf-8?B?SWxZbFZtZGZ3VW1yUTUyNjVXODJkNDJmMWZpdE1JWVpDQUlHVkgvMHJxRnd5?=
 =?utf-8?B?TWtKK1JmVWVnbFdJMHcrR3haR3NRYk9RbkFQdDN0aDgzVVNYQ0FqaGRvT1R6?=
 =?utf-8?B?cnhWT1lnUm9jdGlIY2VQVFhsaXpiN2JybkdjWkNhSzl4Ykx1VE16NFZ1ejZ2?=
 =?utf-8?B?Z1pReHBzdHZYa2ZYMHVGK0hUNGNIN1N1V0ROSGM3M3BEeERlVVFyay90K3po?=
 =?utf-8?B?SWd6K1I5cFZkSEE4OGIvcEtiZytvUU5hM25ob08yM0FiQ3UzUlNnbU1PcjAz?=
 =?utf-8?B?UVNmaWdFM0tzZzBGT25vdVFjdUNZSHhPY3hWSUZvZC9wOUJxNEpnc3pIKzU5?=
 =?utf-8?B?QkpKYXhKdWlYVTVRUkVPWlNBYitMbEduSllObzVncXdSNy81aW4vQk1KbGpr?=
 =?utf-8?B?UEVFcTlpQWJqeUhJT3o4ZndHVUNhTG9JcExoTUxrSDhDUmhXMzRGM1RqNThP?=
 =?utf-8?B?VEYzWTM0THBJSmFMQjdoWFkrUkVqV3FYVndocXRHRFhFbjdhNXlIV2VvdFZs?=
 =?utf-8?B?NGJ0ZUZ2bmpyMSt0eFFxMEZIZmJ3U0lxd3NQejljUzJjejBYUHE1TjcyUUpt?=
 =?utf-8?B?cUZLbGI1Q2hpSE9URktDRE8zMlFsVTBwSWx4RVhWK3lZK1V3YXVDMXZ3MUFk?=
 =?utf-8?B?RnlOaCs4MXBmREs3Qk9tYlVlcDFVajVPVmJmNkVLdkZDK3Bzc25pNWg1MGFF?=
 =?utf-8?B?Q3l4aUtCK3RrSTh6NTdjYTdrN2NVRTFKNzMwMjBrdlJwVHNCd2RvWHFUeHVI?=
 =?utf-8?B?WVNkaUxGNlZBVExqU2pkSXdsSlVuYS9nd0tKRHRWQXRRV0NXRDZWVXBzMGtB?=
 =?utf-8?B?T0Q0N1UzNUkzSGFtUjZmcXZwMEdzMDM3czc5YXJDZlRLcDNMWk5sanA4Y1Ro?=
 =?utf-8?B?WDc3TEZsR2dNTU84SGFzWGtLeTFUV3h1Ty9QWGRLaW5UcFVOcnFyKzByRVE3?=
 =?utf-8?B?eDNVbStING5MeDFPTm5Vbmxic1orakdtdHpYVEpjMXJmSlpXT0hXOG94bTlj?=
 =?utf-8?B?U1Q2clB2anl5QXhNaGhrSFFuRkZrT0ZHcGp1anhHVnc2MWRZQmFwaC94aXpp?=
 =?utf-8?B?elBHK0UzWlhYVHM3eXVqanE3YU8rMGs2dUg3WlEzbHlseGVJR0FyWnBhVHl0?=
 =?utf-8?B?aGtFQlJadUU1cklXQnJ2Z3hGMVRxOGg0ZGV2OFpYNE5qRUJGMHJXMUVwT0FO?=
 =?utf-8?B?aFBJamp3TXVMMXN0N205YTFaTGpIblNtWjFCVFp0Wlo0NTZLQS91UTdyUWZG?=
 =?utf-8?B?Q2JDNWk3UjJaQ1U0L0pTRmtPUWhIVlplbTVld0xwR3dHMkR0dnMzZXBFa1F4?=
 =?utf-8?B?UUd2UDZ1ZlZNTW1rdmZWaU52ekFrSlV6Qk11cFlDcFBuYmdXcG1MWEwvTEVQ?=
 =?utf-8?Q?okKbdHnFs9cyqJy+R9lTJr0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B8C3E558C7EFD4F80B150200B836EDC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5168dc01-7197-4a8d-95ec-08da55a26a38
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 05:28:48.1346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAf9wJ3XF0XYlYez8HQlqBKYw93urNJyQI34kfGMiMJBt5oxYFkJ5VcU/vCUSOQ2PvYOsJv3SFlfs8n5M4nRFkDoTuk+WoGsBw6sAl1Rn7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2882
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-snps
 -arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IFRoaXMganVzdCBjb252ZXJ0cyB0aGUgZ2VuZXJpYyB2bV9nZXRfcGFnZV9wcm90KCkgaW1w
bGVtZW50YXRpb24gaW50byBhIG5ldw0KPiBtYWNybyBpLmUgREVDTEFSRV9WTV9HRVRfUEFHRV9Q
Uk9UIHdoaWNoIGxhdGVyIGNhbiBiZSB1c2VkIGFjcm9zcyBwbGF0Zm9ybXMNCj4gd2hlbiBlbmFi
bGluZyB0aGVtIHdpdGggQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gVGhpcyBkb2VzIG5vdCBj
cmVhdGUgYW55DQo+IGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiANCj4gQ2M6IEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcNCj4g
Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFu
IEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPg0KPiAtLS0NCj4gICBpbmNsdWRl
L2xpbnV4L21tLmggfCA4ICsrKysrKysrDQo+ICAgbW0vbW1hcC5jICAgICAgICAgIHwgNiArLS0t
LS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21t
LmgNCj4gaW5kZXggNDdiZmUwMzhkNDZlLi4yMzc4MjhjMmJhZTIgMTAwNjQ0DQo+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvbW0uaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgNCj4gQEAgLTQyOCw2
ICs0MjgsMTQgQEAgZXh0ZXJuIHVuc2lnbmVkIGludCBrb2Jqc2l6ZShjb25zdCB2b2lkICpvYmpw
KTsNCj4gICBleHRlcm4gcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdOw0KPiAgICNlbmRpZg0K
PiAgIA0KDQpJIHRoaW5rIHRoZSBjb21tZW50IGFib3ZlIHByb3RlY3Rpb25fbWFwWzE2XSBpbiBt
bS9tbWFwLmMgc2hvdWxkIGJlIA0KbW92ZWQgaGVyZS4NCg0KPiArI2RlZmluZSBERUNMQVJFX1ZN
X0dFVF9QQUdFX1BST1QJCQkJCVwNCj4gK3BncHJvdF90IHZtX2dldF9wYWdlX3Byb3QodW5zaWdu
ZWQgbG9uZyB2bV9mbGFncykJCQlcDQo+ICt7CQkJCQkJCQkJXA0KPiArCQlyZXR1cm4gcHJvdGVj
dGlvbl9tYXBbdm1fZmxhZ3MgJgkJCVwNCj4gKwkJCShWTV9SRUFEIHwgVk1fV1JJVEUgfCBWTV9F
WEVDIHwgVk1fU0hBUkVEKV07CVwNCj4gK30JCQkJCQkJCQlcDQo+ICtFWFBPUlRfU1lNQk9MKHZt
X2dldF9wYWdlX3Byb3QpOw0KPiArDQo+ICAgLyoNCj4gICAgKiBUaGUgZGVmYXVsdCBmYXVsdCBm
bGFncyB0aGF0IHNob3VsZCBiZSB1c2VkIGJ5IG1vc3Qgb2YgdGhlDQo+ICAgICogYXJjaC1zcGVj
aWZpYyBwYWdlIGZhdWx0IGhhbmRsZXJzLg0KPiBkaWZmIC0tZ2l0IGEvbW0vbW1hcC5jIGIvbW0v
bW1hcC5jDQo+IGluZGV4IGIwMWYwMjgwYmRhMi4uNTVjMzBhZWUzOTk5IDEwMDY0NA0KPiAtLS0g
YS9tbS9tbWFwLmMNCj4gKysrIGIvbW0vbW1hcC5jDQo+IEBAIC0xMjMsMTEgKzEyMyw3IEBAIHBn
cHJvdF90IHByb3RlY3Rpb25fbWFwWzE2XSBfX3JvX2FmdGVyX2luaXQgPSB7DQo+ICAgI2VuZGlm
DQo+ICAgDQo+ICAgI2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAt
cGdwcm90X3Qgdm1fZ2V0X3BhZ2VfcHJvdCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQ0KPiAtew0K
PiAtCXJldHVybiBwcm90ZWN0aW9uX21hcFt2bV9mbGFncyAmIChWTV9SRUFEfFZNX1dSSVRFfFZN
X0VYRUN8Vk1fU0hBUkVEKV07DQo+IC19DQo+IC1FWFBPUlRfU1lNQk9MKHZtX2dldF9wYWdlX3By
b3QpOw0KPiArREVDTEFSRV9WTV9HRVRfUEFHRV9QUk9UDQo+ICAgI2VuZGlmCS8qIENPTkZJR19B
UkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UICovDQo+ICAgDQo+ICAgc3RhdGljIHBncHJvdF90IHZt
X3BncHJvdF9tb2RpZnkocGdwcm90X3Qgb2xkcHJvdCwgdW5zaWduZWQgbG9uZyB2bV9mbGFncyk=
