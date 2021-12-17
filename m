Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B051B4788D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:29:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlbd48tyz3cBx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:29:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlY35x4Qz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:27:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iB89JXApPwuwCFDgBvf/poPk3XsHOPuJmLHy4v3THlnicUX1+qJP+ioQONgSdwuAhEzgY6efLy7DpNMGu5R1miLbB/nmkV57tci4bsU7tk4NSaXMMmSHT8LipBN/oyxzopiDaPnfVGJVwcNA5yL9nIkZMdz/OizhAXEOKht+SnqpBOP4wLEuFsuSMXMSN98LI9aVwOBYxm1A0WaPW7aa8sq8/iWARp5K33s5MvP9PEkGat9Kt9JA0RL5ABb90FDU3oNUZZKNIACKXmt80JYUTf0DAOsGpTXfKOTP7R1RdUDai4xGyrXfkw86/mK43KYKrhzI9MivKWMtetG1GLoaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGuchkW6gN8DyiSjcCAMN3uQCynPaUaD4ighWhH83D8=;
 b=C4ypQdFeDDhd3tJJCGb2Byx0l4zNja9recLA221xkLXU4J08RLBynCfZwewChZ8/hIRJhSr5bN80eZoSpe0I1yhqAuWmhbuWavTlvQ4WUQq2s852l7cADH0WFVyW8F5K5ChAWh2FiMX3xqXX5VN2bi7WoEAdppTDybyyGLkbGTqSms4BvmEAAjnat9Q1fnyRMkxAizaxrfL5hlEI2P2700t6d1X2Xi482Lvw3a1NGe0AI+tGBQTzZKiLX440depQxb4FeJ/hh72lFGi+2Uf2hB6VuIIuCPRaLJoEJke/hrfHVL3Q0gkNfoFYqd8xSM2KGGQ1tRgi+6Bs1xAhShqL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:27:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:27:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 04/14] mm, hugetlbfs: Allow for "high" userspace addresses
Thread-Topic: [PATCH v6 04/14] mm, hugetlbfs: Allow for "high" userspace
 addresses
