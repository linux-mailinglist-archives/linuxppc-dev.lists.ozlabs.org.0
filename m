Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 131AF734AD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 06:04:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=S+n1mlEn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qkx3Y6RwGz30Py
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 14:04:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=S+n1mlEn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 368 seconds by postgrey-1.37 at boromir; Mon, 19 Jun 2023 14:03:38 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qkx2f0Spcz3003
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 14:03:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1687147409; x=1687752209; i=deller@gmx.de;
 bh=2fndrLIH+tdYpXaN3a+B2+gpkPc6UJVTkZbYPRfVVB8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=S+n1mlEn+XxQuCnwTZJXV5Hbf3zQDUhey+VPucONnHTs/JXrG4Z6wWrUIQfTOlhnBLDkX6F
 jQAcLNZUWkpO6BtpROl1G6x4o+7njsUqhrzygtz5po6rQfsLKbHxQd54ZdBYcLtMeq2sxpPgn
 AF5GsAX4guX8b1OeXBiFsS4R34xZCx3mmz5UQDnpe5jUIuNWGLaVRmROjpO2NOOu4wPNQFItg
 LHJpQPJOB0xrVlN3j7Um3hfJg15twk7+gUMflKa9V4KtLQDw0Vd1QfdK3NaE8lzF7yjQREiik
 Wsn7ZqLZnLbfYSBUSRy6DCkwN4O29P+fyVismbSckpij3WVo/vFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.148.114]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My36N-1ptYsd3hol-00zXMS; Mon, 19
 Jun 2023 05:55:49 +0200
Message-ID: <2f5a3805-b7a5-1c45-e5a4-e273ea289ba6@gmx.de>
Date: Mon, 19 Jun 2023 05:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/23] parisc: add pte_unmap() to balance get_ptep()
Content-Language: en-US
To: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
 <653369-95ef-acd2-d6ea-e95f5a997493@google.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <653369-95ef-acd2-d6ea-e95f5a997493@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E3xdg5CpQcjOoKW8Y56OwqWPK69wZz6OC3pXUq5sC4koD4vx6TE
 8yx7mlAVEcBGQCbXtdVKp5UUdnr/61/KwgdLsdsCeafoXWrwMUBr6cWiQIGAUgINT3sBkXj
 YUQ+i02IXhG0ZBE1C7Dv9zl3aVQVXzwfFiVekkVC97MGOBsK+OwPv4gKZzvDYcrI9sx6vlb
 RKMhNKB17Raa0wGb+9IJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SavJJQrSETc=;Q4+Mohq9kiLPuqyetAufSsyFlS5
 hTZh9UY3ApX0rs9wXmBDeDsu5U24lMRvmGlXtPpGRAMil4yH2XAj0xs4blHQiY0pOUfNPA1s1
 G0wDYx1set9NyYE5oCEoGY8RKuf/S60hXwMUAl/ZM37AHhK+LKYuFIhzG1VjQqtdnZrSqmd6z
 CImKzn1TU7In5a5QOsHiDAlufEyc2odKlKwMMvOWb+92Pf8ggacXMEYEVuAVDqx8WFvSAANkP
 zJ5oEA1OEMrgTrJl0RPgvlPPxB7mqh6cmgVNsYC9tJjWWiiEWS5c6P5QloM8XGzR1DYg1W0u3
 dul9zuMbEZTrUG6G5hDpUhyiEsTk4Czd7JISqAtSkYAhrAjCGdAmnN1O/rZNJTCF53Ek2J3t4
 tT1rs6gKpXYrr1euxxGt6y4EKPMdorQkedT23yVCDZ0MHUAyJ+tRLR/3iysGvrqFSal+vQAJF
 V0AybLgmsqTSnYMqsFcXP+QxZs0uzsesZtbmQ9bBqT1yZ+PgdI7xfRRxhtzanthx/ZIHManEg
 ZP9gOdIKaY5ievySnRJkVlI58IGdsesN5qfHYEOQnzwcCZ8EGDwMPYMIy1unlQI+IzPp2PKqD
 NbbapvRr8uYx/8ZLLl+KWnPK8AnJxY+B+pcojhuoP2njwZuI8sLl60m6Qz5TwwJ3dgMyj8gYI
 Iy2+PlD7CH4ux6d8QIWuHt4o7BXGPnE5ZFA4/tMUzDrkwfDbTbWfXgi5Cyw2KuLZOdAtfP0qZ
 vHZPyn1qql77t6GDiNKx5L4d25bO8t41GMe3u8ZYU1ez28wyfem+OJqnuSox095Si6LrtSlMN
 lY5CmlLFGBwSmss5JVTZV2QNPuG94YkAfLZ2PXf5uLQInaqqmNIGeVUxs1q81p9jLtIeWAJob
 1ib7BIAZezgiyknuRrfbQZcpjJjticXOwBgCHJ5PWya5I9PQJmVwjhksTbUPwyI5QosWZ/6qJ
 LNGErqwzSGoLLq0QKi9RKKodGVs=
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/8/23 21:18, Hugh Dickins wrote:
> To keep balance in future, remember to pte_unmap() after a successful
> get_ptep().  And act as if flush_cache_pages() really needs a map there,
> to read the pfn before "unmapping", to be sure page table is not removed=
.
>
> Signed-off-by: Hugh Dickins <hughd@google.com>

