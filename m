Return-Path: <linuxppc-dev+bounces-5024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EB3A09F08
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:11:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJq66B3Qz3cfm;
	Sat, 11 Jan 2025 11:11:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::34a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534459;
	cv=none; b=LrVYoP/8u1HE5ikdWUEJDk6W6cyb0RgKKj/l+aV/olUkzJ4QY7luYfvE3B4v2hylH0bXYuLQ04kpkCc466ObOUvi66ZUwn8shtDJ4uNOV9i48ucWnExMbiIw9R/YzJpll5hmPmsKh3yXExup1IyEdH9I2OWyfrbHTB8v4KNElo5JGtLXQjUg3BbqT++PzSubaZHRWWuXtr7zEtEJ+ha9U4D5lcG+tiGuOa1n9zcPvswEWh2zbl6c48Cw3q7ktNPlUY1MP1XLrmmVI9HFUj3R2HkN/uBJxMIUtgWtvlVaPr7JZyOlmfSvzXtNUBwHw4TVMEq79sELj+NRQFIMvSBBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534459; c=relaxed/relaxed;
	bh=jjtB5lRt7h5DA7GIgQanvF90WYFKTK1R3LPSOzDiibI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JDdDb+LHdyBaHxiIx8BK24p8QXYyvbnd+qnR0rMr27oFSkOyaYFBXfH2E9mUhrFDusryjvRQmYlcvV48wpB/h9jV4Qj2Ds336zFQyaAgmt+INle+8mKfj0ZqQLlEy/5K9Fsq7rKWGPVZNu2EX70XUvI40kKhb4GXuShO8snB9UjvIXeOvm8D7ukf+0u+H/HFkrPp2ecvtoT/4OKbTfcG01iDnpmeI9ai+3mF9UZI5k9E5DCCNrqaBm2EsmOIv/3qUWyILOqkeDIuHrArQP/isJYDqMj4XrrX4BreEIrslPVYJphe/1TsC0/WF5HfzQgWHLuPsNZjz3uoCSPYOmYamQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KWqfdezM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3rwmbzwgkdmgxoqy0o1pu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KWqfdezM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3rwmbzwgkdmgxoqy0o1pu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9TN4zzxz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:40:55 +1100 (AEDT)
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361eb83f46so20335435e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534446; x=1737139246; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jjtB5lRt7h5DA7GIgQanvF90WYFKTK1R3LPSOzDiibI=;
        b=KWqfdezMj6k16nfM55pyQnw3Q/g8ZvA3VgFdy19w+4z0kv/hUtY2U/h8SaGb1d1IUE
         LEr86VC8DEdKx5lka3Udhq/fcw60DpHWWzRtTtB4mjZWIYCaVFVSUYRv8cExwzh60lYC
         zGv+bpOIl47qnrQgzCNY3e8Qn1ZLN1ZZJXhIe59AG3V03aYhp5eLdPduPPWz1Fmx19pr
         lwTWd3z02r0VdDiQx3sKJwoRdBhF/rbPMrboGTKNoK4lk+cFelxKXUTk+c3FFZhv1Wwp
         V/tRxWXZibljfC+tcCxh4rPHccDyHQnEtRZaSRFITWaPKNuFKQLSX8ZXqyCwSl2kJai2
         vYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534446; x=1737139246;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjtB5lRt7h5DA7GIgQanvF90WYFKTK1R3LPSOzDiibI=;
        b=TS94ESX/mqyJRwtuw0JyL7ha/xixYrINNXOF9V4vpA2kbRotCaOffszq+DWv+fCWZN
         3rCam9I4+sS5qKiowwCrG2khGESq2nqZI/uiW4WSm3Yn8MigO92nJqTvrkFwzuGldnLs
         6x/VmEIPu7Cx3XJHSytzOKwF/D18hXe0Qjps5EAmXWREFza7q8ZJwAO8uixHUXp41GAN
         avOknKFNHPluG72j9WbyorB/scZIjWMyyFRdenq2Nzk28nuaU9HwoAKBLKPaaJ+kfNN7
         33HBRNqDjSelGUTxirOagk56J1dP/RsKyPC7dOL/F/SjcVQ0ca2QYudKtfCLy74sioAS
         rbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLf6LK1s6J90KO/4JHrfk5iVzMoCxGa4C0IXueUzycozrnWO0GjerIQdA/jbFS/WURYlw0yR/NsMQp0aY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznxNTM9/vSeSPkOGjTzI8aE0+fKcYxtKlqtJVGtyTYX5RcLZD+
	gOm5FPr+2w3ZqiBe7+M8P3pqURoYzrPhFe0j/f2dn9IuQEmohwLt7VXej951eq7wKfnCog3MzWS
	FK0xe5ebv1A==
