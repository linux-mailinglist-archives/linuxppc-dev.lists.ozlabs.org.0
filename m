Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D0A5A4E0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 15:28:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGWTX4d5Pz3c3V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 23:28:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=w4WvPBwa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.51; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=w4WvPBwa;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90051.outbound.protection.outlook.com [40.107.9.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGWSk6VdPz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 23:27:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8fThiXcVZP1ABDvKo4mAcLAccicWTnwSnS+5pznSfxfBv+kUJsVDe/G5Mb9p7a9+9nZjHxELnSayHzTCRNRi/tszRlSSe88QpZ15s89LhptuXqkgWH8KLyznoYan6SDb9NGl+h3c1unyoYqx8fUUwnI+3s81TpaBkahbeKW0LYp6XivKZCzPRUrFLt0vN2HHC6aWFDzC0A0sUuMPuDc9Syilz81LLOIbrHAP65qf7Ix3eYnjeThyAj75rn8XXuqlDk3rQc7SRN7IQOwyCMINK7O3+mIqqZDmE4uRvQNipoqTIDGozKkSxh/BCL9pWzHKlo1CqnPQ1VEfsVaRDjlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEN4rXqKcSq+/Cqvi+J7E0sTmyuLy7mx9R5EdrVTgLk=;
 b=a7Fm8OWQpdXj8S3v4X4AEs3aIVU4yv5FnQlid9nm1UqFI6aZrWpsLbP25ccbWW/NFXavlG+tZYr7HYd8lUFtJn2j7gbbIJ6cp8BulMji4mS5Kdo4O2h9HYh/17vXcWqbXE2t9oXhJQactvjNMCfA96743DIVktOu5T/Mg+uEq07rNYQOhc/BhcoiSuNy3Oy57ITWJq12qHINv+YsX9RPXCDfP6QcjJ9nAQxZaizA0L+gEXnlvMNzeAGQIn+tDDgEZXF8PaDuhAc/r/ClDM0mO9BeqkYe0QUb3+8OmzUcBW9R2Z0B8hEVho2uYOjhv1bB5QRkKqzD23ieM6TyJGxKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEN4rXqKcSq+/Cqvi+J7E0sTmyuLy7mx9R5EdrVTgLk=;
 b=w4WvPBwaI0wcKofqkULThN0qo/QaOwswl1O9YLiLBmD1V0Cr8fgNc6Xe+NythOzMTHDV0UkVHPlcioXeY2qtPjx1EX0WL6UFmTu9hg73/VZikvKQpsY2G56lNV0e5w+D6oeWlHhptg4jjpmy0WHJYCHdjbmMNIxv4dTcI3FyJlhl5tx5Uapvi2Zze7D6xCmpycqW3JD/DD4KhMJ5TImlNkaSAU+M8TQ3nbwFs13JuEbZW2PiR3aWFy6foW7fE2u8zH5mSpvM4i4DYzdwl4hdmqhgdnVHijmeWD4/sNH0jiKPvwZOKuYJRZoq/Z7Pl0ynZ7Z3ySaZwI1qJevvOM99gA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2861.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 13:26:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 13:26:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 02/16] powerpc: override __ALIGN() and __ALIGN_STR()
 macros
Thread-Topic: [PATCH v2 02/16] powerpc: override __ALIGN() and __ALIGN_STR()
 macros
