Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9FB51E505
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 09:04:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJN54MQ3z3dP1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 17:04:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwJMY5SGRz2xrf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 17:04:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPOWMcMkG8JrF8MQVY5FSZrzLxassw/TxF2hmp1W7Ce280y0H1mS205KRx5WOyH8aldAPgm9iKqQvaYby0IsUvsMHl4qofn6X9eUPbA9cW6ow0x16JLUvJD6ZoqJoWEUlX6PTUoMvZZtWfglR5mjFU1SP4hzxoaQZ9Sx3HBsAiGD4pxPMdLFTaybWPfsjoA6CY4WalqEgxREpl4m65xnj9SlZQBQtWlhFIPTjim6SrtlMq0rbVs+b5zl/3WZYijdSMyRZ7MZy8ztTr/w+t5qDkubvC299/fQjZ3PRL33IP77TbZ1ToPU3CWEeBCwtmurtTpkp3ZN92SKpcn/NFFKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXnP1/ETO8g0GxLQo8XdjXcXs1mO0mtEUaL/hRgrW6o=;
 b=MsexGEHglTkWyiPvQGKJnrTXiWUG5qar5vYmx1pan3cc3PmkWIJB6vOxMOMWFSYIBhjUN9GLLKrtNb2olDve4uZ2CIHvem8xoNGHylfdlx1Oo+U2dOv28AVs1RzMIR8/RYJY9bsprI9ek9uH+jupTZOyxtanhbydjoq71VGpEITQnh8XfEi+SptVRItRwUhgWDhxFnd6WiSkusKSUSmwwmU5bK0PzXv606ckkQlaYYq+Z3WnyeCEgQ48RDMplO4tdQCHmikawreWWFNyE9j0LQCDymgr86ErN+g66J77o8xoB21iy/Ew3gbYtCQ0S4HXwPqFpsWFIcgODLi4vDRDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3987.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Sat, 7 May
 2022 07:04:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%6]) with mapi id 15.20.5227.020; Sat, 7 May 2022
 07:04:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, CGEL <cgel.zte@gmail.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 Sandipan Das <sandipan@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH linux-next] power:pkeys: fix bugon.cocci warnings
Thread-Topic: [PATCH linux-next] power:pkeys: fix bugon.cocci warnings
Thread-Index: AQHYXif9MxWpTtwTTUuXd7LmitXkI60TBPAA
Date: Sat, 7 May 2022 07:04:01 +0000
Message-ID: <e2310273-8bc8-deac-9a80-0d1587acecb1@csgroup.eu>
References: <20210825064228.70487-1-deng.changcheng@zte.com.cn>
 <8735hsvzig.fsf@mpe.ellerman.id.au>
