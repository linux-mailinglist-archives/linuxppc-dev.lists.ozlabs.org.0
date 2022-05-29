Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 853BA537076
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 11:47:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9txp2x03z3bm2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 19:47:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::626; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0626.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9txH3tRfz2yj3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 19:47:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5sCb66jmOwC5EUlALedCC71B0MeIzNFJSSfNEAURIf2r+Eo2ZRiD0A3F+e+KVIWPiNSMOYsE5nHfwrOgqmc5gTFLCPWRfOB0N8pRaWMlmKwsVNHUv8cFYCLycLLhRH4byeunqd6bz6Hr+Ul6ZRB0DF/isqNXZR+4QabfOnWFPhyuIB/QUUnVYxf8cN/WoG5T45aGXhVi7DX8dv+Jvn77UgZxTL7t6batoMhRm3bIaGxvX2LutlACHoTopJcu4o22DfckbozoDUnKUUKZjfHLRXwOo6n5OUSDfQQYXzXc4x3DMnxiYrOur4GCSpaWthPvRhkIwrjfseX4WegLUSIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODt1MbDW9abfm0otRvOChhmX3OcEaj+Z5xdYoK8lIhA=;
 b=lg2N8ZOfDRJ44iCnnDJgxtE5yAhVHXWf+BfEC9GxyHZYJuCZWmw6wXxundP9X18HnfLGKsR9yesJ5NgFmun0pOR7UilGsrZr3NtGlsnobEu3Zn40dE1Vw947vOMgUXrzHAYaCOengtLuGZ0XT4ep/whwt7v6gXohIDCj6jTOoSEEWIuJeCWITbqwKgeuB186txpA9uUXqH4jxYn3IA9DLPr0m2kB1HAI0Z5aBhnvN9FmUn3w5lkTy8kZU5sAiofX0uRGVKmhYWP9McBC+BFqyWcLyKxYdU5HxNCzcdsTqxKYVMxw2qZGlsxdNggPQCEgrAUjXnPsoCVCYYF+t8Z5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1802.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Sun, 29 May
 2022 09:46:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Sun, 29 May 2022
 09:46:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Li Zhengyu
	<lizhengyu3@huawei.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v2] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Thread-Topic: [PATCH v2] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Thread-Index: AQHYa2DJJ1srP4hlKkGl6GVmMrev4K01e7mAgAAviYA=
Date: Sun, 29 May 2022 09:46:47 +0000
Message-ID: <264786d9-7756-19e0-2742-8b8d17f5ace5@csgroup.eu>
References: <20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com>
 <20220529065637.xgapqjp2342flbuj@pengutronix.de>
