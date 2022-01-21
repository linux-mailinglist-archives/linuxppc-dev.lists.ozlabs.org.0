Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B4A495C4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:48:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgChl1mg2z3cXs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:48:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::630;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCYv6BBRz3bbQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:42:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX3Z2hTDUI3yohRYTfCpCFfK7ogCvIY3gI8q1zSw1H+X8P8TSM5gjujLrfLNeH5+z9aqdAE9+SjL9M4tZQ1GQA0JUmzhDU80okl6X2dan2w9OOvTZcmkqY/A05Nc+DUuPm6eVETUJZBl0eBlx3OjX9+S0fMHCnbPxJzdt9Zo8N68SRH36nmCN9Q0YX8UINBrbI/FOxxiEse2jZs+CCDFZ+BJgX/d7PWzeYVeHb6y/VlvaUHeS6h3UOpLdmV3SIFklWOqOx0w9jhWINdq7R6Ojl1mfE+g0THKs5ikKjq6OL2OeIyOnFKT4rTTLRyq/rVNvcrCeCZ7KbeQJxhZhYtrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM1tsV2E7+/dx7vpR2aV9rqndz5KU8OyEwLYpGyZ5i4=;
 b=CQ1CdBuwLYnepCl8JOU5k7epgLB2pN7d/Uq0U/6sZJ+RcJHnEuQrY/RUO1SDsvCWDOIDbndyRY43kec4g8EKQ19wNgjTEfr64ydbkiIK8P6HmeD/Tjd56lfyIx6WUHeMzHZ3lRrow4hyogPlifQYRCEI3/UiyBbqey3hZ7v2SkiNoDIx+tWBKdj6DIjRGukqp3uRR11zOjLUDsXXyyaucowAkqDE6tho2c2TBd6ojUMNkjIvFtZ7b9b1Fc6pqDEXmUMdZ7M9+9hDGXuWr0yDl+JuXBW5YlXS52lkT4+1jLW0lxg4Nf088UOXDwLEg6rwIP2i0GvzYFYjBkdWwjLmfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 21 Jan
 2022 08:42:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 12/14] powerpc/mm: Enable full randomisation of memory
 mappings
Thread-Topic: [PATCH v7 12/14] powerpc/mm: Enable full randomisation of memory
 mappings
