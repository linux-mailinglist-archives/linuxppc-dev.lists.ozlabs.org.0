Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E5246D992
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:21:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8P8m3DTNz3djM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:21:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::620;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e18::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8P5g4dB0z2ywV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:18:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXQ07BPQIzctfRriOILSBHTNtccHh7oJJWGsIwELrgdG8VckWzyGdyBDcKIVP9mJ+diAeP0sh8zIcpishBMK+eWmutElTY5ihBsnoyDpV5kNT8v3Hmp3lS6YPgewvLDTQz4viDgefyGa+olvFVLR1VGVRtaO8k56qf1ZBwMan+IUoSA516+LqbQSjzqkf+EHpJZSl/zlXQh/s1KIKNyw9JxMT2CXyPnB8oR4HxWkNqpTTMkQ4az8cYVSZ1gYOVJ3yCa1uKlNTxcxZPm6VyOJilHPUjkYsRw68fb0mcnAe4g1ppZO5NFvP3FpP8n2Ndpm2LOWlgBnt4psWd0BCsC29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao0J4RtTmJCD5YE4NNN5icIYyoHVg3j5QWKaKWYo9c4=;
 b=ZxMCDJZDZK+OFK6s/tQmHWQ8daKJjvWv4/7QgTl+yjCMEw9Gi91eSN+o9rHn+u2CUVu6RsuHgd/D/VmyTSjfpFWwHlK/zDkYNVq12MGN3oSIFcBISdIH91ATw8Er6mBaO5vRYuefWiIPxmt9E8VKLWZc1mGob3pvPZKAgSjAJpf+tZnKkic0dbvS7FOwFeIk0S3ffIjquJCk4fgdD3iPYZxMSxgez2+HXyjoMEYWqlkJ1YeR7AJGere30WTK4FIDdJbiQs7ShDPKlD5Zwn+gH7MtjgmajzO+EGeVIP4Gzy52XQpFkUfQxsaOuk9hcOePPfxSwSBxjKkQKHdENn6raA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0823.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:16::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 17:18:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:18:21 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v4 07/10] powerpc/mm: Use generic_hugetlb_get_unmapped_area()
Thread-Topic: [PATCH v4 07/10] powerpc/mm: Use
 generic_hugetlb_get_unmapped_area()
