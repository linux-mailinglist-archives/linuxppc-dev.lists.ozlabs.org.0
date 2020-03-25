Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DC192EF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 18:12:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nZSJ46RhzDqgx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 04:12:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nZN95nGYzDq8B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 04:09:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=KWmXtK7q; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48nZN95M06z8tFV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 04:09:13 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48nZN959FKz9sPk; Thu, 26 Mar 2020 04:09:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.69.84;
 helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=KWmXtK7q; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690084.outbound.protection.outlook.com [40.107.69.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48nZN7476Yz9sQx
 for <linuxppc-dev@ozlabs.org>; Thu, 26 Mar 2020 04:09:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofmC+vu3xStqPPBIWzE/WlJVLnVoRjxADawNIn559y6+V2xxBf3r0eQymB5DBjqawlNrkV+auYlMJHG4oU7F74Ak6CpF1klyPq+oVBXImgUxno02zkmDeU88UXzVAnvc53ywdCSQKrPQ//4Koc3RwWWgPu7DtaQfMKDSnCNyCne6byQlq3E+p7ebsPMgoF+gLij9QKiIE1nrn3FwEmabPEepoW1fT8zTsXUSc2voqgV2RhJU1K63M6q2AbHrL5fOxSzdEXZu+lUG/l+sB0jk+/ilrNCLy043B4VmWTWX2uaIjIK4Mifz9Fs9qUlL8mmjj3b76HO4FlTjdAQb8uhf3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NtBK+m6y39DjxA6TxNuuFf8bqvi1W7uZr578nf30go=;
 b=cnrEC6IzfjPIrn5bafRVribNloUUTEcZpkVzAxet8R0WxQJRlrRFUuDRZAWNzM5nG4JSUmXYVf9w0GAefEnn3iMu2CbZZaovquNgoBaFcCrY704ddiTu4NT4sgEGzpQ1v6C7x9MvNDhnpCwRzNcZSNuNOLrWVJYucAEAaiG/e3s9Pm1MgA2BQj4VpkBDXSi52wNiJPNruKPp9aJJFbdvRdvWThM555wTx/WGd2am5AXJh85UxORjYHbHeV65zPC1K/aPo7rKtpdJ69M/jOaAK4ogu9jFg/h6pndtC/F+znswXRepgZEJ52V5zeKvkGJmeeKMqXw6SFBS2mL4SAZCzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NtBK+m6y39DjxA6TxNuuFf8bqvi1W7uZr578nf30go=;
 b=KWmXtK7qBe11W6sKIJaS+/89v0uUhDvI1GOldFhmvex0RmQmTLmuZBUrcQgHG6YT6kliaRKlqkqoiskWcta3UYnFD2floj0vewCUqCAsMK1NhX88RzeOOTHLine/1clMkQWrTE0z8XcLg9cnhT1htvCoXw8IlJR2o98hw0wvdJ0=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3393.namprd10.prod.outlook.com (2603:10b6:408:ca::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Wed, 25 Mar
 2020 17:09:04 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47%5]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 17:09:04 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 "David.Laight@ACULAB.COM" <David.Laight@ACULAB.COM>
Subject: Re: hardcoded SIGSEGV in __die() ?
Thread-Topic: hardcoded SIGSEGV in __die() ?
Thread-Index: AQHWAR3N4DoCknJ4G0WRUpvoA7Tp+6hWQKiAgAAAbwCAAAadgIAABlwAgAADsgCAAzoK4IAAAiOA
Date: Wed, 25 Mar 2020 17:09:04 +0000
Message-ID: <cf373a8b5973a09f9fa8466da5fa29190f858286.camel@infinera.com>
References: <73da05c0f54692a36471a2539dbd9b30594b687a.camel@infinera.com>
 <b20d978b-268b-773a-a43e-7ff4c741f2df@c-s.fr>
 <c14de482-6784-f1ac-f675-d771e55ac688@c-s.fr>
 <4f4f2c97f7393f21f507c58def88514c9f670e0a.camel@infinera.com>
 <43a21b20-4214-1043-0919-1bd8078d14a6@c-s.fr>
 <6b3484a7bf0f760570fbe7c8b22c36a244c19ff6.camel@infinera.com>
 <1bec238369f24e978e0da14f79b9c55f@AcuMS.aculab.com>
In-Reply-To: <1bec238369f24e978e0da14f79b9c55f@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.35.92 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [178.174.231.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f3753e2-3683-4a36-ea52-08d7d0df38fa
x-ms-traffictypediagnostic: BN8PR10MB3393:
x-microsoft-antispam-prvs: <BN8PR10MB3393EFDA8FAEFBCAD99EC504F4CE0@BN8PR10MB3393.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(316002)(2616005)(6486002)(86362001)(8676002)(8936002)(186003)(71200400001)(26005)(81166006)(81156014)(478600001)(6512007)(66946007)(2906002)(76116006)(91956017)(36756003)(6506007)(110136005)(5660300002)(66556008)(66446008)(66476007)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3393;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fS2Zg/jcuU8zbvuDCpOcGRvwfsOiEvV/0lAog0mNWbHGURoopYJHbPSwDiitlifpI42u9CbM4zD7dwLoPD5yIC5fz+wYgO9sWp8ClZvAiwnZXD/brrPRlHvN3f2POB6Ff866IHYzYDIJPJfdfITd7RqD1OA6QiXxSzeoMf/Jak/N/Z4I4DC2/3+nRg0K2rrc+/CMKv9Ul69Qi2/3F/6smvJdDorGvVm9t8THqsDdAtQwjTmmCcFKgTYBm9CWZNF93H/CLmWNKHyv7m/QYi9Mtq66zVcaysVNcmw5IskibE5Nble39hHu04fQXkYhysTzlSp1VpZ2eyTNW94lXFAAdloxI4GyCrltKisLgXS5h+zCrQnV45LV10r405iz0LxuuD6k5g+q0gwaRyDYeEMBv/CP8WuiCKf/rYxO9SWsFZzuA35LhYav15qNnSyWf62k
x-ms-exchange-antispam-messagedata: 338Di31+81KfO2uhyWbXqvnRSVB/+NKJxjFniC5T5nBEalwTxONC7AhFgXB1GtUjPIwX/f2kU+VYGQIgIRFXLd5wCCQUm5Xno4CC2uGGUVQ70B4eBSQhhVcPllqyDg/rix5R7OYShYsOyojcvYNU1w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <AB542C5182158A44855D99DFD7C7FF4C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3753e2-3683-4a36-ea52-08d7d0df38fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 17:09:04.7137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +qg93AtpYWY9IkjH+dqI7ClcLGbPdusQEdWLDa+wflhQ3atgl9/7zv4d+nOA5g/fbYS1znh5hV9ux+5W9hR8vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3393
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-03-25 at 17:02 +0000, David Laight wrote:
> CAUTION: This email originated from outside of the organization. Do
> not click links or open attachments unless you recognize the sender
> and know the content is safe.
>=20
>=20
> From: Joakim Tjernlund
> > Sent: 23 March 2020 15:45
> ...
> > > > I tried to follow that chain thinking it would end up sending a
> > > > signal to user space but I cannot
> > see
> > > > that happens. Seems to be related to debugging.
> > > >=20
> > > > In short, I cannot see any signal being delivered to user
> > > > space. If so that would explain why
> > > > our user space process never dies.
> > > > Is there a signal hidden in machine_check handler for SIGBUS I
> > > > cannot see?
> > > >=20
> > >=20
> > > Isn't it done in do_exit(), called from oops_end() ?
> >=20
> > hmm, so it seems. The odd thing though is that do_exit takes an
> > exit code, not signal number.
> > Also, feels a bit odd to force an exit(that we haven't seen
> > happening) rather than just a signal.
>=20
> Isn't there something 'magic' that converts EFAULT into SIGSEGV?

I have tried to find out and I cannot see a signal beeing sent.
Also, SEGV is wrong, this is a SIGBUS fault.

>=20
>         David
>=20
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
> MK1 1PT, UK
> Registration No: 1397386 (Wales)
