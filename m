Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC24C5E04
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Feb 2022 19:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6BXd0FJvz3bny
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 05:16:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::622;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6BX34tYzz30Nj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 05:15:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqadLqcfGYl+WrjDxSTsDZ1Soph6sd5RiRO2Z6bfCcXgBtp/iLFx43WGLTFm+vqvKXbXlf0WHRmlPnaE5g0LnA6tu4taDnfdTpcgHpike1I4oOZjVT2ZkOgcCqK6goFQ8iNX7SreP/7giqb/kEP/wPWTT/dRhUA2O19CobuQu3C9FhulUqpZsmOgWpHc2Ic0SGFI+SVkBswga+RAQFAVbn3cWpR/lb+kDY4Zi76moC0D4N4J3/9iqlFtag2LA/QLf5PvfU/QxExMsuL1h072WAhbQ5I+CrOKVz5lsbynhwEnQZPCZqzD0s3e7NEK3XymaP6RSnVNQI/+O0OIvRPkKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYeagP1ThBsatQ9DwHFI+wzQF/so3h8AME1EtCEpcHE=;
 b=A6ITEBqxj9nVZEfiySjQ2+I83Xc5drYGmwh5ryhGE/UH7hksKu28oMFTaAJzT/J7ukmqbSvzhR09TDN2j6zQdPbfT9d+tVmZXzPef/Shohr3iiPox62tWdBaPhWrXj2OJdAS0f5cXE8QPqz45eoAME2pIbvn9ADy8ibbEwTK7ugv+V/Knl0TXauLeMvzACr7UnghXrLiD+tvrlCHas9nMDDiJue7Ns8u4QBSy0cnQ+1STnvmYce26raTf28k/d7rgZnR0zO8oQexsWux3njqbpoOj+plNlOM1g6A77C/ixqT8r3VqREKzarSzico4dBscUr/zurrK1rDlx3eXNPNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2739.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:38::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Sun, 27 Feb
 2022 18:15:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%5]) with mapi id 15.20.5017.026; Sun, 27 Feb 2022
 18:15:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christoph Hellwig <hch@lst.de>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH 08/11] swiotlb: make the swiotlb_init interface more useful
Thread-Topic: [PATCH 08/11] swiotlb: make the swiotlb_init interface more
 useful
Thread-Index: AQHYK+d7zyfGvpMeO0af+hVExH8R66yntCgA
Date: Sun, 27 Feb 2022 18:15:23 +0000
Message-ID: <3f5c827f-8e91-baef-7114-784a0c65e298@csgroup.eu>
References: <20220227143055.335596-1-hch@lst.de>
 <20220227143055.335596-9-hch@lst.de>