X-Google-Smtp-Source: AGHT+IGn62s/zpmNlw6cS/dnEppCTrQbKdqDl7tm1TqotCpul8Aao0CteIYxi5s8bW0nJPjX7qZkFnpNt2sQAQ==
X-Received: from wmbjw19.prod.google.com ([2002:a05:600c:5753:b0:434:a4bc:534f])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:c315:0:b0:434:ffb2:f9df with SMTP id 5b1f17b1804b1-436e26adf94mr117996365e9.17.1736534445509;
 Fri, 10 Jan 2025 10:40:45 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:26 +0000
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
X-B4-Tracking: v=1; b=H4sIAJtpgWcC/z2NwQrCMBBEf6Xs2ZVsTLX1JAh+gFfpIWnTdkEbS
 SQoJf9uzMHjvGHerBCsZxvgWK3gbeTAbslBbiroZ71MFnnIGaSQiohq1IHRjz1GifXQGmNU5s0
 e8uDp7cjvIrvB9XKGLsOZw8v5TzmIVKqfSxxI/l1SYSQUSEqZHbVaiaE5Tc5Nd7vt3QO6lNIXN mCbbqoAAAA=
X-Change-Id: 20241115-asi-rfc-v2-5d9bbb441186
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Subject: [PATCH RFC v2 00/29] Address Space Isolation (ASI)
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
	Brendan Jackman <jackmanb@google.com>, Junaid Shahid <junaids@google.com>, 
	Ofir Weisse <oweisse@google.com>, Yosry Ahmed <yosryahmed@google.com>, 
	Kevin Cheng <chengkev@google.com>, Reiji Watanabe <reijiw@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ASI is a technique to mitigate a broad class of CPU vulnerabilities
by unmapping sensitive data from the kernel address space. If no data
is mapped that needs protecting, this class of exploits cannot leak
that data and so the kernel can skip expensive mitigation actions.
For a more detailed overview, see the v1 RFC (which was wrongly
labeled as a PATCH) [0].

This new iteration adds support for protecting against bare-metal
processes as well as KVM guests. The basic principle is unchanged.

.:: Multi-class ASI

So far ASI has been a KVM-only solution, although I've been claiming
that in principle it can be extended to also sandbox userspace.
Dave Hansen's most important feedback at LPC [1] was that he wanted
some evidence to support this claim. If it can be shown that ASI is
just as powerful for bare-metal as for KVM, it's much more likely to
actually offer an escape path from maintaining and reactively
developing per-exploit mitigations.

v1 already supported a notion of "ASI classes", with the only class
being KVM. This RFC introduces a second class for userspace. Each
process has a separate restricted address space ("domain") for each
class.

In v1, the only possible ASI transitions were between the KVM
restricted address space, and the unrestricted address space. Now
that there are multiple classes, it's possible to transition directly
between two restricted address spaces.

(Could we dodge this complexity by just transitioning via the
 unrestricted address space? Yes, but experience from Google's
 internal deployment suggests there's a significant benefit in
 avoiding an asi_exit() when switching between userspace and KVM,
 despite all the optimizations that exist to avoid that switching).

