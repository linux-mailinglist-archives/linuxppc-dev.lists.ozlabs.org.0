Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5900F62426F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 13:37:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Lw00SMKz3f2p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 23:37:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bHaOn/8H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.54; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bHaOn/8H;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90054.outbound.protection.outlook.com [40.107.9.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Lty62jjz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 23:36:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR/CoybOSVF4l0oILwDF3xuy5EPNtvTrdoZsIO3q8moHaYrPSqq49hmgl/7Z5nFi/1CUWPPKmM0QsDzNbeIWhnW64cPbP/bOtucdfbtIpd5LKZOdPTLanZRRFLUmVfxu1Y46o5fRKLQ/VzyEpq6NzTNDcoEFg2O5iz5Nns/pSszqzw9lHjy14TXzfvwRaTo04zpQNQgIFLwVyXtwe8SFTgSfy7KYyXCAtjiz4yThkSsiFxyk8c3OEzNhnk91YPEr3taeaA2KPSqlyP4jY5kLA5pQRhSyi8BqKjpOaf42CoF9pAZxduCG6SBTM9BQHH8sJrGLjgrMpSr00PafYb9bPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpNRzVths1oTLUmg4d1qRPBpQj943/cJT76Lf9veHes=;
 b=TGBZ2PhKrv93LjE6zPYugvVWJ9fiXUhs1HoT92X1/0mqWdcAebAj2w876fxyL5KKak3+eKsS8+bOITzb8BBEDWk/T7JTDvM3W+U6AauGHUgLvbtn+w7fLwFWfXKeRfdobUXuHqm2AnpG2Ads+JxcqjVWtH5XecoF+EZxMO69x7H2HV6WgFAwsKwgZns/11qAYL2iGGVUUSmM4rkev0qP+3MPDujvTD38BVxwQAcNZmePIOLa7E5WJKk4wNrZfprluKNrn15yYtHD7hx1WR/eeZ7GLFjoPyUHhbEUx87DVLlVNFiOJ6BdNbVNgzIfYfr2oWASIcKhS3FmzpMPLTUi+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpNRzVths1oTLUmg4d1qRPBpQj943/cJT76Lf9veHes=;
 b=bHaOn/8HGseqD8Sw0AFm4hOAlPwG4YgX8iASZEpG82Az1rYkqTEp7MQrotEfLL6GsRTU1cg7Gr3pIAlSeYGlxUYRzp19L8ITceLv1ekx8YXQrgocVs+Ap+1PJ4PLzQl1awnweYQXvux8Thhk8zijM+3ZH5jTsjLOwvn7PBCHnIE/hC/n9Z2S4t6360wMdAG0rIkUJCxqmzDdhTDx12rnUeCO2dMQ5NSzziBlr1eCVuKNhedPp3FT0NOJCY5MeFjXDMnpp4rYOGF9HtohOYvmknRBiPG/U7DHMMdXciOYouNmozBTTSiWY2uLOghxbqQkdP9AZ6WUNAnIKS4NqelYWA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2306.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:33::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 12:36:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 12:36:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "yang.yang29@zte.com.cn" <yang.yang29@zte.com.cn>, "tyreld@linux.ibm.com"
	<tyreld@linux.ibm.com>
Subject: Re: [PATCH linux-next] scsi: ibmvfc: use sysfs_emit() to instead of
 scnprintf()
Thread-Topic: [PATCH linux-next] scsi: ibmvfc: use sysfs_emit() to instead of
 scnprintf()
Thread-Index: AQHY9QC7w3Wk4OikiUab4vu3IQNOYq44GCMA
Date: Thu, 10 Nov 2022 12:36:36 +0000
Message-ID: <9717a9dd-45da-0d48-71a2-d2f64df8c7fc@csgroup.eu>
References: <202211102034017058666@zte.com.cn>
In-Reply-To: <202211102034017058666@zte.com.cn>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2306:EE_
x-ms-office365-filtering-correlation-id: 1e89ad6f-d238-4f47-2549-08dac3183530
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  63EjPKMGcb59aq0krjtw4GHyojo7XkNU1ShfYWoMpR8r2rJuKiYrrI9/4WXUTxAKoOz4ry4wtqN9lUT2E6GIbcgxr4JXLjWKVA8dj8Om90DzaTlD8Mro0oS35fACc20FuVPHilutQEczyVc97BlWHUXGRDZLrxGzziA3tNdRNkEXTtoR7mLPa4+SuIwCrJ0C0paMWqQORouF50YaC/D3wY89x5BAPNqimt8H++tTvVvgCmNM/g9maMs1MYqSqPJSzYAZPVVdxIr/c0WXMubt5Vj6wBfYfDW6M1wFa12i8J9EYPA6czZVA8iWU3Ip1dhYDAzkELQ2rQ80eSqdE/Jv3daeo0UpVjOF9AQ3769p0dKL+qsz36bL7MsLxbNpUjn9aOVjPQ+oz/5UZ8DjQ1ktUb7T5+JpeYqr/pw8KnkDQCKgoND6Z/depG7OJGX7+esZpfsGp0mC/DvKNhf+49HXolArpUTvBk+PoGTICL0dn8CE4+TuqNrArxsqQ7IDpyHYbsucv/03PMu0cPMyu2n8m10RmlsPE13rYvkXdfN4UJ3c5xVxmb4DVWpbRK4eiE/v12rQ0o3H1LXKc11GnAOa/MYyWbXpgEct3wILrUY45P3a/d0MKRsB3iC+xISkMM+zWxw62xsyUiHnxTOworHvrt2Uv1U0CsfjKRhmU27nAIdDNzLv2+5BHK3wx3VuW1qT84mm16DpS6ItY2wWKxTzfacnQyf+5MspMGb/cBCjKhRNE2dnPRCQf+giL8CimK00cdEbolOFJCh+zwcScjxoqkEs2l2WuBfiFplFtM6FslM5Mv2go8AZlmO39iY8vQ6NbL6aDNEAgeeuq1oonZhF0Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199015)(110136005)(2906002)(36756003)(71200400001)(316002)(478600001)(66946007)(83380400001)(66476007)(76116006)(64756008)(8676002)(8936002)(66556008)(44832011)(4326008)(66446008)(41300700001)(91956017)(7416002)(6486002)(966005)(5660300002)(2616005)(66574015)(186003)(31686004)(54906003)(38100700002)(6506007)(86362001)(38070700005)(122000001)(6512007)(26005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Qkp1S1JkOFVaUVAwTkhIdHprRjYvUlAzeEtYNDFyZ25Tc215YmZia2twcUNJ?=
 =?utf-8?B?TkZtN01LMlNuRXdwZ0hOMjhvNSsyY3oyLzJBSzlvZ0N6NUxPMmxpK3FVZ0Nr?=
 =?utf-8?B?YmV4NGdOc05UZ2YvdXlEL2lGODFsNS9NZnZKaTFmMHZ1MzF4ei84MmUxbVVZ?=
 =?utf-8?B?Tml1M21ycVpLNS9pS1JKUjh4TWdKNzlKdDM5ZEMxM0xqOFJWOEw1S0hHNllH?=
 =?utf-8?B?ejVHbFE4ZG0yVUhuQ2lHVHNHeVZKMzZ1YkJZK1FDZVNET29UY3RIWitHOElp?=
 =?utf-8?B?dFdPL2dPa04wWGV5WXRjcGduTWxyMy9pZ0hGbjVLWmV4aXB6eEUvMlRIcmRn?=
 =?utf-8?B?T3VhQW5nQURCdndTVjlIeklJeXdCdG5kUVI1Ylo5NkVhdThuTURPNVhaVSt5?=
 =?utf-8?B?SVg2Q1FvZXZFWFV3SVM2ZEpEUTd5c2xKQjlkU2sxUUhKQUZLclZKTGhxbnhq?=
 =?utf-8?B?NWNSTEM4ZFk2cjEwVHd0MkZubmRpVEEvUWlTaDdKbzlRQ0M0dGpoK1loOWtx?=
 =?utf-8?B?QTZ0bHV4aUhjTXlZYjk0N3JBTEpHcTdJbjkzUG83Z3pCeUoxQXU3MXhYUnVz?=
 =?utf-8?B?VWVlVjFaL1BIaStPS1lSdEpvTmN1VHJSNHNSL1JRNWVEaEJZUU02S1VLSUc4?=
 =?utf-8?B?T0prVW9LdmZYT01uRldLUXkzM2NING9vODZRbXZLOWlYMyt6MktOYzNhVENk?=
 =?utf-8?B?NWxZQmpkV1gxZXg2SnkzLy9tbTZNVFBmWnpXT3RsSGZ1UkVBYVhHY3gxOFhC?=
 =?utf-8?B?eEVMRUYwODlKSHYrNWVhTGVpQVRtVzNFWHhtT3pjOTJrVFZCaFJaY3hiQVdT?=
 =?utf-8?B?SjU2Sm1scnpjc0NCVHhudEYwejQ5UEVaMXk4OFk2ZGtTNWQrdXc4TUpLVXBh?=
 =?utf-8?B?ajVPTXNrUkFkZzA0NFA3eXRuelRybitkeTF3bUNWWGZkL0JBVmdTdm5BTXFJ?=
 =?utf-8?B?a2ZpY25aQTBoM0llY0xQaWpxV0JNRE1JY2xxNDJsby9RTmhzWVlGTklBVVhq?=
 =?utf-8?B?c01YanRXWmE5Wll5T1VJeGtoVW1pOSt3ZlQ3cXRmbGV2dDZjTXFQSWpmN2dB?=
 =?utf-8?B?Q3RNN1Z4bUNySkU1dTkycmNiVlR3enNBblZCNEMvd1MxSEFpOERGMXZBQzQr?=
 =?utf-8?B?RGJ1a3YxZFlzemNwUldUV200WFlBYTVmVzNud0h5Z1lzMW4rLzcvYmJYU21r?=
 =?utf-8?B?V1FWZEN6ZGFCaHJEcWttRHNKSXlzd3VhWFkraDkzZE41OGsxQzRqNll5ejZE?=
 =?utf-8?B?NUk2RmZnc2ZKUEVSS0Q4Qkh6RlJRSTZMQ1p5OXdlY1FxV1dkaHBBcWJybzZQ?=
 =?utf-8?B?RmxpanA3aDhGbzBuaHl0T3RGb1g3cVluMlRLWDhMNVpPaDFMVnVFTFQxTlRC?=
 =?utf-8?B?aW1tK2VwRE1Na0h2YlZ5U2U3ajJxaUk0dXFRY3BJY0RmVDF5cGxjQ1hZb0ov?=
 =?utf-8?B?bjM0VTczaUdicmNuNDVjZ0VhcmNwNW1RVEwyZHJuVjlKZE8rSFRsSmVnK2Jh?=
 =?utf-8?B?a1VmOEt4MFk0cjZEM1J5M1YrS1lnQVY3US9kb1NKa3VERTFOWHZoNWprRUND?=
 =?utf-8?B?V2NaMFNjQ3NLbWlWZmd1UEwwcmVYUFowbzBQdWNDdkhlSEM1QUdmSytoT0s0?=
 =?utf-8?B?Z2JkKzhZSjVVNVA2TW9IZFo2Ti8ybm5ZS2R5Y1gvMHZLUzVsczVIaUFSSG9s?=
 =?utf-8?B?TXJ4Ykk1TTdHNmhoL0d2eXZRWkdWekYvbzlMQjE5WDJueW9Ya2dPKzZaU2l0?=
 =?utf-8?B?WTFRNjIzTnNnNE95TWhaOEhzWHRVSUQ1dm1JNnB5Z0E1K3diV1o5Ui92MjhZ?=
 =?utf-8?B?QktiZ21La0VwZXVoUVJySmRpVEdNOHBTd2lPRkxsMXJ3VHhjcDlBUWlKV0Ns?=
 =?utf-8?B?M0VOdXlYN3p6dXRFOURBeS9lRUd2K3ZFUmRZeDJ1eVp6aDRtZDhtWTNueERC?=
 =?utf-8?B?eW01WjhPU0x2VnZoZDE2aGx1dDNsSWlUMXJERFJzUmNpcmlta0wxdnVwTFhF?=
 =?utf-8?B?Wm9OS3ViTWdUOXkvWlBzRGdzWEJsMzBFY01YeWljWWlaVDRmN0JPRHovOWJO?=
 =?utf-8?B?eSt6dFZ4VHF2dDNtZUU0Q0g3UTQydVpmcE0yQVpEdFNGWTVEbkVML2xxV3Az?=
 =?utf-8?B?ajg4QWZQbU92SUZ0d1psamhHRVZ1dUdteU9zcldqTDV1azl2WVZPUDFMQ09s?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E41A2C8E45225498DC23F4E25F26F80@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e89ad6f-d238-4f47-2549-08dac3183530
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 12:36:36.5012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xLR4vyjOYea5wnZuadFTNg/yU9pjjlG8Y1b5izxX7q7nT9of5EjTUx5tpzGe22VKPzdMBPuvB1ANbuWArIi1WmOq50+uumyj69g/ydM4Ysg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2306
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

TGUgMTAvMTEvMjAyMiDDoCAxMzozNCwgeWFuZy55YW5nMjlAenRlLmNvbS5jbiBhIMOpY3JpdMKg
Og0KPiBbVm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSB5YW5nLnlh
bmcyOUB6dGUuY29tLmNuLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDD
oCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4g
RnJvbTogWHUgUGFuZGEgPHh1LnBhbmRhQHp0ZS5jb20uY24+DQo+IA0KPiBSZXBsYWNlIHRoZSBv
cGVuLWNvZGUgd2l0aCBzeXNmc19lbWl0KCkgdG8gc2ltcGxpZnkgdGhlIGNvZGUuDQo+IA0KPiBS
ZXBvcnRlZC1ieTogWmVhbCBSb2JvdCA8emVhbGNpQHp0ZS5jb20uY24+DQo+IFNpZ25lZC1vZmYt
Ynk6IFh1IFBhbmRhIDx4dS5wYW5kYUB6dGUuY29tLmNuPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5n
IFlhbmcgPHlhbmcueWFuZzI5QHp0ZS5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvc2NzaS9pYm12
c2NzaS9pYm12ZmMuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc2NzaS9pYm12c2NzaS9pYm12ZmMuYyBiL2RyaXZlcnMvc2NzaS9pYm12c2NzaS9pYm12ZmMu
Yw0KPiBpbmRleCAxYTBjMGI3Mjg5ZDIuLmM0MTI3NTJlYTE0MCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9zY3NpL2libXZzY3NpL2libXZmYy5jDQo+ICsrKyBiL2RyaXZlcnMvc2NzaS9pYm12c2Nz
aS9pYm12ZmMuYw0KPiBAQCAtMzQxMSw3ICszNDExLDcgQEAgc3RhdGljIHNzaXplX3QgaWJtdmZj
X3Nob3dfaG9zdF9wYXJ0aXRpb25fbmFtZShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAgICAgICAg
IHN0cnVjdCBTY3NpX0hvc3QgKnNob3N0ID0gY2xhc3NfdG9fc2hvc3QoZGV2KTsNCj4gICAgICAg
ICAgc3RydWN0IGlibXZmY19ob3N0ICp2aG9zdCA9IHNob3N0X3ByaXYoc2hvc3QpOw0KPiANCj4g
LSAgICAgICByZXR1cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIlc1xuIiwNCj4gKyAgICAg
ICByZXR1cm4gc3lzZnNfZW1pdChidWYsICIlc1xuIiwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIHZob3N0LT5sb2dpbl9idWYtPnJlc3AucGFydGl0aW9uX25hbWUpOw0KDQpDb3VsZCBpdCBm
aXQgb24gYSBzaW5nbGUgbGluZSBub3cgPw0KDQo+ICAgfQ0KPiANCj4gQEAgLTM0MjEsNyArMzQy
MSw3IEBAIHN0YXRpYyBzc2l6ZV90IGlibXZmY19zaG93X2hvc3RfZGV2aWNlX25hbWUoc3RydWN0
IGRldmljZSAqZGV2LA0KPiAgICAgICAgICBzdHJ1Y3QgU2NzaV9Ib3N0ICpzaG9zdCA9IGNsYXNz
X3RvX3Nob3N0KGRldik7DQo+ICAgICAgICAgIHN0cnVjdCBpYm12ZmNfaG9zdCAqdmhvc3QgPSBz
aG9zdF9wcml2KHNob3N0KTsNCj4gDQo+IC0gICAgICAgcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFH
RV9TSVpFLCAiJXNcbiIsDQo+ICsgICAgICAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXNcbiIs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICB2aG9zdC0+bG9naW5fYnVmLT5yZXNwLmRldmlj
ZV9uYW1lKTsNCg0KQ291bGQgaXQgZml0IG9uIGEgc2luZ2xlIGxpbmUgbm93ID8NCg0KPiAgIH0N
Cj4gDQo+IEBAIC0zNDMxLDcgKzM0MzEsNyBAQCBzdGF0aWMgc3NpemVfdCBpYm12ZmNfc2hvd19o
b3N0X2xvY19jb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gICAgICAgICAgc3RydWN0IFNjc2lf
SG9zdCAqc2hvc3QgPSBjbGFzc190b19zaG9zdChkZXYpOw0KPiAgICAgICAgICBzdHJ1Y3QgaWJt
dmZjX2hvc3QgKnZob3N0ID0gc2hvc3RfcHJpdihzaG9zdCk7DQo+IA0KPiAtICAgICAgIHJldHVy
biBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiVzXG4iLA0KPiArICAgICAgIHJldHVybiBzeXNm
c19lbWl0KGJ1ZiwgIiVzXG4iLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgdmhvc3QtPmxv
Z2luX2J1Zi0+cmVzcC5wb3J0X2xvY19jb2RlKTsNCg0KQ291bGQgaXQgZml0IG9uIGEgc2luZ2xl
IGxpbmUgbm93ID8NCg0KPiAgIH0NCj4gDQo+IEBAIC0zNDQxLDcgKzM0NDEsNyBAQCBzdGF0aWMg
c3NpemVfdCBpYm12ZmNfc2hvd19ob3N0X2RyY19uYW1lKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4g
ICAgICAgICAgc3RydWN0IFNjc2lfSG9zdCAqc2hvc3QgPSBjbGFzc190b19zaG9zdChkZXYpOw0K
PiAgICAgICAgICBzdHJ1Y3QgaWJtdmZjX2hvc3QgKnZob3N0ID0gc2hvc3RfcHJpdihzaG9zdCk7
DQo+IA0KPiAtICAgICAgIHJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiVzXG4iLA0K
PiArICAgICAgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVzXG4iLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmhvc3QtPmxvZ2luX2J1Zi0+cmVzcC5kcmNfbmFtZSk7DQoNCkNvdWxkIGl0
IGZpdCBvbiBhIHNpbmdsZSBsaW5lIG5vdyA/DQoNCj4gICB9DQo+IA0KPiBAQCAtMzQ1MCw3ICsz
NDUwLDcgQEAgc3RhdGljIHNzaXplX3QgaWJtdmZjX3Nob3dfaG9zdF9ucGl2X3ZlcnNpb24oc3Ry
dWN0IGRldmljZSAqZGV2LA0KPiAgIHsNCj4gICAgICAgICAgc3RydWN0IFNjc2lfSG9zdCAqc2hv
c3QgPSBjbGFzc190b19zaG9zdChkZXYpOw0KPiAgICAgICAgICBzdHJ1Y3QgaWJtdmZjX2hvc3Qg
KnZob3N0ID0gc2hvc3RfcHJpdihzaG9zdCk7DQo+IC0gICAgICAgcmV0dXJuIHNucHJpbnRmKGJ1
ZiwgUEFHRV9TSVpFLCAiJWRcbiIsIGJlMzJfdG9fY3B1KHZob3N0LT5sb2dpbl9idWYtPnJlc3Au
dmVyc2lvbikpOw0KPiArICAgICAgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVkXG4iLCBiZTMy
X3RvX2NwdSh2aG9zdC0+bG9naW5fYnVmLT5yZXNwLnZlcnNpb24pKTsNCj4gICB9DQo+IA0KPiAg
IHN0YXRpYyBzc2l6ZV90IGlibXZmY19zaG93X2hvc3RfY2FwYWJpbGl0aWVzKHN0cnVjdCBkZXZp
Y2UgKmRldiwNCj4gQEAgLTM0NTgsNyArMzQ1OCw3IEBAIHN0YXRpYyBzc2l6ZV90IGlibXZmY19z
aG93X2hvc3RfY2FwYWJpbGl0aWVzKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gICB7DQo+ICAgICAg
ICAgIHN0cnVjdCBTY3NpX0hvc3QgKnNob3N0ID0gY2xhc3NfdG9fc2hvc3QoZGV2KTsNCj4gICAg
ICAgICAgc3RydWN0IGlibXZmY19ob3N0ICp2aG9zdCA9IHNob3N0X3ByaXYoc2hvc3QpOw0KPiAt
ICAgICAgIHJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiVsbHhcbiIsIGJlNjRfdG9f
Y3B1KHZob3N0LT5sb2dpbl9idWYtPnJlc3AuY2FwYWJpbGl0aWVzKSk7DQo+ICsgICAgICAgcmV0
dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJWxseFxuIiwgYmU2NF90b19jcHUodmhvc3QtPmxvZ2luX2J1
Zi0+cmVzcC5jYXBhYmlsaXRpZXMpKTsNCj4gICB9DQo+IA0KPiAgIC8qKg0KPiBAQCAtMzQ3OSw3
ICszNDc5LDcgQEAgc3RhdGljIHNzaXplX3QgaWJtdmZjX3Nob3dfbG9nX2xldmVsKHN0cnVjdCBk
ZXZpY2UgKmRldiwNCj4gICAgICAgICAgaW50IGxlbjsNCj4gDQo+ICAgICAgICAgIHNwaW5fbG9j
a19pcnFzYXZlKHNob3N0LT5ob3N0X2xvY2ssIGZsYWdzKTsNCj4gLSAgICAgICBsZW4gPSBzbnBy
aW50ZihidWYsIFBBR0VfU0laRSwgIiVkXG4iLCB2aG9zdC0+bG9nX2xldmVsKTsNCj4gKyAgICAg
ICBsZW4gPSBzeXNmc19lbWl0KGJ1ZiwgIiVkXG4iLCB2aG9zdC0+bG9nX2xldmVsKTsNCj4gICAg
ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShzaG9zdC0+aG9zdF9sb2NrLCBmbGFncyk7DQo+
ICAgICAgICAgIHJldHVybiBsZW47DQo+ICAgfQ0KPiBAQCAtMzUxNyw3ICszNTE3LDcgQEAgc3Rh
dGljIHNzaXplX3QgaWJtdmZjX3Nob3dfc2NzaV9jaGFubmVscyhzdHJ1Y3QgZGV2aWNlICpkZXYs
DQo+ICAgICAgICAgIGludCBsZW47DQo+IA0KPiAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZShz
aG9zdC0+aG9zdF9sb2NrLCBmbGFncyk7DQo+IC0gICAgICAgbGVuID0gc25wcmludGYoYnVmLCBQ
QUdFX1NJWkUsICIlZFxuIiwgdmhvc3QtPmNsaWVudF9zY3NpX2NoYW5uZWxzKTsNCj4gKyAgICAg
ICBsZW4gPSBzeXNmc19lbWl0KGJ1ZiwgIiVkXG4iLCB2aG9zdC0+Y2xpZW50X3Njc2lfY2hhbm5l
bHMpOw0KPiAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKHNob3N0LT5ob3N0X2xvY2ss
IGZsYWdzKTsNCj4gICAgICAgICAgcmV0dXJuIGxlbjsNCj4gICB9DQo+IC0tDQo+IDIuMTUuMg0K
DQo=