Thread-Index: AQHX7FeZBU3PIhmcjU6PaLYrRJLsxw==
Date: Wed, 8 Dec 2021 17:18:21 +0000
Message-ID: <f292a83707b64c73fcb02a8708f18f09422f7eea.1638976229.git.christophe.leroy@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1638976228.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff5e2005-5a3c-42ce-b49c-08d9ba6ebc14
x-ms-traffictypediagnostic: MRXP264MB0823:EE_
x-microsoft-antispam-prvs: <MRXP264MB08235360AAE73626ABA01C89ED6F9@MRXP264MB0823.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:246;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ExWAxiY53R56YevK/yj6EVxnp+QEMSy4RxyRNfqmyx41kIRbiqtnFs9x3k/W1Y9yYGR82v3qHfrZagHPY0m1dMo3HNhfN7jjjWIb7834EOTFbBbhGUZY4EGsknqodsXjUiw2U1LE/UH9ajQJ2F3XPBtO1RrXh/9w3NhbGBK/jlH5XZczDtruDR+miWWX+jcLw5wij+jOKUldPEMVDKHFEspb/LVtLolgWYATl39IOxgScditxLp2PqtDCB8NZTuPDnD37bzk24DhJHF6RSH/He46iy4X3Pqe6bNh61L74WbbFFqPSUS3lPtL6pw+3pO22RuG6Qg91L62DnBrBj9NpYJB2mQgNjix6Ztt670SPYwvkHxCL3PgavoRBEG/eR25/rHajE/6kYZauTOEvw5xEMKuKZFrZiEjKvqvr1Nu7Q8t8X7dmJ1ZRhY1H5HRk96ISbHn9fc+qTfC/z3+DJB2mc/ex1BlWerJY8curKspSF1nitdCdTadVsi4XacGxeNGsyDjwST98qa0z6SDBQgL8ok6ywdQJ/kOWzywmw9vQKnByRzAdW1AhBwwRqAXTmrJlXTzKzjD1RA6VVXXIfM9/FwHkitXMyNWfDLO+HSme8EAY3qWzF/cxRozaWbKHYQVd3ax4DDFFgkQ1ieEXNW8vzAnNUS8zQs1mevFObyRjT4an1asRFoWEBzVIqQCv6aSzmjGDDTPYtvVx5BczqiWh/SCEjPhS99ei5VuStU5/f4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(316002)(83380400001)(6486002)(2906002)(36756003)(26005)(110136005)(64756008)(91956017)(66946007)(8676002)(54906003)(86362001)(44832011)(76116006)(6506007)(66476007)(66556008)(6512007)(5660300002)(508600001)(38100700002)(2616005)(66446008)(71200400001)(122000001)(186003)(8936002)(38070700005)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GsWeB5eHVHtNsvtUU1nfvOvcZ3nmAsXU4bqxKOufQmPNQU2Ojnig+okt8a?=
 =?iso-8859-1?Q?J+oDvw1gO7u8q0FlR+mYnMpcu6pOG5tndglA0enV+YuwYQi8cQxO4W18kH?=
 =?iso-8859-1?Q?FsmMLwhnymuHbYAdauxq+hV63L+/triT4wGP1JTOhtmvYZJZB/zAV/IMu6?=
 =?iso-8859-1?Q?gNTIrMxb771EFmL+QcS7GvLdryrGGfkKyEScBnh7RUoFWfth0xQ+ITwF9m?=
 =?iso-8859-1?Q?azBjBLz6qAbqP4R6Fizg3ROyQeasUk1yNGbrtLazngFYBFT6Bh//HMmHct?=
 =?iso-8859-1?Q?J1158Z6NhX8LOwQV3SEnhD2BRY1yoMpPUsHyK6mbAqtXZGLwpwoUg8Tw9r?=
 =?iso-8859-1?Q?FRNrCbakNFU2stridP7n7aHOpVp6ELoqXJmL8F6yt4jjzsDSAqh1Nbs4Hm?=
 =?iso-8859-1?Q?s6hAVkySwxQGGSeeRNh9n+BmnQHh9OZB3Y8IgFFvOAYvBaZCciXxL6vKEf?=
 =?iso-8859-1?Q?IIsggsRy18PaX1xImXuNhLABQVeFoQkH10udUJysvZx8p2jUmnH4MIWPl4?=
 =?iso-8859-1?Q?TB0FNGs9wgnENWsD4TrDv4j1oiVDT1fnOrU4WvsEda/CfkdTlN+ZTPABew?=
 =?iso-8859-1?Q?Llq3o8z4XYvCADKHnxPzdjlnYe4uI7x3k/DRFG4RfC/i+rLOtaLg4Ibjv4?=
 =?iso-8859-1?Q?teygMYuJck1kPnjGCU/ZtERBX8KN6g2CKtDHKrfyBy4kEV5Xpc8mGVInrx?=
 =?iso-8859-1?Q?ZF87AfnLBZY5SucL2DmXbUqjmetkz3XnZSuLtOj2eYCSOxOhAu/ZBIjXyp?=
 =?iso-8859-1?Q?fP7lkzp7WWjlLD/If8u+vX8+4j6Sj2F7zb1mDAQoXVl83VwkCUmZuEDQ2z?=
 =?iso-8859-1?Q?P2v25AkQOiyELoX4HP2Xy6QFDn7sy++U1NoxsDfGqz4933zXLsTn7858MD?=
 =?iso-8859-1?Q?/+tPkXJU6GGavfDOBwmHF8+15CFOOE663QIPC9uW3BlmHnDDm6JriiOtCD?=
 =?iso-8859-1?Q?4fZJ/hp82pKuvhIYovS1H1saGQc4WJHPhWshIyBeJCEGjRPBYtToB+IIdC?=
 =?iso-8859-1?Q?r2e9euwHJQjA3+CyBpyOvrvdUsJMXmszmPOkNdCOlgqnioPKgzObvb7yKB?=
 =?iso-8859-1?Q?het+n1G7vupiokrtoDwtSSDk0jdnpN0+2xDW5hYahmVCLXUeU96zNXuF0V?=
 =?iso-8859-1?Q?ZtujVeuNemi7vDl9I+TbWdwBsb+f+8UudNqFP2Y+isWmdPp4+QTE9C2+jG?=
 =?iso-8859-1?Q?RGqA5pRRIt7gpbEoLVodo2JAySNopO3V0t/gsouZWajjGhyEgIQqXViDEo?=
 =?iso-8859-1?Q?qCEEXEz4nYXTbYZeKyq757nbnNcsAQszZ8yMDlnx0yiBMPv/AhD1ougGdR?=
 =?iso-8859-1?Q?IUR3l74P/fbWV33I/4P8TsVMFUFIG77RUyqler3VQi8u0JJOjavWpjd+an?=
 =?iso-8859-1?Q?LjTiZHpMbosfV2wQu42+Sd9GdZNkp3Pi0hauAgcQ2F1LKHKij2nSV16FvA?=
 =?iso-8859-1?Q?Eq+Ykr2r+b+NyeuuK4XDaNV1xMebrs+eSBzLEXmsUzfvL8AelMCn3RmioR?=
 =?iso-8859-1?Q?/tElXvmphUT/zJoFwyKQ/p4o7PsfBZ9O2sAi0rVeUQGy6xdG3WAuaXSmbI?=
 =?iso-8859-1?Q?z70dCyhuWdJ1ALHNqRrEo3ebbCmf5YanKDNQKb1LeCjbqvWFy52dKEGBcr?=
 =?iso-8859-1?Q?yuwOEQCSHHyKp+SUaAIuh+awsLj4NY3m5TeZ/e2mf7O1PkoDL4nGgHd0nh?=
 =?iso-8859-1?Q?pFEwgjgq+CuyksVS8EV1Yo6/98+Vj6KuYBTInoN9eM9TcYMxRE0C3hoUOT?=
 =?iso-8859-1?Q?OTouQR36ZCmgCO9CIcLSI1RR0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5e2005-5a3c-42ce-b49c-08d9ba6ebc14
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:18:21.3621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hl8L5xWVcyA90pSVLxWuQAxMzFUVIlh52aZ07+ZOmmbamyJylFl5J9EI3/qLtvy0MMrZ/CuEMwURzcybiyJ1ufU+G8Y1k/FngaydwX5iWag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0823
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
