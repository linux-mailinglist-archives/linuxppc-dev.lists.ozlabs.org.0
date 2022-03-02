Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAB24C9D20
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 06:23:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7jFp0hqPz3c24
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 16:23:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lWhC32dA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7jF844lrz30Jk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 16:23:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lWhC32dA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7jF46rSmz4xRC;
 Wed,  2 Mar 2022 16:23:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646198587;
 bh=EW7h6GpdaDNbwZGHiZAaI3MdXFwBu2xEgtf+Ok1PZlA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lWhC32dAUg9E3iB13asSEl3IGZdK/c28/Ypzl2ddkzEYQ3djbYgWlSP3RyJhpm5Na
 6qopH8SJWhUAcDxKZHVagvJoSIHYAL4wLxhu95pHGQSKM9mi+uqCLIDS48jN2SCDr8
 3hW1xyBgxsMtocUFA6uizbi9419Ant/1MjMx8tlYLZfUCZ6xeurWURO+6ZM4F85NEb
 XIbzne9+sy6yQbCkbNp0yFSeKJEoh6kBSZkPqvm9y4RngtUzavUWU8gPBqd3K3fTkW
 Seaz2Wd9JXTkWB5MzPd1wTj1GT7JiQk11vWz+fU7pXT7m04tdpff9zfHDEBHGpyTac
 +s8dkQbww3zeg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Subject: Re: [PATCH V3 04/30] powerpc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
In-Reply-To: <1646045273-9343-5-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-5-git-send-email-anshuman.khandual@arm.com>
Date: Wed, 02 Mar 2022 16:23:02 +1100
Message-ID: <87k0ddnd1l.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual <anshuman.khandual@arm.com> writes:
> This defines and exports a platform specific custom vm_get_page_prot() via
> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> macros can be dropped which are no longer needed. While here, this also
> localizes arch_vm_get_page_prot() as powerpc_vm_get_page_prot() and moves
> it near vm_get_page_prot().
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/powerpc/Kconfig               |  1 +
>  arch/powerpc/include/asm/mman.h    | 12 ------
>  arch/powerpc/include/asm/pgtable.h | 19 ----------
>  arch/powerpc/mm/mmap.c             | 59 ++++++++++++++++++++++++++++++
>  4 files changed, 60 insertions(+), 31 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
