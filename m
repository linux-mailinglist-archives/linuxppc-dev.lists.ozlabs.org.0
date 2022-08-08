Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481458C70B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 13:00:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1YBq5nwZz3bqn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 21:00:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Mg1gPdz7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.78; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Mg1gPdz7;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90078.outbound.protection.outlook.com [40.107.9.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1YB52rxvz2xHC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 20:59:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNHCrYrB90RI21M3KD3J7snOQgJP9hZIokzzIzNXKv6UhaMTJZ5ZRI5AkNsUuPg1/oSxxi0q9Y4tsSiJiYX4aA0DisFe2Song8Ybge4U+ef/Dt4wRD/x9XACcq6VHdRZXUX5n/LQIQ/hF4+0DK4SfFy2CWG5AEL7HUZiez86y4isnSM+pn6YzdFDEhlkyJrw2ux/ZG2nh8a4C/gT/NB4QCZKtoXjhifLkYxZuaxYEZx4/ijtOaneetcFobWAGfC8ujo39gF2loU7Z5CSITX6Def5VJ2EJXS0tKGIk+Mi+JmDS4FGdQrgO2JyY6F5EFF/FgqLc/1se0QE0Xd66KGwxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjDnXkTKuJxl+82Lf4yto+oh45aK9Er0eixbh4avQ4g=;
 b=b9Yk+3hdQvqoYaboQd0eG88b//cjrB7UDWYCZ/NV99tBQzMceDlvUNgRnP67hsWbskrtLd7XZ8q0kpMwncWiLC3tt2VpzE8g8Tm4lJ4w2pahyQNiLIqLwybmFgJx4U/4q7sz7NQRPAd5GxJGM2BpTAMZExRdy05fxhmzc2+Oqtv0yuVSXS9+Ky2QCSZUMIUcAI/uqM7P8HrjHdXSgaWQpmgwR1GUfAkwAfqEyBAXYPvaOVEqugLDtmvutM/iTGj2r7DfUVeD19mMQ+ZLAuf7GCKnKuwDB72T8fO9WQSHtXXNHfKwo03qiGXP2M9lnMeMXY0P5ArDFm9olItcdeoQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjDnXkTKuJxl+82Lf4yto+oh45aK9Er0eixbh4avQ4g=;
 b=Mg1gPdz70LPBfzAtNgnRMhfq4ynl+K7IKPRw4NhJZWcgCNo7CvXzT0q2xhGTlwRJqTfhbbvUD90JSfGPxqwB/8Np6ushYdDLGxqHnnPEQ0SwpwfaU9g9ObN6WjYrgmyGixkx10JPYcDdPsg2K7I9u6BfvNgOf64ldQ9Na64F6ly4hwWUNKyXePYqpWr0t4Ehma7ytWe0BMw8Khdr3vjfjydM8FJaVsbLF7jldyYDQdgZ6cYeYnRNhmwpYDgNANlI6KrTR9ARDwGo6frKtDK9c0TF+akOKAzpOIZJhD9ZD7qjAaEjiuzdFTsS5YAU+tppd7rgmR5C7OfCBhtd/tj+rQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1940.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 10:59:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 10:59:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 12/14] powerpc/64s: Use {NULLIFY,SAVE,REST}_GPRS macros
 in sc, scv 0 handlers
Thread-Topic: [PATCH v2 12/14] powerpc/64s: Use {NULLIFY,SAVE,REST}_GPRS
 macros in sc, scv 0 handlers
