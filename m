Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B9E750AC3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 16:24:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=v5oh8wZq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1Kkx47CPz3c5r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:24:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=v5oh8wZq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1Kk21pc0z30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 00:24:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uwMQV/RwpcjwXRB/9t5ugIb9Ny9N01YmFUxCFdhWhM4=; b=v5oh8wZqbSywmffQSV8Znini/p
	E1dEpG2qjsfwlVVmyYAD+yIuDOvy1yXy6u+9SW/BMBJOV6yu/FGlzpQenjH7PyDq2vz2I9gF1oc+p
	SZ7KdMRdobqgFZiJeDymChR89S5lfmk/arfoawNErpS2eWyURN6uFjEAtt5WM1iNAt0ya3+FX49wO
	975dwqjMuQJtmKqsgZhLBZ2i6f8aJk5pUXqzzm38AcvB8Irok3P+YmiS1l1VOgmJNllWHjE/U2O6l
	TbSjWWbILkoO4hsXm1+qQvOiSoitSkAm/yW3+PpqHCyOCfWfL0n88pzWvZyiVBmGZdRMo4+qU7oi5
	+KIAD4sA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qJaky-00GlfL-IF; Wed, 12 Jul 2023 14:23:52 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BCA8B3002CE;
	Wed, 12 Jul 2023 16:23:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A6628200D83BC; Wed, 12 Jul 2023 16:23:51 +0200 (CEST)
Date: Wed, 12 Jul 2023 16:23:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 00/15] powerpc/objtool: uaccess validation for PPC32
 (v4)
Message-ID: <20230712142351.GJ3100107@hirez.programming.kicks-ass.net>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689091394.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 06:08:26PM +0200, Christophe Leroy wrote:
> This series adds UACCESS validation for PPC32. It includes
> a dozen of changes to objtool core.
> 
> It applies on top of series "Cleanup/Optimise KUAP (v3)"
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=363368&state=*

That contains:

+static __always_inline void uaccess_begin_32s(unsigned long addr)
+{
+	unsigned long tmp;
+
+	asm volatile(ASM_MMU_FTR_IFSET(
+		"mfsrin %0, %1;"
+		"rlwinm %0, %0, 0, %2;"
+		"mtsrin %0, %1;"
+		"isync", "", %3)
+		: "=&r"(tmp)
+		: "r"(addr), "i"(~SR_KS), "i"(MMU_FTR_KUAP)
+		: "memory");
+}
+
+static __always_inline void uaccess_end_32s(unsigned long addr)
+{
+	unsigned long tmp;
+
+	asm volatile(ASM_MMU_FTR_IFSET(
+		"mfsrin %0, %1;"
+		"oris %0, %0, %2;"
+		"mtsrin %0, %1;"
+		"isync", "", %3)
+		: "=&r"(tmp)
+		: "r"(addr), "i"(SR_KS >> 16), "i"(MMU_FTR_KUAP)
+		: "memory");
+}

And I am a bit puzzled by the isync placement of uaccess_end, should
that not start with the isync, to ensure completion of the uaccess
region before disabling it?

Or is that not the purpose of the isync?

> It is almost mature, performs code analysis for all PPC32.
> 
> In this version objtool switch table lookup has been enhanced to
> handle nested switch tables.
> 
> Most object files are correctly decoded, only a few
> 'unreachable instruction' warnings remain due to more complex
> fonctions which include back and forth jumps or branches.
> 
> It allowed to detect some UACCESS mess in a few files. They've been
> fixed through other patches.
> 
> Changes in v4:
> - Split series in two parts, the powerpc uaccess rework is submitted
> separately, see https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=363368&state=*
> - Support of UACCESS on all PPC32 including book3s/32 which was missing in v3.
> - More elaborated switch tables lookup.
> - Patches 2, 7, 8, 9, 10, 11 are new
> - Patch 11 in series v3 is now removed.

The patches look eminently reasonable to me; Josh, could you please have
a look?
