Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B576D2CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 19:31:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qLlj33CgzDqWp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 03:31:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=nam04-bn3-obe.outbound.protection.outlook.com
 (client-ip=40.107.68.77; helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=thomas.lendacky@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="KWAJqDln"; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680077.outbound.protection.outlook.com [40.107.68.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qLjY4YCRzDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 03:29:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J64l/XzY5QP8ronq/fmbuf9ueelpuX0+WsfWSeXJBnPC9wBDdDjJeFLXH/xr3bR6uMi4OgyzxZlScSgsUJKivtiPvytvrmP0jQyPOZfOjaIpoFo68fIvlhIt+LFYq9dO001EzjcP5Q9vAI592LkOVaAvYw+fAT16dbWnhmS+NN8OqfaayG3YR+QL5WuVqbr9jd28gTkl7nS6kxktQaSsMNXbCFHyIFPSYpcc+3+YXxW5vi4lQH74xm+PwIDm/ZAfkkGUW9PZLllrtskOneOWMwn/lvOnLnUhTfrbYYUHE/VpXITOOzoi2uSeVURjh8h/XQzUl9KnJ+vK15jTJtFOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ad+6b7kITJgXg4eMCaY92QAzPBBwQY35tBvaAL5/8ws=;
 b=Ncj+0nQa9VIame/3By3e7PeoGRnAbMVvQaQJtHLmVWUAwCj/30fLLWBNIiroOLB7529ZFQGKNe1GMcuN2KgCShgjGL1A5IhVt6xMzTvRsHAU4KYMblf26P7PftaXD1dm7DG/HwwZG1N11rZOCMJRt3lmT4yykIRe1ryAg7L8akbVO5xEoPHAknX0AH2kK63E3x4tWDdEMLE7RJ7dr+IBaa/EGLmTh8cibnrulY98kxLLRDN9tIBJGJ7F2K0P4hi2NEBEl257CvOG0Vcri7DAZbE86B1FPaT7nHNnQgUgLh9vq9JyC/dItdvCyFfsupZOhWeWRwNAgAOTqv/AFiRwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ad+6b7kITJgXg4eMCaY92QAzPBBwQY35tBvaAL5/8ws=;
 b=KWAJqDlnyCPMPyyvCQJ14nniAHQGxMYBwCQMU5yM3TmQw7yAmRknn6gIWKkpekJBJPFvjsA98lCmeUvvjPNik27WfqoLqeiJaWTjLOuImmE7hfdUm8C83inzsTu4LlhoNGhshEkJRfnHTpxGhW2+1qmmStJliGTYZ6Or6tgjQ8U=
Received: from DM6PR12MB3163.namprd12.prod.outlook.com (20.179.104.150) by
 DM6PR12MB3099.namprd12.prod.outlook.com (20.178.30.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Thu, 18 Jul 2019 17:29:30 +0000
Received: from DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::9c3d:8593:906c:e4f7]) by DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::9c3d:8593:906c:e4f7%6]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 17:29:30 +0000
From: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, "x86@kernel.org"
 <x86@kernel.org>
Subject: Re: [PATCH v3 3/6] dma-mapping: Remove dma_check_mask()
Thread-Topic: [PATCH v3 3/6] dma-mapping: Remove dma_check_mask()
Thread-Index: AQHVPRkFgsylEpGHoUyUZi7jfgONZabQooCA
Date: Thu, 18 Jul 2019 17:29:30 +0000
Message-ID: <b11497b4-424b-ac42-e85b-e89524e67e8b@amd.com>
References: <20190718032858.28744-1-bauerman@linux.ibm.com>
 <20190718032858.28744-4-bauerman@linux.ibm.com>
