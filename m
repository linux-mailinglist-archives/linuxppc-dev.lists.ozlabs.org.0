Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 453674E2299
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:56:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMT4R1Tcnz3bZk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:56:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::607;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::607])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMT3v4Ph2z3069
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:55:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4juLTpV94gNXqwiuon/MnWOGCILge77jAzH0Ekk7njbH120ImEw2DQoZm0/qn2O7k7bRgZSVi6T872gK7/F1E6VBSZCEbTSW492+LfOL7I2Yp8sj9b25tzADatofRLm0NKKdfGewMI6fDi/JT/qNbvaOkTHLAaBXeOKkw4IhUwkdxoDmx2PWOJqzPKpAvW4jT2vwWIXWdyUOiyptr2A5oTVKSdc7L+j3t7Ot0Ab54bNXsOUqhmNxALjwReMnxise+OdYoxJ9kqvctkArHAuwJvKlB55/zG8j5UpSv5F4CvsK012BFWj8+k6INkpbzjq31JUghS8OKhvHG53V/Lsgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eysb3mUt2s8Nm1Ua5UDT1Yplg5rEGqXV6StYDaEn0rs=;
 b=Eya1vwz8TsYEP8kU0ubFgIyWwYNRJH62rgcGlK4WbMrbufHGTuXklSlsfmWYnJbRXCaP1O+oBQ7YxyXmUIqU98atF6UegxQtzufQGxy4Q3+Kk9AIxOBGADYYXFH2RFr842kxDkRk6fUl7eVfA5av7yE6jekqKt1wd16Z7VWGmzlnzJKD8xi24Ty/+JLzZAx11BBM/57Fbgew3ZgO4ZuqxuDLhlP27U5fs0W+M6SF48xojF7dphHDHkxllwsrIXPrJ8TksBFytyDC5X22qyhGcdswanVmTwfSksOCeuaZDDXVU2Nm3e/9Ko1AliwAG8xhDjUUewRYToOFXNpWZnk0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3777.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:28::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 08:55:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:55:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH] macintosh/via-pmu: Fix compiler warnings when
 CONFIG_PROC_FS is disabled
Thread-Topic: [PATCH] macintosh/via-pmu: Fix compiler warnings when
 CONFIG_PROC_FS is disabled
Thread-Index: AQHYO2NbGWH8CI3mhU+PVN1BAmrQRKzJZuMAgAAfJACAAAYNgA==
Date: Mon, 21 Mar 2022 08:55:36 +0000
Message-ID: <6805e9e3-e891-fb0c-0937-83709a9d18c0@csgroup.eu>
References: <650f5577599a701fdd632cdd469a9cea9788cdf3.1647674431.git.fthain@linux-m68k.org>
 <bb6d3131-3c46-654f-d2a0-6d57bb8cbfbf@csgroup.eu>
 <39f63c1b-5a1b-8c8e-5991-813d3d3c2576@linux-m68k.org>
