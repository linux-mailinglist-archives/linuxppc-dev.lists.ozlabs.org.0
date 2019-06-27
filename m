Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C1458189
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 13:29:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZHj6027WzDqfW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 21:28:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.76.104;
 helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=aaron@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.b="n84QFvk5"; dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760104.outbound.protection.outlook.com [40.107.76.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZHSY6MFtzDqXY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 21:18:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPksX9kTKCzYCXwG24gRwSMKH1dwPvwYcTm0uG09s8o=;
 b=n84QFvk5ZqMJzHVSoL1riHfmgpB591XYvxtW7Tob7LiAj5ePFXt6flNRGsXU0UXMNNePBEJ5/zMv+z8spKYpK6VrjGReTc2hZqPvDdlceGH/M1cGL9w5m110d8dTba9/kA+Z0sY5mrGBDbrmPGFXvSqzlr1+zwj2DE+i6JqE5G0=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
 DM6PR01MB4906.prod.exchangelabs.com (20.176.119.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Thu, 27 Jun 2019 11:17:59 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
 ([fe80::390e:9996:6dec:d60f]) by DM6PR01MB4825.prod.exchangelabs.com
 ([fe80::390e:9996:6dec:d60f%6]) with mapi id 15.20.2032.016; Thu, 27 Jun 2019
 11:17:59 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 0/5] Enable CONFIG_NODES_SPAN_OTHER_NODES by default for
 NUMA
Thread-Topic: [PATCH 0/5] Enable CONFIG_NODES_SPAN_OTHER_NODES by default for
 NUMA
Thread-Index: AQHVK6WT5IKFNhd5LECqV06L4uyCQKatFN0AgAJHxoA=
Date: Thu, 27 Jun 2019 11:17:58 +0000
Message-ID: <20190627111755.GJ7133@okra.localdomain>
References: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
 <CAADWXX8wdEPNZ26SFJUfwrhQson3HPTrZ7D2jju3RhEeMuc+QQ@mail.gmail.com>
In-Reply-To: <CAADWXX8wdEPNZ26SFJUfwrhQson3HPTrZ7D2jju3RhEeMuc+QQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:208:d4::29) To DM6PR01MB4825.prod.exchangelabs.com
 (2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2600:3c03::f03c:91ff:febb:cdda]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41020974-51cb-4a3d-32c1-08d6faf11be8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR01MB4906; 
x-ms-traffictypediagnostic: DM6PR01MB4906:
x-microsoft-antispam-prvs: <DM6PR01MB490676652E3A18AA2A5EE7738AFD0@DM6PR01MB4906.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(346002)(39850400004)(396003)(189003)(199004)(54906003)(71200400001)(71190400001)(52116002)(46003)(8936002)(25786009)(8676002)(316002)(6116002)(81166006)(81156014)(1076003)(99286004)(446003)(186003)(11346002)(7416002)(386003)(6506007)(478600001)(486006)(102836004)(476003)(4326008)(33656002)(14454004)(76176011)(2906002)(14444005)(256004)(305945005)(5660300002)(7736002)(66946007)(6436002)(73956011)(45080400002)(9686003)(6512007)(68736007)(229853002)(66556008)(64756008)(6486002)(66476007)(86362001)(66446008)(107886003)(53936002)(6916009)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4906;
 H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S716oI9qHr9HoTifdQqNcAn+wRHxHq8BZGRzkdC9r3kNYPJ0F8JFHXzYx0SUOMq7ebgM62lCx+oVLzPlCypRkfyBve7WzA8ySs9nYANe2AjFY4bNJfJIZ2OONOm8zg0DMl/4TJtLFA8wg7EhvQp8zAFDre7IfLPXk/TLYKEM9ryqa+D1HtNpPnIMjuloBa7MejlWhifKAIVoL57h6X9ZzWrr9dbVpntQYKJGa8/ttYTwvgdVSPEmzauMFrB1ym2iCTn/fzAb2ttKXWkYyk88Yyfoa1DW6AKYrLYSJ3PiIs2rUeNjtGE4mmV/IcZCOUY7REJeaTXGK4Yit4lDLoLYa0JjtqNSjERT40U7jXVxNvg5Q2kFiZXA3krua9Em2Km6etMvmIhXSFW1sWtXqxljUVvr2n6EBUlal8Pd9Rhu+Oc=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DE70FA20B7464849A9C1EC473C6D4C0A@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41020974-51cb-4a3d-32c1-08d6faf11be8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 11:17:59.0263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aaron@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4906
X-Mailman-Approved-At: Thu, 27 Jun 2019 21:25:22 +1000
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
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Open Source Submission <patches@amperecomputing.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Hoan Tran OS <hoan@os.amperecomputing.com>, Oscar Salvador <osalvador@suse.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Jun 26 08:28, Linus Torvalds wrote:
> This is not a comment on the patch series itself, it is a comment on the =
emails.
>=20
> Your email is mis-configured and ends up all being marked as spam for
> me, because you go through the wrong smtp server (or maybe your smtp
> server itself is miconfigured)
>=20
> All your emails fail dmarc, because the "From" header is
> os.amperecomputing.com, but the DKIM signature is for
> amperemail.onmicrosoft.com.

It appears Microsoft enables DKIM by default, but does so using keys
advertised at *.onmicrosoft.com domains, and our IT folks didn't
initially notice this. We believe we've rectified the situation, so
please let us know if our emails (including this one) continue to be an
issue.

> End result: it wil all go into the spam box of anybody who checks DKIM.

Interestingly, *some* receiving mail servers (at least gmail.com) were
reporting DKIM/DMARC pass for emails sent directly from our domain
(though not those sent through a mailing list), which I believe allowed
our IT to falsely think they had everything configured correctly.

-Aaron