Thread-Index: AQHYDqLadZ1PUGsqwUCDshHOaCgmUQ==
Date: Fri, 21 Jan 2022 08:42:42 +0000
Message-ID: <675b7946a15dd18d5517bf10a8b49b09142b6c58.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b692418-8b7f-4eb3-2775-08d9dcb9fd6b
x-ms-traffictypediagnostic: PR0P264MB0201:EE_
x-microsoft-antispam-prvs: <PR0P264MB02019714738FB92B0D94AA39ED5B9@PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ajglEGKiaPxsU+ZeacAlUAYW9R/nQfHWTaVNiogMEf88iibxl2nxkm8p725MEf5jsPL2yFPQXDOdmO5N++4ThlaBaY70RK64Qi6RIxzoBGvKCgtZvkhRHxj7A3MfsrlHHIggvtagKkUAStTrZnE1AmshY7ogtZC0puvsq4ok7nA5FFrK2IBCZiCHtKfIKHLG06QcwR6+Hc9plo+9Ct4XGzMU9WwA/NwHjF2wm+lhy4S1TFon9FqsmPdUjPg41Amt/bwe9n1XCxgrWuoBXuaBSWuUzYJvZlMqfFs2GZCE8XI+Rs6X5v45mXpnE/7wmEMe4KHDygW1rX+FyitUS4hEZEP4V/bdAf0ozcI9WAYhCyVi7pqoFfHHYI1Uz1h+A5MjZm7TeW36NvYg/5J5Bm7ANCyLUI6yp9cXtljw9UkPL6Flkd31CU1ClyfAdaBYkfGhkZJcoPBjC/T5KRSh0e3JP3rTDxNOkLIrCi9RiMHmBsJuenbj81qNgUHphRZUEDA5waZiBzl2LPWFD6jKH+aVAS4NJa6GPDlMf+kDh2m0Fz3EgPebYJCECm2m4bc5SMr6fV2tYG7nU511A1AIbN7ktOvHWQuR/sp2G2bemdVDLjbO7BWKNgo0gmvrVdxnNVe5l9Tg8eRb+lb3cBWMBsFQkh9e7wN8muClPF1gQaFybJ9qN+mmvB2ehdyVDjE5u2qDJQFevH0xbUci8GqTqweV0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(91956017)(36756003)(66476007)(2906002)(5660300002)(66946007)(8676002)(6512007)(122000001)(71200400001)(8936002)(83380400001)(66446008)(64756008)(4326008)(66556008)(86362001)(26005)(508600001)(6486002)(54906003)(2616005)(44832011)(38070700005)(6506007)(186003)(38100700002)(7416002)(110136005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+U9d1ltFf/r/v6RWXZGQW5l1JSyZTh+k695dQxkFj8Q5R1vjCIg5axsq9u?=
 =?iso-8859-1?Q?Csy0aSaswxQPGdktasu3gEJ9UQzZ7TTyH1aF9Yv1JpdGREyMAq/YCiWNy1?=
 =?iso-8859-1?Q?iIlNXWyH5YzJ03Us/E9ZuVO/I2FlqStN99nsefDod7rXQXYCbOJ4/D9Hsm?=
 =?iso-8859-1?Q?EOEfH5Nl67x0NqKO3M0TUwWwg0lS/iT+KBwxWLpUiXQVxlflitxAs/KwwI?=
 =?iso-8859-1?Q?gwx4s+EwI/Gk46lnK1nCSudls4+p5rVE912BVx8hbnnhnzq1PfQZH1Sxpm?=
 =?iso-8859-1?Q?VVluetkx3aPhdV12AiqMD/lqKoEV7CoXg9YmqKqncnYG8c1kngmjXcXZOB?=
 =?iso-8859-1?Q?DycW6wDRf3hDGaL80KkJRcqs9sgvi5/irLWa4H2YCwOYvOE3ptlQzihc8c?=
 =?iso-8859-1?Q?bHqCjxLKgziYO30XHwvrVzeJ9fcIZbdEOLNt2ccr32t1InG5gwCVsLiaSk?=
 =?iso-8859-1?Q?7pdUETqYvmFlbyYfar9trrw9ayPMhsfowypfjHPHIPaliOgXmZ3Jvj+V0h?=
 =?iso-8859-1?Q?VmrZgX9DYobWXC/yNAuQASgq5e4c9UHMC87xOW2axOswENcoS5nmzUCV5m?=
 =?iso-8859-1?Q?oX9vpkb9FwACOz0eFXBgWd7SuQvziKcRdYRc9g5vZK3IheEwHmXgMjA8O0?=
 =?iso-8859-1?Q?+DnF+UIwKdv9crQyNdX26tpvjLbWFAqpR5tjuIYGKN7rxn3k4LfG51Rcu7?=
 =?iso-8859-1?Q?Uh75yIbODuuZS2tQ3cwuX3ezzdVHlUZH8PYGrXBfOPt+bI+5Ul/UFI4PzF?=
 =?iso-8859-1?Q?d0b3UqFOWFN4PjM1VyJu6zvKogD2zXc7avEpy+sUMIoYGTgVXqLpzm0Wmw?=
 =?iso-8859-1?Q?jypJTTSa3k+DGQ17Gkk9AMgAOz2MCWio4pHl3JHfaJs1ZUuL6VRrxtrXjf?=
 =?iso-8859-1?Q?Dtm1WUetNramg5TZuUft+lTbuU6dQmGUAHAl6SDlMum2E/q7nARLOvZtIo?=
 =?iso-8859-1?Q?8aeN3d9PDIJJtNWBf1iO3dtvWfH65GoJ1earZZegEHfhV/I/7LPNZV0HRF?=
 =?iso-8859-1?Q?s08vHX5haLZWHp3zCo1XKTUsHujMP+NjC4Z0OArhFe/LGl4NDle7CcZf6q?=
 =?iso-8859-1?Q?xGYdjkKPxRBl2hnHZsNNpl2uD2IyslTRwSAfnTqZfAjumUJQbjFlVj1Fk9?=
 =?iso-8859-1?Q?qKijBqtLkL8fOWTgPUJIs/sosuKd8D3hLWtHp6ERYCr4KgxLO17OEPsK5w?=
 =?iso-8859-1?Q?FADD1ihnrqTKZyqQsb9/WzPuH0Bhe1A/7oLDRYceItJ6DStWEI/nQ2mrx9?=
 =?iso-8859-1?Q?i71FIMp1VXpO73NesmhDQkQFWZIRap1K8NRpwfhveFGN/FbJhS7xwChmAq?=
 =?iso-8859-1?Q?6zAA1LzSriwY8p47jN7u4P0kRBTrE5WNX/Gqhdm99S4v1sLfySs2N32OXN?=
 =?iso-8859-1?Q?W7wHaYJF26zJRIFutfaBRIkApEvGOPgOPBzpxbDOZ7lua2TBvfZCLI8kwW?=
 =?iso-8859-1?Q?ybXBf1NUR2/tHyfZPXP+0hClYxX36GeezgZ0XrfagpuASXd8noSNARUShm?=
 =?iso-8859-1?Q?eFRSsG8Gv2e6pRmhljOXizqbQOMS1vAz+pUwkIeIYp0hg+vVLEYlAN879p?=
 =?iso-8859-1?Q?kCHh5CvgEu7/S1ee4/ekUM7O59E01VlmYdm/cml+0uT7VXWyU2Npmvzi7k?=
 =?iso-8859-1?Q?aRw+5Bhv2AbkZF7vyKtq+E7USV3fK5gEmCTLgPI0JSMYZt3TArWbGFMcDT?=
 =?iso-8859-1?Q?L1GMgfoVnFbJkp+U4N25qJIGVKOgNixKRYZ2eNqQGtg5IF4VzaqoK2Ln48?=
 =?iso-8859-1?Q?2RhTkiZaA/SreLgiyMRB3sJXk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b692418-8b7f-4eb3-2775-08d9dcb9fd6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:42.7885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YKv5QGv2tePGOq2d+ZQPrzd0hoLel+UOfxFUVHCxi0V/lbJKnTWWGWi4kOxxNYW18f+kWSdVLq9X5jEgIiTyB74c6zcQR0qNLeYCqhVy1/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB0201
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

Do like most other architectures and provide randomisation also to
"legacy" memory mappings, by adding the random factor to
mm->mmap_base in arch_pick_mmap_layout().

See commit 8b8addf891de ("x86/mm/32: Enable full randomization on
i386 and X86_32") for all explanations and benefits of that mmap
randomisation.

At the moment, slice_find_area_bottomup() doesn't use mm->mmap_base
but uses the fixed TASK_UNMAPPED_BASE instead.
slice_find_area_bottomup() being used as a fallback to
slice_find_area_topdown(), it can't use mm->mmap_base
directly.

Instead of always using TASK_UNMAPPED_BASE as base address, leave
it to the caller. When called from slice_find_area_topdown()
TASK_UNMAPPED_BASE is used. Otherwise mm->mmap_base is used.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/book3s64/slice.c | 18 +++++++-----------
 arch/powerpc/mm/mmap.c           |  2 +-
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/sl=
ice.c
index 03681042b807..c0b58afb9a47 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -276,20 +276,18 @@ static bool slice_scan_available(unsigned long addr,
 }
=20
 static unsigned long slice_find_area_bottomup(struct mm_struct *mm,
-					      unsigned long len,
+					      unsigned long addr, unsigned long len,
 					      const struct slice_mask *available,
 					      int psize, unsigned long high_limit)
 {
 	int pshift =3D max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
-	unsigned long addr, found, next_end;
+	unsigned long found, next_end;
 	struct vm_unmapped_area_info info;
=20
 	info.flags =3D 0;
 	info.length =3D len;
 	info.align_mask =3D PAGE_MASK & ((1ul << pshift) - 1);
 	info.align_offset =3D 0;
-
-	addr =3D TASK_UNMAPPED_BASE;
 	/*
 	 * Check till the allow max value for this mmap request
 	 */
@@ -322,12 +320,12 @@ static unsigned long slice_find_area_bottomup(struct =
mm_struct *mm,
 }
=20
 static unsigned long slice_find_area_topdown(struct mm_struct *mm,
-					     unsigned long len,
+					     unsigned long addr, unsigned long len,
 					     const struct slice_mask *available,
 					     int psize, unsigned long high_limit)
 {
 	int pshift =3D max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
-	unsigned long addr, found, prev;
+	unsigned long found, prev;
 	struct vm_unmapped_area_info info;
 	unsigned long min_addr =3D max(PAGE_SIZE, mmap_min_addr);
=20
@@ -335,8 +333,6 @@ static unsigned long slice_find_area_topdown(struct mm_=
struct *mm,
 	info.length =3D len;
 	info.align_mask =3D PAGE_MASK & ((1ul << pshift) - 1);
 	info.align_offset =3D 0;
-
-	addr =3D mm->mmap_base;
 	/*
 	 * If we are trying to allocate above DEFAULT_MAP_WINDOW
 	 * Add the different to the mmap_base.
@@ -377,7 +373,7 @@ static unsigned long slice_find_area_topdown(struct mm_=
struct *mm,
 	 * can happen with large stack limits and large mmap()
 	 * allocations.
 	 */
-	return slice_find_area_bottomup(mm, len, available, psize, high_limit);
+	return slice_find_area_bottomup(mm, TASK_UNMAPPED_BASE, len, available, p=
size, high_limit);
 }
=20
=20
@@ -386,9 +382,9 @@ static unsigned long slice_find_area(struct mm_struct *=
mm, unsigned long len,
 				     int topdown, unsigned long high_limit)
 {
 	if (topdown)
-		return slice_find_area_topdown(mm, len, mask, psize, high_limit);
+		return slice_find_area_topdown(mm, mm->mmap_base, len, mask, psize, high=
_limit);
 	else
-		return slice_find_area_bottomup(mm, len, mask, psize, high_limit);
+		return slice_find_area_bottomup(mm, mm->mmap_base, len, mask, psize, hig=
h_limit);
 }
=20
 static inline void slice_copy_mask(struct slice_mask *dst,
diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
index 5972d619d274..d9eae456558a 100644
--- a/arch/powerpc/mm/mmap.c
+++ b/arch/powerpc/mm/mmap.c
@@ -96,7 +96,7 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct r=
limit *rlim_stack)
 	 * bit is set, or if the expected stack growth is unlimited:
 	 */
 	if (mmap_is_legacy(rlim_stack)) {
-		mm->mmap_base =3D TASK_UNMAPPED_BASE;
+		mm->mmap_base =3D TASK_UNMAPPED_BASE + random_factor;
 		mm->get_unmapped_area =3D arch_get_unmapped_area;
 	} else {
 		mm->mmap_base =3D mmap_base(random_factor, rlim_stack);
--=20
2.33.1