In-Reply-To: <20220529065637.xgapqjp2342flbuj@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c219591b-bd7d-42bc-3614-08da415825c5
x-ms-traffictypediagnostic: PR0P264MB1802:EE_
x-microsoft-antispam-prvs:  <PR0P264MB1802BAF242D1508F8DBE4344EDDA9@PR0P264MB1802.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BldkelqDz8kjs9qB2E0vfCsnJpn98ICO7DDvJwH0npyGID8MlsPOMkbgs7YndbZ2CS9+CcpUTRoG3ZObn3a7D9MNUtdOZpam41WQ3R7YkQ30awB+7ZcBYzZnyNs13XDR4G5KbQv9eh2GlRIrDOK8toAHvwBzKTuWG3RWSaZyxgNZmrgORgmY8IzAXd0GKInCzjyMRWki9Q5ZxqvjoXUOakXbZ/GJYz20ocCLoX3zyB18uNxjbGM7RO7y1DQTZsp5k5BNfgdM/B2A52xOaFR/+ppMgVyRQORDfDhBgVKKEdDiTsTNAdIRyV/MASF5ZSK1TaIEvbEXV+fM8/fYfsp2wSuaOlowO0gmKBcBcbdE4ztlqXYMBL2+rS+a9nLDO6GoH6BbCT/a7+2KACcdg2Snz0QANsGLV54coAkChvas310T3ZdpuMyVPeif6BuR9KEiJzRC1lWpW+5EyDYKqY+cmOwcN67Gs7GPs2tTnx4VeHu/jn+Dq89G5LiD6NIJ1ohGUgWi02ASUDFtNUu0rJAatLP3NoOIhnpYYrYmKw0gHtYuWefyUMm29UQVhhjgHtjsvNTkWKRpd3R9BSy3evSeMlSXd2OpFq9j6LH8nBKOsdSD9C80YgsNRhH7e7oAFhLRSRApxpQB6MxlRFkbhrXzvcmOb+ITAJKSX1fEDAPXJqtjizhD779tvZw32X5M22A0qTpiwIM+h203HP9aA9ndmpDf7P7IpIbkerYMfmoENFBGQL2vAaYn4o9jdfRLPlOrJIzcM23lR+lKGw6w90w4EQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(38070700005)(66946007)(44832011)(31696002)(2616005)(86362001)(5660300002)(6486002)(110136005)(76116006)(54906003)(66556008)(64756008)(66446008)(66476007)(71200400001)(36756003)(8936002)(6506007)(316002)(8676002)(91956017)(4326008)(31686004)(122000001)(6512007)(2906002)(38100700002)(186003)(26005)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VHJVWjFnazl5c243UEU2MkhqelRpcWVPc29jUTR3U1g5UEthUms1aVkwbmNZ?=
 =?utf-8?B?Q0lHZjhVK0F4QUl5NXVxUmNaSXRoWURobmJabUVac2FKRkQxL1B2eE1vTG5j?=
 =?utf-8?B?UGpYcTliU1NSd2FlclFxWXpidzBFcWEvVjc3c2pqaFJNTDd3eEgzc21aQ0JI?=
 =?utf-8?B?NFVCNU9mQlJ5N2cwUmpUTEZuck5NazdXRCt3OUF2emNhY0FoRFBRRWVLc0lv?=
 =?utf-8?B?V29sQXNicm82UER3L0FTNkxxbGI1NUJpYTlCSDhveW9qa2xvblBXU1ZZVkNH?=
 =?utf-8?B?Sk4yS1dKTU4wb2lxaitKYXdjUUZpODM4WUZONk44TDdMNzk5bXV6c1VMVU5p?=
 =?utf-8?B?TEdNQUt1cFN6WU0vcU9TcUdmRlVDbWU5eXF4ajFXWDA4R0ZBeEUvU25IMnRK?=
 =?utf-8?B?Q0xrazU5NWJYY29kUmpWNmJESVk2L1phVHVUQnkrOEQ5SExpL2plcWxFTGlS?=
 =?utf-8?B?YnB4cGtEaUZ4S0wxL0lzRzZTbEkxSGR5Wk82RnozNGY3Z0liUDhFa0h4K2Nj?=
 =?utf-8?B?TU1BTkxWV2Q1MVd2R2RNUDBmSXZhWkRsODQ4U2VGYjFPQWh3VzBlNFlnRTRC?=
 =?utf-8?B?cVRhZk85TXNkcWo1c2t4b0VUWDZVU3hWVlNVSlVPTlNNL0ZBWDVtOXp3QzRD?=
 =?utf-8?B?WUxLeHNBOC9BYy9pYlFWbzlqbXR4RmtCNkpMY3A5NkxxMWd6d01rQ2c0ek1T?=
 =?utf-8?B?MFN2U2pkRCt4bGtxZnpNWHVJRWkxcUxyemt3SSt5QVR3WTVadzBjTlE2c0Nt?=
 =?utf-8?B?UVFZek5LZkdxOUxZdVJoanBveFd1d240Nk9DKzJwUFpZS0xpaHR0NkxnVHgy?=
 =?utf-8?B?QmRPYm5vNXIrVW8yRnBIY3dzRCs3QUczVG5qQVFUdnZRRVUrWEkvN0lkSmVS?=
 =?utf-8?B?THV0TEVLUS9lTW5sblVoajBIZVhud0U1R2VPOW1HL2RPdjNsU3VUT3pTdE5R?=
 =?utf-8?B?enRzWUk3Nzl3YnRZQzcrdjZ0SURPc2JnVXBoZEFFN1hmRDh4R0hsT1dldUVT?=
 =?utf-8?B?TWdEYncwNTFjNzRNZmJDeVdQbUlGdGxXUjdHVUhKRUpJZVdHQjJSdFFDUzVY?=
 =?utf-8?B?OVRFekZRR2tXWDJXb1FZMmh4MkhTTnZrUTRQUG1KdjM4MGhuSlVjREhwclNC?=
 =?utf-8?B?ZUdOd2VZaThXSUgyMmxTSVhac0ROdXF5ekR2aUJJdE1XanFQSHVxWWVoalRW?=
 =?utf-8?B?ZUl2cDlqMDRtUEF3dXJoZVlzcDllWkJDRVduWU1DeGRNZnhWbjZGNzVaWXpY?=
 =?utf-8?B?Tlk3aUJPYXJ2eVBLNmIrTjdrdnhoMjJaUkVvbVlDU0JqejRHYXBaejhmSU5x?=
 =?utf-8?B?blVmbEFiQkZHK3l3MStEWk5KYjFmd2xiT3ZIaWtQWTdEL0tkVEtIeGhQMXUx?=
 =?utf-8?B?a2dWVnBzYk1XVy9EUHBmVmg5eXR5aWlVT3pSR0NIWnJ2K1Y0MVF1WXZ3YjZO?=
 =?utf-8?B?d3o1RDY1U1J4ZzA0b1l2OFB6QlU4SGUvLzdGa0ZoZHJXUlZVdkZORXVjMmY0?=
 =?utf-8?B?K21MNTMxcCtPQTcyK1pZbytoTjQ4M0FLckhMYlZDSlVNMXJBWVQ3b0JpQ0Rw?=
 =?utf-8?B?cHRRRkxuSDQ4blBBam9YamZHYUtKREd6NmNoRW1xZTkvN3BJR21IYVVudFl1?=
 =?utf-8?B?M0RNZUNqTWZsODhBVWdYMnJJcmE4NCtRMlNpQ3hRa2FlUDZKbExGdUI4Z2pt?=
 =?utf-8?B?Y3hzZTFsejdTMlBiQnI0ZXc0R3gzcHE3VEQwTCtwazZFT0wrT3g3cDFJQVNy?=
 =?utf-8?B?RWRXdTY0QWR3dWQ2eXdhZE00aHR4S25ORlM3UXZiZDYrQmhpdnZ1eCtERTM2?=
 =?utf-8?B?TmZHZmFpT0p6b0lWNmJJanBkZ294KzNGWXlCbVpKVDhxUk13VVd4ekowbGlm?=
 =?utf-8?B?RE1BZ2Z5di9ma2JHN3lCSk92UUFWNHlHaDhnVGtralowc29PK0MrZEVEaUR0?=
 =?utf-8?B?TjEvQ3NCeWVZTld3cEt0NHN3eEc0OHhrdjBZR2Zqd2pBc3NMVXpWYlhjU2Rr?=
 =?utf-8?B?OFR4R0c2M2ViTEMvNnBYeGs5Z3pmS0RPTnQ1c2g4VTVFNWtoWHk0VWIxL0Jh?=
 =?utf-8?B?OEZveFhrTVVWT1ZzTlNteGMvMzFQSUxROWZra2xObWR0bGtjRVFuVWRqdFBw?=
 =?utf-8?B?RDFXdGZLUUo0QWRsR3pBaGtvS1VpWmZyT3A5bmdIRzFXVEtKVklvcnljZEs0?=
 =?utf-8?B?cVlOYms5UW1ueVZsM0ZOMEF2dTZldVgwMW5VRmlqNi9ubThHbGlJeEUrd3ha?=
 =?utf-8?B?ZjBOUjNKUnR0S3RsSlhZWStMRU5mNWJPeklwTG5uWnN3ZUFVNWd3S3BIZjNz?=
 =?utf-8?B?TkZnNHA4RFBDSW5nQWF2anM0Q2NZTVk3SjMxS0RxVWV5ZjM4YUsySWJLU0RB?=
 =?utf-8?Q?41P4jyOBBlNy9ruj+C0+RB1zxRcB+PTVgrDgU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB48D21044EAF944A1A4E55435261F4E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c219591b-bd7d-42bc-3614-08da415825c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2022 09:46:47.2331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oYErlvFUe9ZfLc+CUahwkb2qutRN20d4Xenp5Wm9g5FGzeio/dWBVSzwyBz05QHDiXsPjijBvwJHbkoiztv7u1Lp9bePPUlw2O4WeOcMffM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1802
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Biederman <ebiederm@xmission.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA1LzIwMjIgw6AgMDg6NTYsIFV3ZSBLbGVpbmUtS8O2bmlnIGEgw6ljcml0wqA6
DQo+IEhlbGxvLA0KPiANCj4gb24gY3VycmVudCBsaW51eC1uZXh0IEFSQ0g9cmlzY3YgYWxsbW9k
Y29uZmlnIGJyZWFrcyB3aXRoOg0KPiANCj4gICAgQ0MgICAgICBhcmNoL3Jpc2N2L2tlcm5lbC9l
bGZfa2V4ZWMubw0KPiBhcmNoL3Jpc2N2L2tlcm5lbC9lbGZfa2V4ZWMuYzozNDU6NTogZXJyb3I6
IHJlZGVmaW5pdGlvbiBvZiDigJhhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zX2FkZOKAmQ0K
PiAgICAzNDUgfCBpbnQgYXJjaF9rZXhlY19hcHBseV9yZWxvY2F0aW9uc19hZGQoc3RydWN0IHB1
cmdhdG9yeV9pbmZvICpwaSwNCj4gICAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+DQo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBhcmNoL3Jpc2N2L2tlcm5lbC9lbGZf
a2V4ZWMuYzoxNjoNCj4gaW5jbHVkZS9saW51eC9rZXhlYy5oOjIzNjoxOiBub3RlOiBwcmV2aW91
cyBkZWZpbml0aW9uIG9mIOKAmGFyY2hfa2V4ZWNfYXBwbHlfcmVsb2NhdGlvbnNfYWRk4oCZIHdp
dGggdHlwZSDigJhpbnQoc3RydWN0IHB1cmdhdG9yeV9pbmZvICosIEVsZjY0X1NoZHIgKiwgY29u
c3QgRWxmNjRfU2hkciAqLCBjb25zdCBFbGY2NF9TaGRyICop4oCZIHtha2Eg4oCYaW50KHN0cnVj
dCBwdXJnYXRvcnlfaW5mbyAqLCBzdHJ1Y3QgZWxmNjRfc2hkciAqLCBjb25zdCBzdHJ1Y3QgZWxm
NjRfc2hkciAqLCBjb25zdCBzdHJ1Y3QgZWxmNjRfc2hkciAqKeKAmX0NCj4gICAgMjM2IHwgYXJj
aF9rZXhlY19hcHBseV9yZWxvY2F0aW9uc19hZGQoc3RydWN0IHB1cmdhdG9yeV9pbmZvICpwaSwg
RWxmX1NoZHIgKnNlY3Rpb24sDQo+ICAgICAgICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+DQo+IA0KPiAoSSB0aGluaykgYmVjYXVzZSB0aGVyZSBpcyBhIGNvbmZsaWN0IGJldHdl
ZW4gdGhlIHR3byBjb21taXRzOg0KPiANCj4gMjMzYzFlNmMzMTljIGtleGVjX2ZpbGU6IGRyb3Ag
d2VhayBhdHRyaWJ1dGUgZnJvbSBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zW19hZGRdDQo+
IDgzOGIzZTI4NDg4ZiBSSVNDLVY6IExvYWQgcHVyZ2F0b3J5IGluIGtleGVjX2ZpbGUNCj4gDQo+
IEFuZCBzbyBuZXh0IGlzIGJyb2tlbiBzdGFydGluZyBmcm9tDQo+IDE2NGE5MDM3YjFkMzNmMjhi
YTI3NjcxYzE2ZWMxYzIzZDRhMTFhY2Ygd2hpY2ggbWVyZ2VzIHRoZSByaXNjdiB0cmVlLg0KPiAN
Cg0KSW4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhlYy5oLCBkbyB0aGUgc2FtZSBhcyBzMzkw
IGRpZCBpbiBjb21taXQgDQoyMzNjMWU2YzMxOWM6DQoNCg0KZGlmZiAtLWdpdCBhL2FyY2gvczM5
MC9pbmNsdWRlL2FzbS9rZXhlYy5oIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2tleGVjLmgNCmlu
ZGV4IDdmM2M5YWMzNGJkOC4uNTQwZGQ0NjliMDg4IDEwMDY0NA0KLS0tIGEvYXJjaC9zMzkwL2lu
Y2x1ZGUvYXNtL2tleGVjLmgNCisrKyBiL2FyY2gvczM5MC9pbmNsdWRlL2FzbS9rZXhlYy5oDQpA
QCAtODMsNCArODMsMTIgQEAgc3RydWN0IGtpbWFnZV9hcmNoIHsNCiAgZXh0ZXJuIGNvbnN0IHN0
cnVjdCBrZXhlY19maWxlX29wcyBzMzkwX2tleGVjX2ltYWdlX29wczsNCiAgZXh0ZXJuIGNvbnN0
IHN0cnVjdCBrZXhlY19maWxlX29wcyBzMzkwX2tleGVjX2VsZl9vcHM7DQoNCisjaWZkZWYgQ09O
RklHX0tFWEVDX0ZJTEUNCitzdHJ1Y3QgcHVyZ2F0b3J5X2luZm87DQoraW50IGFyY2hfa2V4ZWNf
YXBwbHlfcmVsb2NhdGlvbnNfYWRkKHN0cnVjdCBwdXJnYXRvcnlfaW5mbyAqcGksDQorCQkJCSAg
ICAgRWxmX1NoZHIgKnNlY3Rpb24sDQorCQkJCSAgICAgY29uc3QgRWxmX1NoZHIgKnJlbHNlYywN
CisJCQkJICAgICBjb25zdCBFbGZfU2hkciAqc3ltdGFiKTsNCisjZGVmaW5lIGFyY2hfa2V4ZWNf
YXBwbHlfcmVsb2NhdGlvbnNfYWRkIGFyY2hfa2V4ZWNfYXBwbHlfcmVsb2NhdGlvbnNfYWRkDQor
I2VuZGlmDQogICNlbmRpZiAvKl9TMzkwX0tFWEVDX0ggKi8=
