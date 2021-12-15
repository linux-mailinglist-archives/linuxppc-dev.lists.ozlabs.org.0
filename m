Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE795475321
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:47:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQmT6kH3z3dk1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:47:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::622;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjv2P8tz3051
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnG97ZFN33XVoAaJu0/GnQ6P0E3o55fCFVeYjFbRrQlDyOj7L5YEo+bHelwyoiz1IgG9fIonYK1F0SQffQXHTKx5Ixoust7SNS011T/2p1jArTAr8UaAd6obLMnqjlAeWXy5E6tx3U+8Ej0M6h5dikg50wMM9w/emUkhynlPkwgXu2jIPoPCi6mLy5Qm1nK4j291vgmcE/pj3O4YgZyR0MKXhsAvx+oq2YxqYdiF7jxyCAGJURRF/YMbm7Rao2YuORXwrUT3uyZg0oWmRSXUshQOfK6ZreY9UdaCbwENLAOB5i4VTPo1PVsKPxOlusrc32++iVML4oPZ9VFLi0tr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiZMm9KXXy+vu3WhUEQeEWc13H9a8TPaQVYGQB2pazk=;
 b=OSwqm10CFywLCPWz8IJaoCZFYx4OZ+Dft3P+TBbZ4U3RZPPIfrfrG/kL40mg3qWRv/limHK8sBUtxdtg67X68XkQmS+EH0kBKEdG1aEOFwxMnJQFha5tdbdrWI0SnLR7+mYKEsgKdvPnDY/uimBObH6Hhvg0uo7sq0uE3pcvxva8M3oWAZi3VDUiQuqKf9Gigy5+chgmpfOrF/Ww0f/pKoDewQIWlAFspVR2lEbdo2YWDTWINPOkl59vA1RkzBeiaCFJGph95SqS+vBKHh9Ymv4IRQ2tirxUuWM8JMWYRXGcChpQRHNJSiUnK7Q3owN0+nnymN+/YQlCHoJoSvcsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 06:45:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 06:45:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v5 04/11] powerpc/mm: Move vma_mmu_pagesize()
