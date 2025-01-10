Return-Path: <linuxppc-dev+bounces-5040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6013BA09F1D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:14:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJtW0ZmGz3cll;
	Sat, 11 Jan 2025 11:14:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534492;
	cv=none; b=LGjgMrcztAKy/uiPGuNFyjbUmeYhSOawdAPj88Dh0GjrBy/boovmfTef3lemkITG7b47ZwhrLUBG79T2Wla6jkmjaVxIl/dJABWI6FA7/+7Qk9oOGlvAcxdal8nBv09cDp2v7GtgSRnZsEY8Ay/esBWuJsCWU0eHX1muPu6wMWnX+u6vnweKYvCKXv6zQAB8NvEJIk8FI7YfuLDLM+rRyCOEn9gyuSthrm65JnQMRhycKJ/Xks2nI+2fyMtoFnl2FWdV/obsIawh0kK00lZqNlH8U3jSZyFAUfaHjBHGdI2FHGSd3atI5TJB+hSlkYFF2wfkmVWRp6sfZ4qsoM6DZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534492; c=relaxed/relaxed;
	bh=lgAtsH7tF25YqHAENGvYLMvhBopdecMcg5W9s6t9Qm4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a5o8dZI3J2zECWS1NfF13n8Hnyq5K955vJqPPIgF+NeIkovjul8GSjNt+KrQ4W5uFqNxHs2mm9VG+2xVpk5kyFGzpG09NTYmqS5EahJvLCJpwVsZ9Uk33AmM94AC2CzyZoBAszln9VmLZVT84qyqisi3D4k/mmySHmbDTWBH+61T2SUzCZhaCXeDJbunOYw0Bs34nvDQZWFMKj+jBXg3He7FgIH2ak7E1x0bTvMHRcD4D5E67n4qgiBTCu9Da/5dJZOellRF4ULJy3M7ob4UZL9Qui1LGbSjS0ZJqzIZ4DW0Zm+8dNEkBxkA2AcGFObPGKkounK6+wd90fGnIAWGPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lIlxAjdj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=32gmbzwgkdpmevxfhviwbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lIlxAjdj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=32gmbzwgkdpmevxfhviwbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9V32T2Bz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:31 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43625ceae52so12794115e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534489; x=1737139289; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lgAtsH7tF25YqHAENGvYLMvhBopdecMcg5W9s6t9Qm4=;
        b=lIlxAjdjS8Bg4OAsDORZvBdJkmQNDNLc0sRftTe2H4zwt8Vf1t6UWpAj4PU7QP5daE
         NgSgMpebU99HWoNN53PM3jHim073ru9JXjMzyBfCmCkVX0Hq/8iiM6ag/M5QjXYGQP/R
         6dy9kqTmMMyNIoWdUvhM5JtKeIJd7CDFQLe/GOEhb9tApbRBTcEEMuQNWzSc9ygGUU2P
         5PpjcA3d/UJnfF2rI9wdZsE6FxXC0wqbTKD7g1Uvfc/9F4PKOTEk9f9RmbtT5uiXDwQS
         c1M6evxOLNN8dCMt0U90SkguBijjeuZzn3ecicd5Soa9kKVU0g6TWVeFyKKeeJJhiPCT
         JF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534489; x=1737139289;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgAtsH7tF25YqHAENGvYLMvhBopdecMcg5W9s6t9Qm4=;
        b=CV5klxATQ8Nlim82f6OOYFtc2Yre4KEYdiSXioHhWgE7mYn1fE2n3pLLuQRuG9YH+7
         O4/TLVk6cDfwty0d/mzO4pMboe5w9zv5CLNFqmcbvgGjpSNKYfJm0bqxANH1UmqD141w
         Kr/3GuSXI/asfzYl+WLDIyVm1i10SUa5cBZLkcKcGwDNeRWHD8MG+bb+pbEABwRucaSO
         Rjdvn8J8scTYhqqNomlSPd3+aG98dTDpWkisht62foY+deQhHp5I7eYC/dlhagcGJotu
         wFM24c6wQ7PjUvb3bbILc0bXssnQh/aO88wtXbmg7BW+LU8KTb19bsRCcQSnbekw7N8s
         FQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7a1b64/b8UTwSeRKJM3ZY1pWObcOVADNUkrIvEF5SW0i1tWZ1KhENfML8xTDtewkkB6A2Qx6XpbIoiKc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz//eIZE9ynHg1msAEX6IQAIeN8u1LWHV7MiXRcI/Y2ivBkMALQ
	Sv4Ako8OIItT2UwwqeMth95btKw7gUSQoJmttbvJO/rmgnjXHl8Q9K0fhJXtKUGuM+tCYbEZHSj
	/QX0z8eQY7A==
X-Google-Smtp-Source: AGHT+IFeKlzdEnxlsx468YN6J+lzj2fJ2REIK9m1LE7fZOV2UV2JrR/PAzf48/PWmJ/jsXO7ZyblIN12CqtAPQ==
X-Received: from wmqa17.prod.google.com ([2002:a05:600c:3491:b0:434:fa72:f1bf])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4586:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-436e26f4b91mr97248925e9.25.1736534488470;
 Fri, 10 Jan 2025 10:41:28 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:45 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
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
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-19-8419288bc805@google.com>
Subject: [PATCH RFC v2 19/29] mm: asi: Stabilize CR3 in switch_mm_irqs_off()
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

An ASI-restricted CR3 is unstable as interrupts can cause ASI-exits.
Although we already unconditionally ASI-exit during context-switch, and
before returning from the VM-run path, it's still possible to reach
switch_mm_irqs_off() in a restricted context, because KVM code updates
static keys, which requires using a temporary mm.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/tlb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index c55733e144c7538ce7f97b74ea2b1b9c22497c32..ce5598f96ea7a84dc0e8623022ab5bfbba401b48 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -546,6 +546,9 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 	bool need_flush;
 	u16 new_asid;
 
+	/* Stabilize CR3, before reading or writing CR3 */
+	asi_exit();
+
 	/* We don't want flush_tlb_func() to run concurrently with us. */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING))
 		WARN_ON_ONCE(!irqs_disabled());

-- 
2.47.1.613.gc27f4b7a9f-goog


