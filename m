Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E24565B87
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 18:19:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc9x91DZrz3btl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 02:19:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=J3Tm7zzG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=J3Tm7zzG;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc9wS5yhhz3bdM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 02:18:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OaIZbZS8eO4iPkPnlV7Z9+YRb+HEbmihdIPppzUqvgk=; b=J3Tm7zzGSClf8m6gOOHtw7x93I
	A1fHFYCKRhM3rDchyS++ZoN+DKWaQuq2Z4CoeKJaOn7A3EkguPXZ5FJJfzjNwppctjo3OmjuCVG75
	HNi0lK/z87M/ApfSMa9E/L6rJoHqv7u6JbUFpWHZouJgOwsu4SEKkMxR+j7hSRmgmtQ6HkcrfDchg
	06DoAliSmz0EbHRAmtD/gAaYRM9+MZ1JzRT4TtAYKPZIxFCYoMPAPVZWADxKVBNNezpkp1jplIbnu
	IAGC+AmQZreOfKgzWf5r1eupZEcfXd5xqQF4YT2Gn9XjjfByMxOeJ2U7Iw/P9YyGsj8ckwKqpiWih
	+LGZIybA==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8OmR-00HQIz-3E; Mon, 04 Jul 2022 16:18:35 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 140C798005D; Mon,  4 Jul 2022 18:18:33 +0200 (CEST)
Date: Mon, 4 Jul 2022 18:18:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v3 07/12] objtool: Use macros to define arch specific
 reloc types
Message-ID: <YsMS2BImeTG4LrQC@worktop.programming.kicks-ass.net>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-8-sv@linux.ibm.com>
 <YsLLsE2oajICIYmq@hirez.programming.kicks-ass.net>
 <47f7a3db-7b34-1991-11df-f0f7e1317614@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47f7a3db-7b34-1991-11df-f0f7e1317614@csgroup.eu>
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
Cc: "mbenes@suse.cz" <mbenes@suse.cz>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "g@hirez.programming.kicks-ass.net" <g@hirez.programming.kicks-ass.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 04, 2022 at 03:53:50PM +0000, Christophe Leroy wrote:
> 
> 
> Le 04/07/2022 à 13:14, Peter Zijlstra a écrit :
> > On Sat, Jun 25, 2022 at 12:02:33AM +0530, Sathvika Vasireddy wrote:
> >> Make relocation types architecture specific.
> >>
> >> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> >> ---
> >>   tools/objtool/arch/x86/include/arch/elf.h | 2 ++
> >>   tools/objtool/check.c                     | 2 +-
> >>   2 files changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/tools/objtool/arch/x86/include/arch/elf.h b/tools/objtool/arch/x86/include/arch/elf.h
> >> index 69cc4264b28a..ac14987cf687 100644
> >> --- a/tools/objtool/arch/x86/include/arch/elf.h
> >> +++ b/tools/objtool/arch/x86/include/arch/elf.h
> >> @@ -2,5 +2,7 @@
> >>   #define _OBJTOOL_ARCH_ELF
> >>   
> >>   #define R_NONE R_X86_64_NONE
> >> +#define R_ABS64 R_X86_64_64
> >> +#define R_ABS32 R_X86_64_32
> >>   
> >>   #endif /* _OBJTOOL_ARCH_ELF */
> >> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> >> index 98e869721bc4..88f68269860e 100644
> >> --- a/tools/objtool/check.c
> >> +++ b/tools/objtool/check.c
> >> @@ -834,7 +834,7 @@ static int create_mcount_loc_sections(struct objtool_file *file)
> >>   		memset(loc, 0, size);
> >>   
> >>   		if (elf_add_reloc_to_insn(file->elf, sec, idx,
> >> -					  R_X86_64_64,
> >> +					  size == sizeof(u64) ? R_ABS64 : R_ABS32,
> >>   					  insn->sec, insn->offset))
> >>   			return -1;
> >>   
> > 
> > Given cross compiles, should this not also be elf dependent?
> 
> size is elf dependent (From the same series [RFC PATCH v3 03/12] 
> objtool: Use target file class size instead of a compiled constant)
> 
> R_ABS64 and R_ABS32 are defined in the architecture elf.h, and this is 
> the architecture for which you are building your kernel, not the 
> architecture you cross compile on.

Duh. Thanks!
