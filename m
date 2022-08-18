Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F07045981EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 13:07:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7htH5Y03z3cfV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 21:07:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JAHkU3XX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.88; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JAHkU3XX;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120088.outbound.protection.outlook.com [40.107.12.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7hsW14rQz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 21:06:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXFvD/BqbxbO9nNG5bgjKB31zq9utN7R1YGMqRZpGbQQqNLK+nW0fgrJFtZAhVwR99rbysfGJmW9XaI3mGkAeMYDiDtNNI57Si8jf1V5q5blwEG0C4v5kh49/ckduBvHjUEfGLqYfaSE/KVoZDpZ5avEAx2DUkskMvUw6f2biMeI9ZWyULsa2x94wCcwZNWf8GIiwjJYx/u6Dtqz4+gpg0UUnfD+DONEm4JhYohm110+hPS9cYyo/B9t9H5rZnxogiESpjegttOcQbJeo9hIP6IrZc04Au5meH/87+CUHeG0WhnuejxadzRVPi9/NRs3ccyof5ggNcQf3EAetSTMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NXU4uANHP/jwvUVJ7qzHRsmPe2j1xYoXi47D/QkOxI=;
 b=lN1yMvT3PJkdc5HGZMsojIK1uSBzAKQ+Q9fCRzOljPrASECGawKk03gT5BLOyv6pwoWUyPjPUPgHbxZqJSz2i/tGpw3lOiz+sQgbhm1giyKySNUkoPOvXZXw7F8qkBXuG1uwUwYZjVYntLY0g+YYQA/IlpoADYX8tdxXYlnMX0qDN+tdLHmnfwEhEdXslrT1WEKFmUGhUBI9oegGkluC9AakXYopqL/J4OnukQcPr7XeWGgNoictPSKuqQr/JjyFKmDPkdqgufknq1nubTcizO/+dePLVKfAF2toBcR3BmYX2s8P1ROTBhwI99URLdgDk25COrpi3sUM7idHwR0RaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NXU4uANHP/jwvUVJ7qzHRsmPe2j1xYoXi47D/QkOxI=;
 b=JAHkU3XXtJJw3EzoGzFcjcoE2/1Y5duAyyT4RCiVgvZcc7FgHgTNzX5Q/xQHQUQ5vpOgH397+9MQBS6ZRMqAFhoUBW/eu6Kow3W3dHYdgCa0s+3jvScdhzUJ76QGHZqT6rK7I0aGdxGKgTQ3Ps4MnT9dVdER6XlWIcwZw44NIjrobJuLb2xv/IkP43zS00cklxyI4hcxF2WMwmY8aghJmHGQOeJgP9stQ5kMEi6nftYZ8608/G6MXybc75BXKH6SfNaJkhTAcX46gGAtUtUkmMptsPrt2H+Kl70RX7m68XFWfWl3myESzNGnvP3tmeAAdzca9pKEMDS+pC/QI34XnA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3989.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:250::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 11:06:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 11:06:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Sathvika
 Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH 01/16] powerpc: Replace unreachable() with it's builtin
 variant in WARN_ON()
Thread-Topic: [PATCH 01/16] powerpc: Replace unreachable() with it's builtin
 variant in WARN_ON()
Thread-Index: AQHYqxzuOnO/NhprkE2nfdb4odtcSK2n0ECAgAy5FACAAAWCAA==
Date: Thu, 18 Aug 2022 11:06:15 +0000
Message-ID: <06b7a93b-5148-4d92-0b56-5956afdfd3fb@csgroup.eu>
References: <20220808114908.240813-1-sv@linux.ibm.com>
 <20220808114908.240813-2-sv@linux.ibm.com>
 <82eec792-b71f-17cc-d905-368fd5ca62f2@csgroup.eu>
 <1660817468.4x4re2ul0k.naveen@linux.ibm.com>
