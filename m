Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BA883C516
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 15:46:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XyPlMK//;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLNv84LpNz3cRJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 01:46:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XyPlMK//;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLNtG0370z2xQH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 01:45:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/moceQvK2J/9rupKgCTJ+dtlK7KuTCjE5qFN+6l+jR60eTUqbZLeY0lhDprt2FBvh9Z7nZFqRSIN34tpEooZdRBKxJ4j9Ujb2R2LQMWLy0tMC2zpBWUQBXA4G6uMUJSRlwQyFuf7Y1JwLLyquo4sXcORClZ6xzftz4c1s7WxAMjSn6NIL/dHQHlMlV7lKgnVMxCAerci6+Jx2YyuGk2aKYwf2EhucQGwQikFjEe9Iu+lsVk4KoPFZ1p/5HLLUvObSYOXiJwYqBLXqcTMKjPyjeA2nS3RfiiXlcmulhhQg4LGQqpnWFM3UjjDUz/j3riFuVCCZ5vnEqtubM1I0XKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAzI8tW8PRH6xQTOEvFgvdpqTiclLkkcrIJjgdeWo4Q=;
 b=iOGU0OmdJKFb8fssqWm2XoyokoH2ef0o8w61qpAwWNW8sPastXcFAamxT/2KSDU9hHNWU8MSh0uUrwSbu0IC0SmVTrBe7CszzCxu2QPZSMG0w75xSkqsbeKcxpHLvuw9F0lEFfPyJz3/jvw5bTMl2UKfER7m/iLlDbOlQHcSiU4sw+Tyj1g5WzMsBsoJgNo6pL6QStav/GSGIqFftcKcqx4xu+8/NQ6nkryqyljdHJt5xEE3gGehQ3G+L0Z6Wmo6/13LTeoGwtBrvslteJFDSKzCcnynrGYqCjyDzIH3v8ank4/6EEprojZ0xqvGK8nz4FYoh7FmhU50XeTVjjAfgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAzI8tW8PRH6xQTOEvFgvdpqTiclLkkcrIJjgdeWo4Q=;
 b=XyPlMK//wafXLp7m9eL/PTaG38zp9KVzfBjDs1LeLsuw1RTgzKzvANRurAr23J6rzAuXySAaRMIRdgeOyw3+zSOPMKajsEqKSxMEHvQv0lt0+8R/j6YC+/aMDgj6aKFd61TZW7elqMqrTtqRxZSdZlgpzYey2+Nx2XuF3XqJp45W2S/kdmbyLtWHTXpfoLPrN9lfD/ySuGu+6saVGuZHCA328/afRZnAozyciJHjRUoeMsdZ14lFPnic6sAWcmzj6WkhE8QK8wk53PEzYqGhXMdbQlMvrNHdJh+MJRZNZlQVJyEwZABZ33thNFuCRHWMZqad7kNWBkLP7n0ps5PZfA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2346.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:7::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.26; Thu, 25 Jan 2024 14:45:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 14:45:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/6xx: set High BAT Enable flag on G2_LE cores