Thread-Index: AQHYn/Bgnw4/YB5XQkGq2M/4z6bTwq2k6/MA
Date: Mon, 8 Aug 2022 10:59:23 +0000
Message-ID: <46cbb02d-1ead-26d5-c372-24e029436663@csgroup.eu>
References: <20220725063136.121108-1-rmclure@linux.ibm.com>
In-Reply-To: <20220725063136.121108-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d2d2306-9496-46d2-c7e1-08da792d0d6a
x-ms-traffictypediagnostic: MR1P264MB1940:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nSUWCKsa7XwzEQw0YMcN4wFOn1A/efiWc826+idtP8go35gXyR8zcWf0ccaoD+B7/QXjCADHIeq6VnY2ywrnBdQicaDNeSigc7q8quT4W4d9fPP8BXdhxWfsVd6+qTMtqHJAwFUsmTWNLshG7NiMsfPXq8EcOA4s1L5/9rvHMPnIUiHEP54zBRkBmg3AsG4vK21W5EY7t1cENDVSgKmkIDUqkzRX0xovJAdYbXIxQA+bF6LNM9dqAnBow+ovE7tpVL0kOxU5MZPB+FbK3kqShoxxX2cIgmnLdL5CEI9v2+Cdoyb1hPYf52ZlCACIK5xWjfF8p2cMAcXCiD+BOuY3mAJlQUxyKfPAjr57ipX3apF6SQCoLYFR6dl6snrZchFRM4/Ip6HHq54r3F3pPi7AQLbV07HkqfLXs0Kzayvm/JwFTUzB13zVN8KenPudiPCWeRTAZJ36B6ni5BcwPkQL9FgAGHhnqtZd9Id3uXuIteuYUiG1FKNS/IYRK4LaMiuD+0C9HXNNNA1l8SMxgopFgNcVJzy5MXQ/vYex7dKAzvVH1EXIKzqlTf0aB3HZTaXNyTgEFHzgik5DWnMZxpjD8Xb6vmaiUYb7CzEPfpwSORmQVAlwDnsBVh9VsKsBoEaLEulN/BXZeG7US9cDZ9EAuARvOdE4A0jxe8fjv+1lWJYqYODV10FmPKjg6ZFTHVH6E61Sz9ubRQqFDwP+qOvpIOQ+4TsV30XLh9SV18XwMzzRDNzoN9HGgndzWvihVocZxMkQ7VFPV733H0qG1gks8ymrcXD2p4tEYSOjkGBVhcZF74T4S6X4T46InEh/g5xvVjZiQjnBE5mR4co2NjFLuMD4G+ZTV0fvT4W4kdOg5nhEstsWx7TloMHRMREE218y
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(346002)(366004)(136003)(39850400004)(38100700002)(86362001)(36756003)(2906002)(44832011)(31686004)(6486002)(5660300002)(8936002)(31696002)(71200400001)(38070700005)(478600001)(8676002)(64756008)(4326008)(66946007)(66476007)(76116006)(66446008)(66574015)(66556008)(83380400001)(6506007)(91956017)(41300700001)(110136005)(122000001)(6512007)(26005)(316002)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NEJ1bWsxQWV5alY1bU9hT1JkSWF1VmpoWkNmR0dCVU94OGlUbnZKYVp3NTM3?=
 =?utf-8?B?eWZlZ0NTcmVHeTNadit1YlhSZEcrbFFHbWpWODNXTXorSk9iYVE0S0ZzMDJv?=
 =?utf-8?B?TEg1Z1lIZlhkM01WU0NCaWg1S2ZyS1drM2NHSjMzWHYwZzdRemtpbUhOWWgz?=
 =?utf-8?B?eEhSZGhTTGFBano5UWorYzRESFJ1NGIzUkt5c1Yxb0RodkY5bFg2UWV5OU51?=
 =?utf-8?B?TDB6emNvbjRKYW9vdFVpbmtldWt4NHZQRzdxS25jRHVmZThJNzZ3MWdlVkgz?=
 =?utf-8?B?ZjQzOHE5MGdvZ1BzWVBlQ1pWeFdETVFJbVRjNTB4NG15eS9Zb1d0ZDlCWllh?=
 =?utf-8?B?RnIwTGtCdUVPWDlzRDBsT0pZbUpjRDNxaHhaTUVZQlpQdzE4ekp5ZncvZEdJ?=
 =?utf-8?B?dm1RbVJ0cmV1UWdPMTcwNW1hU3g3SUlGeWdtWUZ4aXhGbmlHdy9QbUNpeTJj?=
 =?utf-8?B?ZGhZdTNPY2lsWWxUSkdVWjZPSVYwRW9ULzNvRXJUYThxSlplWE1jVmc2dWFN?=
 =?utf-8?B?MHdpQTJRUXM4alFlV2FMZ2crTm5OMnVoekU1eGhFTXlsYVVaZWlVT1dUNDF4?=
 =?utf-8?B?U1V6eEFWZFFjRzBOQ0pGR2VjRzBhWUFXQTMraFZUbzYxZlZsQ3ZsRUt3ZkFJ?=
 =?utf-8?B?VU9hM0ZmS2d5Nm9vRXlXczV5cnQ5ZnEvVGZwS3FkanR5NWdZa1pwWmtXV3VI?=
 =?utf-8?B?MW5udUIzL3k5dDBaaFFXSU1JTkxuU094eklXeG1nUWZaelhoOTdYbzBUU1Zr?=
 =?utf-8?B?ZmZrVDNza0hLaFRMd25WeU8wTHB6MHAxNjVFYWt6L2pIT2ZZbndydkJxQ3o2?=
 =?utf-8?B?VTlTYnVJeFBmemIzRnkydDJIeW1HL29SOUxha2phSVVCb0ExdUFCRXpCbTVU?=
 =?utf-8?B?ZGcyMFRoV0lkdUtpU3FINU1lOWZnbnJIcXRKSDBKbWlmSGVyYXd6ZmRvYldD?=
 =?utf-8?B?aURYY3V4Ui9SVDVoNEFXZ21SeERFU3lLcUEzMVZzcHJkZnpOKzdKenZJbHlh?=
 =?utf-8?B?M091RDhiZ210aTJabFRzRFhkVWZhQmJ3a3kxSmpXblZqWTg2SHhPZzAzU3hz?=
 =?utf-8?B?NU9KdG1QeFJYUUVQaXNWQ2lodFNEZHFpVkJ3blZvNTVBWlZCT0trMFJsanhJ?=
 =?utf-8?B?NXpxVCt0Y1dnbW1aSWhoS0FZczcyWHZnRFpFaXdtTDh2TGk1ak5QTTlIWGpQ?=
 =?utf-8?B?SmxmcUJMb3JRLzZUNG4yLzlqeDZ1bExCYThsRXVwcUdxR3A0MUU0SHlFWXBO?=
 =?utf-8?B?TXNyZzVhcjd2WGVIM3JmZndhZzNSK0ZjYkh4cnQwVnRidFpFNFo3SjBqVnJk?=
 =?utf-8?B?d05sWkNjUUdjTXIwdjM3L3Rrckloa0VITHhRN2VHbERLeS9ZS0daZVNaYVF3?=
 =?utf-8?B?UHVWRVFrc1d2ZWxSV1JpVVFkZHNMUVY2ak5WTFEvckRoRjQrWmp3NDZGdkg5?=
 =?utf-8?B?VjVCdGdBYUdXUTI3Wm9ESmhlRERNR1RnTnlqMUhUSUNiSkVDdmZDRjlWWVlH?=
 =?utf-8?B?eWk3Z0lkaWpYTUNudXlxQjViM1VRLzRvQUFjaE5wY2IyQ29WNm1WcmtrSXBh?=
 =?utf-8?B?ODcvbDJaNWxoRmw1aUNLbGpHUWducjNrSmI5RUxvVExGcmZISUcvY2VGL0JD?=
 =?utf-8?B?MHNuNVNjbFlpVkFvL1NTeFVzT3dzcWhjQytHSkROTVpnT0g3VkhqODVTMXlJ?=
 =?utf-8?B?QUoxdXQwelJ1VnVuMlkzQXo4Z3ZSK3B0RXBUVTdYbER0dlhSYkcyWHQ0RGRF?=
 =?utf-8?B?WjdtQTJSMEpYVVg5bm9rT2F4NDRibU1vTzA2ZGlVcmtqYkJ3S1ZGdUJuM1JF?=
 =?utf-8?B?Ylg2NFdITXZWQTlzQVQxMVpURHcxR3J3Z1czZVUwcG5LTUN4SEdXeUFNdkxO?=
 =?utf-8?B?MXoxZHhMNFpFNk1SR0lIbXZ1TkxTemNteDlKWVExbUE4VXFITUI1VDNZT1hN?=
 =?utf-8?B?MEkrZ3BoeDVpaGZzL1FYN3F5MCtnWDd5OHg4V1o5WkI1bldHVTFkR0xSanRU?=
 =?utf-8?B?QVlWczdZaHlvUHZpbW01Z243ZWo1TDFRWnVaQmFCU3dSdXY2U2E2bG1BVXM2?=
 =?utf-8?B?dWlmMmpzQnEzdngvSjdMVitxZ0xnODNwVWdVeEtJbFdwQ1JiMzVXbjBYY1Zi?=
 =?utf-8?B?akhKbXYrQmdEU3FVd3hnMGhkd1R0MTlhQW80dnpvN2l4Qkp6Y0hYTFN4YUVV?=
 =?utf-8?Q?+H1IW4rPoWj6dxelHeNArls=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47E1858B00B9014990C79C8C42976A69@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2d2306-9496-46d2-c7e1-08da792d0d6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 10:59:23.1781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ED6TV9FoCfoCMeZdYWGThCpyruQWz6HUgnx+4oLPaouY/HT7/bbNyx1qUiXtykdoG8YmWhXe/gXvg9u0WzC9PGRbB2PnUivI73cJzQRqexM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1940
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA3LzIwMjIgw6AgMDg6MzEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBV
c2UgdGhlIGNvbnZlbmllbmNlIG1hY3JvcyBmb3Igc2F2aW5nL2NsZWFyaW5nL3Jlc3RvcmluZyBn
cHJzIGluIGtlZXBpbmcNCj4gd2l0aCBzeXNjYWxsIGNhbGxpbmcgY29udmVudGlvbnMuIFRoZSBw
bHVyYWwgdmFyaWFudHMgb2YgdGhlc2UgbWFjcm9zDQo+IGNhbiBzdG9yZSBhIHJhbmdlIG9mIHJl
Z2lzdGVycyBmb3IgY29uY2lzaW9uLg0KPiANCj4gVGhpcyB3b3JrcyB3ZWxsIHdoZW4gdGhlIHNh
dmUtdG8tc3RhY2sgbG9naWMgaXMgc2ltcGxlIChhIGdwciBpcyBzYXZlZA0KPiB0byBpdHMgY29y
cmVzcG9uZGluZyBvZmZzZXQgaW4gdGhlIHN0cnVjdCBwdF9yZWdzIG9uIHRoZSBzdGFjaykuDQo+
IFdoZXJldmVyIGEgZGlmZmVyZW50IGdwciBpcyBzdG9yaW5nIHRoZSBpbml0aWFsIHZhbHVlIG9m
IGFub3RoZXIgZ3ByIGF0DQo+IHRoZSBpbnRlcnJ1cHQgbG9jYXRpb24sIGNhcmUgbXVzdCBiZSB0
YWtlbiB0byBpc3N1ZSB0aGUgY29ycmVjdCBzYXZlDQo+IGluc3RydWN0aW9uIGFuZCBzbyB0aGUg
bWFjcm9zIGFyZSBub3QgYXBwbGllZCBpbiBuZWlnaGJvdXJpbmcgc3RvcmVzLg0KDQpTb21lIGNs
ZWFuaW5nIGNvdWxkIGFsc28gYmUgZG9uZSBpbiBlbnRyeV8zMi5TDQoNCg0KDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+
IFYxIC0+IFYyOiBVcGRhdGUgc3VtbWFyeQ0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVs
L2ludGVycnVwdF82NC5TIHwgMjkgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaW50ZXJydXB0XzY0LlMgYi9hcmNoL3Bvd2Vy
cGMva2VybmVsL2ludGVycnVwdF82NC5TDQo+IGluZGV4IDM0MTY3Y2ZhNWQ2MC4uZWZhZjE2MmZh
NzcyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2ludGVycnVwdF82NC5TDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaW50ZXJydXB0XzY0LlMNCj4gQEAgLTcxLDEyICs3
MSw3IEBAIF9BU01fTk9LUFJPQkVfU1lNQk9MKHN5c3RlbV9jYWxsX3ZlY3RvcmVkX1xuYW1lKQ0K
PiAgIAltZmNyCXIxMg0KPiAgIAlsaQlyMTEsMA0KPiAgIAkvKiBTYXZlIHN5c2NhbGwgcGFyYW1l
dGVycyBpbiByMy1yOCAqLw0KPiAtCXN0ZAlyMyxHUFIzKHIxKQ0KPiAtCXN0ZAlyNCxHUFI0KHIx
KQ0KPiAtCXN0ZAlyNSxHUFI1KHIxKQ0KPiAtCXN0ZAlyNixHUFI2KHIxKQ0KPiAtCXN0ZAlyNyxH
UFI3KHIxKQ0KPiAtCXN0ZAlyOCxHUFI4KHIxKQ0KPiArCVNBVkVfR1BSUygzLCA4LCByMSkNCj4g
ICAJLyogWmVybyByOS1yMTIsIHRoaXMgc2hvdWxkIG9ubHkgYmUgcmVxdWlyZWQgd2hlbiByZXN0
b3JpbmcgYWxsIEdQUnMgKi8NCj4gICAJc3RkCXIxMSxHUFI5KHIxKQ0KPiAgIAlzdGQJcjExLEdQ
UjEwKHIxKQ0KPiBAQCAtMTU2LDE3ICsxNTEsMTAgQEAgRU5EX0ZUUl9TRUNUSU9OX0lGU0VUKENQ
VV9GVFJfSEFTX1BQUikNCj4gICAJLyogQ291bGQgemVybyB0aGVzZSBhcyBwZXIgQUJJLCBidXQg
d2UgbWF5IGNvbnNpZGVyIGEgc3RyaWN0ZXIgQUJJDQo+ICAgCSAqIHdoaWNoIHByZXNlcnZlcyB0
aGVzZSBpZiBsaWJjIGltcGxlbWVudGF0aW9ucyBjYW4gYmVuZWZpdCwgc28NCj4gICAJICogcmVz
dG9yZSB0aGVtIGZvciBub3cgdW50aWwgZnVydGhlciBtZWFzdXJlbWVudCBpcyBkb25lLiAqLw0K
PiAtCWxkCXIwLEdQUjAocjEpDQo+IC0JbGQJcjQsR1BSNChyMSkNCj4gLQlsZAlyNSxHUFI1KHIx
KQ0KPiAtCWxkCXI2LEdQUjYocjEpDQo+IC0JbGQJcjcsR1BSNyhyMSkNCj4gLQlsZAlyOCxHUFI4
KHIxKQ0KPiArCVJFU1RfR1BSKDAsIHIxKQ0KPiArCVJFU1RfR1BSUyg0LCA4LCByMSkNCj4gICAJ
LyogWmVybyB2b2xhdGlsZSByZWdzIHRoYXQgbWF5IGNvbnRhaW4gc2Vuc2l0aXZlIGtlcm5lbCBk
YXRhICovDQo+IC0JbGkJcjksMA0KPiAtCWxpCXIxMCwwDQo+IC0JbGkJcjExLDANCj4gLQlsaQly
MTIsMA0KPiArCU5VTExJRllfR1BSUyg5LCAxMikNCj4gICAJbXRzcHIJU1BSTl9YRVIscjANCj4g
ICANCj4gICAJLyoNCj4gQEAgLTE4OCw3ICsxNzYsNyBAQCBFTkRfRlRSX1NFQ1RJT05fSUZTRVQo
Q1BVX0ZUUl9IQVNfUFBSKQ0KPiAgIAlsZAlyNCxfTElOSyhyMSkNCj4gICAJbGQJcjUsX1hFUihy
MSkNCj4gICANCj4gLQlsZAlyMCxHUFIwKHIxKQ0KPiArCVJFU1RfR1BSKDAsIHIxKQ0KPiAgIAlt
dGNyCXIyDQo+ICAgCW10Y3RyCXIzDQo+ICAgCW10bHIJcjQNCj4gQEAgLTI1NiwxMiArMjQ0LDcg
QEAgRU5EX0JUQl9GTFVTSF9TRUNUSU9ODQo+ICAgCW1mY3IJcjEyDQo+ICAgCWxpCXIxMSwwDQo+
ICAgCS8qIFNhdmUgc3lzY2FsbCBwYXJhbWV0ZXJzIGluIHIzLXI4ICovDQo+IC0Jc3RkCXIzLEdQ
UjMocjEpDQo+IC0Jc3RkCXI0LEdQUjQocjEpDQo+IC0Jc3RkCXI1LEdQUjUocjEpDQo+IC0Jc3Rk
CXI2LEdQUjYocjEpDQo+IC0Jc3RkCXI3LEdQUjcocjEpDQo+IC0Jc3RkCXI4LEdQUjgocjEpDQo+
ICsJU0FWRV9HUFJTKDMsIDgsIHIxKQ0KPiAgIAkvKiBaZXJvIHI5LXIxMiwgdGhpcyBzaG91bGQg
b25seSBiZSByZXF1aXJlZCB3aGVuIHJlc3RvcmluZyBhbGwgR1BScyAqLw0KPiAgIAlzdGQJcjEx
LEdQUjkocjEpDQo+ICAgCXN0ZAlyMTEsR1BSMTAocjEp