Compared to v1, this version has a new mechanism to determine
what mitigation actions are required when switching between address
spaces.  ASI classes provide a "taint policy" which describes what
uarch state their sandboxee might leave behind, and what uarch state
needs to be purged before their sandboxee can safely be run. The ASI
core takes care of doing the actual flushes.

This enables a reasonably advanced model of what flushes are needed
when; for example the kernel is now able to model "when transitioning
from a VMM to its KVM guest there is no point in flushing speculative
control flow state, but if we _later_ exit to the unrestricted
address space we do need to flush it". It's quite possible this is
actually more advanced than what is needed so suggestions are
welcome.

.:: Performance issues: bogus mitigation costs

Although this implementation of ASI is pretty generous in what it
considers "nonsensitive", there remain unnecessary performance costs
that need to be addressed. For example:

- The entire page cache is removed from the direct map. Traditional
  file operations will hit an asi_exit(), paying a pointless cost to
  protect data from a process that obviously has the right to read
  that data.
- Anything that accesses guest or user memory via the direct map
  instead of the user address space will hit an asi_exit().
- Pages being zeroed in the page allocator

Most of these issues existed in v1 too, but now that ASI sandboxes
userspace processes, the page-cache issue becomes very significant.
For FIO 4k read (I suppose this workload is maximally sensitive to
this issue) I saw a 70% degradation in throughput, with a Sapphire
Rapids machine hard-coded to perform IBPB and RSB-stuffing on
asi_exit().

Given a result like that I haven't gone into more detailed analysis.
Note also that I ran with an unrealistic mitigation policy, results
would be much different if ran with platform-appropriate flushes, but
it would presumably lead to the same conclusion.

There are some interesting discussions to be had about tackling that
problem (e.g. reintroducing "local-nonsensitivity" from Junaid's 2022
ASI implementation [2], or creating ephemeral CPU-local mappings),
but for this RFC I prefer to focus on deciding if the overall
framework makes sense.

.:: Next steps

Aside from lack of userspace support, all the other issues listed in
RFCv1 remain. I'll also need a proof-of-concept solution for the
page-cache issue before we can credibly claim to be reaching a
[PATCH], but before that I want to develop a more complete page_alloc
integration. I plan to propose a topic about that at LSF/MM/BPF.

Anyway, despite the further research needed on my side I think
there's still useful stuff to discuss here. For example:

 - Does the "tainting" model make intuitive sense? Is there a simpler
   way to achieve something similar?

 - The taints offer a model for different parts of the kernel to
   communicate with each other about what mitigations they've taken
   care of. For example, KVM could clear ASI taints if it existing
   conditional-L1D-flush logic fires. Does it make sense to take
   advantage of this? (I think yes). How does this influence the
   design of the bugs.c kernel arguments?

 - Suggestions on how to map file pages into processes that can read
   them, while minimizing TLB management pain.

Finally, a more extensive branch can be found at [3]. It has some tests
and some of the lower-hanging fruit for optimising performance of KVM
guests.

[0] RFC v1:
    https://lore.kernel.org/linux-mm/20240712-asi-rfc-24-v1-0-144b319a40d8@=
google.com/

[1] LPC session: https://lpc.events/event/18/contributions/1761/

[2] Junaid=E2=80=99s RFC:
    https://lore.kernel.org/all/20220223052223.1202152-1-junaids@google.com=
/

[3] GitHub branch:
    https://github.com/googleprodkernel/linux-kvm/tree/asi-rfcv2-preview

