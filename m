Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F5F69EF14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 08:03:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM6ZS38dnz3bgq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 18:03:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JXEUz+M5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::625; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JXEUz+M5;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM6YV6wtsz2yw0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 18:02:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fo/ZaCTWYEEcl14u+OvtK636ndjVyiGa1nqlRYTzbG6LdbBuhfI5DMQ1M6K1HO3j98OKlRZCZkpqp+S+XAyEl6k3OAdDKHXulqeXhK8o1omIF+VYEF2hNlJlk0OzHSCwwcAJQnox81xr38fhuPmnDUBeA+f/3rGU+NoIwCvKqQzj0jgXl0X1cr/pMbv438VL8O7zICe/cDcAOWyBjezjfel4nQejQznZ5IsP6J5W6R4TQDkS2JhpCzMV2MIIOsk68eZKjeJmMdZqm+LWmyqYJ590440IjOZfqwBdZIWitoE1BOb1uzhpbTe9W1MLYRl+imD0aTnoJrad6iJG20zSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYy+PDscchgry1aIFCBmm6dFVFW94ASHdoOLoT10R4c=;
 b=KzH2jE/MaVasQox5qUSDSQeTa+k7dXCjC9VrLpvG+Bb5N91OQT/mzfXClf3q1Zh8TJvq88kWupbT6kMcSF+AMTLL6xrt1Po8XMUzwSUxCiLBhY2jgg0ApIZCjGZnYhgz6EwggY6Kr+OBJOiGQhWY91L4/3C3pRuWCocqANb8HbkqU/izDk3LK+4eFbSn35YzSF1DewW/fkoyNLyyPcUM8CnP3OmEGMrooeSos4sc+fBnRfLoKXXGdEJqEKr3w8XulNpfBpCg2w0PGsWxICqnoP5ZgwYZ+oUO1H1Yb8ZiXhAnlQ4KgY6Yk22STcX2sHAdvfu5duojpOnl4R1vitgrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYy+PDscchgry1aIFCBmm6dFVFW94ASHdoOLoT10R4c=;
 b=JXEUz+M5EgbDUQxxrGNiLMr1Oiv4Q0fOaDbf08FhGORGkrsZ31lCFVZZ2B0b94BJAkw2O9e6t8/T7aPZboNQDJZJ6dSDclBZmdbeRGMI2J72e0dApQrZmxdItanZH2YeYgbMP2NwoIqMYwMzwznPbALTxLuhetZKd/HhJjg8rFd9A5vms4Gffj484u9/EkYkIvl5lic9f7dzWn177ety/D5iMd3nOrpXdlwA0L5JqZ6upN3r3wTU8XThunUKJ5ketRBS3BhDMZlB9zHx0UvXbXScH5Wx3oUhT65qHMIxH8KlxYm8CFteERiJW1OZM1eHU5cUxj57PheshZ4zzQfsjg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3392.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 07:02:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 07:02:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb
 to lwsync
Thread-Topic: [PATCH] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb
 to lwsync
