Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED74788FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:33:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlgl0gJGz3fDl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:33:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60e;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlYp3cClz30G6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:28:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1xPvWKIw4ya0UuYUl1mBpE5bDqDBUd1i1QXZMvd19aMQVnYGLvoRVmmRipB3rzXpNp3r7TNB6uLDUvJS2WwmTIG6JYqDWycWsHSV5VfEscpudKKeEfHxvk4Lb3C6CuwCDGXidh6/0cNdkXkgOIWVzdMDW/kSxyplgEtKoXKYf3C/ZjCtOXkvyR8Q51EFZ8ymtXTlSzKv7HUQTuhzfFQ/BD1YDdXqQKhIZwQ65tFFZficveXVBWTrqQSR+UWmOa9lb0bYEP/TnkGyJoTpghOKsoLbl+XwqTjl4I5RYhhRZE2KS90739DzjQIHx+RjZTAYhrqsSMJQukTHG37lFBPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao0J4RtTmJCD5YE4NNN5icIYyoHVg3j5QWKaKWYo9c4=;
 b=jUjjhreTVVFGpmUksaeymejq4Ur9c6U3nWYRoO9vkE6AriPP0H9unDRSktj+aDc03kMf2aO6JLgIqOUKDUG9n2iNHWazIs5CA5Li/x+tWu25/eGpnCvrwzATB82zl3YRlb64AnZeWbS81zWfy6WutIn882hmpJylrM5VBxmHLHHUuMvapaBgYkMd8XTOZQE4+Fk9yJt1KQa6sWUycu09GSJcjZZKNVHV3Oh4xLmC6XWLVNHCyzSj+0BIQXKv+fzPoQ2Ac+3BAPGtsGaM+vDl42x9m5p/iDkl8GA9qEjE1gggUzoP90J7WUEy0YjTJFL5lbKmYTbxaoOkdR1XDfsRBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:28:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:28:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 10/14] powerpc/mm: Use generic_hugetlb_get_unmapped_area()
Thread-Topic: [PATCH v6 10/14] powerpc/mm: Use
 generic_hugetlb_get_unmapped_area()
