Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCD780425E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 00:06:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Pn4H3OeC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkfRz1vvsz3cWW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 10:06:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Pn4H3OeC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkfR1622kz3cP5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 10:05:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVlLtgidxiXVfu53OiD49hQq/bkYsMzMrAcx1WRsma/n/VwVbyXUSM2hZgisWNMHUcjoaLvru61zLnE6p3/tIazIZiTpiB991O98zOfWDqNhJURdtSWSHbu0M6N3rKMmhl2zlpY0MvNuv2SbQa6J/pjHLD6LKfZYqOS92ViClnq1kCXfbTU0ftx7CSdzuyl5HVWcuIs3qqUhPKlh0BQofCe+mjzCfBLqwe/ehlNR47iFUL9EkfEjXXZoZw91KR3FxA9k2dC1DvMrLP4oRF+54U80LmUN0aaelTmy9oRDZQOIXv5GYATUtQDdDL7YezNi0sqoP5cH/2G56LsZFOS1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVbOjWIr7mKkX013IPvQAwpO8ujHo1DFyhqAw85+CKU=;
 b=YEl6yPlRphvS7kuWbiktU4vMAx/t+Akm/X+5AQbta/Sqd3XjXehyN5SeMoATReyrRRVe6IKIwXHESxQ4LopAXmUVB+6dYY+oQHvLoheiS9HaqE/4Y2DlnsFNA1L+javmqAtPyMk1B3YZ1h4cUwJK/UwHSlH9Tj8KYLYUvyJsMUVCjXRxdTG4Zk5Ez1sLPOfnnjIKue3AdVekUcrIyeRt62FuuQrcLZo3+CRM4X85LY+2L+99XtEAZ5AFCWS08DhLUzS+nbVy9HiNJ3rmrRpEH/bMy2G0sHyswnksHUYjRzJNBUxt24ptmEbVF9Lty+VsmV84Estahvo66H+7tpSrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVbOjWIr7mKkX013IPvQAwpO8ujHo1DFyhqAw85+CKU=;
 b=Pn4H3OeC9fb1I7N6cB+rvqDeeug2QFHT8PPE1upLARSYrnPw6AF521H+U5NTr3k0J5h388NPdvTxK+P1aKxjBZEmql6iPMVAfBuoZJaYZufJakl/s12x1J6Kq4bTGoYWqLGEI3cGC2t69hGoUwH9c9ZHnFN1cEtJAan2fJmVaUyld3km69Cv2yg/jTfat682aXn0+QXDnjMFu6oyhR0EnSdBXYQycDEb8n0QBM48gLUWFiROz3WfAS7jZF5GzFES/4YbHL22IkAkx6OxrqPU707jnJeZgTIFYzWpiQIiWC17VJR8hvJMMZjS1gpK4Ny5wWYH1VqBw8pTmO7OZXytiA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1655.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.23; Mon, 4 Dec
 2023 23:05:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 23:05:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"lee@kernel.org" <lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "jic23@kernel.org"
	<jic23@kernel.org>
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Topic: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Thread-Index: AQHaJty3lcbSNrP0Vk6nW4+1IjDYxbCZvv6A
Date: Mon, 4 Dec 2023 23:05:25 +0000
Message-ID: <1ade7e1e-f310-4b2b-b6b9-22065080a344@csgroup.eu>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
In-Reply-To: <20231204180603.470421-2-gnstark@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1655:EE_
x-ms-office365-filtering-correlation-id: 36ce7e6f-cd0b-44fc-6d2c-08dbf51d8028
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HD9e0kUn00bz/5cJiOmTpbvfW8p+L84+/8hk8J2MkHPVTnRp0ZU08YpgP6ukOO7cpe0D2QQiRUKnMBaGvuEHGXwUYPA0nbmDFIXpCJsdpZTnsfk+34Rwc8ME/jVPsJI6ZPsQixDxgOsIsSj/VxBieCRRyhUkb+DQwlSUwkWj7SFNIIUZrdqKlUKHNYV16iteSF1v+1hXqCKfp6jmETZOP13ssnuey3PjISJHPT8D37Pq79Bg4uilFDJjFLLjTWsNq2KJ2bBxLze4q1JUVrUbtSX9sdFemKAJqwGaQ88J5gjvkDvmA5WynCmzmtFWaapuS7vE3UK9Z4SDIDudQ/apmntyZ/E2kGq1QcpqnDISZMD34PYriYQt2DgpRaKsqLsfhvCdEMYunXd0H5boXa0FRb9kki8BUotoG1xttnAYhkItKwI+CR2bgS08a07ClvFarvQIpya1YnKmyf1hCu6Mc6GrQd/RijC2pPsNEsuJHd21bV71qBNCcw9U+3NOlvTO9BZ+LUWDAYNf73fpqIc8aN/Jr3mdxxh8z3oiXSNmKbktNh9NHaHXyKnV/KcCJ03/x5VtinFELqOHBzwrJrMRrdJ24G2X+o+Rbai4qw7SRFutZwEDoqM9NnQF/97xhqrcyIuZaIaLsTFbkyxNyk6+xho46BMwOfScjpaWJ/GjKOJS9J64K8OHWDPmYY+ITX9eXaryjHw48+b8kNXu5P2E7A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(91956017)(44832011)(66476007)(66556008)(8936002)(66946007)(316002)(110136005)(66446008)(54906003)(64756008)(76116006)(31686004)(5660300002)(8676002)(4326008)(7416002)(6486002)(71200400001)(38100700002)(83380400001)(122000001)(66574015)(31696002)(86362001)(2906002)(478600001)(26005)(2616005)(6506007)(6512007)(36756003)(921008)(41300700001)(38070700009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RDlLaW5jejVsZCtXSTR5QnQrWUc5Q1o5cW44dUI3T0JxS0RkTlNXam95b0lC?=
 =?utf-8?B?cVY2OE5EU2Rhek82ZFpOMlhTdmJYais5THd5U1E1NzIrR3o3MUxvRmxDVEhQ?=
 =?utf-8?B?cUJ4UndORnpJTkc3RDJUZkZMS0NaMU9jR3cvVjQwb3B1aE16VmpGeE9jQ1hQ?=
 =?utf-8?B?bFNrSHl6eG92V0FrbHZxK2FTWXNJU0FQdFVOcXM5d09aMkVIdkRQdDJjWXI5?=
 =?utf-8?B?ZmhIUUR2WU1tVXNWeEVVQ1VwRGhKZTliTU5wS1hKanZuU0Y2Z1ZyVHd3YXpk?=
 =?utf-8?B?ckRnS3c1UDQwdS9GWW92QnU4S3U1LzFpMWVHSHhiNVZkU3RJWmxmWHlHb1BH?=
 =?utf-8?B?UjJVM0JSWkdzS0VXemJ4QWhCQWhmZHUyNDg1dnBnTTNJZ0l0WDNHcEd5WWV1?=
 =?utf-8?B?VnJRV3ZVYjgwcE10TjVWOWhEbkY4RnpoREtTKzFycEx0ZS8xS2c0YStpc01O?=
 =?utf-8?B?czhRT0ladVhUT1dQWTduU0trMUlrL3VSM2VkdjVDODRqaDlFeXl6MldRV3Y3?=
 =?utf-8?B?YjdDUFU3MXZ3TEVvcmI0MjdjMlNLUy9XTFArazZwWUJtL1pFNU5vdTkxckNv?=
 =?utf-8?B?M0xRL0dIbTVrRkl2d2oxc1QzWFJuRzN3bjFrVXJaQk5sTTRNVUdNVllpYmJ2?=
 =?utf-8?B?VFV0cGRQRmhGdnZDdUlyRDFERVg2aDBUU1VZcHEzcmlnK2t5Yy94V0JkVTJu?=
 =?utf-8?B?YVlyeDNGUE40RzF4NmhxVm10OEY5Yys2allUTlNNNnFtdHBXNTZEbmpSeGdX?=
 =?utf-8?B?VzRzYnd2T0Excmw5ci9GRzA1dFlZdzFYM2VLdVdQbEhxMklEVFZKOU9jQ1RL?=
 =?utf-8?B?cHBjQ3MyVG9FWGZyMytMcnN0QTBZcS9sRERmNjZGeEFVNmUxMFc1Skl4UnlO?=
 =?utf-8?B?RTYxUDJnY2NyU092Z2c4WG5YK2RtTXJlTHYwZlhrTTB0VlZ4Vm1EdG5HbmlE?=
 =?utf-8?B?Uk90NGRaMERFaDVsRkxlYnRkWCtVTlNNekpTOHVCaGZpejhlUGE5bmNvdERw?=
 =?utf-8?B?RXZucnJyWEVUbWZURDJvRVd6dDNQRitGLzNVSmZ1ZUFRczNEcVJINHhiS0J5?=
 =?utf-8?B?SVZkd0lHSllHWldUUU1iaW81aTZLa3pJV24zclBLaFNmc1ZYM1VIR3BtVlpW?=
 =?utf-8?B?YnBuSUl5ZndsVS9pQWZ4WnBEWGNmZ2FqREx6RWdqQis5MnRsekxLdW1FYUdV?=
 =?utf-8?B?ZHNyZU81c2pndDNiYVQ3Rk8zYTd6Q29zTGVvSC9vNXJsaXMwUnVOOWpRNmhN?=
 =?utf-8?B?MnJHL2VTOGdvK2JPMnNKSXgrL3F1VGVaT2EwbUllaFJmZjhEL2U2SjM3R0dU?=
 =?utf-8?B?STQ1QUpyMExUK2tBM0htNkRLeEhJOFE3YzJEeU5JT0VWYTgyTkd5VG11TFJM?=
 =?utf-8?B?cERZa3ZXTk8wTWpNRGIzQitkYmVRSDNNUkNTUHEzMEp1MG1xTWt3QmpVMGVF?=
 =?utf-8?B?UjltUGtWTDh5aWpZSkZsRXNxUjRQS013blZSdVJGTlpyOThQN25VMFJxaWRV?=
 =?utf-8?B?bnFkMmxWMW1mN3dzZWRBeElYQW01NGNUbG5uWHp4QkdrZzRTemZLNmJQU0Nj?=
 =?utf-8?B?TGM5dU5JQUg1Zjl4dUpDeEtDZXpoTFh0bVI0VStSZThURERWQ0d1OWlwRGNo?=
 =?utf-8?B?N3lwY0MwNFd3dmpWTkU5LzVveEU2cVFwN2ZDR3ZydTlzaFpoWCtINHBjc2dl?=
 =?utf-8?B?NjRJOWEzNmUrWTB6d292bEJpa01ialJpNDFUOEllOXJaelk4c1pnVHF0NXNN?=
 =?utf-8?B?QnppVy9IYURRWWVTNUZKeDc3d1FnbDJhY0g1K3hFcDRkTStHSjZQWXdjNGZp?=
 =?utf-8?B?M2UyWHVjSDljNVd1WUdobHcxZm5FYVBFc0tid1RFTnllN2lGWEtVT3F5MmtJ?=
 =?utf-8?B?R1VmZ2tiM2dZWDNtNVFFenlNbjR2eGNjTjV2V3Y0cHVJM3lVRHp6Qmh4RXly?=
 =?utf-8?B?WStReldlQk5OeHdHekNLbjZOSWFiUHArNzFVQytrZkpXNitDWWxHdW5iY0Vw?=
 =?utf-8?B?WWwzZ3N6L0dvOWZIMCtiVjk3U0NVekVrTnkzK2l2Y3daWU1xUncwT0YyRGxu?=
 =?utf-8?B?cHRjeDlYOUFrZWIrb0cyOUlzSEZ1ZGc4VmY2eG1ZdlpwUjZzVWJBMDE1RE94?=
 =?utf-8?B?NlN0UkVGY2YxY092Z3pmWk1SYk5scjF1bjBvaGJ5Zld4elFGNzEyM3NjLzlN?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22A4F8FB22393148A07D4E629F35E532@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ce7e6f-cd0b-44fc-6d2c-08dbf51d8028
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 23:05:25.5460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AowV1OYB38dy3H41VrkSythA+nU8jrffnJFPubwD7dXlWj/D45JmBNsWAEVRN67K9rH9aI5rytBxajqUxCztUk5lNLOMytppt3sEIjRASQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1655
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzEyLzIwMjMgw6AgMTk6MDUsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBV
c2luZyBvZiBkZXZtIEFQSSBsZWFkcyB0byBjZXJ0YWluIG9yZGVyIG9mIHJlbGVhc2luZyByZXNv
dXJjZXMuDQo+IFNvIGFsbCBkZXBlbmRlbnQgcmVzb3VyY2VzIHdoaWNoIGFyZSBub3QgZGV2bS13
cmFwcGVkIHNob3VsZCBiZSBkZWxldGVkDQo+IHdpdGggcmVzcGVjdCB0byBkZXZtLXJlbGVhc2Ug
b3JkZXIuIE11dGV4IGlzIG9uZSBvZiBzdWNoIG9iamVjdHMgdGhhdA0KPiBvZnRlbiBpcyBib3Vu
ZCB0byBvdGhlciByZXNvdXJjZXMgYW5kIGhhcyBubyBvd24gZGV2bSB3cmFwcGluZy4NCj4gU2lu
Y2UgbXV0ZXhfZGVzdHJveSgpIGFjdHVhbGx5IGRvZXMgbm90aGluZyBpbiBub24tZGVidWcgYnVp
bGRzDQo+IGZyZXF1ZW50bHkgY2FsbGluZyBtdXRleF9kZXN0cm95KCkgaXMganVzdCBpZ25vcmVk
IHdoaWNoIGlzIHNhZmUgZm9yIG5vdw0KPiBidXQgd3JvbmcgZm9ybWFsbHkgYW5kIGNhbiBsZWFk
IHRvIGEgcHJvYmxlbSBpZiBtdXRleF9kZXN0cm95KCkgaXMNCj4gZXh0ZW5kZWQgc28gaW50cm9k
dWNlIGRldm1fbXV0ZXhfaW5pdCgpLg0KDQpUaGlzIGlzIG5vdCBuZWVkZWQgZm9yIHBhdGNoIDIu
IFNob3VsZCBwYXRjaCAyIGdvIGZpcnN0ID8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2Vvcmdl
IFN0YXJrIDxnbnN0YXJrQHNhbHV0ZWRldmljZXMuY29tPg0KPiAtLS0NCj4gICBpbmNsdWRlL2xp
bnV4L2Rldm0taGVscGVycy5oIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2Rldm0taGVscGVycy5oIGIvaW5jbHVkZS9saW51eC9kZXZtLWhlbHBlcnMuaA0KPiBpbmRleCA3
NDg5MTgwMjIwMGQuLjJmNTZlNDc2Nzc2ZiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9k
ZXZtLWhlbHBlcnMuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2Rldm0taGVscGVycy5oDQo+IEBA
IC03Niw0ICs3NiwyMiBAQCBzdGF0aWMgaW5saW5lIGludCBkZXZtX3dvcmtfYXV0b2NhbmNlbChz
dHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAgCXJldHVybiBkZXZtX2FkZF9hY3Rpb24oZGV2LCBkZXZt
X3dvcmtfZHJvcCwgdyk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGlubGluZSB2b2lkIGRldm1f
bXV0ZXhfcmVsZWFzZSh2b2lkICpyZXMpDQo+ICt7DQo+ICsJbXV0ZXhfZGVzdHJveShyZXMpOw0K
PiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIGRldm1fbXV0ZXhfaW5pdCAtIFJlc291cmNlLW1hbmFn
ZWQgbXV0ZXggaW5pdGlhbGl6YXRpb24NCj4gKyAqIEBkZXY6CURldmljZSB3aGljaCBsaWZldGlt
ZSB3b3JrIGlzIGJvdW5kIHRvDQo+ICsgKiBAbG9jazoJUG9pbnRlciB0byBhIG11dGV4DQo+ICsg
Kg0KPiArICogSW5pdGlhbGl6ZSBtdXRleCB3aGljaCBpcyBhdXRvbWF0aWNhbGx5IGRlc3Ryb3ll
ZCB3aGVuIGRyaXZlciBpcyBkZXRhY2hlZC4NCj4gKyAqLw0KPiArc3RhdGljIGlubGluZSBpbnQg
ZGV2bV9tdXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKQ0K
PiArew0KPiArCW11dGV4X2luaXQobG9jayk7DQo+ICsJcmV0dXJuIGRldm1fYWRkX2FjdGlvbl9v
cl9yZXNldChkZXYsIGRldm1fbXV0ZXhfcmVsZWFzZSwgbG9jayk7DQo+ICt9DQo+ICsNCj4gICAj
ZW5kaWYNCg==
