Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7470701A1C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 23:45:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJfLk5Fscz3fLC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 May 2023 07:45:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=WWpjCRsg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=WWpjCRsg;
	dkim-atps=neutral
X-Greylist: delayed 388 seconds by postgrey-1.36 at boromir; Sun, 14 May 2023 07:44:31 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QJfKq4Y28z3bxY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 07:44:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1684014262; i=deller@gmx.de;
	bh=yJRf6LHTP/Tqq0WjA9yc9VAdZA0puqTSbfj+iJUayOI=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WWpjCRsgoadPndEyDMBrDykIPaF53G1UCKLbF6Ehn7Sof3aFBSwW6D/JO3g3nRBiK
	 6QLib4OyP44y2d+/8ysju5kRliyq1yZdGfil5gw5tBNzuaG20YfLWm85G9pRDKUKa3
	 xoQ6YXU/VoH+Ur5qiLzoRrYBqvX2tMB7xzPzScF614h5bD7E5unH1A2wp/qREnUtcQ
	 uvRunN2fI+m8qiXMXXu/hDegJto32RNy0mTDOo3bFLNkfSaH/7HWbmgVi/+6OyyI17
	 MPR4HlqYY5qxIkr/2RJRzK28wNFjG+P0bX0aWXsW9x1ygvQvXaKtevKTMPJIJdhVWh
	 hloepOolRWY7g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.158.250]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdvqW-1qYw4r4BZ0-00b73t; Sat, 13
 May 2023 23:35:32 +0200
Message-ID: <ca4ac780-42b0-4818-bd84-e1a4acbb28dd@gmx.de>
Date: Sat, 13 May 2023 23:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/23] parisc: add pte_unmap() to balance get_ptep()
Content-Language: en-US
To: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <44ebbf90-5fbb-2815-17c7-fcfe3c87d78e@google.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <44ebbf90-5fbb-2815-17c7-fcfe3c87d78e@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:02c5NpapKZ0yND7w0y40kUtQXH+Ybc0bQPzvspvwYlotAB99sF5
 zFBBfNW47FR7ppsIv7ORzd5debot/2bSdnSyGIDtWWm1xzh1QppJDewIoqcOMGEOc5o3++E
 GB7D5SsAuS01JsydFNYGrdMOwh1KtcLiZKmwzv4YnhFPj7aU+qawXM/A52PkJ99vIebL33s
 O5IbJLN5O6SEa/1rmMz5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uDJb8IJ6VOs=;R+hj0fDdQeyjCARXhDgoid9Oajp
 kHLrQjXW/Pxorhy5ogvNxgUlbzs/oW+WoQbYWuFqfo9M/8kiNX2ygi/U0C0cQNL5YdL2QDv9c
 3xfxjyIuDW+7lnrHOYCmgzV28x/Uo3sjcrC9mmmNBYFTDogcZbgBPg27+d6oXvjXftSUAWCtV
 2vD2+nKhodNgtFyzNJccSdn7g6np8nB3kEbVzeLyfApUPiLq2iI6A7JOx8IkesIEj+OkVpKVr
 pMzhkZqY4Lz2DfmOFH6gG3bKc6MXttZmYmK8ZbFqW/A9sxL7B0dy+GPiISvptwTn6KfwZENQN
 kHbyu0E9M/ngSXFWUPtgfVnDfhheB7PXPRA21i9LbU+zfBO6pJcQBDQ2c8o6tbNXTdD5mnFh0
 WcRzilXOKIO5PRPf0MegCrD/1owVMfKRaXDPlfHw5NVSSzuCM1RZMehSwqdtt6AiUEIFrjLj5
 ixGugk6tuic3MVq5/P4th9bt6w72rpFXDsBDgdYfjq78Nl1xM/q53rmYtmMwIIakLGm2B/Zsu
 oMinswUMgtVUmR3AKFHdioT3H4Xq5KV7ARjHNhTZDECLowi+Zdz9M/VIpo0h0pmyo4bLfEnXz
 19gU/ii59qBFJcuYPACTpoq+T+Bcbp04CMPLNsCFU6XxpNS7X3+4bsFIz87WfR2ujfE62fqDf
 4RX0yHQePlodbnxG2ZhmJPKLIJdFYY3XXMmf1BYdFXuXym7z/ScsJCYHkolyJGqUNu5OKhTUp
 xh71saaqgj0fMWYdonNDP9f8i5fMCExGZAV5kpr4iCKgglw2ArYmFg0J+2kuxWVRCM+n1CYsK
 oY4qUU3t5lDdvOnU2yDpApWP5Sj6iaUyV/lbzbMAJQRz9Zv19kzqLwwHaQt0HVaJZoCf6OkfB
 lJJymkFAihgERrNvdwz71SNXq931Bn1yKX+EvweH2Sr1AyNM5BxGyLVijYGFaz4CnYRCjRrGo
 a7S6kw==
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoe
 rfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hugh,

On 5/10/23 06:52, Hugh Dickins wrote:
> To keep balance in future, remember to pte_unmap() after a successful
> get_ptep().  And (we might as well) pretend that flush_cache_pages()
> really needed a map there, to read the pfn before "unmapping".
>
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>   arch/parisc/kernel/cache.c | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
> index 1d3b8bc8a623..b0c969b3a300 100644
> --- a/arch/parisc/kernel/cache.c
> +++ b/arch/parisc/kernel/cache.c
> @@ -425,10 +425,15 @@ void flush_dcache_page(struct page *page)
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
> @@ -560,14 +565,20 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
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
> +		needs_flush =3D pte_needs_flush(*ptep))

^^^^^
One ")" too much and lacks a trailing ";"
Should be:
		needs_flush =3D pte_needs_flush(*ptep);

With that fixed the kernel compiles and boots sucessfully on parisc.

Helge