Signed-off-by: Brendan Jackman <jackmanb@google.com>

	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	 Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	 Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	 Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	 Alexandre Chartre <alexandre.chartre@oracle.com>,
	Liran Alon <liran.alon@oracle.com>,
	 Jan Setje-Eilers <jan.setjeeilers@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	 Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	 Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@suse.de>,
	 Lorenzo Stoakes <lstoakes@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	 Michal Hocko <mhocko@kernel.org>,
	Khalid Aziz <khalid.aziz@oracle.com>,
	 Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	 Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	 Valentin Schneider <vschneid@redhat.com>,
	Paul Turner <pjt@google.com>, Reiji Watanabe <reijiw@google.com>,
	 Junaid Shahid <junaids@google.com>,
	Ofir Weisse <oweisse@google.com>,
	 Yosry Ahmed <yosryahmed@google.com>,
	Patrick Bellasi <derkling@google.com>,
	 KP Singh <kpsingh@google.com>,
	Alexandra Sandulescu <aesa@google.com>,
	 Matteo Rizzo <matteorizzo@google.com>,
	Jann Horn <jannh@google.com>
	 kvm@vger.kernel.org, Brendan Jackman <jackmanb@google.com>,
	Dennis Zhou <dennis@kernel.org>

---
Changes in v2:
- Added support for sandboxing userspace processes.
- Link to v1: https://lore.kernel.org/r/20240712-asi-rfc-24-v1-0-144b319a40=
d8@google.com

---
Brendan Jackman (21):
      mm: asi: Make some utility functions noinstr compatible
      x86: Create CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
      mm: asi: Introduce ASI core API
      mm: asi: Add infrastructure for boot-time enablement
      mm: asi: ASI support in interrupts/exceptions
      mm: asi: Avoid warning from NMI userspace accesses in ASI context
      mm: Add __PAGEFLAG_FALSE
      mm: asi: Map non-user buddy allocations as nonsensitive
      [TEMP WORKAROUND] mm: asi: Workaround missing partial-unmap support
      mm: asi: Map kernel text and static data as nonsensitive
      mm: asi: Map vmalloc/vmap data as nonsensitive
      mm: asi: Stabilize CR3 in switch_mm_irqs_off()
      mm: asi: Make TLB flushing correct under ASI
      KVM: x86: asi: Restricted address space for VM execution
      mm: asi: exit ASI before accessing CR3 from C code where appropriate
      mm: asi: Add infrastructure for mapping userspace addresses
      mm: asi: Restricted execution fore bare-metal processes
      x86: Create library for flushing L1D for L1TF
      mm: asi: Add some mitigations on address space transitions
      x86/pti: Disable PTI when ASI is on
      mm: asi: Stop ignoring asi=3Don cmdline flag

Junaid Shahid (4):
      mm: asi: Make __get_current_cr3_fast() ASI-aware
      mm: asi: ASI page table allocation functions
      mm: asi: Functions to map/unmap a memory range into ASI page tables
      mm: asi: Add basic infrastructure for global non-sensitive mappings

Ofir Weisse (1):
      mm: asi: asi_exit() on PF, skip handling if address is accessible

Reiji Watanabe (1):
      mm: asi: Map dynamic percpu memory as nonsensitive