For the parisc parts:

Acked-by: Helge Deller <deller@gmx.de> # parisc

Helge


> ---
>   arch/parisc/kernel/cache.c | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index ca4a302d4365..501160250bb7 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -426,10 +426,15 @@ void flush_dcache_page(struct page *page)
>   		offset =3D (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
>   		addr =3D mpnt->vm_start + offset;
>   		if (parisc_requires_coherency()) {
> +			bool needs_flush =3D false;
>   			pte_t *ptep;
>
>   			ptep =3D get_ptep(mpnt->vm_mm, addr);
> -			if (ptep && pte_needs_flush(*ptep))
> +			if (ptep) {
> +				needs_flush =3D pte_needs_flush(*ptep);
> +				pte_unmap(ptep);
> +			}
> +			if (needs_flush)
>   				flush_user_cache_page(mpnt, addr);
>   		} else {
>   			/*
> @@ -561,14 +566,20 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
>   static void flush_cache_page_if_present(struct vm_area_struct *vma,
>   	unsigned long vmaddr, unsigned long pfn)
>   {
> -	pte_t *ptep =3D get_ptep(vma->vm_mm, vmaddr);
> +	bool needs_flush =3D false;
> +	pte_t *ptep;
>
>   	/*
>   	 * The pte check is racy and sometimes the flush will trigger
>   	 * a non-access TLB miss. Hopefully, the page has already been
>   	 * flushed.
>   	 */
> -	if (ptep && pte_needs_flush(*ptep))
> +	ptep =3D get_ptep(vma->vm_mm, vmaddr);
> +	if (ptep) {
> +		needs_flush =3D pte_needs_flush(*ptep);
> +		pte_unmap(ptep);
> +	}
> +	if (needs_flush)
>   		flush_cache_page(vma, vmaddr, pfn);
>   }
>
> @@ -635,17 +646,22 @@ static void flush_cache_pages(struct vm_area_struc=
t *vma, unsigned long start, u
>   	pte_t *ptep;
>
>   	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE) {
> +		bool needs_flush =3D false;
>   		/*
>   		 * The vma can contain pages that aren't present. Although
>   		 * the pte search is expensive, we need the pte to find the
>   		 * page pfn and to check whether the page should be flushed.
>   		 */
>   		ptep =3D get_ptep(vma->vm_mm, addr);
> -		if (ptep && pte_needs_flush(*ptep)) {
> +		if (ptep) {
> +			needs_flush =3D pte_needs_flush(*ptep);
> +			pfn =3D pte_pfn(*ptep);
> +			pte_unmap(ptep);
> +		}
> +		if (needs_flush) {
>   			if (parisc_requires_coherency()) {
>   				flush_user_cache_page(vma, addr);
>   			} else {
> -				pfn =3D pte_pfn(*ptep);
>   				if (WARN_ON(!pfn_valid(pfn)))
>   					return;
>   				__flush_cache_page(vma, addr, PFN_PHYS(pfn));

