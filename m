Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02662621942
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 17:22:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6D056d90z3f2q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 03:22:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=5Gp1mgMA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.48; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=5Gp1mgMA;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90048.outbound.protection.outlook.com [40.107.9.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Cz11Lw2z3f2r
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 03:21:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjYSKQukEEkhz/uyqcRv76kdu7xoO1OWlDRMazfzNGTy6tbEPchkuHQCVKHbU1J8ODWh0FG7Hw4hia06FyfIjFMRZ7rJVOqVWYsMItaj90MzLgnLRmtnbkEHKxNtGsWoOOxyNJB04NzpfTCdXR5KZqZndEIv1wn9tsdkcTsY5rUNUdj5RlTPJBVZ4QiRkvyldGcnKeNE5N5P1+HEq2qXQ+wR8sPlP6IDzArwhqT1dMLTIiaaB8o9UAMbgzcahiwwmxB5vEX8hqFZUWo/J03uijEFfJU6JY0KBg1fTsD+Jl4p7mRDkGzOxLFZU0z2rpm+iZDjbxT2cAbW8uJZhv/NSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6E9qn1C4R1YgXAUqtJ+sn/5pbpZGPfzky6Fi1ijJEKs=;
 b=IpmBuQ0K01mk7Woq6lbjir+YaHT8rbPDpQGsKGvnxHjKdZsedKOCdtf6Jc+AMUP8RgvdOYTnULI+FNsO0JY2J2Y6pjeoOHkwks17Gw13Lxo28quQoT8eMxd4Y+vgPJy4u+mhSu3nXHiEYXh7vssjUjtzaZRTStmHkWguDApeBr1wFhyl2ciAfhrGZN3GUp7QJnpgTR6QFzltZk1bMsnddtTTKJQFVunYDdA++8kXZT7+5jcIfpKbkVROHw4sCxa+hWFFn4leMuaA/OV+0bB1csauxDXv6qBs0Aqcb+wfc80aziVrerkNOi3yvzOoVnodUKM3bhj0md+hDVUE7MBPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E9qn1C4R1YgXAUqtJ+sn/5pbpZGPfzky6Fi1ijJEKs=;
 b=5Gp1mgMAXRuBDlHcKmrrIGgAmtKEZOaPUkEkt5GIn6Ljz7hiP8G3gmt/CdwvcBVw3pklw8WtQJosOs2JwoE3v3zp91qXlbAqLy4boiqkA3yzbRhFWstjbu7gKJ+vKAChQeSMScq/a2DVuYTrqH7gfvNGrDNc+F7JGRMneCrPpIgB9fnW4RsbinPeU3H/ZmEDVPenFGYhOclqcfaD0g1oBUQGzggqcKd2rCg/HmKiC75NHlkCfeDhTf12I/26/TvihKNkgH1uViiacZmA1GXWlFEeylBEo/kfX8rLKzS9aIdH+MiURU85cuzFv5h+xvG3HJdJL/Wr57ex1ZDDIdLaUQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2119.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 8 Nov
 2022 16:21:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 16:21:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 4/6] powerpc/powernv: Convert pointers to physical
 addresses in OPAL call args
Thread-Topic: [RFC PATCH 4/6] powerpc/powernv: Convert pointers to physical
 addresses in OPAL call args
Thread-Index: AQHY8HLhUOD02tuTL0SfL+2VpYWDu641O1SA
Date: Tue, 8 Nov 2022 16:21:12 +0000
Message-ID: <dd4e0dc1-1e5a-4408-6af0-4bf321f38ed4@csgroup.eu>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
 <20221104172737.391978-5-ajd@linux.ibm.com>
