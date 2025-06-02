Return-Path: <linuxppc-dev+bounces-9069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72366ACA878
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 06:11:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9gQF3dpnz2xdg;
	Mon,  2 Jun 2025 14:11:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748837493;
	cv=none; b=TPhe7AEjEEstA8CsBYZt2BMlMsGiihgcJ+j4amK1l4W1Hu4OBPKsvGdd7/XPkUlBZpK/UWzqMObDPDcjRpCLQQ+9bqyzO4zX8Wu+VfxN8O0hMR18klSDUOTeHp6k+ZrUDZqxtEIjivFElnB8WawhVY0X7c2cx1PfSNDOCDKS242srWFLNZHwooUyRlX9XE9XMGknJjbOyqd/uY5Ga9cwyA/DZ/hNp8AMW3Fug6AmUbuUsdT+o7Y1xgoxJYXqpkjhVARDyZO5GT82DgunUM9DeOhGJV8e1OszcvMmuiecx8uPDsYrjBwc6q3P8jpkxJa8E9TVdbcSV1zZkKwA0Y6UKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748837493; c=relaxed/relaxed;
	bh=iuH08HhCzFKCMOC8/O0swKDH+rpWOadfk7Rm4fI946Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeLX/XXLspPturbFnreJL7ymEnfQmY64dNoZGPsiZ+3xYFHvlfTed1+KjjZs3Fz1TFZFeOPK+E1sCQkpP39iA8rhjVHPaJt/Cr5ajbNg30l9xK9yM8+1Q5FSoiwKH/lBqptolpKjq/2C68jckzBMsK++QFswgpNU1QYey9uOLwaStAfeuUL9IIiswDYGmWcZMYN/3MyXsN+WpB0GrDbbM9PITmchxoAfNco90UxLswWHy69PGRUGkZ6Zw9o9OijuCuYEoBlgXE4C+eE2CS5Y3AO2Sn84/MBOedyIfWjPIx0hFKsayYmHFCiy0tiTcu+QbhxsIH0HCSCFBvZg0osSfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=cDLc7AG1; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=cDLc7AG1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9gQB3hmPz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 14:11:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iuH08HhCzFKCMOC8/O0swKDH+rpWOadfk7Rm4fI946Q=; b=cDLc7AG1xVeGrDIh1peeN0IWEk
	zSPl9poJhEGT0YoB/3XnvH6rSM6bY3xjL0IUqjUntiObN7RMhtlCPHuD3A62GgdK0UEACC5R8vd1k
	nGJkZRQS6J7IpGD5Cac8ckt2eGuQw0ldn0T1SIMMph5HBpFztRTyZBhVmy8+xkbQoA7OwVtDKj3OZ
	76BRcTLzVJZLqbCzOHiBTXoFLI5gsn+T2zZ4MU1RCovTNxA1K7wQ4w3A4hqY1qW3qspeqQLRXJ12A
	qO/+nks1w4qOwDF7mdiodEdOvdFTMW5W0MgrK6eRVtCQ084Z11K100prR+Fy/v0Uyq+f2T84t8Tki
	2y66Yf/A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLwW6-0000000BUl8-1UDJ;
	Mon, 02 Jun 2025 04:11:18 +0000
Date: Mon, 2 Jun 2025 05:11:18 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linmag7@gmail.com, Al Viro <viro@ftp.linux.org.uk>, arnd@arndb.de,
	chris@zankel.net, dinguyen@kernel.org, glaubitz@physik.fu-berlin.de,
	ink@unseen.parts, jcmvbkbc@gmail.com, kees@kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	mattst88@gmail.com, monstr@monstr.eu, richard.henderson@linaro.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Sam James <sam@gentoo.org>
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
Message-ID: <20250602041118.GA2675383@ZenIV>
References: <87cyfejafj.fsf@gentoo.org>
 <87v7rik020.fsf@gentoo.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7rik020.fsf@gentoo.org>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Apr 05, 2025 at 06:09:11PM +0100, Sam James wrote:
> Sam James <sam@gentoo.org> writes:
> 
> > Lovely cleanup and a great suggestion from Al.
> >
> > Reviewed-by: Sam James <sam@gentoo.org>
> >
> > I'd suggest adding a:
> > Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> 
> Al, were you planning on taking this through your tree?

FWIW, I expected it to get sent to Linus as "please, run this
sed script before -rc1" kind of thing, script being something
like

sed -i -e 's/int pte_swp_exclusive/bool pte_swp_exclusive/' \
	`git grep -l 'int pte_swp_exclusive'`

with suggested commit message...  It's absolutely regular and
that kind of tree-wide change is easier handled that way.

	Oh, well...  To restore the context: Magnus had spotted a fun
bug on Alpha back in February - pte_swp_exclusive() there returned
pte_val(pte) & _PAGE_SWP_EXCLUSIVE as int.  The problem is that
_PAGE_SWP_EXCLUSIVE is 1UL<<39 there, with obvious results...

	I looked at the originally posted patch and suggested to
make pte_swp_exclusive() return bool instead of int.  All users
are in explicitly boolean contexts:

include/linux/swapops.h:        if (pte_swp_exclusive(pte))
mm/debug_vm_pgtable.c:  WARN_ON(pte_swp_exclusive(pte));
mm/debug_vm_pgtable.c:  WARN_ON(!pte_swp_exclusive(pte));
mm/debug_vm_pgtable.c:  WARN_ON(pte_swp_exclusive(pte));
mm/internal.h:  if (pte_swp_exclusive(pte))
mm/memory.c:            if (pte_swp_exclusive(orig_pte)) {
mm/memory.c:            exclusive = pte_swp_exclusive(vmf->orig_pte);
mm/swapfile.c:          if (pte_swp_exclusive(old_pte))
mm/userfaultfd.c:               if (!pte_swp_exclusive(orig_src_pte)) {

	Magnus posted patch of that form (see
https://lore.kernel.org/all/20250218175735.19882-2-linmag7@gmail.com/),
got no serious objections and then it went nowhere.

	Bug is real and fairly obvious, fix is entirely mechanical and
affects one line in each asm/pgtable.h out there.  Linus, could you
run that sed script just before -rc1?  Commit message from the patch refered
above looks sane:

mm: pgtable: fix pte_swp_exclusive

Make pte_swp_exclusive return bool instead of int. This will better reflect
how pte_swp_exclusive is actually used in the code. This fixes swap/swapoff
problems on Alpha due pte_swp_exclusive not returning correct values when
_PAGE_SWP_EXCLUSIVE bit resides in upper 32-bits of PTE (like on alpha).

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>


