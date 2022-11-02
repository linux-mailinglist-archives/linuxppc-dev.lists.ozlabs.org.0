Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA87615FF0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 10:37:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2MHP09j5z3cJd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 20:37:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=RJhrhZv4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.52; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=RJhrhZv4;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90052.outbound.protection.outlook.com [40.107.9.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2MGM2TG2z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 20:36:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri8mOnx2gxTeZQ8yGi9wmVtH9/c0+RZ/xnQc/8g1delDnJyW2/Ld3rqyR1sniA1uz31JS6ddNMFpvz85A04mUkZFAFG0lHEHwzaV/xbW65cx5s3BE+ctKn5STwgZHXs7c4LfJQKbnX4gc7oAthtA+p+DPXWUPmLphbQGILGah+BoFHFHCZTvWdxHLgP/Ap/6Lo45OB9D8LeMnV7m6V1zqQa+2ViLmpCEOBKZTjP2UjAoLqYIkoevqjgOCC0iUMBSZS84pHedcIR8geU6kfSUwRpQjvIl/txAvDaP04j/tlyW6SO3lYObgOp/0eENjr7gAB8SQDMhhtChRexyMjOhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wt5RH89UUELFGsQLqLjLNDAYRdDTFPeVdxmfwdVNnns=;
 b=T9LGfR357RGgKOItQ6Ig6fcorN3fml0rB9k752l/UTzIAlYY3HZpdExvdkDqY/2EeC7TCASEqXNGgSjNK0zPCZO2bOhu6+HSyOoZ9DZ2fNGgUQuOWHcKzPWAeKIy16+n5xom51cRh+nK8QGwuBRlcLL9/wQ5ZsAWJ0GDu37lfHyTVQFpTie+hoiZvJJRt9u8dABGsoXI0Soc4tGnGpnaZ9YsLDpKkaT5t7/u+UDdDkpH8HVyjuwxflYrx39gJwQRlf09ahJCuo/EQ3QGAFkvTPdB3BH9DBUwPDsTvHYHNZ+I3oBrQG/2g/XUhvkcIYLreXlBdZCrNE8vWvJeHjpE5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wt5RH89UUELFGsQLqLjLNDAYRdDTFPeVdxmfwdVNnns=;
 b=RJhrhZv4lWQlZ8kXTnPf5LSnHWCH9LHd1YZdec2a8Atl8D/EEF3ggBeQxD82S4wrbVG31f9qkHVk/SLX4GyTOvqj9Y7ua0FS7ijUi0BTS0QEQvDTrh/nGkCkwGcsGZothB4+BeWvj1YmKVpXOxogCP0y/mDBh37/oUXieXGAnLqn4Py0NSEObR9wenwHOewULB9znWOLsqp8S0pbxB/ApEQ1wOtdrFx97q100/hnBTpbyKuZyLGtvOB0rJ84DGdJ7AvtL4HYlv0MiHnzqHOkQq/g5Tg4QWzD6vX4yS1+cPQzgYGvzlpHC5aPgXRXA4bq8SXn6ZLu4VQO81KoC0HMAg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1883.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:167::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 09:36:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 09:36:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 2/7] powerpc/code-patching: Handle RWX patching
 initialisation error
Thread-Topic: [PATCH v9 2/7] powerpc/code-patching: Handle RWX patching
 initialisation error
Thread-Index: AQHY6Cx9tRmAfQa/+E6fahUAk+w15K4rbLYA
Date: Wed, 2 Nov 2022 09:36:06 +0000
Message-ID: <51d2e0fb-dc32-6ced-8657-cab2802c837b@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
 <20221025044409.448755-3-bgray@linux.ibm.com>