Thread-Index: AQHX8zDFQ3uuebV86Um/h1R1jR0ImQ==
Date: Fri, 17 Dec 2021 10:28:02 +0000
Message-ID: <f48ee261eef101af635b112bc83d0b4a9c771d77.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecf4a557-1798-4890-19a4-08d9c147e7a7
x-ms-traffictypediagnostic: MR2P264MB0194:EE_
x-microsoft-antispam-prvs: <MR2P264MB0194A2EBF7B5628F4F038E8DED789@MR2P264MB0194.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:246;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ah7PRKfXkjKRobdmKHssoNPNwG/rDT4HJcZCFZfBcTRhI1V3zLYrD0wyeQX39hdK9zdFa16DEMPtWXUFMnp4AGQas6DE1ubnvKgW+3T3BYRTqsSpwgEy/cFBIMa+ovKnVDtZNgF0HT2q62tZlLSAgxIHGo+Nyhu7qBnc+fa+f9JBLMiE8upZMzN/7airiQxySwE4K56F0kFf2Gz8moBylt3n45WJCjjfVaNGzB+AtDxO339nd5D5Iqx9yL07SnqW5SlXlFSmjzjyciU9aIo0/XtMSilaF/lMSM30qlnOpZcuBrJajpe4P44mzsFwqWxfrU6EPRfvaepHjAF3VU576GMxGwLCZdT2QjRxkJk9nYmREe6udr1kyR59VRwonPFuDsiCJHIU6/i08PYDjNp1P9DR9RW9n78Y0RMlwErvR/s2As6PN6lqvqvnD4UlyYkWvgiksjqdfC9kz2G7j8s7/CQ0o44AxWLhBSI8PjYhPeqz8fajTD/Bv94B/Kno00a91tTkdGF7OjRFVC/P3HOVq6MJ9NjhnCxem5qSWU4aAmWVuz+0YRgPhXwqQ/paDIl3J/sN9x1p5cH5a/EBC3xsnVhpvGtzay0wVhDWGL+NdcgjTuckcqqm99IWlMjMSUEAYL+k+HXhWxj3ooMiJ1vPTAXqkGALnpRdGF/z5JsustDBk29A3YtgEyqJACZHny81NfVV3/TECHVFtbeH8pTE+ZoHzOf9fQJRTcB3p2SbXI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(2906002)(66476007)(66556008)(7416002)(36756003)(316002)(38100700002)(186003)(44832011)(6506007)(66946007)(91956017)(6486002)(26005)(508600001)(4326008)(76116006)(2616005)(8676002)(8936002)(66446008)(71200400001)(83380400001)(110136005)(64756008)(38070700005)(6512007)(54906003)(5660300002)(86362001)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MfYe1n+A8Wvj1aS71H+qO3lJ5iM2HTHdJj/K8YqNKSEq/SFlGbJs8jmukP?=
 =?iso-8859-1?Q?XwV2+OEYYTU3U5x7ZdQDoNM9xWYCamIV9tVTj6KOcG07uBRodgf8PX+D1l?=
 =?iso-8859-1?Q?tQKiGP9sqheLca57xo6+szqzcee5+EgYqM7dMeZ4n1ZZnm074Wz6ZxcsZe?=
 =?iso-8859-1?Q?eEEps6/48KMFecW14av39Uewfl+ezLI7Q2ArjKHNbr6ZsT7pkGQ8ha2DOW?=
 =?iso-8859-1?Q?3ypq2bb7pplDtnUGRHYgpMlD3OpzA7Pxc9DfhqpKVMjxRe5V2CWZaAd4Wn?=
 =?iso-8859-1?Q?MBM1eE8ayGLqqsZm8EKq2pVQ0/JNI6B66xGWyd9k87QJ4ZVqv8jSFuQq/J?=
 =?iso-8859-1?Q?novM+4q86lg0REWd9174H7mk87sytVIahyUu2G7VRVRchMmtmYhCLYaWMI?=
 =?iso-8859-1?Q?SeQ2AMM8BdRdxbi4Rv/bf9p37dXkvDX5V9HGqtgEY8OtftI+P6EuoNxhAc?=
 =?iso-8859-1?Q?Vp9X3valWb+QUJmzmOl+FDy8hcrrY0BowLEgcnbfQzUsHWyANgwD5oyqcE?=
 =?iso-8859-1?Q?/UfzeNFBEQq2GeYatyAHDQR/eGT7BNe1DNDaluWZvyhEjiPcXicEBWEI2c?=
 =?iso-8859-1?Q?re91y0mcJ8ap9/e9O1xD8UrCVDt4GzaR08232E/JcV4eFELj1DQLyOqpJh?=
 =?iso-8859-1?Q?Vp2Wf9A/6mjxzgxpfH0BbG9DLUWSAqoNLFJHHJaV6PbnFV9ju+ytt1G+VO?=
 =?iso-8859-1?Q?tznHrwBTzA+W1XCvNrMdPfuan+wRv2IQjXe+4Cu0HdLI3xJTYyFBI2r5gg?=
 =?iso-8859-1?Q?9MPN62/XUlhsnIFZVaM1F287k6UJJ54o7Db9gBaIqV5Dsk6kBXRddDdPOI?=
 =?iso-8859-1?Q?NX8+U5fjJBUAuD7NZAtNiDqdsLPRZBIe0LYLRxBgae7xLp/4yQCilTtwBo?=
 =?iso-8859-1?Q?jgiWT1gGIL3kdYtoSfWb3D2cXZZ+UoBfvmywOKW/6vA3alwej23wyyDw50?=
 =?iso-8859-1?Q?p3h74Kj3ujTiha0bmElvDDMoTqzJugJ18P7x30j1i1gmUAr+bPg875kWXC?=
 =?iso-8859-1?Q?IV67430zeimEMuGpYLyg1c6rp/1qMf2UAFlNEo6oat6TElLZOumk/1RwPN?=
 =?iso-8859-1?Q?d+xNnbpNWT+DVJNRo3X74qW8M3UittnmjjJ76bB1SKdl/oS9Pc3QAIZoxS?=
 =?iso-8859-1?Q?3mjCLtp3RU6hED1m7WSSaqEPYpTkL4jx4vWURQJdLV0HT8s2SKxJYgTKVY?=
 =?iso-8859-1?Q?9UgihtyV3FMG4LzjZmdb80d3oTyvQ87qaHn0DQmBiT0NmbAyyP1+R0nCcD?=
 =?iso-8859-1?Q?TqKn+ZcOkm98w9bpyzUIUGhvM9n9Sf0cknxtpPXO5gR0cqHtnr7S0LD3z6?=
 =?iso-8859-1?Q?R7MFP+GyDbWRM6GxyE9BwflO7QLJecfQtqHp8u7WVmG4RuWJTB0EUf6gwL?=
 =?iso-8859-1?Q?9E6q67Q1CMR6KBltZZQfs0L6a9qYAqmgaa7IYGhW1luaX78dUoaxJuK/e6?=
 =?iso-8859-1?Q?O/IYiOcYgmhwQYohKTTUv5qwsIgZitiAGwZcYAExQ4NplUaN49B6VPSe4S?=
 =?iso-8859-1?Q?JUKGhnapPsOGh7vt0wSZFNQ+nJ6sJ/IR5hZ6THS73PvUD0OWD64Bh1wQr/?=
 =?iso-8859-1?Q?leL1micPWhDpUYE42YI8dqETZqwWXUWkuy7xRg2oZ95fKmXPIMsFEnxw6L?=
 =?iso-8859-1?Q?Kbs+gOMufb/3YN2tNO2G6h5nEAS/v5fJzYSV6LBV4jJ1yAcO+sPPxpXX70?=
 =?iso-8859-1?Q?NFTVp5+aCMwsWoy8qucswmXjv+G2LyHHB/PZ8DetYMh39aC2YKqwvbxqyu?=
 =?iso-8859-1?Q?UVQ/l/ue2qlEWr50B8mjhgKV8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf4a557-1798-4890-19a4-08d9c147e7a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:28:02.2337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVvgAu3aAd0aaqrzKZlZk9DyeMfD8Q1qRIqWQaywCE7pi0X0vlm4WotckxdEcj5NDQUBmK7mDX75fNr4BzXTAuyN5PohTWwFglxOJRsLsTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0194
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the generic version of arch_hugetlb_get_unmapped_area()
which is now available at all time.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hugetlb.h |  4 --
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c | 55 --------------------
 arch/powerpc/mm/hugetlbpage.c                |  4 +-
 3 files changed, 1 insertion(+), 62 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hugetlb.h b/arch/powerpc/in=
