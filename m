Return-Path: <linuxppc-dev+bounces-3422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 234799D1842
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 19:40:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsbzR0L1dz3bhC;
	Tue, 19 Nov 2024 05:40:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731955234;
	cv=none; b=F5CU62RVxOFyCRaeV20bw2KXcTShnp+PP+rIG2Eg6lf797y78yg8kIRx/T/lYAJ/5Cz6Qo0S0h/b9sYk8KPRspS/+1STbM1dsXHvPfLIVWSiJO4xuLUmLDvN1eCOJfLHiyHwDxEesuBoBU/FQP+GXe/0jkGWGtivxJfICX4D2fhoKehoEBPYsn89Hxj4Fj4ERbPyAtml+8kGLS19gTc/0Zxum7nMu3NFeTRJvBm+7+QnA66bmFD20VBjMw+d0ooS65L/LvaPDb1qzodF82xmPNsq75ruKj7b82lpFOTzluCCVOEitz8sFRgOEZXregmdU1Q8MYCdzWZqz7w3VXlo4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731955234; c=relaxed/relaxed;
	bh=Zos79WCy1/02QSKpmxeP5Q08W8qZYSRZ3WbDy7F5oAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX3b7qmiE51rh6rxGCx3kfSbca806tFjhhjNy2J4sPBI5OxIVArFuNMyTOfdz9t0Uq8YfvmYge1XXLeX1Ci4IsLuR5LM0Hnrqk0qisADnAiuUvDEq5bUm1AWqqFArMcaZFYA+mm8+sdYxvF6iLioMoiXKW87YwyyF1ohzQ4bfddvkDN/RtTnm0yYRefGNQvYzaqnWPNhKKlFIFQ3Z7uB8UUPHLbQqah4loCW94xd+NGvOcFewaKST+53ShRlLWZeCGRI28ab4sr4BPwo9K1F67jhtOVIOi0kN0y4VaG0GA/uatIfuKATBtwb7FBPJ2saxo9R+xUJBNj28N5r8YnF2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GeOY29sz; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GeOY29sz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsbzP5JHDz3bdW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 05:40:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11F02A419F2;
	Mon, 18 Nov 2024 18:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5AEC4CECC;
	Mon, 18 Nov 2024 18:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731955229;
	bh=PgWfk6zhBX25rXxPAwmwUJeghk+GajLkQHlk+OfGUQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeOY29szPjdxa0xm+vV9DTg2e5TPlxk7huuBMuJbtT+hTn5kPCdRWZ2oKgkC8UpSt
	 VKEpF1/SK1ceIDW9rYbK4e2lrKnmmaewrajrem/5hOE+eL2aJiJwe2Mq1uUh3lhZ50
	 bF8KJonZOhyM89MpbuLHVivYouTUSuZbDmGNuIIUU6Sz4PBRF7AffgUgRIMQ22WWof
	 8/hSFdkboAANibLeqfLmV82IhRXIdNitXrU+lzbag6jN3GbbRMHw4voatyzJmOaEVn
	 LYCc2cjDCBvkB/fCKjeR1Y3G/eBzyCxZ8foJEVKOfJ+JG689X8AaWtSJSKfiAkucWY
	 LfgB8UgFNVmrQ==
Date: Mon, 18 Nov 2024 10:40:26 -0800
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
Subject: Re: [PATCH v7 0/8] x86/module: use large ROX pages for text
 allocations
Message-ID: <ZzuKGoj99rIuMaBE@kernel.org>
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241118132501.4eddb46c@gandalf.local.home>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118132501.4eddb46c@gandalf.local.home>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 18, 2024 at 01:25:01PM -0500, Steven Rostedt wrote:
> On Wed, 23 Oct 2024 19:27:03 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Hi,
> > 
> > This is an updated version of execmem ROX caches.
> > 
> 
> FYI, I booted a kernel before and after applying these patches with my
> change:
> 
>   https://lore.kernel.org/20241017113105.1edfa943@gandalf.local.home
> 
> Before these patches:
> 
>  # cat /sys/kernel/tracing/dyn_ftrace_total_info
> 57695 pages:231 groups: 9
> ftrace boot update time = 14733459 (ns)
> ftrace module total update time = 449016 (ns)
> 
> After:
> 
>  # cat /sys/kernel/tracing/dyn_ftrace_total_info
> 57708 pages:231 groups: 9
> ftrace boot update time = 47195374 (ns)
> ftrace module total update time = 592080 (ns)
> 
> Which caused boot time to slowdown by over 30ms. That may not seem like
> much, but we are very concerned about boot time and are fighting every ms
> we can get.

Hmm, looks like this change was lost in rebase :/

@Andrew, should I send it as a patch on top of mm-stable?

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


> -- Steve

-- 
Sincerely yours,
Mike.