In-Reply-To: <20220227143055.335596-9-hch@lst.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56a95360-498d-45de-c58d-08d9fa1d1f28
x-ms-traffictypediagnostic: MR1P264MB2739:EE_
x-microsoft-antispam-prvs: <MR1P264MB2739A46884510C4D4AB0BAA4ED009@MR1P264MB2739.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xxmOPUwaQx8LLpBnpnXVxQ9nSW575FipLBUYRNnsiQM/7xvGoPuo4q7W3FT50TX0JPsKpHrnWXqHFeCaA6hSNNvj4nRtRuIZ5kcQYzQ4CUFz16NbFveoqMnNUI7lCgTr3uKb8V+bUfFfu+YEBgCy5rV2RuF6udcUlEcq2ZTuj1UgVP3/0SRMahQCgn56flbgarqLLWKolrTi5ruvcjVj3tmTQw3DH1NBnDLqO1hkwwhBg7PqL0E3KeWz6yk/U+JGI7uqq1/jMI0vDkWSZa+HO9SPVhZq4E/UWy7qFjQehTtZ+ebOjUjvSBFE6KX34i6VBw+/c8RATZLaBVl0ZXkPATsa3v+4dtDzdysjgaOINCkaShgq3bansnOmYhaFZWKU6PFiayG6nXqNemEZPxM8BHnFhFYDCv+9XA/Y7E3a90ReiynkBLKsMSpYMtXmiS16xhAOc0Wkl2YuyITl5QqVmwOcPcuP6/EGvm5IaZWZz6HVOSelU9oYnjswWFUsu5nOfa2F8/5DS63ZYDvY+FRReTNxyyhUgzyahTgQBM+Y8i6NsGPkMA3zE8IVMCWyF2TA9XDyyn8+vH5OeqTRVBOHH/q7S1dqJ+x+eVUcn7h0C+Yqygg9IZWLJZNum3eqfsEpwUEznjxqEvroiCHDHCFAsxQBdTyGFArgm0S/5VRtlyZsG1TRMVdaJWTfGxrKX5urU1wH/oOL4V0642sOrqAAo6Xh4fvHd+Tl7Lp7skr7xgNkVPjCTAjPDmkAC5bBevPbqLz7zSQwWqfZldSy/WqhKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(26005)(8676002)(186003)(2616005)(110136005)(54906003)(508600001)(83380400001)(2906002)(6486002)(316002)(38070700005)(6512007)(5660300002)(4326008)(7416002)(8936002)(38100700002)(71200400001)(86362001)(6506007)(36756003)(31696002)(44832011)(31686004)(76116006)(64756008)(66946007)(91956017)(66476007)(66446008)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WENxQkFFMWlOQmxRWlFVY1FPWm4rT2VyOWJ6bUVJNW50QWcwZkVmWHZ6NjRT?=
 =?utf-8?B?S1QxWGIveEZJeG9oY1R3WnVacm5PYWVoZ1JRTTlwcG9tZTZBZldEQ0NNbElk?=
 =?utf-8?B?aEtMOStQam5LZC9aaXBSUXpCNmh1MmhMRW1lWmsybW8ybnBFQkNFSWZMb2hi?=
 =?utf-8?B?M0hJUFIrWmpEcjRSZ1g1dFhyYUwwWnkyK2lWb3U5L21GNHBKcThneE1VQStM?=
 =?utf-8?B?d3AwblVJS1EwTWl2eDRkVU1IcVlvSDVEQnF5bU5hOElpd29rTXJHMTVPVHB4?=
 =?utf-8?B?bE56SVJuZkJtRDI2b214NUZIOHJFanQ3NGFpZzc3M3h2cEJ5M29XZTlZN3Jz?=
 =?utf-8?B?SzFCYTR2a0lzdVRUL2VUZlpHTWlVTnVqOHJXcCtDWVFGUi80TGc0NEVhYTN4?=
 =?utf-8?B?RXU5L0lUb3JXWEIwTzhFRW53R3Q3Y2hiNUlwOUhCczZFeW5pbmF1azFMU2h5?=
 =?utf-8?B?azMxc1k2Y05KK1Nuc1FiVjdvc0tqOVRJam5xSmlPQjhvN05ZTjFmMGhaVkto?=
 =?utf-8?B?cThZYlp1Q3JkYmdLZXpWdUdmb1pQYVI1eHRLTHQyd25KQ1BIOXVpLzdZUlVx?=
 =?utf-8?B?TytNTTZYNXNzNTQ3RVdvOFVUeVJGVm9qMEg0QWFPVThmV3pvOXZraW9jbEl2?=
 =?utf-8?B?MDVKMHhSMjBrOEt4d1c3bTcyUzBaeWZobEVlVmlYaC9WZnA2Y01PVkg2c2ts?=
 =?utf-8?B?bWpodjFHbHVXNmkyOGFETmtJK29OYkxXMUtnM0ZQUHpDckU0S0RlcnkybUdy?=
 =?utf-8?B?MEtsRTNQeTgwc09uNGk4ZHpLNnNxS3czQzhsNU9pOFp5aG1NbzQ5TjJwbTZB?=
 =?utf-8?B?dlVhREI3Q2ozUXJsSlJESWRPU051TTFjR1VjMk0vbXNZRDJRV3d0aFdyOThR?=
 =?utf-8?B?YzlOZjhxaWVnK0ZGRE12YmJnc1VzQ0s0RStaYWFQa3d2aytnS3JreG1jViti?=
 =?utf-8?B?TTFoTkdSMGhrSWhTdTRCbnpjQWM5a2ViUGZzUVpZVnVUVWhPSFZTdktxVllZ?=
 =?utf-8?B?NEREaE9NNjh3RHdDWGprTkFKbHRuUGFnYUxVcVdvNUJoaWVKSkVmMDBPZlV4?=
 =?utf-8?B?QndkcUFHT09BV2lFdnU0ZWh4OEZGdm5ORVBQMGQ1MExyR2dSdUh4bUFiWHZj?=
 =?utf-8?B?dWlJVDcveGdmeDBqMHdQUTBNTW9JOUppbUtNTjVEblVhZk5FQVZibVJvQUlI?=
 =?utf-8?B?cndYY1ZCOHhIMW9aR1FwK3IzUVU1bXNMY214cEV1OVlLS0JwK3ZQU05uTFQ2?=
 =?utf-8?B?dUUxWmM3bjNoUy9uTFNYYnpBeERwWlllK1lGNzhFcEZWWm1xby90TU5WUTFi?=
 =?utf-8?B?bC8zRVFBZmdqbnd6ZnhqUldqTDJUVWljczRNRWw0dWlHSTRHWm1GT0dnQStM?=
 =?utf-8?B?UzZod0FWOFExWEdjMFgxQ3N4Zml4TkJkclVKK2Z0MkRFZUEyNEltQVVXSmZD?=
 =?utf-8?B?bXA3bktYYmMvNHQrQ1cyZ1ViMlhOV0o2eE9WUTVqZFRkaHZYc3ozRmQ5Vzg0?=
 =?utf-8?B?TjN4c0huYkJVUGhRRUxZakdjTFFHdDFDbVJSWEZIeTZxM3FhV0JPUW9RZjRV?=
 =?utf-8?B?T2ZmSjBxNmtENS9obTVuQ2Z0YkRGeDQzb0dRcWhwWm8xc0NvNmlpcEVXZ3N0?=
 =?utf-8?B?SUFSd0pPOXBJK2paTW9GaXlkS3BaSmVCMGd2QVdkejR6VkZ4L3F1TEN1MUxj?=
 =?utf-8?B?V0syYjVMc2lWNDRxRHgvYkp6Vmx1RS96OFJZeWlTa09ZR1lHd3ZuTXJUaUR5?=
 =?utf-8?B?WjlWNU9aQVQ4Z1J4Qm03TTJYcmc1aHd3K2kyRjkzcFhNZGdaR3pBWTBITk91?=
 =?utf-8?B?UmdNaTBOcURvbVZzT25LMHhtbnc4ZXgwSzY5c3lwWFI3c09FUk10eWcvUXI0?=
 =?utf-8?B?YW5lWUIwTHBqbUUvNjdkWW1QSExDdkFLbFQzVWVENlFBWW9rd2RZamNFRGt4?=
 =?utf-8?B?a3docll3N092cDluQU5yWUYzUkh3NWxTSjhiaFk2K3IrTVRpeFVoSEorbk1G?=
 =?utf-8?B?UklFTHFiNzZ2MnVQWVZQVTV0aHBHQjJtUUU4T1puTEdIRDRpMklwZ1IwS0h5?=
 =?utf-8?B?NjhRTGt3UFNMUTE1Qk1TUW1aZ3VtL0pGQ2hwamNKQjdlVGtVbGI5RStpcXM3?=
 =?utf-8?B?VnYrMGcxczRPUzNmd3ZIRnpVcVZDcDFvYzExdkNxQTQ3ZjNwYWs5UTRiMm92?=
 =?utf-8?B?SHVaemhaKzdIRkQzK3ZDNWJHSEtFRXlPWktreHFEMWYrd1dGMjBaM1lLTmhx?=
 =?utf-8?Q?Wl7cviTeVgjdbmGsZgp40TpeVnDMNNBet62fL335QU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FE742FE772C63498FDD057F606855F7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a95360-498d-45de-c58d-08d9fa1d1f28
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2022 18:15:23.2616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gXSMr13XVpww7GYaD/Ph/PhwcuDEoaMtD772s/Tdn5coknXaY0HeExMHE1599gZWn024x+s6+jPocxEPjmsR8BeloLsRDosVcorIF1UtvP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2739
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
Cc: Juergen Gross <jgross@suse.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Joerg Roedel <joro@8bytes.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAyLzIwMjIgw6AgMTU6MzAsIENocmlzdG9waCBIZWxsd2lnIGEgw6ljcml0wqA6
DQo+IFBhc3MgYSBib29sIHRvIHBhc3MgaWYgc3dpb3RsYiBuZWVkcyB0byBiZSBlbmFibGVkIGJh
c2VkIG9uIHRoZQ0KPiBhZGRyZXNzaW5nIG5lZWRzIGFuZCByZXBsYWNlIHRoZSB2ZXJib3NlIGFy
Z3VtZW50IHdpdGggYSBzZXQgb2YNCj4gZmxhZ3MsIGluY2x1ZGluZyBvbmUgdG8gZm9yY2UgZW5h
YmxlIGJvdW5jZSBidWZmZXJpbmcuDQo+IA0KPiBOb3RlIHRoYXQgdGhpcyBwYXRjaCByZW1vdmVz
IHRoZSBwb3NzaWJpbGl0eSB0byBmb3JjZSB4ZW4tc3dpb3RsYg0KPiB1c2UgdXNpbmcgc3dpb3Rs
Yj1mb3JjZSBvbiB0aGUgY29tbWFuZCBsaW5lIG9uIHg4NiAoYXJtIGFuZCBhcm02NA0KPiBuZXZl
ciBzdXBwb3J0ZWQgdGhhdCksIGJ1dCB0aGlzIGludGVyZmFjZSB3aWxsIGJlIHJlc3RvcmVkIHNo
b3J0bHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4NCj4gLS0tDQo+ICAgYXJjaC9hcm0vbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgfCAg
NiArLS0tLQ0KPiAgIGFyY2gvYXJtNjQvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgIHwgIDYg
Ky0tLS0NCj4gICBhcmNoL2lhNjQvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICB8ICA0ICst
LQ0KPiAgIGFyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL2RtYS1vY3Rlb24uYyAgIHwgIDIgKy0NCj4g
ICBhcmNoL21pcHMvbG9vbmdzb242NC9kbWEuYyAgICAgICAgICAgICB8ICAyICstDQo+ICAgYXJj
aC9taXBzL3NpYnl0ZS9jb21tb24vZG1hLmMgICAgICAgICAgfCAgMiArLQ0KPiAgIGFyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9zd2lvdGxiLmggICAgIHwgIDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9t
bS9tZW0uYyAgICAgICAgICAgICAgICAgIHwgIDMgKystDQoNCmFyY2gvcG93ZXJwYy9tbS9tZW0u
bzooLnRvYysweDApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBwcGNfc3dpb3RsYl9mbGFncycN
Cm1ha2VbMV06ICoqKiBbdm1saW51eF0gRXJyb3IgMQ0KL2xpbnV4L01ha2VmaWxlOjExNTU6IHJl
Y2lwZSBmb3IgdGFyZ2V0ICd2bWxpbnV4JyBmYWlsZWQNCg0KDQo+ICAgYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9wc2VyaWVzL3NldHVwLmMgfCAgMyAtLS0NCj4gICBhcmNoL3Jpc2N2L21tL2luaXQu
YyAgICAgICAgICAgICAgICAgICB8ICA4ICstLS0tLQ0KPiAgIGFyY2gvczM5MC9tbS9pbml0LmMg
ICAgICAgICAgICAgICAgICAgIHwgIDMgKy0tDQo+ICAgYXJjaC94ODYva2VybmVsL2NwdS9tc2h5
cGVydi5jICAgICAgICAgfCAgOCAtLS0tLS0NCj4gICBhcmNoL3g4Ni9rZXJuZWwvcGNpLWRtYS5j
ICAgICAgICAgICAgICB8IDE1ICsrKysrKy0tLS0tDQo+ICAgYXJjaC94ODYvbW0vbWVtX2VuY3J5
cHRfYW1kLmMgICAgICAgICAgfCAgMyAtLS0NCj4gICBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5j
ICAgICAgICAgICAgICB8ICA0ICstLQ0KPiAgIGluY2x1ZGUvbGludXgvc3dpb3RsYi5oICAgICAg
ICAgICAgICAgIHwgMTUgKysrKysrLS0tLS0NCj4gICBpbmNsdWRlL3RyYWNlL2V2ZW50cy9zd2lv
dGxiLmggICAgICAgICB8IDI5ICsrKysrKysrLS0tLS0tLS0tLS0tLQ0KPiAgIGtlcm5lbC9kbWEv
c3dpb3RsYi5jICAgICAgICAgICAgICAgICAgIHwgMzUgKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0NCj4gICAxOCBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCA5MyBkZWxldGlvbnMo
LSkNCj4g