Thread-Topic: [PATCH v2] powerpc/6xx: set High BAT Enable flag on G2_LE cores
Thread-Index: AQHaTrGFANWtDXaKLkSPERmDOOS1C7DqnOgA
Date: Thu, 25 Jan 2024 14:45:33 +0000
Message-ID: <261ac652-6f7b-4a41-884b-f917ae574285@csgroup.eu>
References: <20240124103838.43675-1-matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20240124103838.43675-1-matthias.schiffer@ew.tq-group.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2346:EE_
x-ms-office365-filtering-correlation-id: 73bd86d9-635c-4142-ca0d-08dc1db44929
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  LDgsWRzLGMHdoe4ppWVR4tMxecSDWmdGjGE7AK1ekQ4CrR3ehaV9q29fuUE6ix4bg5vV+1Z2q4+qvYEFhq2/7fVqS1gOLojpG6a8+izSlVqlFZkt6Zvki5xjd3wg8FJd2PZgIx5jD0SXgkQqSYxyVEUC9CB0gBp0nMsbxUlrKIkAdb6/tOOXsB3eiYLWNVQbnIkcv2T1kD2lVztMSbNnpQq9wZB0cvCkno8aUVY+IqXJ7Cj13oO4keNVIbZ2OhzQ0snKrXrIMDhp4k4RP+OVLsPYHScx7o0nhSIZpOFIVIM0DIHWoGSjV+6ipPo+nKORySbJxpFFe2DgE+hakTSTt6ClWS74bOdbOytXPqUtMyR5KnuRvBU1mPatBc0ivtePxCXUQLZ11qv2GXG9Lck75Pc+Eejj5y5Vs6jsPrpkTCRQtR6A1+IOWlDScrS8FlCArEUF/IKWXm9onIKaDp0XDXRF3prZ+O6/pwHECGRajzg3QEiwdridcfpg5p4RCKt0pxQPMayMU+Xg5+AN/FqCQs+X6WORHY7yDnuYIhxcMGLyk+iDKf7YRvL/cY8f+m0/rP4h4Y/R0qxAkxR6bFcFj/yOLMqK4H32HubBdRbpR+pIKTglpWuWrnnDIsmyn47BQVzHcueftgBgjCiJw82mLJw+40jQ/hJc1fVUGeK3xHs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(83380400001)(41300700001)(110136005)(36756003)(31696002)(38070700009)(86362001)(122000001)(38100700002)(2616005)(66574015)(26005)(6512007)(6486002)(966005)(6506007)(71200400001)(478600001)(316002)(76116006)(91956017)(66556008)(66476007)(66446008)(64756008)(54906003)(66946007)(2906002)(5660300002)(4326008)(8936002)(44832011)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?REVzT1h5dGtDRkoxeitHN1FGbklaM3NrVTdLYlFxcFdicGtoaktFT1BWYUNz?=
 =?utf-8?B?cW9JRHJsN2hYNjYxK0JHbFVoVGxkR1pIKzZMNmVSWWdYQ01uS1RYSVQ5U3Rw?=
 =?utf-8?B?bUJNbDJ3ZzJ4T3A0dFJ5aTI4YzYvSXdRQXJwRXNzRDhmQVFRbktwbEhwSWpH?=
 =?utf-8?B?RzVZSGp0SVR1QjIvZFhxVTU5cWY2VlVObFRmVWlGS1VnS3R1UEZnNk1vSFg5?=
 =?utf-8?B?OElRTTBWbkJtNjVMcThhVk04VjFRUFdwcG1NYnhLUEhXWExFaC9MM09JbHJP?=
 =?utf-8?B?djNCL0VIYndLTW9uOG5xaDhRbERNUE15ejRYSzJycmlKQUh5clhkOGJlUW9h?=
 =?utf-8?B?MDd6cUx2aEZxSmRWZis3Y0kzN21QOHVjTzNaZmxkMUVlMHZINlJZVGVtYlMz?=
 =?utf-8?B?NExYelo2dlFXaXdTZE8zNG5COXpkWExIUFBYTnc1dzJMb0JmMDkxampPRE1w?=
 =?utf-8?B?NFdLT3pDa1R2amZZdnBOa1d1OTRNaFJIYzNUOFNQK044VmxLMldLNlpuMTBl?=
 =?utf-8?B?Mkt6YU4xQVJ2UEx5N2oydTV4ZE9oVWFsSFVUZlhZTFFnM0xQTmxaRWNabENF?=
 =?utf-8?B?NDI1NExTM0ZFcWdoaXp4bUVtV3k2NktOZW0zZk56aGlmbXorRTI4RVc5aVhj?=
 =?utf-8?B?VUplM3RTUUh1QUJhMHBtL2cwWE1wYmNDaE5HdEFERXZmRFJ4TlJYc0RzSUdu?=
 =?utf-8?B?WDNtdXlhQXd3SmVBbkREaitCcHNkeFk0Y3pnTHNOOVU5MmtxYkZXcEUxTW1t?=
 =?utf-8?B?RFFPUWhFNHBWbHRLTThLN0FsRm5JbHp6Sm9TVzJGVUlZdmJiM0hYWjV6ZXVS?=
 =?utf-8?B?QTdVSVhkOERCditMbnVFdm5LQ2dmWkFINVBxSkdVRnlMM1JkSnBtZVFHTzhK?=
 =?utf-8?B?dFhNSStnTEdScGlzK2k3ZktmejM5TjhXMmg4NDl3cVNGT0xDLzVyYmQ0VUlS?=
 =?utf-8?B?YXVsM25GNVJpeHBjbW0wWW1Za2tyVmtDbC9UVjNOSmtIQnNzZWVUbitjMWNG?=
 =?utf-8?B?MGZ6dWdhbnYyUmhVSUwvZjhpQzhtT25mYjJycDdWQll5aTZlZ2VqUGFPZGZG?=
 =?utf-8?B?WmNQOTUzbk5Ua3A3MTR5ZWh3ZGhCYzlYa2hjNlJBOHIyR3VvWDd6d2RWK2tW?=
 =?utf-8?B?ZU84WGpEc3g2Ryt3a3ZEVHMzcEoyQUNTS0EyamMvUE9neTVlK3MzNnRGbWc4?=
 =?utf-8?B?T3ZiZFo4RWFhWk5lckU2NmZpMVBaRlMrQnJDNmc4NUp0Z1pWakQ0dFNHd3J5?=
 =?utf-8?B?ZHpSTGhobWFWYXZWRTZDM0hXazF0bEhRYkN0NGh2QTU0RVRIdHlHclYwenkz?=
 =?utf-8?B?Rm12WkgyMWYxMm5FbkdjTk12VEhZeU9hc3ZIRklwaFNOdzA5czVtNVNZUEZ5?=
 =?utf-8?B?UWlrMDFUeUwwUFNGQllIcXc2T1dOdEw4TnQ5TDA1S1VMN3B6VG5YU214bjBH?=
 =?utf-8?B?d01jR3o4RTJlbnlKN2NrTUdrelg5QmM2RmJjQllkbXdRUGc2OGRDQnhsREJW?=
 =?utf-8?B?V2FUZEhzcVdZR0Naa1BrZFlOWGgwbDBHU3l2dDVESzJLOHhNc0ZqUjNtTkpG?=
 =?utf-8?B?QnBGUVRUODQ0QUhZVCtnZGxnVFZYK1lzVWQ5TmFjUmUvb2VHeXBqR2RrWUZn?=
 =?utf-8?B?UDlwT3hJaHRKRU01UElPQ1BxNG4rblFDNGFIMUJqU0dWeTFJZkxDRkJFWHV4?=
 =?utf-8?B?dVpWQVlRZlNiZm40M0JPRFJWQ1E3M1F4OEtXRmlKVnYvN0d5SWRrQWpKcERT?=
 =?utf-8?B?dWIreVRqVUU1ODdtQ3pzZTBYOVN3L20rb1VWYWdBMGxzMzVoN05lWDhETURi?=
 =?utf-8?B?MHd2bnlMbUIzM2NTVUlreG4xaFcrSEhtd2xVUjhZSnBUUkwxeDBNYWdxY2o4?=
 =?utf-8?B?UEJxdVlWYmhwWTR0S3dKZWR4dXozUDkyVUlqaHZQd2VudkVFOFBsVXdvUS9k?=
 =?utf-8?B?NGhZd3VYQi9WbkVNZ0xNM2ovRHdmZ2g1VGdzeUNvMDhUZU1NUHNBejU1UDlH?=
 =?utf-8?B?QmFwTjFDODJQZHRubTVsTzlyUlUvVitVeldaL2lPSEI4WG81MFlPa3IvVFNB?=
 =?utf-8?B?U09ub2FVTXpyb2NOazFVc0lQNGI0bW02M1dXbkd1Uk5aSW5mc1VCMEJ3QTRH?=
 =?utf-8?Q?bLwgrf2JbEKKYhlnZV5OYPa7y?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86F904569F203B43AE6CBA0CA834DDF5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bd86d9-635c-4142-ca0d-08dc1db44929
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 14:45:33.8210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xqf7IAMnJix2yVrMR8yxh+n1QRG/PXTbmZA8y9N2+XABD5HmwPIkkLBb3sqYY/0T70C3X9CLwAwL7TxIPplmYy+wdEwFao8owfLYKvkKhHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2346
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux@ew.tq-group.com" <linux@ew.tq-group.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzAxLzIwMjQgw6AgMTE6MzgsIE1hdHRoaWFzIFNjaGlmZmVyIGEgw6ljcml0wqA6
DQo+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG1hdHRoaWFz
LnNjaGlmZmVyQGV3LnRxLWdyb3VwLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBp
bXBvcnRhbnQgw6AgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9u
IF0NCj4gDQo+IE1NVV9GVFJfVVNFX0hJR0hfQkFUUyBpcyBzZXQgZm9yIEcyX0xFIGNvcmVzIGFu
ZCBkZXJpdmF0aXZlcyBsaWtlIGUzMDBjWCwNCj4gYnV0IHRoZSBoaWdoIEJBVHMgbmVlZCB0byBi
ZSBlbmFibGVkIGluIEhJRDIgdG8gd29yay4gQWRkIHJlZ2lzdGVyDQo+IGRlZmluaXRpb25zIGFu
ZCBhZGQgdGhlIG5lZWRlZCBzZXR1cCB0byBfX3NldHVwX2NwdV82MDMuDQo+IA0KPiBUaGlzIGZp
eGVzIGJvb3Qgb24gQ1BVcyBsaWtlIHRoZSBNUEM1MjAwQiB3aXRoIFNUUklDVF9LRVJORUxfUldY
IGVuYWJsZWQNCj4gb24gc3lzdGVtcyB3aGVyZSB0aGUgZmxhZyBoYXMgbm90IGJlZW4gc2V0IGJ5
IHRoZSBib290bG9hZGVyIGFscmVhZHkuDQo+IA0KPiBGaXhlczogZTRkNjY1NGViZTZlICgicG93
ZXJwYy9tbS8zMnM6IHJld29yayBtbXVfbWFwaW5fcmFtKCkiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBN
YXR0aGlhcyBTY2hpZmZlciA8bWF0dGhpYXMuc2NoaWZmZXJAZXcudHEtZ3JvdXAuY29tPg0KDQpS
ZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
Pg0KDQo+IC0tLQ0KPiANCj4gdjI6DQo+IC0gVXNlIHRoZSBHMl9MRSBuYW1lIGZvciBjb3JlcyB0
aGF0IGhhdmUgdGhpcyBISUQyIHJlZ2lzdGVyDQo+IC0gRXh0ZW5kIF9fc2V0dXBfY3B1XzYwMyBp
bnN0ZWFkIG9mIGludHJvZHVjaW5nIGEgbmV3IHNldHVwIGZ1bmN0aW9uDQo+IA0KPiANCj4gICBh
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcmVnLmggICAgICB8ICAyICsrDQo+ICAgYXJjaC9wb3dl
cnBjL2tlcm5lbC9jcHVfc2V0dXBfNnh4LlMgfCAyMCArKysrKysrKysrKysrKysrKysrLQ0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9yZWcuaCBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9yZWcuaA0KPiBpbmRleCA0YWU0YWI5MDkwYTIuLmFkZTVmMDk0ZGJkMiAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3JlZy5oDQo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9yZWcuaA0KPiBAQCAtNjE3LDYgKzYxNyw4IEBADQo+ICAg
I2VuZGlmDQo+ICAgI2RlZmluZSBTUFJOX0hJRDIgICAgICAweDNGOCAgICAgICAgICAgLyogSGFy
ZHdhcmUgSW1wbGVtZW50YXRpb24gUmVnaXN0ZXIgMiAqLw0KPiAgICNkZWZpbmUgU1BSTl9ISUQy
X0dFS0tPICAgICAgICAweDM5OCAgICAgICAgICAgLyogR2Vra28gSElEMiBSZWdpc3RlciAqLw0K
PiArI2RlZmluZSBTUFJOX0hJRDJfRzJfTEUgICAgICAgIDB4M0YzICAgICAgICAgICAvKiBHMl9M
RSBISUQyIFJlZ2lzdGVyICovDQo+ICsjZGVmaW5lICBISUQyX0cyX0xFX0hCRSAgICAgICAgKDE8
PDE4KSAgICAgICAgIC8qIEhpZ2ggQkFUIEVuYWJsZSAoRzJfTEUpICovDQo+ICAgI2RlZmluZSBT
UFJOX0lBQlIgICAgICAweDNGMiAgIC8qIEluc3RydWN0aW9uIEFkZHJlc3MgQnJlYWtwb2ludCBS
ZWdpc3RlciAqLw0KPiAgICNkZWZpbmUgU1BSTl9JQUJSMiAgICAgMHgzRkEgICAgICAgICAgIC8q
IDgzeHggKi8NCj4gICAjZGVmaW5lIFNQUk5fSUJDUiAgICAgIDB4MTM1ICAgICAgICAgICAvKiA4
M3h4IEluc24gQnJlYWtwb2ludCBDb250cm9sIFJlZyAqLw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2tlcm5lbC9jcHVfc2V0dXBfNnh4LlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL2NwdV9z
ZXR1cF82eHguUw0KPiBpbmRleCBmMjljZTNkZDYxNDAuLmJmZDNmNDQyZTVlYiAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9jcHVfc2V0dXBfNnh4LlMNCj4gKysrIGIvYXJjaC9w
b3dlcnBjL2tlcm5lbC9jcHVfc2V0dXBfNnh4LlMNCj4gQEAgLTI2LDYgKzI2LDE1IEBAIEJFR0lO
X0ZUUl9TRUNUSU9ODQo+ICAgICAgICAgIGJsICAgICAgX19pbml0X2ZwdV9yZWdpc3RlcnMNCj4g
ICBFTkRfRlRSX1NFQ1RJT05fSUZDTFIoQ1BVX0ZUUl9GUFVfVU5BVkFJTEFCTEUpDQo+ICAgICAg
ICAgIGJsICAgICAgc2V0dXBfY29tbW9uX2NhY2hlcw0KPiArDQo+ICsgICAgICAgLyoNCj4gKyAg
ICAgICAgKiBUaGlzIGFzc3VtZXMgdGhhdCBhbGwgY29yZXMgdXNpbmcgX19zZXR1cF9jcHVfNjAz
IHdpdGgNCj4gKyAgICAgICAgKiBNTVVfRlRSX1VTRV9ISUdIX0JBVFMgYXJlIEcyX0xFIGNvbXBh
dGlibGUNCj4gKyAgICAgICAgKi8NCj4gK0JFR0lOX01NVV9GVFJfU0VDVElPTg0KPiArICAgICAg
IGJsICAgICAgc2V0dXBfZzJfbGVfaGlkMg0KPiArRU5EX01NVV9GVFJfU0VDVElPTl9JRlNFVChN
TVVfRlRSX1VTRV9ISUdIX0JBVFMpDQo+ICsNCj4gICAgICAgICAgbXRsciAgICByNQ0KPiAgICAg
ICAgICBibHINCj4gICBfR0xPQkFMKF9fc2V0dXBfY3B1XzYwNCkNCj4gQEAgLTExNSw2ICsxMjQs
MTYgQEAgU1lNX0ZVTkNfU1RBUlRfTE9DQUwoc2V0dXBfNjA0X2hpZDApDQo+ICAgICAgICAgIGJs
cg0KPiAgIFNZTV9GVU5DX0VORChzZXR1cF82MDRfaGlkMCkNCj4gDQo+ICsvKiBFbmFibGUgaGln
aCBCQVRzIGZvciBHMl9MRSBhbmQgZGVyaXZhdGl2ZXMgbGlrZSBlMzAwY1ggKi8NCj4gK1NZTV9G
VU5DX1NUQVJUX0xPQ0FMKHNldHVwX2cyX2xlX2hpZDIpDQo+ICsgICAgICAgbWZzcHIgICByMTEs
U1BSTl9ISUQyX0cyX0xFDQo+ICsgICAgICAgb3JpcyAgICByMTEscjExLEhJRDJfRzJfTEVfSEJF
QGgNCj4gKyAgICAgICBtdHNwciAgIFNQUk5fSElEMl9HMl9MRSxyMTENCj4gKyAgICAgICBzeW5j
DQo+ICsgICAgICAgaXN5bmMNCj4gKyAgICAgICBibHINCj4gK1NZTV9GVU5DX0VORChzZXR1cF9n
Ml9sZV9oaWQyKQ0KPiArDQo+ICAgLyogNzQwMCA8PSByZXYgMi43IGFuZCA3NDEwIHJldiA9IDEu
MCBzdWZmZXIgZnJvbSBzb21lDQo+ICAgICogZXJyYXRhcyB3ZSB3b3JrIGFyb3VuZCBoZXJlLg0K
PiAgICAqIE1vdG8gTVBDNzEwQ0UucGRmIGRlc2NyaWJlcyB0aGVtLCB0aG9zZSBhcmUgZXJyYXRh
DQo+IEBAIC00OTUsNCArNTE0LDMgQEAgX0dMT0JBTChfX3Jlc3RvcmVfY3B1X3NldHVwKQ0KPiAg
ICAgICAgICBtdGNyICAgIHI3DQo+ICAgICAgICAgIGJscg0KPiAgIF9BU01fTk9LUFJPQkVfU1lN
Qk9MKF9fcmVzdG9yZV9jcHVfc2V0dXApDQo+IC0NCj4gLS0NCj4gVFEtU3lzdGVtcyBHbWJIIHwg
TcO8aGxzdHJhw59lIDIsIEd1dCBEZWxsaW5nIHwgODIyMjkgU2VlZmVsZCwgR2VybWFueQ0KPiBB
bXRzZ2VyaWNodCBNw7xuY2hlbiwgSFJCIDEwNTAxOA0KPiBHZXNjaMOkZnRzZsO8aHJlcjogRGV0
bGVmIFNjaG5laWRlciwgUsO8ZGlnZXIgU3RhaGwsIFN0ZWZhbiBTY2huZWlkZXINCj4gaHR0cHM6
Ly93d3cudHEtZ3JvdXAuY29tLw0KPiANCg==