In-Reply-To: <1660817468.4x4re2ul0k.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e75f46a-4e3a-4a76-55bf-08da8109ab16
x-ms-traffictypediagnostic: PR1P264MB3989:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  P5e9hSFNWt9kZ7wuxQP5YaSbc+aKMv2uIhOpXCkW7u2drb5QgXUSbjva9ILHy0SzPAxhzw5jz3zzQX/3Ahf19UEgSyMDypBpa7bQiikEOA4xShwF8VsLk2czZYx+IUOxYpUy+d0P6CZl/kP6j37jPKkc/mPXAdfK5b5N5RIS+QkPwP5k/KOBntrCcUgSHHPSNCc7FDbZ7qRe/81L8iewBl+ZbA0OHpnW2PrDs659p0rSBbPeTpUjNABXFYU5f7TGqblOF2KVB2ImAjDlY29nKSXUhqJ1LhBW2a7HsetUdUghHRa7NTVYRWsZh8GRYsUi9o8cMo/0EOCEhqWiM/dI+9TgMRe63Jgy54HIIz1G4Wft6GpaaT7JM+FQDrkRoCkzZ6zmgn0woNu1H+FzJ5d3QjZ61Mn6i27Va5pfsY6RxFs6WVmot+L2bXdnHWR6CoKv9izCYVUKldKcrajWIrh+LBtr37Q/wn/wBjv475DOfq8ZYm9HVl45wOTSDXe/XvncZIy22nCJWr1wnh33ap6Mwc0oD8A9uwgJXELOtQIIyh7Cjgf0/0M23jl1AbxCmq9/kY2k+3SYLT3ZzE7DHewO+Hvh83K8ahdVOa42PQWZw1H/PbPQ3rZLN/b0PFXNWpJR32Wvrhg7L3aWONN5vUok4vYfKHpsENcf8ABcPlLzakvYK5YvcSoGosN4Dt+5j3/NrTcpvk1aWeAX5uRRhCIw1KJoZDm8oDoOjunBGvM7AMWYOz1qrEiMucT+SLgnuoAWE5MI8hHdacvBRmKff+OPRJSDTBHZK022c+upHLAB1TPP9609jylWAphwP0s2Kmf4/ImQ4D2tbG/yUvNLB4A0RA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(8676002)(316002)(66556008)(64756008)(66446008)(66946007)(66476007)(4326008)(38070700005)(54906003)(110136005)(91956017)(31696002)(122000001)(38100700002)(76116006)(36756003)(31686004)(86362001)(41300700001)(2616005)(26005)(6512007)(6506007)(478600001)(6486002)(186003)(71200400001)(44832011)(83380400001)(66574015)(5660300002)(8936002)(7416002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bFVFeEovaCtjaHl6Y1NDL2I5eVk4TUxaeWtFRWx3MDdjL1B3MldJbnhydGRD?=
 =?utf-8?B?ektlR1gwblh1Y0RMNDhIZ1NnV0wyeElBNjVVSi8yWFliRXVhQ3lPSU0wdk1P?=
 =?utf-8?B?aWU1dWUwZ3FmaUZ5RmxXc3k4a1F6Sy9wbWhNQThic0IzTlAxTzlzdEhTemdM?=
 =?utf-8?B?eHlmVStMaVRVQWVMb3JLY0hiY3cwOWNnQjRtbDJxNUVzVTFIclRFTE5pcElm?=
 =?utf-8?B?Z096T0tYdGFsbjk5emNhcHZJWWFlY21lUnZGeUNISnRCSi9KUVlXVlVtMSs2?=
 =?utf-8?B?OWNiTS9rb1NCNkFuZVZlNUYwdE5SUHF5NUNCcWtaWDhaUENXbHZUZkdydTc4?=
 =?utf-8?B?amxzVzdGMkg1cXRKdFlMMndmYzNhMGJobTkwZm5BR3Y0ZnlMYkdwZENWY0gv?=
 =?utf-8?B?ZnM1MXVhYVRGa2JoRElEY1JkeGdlcGlhMU42aDhHTkROZWhzOUhDMHBRc3VR?=
 =?utf-8?B?enZlNWZRQ0RpcktBVXpoVWR4NjBmemgyMWZTTlQ1SkhxdDlNU1gxakpOUDUr?=
 =?utf-8?B?MGFzamhHTmh6cEVzTUh3SXk5YXZGamgvMXNkeFduUzcvbDZlT01yMDkrbktQ?=
 =?utf-8?B?V0ZqSUpzYWorNEpvL0lNYjJoZllIeUh3MFBraGIxZUlFeE5LTGxBTGRIc2Vk?=
 =?utf-8?B?QUZqL3E5NUtxc1RKQUliaDRLV3JDdHBVTUQ2dlUwZmdibWtmc1R6alluRU9r?=
 =?utf-8?B?QW5hUHRtMnJLblB5QjB4bUhFcERJelpSeWxWaVVuRXdyQ3dmb0pxTUorNFhj?=
 =?utf-8?B?SW9kOVFyYzZvdUx3dTM5TDhKbWl3ZStBY2pjRlVncXRDMHpkQ3NsQ3ppZHNh?=
 =?utf-8?B?NHJBN1RlRmRiS1NjeE9tVk5PaWVNT3c0S01VNHdJSnJseXRDbWJ3WDZTNkww?=
 =?utf-8?B?Q2hJWlY0WXd2SHRQMHd3cHpZT080NGl6TG52RENKMVFkL2REd2FKY3B3eDI2?=
 =?utf-8?B?SVNYaHZPZ2tXejFQbkdWY1Fnb3gwL2VCQTBMSkpuU0ZIOGprNDF5Ri8wZ3BV?=
 =?utf-8?B?ak1Cam5qS1VPdVhCWFdRMm9qNUNiZEhpYkg0aHA5TGZ4cndlSHNsckk2UnF4?=
 =?utf-8?B?KzNyRDNlV2tQV2tqa0NsRU1ObjJrRHRYbDFUMmo2QW1CbmhQbGtKaFQzODEy?=
 =?utf-8?B?d3Z4UmEyYVRsWVN3L2puNkE2U0hGbmUveE5oS3FpNndVUFhNdWo3YnY4TU1a?=
 =?utf-8?B?TytiRW5xOTkrUkhtUlA0TVFxU24zRkdGVGdpelVGazJ5MGNsKzhMWUs1UkUy?=
 =?utf-8?B?c0xTRzludjFkZ3FyUzVsVG02S0pUMzVIVDRmVjUwaW5MSnRUTjNZRnpUQVhT?=
 =?utf-8?B?YXBGWlNoazZMVWdlTUQ3dStlbUpEcUVFM0pEcEdZRTJQcHMvV0VpSFJkYmE5?=
 =?utf-8?B?REhlWVhYSG9nVlpUV1ZGR3I3TWFEMmwyOU1BR0RDa1VmMm93V3NHa0lvNXkx?=
 =?utf-8?B?L2lzY1kxTHlFbGVtV1dpS1R1VHNiYzdYRWVibGhCQWlBYkRJN3AzVnlaaTNy?=
 =?utf-8?B?b245SmllSGRiR3R6d0hjajd0UlFGTDExYThMRGQyS2grS2JMdjNYRkN0S1lE?=
 =?utf-8?B?cE5mL2VZOEdaZnNEbE83Unp5WTdXR01acDcyQmVMS3ZPM0FDaDA2SlpHTmZU?=
 =?utf-8?B?ODJnVEtwd3ZsQ2lGaHBqZ3VrTmg1RG83WlFUS1l6Z1pyUnhKaEttTjBxeU4z?=
 =?utf-8?B?MllLT2tJNkcrbSt3eVlKMmF6N2l3T24yMnJ2NjhDTm1HTWVLdmRDc0QzRTVC?=
 =?utf-8?B?d0xESlBxOVFSQUpxSVo0SitHeFM3UkVYRldyWElrRWJid3lWcDVUZGN5dUVQ?=
 =?utf-8?B?ZXFhOFE5L1FxTEZtdWhyRzNiTWZPaXBycjVSSUcySVQ3cFFKYnRrcEFnVkJx?=
 =?utf-8?B?Mm5Vb1Ewbm11d0dvdEFaZHFpUnRWRVQza0JzcndIb2ZGNnZZc2ZTSnh2d3Jr?=
 =?utf-8?B?anRaKzJzVEoxbjV6cGgzUnlSY3IySVhvbjdESnZ3RmZwZWxaVjF5bk5CMzRz?=
 =?utf-8?B?MlpZaFFrTnE3SG5PczlTMTlIeWdwRGxwVlcxNk14ejYrTDZsVUZiVmphSjJx?=
 =?utf-8?B?b3ZmZERtcU5MWXhSRnkzYVdMZVQzcTdjRUtoMEVpcXdjcG5TODVOQ2gxZ1k4?=
 =?utf-8?B?aVd1T2NKQmRyTkJ2SklSQjRGTUVNcEh0T0lwaWgwcC9admtVZE01bDZhQ09O?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEEE9EE7B591D049AF9E5D2BC1C5D177@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e75f46a-4e3a-4a76-55bf-08da8109ab16
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 11:06:15.1090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hiF4FDQRW84/YsHuddTmOq91v9F6OiOrLuMK1PMMDhs1TcIWG88mwYMGElkxtoE9RpcKvbjoBvFBbW61zoTY1OA8z1/ECBckHyoVajkV+YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3989
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA4LzIwMjIgw6AgMTI6NDYsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMDgvMDgvMjAyMiDDoCAxMzo0
OCwgU2F0aHZpa2EgVmFzaXJlZGR5IGEgw6ljcml0wqA6DQo+Pj4gb2JqdG9vbCBpcyB0aHJvd2lu
ZyAqdW5hbm5vdGF0ZWQgaW50cmEtZnVuY3Rpb24gY2FsbCoNCj4+PiB3YXJuaW5ncyB3aXRoIGEg
ZmV3IGluc3RydWN0aW9ucyB0aGF0IGFyZSBtYXJrZWQNCj4+PiB1bnJlYWNoYWJsZS4gUmVwbGFj
ZSB1bnJlYWNoYWJsZSgpIHdpdGggX19idWlsdGluX3VucmVhY2hhYmxlKCkNCj4+PiB0byBmaXgg
dGhlc2Ugd2FybmluZ3MsIGFzIHRoZSBjb2RlZ2VuIHJlbWFpbnMgc2FtZQ0KPj4+IHdpdGggdW5y
ZWFjaGFibGUoKSBhbmQgX19idWlsdGluX3VucmVhY2hhYmxlKCkuDQo+Pg0KPj4gSSB0aGluayBp
dCBpcyBuZWNlc3NhcnkgdG8gZXhwbGFpbiB3aHkgdXNpbmcgdW5yZWFjaGFibGUoKSBpcyBub3Qg
DQo+PiBuZWNlc3NhcnkgZm9yIHBvd2VycGMsIG9yIGV2ZW4gd2h5IHVzaW5nIHVucmVhY2hhYmxl
KCkgaXMgd3JvbmcuDQo+Pg0KPj4gQWxsdGhvdWdoIHdlIGFyZSBnZXR0aW5nIHJpZCBvZiB0aGUg
cHJvYmxlbSBoZXJlIGJ5IHJlcGxhY2luZyANCj4+IHVucmVhY2hhYmxlKCkgYnkgX19idWlsdGlu
X3VucmVhY2hhYmxlKCksIGl0IG1pZ2h0IHN0aWxsIGJlIGEgcHJvYmxlbSANCj4+IGluIGNvcmUg
cGFydHMgb2Yga2VybmVsIHdoaWNoIHN0aWxsIHVzZSB1bnJlYWNoYWJsZS4NCj4gDQo+IEkgZGlk
IGEga2VybmVsIGJ1aWxkIHdpdGggdGhpcyBzZXJpZXMgYXBwbGllZCwgd2l0aCBhIHZhcmlhbnQg
b2YgDQo+IHBwYzY0bGVfZGVmY29uZmlnLiBJIHRoZW4gZGlkIGFub3RoZXIgYnVpbGQgd2l0aCB0
aGUgc2FtZSBjb25maWcsIGJ1dCANCj4gd2l0aCB0aGUgYmVsb3cgaHVuayB0byBkaXNhYmxlIG9i
anRvb2w6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bv
d2VycGMvS2NvbmZpZw0KPiBpbmRleCA2YmUyZTY4ZmE5ZWI2NC4uNGM0NjZhY2RjNzBkNGMgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9L
Y29uZmlnDQo+IEBAIC0yMzcsOCArMjM3LDYgQEAgY29uZmlnIFBQQw0KPiAgwqDCoMKgwqDCoMKg
IHNlbGVjdCBIQVZFX01PRF9BUkNIX1NQRUNJRklDDQo+ICDCoMKgwqDCoMKgwqAgc2VsZWN0IEhB
VkVfTk1JwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IFBFUkZfRVZFTlRTIHx8IChQUEM2NCANCj4gJiYgUFBDX0JPT0szUykNCj4gIMKgwqDCoMKgwqDC
oCBzZWxlY3QgSEFWRV9PUFRQUk9CRVMNCj4gLcKgwqDCoMKgwqDCoCBzZWxlY3QgSEFWRV9PQkpU
T09MwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBQUEMzMiB8fCBN
UFJPRklMRV9LRVJORUwNCj4gLcKgwqDCoMKgwqDCoCBzZWxlY3QgSEFWRV9PQkpUT09MX01DT1VO
VMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIEhBVkVfT0JKVE9PTA0KPiAgwqDCoMKgwqDC
oMKgIHNlbGVjdCBIQVZFX1BFUkZfRVZFTlRTDQo+ICDCoMKgwqDCoMKgwqAgc2VsZWN0IEhBVkVf
UEVSRl9FVkVOVFNfTk1JwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIFBQQzY0DQo+ICDCoMKg
wqDCoMKgwqAgc2VsZWN0IEhBVkVfUEVSRl9SRUdTDQo+IA0KPiBUaGlzIGhhcyB0aGUgZWZmZWN0
IG9mIGRpc2FibGluZyBhbm5vdGF0aW9ucyBmb3IgdW5yZWFjaGFibGUoKS4NCj4gDQo+IFdoZW4g
SSBjb21wYXJlZCB0aGUgcmVzdWx0aW5nIG9iamVjdCBmaWxlcywgSSBkaWQgbm90IHNlZSBjaGFu
Z2VzIGluIA0KPiBjb2RlZ2VuIHJlbGF0aW5nIHRvIHRoZSBhbm5vdGF0aW9uLCBsaWtlIHdlIGRv
IHdpdGggdXNpbmcgdW5yZWFjaGFibGUoKSANCj4gaW4gX19XQVJOX0ZMQUdTKCkuDQo+IA0KPiBN
b3JlIHNwZWNpZmljYWxseSwgYXJjaC9wb3dlcnBjL2t2bS9ib29rM3Mubzprdm1wcGNfaF9sb2dp
Y2FsX2NpX2xvYWQoKSANCj4gdXNlcyBCVUcoKSwgYW5kIHRoZSBnZW5lcmF0ZWQgY29kZSByZW1h
aW5zIHRoZSBzYW1lIHdpdGgvd2l0aG91dCB0aGUgDQo+IHVucmVhY2hhYmxlKCkgYW5ub3RhdGlv
bi4NCj4gDQo+IFRoaXMgc3VnZ2VzdHMgdGhhdCB0aGUgYmFkIGNvZGVnZW4gd2UgYXJlIHNlZWlu
ZyB3aXRoIHRoZSBhbm5vdGF0aW9uIGluIA0KPiB1bnJlYWNoYWJsZSgpIGlzIGxpbWl0ZWQgdG8g
aXRzIHVzZSBpbiBfX1dBUk5fRkxBR1MoKSwgd2hpY2ggSSBzdXNwZWN0IA0KPiBpcyBkdWUgdG8g
YW4gaW50ZXJhY3Rpb24gd2l0aCB0aGUgdXNlIG9mIGFzbV92b2xhdGlsZV9nb3RvKCkgZm9yIA0K
PiBXQVJOX0VOVFJZKCkuDQo+IA0KPiBJZiBJIHJldmVydCB0aGlzIHBhdGNoIChwYXRjaCAwMS8x
NiksIGdjYyBzZWVtcyB0byBhZGQgYSBsYWJlbCA4IGJ5dGVzIA0KPiBiZWZvcmUgX3NvbWVfIGZ1
bmN0aW9uIGluIHRoaXMgb2JqZWN0IGZpbGUsIHdoaWNoIGhhcHBlbnMgdG8gaG9sZCBhIA0KPiBy
ZWxvY2F0aW9uIGFnYWluc3QgLlRPQy4sIGFuZCBlbWl0cyBhIGJsIHRvIHRoYXQgc3ltYm9sLiBP
dGhlcndpc2UsIGdjYyANCj4gZWl0aGVyIGVtaXRzIG5vIG5ldyBpbnN0cnVjdGlvbiBmb3IgdGhl
IGFubm90YXRpb24sIG9yIGEgJ25vcCcgaW4gc29tZSANCj4gY2FzZXMuDQo+IA0KPiBJZiBJIGFk
ZCBhICdub3AnIGJldHdlZW4gV0FSTl9FTlRSWSgpIGFuZCB1bnJlYWNoYWJsZSgpIGluIA0KPiBf
X1dBUk5fRkxBR1MoKSwgb3IgY29udmVydCBXQVJOX0VOVFJZIHRvIEJVR19FTlRSWSB0aGVyZWJ5
IHJlbW92aW5nIHVzZSANCj4gb2YgYXNtX3ZvbGF0aWxlX2dvdG8oKSwgdGhlIHByb2JsZW0gZ29l
cyBhd2F5IGFuZCBubyBibCBpcyBlbWl0dGVkOg0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9idWcuaCANCj4gYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYnVn
LmgNCj4gaW5kZXggNjFhNDczNjM1NWMyNDQuLjg4ZTAwMjdjMjBiYTVjIDEwMDY0NA0KPiAtLS0g
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYnVnLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2J1Zy5oDQo+IEBAIC05OSw2ICs5OSw3IEBADQo+ICDCoMKgwqDCoMKgwqAgX19s
YWJlbF9fIF9fbGFiZWxfd2Fybl9vbjvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPiAgwqDCoMKgwqDC
oMKgIFdBUk5fRU5UUlkoInR3aSAzMSwgMCwgMCIsIEJVR0ZMQUdfV0FSTklORyB8IChmbGFncyks
IA0KPiBfX2xhYmVsX3dhcm5fb24pOyBcDQo+ICvCoMKgwqDCoMKgwqAgX19hc21fXyBfX3ZvbGF0
aWxlX18oIm5vcCIpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBcDQo+ICDCoMKgwqDCoMKgwqAgdW5yZWFjaGFibGUoKTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPiBfX2xhYmVsX3dhcm5fb246DQo+IA0K
PiANCj4gSW4gc3VtbWFyeSwgSSB0aGluayB0aGUgYW5ub3RhdGlvbiBpdHNlbGYgaXMgZmluZSBh
bmQgd2UgYXJlIG9ubHkgc2VlaW5nIA0KPiBhbiBpc3N1ZSB3aXRoIGl0cyB1c2FnZSBhZnRlciBX
QVJOX0VOVFJZKCkgZHVlIHRvIHVzZSBvZiANCj4gYXNtX3ZvbGF0aWxlX2dvdG8uIE90aGVyIHVz
ZXMgb2YgdW5yZWFjaGFibGUoKSBkb24ndCBzZWVtIHRvIGV4aGliaXQgDQo+IHRoaXMgcHJvYmxl
bS4NCj4gDQo+IEFzIHN1Y2gsIEkgdGhpbmsgdGhpcyBwYXRjaCBpcyBhcHByb3ByaWF0ZSBmb3Ig
dGhpcyBzZXJpZXMsIHRob3VnaCBJIA0KPiB0aGluayB3ZSBzaG91bGQgY2FwdHVyZSBzb21lIG9m
IHRoaXMgaW5mb3JtYXRpb24gaW4gdGhlIGNoYW5nZWxvZy4NCj4gDQo+IE5vdGUgYWxzbyB0aGF0
IGlmIGFuZCB3aGVuIHdlIHN0YXJ0IHV0bGl6aW5nIHRoZSBhbm5vdGF0aW9uLCBpZiB3ZSANCj4g
Y2xhc3NpZnkgdHd1aSBhcyBJTlNOX0JVRywgdGhpcyBjaGFuZ2Ugd2lsbCBjb250aW51ZSB0byBi
ZSBhcHByb3ByaWF0ZS4NCj4gDQoNCklOU05fVFJBUCBpbnN0ZWFkIG9mIElOU05fQlVHID8NCg0K
Q2hyaXN0b3BoZQ==
