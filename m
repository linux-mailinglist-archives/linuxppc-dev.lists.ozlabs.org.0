Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DD685D02D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 06:58:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2fExemH9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfltd759sz3dhk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 16:58:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+bafd7931fd2c4139f05c+7486+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TflYw0Cy9z3c2K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 16:43:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vQxW7nd7WTaydKIv2J5Y5kbM61+Nggklag6qseDgVeA=; b=2fExemH9AAagfWsJpScQi4fgIL
	MiKDwwjqp+cfhpZ6P1ExyRC9YDKwblxKGnzWf25kmk4iYzoHAKSK1L8x77dZx1ueTo7fuv4EgIuTq
	SUgOzZkc98ORksYE7NcjzjsOrYtGdByWAKx/QmYpiKeRiebJMoeELiG9gX6eQ3eHrY9NrKVap/RO2
	XITlMawFAnTSkVjjtmvRXRNBAmU5GjUwX4XiYYqTXHHoLa9FufhVf/YrnCKka1h9hK6A6NCBYDCY8
	tC1pRusLCBXO2ndInBKT6qapW1Yi2srX9qrkVpXjIkXQ/xZ8H8DVKz5nsS6fAuWcQOkGiHoIwUgjh
	NEmwwwZA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfNq-0000000HEmM-23vn;
	Wed, 21 Feb 2024 05:43:06 +0000
Date: Tue, 20 Feb 2024 21:43:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Maxwell Bland <mbland@motorola.com>
Subject: Re: [PATCH 1/4] mm/vmalloc: allow arch-specific vmalloc_node
 overrides
Message-ID: <ZdWNalbmABYDuFHE@infradead.org>
References: <20240220203256.31153-1-mbland@motorola.com>
 <20240220203256.31153-2-mbland@motorola.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220203256.31153-2-mbland@motorola.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 21 Feb 2024 16:56:45 +1100
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
Cc: mark.rutland@arm.com, linux-efi@vger.kernel.org, david@redhat.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, ast@kernel.org, linux@armlinux.org.uk, linux-mm@kvack.org, ryabinin.a.a@gmail.com, glider@google.com, kasan-dev@googlegroups.com, yonghong.song@linux.dev, wuqiang.matt@bytedance.com, agordeev@linux.ibm.com, vincenzo.frascino@arm.com, will@kernel.org, ardb@kernel.org, michael.christie@oracle.com, quic_nprakash@quicinc.com, linux-arch@vger.kernel.org, hch@infradead.org, gor@linux.ibm.com, daniel@iogearbox.net, mst@redhat.com, john.fastabend@gmail.com, andrii@kernel.org, aneesh.kumar@kernel.org, urezki@gmail.com, linux-arm-kernel@lists.infradead.org, samitolvanen@google.com, zlim.lnx@gmail.com, naveen.n.rao@linux.ibm.com, dennis@kernel.org, borntraeger@linux.ibm.com, cl@linux.com, aou@eecs.berkeley.edu, ryan.roberts@arm.com, arnd@arndb.de, linux-s390@vger.kernel.org, hca@linux.ibm.com, npiggin@gmail.com, kpsingh@kernel.org, meted@linux.ibm.com, quic_pkondeti@quici
 nc.com, paul.walmsley@sifive.com, surenb@google.com, akpm@linux-foundation.org, dvyukov@google.com, andreyknvl@gmail.com, haoluo@google.com, brauner@kernel.org, mjguzik@gmail.com, lstoakes@gmail.com, song@kernel.org, gregkh@linuxfoundation.org, muchun.song@linux.dev, linux-kernel@vger.kernel.org, awheeler@motorola.com, martin.lau@linux.dev, linux-riscv@lists.infradead.org, palmer@dabbelt.com, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, guoren@kernel.org, bpf@vger.kernel.org, rick.p.edgecombe@intel.com, linuxppc-dev@lists.ozlabs.org, sdf@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 20, 2024 at 02:32:53PM -0600, Maxwell Bland wrote:
> Present non-uniform use of __vmalloc_node and __vmalloc_node_range makes
> enforcing appropriate code and data seperation untenable on certain
> microarchitectures, as VMALLOC_START and VMALLOC_END are monolithic
> while the use of the vmalloc interface is non-monolithic: in particular,
> appropriate randomness in ASLR makes it such that code regions must fall
> in some region between VMALLOC_START and VMALLOC_end, but this
> necessitates that code pages are intermingled with data pages, meaning
> code-specific protections, such as arm64's PXNTable, cannot be
> performantly runtime enforced.

That's not actually true.  We have MODULE_START/END to separate them,
which is used by mips only for now.

> 
> The solution to this problem allows architectures to override the
> vmalloc wrapper functions by enforcing that the rest of the kernel does
> not reimplement __vmalloc_node by using __vmalloc_node_range with the
> same parameters as __vmalloc_node or provides a __weak tag to those
> functions using __vmalloc_node_range with parameters repeating those of
> __vmalloc_node.

I'm really not too happy about overriding the functions.  Especially
as the separation is a generally good idea and it would be good to
move everyone (or at least all modern architectures) over to a scheme
like this.