Thread-Index: AQHX8zCw1U4oSg0lTUqR0a0vDc8DCQ==
Date: Fri, 17 Dec 2021 10:27:28 +0000
Message-ID: <db238c1ca2d46e33c57328f8d450f2563e92f8c2.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a78978f1-f292-4da2-fb1c-08d9c147d369
x-ms-traffictypediagnostic: MR1P264MB1650:EE_
x-microsoft-antispam-prvs: <MR1P264MB16500614E4441F3611D01306ED789@MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /+kmlVvERmbbsL6d+X62OmM18OEW7mlhR5Gs0qIFUdqX+duVpsLyap/pLCNlaLPdq6+WapP1mpOFhQjzNJa0ZtqLj8m3IiBkIHrpL1fm6nRzClFkmNoi3oCEpqpHTwL85siyj7So4TIAp3f6KOHdmKg+6yjVo1/P/VrOVznT+yvVnJb6nZrYEsq6Wf0+pofBgUaBvEd3jrYyq8jc8mj+jbRedPMAAFagtxtqEgQRKHjNQX6GityqGdZETU1H0L9mduxJHc28SLi13e8LXKRoFutMolRzDrzapd6DlVFCKe+ufKG2r6Eu6CF5Cb4PjwEBU29I/9OkpYezd2YbUD2GYNpf2u3Oy6Ltxh1+XhoRUoMDCNpDTkLdmIMKLn0JxhQ2+YB/YLGO7At8jnCooUx3pK9/J1FLhuTx+kIDYnhCsA8fFZ9C7si6dgpHN/OxHkJWWaYsDj5V1fhL+xpUjcuckzk/UUBuhcJeUPPveqMnpEVSNN5y7Bq7IVNSaBSz7HrTWX6XQnd0upxjs9tEUBJN2aPAJZyh3jrNchkjfDJAByLDfa+AKYJ0UvkF7ngPQJOaXCaYZ7GCh7PqU9zq68b2S8elRYvRZOXWmdMz9YhiImJDP8LEbKp+0Ap7XNbSgpqdp3K3UVkm4Qes/y6E6rVzb6jmXS8QsE7IpSm8VHFk+dUDPL0Q0Y2IaYm40vsR0NTdPCMMo8fKFlTcbWiH6WN3Nw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(2906002)(6486002)(6512007)(8676002)(83380400001)(122000001)(36756003)(6506007)(186003)(86362001)(26005)(38070700005)(44832011)(76116006)(66476007)(64756008)(66556008)(5660300002)(38100700002)(66446008)(2616005)(91956017)(66946007)(4326008)(508600001)(316002)(71200400001)(54906003)(7416002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OT1OVswMaI4vEOeEsTTFAbpvijDWfVCm6MjHbMf87WGhmwpC4R6sXImDk5?=
 =?iso-8859-1?Q?SuOeHbV062Rt8GueHTmUczHSI05G2pcCMpyQQNeEB0uhsGPQVwST9iUS1e?=
 =?iso-8859-1?Q?w59A9dDQobbQIV8RsTHKfDWcgFj2X6Sni/eFiGBCRRMHFpC0RdJmPn76ii?=
 =?iso-8859-1?Q?SF/pmMe3j0GCLuzxnZ27yFf5Rn8UxxU6yGAf2WfdJ6PpQ8H07XNqIAZjwu?=
 =?iso-8859-1?Q?hTO83x287/56vFoE6nY7+QiDnLUHcJGu+8grVrNp6h+I4SH1LYb7NrBzPM?=
 =?iso-8859-1?Q?doJR32HLUERna0UOm/4hoXxulRNdUv3cVXWslvira+9S6hqb9h2WwR0xoh?=
 =?iso-8859-1?Q?0AFp/wUAHIcXmsU1fyU1fo+z61ifDIufttEkTnyibw2My1gDHBS1Jo/734?=
 =?iso-8859-1?Q?nkTG8OGEvX0ao7Fr4dT6faLupwyCBOM4E31MTRv/ZZqhwfZonNiX+gcLhW?=
 =?iso-8859-1?Q?rR6TTCoCPMkKvoP33Oz/gyv8nJfiRZxVrnBQ+SHf2vq0O70fR77QfERCrm?=
 =?iso-8859-1?Q?QSWa8fDhu4nE9iYppRni2JABckddtOkHXlRN79QQB5MeqKn5zamLCDb5GU?=
 =?iso-8859-1?Q?T9j/gO3Krn/Iu6lM62NUH/DDxe/WYI2RE02/vxiLey+8LmXjjlIylj1IEd?=
 =?iso-8859-1?Q?oyxFIiZDmv8051xtZALFpA/jlJ+h6KGKAABlOgDnYS09STMETZpHSxzWaX?=
 =?iso-8859-1?Q?tvPerIkXuk96dEFcOHnecOn+vbqAMiYlGPFcvKM0xNz5LSGWszU2XrsUvB?=
 =?iso-8859-1?Q?t9DVZXLDEhJHdnbqUmSfaXdKTydBeDgmAtOQDEVq/kkwmg/i/kbQxxd9JJ?=
 =?iso-8859-1?Q?LUlbWngrWjbjLNx91f1ZjM3143v2pfMNPrq1Ta9w5q7dbYUjSn2cDDiQdJ?=
 =?iso-8859-1?Q?tw2cjHfJizeuQpQFD1L/HY92NhERRuTxQlOYCz7Mjhu2NjxP6OoNpqqJSU?=
 =?iso-8859-1?Q?Su+NULFkSOOZhRLyy5PKFsfTzwzpwaxB/qgIzRB47y0lcIemJtwbhDhnYd?=
 =?iso-8859-1?Q?xeNicqYVEUrcK5odeXmSVCavr6xQOGiP4oAaAfeK876M4RFtTikxNQLNs0?=
 =?iso-8859-1?Q?BVgqSKYxb3WkJmzpRmtv+2ps2ZLWy65jhLamJUXbX63Gwh/WGeXxmgeOFj?=
 =?iso-8859-1?Q?Awfv7xvbqU+l+wbyM8J9wBb+I46weC9sVvDZH61Xipsd78RBTJudvTWzLh?=
 =?iso-8859-1?Q?g1c4082xohqjmHkazMKyjaATfnRyafQhJsniZMrr+9h3FJZiSZf0jXfNGJ?=
 =?iso-8859-1?Q?SpOuyEVO5+iw0A6ubzYZZmneKL+U2R5r/nwL8sT9b5QSOUe1PzDEafJuc1?=
 =?iso-8859-1?Q?Ke9pxxmYzLeQCoktdqUIKvAY9FKzrdztZEgjUSZVliap/ER3cJbThyXc7Z?=
 =?iso-8859-1?Q?xam868IIGGp0V6g7rd5iAG8kcA32g8jgvomiqvlsxARN+tgILTk1pL1Pv+?=
 =?iso-8859-1?Q?iunsIk2K6U6+zm9zsHs9QyvduFKtLCNHTqyKDQARu7BN3nBfjH0vzu3dee?=
 =?iso-8859-1?Q?OK3aq8H0mLwIQ8Pwt62aaW9/FhNgBwWiYAjN41SZOPx7U72xIpTyN91RL3?=
 =?iso-8859-1?Q?SHkYAoDL4Qsf80RHiPVnRkTubkH72Tu43LhpCBrmqJhim6ScZQSz3fGhuT?=
 =?iso-8859-1?Q?hVwlCV0ntFumRzKLD2AJRMx4TnULy1NOrpLnWq+dtVmC5FHLr4fZIYekTy?=
 =?iso-8859-1?Q?SFUK01G2WpPTMCHSNF4kpyVD2srn+jlF5omRLDOyjjGxnY4EIgxCQQnyh6?=
 =?iso-8859-1?Q?VMtn6LW6OCnlw2nlkmBoNIQh4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a78978f1-f292-4da2-fb1c-08d9c147d369
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:27:28.2944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s3WIFI/tuDHH+/EAa8AyKUz+El75Yb4VJfHu8icu90uRrU1PSb6itzvlyoxtT/tK6KwIrsu0lh92DBo2bSg+LxJ+UFs2teNCrHRx9crF+2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1650
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
Cc: "will@kernel.org" <will@kernel.org>, Steve Capper <steve.capper@arm.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a complement of f6795053dac8 ("mm: mmap: Allow for "high"
userspace addresses") for hugetlb.

This patch adds support for "high" userspace addresses that are
optionally supported on the system and have to be requested via a hint
mechanism ("high" addr parameter to mmap).

Architectures such as powerpc and x86 achieve this by making changes to
their architectural versions of hugetlb_get_unmapped_area() function.
However, arm64 uses the generic version of that function.

So take into account arch_get_mmap_base() and arch_get_mmap_end() in
hugetlb_get_unmapped_area(). To allow that, move those two macros
out of mm/mmap.c into include/linux/sched/mm.h

If these macros are not defined in architectural code then they default
to (TASK_SIZE) and (base) so should not introduce any behavioural
changes to architectures that do not define them.

For the time being, only ARM64 is affected by this change.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 fs/hugetlbfs/inode.c     | 9 +++++----
 include/linux/sched/mm.h | 8 ++++++++
 mm/mmap.c                | 8 --------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index c7cde4e5924d..a8d3b0899b60 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -205,7 +205,7 @@ hugetlb_get_unmapped_area_bottomup(struct file *file, u=
nsigned long addr,
 	info.flags =3D 0;
 	info.length =3D len;
 	info.low_limit =3D current->mm->mmap_base;
-	info.high_limit =3D TASK_SIZE;
+	info.high_limit =3D arch_get_mmap_end(addr, len, flags);
 	info.align_mask =3D PAGE_MASK & ~huge_page_mask(h);
 	info.align_offset =3D 0;
 	return vm_unmapped_area(&info);
@@ -221,7 +221,7 @@ hugetlb_get_unmapped_area_topdown(struct file *file, un=
signed long addr,
 	info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
 	info.length =3D len;
 	info.low_limit =3D max(PAGE_SIZE, mmap_min_addr);
-	info.high_limit =3D current->mm->mmap_base;
+	info.high_limit =3D arch_get_mmap_base(addr, current->mm->mmap_base);
 	info.align_mask =3D PAGE_MASK & ~huge_page_mask(h);
 	info.align_offset =3D 0;
 	addr =3D vm_unmapped_area(&info);
@@ -236,7 +236,7 @@ hugetlb_get_unmapped_area_topdown(struct file *file, un=
signed long addr,
 		VM_BUG_ON(addr !=3D -ENOMEM);
 		info.flags =3D 0;
 		info.low_limit =3D current->mm->mmap_base;
-		info.high_limit =3D TASK_SIZE;
+		info.high_limit =3D arch_get_mmap_end(addr, len, flags);
 		addr =3D vm_unmapped_area(&info);
 	}
=20
@@ -251,6 +251,7 @@ generic_hugetlb_get_unmapped_area(struct file *file, un=
signed long addr,
 	struct mm_struct *mm =3D current->mm;
 	struct vm_area_struct *vma;
 	struct hstate *h =3D hstate_file(file);
+	const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, flags);
=20
 	if (len & ~huge_page_mask(h))
 		return -EINVAL;
@@ -266,7 +267,7 @@ generic_hugetlb_get_unmapped_area(struct file *file, un=
signed long addr,
 	if (addr) {
 		addr =3D ALIGN(addr, huge_page_size(h));
 		vma =3D find_vma(mm, addr);
-		if (TASK_SIZE - len >=3D addr &&
+		if (mmap_end - len >=3D addr &&
 		    (!vma || addr + len <=3D vm_start_gap(vma)))
 			return addr;
 	}
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 2584f7c13f69..cc9d80bd36d5 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -135,6 +135,14 @@ static inline void mm_update_next_owner(struct mm_stru=
ct *mm)
 #endif /* CONFIG_MEMCG */
=20
 #ifdef CONFIG_MMU
+#ifndef arch_get_mmap_end
+#define arch_get_mmap_end(addr, len, flags)	(TASK_SIZE)
+#endif
+
+#ifndef arch_get_mmap_base
+#define arch_get_mmap_base(addr, base) (base)
+#endif
+
 extern void arch_pick_mmap_layout(struct mm_struct *mm,
 				  struct rlimit *rlim_stack);
 extern unsigned long
diff --git a/mm/mmap.c b/mm/mmap.c
index ad48f7af7511..c773b5ad9a11 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2112,14 +2112,6 @@ unsigned long vm_unmapped_area(struct vm_unmapped_ar=
ea_info *info)
 	return addr;
 }
=20
-#ifndef arch_get_mmap_end
-#define arch_get_mmap_end(addr, len, flags)	(TASK_SIZE)
-#endif
-
-#ifndef arch_get_mmap_base
-#define arch_get_mmap_base(addr, base) (base)
-#endif
-
 /* Get an address range which is currently unmapped.
  * For shmat() with addr=3D0.
  *
--=20
2.33.1
