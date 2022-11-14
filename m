Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD93627651
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 08:19:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9gfs1m3Zz3cHY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 18:19:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=b+haXvwx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.59; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=b+haXvwx;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90059.outbound.protection.outlook.com [40.107.9.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9gdr4Hfcz2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 18:18:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYDDO4P0DDBGwKgLi+vYF5wdSg8mCp3Qg9CCnF2U/VFRyb/4pVAY5X7rkazVcv3SZAxOUkBHO8UKT8BHFfCw6eHp4BYAN04vKG4loa0h6CBDNNTDII/CMTSsbBQ8g8E/ZixWGd9kSn+vDWCnXzlNgobXpCv1z6gLrOo2yQDz1WTLT8dIO6B9BvIHcn9EAcslan2NhZ12JCq26HQqzhlDiM73ADJcK2gOyKhopV6c/ohzeROA/I2PIx6oIaNzdDsQTHCUPk1ArYYOYJU6th3pd6BPBd6DaDuez9nZW7imDmGVE0OJKhYz/ageYl9Vtv0hhDipqdq6tE98pq1QedfF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLBh/4bjado1+2fUI5AbES2IDADLyixGWVyZD/ySN7M=;
 b=GmcP2dvjLievEznCe7CJX+SkN7P+sZZY2YmP3RC0vDCwH1ITYtP4iJLBH9TdtOrstZ8O3OSJ5H9XzVGKtsBKn41Ab/wLLLpBzm4d/moknFILU/hJ/F2N+yGABzpK69yauapjUcY/BVih8C/MjU74HdfG+ftAIRUwExPkJBfnWacVq8+tFcMc8YJ2ANI9DdXFuEB9lArOG9ZPVrtXKMU44CPzbiuqQHa/x70sqHita4x7e7xXO0T7RdD02/UEPPsO773tHxFePTSCS/rxaB5NcDQ1ktumiN5ZwI0JPqG1MDNjI2GxBgOia7QzbyzWqOIExFvwjtZSM64T5pA/LzJtKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLBh/4bjado1+2fUI5AbES2IDADLyixGWVyZD/ySN7M=;
 b=b+haXvwxjsclNiw57N4eiQnMq5BilA9or48Kq6yn9RnTNBoNDqu13Xqxl1I84YfyXeF4OwyeVoThWO1qbYWDTH4D2qUxtWYt710aSYWrI8a1kvW7bQtnYMJ8urq6VqKMisi8Zk8IqSJuAVsL4dq7BDL1lOy33lmEcAIow2Ed5DsPOIrWQD2SfNmIUJaaMw8ZKWtXMHFaXihg2MwD2vd9y3/DpAmuOz76Rv4fl+QyGFk1nVQ2YRo+g2w99v7g+oMoOt/7rgYeabX0BIR3CYI275kSf6gnOu/zKHxDD5P2z5M3GTCXzWMrKO2s5dvZkkg077UaNT4mUQ/jHu1MeAELBg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1521.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 07:18:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 07:18:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "yang.yang29@zte.com.cn" <yang.yang29@zte.com.cn>, "tyreld@linux.ibm.com"
	<tyreld@linux.ibm.com>
Subject: Re: [PATCH linux next v2] scsi: ibmvfc: use sysfs_emit() to instead
 of scnprintf()
Thread-Topic: [PATCH linux next v2] scsi: ibmvfc: use sysfs_emit() to instead
 of scnprintf()
Thread-Index: AQHY99qU61sgNRAiMEaYuxh9yzaR3K4+AtQA
Date: Mon, 14 Nov 2022 07:18:18 +0000
Message-ID: <b6d8577f-cabf-797d-69d9-68664dd6d56b@csgroup.eu>
References: <202211141138288877199@zte.com.cn>
In-Reply-To: <202211141138288877199@zte.com.cn>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1521:EE_
x-ms-office365-filtering-correlation-id: 1f1e21a7-73d1-45e9-a9df-08dac61067b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3lp/1HsBRFdmtrHLYVfXhgytQfS9ED+YsAQ5TvR1jtMtDcTHrUNBdK0wP6FWUVY8AU6DjKqe48DAwDjcRhyty68OAYOiRHxV0qqHDP8ZX6BhAj6Kyg1V8VmjMgZwUeGi+c4mbCL3iymEib/vMVrqK32OjKgfWnVIRaquEtXolYm8eP9PpqPNLgyvS182zX3xP4XR86Yj5D/gCBUuoPous1CkEMCN73qQALA4Z4H7HqNpt/HB19g6fKlPAMjzu+QdpHjbEn2shU9EdoTfrDNv4o/oTOcfhmK87x6FiIIWbWg7GqCQgnEZ3NQuIrgCm8m50OPwJhiAKhYDGU/QdXqnuUARX2MVGNwv3lpvSnMdfJtQl0nwuU//qsrZicdieqPXuePSRhXF8+KLiB5XejSAhO5v3N+apTMEtoxMpBNnpW2fYwzNdzGTkf1sZxawY0xsl4BhPL+7Z75FQ6q+1CaHHxm6MoJ1otXVaiSRxVUXxzSwJa/mPuEio9mnj0VmY5CAzEUep2i5AFxaEyGqXXFDkG2B9NbV21I661i8zqwylZIQiMnUjcqlpBTUPcTCgknUhvvxuJNJ+LqKB9bDK/4rNv27waShRHlGMz74iPFJ0s3a4Nqb82Md8NoZMTtVYNo+C8sZqu7qg1UyctHiIDx4MhgkfU7EA7CXp+opsBSTZ53/Wcp8jTRjLXC1i+snc+ci1mV3To2QAWIrFAFDV2C83aIB5sMZKeEosHNqhU1uEzt2sYibbNcsxDj4g9gXF6l1XiqXYlPJqJOk5Q5bBe83aCmK3TFM6bXQ+qSmAd1BZ764+zxvVNil16uY3pB0fvyJmbQXnKqMjERKrQ/6OoqHdA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39850400004)(366004)(346002)(451199015)(31686004)(66946007)(8936002)(36756003)(6506007)(86362001)(38070700005)(31696002)(2616005)(38100700002)(122000001)(41300700001)(2906002)(71200400001)(66574015)(83380400001)(7416002)(44832011)(5660300002)(26005)(6512007)(966005)(186003)(8676002)(6486002)(66556008)(4326008)(478600001)(110136005)(91956017)(64756008)(316002)(54906003)(66446008)(76116006)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aExwbTVCRUJXWDlnY2Nrc05YMG9Gc1V4YXlPbTZDdnNjWmN4L3BDRk1IVEt2?=
 =?utf-8?B?NWwxK1lUQlkraVVsYXlZRlJta3RYU3ZKWUdYVkttWWwxSU5oN2t2bDBjSEhu?=
 =?utf-8?B?M1h0aDhUenFsNCtsb2hEbHlTTG1DNE5KdnB2d053SkZvSmRyOTZhcDFFbzRQ?=
 =?utf-8?B?MHJzNWVwYzVmc1V4Q2o4Y3pNamZVSjVlOVpwRUFmUS9pUDg1TnVKVTNBUWZo?=
 =?utf-8?B?TlJzdFZDN3E4ME95cit4WVhPMTlna0ptektXMGxPQkM0b013KzVFVzVCYTR1?=
 =?utf-8?B?RE01MW9rZ1pzVUdFd2hsSmdYZ1d1QmVuY1B4Y1NGdnovNWxIdTBGcGFEWHU3?=
 =?utf-8?B?SjBubFMrbmZOa21FaG9wS2V2c2E3MTF3emhQWWV0dkppVmVZcVJtSnNaOWNK?=
 =?utf-8?B?L1laRWpxU1pZNllLSUxVSGZFcng3ZFJNUk9GbGdoYUpodXU1WmRtMERYalk1?=
 =?utf-8?B?TWtUQUVnRGRzVGVSY0tWWkNTTWhtSGErQ1RZazI3eUwzMVZmblAxWkJUOFly?=
 =?utf-8?B?NGNRbnVkSG15NHNpbGdIQzdEaWZ5NlVkdlBTYzNzU3gwQVZXWVY3bTR3M1Rj?=
 =?utf-8?B?SDVxb0FXQXdiekxhYk14WjhmaU14K0xJdWl1ZW9hUVRhUjNsaVQwbnIvMUxy?=
 =?utf-8?B?TVJON1N3cnFMMHlQdjQ3cDRFTWR2V0xJOE0zVHNJL2JjY3o2ZnQxdlRCNUdV?=
 =?utf-8?B?bUJhWHRNNzMrdlFHYUdpU1FXMVM0cFNyT3IzWXVnSGRUSW00a0M2L0dBdGJT?=
 =?utf-8?B?YUg2NHRpT242UzF2aDB5UFVkb2plSHdEVzh1R2NGKyszbG9ta241TTNVKysx?=
 =?utf-8?B?MmRvN2cyVlRxK2s4dkNxWkw0c1JyYVhJZlhtd0k4NGxYSnFpNTZBdktaRS9W?=
 =?utf-8?B?SGtQQm9GUisvL1loRk9GZ2paUFNhMXU3SldwZkM0N0hhZWpRcUk3bDJtY29N?=
 =?utf-8?B?RjBOR3RKc3k0ZkJuVXdTOENkdTFWWGk0bTljRGMyK0VVcmhkQ2FnQnVBM3Nw?=
 =?utf-8?B?aUgzY3RqWi93VzhHVHJPNFdzNGc1clFqc2JtRnltL056cm9melF3NitNVWJh?=
 =?utf-8?B?NWVUaTVlcDFCTkMyQ2xxd2ttKzNkMEY4bCthMGFXbmYvSGRKOCtVN3JwRkhD?=
 =?utf-8?B?Rk85Q1RMVTNTQ0N5YWhVWW5PcmlBVWdqNnpYQkpOT3RxQjI4VFg5YUtMd29a?=
 =?utf-8?B?ZzREb2RVWHI1bHZiaFNYVy8xZjN2d0xLRURCYnA5T1FKa2dIZ1I2NDVINDRU?=
 =?utf-8?B?OUNjdG8yYmdMcGFmSXppMkM2NTBUU3FVWHAyTDhvQTgrRXR2dHo5bmo1eXpE?=
 =?utf-8?B?dmdwZVdVdXBoK3d6NDR6NHpXelVDN1dMRTRmdEUwNnJDUFVEQUhuOEhRS0M3?=
 =?utf-8?B?WnpDakRYYklRQTgrYW9IdHNNK0tJSDZuSDFqcEtuaWk2aDdXMmMrN2F4Q3Qy?=
 =?utf-8?B?MVpDV25NeEpia2I5ZlRnUVpPRmI5RkVUUWVhRTBKY3JCVEtmRVJ2Vm4wc3dH?=
 =?utf-8?B?Q1ZrSWxRQ2VGMG5zTnpQaTE3blVieXRTK0hUbUtHZTRkVWowdjRyRERrMThT?=
 =?utf-8?B?MmdaU01naWVhUkxySkZJZC9KaDBsZi9QMXJsd0ZNa0ZhTUpvWndxRnFEYity?=
 =?utf-8?B?RnMvRGJZTTdDdXoxUDRFY2Y5ZkdNQUdYODJyYVRXajNNRzVFM3R1NWMvZWdk?=
 =?utf-8?B?NjdwbUVoQk01Wmt4ZHhobGxqb0w2UHJsTklkbUJXRDBoaFhGclJLWXBUdGps?=
 =?utf-8?B?RWYyZXY1M3RHWkdCa3J3eTkra2N2QTg2NmN0MGVaWnpGTUVhY0d1bWJGZUdq?=
 =?utf-8?B?SVo4Vm5pZy8zRHRtU0RqU1Z6ZW1WbDRwS1NJQVJpOXpiSmpvRkkrcGlDcmRK?=
 =?utf-8?B?Q0VVUEcxVFhnNVMrYVhTSU80a0E3N1dMaXBwbTJ5TDhWWld4YmdiR2wzL3Nw?=
 =?utf-8?B?Zm9MamFsbm5TNTdlUGpCN0xtdTNubDJWR3JuSXVZQW0yZnRyNE53UVpSYU9Q?=
 =?utf-8?B?d2tEZ04yTFRWVmdoS1BnRThWd1JoT2Q2TFBPZ2FRZGdOQ1lkaU93cEJ1Skwz?=
 =?utf-8?B?Skp4VitVNjRDOTlpek1EMDYyajc3cTM1UGQrZGxXR28zcERkcmtrbmVRQTdR?=
 =?utf-8?B?ODhSSHpxWUxqWjczN0pTWElMbDQ1UlVaRVhmUURDWkZzOUJFNHJvTXBlN2dn?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6B7A0CAA200494AA1FA7B8DFFA01D93@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1e21a7-73d1-45e9-a9df-08dac61067b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 07:18:18.7598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TVol8gntex1OZ1ZnDy1oLw+PbhsPY14M7s6AsPc+PEsevnpHz92TcSizzwnkQtE9K4gezrVQl1c6BXjbEpco6W3ozOPpBc+Ra6lh8fDQUk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1521
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "xu.panda@zte.com.cn" <xu.panda@zte.com.cn>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzExLzIwMjIgw6AgMDQ6MzgsIHlhbmcueWFuZzI5QHp0ZS5jb20uY24gYSDDqWNy
aXTCoDoNCj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgeWFu
Zy55YW5nMjlAenRlLmNvbS5jbi4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRh
bnQgw6AgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4g
DQo+IEZyb206IFh1IFBhbmRhIDx4dS5wYW5kYUB6dGUuY29tLmNuPg0KPiANCj4gUmVwbGFjZSB0
aGUgb3Blbi1jb2RlIHdpdGggc3lzZnNfZW1pdCgpIHRvIHNpbXBsaWZ5IHRoZSBjb2RlLg0KPiAN
Cj4gLS0tDQo+IGNoYW5nZSBmb3IgdjINCj4gICAtIGFsaWduIGNvZGUNCj4gLS0tDQo+IFNpZ25l
ZC1vZmYtYnk6IFh1IFBhbmRhIDx4dS5wYW5kYUB6dGUuY29tLmNuPg0KPiBTaWduZWQtb2ZmLWJ5
OiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5QHp0ZS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3Rv
cGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgZHJp
dmVycy9zY3NpL2libXZzY3NpL2libXZmYy5jIHwgMjAgKysrKysrKystLS0tLS0tLS0tLS0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvaWJtdnNjc2kvaWJtdmZjLmMgYi9kcml2ZXJzL3Nj
c2kvaWJtdnNjc2kvaWJtdmZjLmMNCj4gaW5kZXggMWEwYzBiNzI4OWQyLi44NDFlNDdjOTRiMTIg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc2NzaS9pYm12c2NzaS9pYm12ZmMuYw0KPiArKysgYi9k
cml2ZXJzL3Njc2kvaWJtdnNjc2kvaWJtdmZjLmMNCj4gQEAgLTM0MTEsOCArMzQxMSw3IEBAIHN0
YXRpYyBzc2l6ZV90IGlibXZmY19zaG93X2hvc3RfcGFydGl0aW9uX25hbWUoc3RydWN0IGRldmlj
ZSAqZGV2LA0KPiAgICAgICAgICBzdHJ1Y3QgU2NzaV9Ib3N0ICpzaG9zdCA9IGNsYXNzX3RvX3No
b3N0KGRldik7DQo+ICAgICAgICAgIHN0cnVjdCBpYm12ZmNfaG9zdCAqdmhvc3QgPSBzaG9zdF9w
cml2KHNob3N0KTsNCj4gDQo+IC0gICAgICAgcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpF
LCAiJXNcbiIsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHZob3N0LT5sb2dpbl9idWYtPnJl
c3AucGFydGl0aW9uX25hbWUpOw0KPiArICAgICAgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVz
XG4iLCB2aG9zdC0+bG9naW5fYnVmLT5yZXNwLnBhcnRpdGlvbl9uYW1lKTsNCj4gICB9DQo+IA0K
PiAgIHN0YXRpYyBzc2l6ZV90IGlibXZmY19zaG93X2hvc3RfZGV2aWNlX25hbWUoc3RydWN0IGRl
dmljZSAqZGV2LA0KPiBAQCAtMzQyMSw4ICszNDIwLDcgQEAgc3RhdGljIHNzaXplX3QgaWJtdmZj
X3Nob3dfaG9zdF9kZXZpY2VfbmFtZShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAgICAgICAgIHN0
cnVjdCBTY3NpX0hvc3QgKnNob3N0ID0gY2xhc3NfdG9fc2hvc3QoZGV2KTsNCj4gICAgICAgICAg
c3RydWN0IGlibXZmY19ob3N0ICp2aG9zdCA9IHNob3N0X3ByaXYoc2hvc3QpOw0KPiANCj4gLSAg
ICAgICByZXR1cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIlc1xuIiwNCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgdmhvc3QtPmxvZ2luX2J1Zi0+cmVzcC5kZXZpY2VfbmFtZSk7DQo+ICsg
ICAgICAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXNcbiIsIHZob3N0LT5sb2dpbl9idWYtPnJl
c3AuZGV2aWNlX25hbWUpOw0KPiAgIH0NCj4gDQo+ICAgc3RhdGljIHNzaXplX3QgaWJtdmZjX3No
b3dfaG9zdF9sb2NfY29kZShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IEBAIC0zNDMxLDggKzM0Mjks
NyBAQCBzdGF0aWMgc3NpemVfdCBpYm12ZmNfc2hvd19ob3N0X2xvY19jb2RlKHN0cnVjdCBkZXZp
Y2UgKmRldiwNCj4gICAgICAgICAgc3RydWN0IFNjc2lfSG9zdCAqc2hvc3QgPSBjbGFzc190b19z
aG9zdChkZXYpOw0KPiAgICAgICAgICBzdHJ1Y3QgaWJtdmZjX2hvc3QgKnZob3N0ID0gc2hvc3Rf
cHJpdihzaG9zdCk7DQo+IA0KPiAtICAgICAgIHJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0la
RSwgIiVzXG4iLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICB2aG9zdC0+bG9naW5fYnVmLT5y
ZXNwLnBvcnRfbG9jX2NvZGUpOw0KPiArICAgICAgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVz
XG4iLCB2aG9zdC0+bG9naW5fYnVmLT5yZXNwLnBvcnRfbG9jX2NvZGUpOw0KPiAgIH0NCj4gDQo+
ICAgc3RhdGljIHNzaXplX3QgaWJtdmZjX3Nob3dfaG9zdF9kcmNfbmFtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsDQo+IEBAIC0zNDQxLDggKzM0MzgsNyBAQCBzdGF0aWMgc3NpemVfdCBpYm12ZmNfc2hv
d19ob3N0X2RyY19uYW1lKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gICAgICAgICAgc3RydWN0IFNj
c2lfSG9zdCAqc2hvc3QgPSBjbGFzc190b19zaG9zdChkZXYpOw0KPiAgICAgICAgICBzdHJ1Y3Qg
aWJtdmZjX2hvc3QgKnZob3N0ID0gc2hvc3RfcHJpdihzaG9zdCk7DQo+IA0KPiAtICAgICAgIHJl
dHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiVzXG4iLA0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICB2aG9zdC0+bG9naW5fYnVmLT5yZXNwLmRyY19uYW1lKTsNCj4gKyAgICAgICByZXR1
cm4gc3lzZnNfZW1pdChidWYsICIlc1xuIiwgdmhvc3QtPmxvZ2luX2J1Zi0+cmVzcC5kcmNfbmFt
ZSk7DQo+ICAgfQ0KPiANCj4gICBzdGF0aWMgc3NpemVfdCBpYm12ZmNfc2hvd19ob3N0X25waXZf
dmVyc2lvbihzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IEBAIC0zNDUwLDcgKzM0NDYsNyBAQCBzdGF0
aWMgc3NpemVfdCBpYm12ZmNfc2hvd19ob3N0X25waXZfdmVyc2lvbihzdHJ1Y3QgZGV2aWNlICpk
ZXYsDQo+ICAgew0KPiAgICAgICAgICBzdHJ1Y3QgU2NzaV9Ib3N0ICpzaG9zdCA9IGNsYXNzX3Rv
X3Nob3N0KGRldik7DQo+ICAgICAgICAgIHN0cnVjdCBpYm12ZmNfaG9zdCAqdmhvc3QgPSBzaG9z
dF9wcml2KHNob3N0KTsNCj4gLSAgICAgICByZXR1cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUs
ICIlZFxuIiwgYmUzMl90b19jcHUodmhvc3QtPmxvZ2luX2J1Zi0+cmVzcC52ZXJzaW9uKSk7DQo+
ICsgICAgICAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJWRcbiIsIGJlMzJfdG9fY3B1KHZob3N0
LT5sb2dpbl9idWYtPnJlc3AudmVyc2lvbikpOw0KPiAgIH0NCj4gDQo+ICAgc3RhdGljIHNzaXpl
X3QgaWJtdmZjX3Nob3dfaG9zdF9jYXBhYmlsaXRpZXMoc3RydWN0IGRldmljZSAqZGV2LA0KPiBA
QCAtMzQ1OCw3ICszNDU0LDcgQEAgc3RhdGljIHNzaXplX3QgaWJtdmZjX3Nob3dfaG9zdF9jYXBh
YmlsaXRpZXMoc3RydWN0IGRldmljZSAqZGV2LA0KPiAgIHsNCj4gICAgICAgICAgc3RydWN0IFNj
c2lfSG9zdCAqc2hvc3QgPSBjbGFzc190b19zaG9zdChkZXYpOw0KPiAgICAgICAgICBzdHJ1Y3Qg
aWJtdmZjX2hvc3QgKnZob3N0ID0gc2hvc3RfcHJpdihzaG9zdCk7DQo+IC0gICAgICAgcmV0dXJu
IHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJWxseFxuIiwgYmU2NF90b19jcHUodmhvc3QtPmxv
Z2luX2J1Zi0+cmVzcC5jYXBhYmlsaXRpZXMpKTsNCj4gKyAgICAgICByZXR1cm4gc3lzZnNfZW1p
dChidWYsICIlbGx4XG4iLCBiZTY0X3RvX2NwdSh2aG9zdC0+bG9naW5fYnVmLT5yZXNwLmNhcGFi
aWxpdGllcykpOw0KPiAgIH0NCj4gDQo+ICAgLyoqDQo+IEBAIC0zNDc5LDcgKzM0NzUsNyBAQCBz
dGF0aWMgc3NpemVfdCBpYm12ZmNfc2hvd19sb2dfbGV2ZWwoc3RydWN0IGRldmljZSAqZGV2LA0K
PiAgICAgICAgICBpbnQgbGVuOw0KPiANCj4gICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoc2hv
c3QtPmhvc3RfbG9jaywgZmxhZ3MpOw0KPiAtICAgICAgIGxlbiA9IHNucHJpbnRmKGJ1ZiwgUEFH
RV9TSVpFLCAiJWRcbiIsIHZob3N0LT5sb2dfbGV2ZWwpOw0KPiArICAgICAgIGxlbiA9IHN5c2Zz
X2VtaXQoYnVmLCAiJWRcbiIsIHZob3N0LT5sb2dfbGV2ZWwpOw0KPiAgICAgICAgICBzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKHNob3N0LT5ob3N0X2xvY2ssIGZsYWdzKTsNCj4gICAgICAgICAgcmV0
dXJuIGxlbjsNCj4gICB9DQo+IEBAIC0zNTE3LDcgKzM1MTMsNyBAQCBzdGF0aWMgc3NpemVfdCBp
Ym12ZmNfc2hvd19zY3NpX2NoYW5uZWxzKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gICAgICAgICAg
aW50IGxlbjsNCj4gDQo+ICAgICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKHNob3N0LT5ob3N0X2xv
Y2ssIGZsYWdzKTsNCj4gLSAgICAgICBsZW4gPSBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiVk
XG4iLCB2aG9zdC0+Y2xpZW50X3Njc2lfY2hhbm5lbHMpOw0KPiArICAgICAgIGxlbiA9IHN5c2Zz
X2VtaXQoYnVmLCAiJWRcbiIsIHZob3N0LT5jbGllbnRfc2NzaV9jaGFubmVscyk7DQo+ICAgICAg
ICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoc2hvc3QtPmhvc3RfbG9jaywgZmxhZ3MpOw0KPiAg
ICAgICAgICByZXR1cm4gbGVuOw0KPiAgIH0NCj4gLS0NCj4gMi4xNS4yDQo=