In-Reply-To: <39f63c1b-5a1b-8c8e-5991-813d3d3c2576@linux-m68k.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41eedc56-9c1f-47b5-95e6-08da0b1890c1
x-ms-traffictypediagnostic: MR1P264MB3777:EE_
x-microsoft-antispam-prvs: <MR1P264MB3777CE64C009067AF036FB74ED169@MR1P264MB3777.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jJ3pEz3AQtDsEstQdvGCr12zJMhIR7bNdz0EBmZXHlmFbJkbPjnzvmpXEWulnR1nH5AZlQ87JEnjTShNEJAZ68abhoalaYXIEGHWdkf1NvcVEKo/8apttTZZEY/6UBI8yzOLTl2Rgks7+68LI+0aHkEyiPYUTk2yOJlBLbgRKKPbAPVRGDzmrPzEp5A0K8Ki9s/7r/2yjeGyxwiYmfimvCDGGx4xZkL+vm4jVOpYI2dNv0W2WyTHAl0xD8QvIF2P7vXPvf9P7C6vJvfh12SENdzEe+AbThw6JzHJioc7cuHNmvb+uNulo26Q1FHvUwpQjTxCEsAEnBM/DDbIjaW0SKvgr6CK1c4htGfSSchEKhLTfnaOe9orbxZtHSblkZAgSTbf7iwd8dAanjHik25RknC2B9UBkxsxshOmwd0bTJORTo/P4n0ao4vooIoir4CB6kDRA1fqY9cvCKq7IPd0JMUUKBJiBN+iWX1/bpyxI5my7ZYXHfY5cyp7UW+el+OYMoQjmYSHVnPno52nUHrd42NmGNeRhObIs1N9P0h/DqwNsGW/oilmCyyz/oCrynWzysibirfGSKTvf1itDzs6H68YD5w5JODp4BYYjY+FWpuI5TJw9QT821HLYurgBxCccFmGiLDSciFqp1hjWIh177Ev0NJEha1bScoRFCdqq1tROhE30FzLXxJ4/d1igdgVihkRHEPh6J7KoymB5DW9q3Jx0UecGul6L9WzuW6/6fMYKT4UeNOi/6aF0Wl3MxNL77y2MyXuTLvj3l6zwD5DMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(83380400001)(186003)(66574015)(122000001)(26005)(31686004)(2906002)(44832011)(6486002)(6506007)(38070700005)(31696002)(6512007)(8936002)(2616005)(5660300002)(508600001)(4326008)(66556008)(66476007)(66446008)(64756008)(66946007)(8676002)(76116006)(91956017)(71200400001)(6916009)(54906003)(316002)(38100700002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFI0eFJRSG54UEpxQm9HWG5YR2ZQOTdWeEd6ZkJJUnUvcWh3Q0MyNWFnT0Na?=
 =?utf-8?B?L0xrUFJ5dFVtSmtGSm5MSFlobVl0M2ppTm8vbmFHYkgraGFRU2tkV2h3U09y?=
 =?utf-8?B?VjRZeXJnM24xSHZWcWM5bkVra0lMa21XSFhiRUw1K3F2QVRiY0s0VjNYQ25B?=
 =?utf-8?B?T1RhMlUveStJZXBZbERjOC9BbjZvUkJLZGdlK2h0R1NJQllmY3IwamMrZlc1?=
 =?utf-8?B?WGNVc1hDSTZzQXJ6Q1pJRFVuUU1CZnU4QzNNQldwbmcyTDFwc0JyMzBhOFpk?=
 =?utf-8?B?dkIrSkVETno0bXZ0WXNreGdmSXZjNUYwYlVIWGpiakFGYTB1OVZ5NGxSYVpQ?=
 =?utf-8?B?bnBGZWZhYUVNSjFhYUgxS3M2alRxcCt5ZE5VY0NIY2ZoWVRscXB0MFozQ0Rs?=
 =?utf-8?B?cDBpeU5VdS8rQytmMjg3ZWFvM0d3QmVzSjRVQ1k3TmFsQkpNRVI4MUNjbUZ4?=
 =?utf-8?B?MGVSS2szUlRkM0p0OWRJV2xjZ1FKZ0JIVTNLNXJKT3hJRlZsblRmMHQ4a1BC?=
 =?utf-8?B?YzlyNnJTbzhkZlUrN1pURkNyaUIwN2xrSjhTZjVnQ2JNMDc0enlqakpVVjNQ?=
 =?utf-8?B?VU9hNXlVQjFLem5GU1NOTHJUaFQ2a05hQStwdVU3RnpYRzJnT1VjczRzQzI2?=
 =?utf-8?B?WWo0dE5CMTJwZm40VStSOTUyTVhGeWk3Q2oxUElwVFh2dmJmQ3hPa3VZK25x?=
 =?utf-8?B?Y2kxR2NVdXVJZW1uSUdMQUxUWU9uUXBqTEc4VmNCemZ0d3lMMWVGMVliZzhY?=
 =?utf-8?B?OXJzWnQxZUd1VVVjb0NVR0l0MW9YNzVURW5CMVg4aWE1VUxtZ0NVQzhwbXVD?=
 =?utf-8?B?Z3lrSURlYW9KcFVFRUFzekdrZnJQbW9meFNuczN0eGdLb3VIS1FhUW5kRXI4?=
 =?utf-8?B?RVF1cERSaWIzSFBXQVJ4UzRhKzVPZzV4bjJjMkNMTENrbnZRSlFjR0YvUENM?=
 =?utf-8?B?MjdFRXh2ZkFGZnhFVnpxTEtIODU5MW1GVGR4NGtTNm5ZeXJkcTg1b2FFL01Z?=
 =?utf-8?B?T2pYZ0tMNmQwRUV2bENYTSt4S3J2SlBtRU5IUS95UUlETWVyanhJVm1xYUdh?=
 =?utf-8?B?UytiTVpLeTY5OVF4Z1QvWk9QZWlRZXVWWExLNmNsREwreDFVUjg4aWFZalp0?=
 =?utf-8?B?SWVGY1Z5dkJ6MThpNzZmSFpQYUtpWUNacU0zUC9rYXdTelZYWGQyVHhoYzdm?=
 =?utf-8?B?TEMvYlc5NkxiSGdBS2JSK2l1ZkhnVGlidnFEZUFWMFJFVGY5RlQvTkxKMmk0?=
 =?utf-8?B?dHYxYU1oUE50S25qRGl1WnN6VFE0TVp0Y0R0b3V0UWJoWGFNd3Jua09MajJN?=
 =?utf-8?B?SitWWS9icnpGNFpCaTRibkhrNkx3S0R6MFZVaGtLZE8wU0pjVXRRNXRodzFN?=
 =?utf-8?B?K2hGdmgrMlVQSEV0cWZVWm5NVlg2ZGtrOFR0U3dwblJNcmtxVXNFTEhOVFRp?=
 =?utf-8?B?T2hPNGpxV0NlZDl1VlViRFZTRGZHVlNiZ0ZXcU1kRlpiL2taanIya2ZFZnND?=
 =?utf-8?B?OHd0L1FkTncwQmJVL0UvZ1ZGeW1zM0U0V2xha1pqaC91ckhVR2JlVlpIKzVX?=
 =?utf-8?B?d1FLVkJMeXVCUWhmUjkyVmQ1eURsQTlUK1N4RUxXcE9XTnJWOW9hYkZxbm03?=
 =?utf-8?B?by90d1BpTG1HQ25VVkRYczFDeFJzQ2lzWEtla3gzRGZWL0ZoamM3Y3VGWnRw?=
 =?utf-8?B?d3gvWUxkb0pTN2tnZkpKVWVna2MrVDBuclkwTlZZcGFrMDRNUWRlclFFV1hF?=
 =?utf-8?B?czExVEF4dVdvWWJNMnJnUStWbFhsRk5ucTI5OCs0QXYzSTB3K2hOQXdGYktM?=
 =?utf-8?B?T3hBR3RZbVFGbDBuQTNsSHhKb0dJRWFCQjJtcElSOHNRaXdkNjBLdHFZQXRu?=
 =?utf-8?B?UHh1UkIrcTliZmxFKzJOa1BESStRMmxBZ3N0TGNjZjNqWHZBUENOOW1EY21I?=
 =?utf-8?B?Skd5bTkrUitjWU9JSUlwcExMYUtKaHFsL210NUo5aENYMGlQREljbC9HVzQx?=
 =?utf-8?Q?AltclqMn/XTmFCnS9sQj9mq8LPsgb4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0427EA729B0DA64CBC9BA34EC3CB22AD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 41eedc56-9c1f-47b5-95e6-08da0b1890c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 08:55:36.1135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 68bys1bPgtU8ndeXJTgL1P0WcXMaEZtOoXy8sK58l0dGDMr/H4UN7brS1TmIoiKJDsC+rKnvL5IG2QJC90nBMKH/cjwTVqkirymJ43RrVF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3777
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAzLzIwMjIgw6AgMDk6MzMsIEZpbm4gVGhhaW4gYSDDqWNyaXTCoDoNCj4gT24g
TW9uLCAyMSBNYXIgMjAyMiwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4gDQo+PiBMZSAxOS8w
My8yMDIyIMOgIDA4OjIwLCBGaW5uIFRoYWluIGEgw6ljcml0wqA6DQo+Pj4gZHJpdmVycy9tYWNp
bnRvc2gvdmlhLXBtdS5jOjg5NzoxMjogd2FybmluZzogJ3BtdV9iYXR0ZXJ5X3Byb2Nfc2hvdycg
ZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWZ1bmN0aW9uXQ0KPj4+ICAgIHN0YXRpYyBp
bnQgcG11X2JhdHRlcnlfcHJvY19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqdikNCj4+
PiAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPj4+IGRyaXZlcnMvbWFjaW50
b3NoL3ZpYS1wbXUuYzo4NzE6MTI6IHdhcm5pbmc6ICdwbXVfaXJxc3RhdHNfcHJvY19zaG93JyBk
ZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dDQo+Pj4gICAgc3RhdGljIGlu
dCBwbXVfaXJxc3RhdHNfcHJvY19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqdikNCj4+
PiAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+PiBkcml2ZXJzL21hY2lu
dG9zaC92aWEtcG11LmM6ODYwOjEyOiB3YXJuaW5nOiAncG11X2luZm9fcHJvY19zaG93JyBkZWZp
bmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dDQo+Pj4gICAgc3RhdGljIGludCBw
bXVfaW5mb19wcm9jX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICp2KQ0KPj4+ICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+DQo+Pj4NCj4+PiBSZWFycmFuZ2Ugc29tZSBjb2Rl
IGFuZCBhZGQgc29tZSAjaWZkZWZzIHRvIGF2b2lkIHVudXNlZCBjb2RlIHdhcm5pbmdzDQo+Pj4g
d2hlbiBDT05GSUdfUFJPQ19GUyBpcyBkaXNhYmxlZC4NCj4+DQo+PiBXaHkgbm90IGp1c3QgcHV0
IHRob3NlIHRocmVlIGZ1bmN0aW9ucyBpbnNpZGUgYW4gI2lmZGVmIENPTkZJR19QUk9DX0ZTID8N
Cj4+DQo+IA0KPiBZb3UnZCBnZXQgYSB3YXJuaW5nIGFib3V0IHRoZSBwcm90b3R5cGVzICgiZGVj
bGFyZWQgc3RhdGljIGJ1dCBuZXZlcg0KPiBkZWZpbmVkIikuIFJhdGhlciB0aGFuIGFkZCBhbiBp
ZmRlZiBhcm91bmQgdGhlIHByb3RvdHlwZXMgYXMgd2VsbCwgSSBqdXN0DQo+IHJlb3JkZXJlZCB0
aGluZ3MgYSBsaXR0bGUuDQoNClRoZW4gbm93IHlvdSBoYXZlIGNhbGxlcnMgb2YgcHJvY19jcmVh
dGVfc2luZ2xlX2RhdGEoKSBpbnNpZGUgdGhlIGlmZGVmcyANCmFuZCB0aGVuIHlvdSBoYXZlIGFu
IGFkZGl0aW9uYWwgI2lmZGVmIGluIHRoZSBtaWRkbGUgb2YgDQp2aWFfcG11X2Rldl9pbml0KCkg
YW5kIGFsc28gaGF2ZSB0byBpZmRlZiBvdXQgYWxsIHByb2NfcG11X3h4eHguDQoNCkkgdGhpbmcg
aWZkZWZpbmcgb3V0IHRoZSBwcm90b3R5cGVzIHdvdWxkIGJlIGxlc3MgY2h1cm4uDQoNCkNocmlz
dG9waGU=
