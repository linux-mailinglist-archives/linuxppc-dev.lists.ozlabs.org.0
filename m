Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 268A74721DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 08:43:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCD500bP5z3cNH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 18:43:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60a;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCD4V5W5Wz2yw1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 18:42:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7k6VTxPyM5b80CbCsqNmbZb6gjRJsduR04Vw8HqUrcVGz0Vp8UBQUML+UP7FIff0aDwM5PVFUDMqgIG1umBFyydil+ihAG6lt6SlGi3AFpyfa9SWRsVSWg+vcr7TeTbX0sCbZlrAynVDlPmPHfG2j3hYxQWWmtGFoqp4OCP8eucxKbvMUgEQaJJ3i3NQQ9fQSWlYRGJOeO26J8x+zOYiohSOlIXuGVs/kFkaYk5dkTX6GGJo5RKUOS1/s7FmDtdPy5/358A/j/ckRUee2rNRyr6W00jrOgcc0Jm9oQCujB+hOLvxUL8ll3aOAJbauj+wNwEs/azcZrtrrOKrBRKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qxt0aBQpvDSmQQsLrfasJTFv++LnMBFJbJsKJYIur04=;
 b=AeMNgBnvEq0htx1i14o3K2fR8IRMeVo5wCHf948g4P4D/dYnEpwSugmebcDFGJC9NshtCJXTJmQScqqD49N4By1rWC72QpI/nWSq2WovN4C3r6cI+CEPHFfPdtZ4+boYSgMsF4bJv/9XuCyGskVIECEuE1NGBrjI1Fl+5IjdTQdgepS8uFN7F5feZ39FAPkoUU6Rz8sX9/FBWF5lYcrWldnmYIF2dLhIvzopMVfmoEL/9bepLxFXey8AP2wQy9JmIWmPoZhTdxJwGA1KCRFoEBqD54qJfQDHBR+s1Pab1obB2X9P0+5NiQGV9J9GsAkXQOepJD5tILSd0QkRF3NX6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Mon, 13 Dec
 2021 07:42:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 07:42:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Joe Lawrence <joe.lawrence@redhat.com>, Russell Currey
 <ruscur@russell.cc>, "live-patching@vger.kernel.org"
 <live-patching@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
Thread-Topic: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
Thread-Index: AQHXzspJJmoyNvOd+UCDOrmbjdknXavuZfuAgABKxICAQZuGAA==
Date: Mon, 13 Dec 2021 07:42:06 +0000
Message-ID: <bed88ff4-e5d3-4b78-4f28-29fc635c2f97@csgroup.eu>
References: <YX9UUBeudSUuJs01@redhat.com>
 <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
 <f8a96ac1-fda3-92da-cf27-0992a43a2f3f@redhat.com>