Thread-Index: AQHYu2uTgPRMlUR/bUeV5jK4SV7eUq3F3yyA
Date: Mon, 29 Aug 2022 13:26:56 +0000
Message-ID: <7a56b125-86ec-e78a-9327-b523bc0239cf@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-3-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-3-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3986c1e6-56b8-4f50-66ca-08da89c224f8
x-ms-traffictypediagnostic: PAZP264MB2861:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /YyDqneCdcLZsA7pk4Y6lij0WcV7JGjSXVQYjs1W65Ox7zUunZ8spepTmifyyy3IGmu/qPH12Lp14ohUanFMiYIKVCnb7VRc+iSbQQNoS57Ctq/Vi0zSQ8NAcie+K9eIhtJ9w0SzZ7bof5SFJYvgLCpdaZcr6qQQ29Qt7++CT+EQXFSay9FRdXCpdu/h0HQXG/2o79kIP1hTYR25AVc2dB4q7iSE/+BtNfMpJXgcFQ5BFtJqzLpiFVjURKd4DQOHeYAexVxpggAl3YFjlk/OL4oOA6blT8O+UzvgkI+zNLkGB/IDSG8clEk4GY1givOECh6gddY9d/Giigq1M0MofOhNCpPwwj0kjxz0IEEUGXiwUyYE7p90/N9Jq0TBWbLicf0fi6ikk+iJnDiNdYSmuH6zA6bdQQIkxyzPCbmOjd6x9VWRxtjPyT9XnWnwqptdDdOYtK658UfGJgJzLFiMpXXy+7G73i3bdfMCZiK3xFywTMaexZ2MJvoOV3nE1mlr16LaeeJDeggYyOqxkvcye/9anAqOE9vk8HvaMiUnKAS3cfzspEkP+W/aP7VwYaakrEXqKIcPF1PCeYWOCU1FgK+F/T6WjxQftMLsj35tcy83U/xDAb7ibGKWAt97Jhx25ZKuihCdowmRZEcaaE6zV079t24I7XRxrWVWb8m7PUzJp6UwaqDhnlSZVdLyw0dXumMT12Dlg0C9ur2fU6iz02niZeyUWpK5aX2muYFQVY73i+3QB35OE8uZqS5Lj3eoau/hFrVrjWscJ3eQVyGSfKjeJTrom0b4d35FGCehiGuBU+1r2ve4lQFnW8P4oI5sqwsM9pUFVlzKdFzZOxTE+Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(136003)(39850400004)(346002)(66946007)(76116006)(64756008)(91956017)(44832011)(66446008)(66556008)(66476007)(2906002)(8676002)(31696002)(8936002)(6506007)(6486002)(7416002)(41300700001)(4326008)(5660300002)(2616005)(186003)(83380400001)(66574015)(478600001)(86362001)(6512007)(110136005)(38070700005)(26005)(122000001)(38100700002)(54906003)(71200400001)(316002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UnllVGcxRzFoZGNOcW9PVENVRDQzbzVJcTJ5dzhVSHFaVTcrZmFKaStsKy9j?=
 =?utf-8?B?N2RRWkpSZEpLdlRnOHZpWjVPWm9wZFdWVW84QkFrbmU0TlU4M29hR2lQeE5o?=
 =?utf-8?B?VVVCSFRIbC8ySGRaVDdGemtRUEk3aU5takY2OXhFR24rQ295RG1YNTdUZHdv?=
 =?utf-8?B?MU9sTDhPSTZVUjBsQzIvRVJlMGk5YllRQUlEbHkrSjVTallzRmVvbXRnMklY?=
 =?utf-8?B?TVJoVDRvU0I4SFJDMnBORG42WFAvQ3ptUUJTOWJEa1hZLzRmaVdzOEF5djk2?=
 =?utf-8?B?aDY2UUVDM292WXdkbS9abGk2LzZNWVdZbFAzSDdwbk5jNmtZSkhKb2NwVnAx?=
 =?utf-8?B?T1ZhQ3ZaMUcwMzJod00yeXMxYXoxazk3bGRFMWlEYzZKWjRXSGFJa0s2S09l?=
 =?utf-8?B?SWpGSXhsZVhCazFvTm1OS2t5cGZwTE1OL0J5czZYQm94ejYySHdXOVA5V0N6?=
 =?utf-8?B?QlhPdlJ1SzFLNW5nZCtPZkV6U1QrTG1OMXdIUVRLTEo5RE92b25TMlRYbjYz?=
 =?utf-8?B?TTMxM2ZKYzQwTitPWmxsVFJGUk9RRHV6dURoeVFIcUJZUmlybGxOdkpBV0Zp?=
 =?utf-8?B?NTJ2Y3g0ZDVSTHpHZy81UHVRTWswSUZUdSszUm9FeUloT21QYUpUcDl0SjJp?=
 =?utf-8?B?eGVOYm80WXlvalNpQU9ZOENsSjRqWmNIbWpEajZ3a0R5SE5hL3lCOEpLb2lO?=
 =?utf-8?B?MzJLL25tSG5HUk1qbFZSTjFTMFJQcHpqZ09Va205UGRpOFRUMVNiSlNVN0N2?=
 =?utf-8?B?THVvQjcrUXpkSlY3VFNDYU1CTTJBVTRSOW14WXZTMXNKQ09BZWpvSHJVandn?=
 =?utf-8?B?cHh5WjY4U1VUdXgrOWlPRFZoT09vbzBLd1Vnai9YVFZJNWpPQXNYdE5sTWlL?=
 =?utf-8?B?OVphekpWTnA1bVNUZ2xJa0ROejhiQjBQY2ZJa0l6MklzUXlnZjlIL01JWUdJ?=
 =?utf-8?B?RFhqOUlYTTQxeUQyWW5qY01qUG9Gb3ord2VjZ2NOQlhrL00wKzF4WGNNelVR?=
 =?utf-8?B?cWVMNG5LVytPNmNaT3VtVW11eTk0aWxBelE0S1pBQm9uTmtaRkovNDNMd1dr?=
 =?utf-8?B?eElpcE5EM3pmVUFycjFjdkZ4K0tYd29venJ0WUZQc2N0WDVBcWZtV2d4S1o4?=
 =?utf-8?B?S3ozQUtlRDVCWGdYTlhwMk9wZkRMUnFWTjlSTWJMY0RwVFJKSVp3STRReldq?=
 =?utf-8?B?NHpsQVVrZzJCSWc5dkNacnVqcEt5bWJEbDVYak9DVUdNc3NRQWIyWTU1L0o5?=
 =?utf-8?B?d2ExRFVaTXdUY2txZVR0ZkRKdmdBS2h0TkNXa0ZHcll0RS94aDM2Szh2MmFj?=
 =?utf-8?B?WElJa3lTN2VaOFJiOHJiUWZXTTZMclhsaHdTaVY0RTJVbTBKMW5DcFpPaUdq?=
 =?utf-8?B?V0NkTU4ySVVVQXVwN2tSTng0M1BabEcvcmFuTlg4WWtKbzdwb0VCQVVIdkRr?=
 =?utf-8?B?L0JhcjNJaDc5d0ExQW42VGJuclFqZFJnSzlsOS9saHRwaWhJMVpVZm1ZV1BB?=
 =?utf-8?B?K3R1VTA4OVZJaHlGdWIrTmx1bHpjMSsvRzFIWUlrSnNTZ08zT2tVYzFlTHB6?=
 =?utf-8?B?cHc2V0x1OG9VUkFwaXAzUk5IbDVuMzdrVGdVUDZjLzJFeTFwL1ZDMkJOVjZD?=
 =?utf-8?B?a2FtYkNibUpyQ0Y1VG1va3JNaHkvUENza3RaZ3VycTNkaEVRVjdTQ1I3Yk1p?=
 =?utf-8?B?cHNZTGdDeTdpTitWbXBlUEROVW42VkxVdE9KT0ttUDA0YUVjeUp3SkEvSkQ5?=
 =?utf-8?B?RjJJd1lmZGJPQ0MxbWVkclZaNUk4aFVjZTBNc0UyN0xjbWVkTzJlTTRVUmd4?=
 =?utf-8?B?M0F2V0JwWlp2UjA3bTBWMW42S3VZVEhLRW5wRFpvWDhDS3A4SG15R3Z1WHFQ?=
 =?utf-8?B?bWNkUU1zZHFXbWpFSVZlMHNwT3FzbS9mUnFOQUdLYlluYVpRcDVnMWU4UW0v?=
 =?utf-8?B?c3BkU2JueVZzUk14ZFhCK0xXVStjTFMrSDMzRXhUQ2JtbjJjYVVsd2J4VFZn?=
 =?utf-8?B?ME84Ui9jNGlQRGREL0xTU1ZlSjJIZEFidExhQ21BT2N1TUlIVWxLSGNZSTRP?=
 =?utf-8?B?Ri9JL05vSXRYMUdqMVV5OXBxVlFrTURFQmdQMU13M2RWT3diUlErbXFKbUo4?=
 =?utf-8?B?L1N0U1J0dTNLYlVIRkx5OFp2cmNaaktiZ1FHTVVwYVVIbi9LR3ZYRzY1bGFP?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40CC14ACB0313644AC18224BE877F59B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3986c1e6-56b8-4f50-66ca-08da89c224f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 13:26:56.2797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nKu3nNiDoxNlavxyX9d4PYv5zZ0NM5zFQNGWarsdYPwHBrx3sO4jGCpmhMLjStALg8h8JSKNp9dzvkW1Bt7ozFhzefC2TVcYWQALykvu3Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2861
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDc6NTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBQb3dlcnBjIGluc3RydWN0aW9ucyBtdXN0IGJlIHdvcmQtYWxpZ25lZC4gQ3VycmVudGx5
LA0KPiB0aGVyZSBpcyBhbiBhbGlnbm1lbnQgb2YgMTYgYnl0ZXMgKGJ5IGRlZmF1bHQpLCBhbmQg
aXQgaXMNCj4gbXVjaCBtb3JlIHRoYW4gd2hhdCBpcyByZXF1aXJlZCBmb3IgcG93ZXJwYyAoNCBi
eXRlcykuDQo+IA0KPiBUaGUgZGVmYXVsdCBleHBhbnNpb24gb2YgX19BTElHTigpIG1hY3JvIGlz
Og0KPiAjZGVmaW5lIF9fQUxJR04gICAgICAgLmFsaWduIDQsMHg5MA0KPiANCj4gU2luY2UgUG93
ZXJwYyBMaW51eCBkb2VzIG5vdCByZXF1aXJlIGEgMTYgYnl0ZSBhbGlnbm1lbnQsDQo+IG92ZXJy
aWRlIF9fQUxJR04oKSBhbmQgX19BTElHTl9TVFIoKSBtYWNyb3MgdG8gdXNlIHJlcXVpcmVkDQo+
IDQgYnl0ZSBhbGlnbm1lbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYXRodmlrYSBWYXNpcmVk
ZHkgPHN2QGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9saW5rYWdlLmggfCA0ICsrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2xpbmthZ2UuaCBi
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9saW5rYWdlLmgNCj4gaW5kZXggYjcxYjk1ODJlNzU0
Li44ZGY4OGZlNjE0MzggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9s
aW5rYWdlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2xpbmthZ2UuaA0KPiBA
QCAtMiw4ICsyLDEyIEBADQo+ICAgI2lmbmRlZiBfQVNNX1BPV0VSUENfTElOS0FHRV9IDQo+ICAg
I2RlZmluZSBfQVNNX1BPV0VSUENfTElOS0FHRV9IDQo+ICAgDQo+ICsjaW5jbHVkZSA8bGludXgv
c3RyaW5naWZ5Lmg+DQo+ICAgI2luY2x1ZGUgPGFzbS90eXBlcy5oPg0KPiAgIA0KPiArI2RlZmlu
ZSBfX0FMSUdOCQkJLmFsaWduIDINCj4gKyNkZWZpbmUgX19BTElHTl9TVFIJCV9fc3RyaW5naWZ5
KF9fQUxJR04pDQo+ICsNCg0KSSBzdGlsbCBjYW4ndCBzZWUgdGhlIGFkZGVkIHZhbHVlIG9mIHVz
aW5nIF9fc3RyaW5naWZ5KCkgbWFjcm8gaGVyZS4gSW4gDQpvcmRlciB0byB1c2UgdGhhdCBtYWNy
byB5b3UgaGF2ZSB0byBpbmNsdWRlIGxpbnV4L3N0cmluZ2lmeS5oIC4gVXN1YWxseSANCndlIHRy
eSB0byBtaW5pbWlzZSB0aGUgYW1vdW50IG9mIGhlYWRlcnMgcmVxdWlyZWQgYnkgb3RoZXIgaGVh
ZGVycy4NCg0KPiAgICNpZmRlZiBDT05GSUdfUFBDNjRfRUxGX0FCSV9WMQ0KPiAgICNkZWZpbmUg
Y29uZF9zeXNjYWxsKHgpIFwNCj4gICAJYXNtICgiXHQud2VhayAiICN4ICJcblx0LnNldCAiICN4
ICIsIHN5c19uaV9zeXNjYWxsXG4iCQlc