Thread-Topic: [PATCH v5 04/11] powerpc/mm: Move vma_mmu_pagesize()
Thread-Index: AQHX8X9PPZdDlwkiyU+pusM+LAK9oQ==
Date: Wed, 15 Dec 2021 06:45:12 +0000
Message-ID: <99531e3a7cfc8a08d5ef4b1e8cbe21f117b4cb97.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acbc4297-c40c-4d53-036b-08d9bf9671ba
x-ms-traffictypediagnostic: MR1P264MB2147:EE_
x-microsoft-antispam-prvs: <MR1P264MB2147F76C84EF0348664F1061ED769@MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0MxmKVBkX2CB39rdUdVzzRvcnTeSCri+stNqCeqHWg4OJNzYI5Y4z5lRgj6HeUSywaUNpRvrZod0n+n4TO8wMSMEmdOQJDMu6Iz8RMb0PXcg5888uBrSV+5zmSBNIDkyDZ4pRyUzeL9aF+J9WrFa6fTiJytALV9WQ2LIU6vQsHTpDjNSND/jHuo2rpSOpnwoE1n7bxNk/9R6bLg/eYkqYR5cXkek3YthlrbsXtIu4IFKukuCpfGV1X69bPhAnN5GREn/bsQQyp+RU6wa6tnl7jVJ5QoiTIUZKV3E7A8SWvYTjGy/yfKXje4ZMmPnVEvo86PpQIo82aGHexl9SL8JANAS2sYWf93pay+dKG/WhjnIGU/5gY4x8TbseXUfTXeJ5cZBROv2Q5Uvjdg1qYPyNrhS4Ow7/2mJ0kxEy2J4qr4UTTwlzaAj+0JABmKYl7gQVKy5ZfxELKMndMi4tIWan5IkvwGibQw9VD3+Jst2eQUlxt5XZbtxz8JBRc05J6dhgZ1vg0WLB95VsTeTcDve4ZBomn519VJUyK7tfkpn2nK6v+ZDnYEXbYYvuWKqC+9h0mPQEVYkjqAhoWM9EzXw7Mk63dE+a4WTs2yyKzi8+TPCpkDF2ncsA2szO3A2zJg6EqDhfD4T3jPLY96ozrQQIq6GsMz11bMIhkqcG54gbXHFIsXeZ/I3ShWbp/fB6QYGqsYpR1mHSuxXdQ6Nu5veOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(6486002)(2906002)(86362001)(5660300002)(508600001)(26005)(186003)(38100700002)(8936002)(44832011)(54906003)(316002)(66556008)(66446008)(66476007)(64756008)(6506007)(76116006)(91956017)(8676002)(66946007)(4326008)(2616005)(122000001)(83380400001)(6512007)(71200400001)(38070700005)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OM5tnpvsMMCBZ1kXSgMjKwAGi7jmsvrDzqSPpWLqdn5uG+FCp5hCnoAsQD?=
 =?iso-8859-1?Q?/ZFXq4RVgVVv9bKpwj4OIFmH67pLvAa56sXt2IJddWOlWraCcRgWtyU2JN?=
 =?iso-8859-1?Q?21Im2hfJB6yQYWY8a87xrj8+5k5KPs5DpQki6zxSC9Llj7g6hpziD6O4O+?=
 =?iso-8859-1?Q?yNhy/V9Iet0M6dkchFEjgUxspOj/lgyD4G0iKqCsBlGc6PCgXLlm+37GXB?=
 =?iso-8859-1?Q?FoHZAdH7tOkAR222JWj6cyFarxQyiLspKfGcjDIgV4ohEfc+kVWvZs4nAv?=
 =?iso-8859-1?Q?ejmYfQ5bjTH6tYfTwBKdgAz6AM1pH6D5Y+KsT3vuJ91vHBBq2hHjUAg1XR?=
 =?iso-8859-1?Q?rsunzwGXi1LFLnEmv3ZzPToWJ9DYfvUKgP9CAtpDjQo6j9L07B4xkUQ1bB?=
 =?iso-8859-1?Q?7o+zJBVgaaCTjL9olUqJJDZ0oPBtAYQvUEHCuEKKJ85aIr+OZ519wKKPi0?=
 =?iso-8859-1?Q?D2OYcvuH/udXeSvajOqg6xAm1B0GSon64HW8eze4n7zW0lIaYvJnXCB9ET?=
 =?iso-8859-1?Q?lbEjTKKJv/jEfL6leOLckRGEa3ODrSaYhL8V16Wjzsv6AAk969P9C0ZOCP?=
 =?iso-8859-1?Q?grWCc8HRxk6SC9Af/vNOSL/y3dxdBDL2XtTgsX1XPzL0MNqRxBNMMMIHhL?=
 =?iso-8859-1?Q?Z90CiTCjx+jO1nj0RrNVQfYeqWm5lHFxDAxhTLrH63Qk98I4WaMBAqgq8f?=
 =?iso-8859-1?Q?c/w20p+WOujClt1zmdDiqUPTxDr4P8VygxY6xQZiw+H9mX94QvcW6+OlVf?=
 =?iso-8859-1?Q?UMQZVilxm1jzA8IrgrYEXmP7iEzRnVyGACsaJAuKIqoGNM6LBnmBAUSgYk?=
 =?iso-8859-1?Q?3PCaMScj+3cUgxLXINn+RAXxY8OiJG3p89XaXHDDswEtaSzWvTIsXpN9GC?=
 =?iso-8859-1?Q?wx2vGAVYwnKDlpSpsD+/ApKnSt735ceQ/eW65IbnQrSQPwgMI/erwsNMSo?=
 =?iso-8859-1?Q?TMiPUaKuDnpqQSH+b0JBvoW458TxVEBtCs/e1NCy6EszI6TOHr7jD+/uVF?=
 =?iso-8859-1?Q?sGMisBncpaD9u+su4itkeBkx0TNsFYGx6gCwI1toYHZ5fd0L6CmKThcZJC?=
 =?iso-8859-1?Q?4KhEy5pICdJHm/5vb4pZZkVSBMr0qOLGbI9lw02tfDjb7K7jhjnpFMQkMt?=
 =?iso-8859-1?Q?RFcsGoBUniD7GPOBwkv+PbiiEgjFyscaz6jG+rEvf9DXIVSSCzo6YmC4WH?=
 =?iso-8859-1?Q?LlUFuMM162jdG83WLRpO9P4V8rWzec0oJYsImEH0lK9YgMaA8aMI9v46LC?=
 =?iso-8859-1?Q?wBzngMGLxzJblL24UGFeNJXVe6njat03bL90J6N9USDcdR27jZ/G8xSS0d?=
 =?iso-8859-1?Q?XVuyiGRTVVgGNRLlTzt8OMe4BBK3mdCQ87MfxJjeGfI4bFEEDPxSqHHyB6?=
 =?iso-8859-1?Q?p4S7Z0J0aMtY3otIwLiHNqrjdiEnvwKJyaPWZk7NHYm7kUK851rf6n2Six?=
 =?iso-8859-1?Q?yHzmAa2y8qm4j7bfngXKJ8AvU6Ri39XBkb5AwuIpj0PgjdZs6fZRlbLoJ6?=
 =?iso-8859-1?Q?dMEGg17pWRBlmVbGo1/Sb6KWm7wosfHWgJOfpQxlmqYZ+X3/w6+Wdn/dFM?=
 =?iso-8859-1?Q?QNHmixJwtYz7BQ9zkb7Wqxazu3R8as6f2Uy5IHaTz4p+Guj3XIvzI6berL?=
 =?iso-8859-1?Q?AW/66cMuy/Snx7m9+AbJSJhW0EKXQ4BmZ4LE7R2khipPe8z8aisUDJZIsT?=
 =?iso-8859-1?Q?YDvASZ0aHS3wuDN7NOYSHS/DcHcJ8qL0fqwfkRwlrbs3j3OJvJDxwtffgV?=
 =?iso-8859-1?Q?VzeNgJ4+ZBPDLRvdK9MVi6e9c=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acbc4297-c40c-4d53-036b-08d9bf9671ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:12.0863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7lKGYy6atF0oKkjPphVfvj7GRgpwLaRYxMUzD3VZ0fBNA+tTdeclqMt/dvXyrhzAYVA17Un05c5VFZJ148+Up45fOL+BvCM/jx19LkXfiXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2147
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
Cc: "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vma_mmu_pagesize() is only required for slices,
otherwise there is a generic weak version doing the
exact same thing.