In-Reply-To: <8735hsvzig.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b82c2d5-dadd-4ab2-e7fe-08da2ff7c3ea
x-ms-traffictypediagnostic: MR1P264MB3987:EE_
x-microsoft-antispam-prvs: <MR1P264MB39874B7FAF6D77B5F62D232EEDC49@MR1P264MB3987.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pjBAI+SOHlGzoWhd5uTtrh1NpYKLhYys9dhzbeZ/1c2sDnkAE913MI4QEeVQQw2UY1SDOkG38wnmEYjzDt01svLHmUJw0XXXUnzQX8AQUnr8QiawsKKZwM5I66qyWuJK3jkkDtItTsgDrD6+Loom7iCV+NJsJ4dwS28OHytcOPU6n9q2iiK8MLUhbihDkef+fr8pg7l9OGUZGRWUIFmwjOGiWQwBrJMN0BBdKV+4UfMc+4/SCb58FO1NIbTJdFLwmq6TDZk6IbZiz0VRTtPsoizbalFtKNp9O1tiJzYBn8Wxe6rsyN6p7WQ98zzDnhaDtJm3Cqjed+4SXHsaWrAaGVik+fzg9urU/j3Sjcr/mq6e7WO9GMns307ZQHlXHkstJM/zrbYkq7ezA52m4+HsEx0IlO7uBjSa9wHOwKXlqBzuKdAp4BL69NSSnBE33q+IB3DZ4gjgyN1jnioOZPI91xJS/mrf3orvVkhpkT/2BosUd5o/UDG3B9YQohSCCXSEzzrjJsSThbRYgRnxQ0AJiv/c2uvYT0UGIJo6XtDE7uDccqCnY1j+6N7uJ3tIa3rvk97BfISgtMDjlE6y/mYS7ZE/+TROALIyH0UpJ6vZCvkuuKCaUbEGKRqs6gjtFS+1+/s5ORgOspJC51fqKawxn5bADGTGK7KOpRfpTVXU3Qe0uxUyIvvmKdrxHayj/JRByrBtnxT/pRKWyjdfme7Eq9IJdiC5W34O5sal7e1WppkU60SCHctuBnUVW7KfFMOm3CANhKX4psTBj+itUZKf3XZTCVXA9rdc++WinHMxwdmWmOpceMwtXs58hGVIK0Kc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66946007)(8676002)(316002)(6506007)(64756008)(66446008)(66556008)(4326008)(44832011)(31686004)(91956017)(76116006)(83380400001)(36756003)(54906003)(110136005)(71200400001)(66574015)(26005)(8936002)(86362001)(5660300002)(31696002)(2906002)(6512007)(38070700005)(2616005)(508600001)(186003)(122000001)(38100700002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXZNSjZSRWgrNG5zUDRHTlVRZlhXaDJsY1VaclA5Q2JabHF3dEQyVVFXV0JN?=
 =?utf-8?B?Ri9HM1M4WXFMRTlCaGZXbjFWN3c3cW5ZZVFKaW15ZjdjN05EbHFXY1hxTE5n?=
 =?utf-8?B?WnVwcEs2Wi9zVTBqbFlhZlVmbldiWExYVFVRN21QQ1V6dnd6ZVhmd1M3dFBO?=
 =?utf-8?B?QVlsTlRwZGlwUE9KQmp4QkNYenpjSW55RVh4VStsSGp6Qm4wcDV6aU1SbDJ3?=
 =?utf-8?B?TjZCSTgyMCtva3plN2hONUwyNUxIRTNvL05ROTJhV2NBRHRGM1Y2eHAwaEJw?=
 =?utf-8?B?S1o3VUdHb2gvREhsN1FmVk5sTGRjQis5d2JoWTZlbURVUmJhKzdBbjlzazJ3?=
 =?utf-8?B?d1hMdnhZR2cxMnJqR21MTVUzcVFsK3BQalVkRWR0di8yRHdPVEdRMkFhcXFH?=
 =?utf-8?B?WTErWGNiZTFVcERjVEdXak9VL1M0RFJVbVQxcTdmTC9ISmxJRU84RTJIY1Yx?=
 =?utf-8?B?cVBoWklRMWkzT29XRVF5dm4rOFdsektkZXNxcXZaZWJhVndSZDk2Y0ZOMDZD?=
 =?utf-8?B?b0hrUG1oUGVPdzg5ZGRtVitqWERtakJZcVdYa3A1RCt2WG9HdnlKL1NrL2Iy?=
 =?utf-8?B?NDZ2Y25RNHZRdTVveU5aMUJiZkxZNURWbFhtYVFqV3JKTlluUGh5MkdKeDRt?=
 =?utf-8?B?V2ZTb0lOT3lncWtrSWlZS2ExMEhEQm5nUVR6VGVUV1JEQ0xjS1NHaDFDRXBU?=
 =?utf-8?B?b0NhUXhZUXFUdlh0WXl4WDhHYTZKSzgxYUwzNDJLZndzSWhUUnlDQnlBRjZk?=
 =?utf-8?B?THRQLzU4dk1hcDNOQjRQTnM2cEhsK0hFN2ZVNW9LT1BOYlgrNWtYand0Tita?=
 =?utf-8?B?NUYvdjVvNUZLMFRDR1NQRkd5S21HeGwrMWVvdk9CRlJaaFhjMGovMFVrbG5m?=
 =?utf-8?B?SHFQNjA5YVNpVG1vODBISUZSU0tobHFzTU96dHZIM2RnZ3lnNjlmaGhzQzVZ?=
 =?utf-8?B?dTRub0c5WkoxL2FpL3kyR25qZ1FHV245Q1AxYzI3TWRtRFBFaEJOM1RMak1o?=
 =?utf-8?B?eGxhTysxNFQzMGMwV1pLZmJ2a2dNU0NWZVNhTXNLZUpzc2huWlVZdDZLaENC?=
 =?utf-8?B?ckdodTd2Y3d3cFl4b3RGM0ZqcXorYVA0dm5LR2RZd1l2SDF0eU5pUWZoU2xn?=
 =?utf-8?B?N0hWVG8ycitVZ0RZRU5NQ0UxUU90WGU4V3EwQ1I1OGptbHNqRGIvL0pEOTVI?=
 =?utf-8?B?ZTdlZi9BdzFaQ2p5UFRjK21oNVBGSC8xZER6a2JubWF1UHhYUU5EdzJjV3pS?=
 =?utf-8?B?YXJFN0JrN2pGODFpcUdjT3JXbWR6a1YyQy9aVEpzZTRwQjJDV0xUVUJ6MTJH?=
 =?utf-8?B?Z1pkRXFBK3p6K3FrUS9vN3ZFWkZmdTBPdkoya01nQmpndmZPb1BpamlpTCtk?=
 =?utf-8?B?NERENFM0YVBVMStkbmNibEpoNEFUOTVLM0kvVXVUK2tHZkd2MUQ1WVNTNVlX?=
 =?utf-8?B?QVBQa2FjQVZieThqNWkxcmphbmwxTW5YZk8yZm1TR3VQVkRsVUFQQUZvUlR2?=
 =?utf-8?B?YWFmOTRUUGlWWFl1b090QWxreEc3RDhiNWJiTmhlQm1SVnp4Vk1vVTRjN1ds?=
 =?utf-8?B?M0FrVXhMdDlqQVVkeVRtTHVRRFk5TEdBMithVCtXaTJDQXBWVXpUZ1V6Vmdm?=
 =?utf-8?B?QjZRSFpiaDd6RXlBN2R6SnhaeXc0UFMzSzZNUkk2ZXAvdHNsMkxLaUpJVW1z?=
 =?utf-8?B?VFREa3puOGVTSGJwejJKYzc0SklkbElJRUdGRC8yV3Y1QlhpQ2Jlb3VQSDJT?=
 =?utf-8?B?NEIrTkVna1pFd3dYUkh1RndRNEtFbTVWdDJXZ2U3Qk55alY4RU14dzVuMGRH?=
 =?utf-8?B?eXBrSkxKTVVUeDRiR0ZUN1F1TW0vS280bFJ4MVNrdkkxTjEyU3JWcmJJRXM2?=
 =?utf-8?B?akUvL0I4RUowSDF6WjZEVXpWMFI2WGhMZHNXYWFncGpzQnBjMyt6LytyY0la?=
 =?utf-8?B?Yi9BbVBVTTFIZExnUFRoSzZJY1BIS0NLZ1FTYS9aS3BDM3YrT2xIdDdncDRl?=
 =?utf-8?B?MGxjMmFPMjNVL3JIYzJwOUluSTBzQmtIQXQ3UXcxNnhUdThmYXBLWjZ1aW5P?=
 =?utf-8?B?Y1NuVVhhN3NZMjVGdzc4VDZIWkpOcUlDSkZydDB6NzZEeUpaR0ZUVHZScys3?=
 =?utf-8?B?ZkdIcEp2MlA5U2hwOEVGWFpZYUova1VXYmxZNURGanNiemdGazQyU3IvdENV?=
 =?utf-8?B?Y3l6OW5MRW1hN2d6cWVlMEhmYzhPdk83dktMb0swMS9lUjdBSVpJY0k5bWw0?=
 =?utf-8?B?Q3BKaWVZWUZsNnpWZ1ZOTXVKQTFnSkJmYlRXRXlNRG5MaWZvTnBLazEwWmJk?=
 =?utf-8?B?Z2lzYy95c0M3OFRyZGlGcUFzV2tBeExMUEJWakNUWHRzUWhORkRvR2c3cWNN?=
 =?utf-8?Q?8yLh3t8zvhq5Hl5n62OKvZjKYTzuHtFE1kRZO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2422AF923F168A41861950611487BDB3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b82c2d5-dadd-4ab2-e7fe-08da2ff7c3ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2022 07:04:01.6569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 070aGF7ZIOFM9wtOXx1Mgnw8granqrDJxWc42+vurs0xuP2OYlumvoigrQ7GHoSZBERo4G/YkC8hEySqCkK3mEkAfH3h61Hqsr5emAWHglA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3987
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
Cc: Zeal Robot <zealci@zte.com.cn>, Jing Yangyang <jing.yangyang@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzA1LzIwMjIgw6AgMTU6MjQsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ0dFTCA8Y2dlbC56dGVAZ21haWwuY29tPiB3cml0ZXM6DQo+PiBGcm9tOiBKaW5nIFlhbmd5
YW5nIDxqaW5nLnlhbmd5YW5nQHp0ZS5jb20uY24+DQo+Pg0KPj4gVXNlIEJVR19PTiBpbnN0ZWFk
IG9mIGEgaWYgY29uZGl0aW9uIGZvbGxvd2VkIGJ5IEJVRy4NCj4+DQo+PiAuL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGtleXMuaDoyMToyLTU6V0FSTklORw0KPj4gVXNlIEJV
R19PTiBpbnN0ZWFkIG9mIGlmIGNvbmRpdGlvbiBmb2xsb3dlZCBieSBCVUcuDQo+PiAuL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGtleXMuaDoxNDoyLTU6V0FSTklORw0KPj4g
VXNlIEJVR19PTiBpbnN0ZWFkIG9mIGlmIGNvbmRpdGlvbiBmb2xsb3dlZCBieSBCVUcuDQo+Pg0K
Pj4gR2VuZXJhdGVkIGJ5OiBzY3JpcHRzL2NvY2NpbmVsbGUvbWlzYy9idWdvbi5jb2NjaQ0KPj4N
Cj4+IFJlcG9ydGVkLWJ5OiBaZWFsIFJvYm90IDx6ZWFsY2lAenRlLmNvbS5jbj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEppbmcgWWFuZ3lhbmcgPGppbmcueWFuZ3lhbmdAenRlLmNvbS5jbj4NCj4+IC0t
LQ0KPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BrZXlzLmggfCA2ICsr
LS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0
L3BrZXlzLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BrZXlzLmgNCj4+
IGluZGV4IDViMTc4MTMuLjVmNzRmMGMgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vYm9vazNzLzY0L3BrZXlzLmgNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ib29rM3MvNjQvcGtleXMuaA0KPj4gQEAgLTEwLDE1ICsxMCwxMyBAQCBzdGF0aWMgaW5s
aW5lIHU2NCB2bWZsYWdfdG9fcHRlX3BrZXlfYml0cyh1NjQgdm1fZmxhZ3MpDQo+PiAgIAlpZiAo
IW1tdV9oYXNfZmVhdHVyZShNTVVfRlRSX1BLRVkpKQ0KPj4gICAJCXJldHVybiAweDBVTDsNCj4+
ICAgDQo+PiAtCWlmIChyYWRpeF9lbmFibGVkKCkpDQo+PiAtCQlCVUcoKTsNCj4+ICsJQlVHX09O
KHJhZGl4X2VuYWJsZWQoKSk7DQo+PiAgIAlyZXR1cm4gaGFzaF9fdm1mbGFnX3RvX3B0ZV9wa2V5
X2JpdHModm1fZmxhZ3MpOw0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0aWMgaW5saW5lIHUxNiBw
dGVfdG9fcGtleV9iaXRzKHU2NCBwdGVmbGFncykNCj4+ICAgew0KPj4gLQlpZiAocmFkaXhfZW5h
YmxlZCgpKQ0KPj4gLQkJQlVHKCk7DQo+PiArCUJVR19PTihyYWRpeF9lbmFibGVkKCkpOw0KPj4g
ICAJcmV0dXJuIGhhc2hfX3B0ZV90b19wa2V5X2JpdHMocHRlZmxhZ3MpOw0KPj4gICB9DQo+IA0K
PiBIYXZlIHlvdSBjaGVja2VkIGhvdyB0aGlzIGNoYW5nZXMgdGhlIGdlbmVyYXRlZCBjb2RlPw0K
PiANCj4gcmFkaXhfZW5hYmxlZCgpIGlzIGEganVtcCBsYWJlbCwgdmlhIG1tdV9mZWF0dXJlKCku
DQo+IA0KPiBQb3NzaWJseSB0aGUgY29tcGlsZXIganVzdCB3b3JrcyBpdCBhbGwgb3V0IGFuZCBn
ZW5lcmF0ZXMgdGhlIHNhbWUgY29kZSwNCj4gYnV0IEknZCB3YW50IHNvbWUgZXZpZGVuY2Ugb2Yg
dGhhdCBiZWZvcmUgbWVyZ2luZyB0aGlzLg0KDQpTZWVtcyBsaWtlIHRoZSBjb21waWxlciBpcyBu
b3QgdGhhdCBnb29kLCB0aGUgZ2VuZXJhdGVkIGNvZGUgZm9yIHRlc3QxKCkgDQppcyBtdWNoIGJl
dHRlciB0aGFuIHRoZSBvbmUgZm9yIHRlc3QyKCksIHNlZSBiZWxvdy4NCg0Kdm9pZCB0ZXN0MSh2
b2lkKQ0Kew0KCWlmIChyYWRpeF9lbmFibGVkKCkpDQoJCUJVRygpOw0KfQ0KDQp2b2lkIHRlc3Qy
KHZvaWQpDQp7DQoJQlVHX09OKHJhZGl4X2VuYWJsZWQoKSk7DQp9DQoNCjAwMDAwMDAwMDAwMDA5
MDAgPC50ZXN0MT46DQogIDkwMDoJNjAgMDAgMDAgMDAgCW5vcA0KICA5MDQ6CTBmIGUwIDAwIDAw
IAl0d3VpICAgIHIwLDANCiAgOTA4Ogk2MCAwMCAwMCAwMCAJbm9wDQogIDkwYzoJNjAgMDAgMDAg
MDAgCW5vcA0KICA5MTA6CTRlIDgwIDAwIDIwIAlibHINCiAgOTE0Ogk2MCAwMCAwMCAwMCAJbm9w
DQogIDkxODoJNjAgMDAgMDAgMDAgCW5vcA0KICA5MWM6CTYwIDAwIDAwIDAwIAlub3ANCg0KMDAw
MDAwMDAwMDAwMDkyMCA8LnRlc3QyPjoNCiAgOTIwOgk2MCAwMCAwMCAwMCAJbm9wDQogIDkyNDoJ
MzkgMjAgMDAgMDEgCWxpICAgICAgcjksMQ0KICA5Mjg6CTBiIDA5IDAwIDAwIAl0ZG5laSAgIHI5
LDANCiAgOTJjOgk0ZSA4MCAwMCAyMCAJYmxyDQogIDkzMDoJMzkgMjAgMDAgMDAgCWxpICAgICAg
cjksMA0KICA5MzQ6CTBiIDA5IDAwIDAwIAl0ZG5laSAgIHI5LDANCiAgOTM4Ogk0ZSA4MCAwMCAy
MCAJYmxyDQoNCg0KV2Ugc2hvdWxkIGtlZXAgdGhpbmdzIGFzIHRoZXkgYXJlIGFuZCBjaGFuZ2Ug
dGhlIGNvY2NpbmVsbGUgc2NyaXB0Lg0KDQpDaHJpc3RvcGhlDQo=