In-Reply-To: <20190718032858.28744-4-bauerman@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN1PR12CA0099.namprd12.prod.outlook.com
 (2603:10b6:802:21::34) To DM6PR12MB3163.namprd12.prod.outlook.com
 (2603:10b6:5:182::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Thomas.Lendacky@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08159723-7f29-4350-8322-08d70ba57db8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3099; 
x-ms-traffictypediagnostic: DM6PR12MB3099:
x-microsoft-antispam-prvs: <DM6PR12MB3099C4EB9F221E315CB13570ECC80@DM6PR12MB3099.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(189003)(199004)(3846002)(25786009)(6486002)(6506007)(386003)(7736002)(71190400001)(53546011)(446003)(71200400001)(7416002)(36756003)(81166006)(316002)(81156014)(110136005)(6116002)(102836004)(68736007)(54906003)(6246003)(76176011)(31696002)(66066001)(6436002)(2501003)(5660300002)(8676002)(31686004)(64756008)(229853002)(66476007)(66446008)(26005)(476003)(486006)(2616005)(66946007)(52116002)(53936002)(8936002)(2906002)(186003)(478600001)(6512007)(14454004)(305945005)(86362001)(66556008)(4326008)(256004)(99286004)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3099;
 H:DM6PR12MB3163.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DyTU5flNDNBBCzjpAqzG1daGdOEdSIVLDhAjRZjhYFO0iSdyyghjrySaNAfY+wLI+1e7AHVMUT08kuV7tkFVu5rRs0pLpptsEdbb+Kve5ESjqoK235JvSCFjW7d77CIJYIabTas/S87OrhwesUtQNBLQwNSsRkNYIW0/zniR3+Zs1wspn7GCQNmGWzN+HpqZxtirA6nhLAe21VIAkUZu1ZpCe9aUK6sqgg3MPPfSYBIveqhlN7nQZ2sSn064K/MKkzGB4tWLfAo5hOtSP0E82sffeghk0AsqzJnOKLQ7Q8XTsyJkSXXbBa0YbTs6wlGW+el9gM30OGAQzIi6UzZO8TgBHYgwqx5GPvWlwtnexCKjqG1haU+QaZ9p0xiPtR7ri0SzT7ZIT9zQXwYKN4iZklYtQbd+uuavzv17brmrYNQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65559D157A6B024188913D5CB53D72FA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08159723-7f29-4350-8322-08d70ba57db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 17:29:30.5136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlendack@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3099
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gNy8xNy8xOSAxMDoyOCBQTSwgVGhpYWdvIEp1bmcgQmF1ZXJtYW5uIHdyb3RlOg0KPiBzbWVf
YWN0aXZlKCkgaXMgYW4geDg2LXNwZWNpZmljIGZ1bmN0aW9uIHNvIGl0J3MgYmV0dGVyIG5vdCB0
byBjYWxsIGl0IGZyb20NCj4gZ2VuZXJpYyBjb2RlLiBDaHJpc3RvcGggSGVsbHdpZyBtZW50aW9u
ZWQgdGhhdCAiVGhlcmUgaXMgbm8gcmVhc29uIHdoeSB3ZQ0KPiBzaG91bGQgaGF2ZSBhIHNwZWNp
YWwgZGVidWcgcHJpbnRrIGp1c3QgZm9yIG9uZSBzcGVjaWZpYyByZWFzb24gd2h5IHRoZXJlDQo+
IGlzIGEgcmVxdWlyZW1lbnQgZm9yIGEgbGFyZ2UgRE1BIG1hc2suIiwgc28ganVzdCByZW1vdmUg
ZG1hX2NoZWNrX21hc2soKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRoaWFnbyBKdW5nIEJhdWVy
bWFubiA8YmF1ZXJtYW5AbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRvbSBMZW5kYWNr
eSA8dGhvbWFzLmxlbmRhY2t5QGFtZC5jb20+DQoNCj4gLS0tDQo+ICBrZXJuZWwvZG1hL21hcHBp
bmcuYyB8IDggLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kbWEvbWFwcGluZy5jIGIva2VybmVsL2RtYS9tYXBwaW5n
LmMNCj4gaW5kZXggMWY2MjhlN2FjNzA5Li42MWVlZWZiZmNiMzYgMTAwNjQ0DQo+IC0tLSBhL2tl
cm5lbC9kbWEvbWFwcGluZy5jDQo+ICsrKyBiL2tlcm5lbC9kbWEvbWFwcGluZy5jDQo+IEBAIC0y
OTEsMTIgKzI5MSw2IEBAIHZvaWQgZG1hX2ZyZWVfYXR0cnMoc3RydWN0IGRldmljZSAqZGV2LCBz
aXplX3Qgc2l6ZSwgdm9pZCAqY3B1X2FkZHIsDQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MKGRtYV9m
cmVlX2F0dHJzKTsNCj4gIA0KPiAtc3RhdGljIGlubGluZSB2b2lkIGRtYV9jaGVja19tYXNrKHN0
cnVjdCBkZXZpY2UgKmRldiwgdTY0IG1hc2spDQo+IC17DQo+IC0JaWYgKHNtZV9hY3RpdmUoKSAm
JiAobWFzayA8ICgoKHU2NClzbWVfZ2V0X21lX21hc2soKSA8PCAxKSAtIDEpKSkNCj4gLQkJZGV2
X3dhcm4oZGV2LCAiU01FIGlzIGFjdGl2ZSwgZGV2aWNlIHdpbGwgcmVxdWlyZSBETUEgYm91bmNl
IGJ1ZmZlcnNcbiIpOw0KPiAtfQ0KPiAtDQo+ICBpbnQgZG1hX3N1cHBvcnRlZChzdHJ1Y3QgZGV2
aWNlICpkZXYsIHU2NCBtYXNrKQ0KPiAgew0KPiAgCWNvbnN0IHN0cnVjdCBkbWFfbWFwX29wcyAq
b3BzID0gZ2V0X2RtYV9vcHMoZGV2KTsNCj4gQEAgLTMyNyw3ICszMjEsNiBAQCBpbnQgZG1hX3Nl
dF9tYXNrKHN0cnVjdCBkZXZpY2UgKmRldiwgdTY0IG1hc2spDQo+ICAJCXJldHVybiAtRUlPOw0K
PiAgDQo+ICAJYXJjaF9kbWFfc2V0X21hc2soZGV2LCBtYXNrKTsNCj4gLQlkbWFfY2hlY2tfbWFz
ayhkZXYsIG1hc2spOw0KPiAgCSpkZXYtPmRtYV9tYXNrID0gbWFzazsNCj4gIAlyZXR1cm4gMDsN
Cj4gIH0NCj4gQEAgLTM0NSw3ICszMzgsNiBAQCBpbnQgZG1hX3NldF9jb2hlcmVudF9tYXNrKHN0
cnVjdCBkZXZpY2UgKmRldiwgdTY0IG1hc2spDQo+ICAJaWYgKCFkbWFfc3VwcG9ydGVkKGRldiwg
bWFzaykpDQo+ICAJCXJldHVybiAtRUlPOw0KPiAgDQo+IC0JZG1hX2NoZWNrX21hc2soZGV2LCBt
YXNrKTsNCj4gIAlkZXYtPmNvaGVyZW50X2RtYV9tYXNrID0gbWFzazsNCj4gIAlyZXR1cm4gMDsN
Cj4gIH0NCj4gDQo=