In-Reply-To: <f8a96ac1-fda3-92da-cf27-0992a43a2f3f@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4f1feb2-6cbd-482b-0401-08d9be0c0fec
x-ms-traffictypediagnostic: MR1P264MB2179:EE_
x-microsoft-antispam-prvs: <MR1P264MB2179F3E41EFD5959F86E20E5ED749@MR1P264MB2179.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O4OCboINt4sZ0sgCHPzgl9BiabYXSMy5B4b8VxqnrjAn3LLi+S3qJIin1eF2dmUoyh36vlplDdlLQhE2gHlP93PAVtLTrd1mlJHHMoSnUtqr5j1sL+8fnQ9F/hBxSm/4wlhAhm5iDSks/bjLMtW4Y9Afox/DemFqdiJzl29jI3p5IXpMSOEMrCWormKqd+7Qn8O2bs/FVNALZqh5vdxEZQABrzMVkwgLAy+/xPWDzMkVQE6Z7hyJWrVyzSik3RL3jCRap/ajfi9jCNCfN8elmr9AUDC+cTm5o58oeRPWvnoOpfZA/4rB8L5IDrbV2tcGM2Z1qAWcIl2JFjhHljKtrQCzOY4HDdZrBJ4+JuDG2k2iIDchlBus70pihWJy0F30LxX7Y/ttXKm008rHTapPa4QZ/bnrmdip1MSim8/oLNFectutcuw/At7Y7iOFWGf4RoeFeBBARIkpVWky4S701eZB+4S/qr/VwrEIrqfFs/4d5SwMCKgTZCEXWD2HDGcQeGiWctHK+nUwxWB0hkSMQwrZYASmyaO1sBg3Dq3FLdvDp4O63qdkIxzanUHvZ401UVlcXKPQLoeGg/LeEg3gGBjsNdsetMaCkMFKEWuYFT5atqe03JYRVGt/skYS3A7YM4WAdCMyX837gcJNkmo2zQ29ajd8q74N+9E0NGZ7o2n2ZjxLvko9kZCtAY0vja/2opNV2HIvQCUcyeCN3nI3SiRyVD4iI/d1uf2GE6nXp68sNEsgXlPyAxg2eFvd++LxkiTIYfihkUbHoU2yTHPXEg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(31686004)(71200400001)(8676002)(2616005)(2906002)(122000001)(64756008)(66556008)(6486002)(6512007)(66446008)(8936002)(36756003)(6506007)(53546011)(31696002)(110136005)(38070700005)(4326008)(76116006)(66476007)(5660300002)(316002)(44832011)(91956017)(66946007)(186003)(83380400001)(66574015)(508600001)(38100700002)(54906003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDB5YmoycStmRnY0YmNBRlJoTmw1ekdCMHdlTk5oUng4ZVVoNXVIUm96eEFX?=
 =?utf-8?B?TG9yeGtZSVQyNlRMYUQ1Z1YzUFBsMmdoZHNndzlpV0p0SFVlQUlIVHdJczE4?=
 =?utf-8?B?Nys1akhkUHBZNmZqWnQ4djNJVE9RVU5lbTk4RERaRnlXZDU3WHc1SnZOeFZV?=
 =?utf-8?B?S3FJaWxIZDA1UWhWemFYU3Y5dUNhcmRtU0VVOVkwVkMzY2ZNZC93WjVxZHdV?=
 =?utf-8?B?VFpHd253eGV2MWpYVFhuT3dtUzJ0U1BOT3NDQWIvbkFzRXVSZWdEQUJ6WS8x?=
 =?utf-8?B?TlRUNnc2d0hMZHFXNHMzbzR6azE3WjhZaXN1VjBXd1BwZXFaYTRHUkcyWlhl?=
 =?utf-8?B?L0NYOTVSTm5ybmxBTXNnSFF1QjBCTlB4UlRaNzJjQXdKd1BoT1lCb1dEUzY4?=
 =?utf-8?B?NEViN29Pajh0bEwxV2FDc1FDTlJkbmszcGRHN0xiZWFnYUFJQi9reHVLTEI4?=
 =?utf-8?B?aWUwd3BMVGt1Y2I0Tjd2czgxMzEveXJkVUNnWElzL0d4MDBlWUZxNHJoQysr?=
 =?utf-8?B?V1BhZ1FBbmhWMXJvdzh0bHNYWnlyNUFXQmhJQWRERllCb2lCaUNVVGplWmov?=
 =?utf-8?B?RTNqTnJULzRxSG5uVFZ0WVB0Q2dFUTFrcjhDRDljemFJY2VLaVMzTjQ0WVZp?=
 =?utf-8?B?ZTVXK3N1Q2RBaUZZRlJLcFdVakJ3dFZPRUVFUHVzRllzZGtPTW1KekFvTHRt?=
 =?utf-8?B?d2paVS9FM3c5WFF1MXdrK2g1R3RDaFF3VWpDYzBZdVFMZ0xpRk1CakNUeDYy?=
 =?utf-8?B?dHc1Rmc2UmNGcUZrbVlkUjU0N0lvN3FPWHRVNmNhTTB3RXZuNXFQRjBYUHlO?=
 =?utf-8?B?L3NhcW1RdlI5SjdtZ1JXeVY4bU5QcC8yUkh6MG1rQVFtaHdsVHFCbzJNcEhW?=
 =?utf-8?B?NE5YQ3dFS1FPeExTN0JhRGpZcFpmT09HWllsTFlhWkkrSlUvSm43cjludW1q?=
 =?utf-8?B?QldyL0ZndW9SWms2eGVsVVAwV3FUMlVMdFRYSVJmNWtBQVU3Nnlrek03VVZP?=
 =?utf-8?B?am9ZSFdqKy96VUtNcmpERGxmMlMvV2RaTzNDNTFMK1lWQVNwRm1CUVNVcUdl?=
 =?utf-8?B?cVlxUkdGckkzRHFWeDc1T3FaQ1RXalBUR3MxV2pNUURUa2hRQVppN2ZoT3Vt?=
 =?utf-8?B?S2FOemVrREFGOUhqNU9EaUNQVlFwM0ZsNWl0ZGZRb0xzN21pTHRldDZuaytH?=
 =?utf-8?B?bXFmNUIxZFFFYnVkdkg3N2RSUE5BeEJzb0JKM3gxNHI1Z0xtOSs2dGdXY0xv?=
 =?utf-8?B?QzJXNUlTemtjNjcwdW5kWUhNcmhnZHhQcFVMdE5lZUVEOHhjUXlYcmJpaFhC?=
 =?utf-8?B?V0djWGsvT0psV3d1RTd5ZUZCSVVvQnRMbVJqUHpxbE5OVjlPTWhBcDJmZHJt?=
 =?utf-8?B?a2MyUzlxZjJNcE50R2l4M1h1TzRFd0UwRXRuZHFTTldpSUphbFFSekYzakxT?=
 =?utf-8?B?WG1wZnpyaG5laEZVUEEvWmMrWVpGTW1vdkplVUhUWUZCVnRDemcxTncwOHpx?=
 =?utf-8?B?M2NzMDhMdExYMTk5L0VpdEdSKzdGMGFMWWJiUFRFWm5RYWcxYjFTRkU5YVc3?=
 =?utf-8?B?N0JoTzFVSjc4MU5EUlRnWkZmZ25lS2FERGVaRUZiTXpHSmNkRThhWi9HMHhG?=
 =?utf-8?B?QWVzSDdQSDBBaDFkNTA3ZWdTQk5EV3hPd1JGY2ZFalJuVjNnQVptb3g1Rjll?=
 =?utf-8?B?OHUzTmNndW92RHdHZEZyYXZEUjhZN3VGdUVrNVBXa1hnSTA4YjFTYytWNkpa?=
 =?utf-8?B?NHN0eU5OOFRuVlBpTWYzSWE0eEk2a3ozQm9NalozYnlPbmRkVSt5Vm4zcEdP?=
 =?utf-8?B?clk1QngrQ0RyVG84TWNHMXBTQ3FOL2pYT1hxejg2QkUwS1gzLzZraE9oL3Nv?=
 =?utf-8?B?bndob2E4U3JQVGFIS0taMHVQcXhSSm9lRU94NUtGaVJSc043d0xTV1l4YUtH?=
 =?utf-8?B?aVpRRkVpT1ErUmt2NGVhVXBoelNjcTlwOEFMQU5kMG11aHZjMVgyeWJzQVhW?=
 =?utf-8?B?L2VLb2pnaVc0dGRDZ3dFYWk1QTNiY3NsZGoxWm1lNmwyVkpZeTlZWkJhSDV2?=
 =?utf-8?B?Q09na3NFcml4N1d2dkdJSWZ4RGQzcEhUV0FNYXQ5S3h0bFQ3WUlFWWlWWitO?=
 =?utf-8?B?dWlsNEVaamhTaEtIdW1uRGd2QmNPY29qeEtsL0xibnkwOWYycjlua1kxR3NM?=
 =?utf-8?B?REJRNmRKazJkenZsN0NqVkVpOHI2aFFKWFlEdGU5aDlBemdPUGZmN3Nob0ox?=
 =?utf-8?Q?9QdJg8QNj3aQTFCDrVhity4WfjqGwInbhAg+capHxA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6AF8B11AC7EE54490B9371E8101DDEB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f1feb2-6cbd-482b-0401-08d9be0c0fec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 07:42:06.4959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0kpKagJxWbfCLkgLMXvE/LhoCMrI2oMquI/pZjZDX2v8BydagwN8l58En3mSGLdwxzk0J/VIlGbZ0d4nWoi9NGAHgUBKNQBedJYKlVMndPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2179
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzExLzIwMjEgw6AgMTQ6NDgsIEpvZSBMYXdyZW5jZSBhIMOpY3JpdMKgOg0KPiBP
biAxMS8xLzIxIDU6MjAgQU0sIFJ1c3NlbGwgQ3VycmV5IHdyb3RlOg0KPj4gSSdtIGxvb2tpbmcg
aW50byB0aGlzIG5vdywgd2lsbCB1cGRhdGUgd2hlbiB0aGVyZSdzIHByb2dyZXNzLiAgSQ0KPj4g
cGVyc29uYWxseSB3YXNuJ3QgYXdhcmUgYnV0IEpvcmRhbiBmbGFnZ2VkIHRoaXMgYXMgYW4gaXNz
dWUgYmFjayBpbg0KPj4gQXVndXN0IFswXS4gIEFyZSB0aGUgc2VsZnRlc3RzIGluIHRoZSBrbHAt
Y29udmVydCB0cmVlIHN1ZmZpY2llbnQgZm9yDQo+PiB0ZXN0aW5nPyAgSSdtIG5vdCBlc3BlY2lh
bGx5IGZhbWlsaWFyIHdpdGggbGl2ZXBhdGNoaW5nICYgaGF2ZW4ndCB1c2VkDQo+PiB0aGUgdXNl
cnNwYWNlIHRvb2xzLg0KPj4NCj4gDQo+IEhpIFJ1c3NlbGwsIHRoYW5rcyBmb3IgdGFraW5nIGEg
bG9vay4NCj4gDQo+IFRlc3Rpbmcgd2l0aCB0aGF0IGtscC1jb252ZXJ0IHRyZWUgaXMgcHJvYmFi
bHkgdGhlIHF1aWNrZXN0IGFuZCBlYXNpZXN0DQo+IHdheSB0byB2ZXJpZnkgdGhlIGxhdGUgcmVs
b2NhdGlvbnMuDQo+IA0KPiBJJ20gaGFwcHkgdG8gc2V0dXAgYW5kIHRlc3QgYWRkaXRpb25hbCB0
b29scyAoaWUsIGtwYXRjaC1idWlsZCkgd2l0aCBhbnkNCj4gcG90ZW50aWFsIGNoYW5nZXMgYXMg
SSBrbm93IHRoZXkgdGFrZSBsb25nZXIgdG8gY29uZmlnIGFuZCBydW4uDQo+IA0KDQpIZWxsbyBK
b2UsDQoNCkknbSBpbXBsZW1lbnRpbmcgTElWRVBBVENIIG9uIFBQQzMyIGFuZCBJIHdhbnRlZCB0
byB0ZXN0IHdpdGggDQpTVFJJQ1RfTU9EVUxFX1JXWCBlbmFibGVkIHNvIEkgdG9vayB5b3VyIGJy
YW5jaCBhcyBzdWdnZXN0ZWQsIGJ1dCBJJ20gDQpnZXR0aW5nIHRoZSBmb2xsb3dpbmcgZXJyb3Jz
IG9uIGJ1aWxkLiBXaGF0IHNoYWxsIEkgZG8gPw0KDQogICBDQUxMICAgIHNjcmlwdHMvY2hlY2tz
eXNjYWxscy5zaA0KICAgQ0FMTCAgICBzY3JpcHRzL2F0b21pYy9jaGVjay1hdG9taWNzLnNoDQog
ICBDSEsgICAgIGluY2x1ZGUvZ2VuZXJhdGVkL2NvbXBpbGUuaA0KICAgS0xQICAgICBsaWIvbGl2
ZXBhdGNoL3Rlc3Rfa2xwX2NvbnZlcnQxLmtvDQprbHAtY29udmVydDogc2VjdGlvbiAucmVsYS5r
bHAubW9kdWxlX3JlbG9jcy50ZXN0X2tscF9jb252ZXJ0X21vZCBsZW5ndGggDQpiZXlvbmQgbnJf
ZW50cmllcw0KDQprbHAtY29udmVydDogVW5hYmxlIHRvIGxvYWQgdXNlci1wcm92aWRlZCBzeW1w
b3MNCm1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5tb2RmaW5hbDo3OTogDQpsaWIvbGl2
ZXBhdGNoL3Rlc3Rfa2xwX2NvbnZlcnQxLmtvXSBFcnJvciAyNTUNCiAgIEtMUCAgICAgbGliL2xp
dmVwYXRjaC90ZXN0X2tscF9jb252ZXJ0Mi5rbw0Ka2xwLWNvbnZlcnQ6IHNlY3Rpb24gLnJlbGEu
a2xwLm1vZHVsZV9yZWxvY3MudGVzdF9rbHBfY29udmVydF9tb2QgbGVuZ3RoIA0KYmV5b25kIG5y
X2VudHJpZXMNCg0Ka2xwLWNvbnZlcnQ6IFVuYWJsZSB0byBsb2FkIHVzZXItcHJvdmlkZWQgc3lt
cG9zDQptYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUubW9kZmluYWw6Nzk6IA0KbGliL2xp
dmVwYXRjaC90ZXN0X2tscF9jb252ZXJ0Mi5rb10gRXJyb3IgMjU1DQogICBLTFAgICAgIGxpYi9s
aXZlcGF0Y2gvdGVzdF9rbHBfY29udmVydF9zZWN0aW9ucy5rbw0Ka2xwLWNvbnZlcnQ6IHNlY3Rp
b24gLnJlbGEua2xwLm1vZHVsZV9yZWxvY3MudGVzdF9rbHBfY29udmVydF9tb2QgbGVuZ3RoIA0K
YmV5b25kIG5yX2VudHJpZXMNCg0Ka2xwLWNvbnZlcnQ6IFVuYWJsZSB0byBsb2FkIHVzZXItcHJv
dmlkZWQgc3ltcG9zDQptYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUubW9kZmluYWw6Nzk6
IA0KbGliL2xpdmVwYXRjaC90ZXN0X2tscF9jb252ZXJ0X3NlY3Rpb25zLmtvXSBFcnJvciAyNTUN
Cm1ha2VbMl06IFRhcmdldCAnX19tb2RmaW5hbCcgbm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9y
cy4NCm1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5tb2Rwb3N0OjE0NTogX19tb2Rwb3N0
XSBFcnJvciAyDQptYWtlOiAqKiogW01ha2VmaWxlOjE3NzA6IG1vZHVsZXNdIEVycm9yIDINCg0K
Q2hyaXN0b3BoZQ==
