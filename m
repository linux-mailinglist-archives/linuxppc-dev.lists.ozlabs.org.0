Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB2A3A4727
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 18:57:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1n7y4RsWz3c0h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 02:57:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=pfq6Zwlf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=579658a80c=clm@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=pfq6Zwlf; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1n7L01d2z3bwC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun 2021 02:56:44 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.43/8.16.0.43) with SMTP id 15BGliZA001743;
 Fri, 11 Jun 2021 09:56:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=kkrHewb9AjX4WCwsG6viMUjh2jA3sq7bDTycJFkaocs=;
 b=pfq6Zwlf3Sz2hHY14kk02ZPoyFbEjU9ZfVHKBni+Fv8NsW0BcqxyIOyJLzI6YGeyC3Fk
 1KVNqt9QospJaZOlYW/JjEbHvkWCdEd6jiTKRrjqjZ58XwuVXj5VrbJibD54A2qPViD0
 9cBvpOgXUN+cWNKzDLuqHhEAEswJxNr2dwY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 393skjp0nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Jun 2021 09:56:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 09:56:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjGQ5y01ORhVUiShY6qoMIUP9uydsvmoikYiMWJkffdbzfj32WyZX5IvpxSCQkuRJly6vVL2kSSmNJdyJuekanZscWFEAgOqVUWqdvx+QOuFH6nzXVIeW7uW97Q7mWCY6zaQhVVqX12itAeqt9ZcXC4fDe0QbK5RjTrT88a9sOOD3xXsKp4KXwAwAR6vlayO4QsefyxA3lkvql7z6ORVMBVvuxS+nllqhPwLPd6ivR5LWDjonVj6T859Neq8rPmAMImTSlE5/Jfl0UbEbaoTSJxqnpEUElx+V6Q+T8tSwh0+we3+pwNN0BVSn8QLyM52EtdAFpZHQCfmIEaV/gVKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkrHewb9AjX4WCwsG6viMUjh2jA3sq7bDTycJFkaocs=;
 b=iQ3KOFczjx8bsMObhAsSa+GnYGKtcRsBglG59zIDUNauXHVxjvIndSEub9RIPzf0S3U9CZHhyuffDU4sh7vgamkIznBnt2NrzxX0arzZuMaTaJ2F0sRUU67WaZ6VNH+G8IWQUCv7C63WX3qVWnvIM7apopBhsopAuZCPbWgEs+3+yWzrzJhwa2S4MJzvC8mj3gkM2mf0Mg+J2lgfNJYXnY02kPmW2fP8ubJZ4uB4p7fzwIx33ingNbiOOmQlZsFYdNZT4myRByPubjVXUMv7b7+ESgl0Q9nlirp4gn4o+MUGoPx02RUVcY5bs0zJlKiYxuC0FdyWeO58nSLG5eviOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from CO1PR15MB4924.namprd15.prod.outlook.com (2603:10b6:303:e3::16)
 by MW3PR15MB3914.namprd15.prod.outlook.com (2603:10b6:303:41::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 16:56:31 +0000
Received: from CO1PR15MB4924.namprd15.prod.outlook.com
 ([fe80::2d50:36f7:4bce:9b01]) by CO1PR15MB4924.namprd15.prod.outlook.com
 ([fe80::2d50:36f7:4bce:9b01%6]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 16:56:31 +0000
From: Chris Mason <clm@fb.com>
To: "dsterba@suse.cz" <dsterba@suse.cz>
Subject: Re: [PATCH] btrfs: Disable BTRFS on platforms having 256K pages
Thread-Topic: [PATCH] btrfs: Disable BTRFS on platforms having 256K pages
Thread-Index: AQHXXgAh7cM+p+g0g0iDshoLzzyYuqsNU9CAgAAZUgCAAVnygIAABkMAgAA8GwA=
Date: Fri, 11 Jun 2021 16:56:31 +0000
Message-ID: <94F797B5-8936-44DF-ABA5-808C1F3F559F@fb.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <185278AF-1D87-432D-87E9-C86B3223113E@fb.com>
 <cdadf66e-0a6e-4efe-0326-7236c43b2735@csgroup.eu>
 <20210610162046.GB28158@suse.cz>
 <6769ED4C-15A8-4CFF-BF2B-26A5328257A0@fb.com>
 <20210611132121.GF28158@twin.jikos.cz>
In-Reply-To: <20210611132121.GF28158@twin.jikos.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c091:480::1:ee07]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1973c45e-499c-4a9d-573c-08d92cf9dd1c
x-ms-traffictypediagnostic: MW3PR15MB3914:
x-microsoft-antispam-prvs: <MW3PR15MB391413CFA226B4D6C5131CE9D3349@MW3PR15MB3914.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XPg7wJjw0ydrPpOeEP5mMnxPtqSiV04NnAJhOEBVDHshG3vv2AlwLnoE5BwUTZNxJJND03RUu+R/5i/4rTX8jLgNM1WAAxR/XDXLpxwMWA/PL9aXL4JbJid/Uf/WZ5/86sdiOatjlJLDMgEJ/gGWnbcTDKoBE1oXX0tBgW2MQQFaKiGONcYDnwuKV0wLB/T9CTwn6LJvBtbZXOqrMTyPZxF2gR6nPwDI9Jlp5e0lmAYvdnKPBRf8/5JuBSjBVK2JGVgen14gVKce49nF9kQEgoOFhdjfXfiXlWKLZ2jz7nOBnokkEAHIcM9gYZcrzLo+iPIAA/skzNYGQ2AWJZYpDQ8tXf2AJeMi6w2vIFghjT573AwcRhJD6BMFvROKSRI/sAC1MN6Rwhqp9K56A3qb5sWhYhRuh2ZrAs7gQlco+aG6WZyXOYydgbcC4qB0cebUuJA4Lm5D7y8c74z/WjB+F2GAR5eFqjnFY5EipwA5tkG0x4y6AnmivLHha6yD1N7h2gF9Y7RxSnW9Ad/33evOge1/hkdHk9axNOxDT2v29sgipnn+dJHCOwXnAiN7mJJY9qJR1+wqreLUMLm6yAn/LzgiMAyAiNPdwMQtu0xUzyFw97bR4VO+zODgCX/OUTV8t4gRgOI1P4rA4TQjREPu/hgQPVXFvmuf4WquFIrFUeM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR15MB4924.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(6506007)(66556008)(33656002)(64756008)(83380400001)(2906002)(2616005)(6486002)(186003)(54906003)(316002)(66946007)(478600001)(66446008)(91956017)(66476007)(76116006)(6916009)(4326008)(53546011)(71200400001)(66574015)(122000001)(6512007)(5660300002)(86362001)(8936002)(8676002)(38100700002)(36756003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjlNaGF6ekpZaFNlSUI3ejREeThoWkZ4cG14ZE5yVHd6WTVyMlY1VHl0V0NF?=
 =?utf-8?B?cVZqc0gxRktUT3IyQUJueXI2ODhGMzZjMUVNUEdhNzBMWGNIM21xVWI4c25L?=
 =?utf-8?B?cURQV3JFVTVhKzY1YTJ1UGdwdDZvQnlHajV2enh4THR3WHI3aUoyWG90VVFi?=
 =?utf-8?B?d3dnWXEwM3pZU2pEcHZTZUN2NURkVmN0TmtLQTdrenRnSStoMW95TmErYzAw?=
 =?utf-8?B?N3pTTEVmWkJ3c3ZlRm1pUEg3Z251VUJKa2trcVRiTU1SL3NIKzM2N3ROS2ky?=
 =?utf-8?B?b2RCRmlkWm5OREdCNEhwRmdvZldZT2dyRURESGJqV3lKRU5MNUhSZTJ6c3ph?=
 =?utf-8?B?RS9XdUt5ckpJRnArY0lZN0dPcmdPNnpqamVMZzdqcXA5cmJYMkt3QjUwZnUy?=
 =?utf-8?B?R285NVlnTVVvYWhMWHRpUWw4QitjZnJXcE02bEVBcktkOXJXV1k2NGtRYlBG?=
 =?utf-8?B?ZHZWcktnZzFLRHNzaDRMcUFmSEhzTE5XaS9TSkJxeDloMU5KNmxyQTNmNXJv?=
 =?utf-8?B?RFI2cmFFc1ZUUDJFYVJpUVZNWXhxeVI1eXNBc05qNTNzWTlDOGFYWXMrQjZ3?=
 =?utf-8?B?R1g3U2JMUHVaeDBwUGMwTEJFUWZrUDVyUXJrc3pMZzFhU05pWkZBOG55Q0lJ?=
 =?utf-8?B?SHVIb0huOEpFS3ZCUUR5S3NSaGdjZ2IzTUtZL3Q0cU5DRUhQRUpnQUVIbS9w?=
 =?utf-8?B?eUk4VjdIcGc1TG9rbi9wQSsrNUlYUTRwVlBoY1BpdmxXMkY0Nkl1d0RYRjdp?=
 =?utf-8?B?N1dxUFNKYzl2MzY0R3dWNnJhanE1OVhodnpMTjZENnEwRmljRHNmL00rNWxt?=
 =?utf-8?B?dTUvQktDTXMxNDZ6MW9EUGlMT092ZGZjb0VJY3IxNjRzaG52UGo3RzUzSTB5?=
 =?utf-8?B?eVA3bWhLdmlLajFMbFlXMmJpM25VaGh0cjYwN1NJV3EwaExzUjBFY1VTeUFj?=
 =?utf-8?B?eThwYlV2SW52V3VFd3VSa0Yra0RySlQ4TzUyeERBcmIvUmhRcVZNUmZSZGR5?=
 =?utf-8?B?a21YRGZZMkNaTUxNa29SNTM3V3FRZUdEVmtRTm5ENVUzNlNsQndCNk5BNkd5?=
 =?utf-8?B?bVlOamVtWWtVYTFhR2JqK3h1T0ZTSWlUNE1mcm1LblpkRk85OHh5Y1UxVm94?=
 =?utf-8?B?MDluVXJJcU56RDA0MEx0a292eVdOeDZmQlFKR0VlSWFZNDRaOTg4d09nZ0xZ?=
 =?utf-8?B?THVwSmd5RWlYYTFLbjdDRm41QXB3M2hnMzNUbTVyUUJCcFJ0bllZV09MN3dW?=
 =?utf-8?B?aG5PYzVoK1lqaHlVb251ODFsYVNJLzZPRGlneVdQeG1TbkhYNU9IYys2V3JP?=
 =?utf-8?B?b0dMZ285cWRKam1uM2ZkeEtYc1N2TjJFeTI3MHRiUytqMi8zSURhVS9uYkFU?=
 =?utf-8?B?cXhFRTJIVEUrWDBwakxiYWhrL0MwLzdzYkVubllOeFpZbU8ySXlmYWJpUUo3?=
 =?utf-8?B?WnJsdmx0UmtxVjc0NjVmU3h6aWNIalN0T3BGbUEwdlNwTGFmMmdmemZoTnp2?=
 =?utf-8?B?NFNXckU0S3doRnJqWUtJUzR4bTdlNzB1dytaYXB5ZGhkRE52Q3FTM0hyMzM1?=
 =?utf-8?B?c3JDWUtKbzF3cDAzMWJ2UVVwWHh0dG54OFBVaE1aVFVMUmJHdTE2UXhPYjNy?=
 =?utf-8?B?aFVKUDVKSTVrN20yUjltMFduSzhvWFBqV3NtSFRxUFFENDM0Nkgxd3FXK2pI?=
 =?utf-8?B?dnJ3bUlJRVQyWVVncnZTNFBWU0NPTGZ2WEl4bUhHOG1qUytqVXIyRi8yZTV5?=
 =?utf-8?B?OWFOTmtOY0RKMzdUbkUrcm9xQ3R2OUZhb0lFa0RjM2hUUW9qeWlybzhSK0tx?=
 =?utf-8?Q?YC+1D0JoYf0FiB7gclDp1DYctBmxzkoHj30ew=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <649F282159EC374A915FA51DB49FDE31@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR15MB4924.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1973c45e-499c-4a9d-573c-08d92cf9dd1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 16:56:31.6203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYfe1zFVT0LZpgre8lx3ScknVWmStvSnBp6cyaicSqR8U+slJNeJowmlYIm/GFz5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3914
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: qLKrvzctQr4MrnuImKEDF4_kokqXuIPx
X-Proofpoint-ORIG-GUID: qLKrvzctQr4MrnuImKEDF4_kokqXuIPx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_05:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0 mlxscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106110106
X-FB-Internal: deliver
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
Cc: "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Josef Bacik <josef@toxicpanda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Sterba <dsterba@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQo+IE9uIEp1biAxMSwgMjAyMSwgYXQgOToyMSBBTSwgRGF2aWQgU3RlcmJhIDxkc3RlcmJhQHN1
c2UuY3o+IHdyb3RlOg0KPiANCj4gT24gRnJpLCBKdW4gMTEsIDIwMjEgYXQgMTI6NTg6NThQTSAr
MDAwMCwgQ2hyaXMgTWFzb24gd3JvdGU6DQo+Pj4gT24gSnVuIDEwLCAyMDIxLCBhdCAxMjoyMCBQ
TSwgRGF2aWQgU3RlcmJhIDxkc3RlcmJhQHN1c2UuY3o+IHdyb3RlOg0KPj4+IE9uIFRodSwgSnVu
IDEwLCAyMDIxIGF0IDA0OjUwOjA5UE0gKzAyMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+
Pj4+IExlIDEwLzA2LzIwMjEgw6AgMTU6NTQsIENocmlzIE1hc29uIGEgw6ljcml0IDoNCj4+Pj4+
PiBPbiBKdW4gMTAsIDIwMjEsIGF0IDE6MjMgQU0sIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+Pj4gQW5kIHRoZXJlJ3Mgbm8gc3VjaCB0aGlu
ZyBsaWtlICJqdXN0IGJ1bXAgQlRSRlNfTUFYX0NPTVBSRVNTRUQgdG8gMjU2SyIuDQo+Pj4gVGhl
IGNvbnN0YW50IGlzIHBhcnQgb2Ygb24tZGlzayBmb3JtYXQgZm9yIGx6byBhbmQgb3RoZXJ3aXNl
IGNoYW5naW5nIGl0DQo+Pj4gd291bGQgaW1wYWN0IHBlcmZvcm1hbmNlIHNvIHRoaXMgd291bGQg
bmVlZCBwcm9wZXIgZXZhbHVhdGlvbi4NCj4+IA0KPj4gU29ycnksIGhvdyBpcyBpdCBiYWtlZCBp
bnRvIExaTz8gIEl0IGRlZmluaXRlbHkgd2lsbCBoYXZlIHBlcmZvcm1hbmNlIGltcGxpY2F0aW9u
cywgSSBhZ3JlZSB0aGVyZS4NCj4gDQo+IGx6b19kZWNvbXByZXNzX2JpbzoNCj4gDQo+IDMwOSAg
ICAgICAgIC8qDQo+IDMxMCAgICAgICAgICAqIENvbXByZXNzZWQgZGF0YSBoZWFkZXIgY2hlY2su
DQo+IDMxMSAgICAgICAgICAqDQo+IDMxMiAgICAgICAgICAqIFRoZSByZWFsIGNvbXByZXNzZWQg
c2l6ZSBjYW4ndCBleGNlZWQgdGhlIG1heGltdW0gZXh0ZW50IGxlbmd0aCwgYW5kDQo+IDMxMyAg
ICAgICAgICAqIGFsbCBwYWdlcyBzaG91bGQgYmUgdXNlZCAod2hvbGUgdW51c2VkIHBhZ2Ugd2l0
aCBqdXN0IHRoZSBzZWdtZW50DQo+IDMxNCAgICAgICAgICAqIGhlYWRlciBpcyBub3QgcG9zc2li
bGUpLiAgSWYgdGhpcyBoYXBwZW5zIGl0IG1lYW5zIHRoZSBjb21wcmVzc2VkDQo+IDMxNSAgICAg
ICAgICAqIGV4dGVudCBpcyBjb3JydXB0ZWQuDQo+IDMxNiAgICAgICAgICAqLw0KPiAzMTcgICAg
ICAgICBpZiAodG90X2xlbiA+IG1pbl90KHNpemVfdCwgQlRSRlNfTUFYX0NPTVBSRVNTRUQsIHNy
Y2xlbikgfHwNCj4gMzE4ICAgICAgICAgICAgIHRvdF9sZW4gPCBzcmNsZW4gLSBQQUdFX1NJWkUp
IHsNCj4gMzE5ICAgICAgICAgICAgICAgICByZXQgPSAtRVVDTEVBTjsNCj4gMzIwICAgICAgICAg
ICAgICAgICBnb3RvIGRvbmU7DQo+IDMyMSAgICAgICAgIH0NCg0KQWggSSBzZWUsIHNvIGdvaW5n
IGJhY2sgdG8gYW4gb2xkIExaTyBrZXJuZWwgd2lsbCBnZXQgdXBzZXQuICBPaywgZmFpciBlbm91
Z2guICBTbyBpZiB3ZSB3YW50IHRvIGJ1bXAgdGhpcyBmb3Igb3RoZXIgcmVhc29ucywgd2XigJls
bCBuZWVkIHRvIG1ha2UgYW4gTFpPIG1heCBzaXplIHRvIG1haW50YWluIGNvbXBhdGliaWxpdHku
DQoNCi1jaHJpcw==
