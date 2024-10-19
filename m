Return-Path: <linuxppc-dev+bounces-2420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965289A4DBC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2024 14:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XW0lx07pqz2xyG;
	Sat, 19 Oct 2024 23:11:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729339868;
	cv=none; b=awDf8jXvvWHb9Q6fAEeychRwDwW4hXNHyM3pkqodskx09D3X84g9K38kXfJMM2UjoHDbOXHOI8gTu5Bzwan2ZrTau3BrdAPoQ6/aGCYFK+mB6y9U76Aj8j5kViAFsfrs016qbfW44kqWKYorALW5k0wszFjS2sBbp0AGFjLb9Gxw+rvjGr97BptBKvxilB/tw5PIKgeTS8HsByC14S/X9Se4hTS2FXlzOqLEaY0Q9bkTxNVuuJyYU2MXZZw8mf/zHx8HKIqvP/3qAHplVzQknQPgvTHFCYcui63PwFlKWREv6LQcOFRvKFTVyaw/9xioENPqdgzcz5oiKSxUdXdpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729339868; c=relaxed/relaxed;
	bh=ewdrroxFiAygB0WZp3b0IKE5tVJl7cLRD8sB4bftnQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YS91GArTGu8ceVkV/Ro7IQqVuj8edWqIaK0zU7dJ35deV1mRy/VQv87AI67VA4y02pYneFGiNinY1Tp/a0b2KOwA8Z1LfetTbzX4pjor1HjYL3GaNhhpwklIrlLQskgzaCdpE+/ppDjPffhLvo+41BbZc+gZD6HKjqXp4DaMwrT5Q4kkxVMwOTYEdLQBwRv6h5o9Hupbqbf+MmrPT+iqQ2o9HWrZm8DpBt7h2uvoCQ6SzRnryeQDKxsn2F97Lpl35klqqKGXXbHo5Ys7dWwzRHKej/zViMx5+lhdy7i6aqzPIM2bi/8Ennz/q97dYYnBZzvd7xHYIGrwhYVxhvQadg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ji+u5mIf; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ji+u5mIf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XW0lv06Jlz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 23:11:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE9435C5C74;
	Sat, 19 Oct 2024 12:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C444C4CEC5;
	Sat, 19 Oct 2024 12:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729339862;
	bh=FSuVpxp8ZC8+I9iOSenx9AlHNi52QSz7zz+w4xwBZFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ji+u5mIf1nBg2Nj6gLisAF5MRqi/wx3vBw5aJxxyqXCZq6i3mNEIjudfG3JajAqFI
	 WJRVPOIUQSQMsfw+JO35XVRk0koV9Zi9I3YAvvjqBLsmrQOq5ay1ac5pdb0lvGGzR1
	 j08uXL+V5r/xzvXwZInMDzkCPiTd8EFrbVzmdTCt/13Ip6ENRmE+El1EXUc14T5/hg
	 fuuSACJI10Sa/jG2tlc11AxV3tkbudw+OnnTaatlKtiS8TlF8dKP0jJBWpV4zxhOjz
	 kxntgxyzd/tCBOSTcO89LQ6Xv/hweCp+LHVMbTjkYPRC9v5XPDgpwR4Gn2FpyhtFiC
	 QsF+azFAwnoMg==
Date: Sat, 19 Oct 2024 15:07:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 6/8] x86/module: prepare module loading for ROX
 allocations of text
Message-ID: <ZxOg5MEXzH4qPq-s@kernel.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-7-rppt@kernel.org>
 <20241016170128.7afeb8b0@gandalf.local.home>
 <20241017101712.5a052712@gandalf.local.home>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017101712.5a052712@gandalf.local.home>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 17, 2024 at 10:17:12AM -0400, Steven Rostedt wrote:
> On Wed, 16 Oct 2024 17:01:28 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > If this is only needed for module load, can we at least still use the
> > text_poke_early() at boot up?
> > 
> >  	if (ftrace_poke_late) {
> >  		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
> > 	} else if (system_state == SYSTEM_BOOTING) {
> > 		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
> >  	} else {
> >  		mutex_lock(&text_mutex);
> >  		text_poke((void *)ip, new_code, MCOUNT_INSN_SIZE);
> >  		mutex_unlock(&text_mutex);
> >  	}
> > 
> > ?
> > 
> > The above if statement looks to slow things down just slightly, but only by
> > 2ms, which is more reasonable.
> 
> I changed the above to this (yes it's a little hacky) and got my 2ms back!
> 
> -- Steve
> 
> DEFINE_STATIC_KEY_TRUE(ftrace_modify_boot);
> 
> static int __init ftrace_boot_init_done(void)
> {
> 	static_branch_disable(&ftrace_modify_boot);
> 	return 0;
> }
> /* Ftrace updates happen before core init */
> core_initcall(ftrace_boot_init_done);

We can also pass mod to ftrace_modify_code_direct() and use that to
distinguish early boot and ftrace_module_init.
With this I get very similar numbers like with the static branch

diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 8da0e66ca22d..859902dd06fc 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -111,17 +111,22 @@ static int ftrace_verify_code(unsigned long ip, const char *old_code)
  */
 static int __ref
 ftrace_modify_code_direct(unsigned long ip, const char *old_code,
-			  const char *new_code)
+			  const char *new_code, struct module *mod)
 {
 	int ret = ftrace_verify_code(ip, old_code);
 	if (ret)
 		return ret;
 
 	/* replace the text with the new text */
-	if (ftrace_poke_late)
+	if (ftrace_poke_late) {
 		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
-	else
+	} else if (!mod) {
 		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
+	} else {
+		mutex_lock(&text_mutex);
+		text_poke((void *)ip, new_code, MCOUNT_INSN_SIZE);
+		mutex_unlock(&text_mutex);
+	}
 	return 0;
 }
 
@@ -142,7 +147,7 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long ad
 	 * just modify the code directly.
 	 */
 	if (addr == MCOUNT_ADDR)
-		return ftrace_modify_code_direct(ip, old, new);
+		return ftrace_modify_code_direct(ip, old, new, mod);
 
 	/*
 	 * x86 overrides ftrace_replace_code -- this function will never be used
@@ -161,7 +166,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	new = ftrace_call_replace(ip, addr);
 
 	/* Should only be called when module is loaded */
-	return ftrace_modify_code_direct(rec->ip, old, new);
+	return ftrace_modify_code_direct(rec->ip, old, new, NULL);
 }
 
 /*
 

-- 
Sincerely yours,
Mike.

