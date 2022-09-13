Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5C5B6F9E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 16:15:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRlpw2rvMz3bly
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 00:15:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lmggLUI8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lmggLUI8;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRlpF698tz2y2F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 00:14:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6sWTHMIaS7c4U7WbLbBKuS0md5EgWarg5ud4NGNcZbk=; b=lmggLUI88QD+f7YFYmE75O1P7N
	G7Q9Yg27Ik3Cq4LkE0BpnsHzL0kAtPBczmImsWssmEDqLCliz0ttqlgQWTjNJhstHCKshN9Sq0gkn
	QOKNi/H5+rWs+hADnDr8ORim2r/bK0Y9p62PvTUWXgx9yl/NbIdZhI6eD2qVVuqHD/NzvaVI99HzE
	Nm5A8Z26keNaZzk3b6Oi0UnSG2AXWgr6Uiuxd42ztZ7S0n+c/p92YlE2Wi+FdeE2qiBeW9nsfKWoU
	dWB3roGJi+g00N30Ryvd6sWkigsh+zSapcNYhCxU2OyVCGby+yI3eMAtPhgA6SaZSpJTogKoLH9lc
	Ob3HHp6Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6fm-00GvrO-Oe; Tue, 13 Sep 2022 14:13:58 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E665930030F;
	Tue, 13 Sep 2022 16:13:52 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C78E2202070C2; Tue, 13 Sep 2022 16:13:52 +0200 (CEST)
Date: Tue, 13 Sep 2022 16:13:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH v3 00/16] objtool: Enable and implement --mcount option
 on powerpc
Message-ID: <YyCQIMHXP9DdvCzo@hirez.programming.kicks-ass.net>
References: <20220912082020.226755-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912082020.226755-1-sv@linux.ibm.com>
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
Cc: aik@ozlabs.ru, chenzhongjin@huawei.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 12, 2022 at 01:50:04PM +0530, Sathvika Vasireddy wrote:
> Christophe Leroy (4):
>   objtool: Fix SEGFAULT
>   objtool: Use target file endianness instead of a compiled constant
>   objtool: Use target file class size instead of a compiled constant

> Sathvika Vasireddy (12):
>   objtool: Add --mnop as an option to --mcount
>   objtool: Read special sections with alts only when specific options are selected
>   objtool: Use macros to define arch specific reloc types
>   objtool: Add arch specific function arch_ftrace_match()
>   objtool/powerpc: Enable objtool to be built on ppc
>   objtool/powerpc: Add --mcount specific implementation

>  tools/objtool/arch/powerpc/Build              |   2 +
>  tools/objtool/arch/powerpc/decode.c           | 101 ++++++++++++++++++
>  .../arch/powerpc/include/arch/cfi_regs.h      |  11 ++
>  tools/objtool/arch/powerpc/include/arch/elf.h |  10 ++
>  .../arch/powerpc/include/arch/special.h       |  21 ++++
>  tools/objtool/arch/powerpc/special.c          |  19 ++++
>  tools/objtool/arch/x86/decode.c               |   5 +
>  tools/objtool/arch/x86/include/arch/elf.h     |   2 +
>  .../arch/x86/include/arch/endianness.h        |   9 --
>  tools/objtool/builtin-check.c                 |  14 +++
>  tools/objtool/check.c                         |  53 ++++-----
>  tools/objtool/elf.c                           |   8 +-
>  tools/objtool/include/objtool/arch.h          |   2 +
>  tools/objtool/include/objtool/builtin.h       |   1 +
>  tools/objtool/include/objtool/elf.h           |   8 ++
>  tools/objtool/include/objtool/endianness.h    |  32 +++---
>  tools/objtool/orc_dump.c                      |  11 +-
>  tools/objtool/orc_gen.c                       |   4 +-
>  tools/objtool/special.c                       |   3 +-

This seems to painlessly merge with the objtool changes I have in
queue.git/call-depth-tracking. After that all I need is the below little
patch to make it to build ppc44x_defconfig + CONFIG_DYNAMIC_FTRACE=y.

So I think these patches can go through the powerpc tree if Michael
wants. Josh you okay with that, or should we do something complicated?

diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index ea2b1968f0ee..8343e2c4cea0 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -24,6 +24,11 @@ bool arch_callee_saved_reg(unsigned char reg)
 	return false;
 }
 
+bool arch_pc_relative_reloc(struct reloc *reloc)
+{
+	exit(-1);
+}
+
 int arch_decode_hint_reg(u8 sp_reg, int *base)
 {
 	exit(-1);