In-Reply-To: <20221104172737.391978-5-ajd@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2119:EE_
x-ms-office365-filtering-correlation-id: e419b213-e4e8-4f76-d190-08dac1a5406c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hEKLthw9BQN/J66ZX93XrRBA71WlbrwTf4YN0bto+cmnYAuyIoqjhyywOxhb/bDulYmUh47PBYnn6eJTpzTAc4sUfsHPfED46G7ZgR/kKQOmNablR+ITq9ZyRprH8w6U27aLu5jmMSuRvP5n4TC8/g/dNVPAI22EnGzGLs8wt45blD367Z7IzMoQLJ/WzqYytucD5Ax4IOfn9G51qo14aKtv+vRg4jl2sXy6o4+ZK47KoRjeD2fpOVSW26wIEAxGOdjMne/rfoDWAsH5UQySoMgSv+O+bk3jpmDkuxUbUVkjfrQfZkS4wgUGEOmwB3N1CAEvCHLdOTGt9DLptybtGZq7JOJgxErk96OsuNlLSmfm08WfnXtbyrehiwcQgWLb1SOvCcMd/6+hJt5pYcf+L6dl1LPLH9txzw8pU+wYhb+kst5DsBoFJTkvR9YYePqskQWWPyHTDruLhiUuZ99qpIJhVKBRHidiA6no0GjHkrD7tOc7cedeLCkATO3myY5f46ayqr2VcjeCKkmNpkjEpNPGz2F7QyES8ops+VP5dXvuE0LDpkpm/VLtjnM2obtDjDIvbvjEpb3osB29vjmQL01vQTW2bLvlwXXNv57w3T5M4ngp3T36Qop4DbRRT6UTrxkRCo/iqzb2Komc9TbSaGjXoyHGhzUV5WBBdmv4PRfbM6jcGAWfEWihJZW4d0+2sixuvt0/cnulO2TJdcQl4yjuzXA3Hvh3rjQ+JKnoCDzz1z/SqS9DsKOaeF2VN7JLKhTZgrJ6XF9oknG4mg+S5ZckZW19UmHEB0GPsZF8/o1oGX79dVI6/L8oRTuAlQfhxx/h30ROsmEQMKuOTeq6hg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199015)(2906002)(66946007)(8936002)(4326008)(316002)(66476007)(44832011)(66446008)(8676002)(478600001)(91956017)(76116006)(6486002)(110136005)(38070700005)(71200400001)(64756008)(41300700001)(66556008)(5660300002)(122000001)(186003)(31696002)(38100700002)(6506007)(86362001)(2616005)(6512007)(26005)(31686004)(54906003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MDNCSml2Zk0wSE9jd3NTTDM1cXYxcU56aWRVZ3pFVEpHMGFIbHRTb01OY0VR?=
 =?utf-8?B?dEYvelRkbXdkb1RkYVVxZ0RwdVAwQ0kxTFd1Rm5YckluWHNOZDBUZndxcFNz?=
 =?utf-8?B?cHY2bVNSNXBjdmtiQXV4d3lLVEhyT21jQzdCdElmbHhrMVIvWjF1ZEtTQzAz?=
 =?utf-8?B?M0VPVlVCNTdYMU5iNUJRSFRVOGIvbmlSOWxCcit6Zk4ySUlvWkdHaXR5SWs5?=
 =?utf-8?B?QWpsaVBxVTUyTi9FTk9RS3FDTU9OTFlnN0txV0cva0sxL3VsaXpnY1J6RUsx?=
 =?utf-8?B?dFZ5bmdqTFVubHNsMzY2bWRpeGxieUIveFpQUEE5bkF5UzNScHdhL3RuNEsv?=
 =?utf-8?B?SXNHcE4vR214eE9VL0RvZGtJRWFZeDB0cGZtVHNIcVV1WGJHemtJTEhtb0F6?=
 =?utf-8?B?SWs0SllITldIUWZXS3hmMzdsbjk5ZXBOL25Hb2FNSlhJZjQybHEwd2tzU2U5?=
 =?utf-8?B?SkxRa002SEx1QVk5VTF1T0l4K0NuRDRsTDBUMnM4eHBSUTdLV05JWWoyc1Iz?=
 =?utf-8?B?ak5TZk8vU1U3aU15akI5UTdza3lTeS9yb0xRaG1FQ0dsR2E5eGFmNkJlakcv?=
 =?utf-8?B?N3Z6RmxjRExxdmdYSERidmFQQlBub1g1VzdxVXh6K0VCWUZSSWhtMUxpVGtZ?=
 =?utf-8?B?RlJHemE3bWFVZDVvdldIVXYwR2NIOUN4WUV1NHdTaG4vVkgxcVVyUUZIWGlS?=
 =?utf-8?B?SklueFVpVzBNV0dyN2FkSjJhR0huT2xBT1lESU9XSVhITVh0Z01KazF2WVRU?=
 =?utf-8?B?YUxwQlJYaHo4UXBUK242bHpiRlZUVEtvc3ZFMnJYQnZBemFUS0d2RjVwN2FE?=
 =?utf-8?B?U3J3NFp3bjE2OHZIOWhzbVAyRTdpNGs4Z2VQQURqNHY5RWYrczZBUmRlZ29L?=
 =?utf-8?B?SlRpY1lXd3FCalg4ZlJUS0p0cmpudStGczhGb2YreW5naS92YTN4YlV1aHhk?=
 =?utf-8?B?TDJOaHNyMUpaU3hjU09FQVlyOGRiOUVqSVhvczBjUXZhYzhlU242RlQrTWph?=
 =?utf-8?B?ZUhwVlNQMVhPcGN5WEVrS3VLVVNTcW5GVkdXMFA5QytZQ2FNUFRoYUp2VVl2?=
 =?utf-8?B?dWJQVC9pK1diVnE4ak9nTXcyTlMyS1c0U2xWQlhTTDg3WFdXbEFxWTlORXpG?=
 =?utf-8?B?SExyZnNYWW1QSHhzWnZyWDBJNnIzbzBiU3Yxcmh5WjNQMWZCNHBpdnVHZnhZ?=
 =?utf-8?B?c0tEREZPd2dlb3pIRDM5a2xYQitLUWdtblU5Y3ZVRWplb1VnZmk0SXF1Z2pz?=
 =?utf-8?B?Rk1UM1BJcTFuVVc3NklMaE1ncnU1bGRxT0lPOWl0QUpjOUFHL2JOSXZ2SU9L?=
 =?utf-8?B?cW4yb1h3RlRIRk1GYWRlY2lpSFYweHN2ZHZnV3BDclMxNW91MFRJMDU5blQr?=
 =?utf-8?B?WEFTUmVtaTRQNUIyd1UzbDgwdTZzM010dkxlNm1RZ010R1IyWldqK3hiTEhO?=
 =?utf-8?B?cktOSitrQVA0TjJ3SG9zZXg5UWlYWHBUWHZXOGFxUElMZ3hmUnhSNEdCT01q?=
 =?utf-8?B?bDdBUzBLOWNMa1pybU9LRXlZMS9GcURLdnhnb2pndmxDTnBIWWVEaU1ySDJV?=
 =?utf-8?B?OE13c2N0eXRkeXBqZXhvSHRCdHhlcGZ0cHVHZUhEWkRlcThnV3pKdUhsS1Q5?=
 =?utf-8?B?QzNoRFREd3pHWk9CWU1xcFo4MDMxQzUvNmtUS245QWNGVzEwYnUrNC9NcjVi?=
 =?utf-8?B?WkxqRDhsUTBKN3JLRjBsOEtnSW8wb21sbVNlb280ZDBOazhCQXJvK0F4UE8v?=
 =?utf-8?B?TXBlSHE0dEFBM1lLaUVnVENQbFIrWDZteTM2Mm52OVU2M3g4TklrVklGRy9X?=
 =?utf-8?B?ZkYzOXJ1RkcySi81ZExRYTJQZmZXM1dmaWRHQzVaTUszYW1aNVplM0tobC9l?=
 =?utf-8?B?alVpQWtmS2lIOFZVdEJQR284R05xUGQxT2Q3Y3QvRFNuMGFVU1djVWVSbEk1?=
 =?utf-8?B?dmx2MFNtYTF1THllRnMwTEoyelFndDQvRG8vRzRHQXlER1QwZ3pPeUlWcWJX?=
 =?utf-8?B?TDgvT25BUndBVzVQTVFHUm1PQmE0T0RjQVkwZks2UUFOSzNvQ2Zsd0I2VHpj?=
 =?utf-8?B?NW5jMTFodEU2ak84ZlgzaEphNlAyc1JoSXNIRm05M0tkc0VHZzdLeUFmSTNh?=
 =?utf-8?B?MmdSWVkvSkNuOUFBd1lIVHBYRDlFa2dlcVJsZzg1TzloeGlPbFhzb3hzWURC?=
 =?utf-8?Q?XWWuttoNviYDqS+BJbDLmCw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDA0C764F9F87E46A3141567EC29B115@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e419b213-e4e8-4f76-d190-08dac1a5406c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 16:21:12.0516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dBVWA7qahBLJ8DpQK/SyBAUWRzqF4n4jSCiXwHQQttxeDxUeHpPul7iPYvJabZCoMRJeaIzonehpo0QAGEeTQlZRZybuQCYkVjjY2Usj7Ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2119
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
Cc: "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "cmr@bluescreens.de" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzExLzIwMjIgw6AgMTg6MjcsIEFuZHJldyBEb25uZWxsYW4gYSDDqWNyaXTCoDoN
Cj4gQSBudW1iZXIgb2YgT1BBTCBjYWxscyB0YWtlIGFkZHJlc3NlcyBhcyBhcmd1bWVudHMgKGUu
Zy4gYnVmZmVycyB3aXRoDQo+IHN0cmluZ3MgdG8gcHJpbnQsIGV0YykuIFRoZXNlIGFkZHJlc3Nl
cyBuZWVkIHRvIGJlIHBoeXNpY2FsIGFkZHJlc3NlcywgYXMNCj4gT1BBTCBydW5zIGluIHJlYWwg
bW9kZS4NCj4gDQo+IFNpbmNlIHRoZSBoYXJkd2FyZSBpZ25vcmVzIHRoZSB0b3AgdHdvIGJpdHMg
b2YgdGhlIGFkZHJlc3MgaW4gcmVhbCBtb2RlLA0KPiBwYXNzaW5nIGFkZHJlc3NlcyBpbiB0aGUg
a2VybmVsJ3MgbGluZWFyIG1hcCB3b3JrcyBmaW5lIGV2ZW4gaWYgd2UgZG9uJ3QNCj4gd3JhcCB0
aGVtIGluIF9fcGEoKS4NCj4gDQo+IFdpdGggVk1BUF9TVEFDSywgaG93ZXZlciwgd2UncmUgZ29p
bmcgdG8gaGF2ZSB0byB1c2Ugdm1hbGxvY190b19waHlzKCkgdG8NCj4gY29udmVydCBhZGRyZXNz
ZXMgZnJvbSB0aGUgc3RhY2sgaW50byBhbiBhZGRyZXNzIHRoYXQgT1BBTCBjYW4gdXNlLg0KDQoN
CkkgdGhpbmsgeW91IHNob3VsZCB0aGVuIGF2b2lkIHVzaW5nIHRoZSBzdGFjayBmb3IgYWxsIHRo
b3NlIHBhcmFtZXRlcnMuIA0KSXQgc2hvdWxkIGJlIGhhbmRsZWQganVzdCBsaWtlIERNQSBpbiBk
cml2ZXJzIDogRG9uJ3QgdXNlIHRoZSBzdGFjaywgdXNlIA0Ka21hbGxvYyBtZW1vcnkgaW5zdGVh
ZC4NCg0KPiANCj4gSW50cm9kdWNlIGEgbmV3IG1hY3JvLCBzdGFja19wYSgpLCB0aGF0IHVzZXMg
dm1hbGxvY190b19waHlzKCkgZm9yDQo+IGFkZHJlc3NlcyBpbiB0aGUgdm1hbGxvYyBhcmVhLCBh
bmQgX19wYSgpIGZvciBsaW5lYXIgbWFwIGFkZHJlc3Nlcy4gQWRkIGl0DQo+IHRvIGFsbCB0aGUg
ZXhpc3RpbmcgY2FsbHNpdGVzIHdoZXJlIHdlIHBhc3MgcG9pbnRlcnMgdG8gT1BBTC4NCg0KWW91
IHNob3VsZCBhdm9pZCB0aGF0LiBJbnN0ZWFkLCBqdXN0IHVzZSBrbWFsbG9jIGZvciBsb2NhbCBk
YXRhLiBJZiANCnRoYXQncyBkYXRhIHlvdSBnZXQgZnJvbSBvdXRzaWRlIHRoZSBmdW5jdGlvbiwg
dXNlIGttZW1kdXAoKS4NCg0KQ2hyaXN0b3BoZQ==