Move it to slice.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/hugetlbpage.c | 11 -----------
 arch/powerpc/mm/slice.c       |  9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index ddead41e2194..0eec3b61bd13 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -565,17 +565,6 @@ unsigned long hugetlb_get_unmapped_area(struct file *f=
ile, unsigned long addr,
 }
 #endif
=20
-unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
-{
-	/* With radix we don't use slice, so derive it from vma*/
-	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !radix_enabled()) {
-		unsigned int psize =3D get_slice_psize(vma->vm_mm, vma->vm_start);
-
-		return 1UL << mmu_psize_to_shift(psize);
-	}
-	return vma_kernel_pagesize(vma);
-}
-
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	int shift =3D __ffs(size);
diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/slice.c
index f42711f865f3..8a3ac062b71e 100644
--- a/arch/powerpc/mm/slice.c
+++ b/arch/powerpc/mm/slice.c
@@ -759,4 +759,13 @@ int slice_is_hugepage_only_range(struct mm_struct *mm,=
 unsigned long addr,
=20
 	return !slice_check_range_fits(mm, maskp, addr, len);
 }
+
+unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
+{
+	/* With radix we don't use slice, so derive it from vma*/
+	if (radix_enabled())
+		return vma_kernel_pagesize(vma);
+
+	return 1UL << mmu_psize_to_shift(get_slice_psize(vma->vm_mm, vma->vm_star=
t));
+}
 #endif
--=20
2.33.1