Yosry Ahmed (2):
      mm: asi: Use separate PCIDs for restricted address spaces
      mm: asi: exit ASI before suspend-like operations

 arch/alpha/include/asm/Kbuild            |    1 +
 arch/arc/include/asm/Kbuild              |    1 +
 arch/arm/include/asm/Kbuild              |    1 +
 arch/arm64/include/asm/Kbuild            |    1 +
 arch/csky/include/asm/Kbuild             |    1 +
 arch/hexagon/include/asm/Kbuild          |    1 +
 arch/loongarch/include/asm/Kbuild        |    3 +
 arch/m68k/include/asm/Kbuild             |    1 +
 arch/microblaze/include/asm/Kbuild       |    1 +
 arch/mips/include/asm/Kbuild             |    1 +
 arch/nios2/include/asm/Kbuild            |    1 +
 arch/openrisc/include/asm/Kbuild         |    1 +
 arch/parisc/include/asm/Kbuild           |    1 +
 arch/powerpc/include/asm/Kbuild          |    1 +
 arch/riscv/include/asm/Kbuild            |    1 +
 arch/s390/include/asm/Kbuild             |    1 +
 arch/sh/include/asm/Kbuild               |    1 +
 arch/sparc/include/asm/Kbuild            |    1 +
 arch/um/include/asm/Kbuild               |    2 +-
 arch/x86/Kconfig                         |   27 +
 arch/x86/boot/compressed/ident_map_64.c  |   10 +
 arch/x86/boot/compressed/pgtable_64.c    |   11 +
 arch/x86/include/asm/asi.h               |  306 +++++++++
 arch/x86/include/asm/cpufeatures.h       |    1 +
 arch/x86/include/asm/disabled-features.h |    8 +-
 arch/x86/include/asm/idtentry.h          |   50 +-
 arch/x86/include/asm/kvm_host.h          |    3 +
 arch/x86/include/asm/l1tf.h              |   11 +
 arch/x86/include/asm/nospec-branch.h     |    2 +
 arch/x86/include/asm/pgalloc.h           |    6 +
 arch/x86/include/asm/pgtable_64.h        |    4 +
 arch/x86/include/asm/processor-flags.h   |   24 +
 arch/x86/include/asm/processor.h         |   20 +-
 arch/x86/include/asm/pti.h               |    6 +-
 arch/x86/include/asm/special_insns.h     |   45 +-
 arch/x86/include/asm/tlbflush.h          |    6 +
 arch/x86/kernel/process.c                |    2 +
 arch/x86/kernel/process_32.c             |    2 +-
 arch/x86/kernel/process_64.c             |    2 +-
 arch/x86/kernel/traps.c                  |   22 +
 arch/x86/kvm/Kconfig                     |    1 +
 arch/x86/kvm/svm/svm.c                   |    2 +
 arch/x86/kvm/vmx/nested.c                |    6 +
 arch/x86/kvm/vmx/vmx.c                   |  113 ++--
 arch/x86/kvm/x86.c                       |   81 ++-
 arch/x86/lib/Makefile                    |    1 +
 arch/x86/lib/l1tf.c                      |   96 +++
 arch/x86/lib/retpoline.S                 |   10 +
 arch/x86/mm/Makefile                     |    1 +
 arch/x86/mm/asi.c                        | 1039 ++++++++++++++++++++++++++=
++++
 arch/x86/mm/fault.c                      |  124 +++-
 arch/x86/mm/init.c                       |    7 +-
 arch/x86/mm/init_64.c                    |   25 +-
 arch/x86/mm/mm_internal.h                |    3 +
 arch/x86/mm/pti.c                        |   14 +-
 arch/x86/mm/tlb.c                        |  167 ++++-
 arch/x86/virt/svm/sev.c                  |    2 +-
 arch/xtensa/include/asm/Kbuild           |    1 +
 drivers/firmware/efi/libstub/x86-5lvl.c  |    2 +-
 include/asm-generic/asi.h                |  113 ++++
 include/asm-generic/vmlinux.lds.h        |   11 +
 include/linux/entry-common.h             |   11 +
 include/linux/gfp.h                      |    5 +
 include/linux/gfp_types.h                |   15 +-
 include/linux/mm_types.h                 |    7 +
 include/linux/page-flags.h               |   18 +
 include/linux/pgtable.h                  |    3 +
 include/trace/events/mmflags.h           |   12 +-
 init/main.c                              |    2 +
 kernel/entry/common.c                    |    1 +
 kernel/fork.c                            |    5 +
 kernel/sched/core.c                      |    9 +
 mm/init-mm.c                             |    4 +
 mm/internal.h                            |    2 +
 mm/mm_init.c                             |    1 +
 mm/page_alloc.c                          |  160 ++++-
 mm/percpu-vm.c                           |   50 +-
 mm/percpu.c                              |    4 +-
 mm/vmalloc.c                             |   53 +-
 tools/perf/builtin-kmem.c                |    1 +
 80 files changed, 2582 insertions(+), 190 deletions(-)
---
base-commit: ebd6ea9c6976c64ed5af3e6dce672616447e8e62
change-id: 20241115-asi-rfc-v2-5d9bbb441186

Best regards,
--=20
Brendan Jackman <jackmanb@google.com>


