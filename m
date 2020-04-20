Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735A1B0E57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 16:28:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495TZw2MNMzDqsW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 00:28:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=DnvEUFzS; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495TX94MnszDqbs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 00:26:14 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id w29so8564369qtv.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=x4haHkUujR1fKPz5RIOI82+KmuZk6e+W1yh47eNmIvQ=;
 b=DnvEUFzSch8BOWv/K7yUwrGGEukS5excCJecSvcapVOhdy/OFYe7Y9x1bGe8SeT916
 l1+1chsImNg3ZkGKpfN6ahvWi6toqC2h9IrP5AAGTN0GSjdGn3qsRFRJ+RJKyRIC9tu1
 Dj3ea0wViCiibWw2vLnH2xAQFEOjXLO8KUs1T46qoBzPcqk7/mrvO1+D2/LejHD1ICpo
 KoyvCsqeLxeoDgKdlRyHMBD+KBeYlPJHqA50tfN8jzW6UL/Xp60Ax2PqCOWTXHM9g3GG
 cbNMSaz+pl+PNBKPTXdiSGvlo1iEHh3BDrH71SvZZsVGfYckGoh6BGUSunvfhu/heiMK
 xWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=x4haHkUujR1fKPz5RIOI82+KmuZk6e+W1yh47eNmIvQ=;
 b=MLQr/blGjLtEikrlAT2n1HGiCreGdRG8/CmoOI/TZPEF4JOTKXoJW+lPIZf2ulw1qf
 CtDxHBkItlPZGWYRV4wta96YowdZVpHlFOcbJlROSU0h2UdmtVsulXYoeuWtHQIZ6g6Y
 Brau5uiAkbzk11NZTWfzoZoXbTUK7ROSlx3zVK93C1peJM8OKMItRhwVUfrUit8RYL0w
 F929hIw4maJlkrCZIkGOgt6VncZE7Y3ikETd02pCm/889MjW+torJkicpLsDWaNHVhMw
 BvnGkuNvFvIbtxOxXfBku2s2s/iRv9lc/PxmmNxFjYZqtuqqVTKd08rEIuD1A+tQ44K2
 GrqQ==
X-Gm-Message-State: AGi0PuYSf9X55oriEgXM0fgUgeQv/LHeP0tofXuGFpXI8QRacRBmeMht
 EMgg/pI2wQ2CHc9ZlGMKMUivkg==
X-Google-Smtp-Source: APiQypK9hXIJAT9p6UDuSW0Ke/HoSOO0StxcY8aUeQ8xLhHHYW6L8ucFNnBF0yisbryde+2cyEFxTQ==
X-Received: by 2002:ac8:76da:: with SMTP id q26mr15821003qtr.168.1587392770907; 
 Mon, 20 Apr 2020 07:26:10 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id p1sm665290qkd.23.2020.04.20.07.26.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:26:09 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 15/21] mm: memmap_init: iterate over memblock regions
 rather that check each PFN
From: Qian Cai <cai@lca.pw>
In-Reply-To: <20200412194859.12663-16-rppt@kernel.org>
Date: Mon, 20 Apr 2020 10:26:06 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <CF6E407F-17DC-427C-8203-21979FB882EF@lca.pw>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-16-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
 Baoquan He <bhe@redhat.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Linux-MM <linux-mm@kvack.org>, Vineet Gupta <vgupta@synopsys.com>,
 LKML <linux-kernel@vger.kernel.org>, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Apr 12, 2020, at 3:48 PM, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> From: Baoquan He <bhe@redhat.com>
>=20
> When called during boot the memmap_init_zone() function checks if each =
PFN
> is valid and actually belongs to the node being initialized using
> early_pfn_valid() and early_pfn_in_nid().
>=20
> Each such check may cost up to O(log(n)) where n is the number of =
memory
> banks, so for large amount of memory overall time spent in =
early_pfn*()
> becomes substantial.
>=20
> Since the information is anyway present in memblock, we can iterate =
over
> memblock memory regions in memmap_init() and only call =
memmap_init_zone()
> for PFN ranges that are know to be valid and in the appropriate node.
>=20
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> mm/page_alloc.c | 26 ++++++++++++++++----------
> 1 file changed, 16 insertions(+), 10 deletions(-)
>=20
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 7f6a3081edb8..c43ce8709457 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5995,14 +5995,6 @@ void __meminit memmap_init_zone(unsigned long =
size, int nid, unsigned long zone,
> 		 * function.  They do not exist on hotplugged memory.
> 		 */
> 		if (context =3D=3D MEMMAP_EARLY) {
> -			if (!early_pfn_valid(pfn)) {
> -				pfn =3D next_pfn(pfn);
> -				continue;
> -			}
> -			if (!early_pfn_in_nid(pfn, nid)) {
> -				pfn++;
> -				continue;
> -			}

This causes a compilation warning from Clang,

mm/page_alloc.c:5917:39: warning: unused function 'next_pfn' =
[-Wunused-function]
static inline __meminit unsigned long next_pfn(unsigned long pfn)

This should fix it,

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d469384c9ca7..b48336e20bdc 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5912,23 +5912,6 @@ overlap_memmap_init(unsigned long zone, unsigned =
long *pfn)
 	return false;
 }
=20
-#ifdef CONFIG_SPARSEMEM
-/* Skip PFNs that belong to non-present sections */
-static inline __meminit unsigned long next_pfn(unsigned long pfn)
-{
-	const unsigned long section_nr =3D pfn_to_section_nr(++pfn);
-
-	if (present_section_nr(section_nr))
-		return pfn;
-	return section_nr_to_pfn(next_present_section_nr(section_nr));
-}
-#else
-static inline __meminit unsigned long next_pfn(unsigned long pfn)
-{
-	return pfn++;
-}
-#endif
-
 /*
  * Initially all pages are reserved - free ones are freed
  * up by memblock_free_all() once the early boot process is

> 			if (overlap_memmap_init(zone, &pfn))
> 				continue;
> 			if (defer_init(nid, pfn, end_pfn))
> @@ -6118,9 +6110,23 @@ static void __meminit =
zone_init_free_lists(struct zone *zone)
> }
>=20
> void __meminit __weak memmap_init(unsigned long size, int nid,
> -				  unsigned long zone, unsigned long =
start_pfn)
> +				  unsigned long zone,
> +				  unsigned long range_start_pfn)
> {
> -	memmap_init_zone(size, nid, zone, start_pfn, MEMMAP_EARLY, =
NULL);
> +	unsigned long start_pfn, end_pfn;
> +	unsigned long range_end_pfn =3D range_start_pfn + size;
> +	int i;
> +
> +	for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
> +		start_pfn =3D clamp(start_pfn, range_start_pfn, =
range_end_pfn);
> +		end_pfn =3D clamp(end_pfn, range_start_pfn, =
range_end_pfn);
> +
> +		if (end_pfn > start_pfn) {
> +			size =3D end_pfn - start_pfn;
> +			memmap_init_zone(size, nid, zone, start_pfn,
> +					 MEMMAP_EARLY, NULL);
> +		}
> +	}
> }
>=20
> static int zone_batchsize(struct zone *zone)
> --=20
> 2.25.1
>=20
>=20