Thread-Index: AQHZRoMefDxjCpO3tU+isLH8cV0K1a7aikAA
Date: Wed, 22 Feb 2023 07:02:34 +0000
Message-ID: <896436d1-04e4-8019-0f89-f4d4938f9697@csgroup.eu>
References: <20230222060107.70565-1-kconsul@linux.vnet.ibm.com>
In-Reply-To: <20230222060107.70565-1-kconsul@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3392:EE_
x-ms-office365-filtering-correlation-id: 88a141a1-b44d-4e75-337c-08db14a2c637
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  r5LvRQQCUC82tdDEMatYKZWkou3GzaQtsiGwfkPDnNk0Bz14VqmtzSI005dv8Ts4fV75iV2vczfe55iWHVSZ84UCp9lb5JmDG4eygqaocJCHPSRMKGKseFwTS5ipxuIWdc4xgf5ac2GnIYUTfRo7x2ww+lLBecS75LJ6qKUea3EFLBlutx2Pf6fIDyy5W1QpF/VwMT1V2B580PCQprGlOJNXZxKil8I4i4wd0nrD7yTOhgElH0ox9ocV5dQKRZsMItSEjJzM69I0oYCIMugJcTNDl05dUVpw8RppgZdbdFe+OlCA2dvo0FHCD2Lf+u2Z1jZD8IuImJFBiIkYw/1aDj9JdomGeJT3USFrpu6Nfvy+VNB8k8MS6KIrbf+JV9ck9ni6f16nH6pLBpaIKIoIdf0nT1uCNT/CQrZU44qT9XN54eO4FVEJ6gpm3TnNv6kidL7mViGPr4HdM6Eh47JoCvOWS+jYYP5qH+Q+qDumVO5ZiYmIx7PjKaDvFozXEIPxpu9+NtlqmOQpeUL61UYqt6G2Cja8hwJXtzwM3AFP96EGYAaigglCDauzekB/eSn6WJ3+d0X+90wgyRujHJLL5k1IGL0gcWrDsfz59J/Q4ZLTq19Fov9ctpvnBFUFTqLTruCI7lf93crhOcvoLCq2H6GAJ5l6bDx2JK0xv8Mo0gXYq0oRby51QNK5n8LgCJ66FU9WVaTKuv5kgN6ydDJ3kazmJ3P39qCo74y6nreq7imOtYUPJF0qLxzJdLCbj67dp9iko0qBTEIrukox4aYtLw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199018)(478600001)(66574015)(316002)(71200400001)(31696002)(38100700002)(86362001)(122000001)(2906002)(38070700005)(44832011)(110136005)(54906003)(41300700001)(36756003)(5660300002)(8936002)(83380400001)(4326008)(76116006)(66556008)(66446008)(64756008)(8676002)(66946007)(66476007)(91956017)(31686004)(26005)(186003)(6486002)(6512007)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UjMyV1IrRHcyWFV5aUhRc2liRmNoNXI2UTJPc0Vtc2VpUnNub0FJdWlJaUFY?=
 =?utf-8?B?Y2FxWmNlTmYxMjhFSG1MK3JkK05yTEYxekdrUlJUS0ZxNTJPWjZqN3F0TkxS?=
 =?utf-8?B?QzFBT3E0akZHTUVuVnBqQkhzQkFqS2hHRVRZa0lWYmRYNkd2VWwrZWpsYUtZ?=
 =?utf-8?B?UEZ4dVgrd3hjclFSbCs0eGJ3SkoweFBWU1p5KzlEaFU4SEJxVVhVUXlTM3RZ?=
 =?utf-8?B?QkxIb0g2ZmxhQmpydi9wTFpmSHJtUHVSNHdUTzdQSnB1MUFmTzFaeExjeW1E?=
 =?utf-8?B?L3d3ZWZwOWhoQ3hyMkprQnkxMjhxanNwd0hJdDBZcUNLS1JGQ0E4Rnk3L1dO?=
 =?utf-8?B?TW93VjlMRGhFL1h0NENQTVZ3akxWdHlya003MEZjTGRERm5OM1p2eGhZc0NM?=
 =?utf-8?B?c0JGZ29FR0t5ZTl1ZlVzeXpUa1h2Ty83dlA4OGRUL252NEZ4ZVpKTjNpckJY?=
 =?utf-8?B?ZXQ3YVI0QUkvR2lCS0UvRFlPTEdpWDZES1lnK3E2aEhBTy9jOWVENFZ1bllN?=
 =?utf-8?B?eWFjdXVDSSt4WUFuRkMyS2VCcDYyMFlOM0NzK202L3RCVEN2bEY2UTlRVEtJ?=
 =?utf-8?B?YVRSZUFmNlBVQU1JZ09KOStnejgySVZlUmFTZTBKeWwzSE82S0xsLzZsZmZH?=
 =?utf-8?B?WndxQXpKamF4bnhqQW1Ca3c4dzF6eEI4bHZBVyt2MVJSOUZwV2dOL2hyOTdW?=
 =?utf-8?B?aURSYmNqZkRTUHFRemlTMEVUMUhzVEdodjg2UVJPZzNhbGtBa3YyaGl2dytM?=
 =?utf-8?B?MXRpdWlQVGduYytVaHdSclA3VHR5anhGT3ZXZUJEc2hsWkhoTlRHT0NKOXBw?=
 =?utf-8?B?akpVOW9nYUxENis4ekY4bUIzRVROQzhKZG9EcVlsaXVMQmtCdzlWbFNDZzV4?=
 =?utf-8?B?R2YvcFVsd3F6dTBTYTlGeWFnL0xad2dmN3FVelBjMXh3cm1taFZCYk13K1hj?=
 =?utf-8?B?dGNlR1FYaHZFc1dqNlBxR3lFKzFON3F4Q2dPUkxiRmhSSjIva3JmYzhwQmZ0?=
 =?utf-8?B?eXlhTGl4UHlGKzMwWXlNUHBWc0p2ZGhRWXJLNXk2WXhRK0pEMnFxR3MvbWVW?=
 =?utf-8?B?QTNldkRIeEZZYzR1cmhyaDF4bGpVK3dWcVAvb0pIcVFvRzdTeVdsUUNLMWp3?=
 =?utf-8?B?elpVdTRUNlJPQUpwajR0eFozUGxUN28yY2pUenllREIvS2l5d3lXTWJKMlhv?=
 =?utf-8?B?ZW12TnNjUjFrZUhYOUNoK3FaTzRXRGRZaXNyM0pJR0p4WVM1d3lYaFlja01O?=
 =?utf-8?B?UVcyUVVWM3laRUVsS05HYjRrd2FJdWE3M2UxUWdjcEdFZTBGTjFSV3JDWk00?=
 =?utf-8?B?R1hkOG10TWZ3YVJDWm1vSThZdVB0aFoxWS85OTBVbjI2akh5QlFBQ2MrWUxG?=
 =?utf-8?B?bkVwNWI2YVRtYW5aem8yMEl6dk14M0VRRlROSGJPemFEL0RucktjOGxZdWRv?=
 =?utf-8?B?SUVWeTRaK0tiTWVPR2FKeTBrZVZtT2lrNmcrZjE1OEtabFg0WFJjQU1iSmdT?=
 =?utf-8?B?N2xvNWkwUzliSXNHMVdZV0c4QmtEemlFemx6MEM2Lzk1T1pDQ2U2R1ZTSFp0?=
 =?utf-8?B?TGNJQm41bU9Ka0ZVUm5wQVBPekhJcmlXM0svYnFPSmszMmpsbVIyanlLTUtM?=
 =?utf-8?B?K0RIUGpHSVhVUTljNFM5cndqNjlValM0YzlXTkhDV3BlYTRBbVZXTnNHWUVa?=
 =?utf-8?B?d1VLUzRjdVVBTTlQekduazRDV1FmSmRKc1NTYkpIMFo3eDRyWmxQM2NRaWRR?=
 =?utf-8?B?UnA5TnQ1ZGFEL3ZOWW9yY2czSHUyNFlCWDRYaUVCbXNNdVM0UGczYk96aVBC?=
 =?utf-8?B?L2Z2bUsvb0NhekZCZ0wvdHgvUXdoMnVZanJ0T0V2VWh5K1Y5b0JIb0hydExp?=
 =?utf-8?B?L0VwdkNlY2IwN0V1SzlsYU41eEdLdXFVamdudE5pL0dCemd4T281eDNOSUI5?=
 =?utf-8?B?dTE3bVo0NTltQTdFcSs5bXdJNEZjZ2NRd0NmVDNJUWY4NGlDcTBaWFlpa2FY?=
 =?utf-8?B?MUtyc21SSnVvSnQwdHJVazlLWG8xZlFoSk93WS9YK09uNkROZER0WjVIakN1?=
 =?utf-8?B?ZkN2Q0JOUlNUZUlZbmRCcXg1dkhCVjNFU25LOExkZnhpWlVJak1vYithdnZ1?=
 =?utf-8?B?MFdTL1o5aGZUSGswSGhNSDFIMWNUd2R1NjZHdXRydnM5VldaaU9kUU1iOWZK?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <302402E1F26B9147AFAF56A89F1058A7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a141a1-b44d-4e75-337c-08db14a2c637
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 07:02:34.5508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0TLk62fdU8nNwEOYt4wPEUvBMbos7yZyc14N7g+G4w2ToUarJSj+QrZZHB9wuI9/Q0Fz4zPIBUFn/IetPdb0n1hLRra7EBF984bEBUMyhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3392
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAyLzIwMjMgw6AgMDc6MDEsIEthdXR1ayBDb25zdWwgYSDDqWNyaXTCoDoNCj4g
QSBsaW5rIGZyb20gaWJtLmNvbSBzdGF0ZXM6DQo+ICJFbnN1cmVzIHRoYXQgYWxsIGluc3RydWN0
aW9ucyBwcmVjZWRpbmcgdGhlIGNhbGwgdG8gX19sd3N5bmMNCj4gICBjb21wbGV0ZSBiZWZvcmUg
YW55IHN1YnNlcXVlbnQgc3RvcmUgaW5zdHJ1Y3Rpb25zIGNhbiBiZSBleGVjdXRlZA0KPiAgIG9u
IHRoZSBwcm9jZXNzb3IgdGhhdCBleGVjdXRlZCB0aGUgZnVuY3Rpb24uIEFsc28sIGl0IGVuc3Vy
ZXMgdGhhdA0KPiAgIGFsbCBsb2FkIGluc3RydWN0aW9ucyBwcmVjZWRpbmcgdGhlIGNhbGwgdG8g
X19sd3N5bmMgY29tcGxldGUgYmVmb3JlDQo+ICAgYW55IHN1YnNlcXVlbnQgbG9hZCBpbnN0cnVj
dGlvbnMgY2FuIGJlIGV4ZWN1dGVkIG9uIHRoZSBwcm9jZXNzb3INCj4gICB0aGF0IGV4ZWN1dGVk
IHRoZSBmdW5jdGlvbi4gVGhpcyBhbGxvd3MgeW91IHRvIHN5bmNocm9uaXplIGJldHdlZW4NCj4g
ICBtdWx0aXBsZSBwcm9jZXNzb3JzIHdpdGggbWluaW1hbCBwZXJmb3JtYW5jZSBpbXBhY3QsIGFz
IF9fbHdzeW5jDQo+ICAgZG9lcyBub3Qgd2FpdCBmb3IgY29uZmlybWF0aW9uIGZyb20gZWFjaCBw
cm9jZXNzb3IuIg0KPiANCj4gVGhhdHMgd2h5IHNtcF9ybWIoKSBhbmQgc21wX3dtYigpIGFyZSBk
ZWZpbmVkIHRvIGx3c3luYy4NCj4gQnV0IHRoaXMgc2FtZSB1bmRlcnN0YW5kaW5nIGFwcGxpZXMg
dG8gcGFyYWxsZWwgcGlwZWxpbmUNCj4gZXhlY3V0aW9uIG9uIGVhY2ggUG93ZXJQQyBwcm9jZXNz
b3IuDQo+IFNvLCB1c2UgdGhlIGx3c3luYyBpbnN0cnVjdGlvbiBmb3Igcm1iKCkgYW5kIHdtYigp
IG9uIHRoZSBQUEMNCj4gYXJjaGl0ZWN0dXJlcyB0aGF0IHN1cHBvcnQgaXQuDQo+IA0KPiBBbHNv
IHJlbW92ZWQgc29tZSB1c2VsZXNzIHNwYWNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEthdXR1
ayBDb25zdWwgPGtjb25zdWxAbGludXgudm5ldC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYmFycmllci5oIHwgMTIgKysrKysrKysrLS0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYmFycmllci5oIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2JhcnJpZXIuaA0KPiBpbmRleCBlODBiMmMwZTkzMTUuLjU1M2Y1YTVkMjBiZCAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2JhcnJpZXIuaA0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYmFycmllci5oDQo+IEBAIC00MSwxMSArNDEsMTcg
QEANCj4gICANCj4gICAvKiBUaGUgc3ViLWFyY2ggaGFzIGx3c3luYyAqLw0KPiAgICNpZiBkZWZp
bmVkKENPTkZJR19QUEM2NCkgfHwgZGVmaW5lZChDT05GSUdfUFBDX0U1MDBNQykNCj4gLSMgICAg
ZGVmaW5lIFNNUFdNQiAgICAgIExXU1lOQw0KDQpUaGlzIGxpbmUgc2hvdWxkbid0IGJlIGNoYW5n
ZWQgYnkgeW91ciBwYXRjaA0KDQo+ICsjdW5kZWYgcm1iDQo+ICsjdW5kZWYgd21iDQoNCkkgc2Vl
IG5vIHBvaW50IHdpdGggZGVmaW5pbmcgc29tZXRoaW5nIGFuZCB1bmRlZmluaW5nIHRoZW0gYSBm
ZXcgbGluZXMgDQpsYXRlci4NCg0KSW5zdGVhZCwgd2h5IG5vdCBkbzoNCg0KI2RlZmluZSBtYigp
ICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJzeW5jIiA6IDogOiAibWVtb3J5IikNCg0KI2lmIGRl
ZmluZWQoQ09ORklHX1BQQzY0KSB8fCBkZWZpbmVkKENPTkZJR19QUENfRTUwME1DKQ0KI2RlZmlu
ZSBybWIoKQkoe19fYXNtX18gX192b2xhdGlsZV9fICgibHdzeW5jIiA6IDogOiAibWVtb3J5Iik7
IH0pDQojZGVmaW5lIHdtYigpCSh7X19hc21fXyBfX3ZvbGF0aWxlX18gKCJsd3N5bmMiIDogOiA6
ICJtZW1vcnkiKTsgfSkNCiNlbHNlDQojZGVmaW5lIHJtYigpICBfX2FzbV9fIF9fdm9sYXRpbGVf
XyAoInN5bmMiIDogOiA6ICJtZW1vcnkiKQ0KI2RlZmluZSB3bWIoKSAgX19hc21fXyBfX3ZvbGF0
aWxlX18gKCJzeW5jIiA6IDogOiAibWVtb3J5IikNCiNlbmRpZg0KDQpCeSB0aGUgd2F5LCB3aHkg
cHV0IGl0IGluc2lkZSBhICh7IH0pID8NCkFuZCBJIHRoaW5rIG5vd2RheXMgd2UgdXNlICJhc20g
dm9sYXRpbGUiIG5vdCAiX19hc21fXyBfX3ZvbGF0aWxlX18iDQoNClNob3VsZG4ndCB5b3UgYWxz
byBjb25zaWRlciB0aGUgc2FtZSBmb3IgbWIoKSA/DQoNCk5vdGUgdGhhdCB5b3VyIHNlcmllcyB3
aWxsIGNvbmZsaWN0IHdpdGggYjZlMjU5Mjk3YTZiICgicG93ZXJwYy9rY3NhbjogDQpNZW1vcnkg
YmFycmllcnMgc2VtYW50aWNzIikgaW4gcG93ZXJwYy9uZXh0IHRyZWUuDQoNCj4gKy8qIFJlZGVm
aW5lIHJtYigpIHRvIGx3c3luYy4gKi8NCg0KV0hhdCdzIHRoZSBhZGRlZCB2YWx1ZSBvZiB0aGlz
IGNvbW1lbnQgPyBJc24ndCBpdCBvYnZpb3VzIGluIHRoZSBsaW5lIA0KYmVsb3cgdGhhdCBybWIo
KSBpcyBiZWluZyBkZWZpbmVkIHRvIGx3c3luYyA/IFBsZWFzZSBhdm9pZCB1c2VsZXNzIGNvbW1l
bnRzLg0KDQo+ICsjZGVmaW5lIHJtYigpCSh7X19hc21fXyBfX3ZvbGF0aWxlX18gKCJsd3N5bmMi
IDogOiA6ICJtZW1vcnkiKTsgfSkNCj4gKy8qIFJlZGVmaW5lIHdtYigpIHRvIGx3c3luYy4gKi8N
Cj4gKyNkZWZpbmUgd21iKCkJKHtfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImx3c3luYyIgOiA6IDog
Im1lbW9yeSIpOyB9KQ0KPiArI2RlZmluZSBTTVBXTUIgICAgICBMV1NZTkMNCj4gICAjZWxpZiBk
ZWZpbmVkKENPTkZJR19CT09LRSkNCj4gLSMgICAgZGVmaW5lIFNNUFdNQiAgICAgIG1iYXINCg0K
VGhpcyBsaW5lIHNob3VsZG4ndCBiZSBjaGFuZ2VkIGJ5IHlvdXIgcGF0Y2gNCg0KPiArI2RlZmlu
ZSBTTVBXTUIgICAgICBtYmFyDQo+ICAgI2Vsc2UNCj4gLSMgICAgZGVmaW5lIFNNUFdNQiAgICAg
IGVpZWlvDQoNClRoaXMgbGluZSBzaG91bGRuJ3QgYmUgY2hhbmdlZCBieSB5b3VyIHBhdGNoDQoN
Cj4gKyNkZWZpbmUgU01QV01CICAgICAgZWllaW8NCj4gICAjZW5kaWYNCj4gICANCj4gICAvKiBj
bGFuZyBkZWZpbmVzIHRoaXMgbWFjcm8gZm9yIGEgYnVpbHRpbiwgd2hpY2ggd2lsbCBub3Qgd29y
ayB3aXRoIHJ1bnRpbWUgcGF0Y2hpbmcgKi8NCg==