clude/asm/book3s/64/hugetlb.h
index 12e150e615b7..b37a28f62cf6 100644
--- a/arch/powerpc/include/asm/book3s/64/hugetlb.h
+++ b/arch/powerpc/include/asm/book3s/64/hugetlb.h
@@ -8,10 +8,6 @@
  */
 void radix__flush_hugetlb_page(struct vm_area_struct *vma, unsigned long v=
maddr);
 void radix__local_flush_hugetlb_page(struct vm_area_struct *vma, unsigned =
long vmaddr);
-extern unsigned long
-radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
-				unsigned long len, unsigned long pgoff,
-				unsigned long flags);
=20
 extern void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma=
,
 						unsigned long addr, pte_t *ptep,
diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm=
/book3s64/radix_hugetlbpage.c
index 23d3e08911d3..d2fb776febb4 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -41,61 +41,6 @@ void radix__flush_hugetlb_tlb_range(struct vm_area_struc=
t *vma, unsigned long st
 		radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
 }
=20
-/*
- * A vairant of hugetlb_get_unmapped_area doing topdown search
- * FIXME!! should we do as x86 does or non hugetlb area does ?
- * ie, use topdown or not based on mmap_is_legacy check ?
- */
-unsigned long
-radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
-				unsigned long len, unsigned long pgoff,
-				unsigned long flags)
-{
-	struct mm_struct *mm =3D current->mm;
-	struct vm_area_struct *vma;
-	struct hstate *h =3D hstate_file(file);
-	int fixed =3D (flags & MAP_FIXED);
-	unsigned long high_limit;
-	struct vm_unmapped_area_info info;
-
-	high_limit =3D DEFAULT_MAP_WINDOW;
-	if (addr >=3D high_limit || (fixed && (addr + len > high_limit)))
-		high_limit =3D TASK_SIZE;
-
-	if (len & ~huge_page_mask(h))
-		return -EINVAL;
-	if (len > high_limit)
-		return -ENOMEM;
-
-	if (fixed) {
-		if (addr > high_limit - len)
-			return -ENOMEM;
-		if (prepare_hugepage_range(file, addr, len))
-			return -EINVAL;
-		return addr;
-	}
-
-	if (addr) {
-		addr =3D ALIGN(addr, huge_page_size(h));
-		vma =3D find_vma(mm, addr);
-		if (high_limit - len >=3D addr && addr >=3D mmap_min_addr &&
-		    (!vma || addr + len <=3D vm_start_gap(vma)))
-			return addr;
-	}
-	/*
-	 * We are always doing an topdown search here. Slice code
-	 * does that too.
-	 */
-	info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
-	info.length =3D len;
-	info.low_limit =3D max(PAGE_SIZE, mmap_min_addr);
-	info.high_limit =3D mm->mmap_base + (high_limit - DEFAULT_MAP_WINDOW);
-	info.align_mask =3D PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset =3D 0;
-
-	return vm_unmapped_area(&info);
-}
-
 void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 					 unsigned long addr, pte_t *ptep,
 					 pte_t old_pte, pte_t pte)
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index f18b3a1d18f0..bfd7f4af1e58 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -553,11 +553,9 @@ unsigned long hugetlb_get_unmapped_area(struct file *f=
ile, unsigned long addr,
 					unsigned long len, unsigned long pgoff,
 					unsigned long flags)
 {
-#ifdef CONFIG_PPC_RADIX_MMU
 	if (radix_enabled())
-		return radix__hugetlb_get_unmapped_area(file, addr, len,
+		return generic_hugetlb_get_unmapped_area(file, addr, len,
 						       pgoff, flags);
-#endif
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), 1);
 #endif
--=20
2.33.1