In-Reply-To: <20221025044409.448755-3-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1883:EE_
x-ms-office365-filtering-correlation-id: b3e78f6d-5783-4b7e-8119-08dabcb5aadc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3xSVes5DbnV8LauaLZ6yHtLgjF5YfWN//wHkMpndTsM5BCK5qLB7uRF3AUVA+vFwyUmkd7H16c0xj7ZyEfNCKzZpRyW4snmu+g2TUIWEN2BS3cpy/A9HFpLRA8+GLGDtqp8Gm+WD8PgvdoilaoHD0orcWAfX0AlrfuFlf+IXuj8mkL6HgGlMRHHrmcBDu+18gPLiy+oCWM2zpx3/Crt3fb2Z7g/ywX8loe0r851rejm3Jy0RfmmkEsniPgXuXHJDzpx+ITBx5HiGvmYq+6gUMzbOMWmZa8WfFzsxdrlAxlT0Uphv78qLokgdpU6ytlVqjWDoDvYKgjsO2lXTHMDxa4t+IXFLnvv7+YgJGYFUyZjhyebRTW3sJdx4aLNgQAZZVuIyEb5xpyGiMk/vPVV4ZPXz2PehlyYLGHUD7q8uyiYMytmuc5JWx91gBUQxkNWwceOeKrlKCRc2S/08RJDsoljzshd9tAqS7s3ugXDVLNN6vKPVLQZssyRcLHTQTqEH49BFcpxV9N5il/9AEGETG0VDN3j9A50WhsfbL8pnSQm9Cw4WcPwf9B3oRGlCxaU85af+H/9JNoW4OMAmAwpO10yR1e7sksXPZIQLbkBV5AcUcGuZRN3/xORSe63ukC6VpgBxi8/u7PXB/3bFxfXtNSATlI+rui1WYVUxWt0h3N6UFzMfJgnKibsmldjbtokdFiHqgBcSV4JPf5wrNWQkaLE/cfvasCpfL9CJvzEZnB4EdFesfuq3vVzlJRFhB4c4VWkFNi0sToY+c4B8UPICXB+uUjDI4vw1mvLZqrH7dE91oYlRgKfy4TvVT7Owgu6yZNacI31NS6kIDQEJ+Xb0Kg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(451199015)(5660300002)(66574015)(186003)(2906002)(2616005)(6512007)(44832011)(26005)(8936002)(41300700001)(122000001)(38100700002)(36756003)(83380400001)(38070700005)(31696002)(86362001)(71200400001)(316002)(54906003)(110136005)(31686004)(64756008)(6506007)(66476007)(66446008)(478600001)(66556008)(8676002)(6486002)(4326008)(91956017)(66946007)(76116006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UnVrUm5XbS9QVlpJSVRsblRselRDZGFJZEZpQ2NDcThhcU5YTzlyVzdLRE5w?=
 =?utf-8?B?Qmc2alREK2xJSjNqNFFvaW0vZElsZkJ4dm4vQVV6RGkyL2lNSGhNYWdRV2Rh?=
 =?utf-8?B?eEpIdzlGRGR5M290aWVFTk5FMldVQS94S1NUQjVMbzBtUkVtN2ZPdit2QXNs?=
 =?utf-8?B?dS9MUXBKRWVwa2ZVaXQvdDZyeVZUeW1INkx2bjlhWGUzRkFNeDVQMWtiK3dP?=
 =?utf-8?B?WVhoUEEvSWNoV0dPZTBXV3BUeVl0VmxZUnpPTTBrNVQ4UnRJU1BQMENYa2xU?=
 =?utf-8?B?Rkl5Z3NBcGR6TjBKMWlYQXFwL1grN2xOZk5memN0alRWaUo4V3BkZWNFdFBs?=
 =?utf-8?B?OGlIeStzcndia3hSWElzc2MvRGQvcS8vS0prZjFJYVdRaFNDak5YK3NRWlRu?=
 =?utf-8?B?VGNvNHdsSjBmZ0pFVXdPY2FPOVpkTFlkb1Z0YUYvdGdTSzRRNzZzMHlwMzdK?=
 =?utf-8?B?cDBYWlFlU3FUSTl5T0RvWVV2Rk56S2NpVk1FNE1CYThaUzVzMG5YTEUrY3J5?=
 =?utf-8?B?UktmRUNWMEtHakw0bHhydjhQTkM3cjdGN0JvcDhCclFnanVCYXBWb2RsalVn?=
 =?utf-8?B?c29hUDZRNTJCeVRTNDlkWFp3RzZoME5jbUNkcHlsbEhZZU1KR09aV0dOVEVz?=
 =?utf-8?B?TFBZWkVUdDNjMGRJNFcwKzJyd0ppNXhhQ2d6ck5SSG5GU3ZLRWNqenRSd25Z?=
 =?utf-8?B?QUxwbHdENzMyVis2cnY1OHkrNFM4Z2RQdURiOEtwN0pldzNBWTNqU1pDWUYv?=
 =?utf-8?B?U0swdU5aa3RlTU9Fb1BxaXZsMU1oeVI0TjltMmpUdFBhMWJaaC9taWRFNXYv?=
 =?utf-8?B?akdBYmtTZC8yNTdwZjNHbDdyenNZM1NGN2cvNnFNQ3ZEbkhMaElVbEl2VzNw?=
 =?utf-8?B?UmU5Z2c4bmx4YUJSWXVBMXU3bnBmSW02RDNZcStBTG13WFZBelJ4VTNLRFFL?=
 =?utf-8?B?OThJRG81Z01BWEhMcGxtT1hjV3JNSG9vSjBFakJnMUxvU3hzWFNoaUlRS21Q?=
 =?utf-8?B?dmR1VG56YXJieFRieDlBMTM4R1hpV1hJRU90QnR0NjlpM2VvcDdveGpxUEt2?=
 =?utf-8?B?Um1OVTZoeWkzNW4rS2s4d21OdUdBd1lrZGE1SGJpMWc0SndickRZTkZ4TW5w?=
 =?utf-8?B?MG8vS055bkZtSHJPc09wY04rbTlMZUxjL2lhYjlpS29mZEpyeEE1YU04aTZY?=
 =?utf-8?B?cENSOXNzNEZGdkozWTAzR1lBcDlPTWxCL2pZelBvVEwrZjh3MTAyZ0pwRE1N?=
 =?utf-8?B?ell0alhEVi9hZ09wUUxZMFZadVQvSHBDMjViVm9sQUhLSWE0eGtqQzhCTHdj?=
 =?utf-8?B?U3VkMFdrb3NBYnFzcFZ4cFRtbHB0aXloUnh3dWFrYjZyQmpJUm95VjhuNnJY?=
 =?utf-8?B?cEltYlV6d01yM1hBRU8xRU9Qc242TGtXOHA4SVQzTXM0VEhqVU5DUnhpeUxu?=
 =?utf-8?B?dlRaNXFKaWhaekhWWGtzelc3THBpQnhXUGN3b2dzcHF3UVl4SWZqMGpiaW15?=
 =?utf-8?B?Sm82dEpyWFowdFp0NmtNUTRUV05GYkszVTQvMnY3TkFkQU5lVk4yYnZHTU5G?=
 =?utf-8?B?VUtId0EybGptNkUzZi9iSUg3d1VMM2J1Y3g4Qk1tbjJybU5kRFJLY2E3K2Zj?=
 =?utf-8?B?N2ZTMFlXMkh5NUhUVXZtdDdvZ3lMbUQycDlzNElXbE5jVUxmSjhYMExLakNn?=
 =?utf-8?B?KzhjTlN4YUIrN1ZObWlUQVgxaTdrZ1RDalhpRmpvL0dvWjA0ZHJTVkU1ck9v?=
 =?utf-8?B?VW83bzU3bkx4Yzd6SGJZZnNXSFl6NmRXRjRxR2huWEd6MlhJTjJUdUxVVjJP?=
 =?utf-8?B?ZG9KMnEybElYM3k3bjBPTWd3MjM4eUU1NGZSTEhkVUg2WTdZeU4zaUI2dkRH?=
 =?utf-8?B?d2wyTWlWWnRTL0srY1krVVh0TFNqTUxkeHM2YldYVW5rS0NxSTlidVA4dGF6?=
 =?utf-8?B?c3FkUGNRQ0h1bFhkUDZxSEZUY2RpblBHUkx2aDJkWGxNQ3AwTWV2MDM1Ri95?=
 =?utf-8?B?dWVIaC80aXFFWGZUSFFLd2liYWprQUM3MXloUlpGelFLVjNzSG45SktQTm92?=
 =?utf-8?B?bWZRM3M3dUc0b1duVzlJR0V5QjQ1dkhoZHd2WHJMQTR2bkE3UXZzenNNWU5q?=
 =?utf-8?B?dzJNdTlSN2pVY0xuMVhKU3hhMGtud3B3b3RDM0RtUTlCanRJcWFNU3pEc2x3?=
 =?utf-8?Q?QtH/6V1a//zUr2pCe3rVCEI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9E53FA561F7C84FA654EDA73B5CD9F3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e78f6d-5783-4b7e-8119-08dabcb5aadc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:36:06.7402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fdf1xk2+X/VjcHKF9Ef6BO75khmZ3oGeYV0ssC9VicD7DJj85NcjVFwuFWZCJmDlslTQyCcnNDCC/ukL4JjHchbhXb56m01IeDY3QYT3F24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1883
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEwLzIwMjIgw6AgMDY6NDQsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
RGV0ZWN0IGFuZCBhYm9ydCBfX2RvX3BhdGNoX2luc3RydWN0aW9uKCkgd2hlbiB0aGVyZSBpcyBu
byB0ZXh0X3Bva2VfYXJlYSwNCj4gd2hpY2ggaW1wbGllcyB0aGVyZSBpcyBubyBwYXRjaGluZyBh
ZGRyZXNzLiBUaGlzIGFsbG93cyBwYXRjaF9pbnN0cnVjdGlvbigpDQo+IHRvIGZhaWwgZ3JhY2Vm
dWxseSBhbmQgbGV0IHRoZSBjYWxsZXIgZGVjaWRlIHdoYXQgdG8gZG8sIGFzIG9wcG9zZWQgdG8N
Cj4gdGhlIGN1cnJlbnQgYmVoYXZpb3VyIG9mIGtlcm5lbCBwYW5pY2tpbmcgd2hlbiB0aGUgbnVs
bCBwb2ludGVyIGlzDQo+IGRlcmVmZXJlbmNlZC4NCg0KSXMgdGhlcmUgYW55IHJlYXNvbiBhdCBh
bGwgdG8gaGF2ZSBubyB0ZXh0X3Bva2VfYXJlYSA/DQoNCklmIHRoYXQncyB0aGUgYm9vdCBDUFUs
IHRoZW4gaXQgbWVhbnMgd2UgYXJlIHJlYWxseSBlYXJseSBpbiB0aGUgYm9vdCANCnByb2Nlc3Mg
YW5kIHdpbGwgdXNlIHJhd19wYXRjaF9pbnN0cnVjdGlvbigpIGRpcmVjdGx5LiBPciBpdCBtZWFu
cyB3ZSANCmRvbid0IGhhdmUgZW5vdWdoIG1lbW9yeSBmb3IgdGhlIGJvb3QgQ1BVLCBpbiB3aGlj
aCBjYXNlIHlvdSBhcmUgZ29pbmcgDQp0byBoYXZlIHNvIG1hbnkgcHJvYmxlbXMgdGhhdCBpdCBp
cyBub3Qgd29ydGggYW55IGVmZm9ydC4NCg0KSWYgaXQgaXMgbm90IHRoZSBib290IENQVSwgaXNu
J3QgdGhlcmUgYSB3YXkgdG8gbm90IGFkZCBhIENQVSBmb3Igd2hpY2ggDQp0aGUgYWxsb2NhdGlv
biBoYXMgZmFpbGVkID8gSWYgdGV4dF9hcmVhX2NwdV91cCgpIHJldHVybnMgYW4gZXJyb3IsIA0K
aXNuJ3QgdGhlIENQVSBkZWFjdGl2YXRlZCA/DQoNCg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBC
ZW5qYW1pbiBHcmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gdjk6CSogTmV3IGlu
IHY5DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jIHwgOCArKysr
KysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYyBiL2Fy
Y2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+IGluZGV4IGFkMGNmMzEwOGRkMC4uNTRl
MTQ1MjQ3NjQzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcu
Yw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYw0KPiBAQCAtNzYsNiAr
NzYsNyBAQCBzdGF0aWMgaW50IHRleHRfYXJlYV9jcHVfdXAodW5zaWduZWQgaW50IGNwdSkNCj4g
ICBzdGF0aWMgaW50IHRleHRfYXJlYV9jcHVfZG93bih1bnNpZ25lZCBpbnQgY3B1KQ0KPiAgIHsN
Cj4gICAJZnJlZV92bV9hcmVhKHRoaXNfY3B1X3JlYWQodGV4dF9wb2tlX2FyZWEpKTsNCj4gKwl0
aGlzX2NwdV93cml0ZSh0ZXh0X3Bva2VfYXJlYSwgTlVMTCk7DQo+ICAgCXJldHVybiAwOw0KPiAg
IH0NCj4gICANCj4gQEAgLTE1MSwxMSArMTUyLDE2IEBAIHN0YXRpYyBpbnQgX19kb19wYXRjaF9p
bnN0cnVjdGlvbih1MzIgKmFkZHIsIHBwY19pbnN0X3QgaW5zdHIpDQo+ICAgew0KPiAgIAlpbnQg
ZXJyOw0KPiAgIAl1MzIgKnBhdGNoX2FkZHI7DQo+ICsJc3RydWN0IHZtX3N0cnVjdCAqYXJlYTsN
Cj4gICAJdW5zaWduZWQgbG9uZyB0ZXh0X3Bva2VfYWRkcjsNCj4gICAJcHRlX3QgKnB0ZTsNCj4g
ICAJdW5zaWduZWQgbG9uZyBwZm4gPSBnZXRfcGF0Y2hfcGZuKGFkZHIpOw0KPiAgIA0KPiAtCXRl
eHRfcG9rZV9hZGRyID0gKHVuc2lnbmVkIGxvbmcpX190aGlzX2NwdV9yZWFkKHRleHRfcG9rZV9h
cmVhKS0+YWRkciAmIFBBR0VfTUFTSzsNCj4gKwlhcmVhID0gX190aGlzX2NwdV9yZWFkKHRleHRf
cG9rZV9hcmVhKTsNCj4gKwlpZiAodW5saWtlbHkoIWFyZWEpKQ0KPiArCQlyZXR1cm4gLUVOT01F
TTsNCj4gKw0KPiArCXRleHRfcG9rZV9hZGRyID0gKHVuc2lnbmVkIGxvbmcpYXJlYS0+YWRkciAm
IFBBR0VfTUFTSzsNCj4gICAJcGF0Y2hfYWRkciA9ICh1MzIgKikodGV4dF9wb2tlX2FkZHIgKyBv
ZmZzZXRfaW5fcGFnZShhZGRyKSk7DQo+ICAgDQo+ICAgCXB0ZSA9IHZpcnRfdG9fa3B0ZSh0ZXh0
X3Bva2VfYWRkcik7
