Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F443FE41F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 22:33:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0G393zP6z3c6S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 06:33:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=BuHas1hm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::749; helo=mail-qk1-x749.google.com;
 envelope-from=38uivyqykdic3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BuHas1hm; dkim-atps=neutral
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0G0P0ZL4z2xnd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 06:30:45 +1000 (AEST)
Received: by mail-qk1-x749.google.com with SMTP id
 h186-20020a3785c3000000b00425f37f792aso732297qkd.22
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 13:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=ldLSFjRoxMWlt0z49+aeceHGSPi4XGtx99N0OsyVmLE=;
 b=BuHas1hm2XV6S0WdY0vNJtMNKqcbhhJlqEs2KKd8pR2ZtVSZyXdrExnzC9yAzti+6M
 zsB0cZ6yGgy/LCmNQnoE9irvXv0l/kef17MuyVLZuyUIXQLsQAVBMnkjctlzTiQS2gFl
 nNVPpGt/BljIuuR8Np2F3JcMLpOT4q13le7u3t9xGN/31GLNQRRtmxFcq3gYSrgx4SpD
 JLqZCUeYueQLMr1QYaYrnsCaSoHnKr/g+VU1g+qoQeBj0TaKLOTWsdjiTXJZ47hEuUNE
 YXZcuSxN1X/sa6HR56VO6THXVndPm08u7aBj1ZanEP006m9Dcu8OtsWgR2jBGDkZu34R
 vcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=ldLSFjRoxMWlt0z49+aeceHGSPi4XGtx99N0OsyVmLE=;
 b=f9oE3Hk+RXrJQ1kbpLpNiUGN8qUYWFbZxLawmM0vyfnt1+zoAiGUoyFEZYQ6tTbGzH
 /huPEotBN4/nv1hqZ6tJCeYl04ScgyrKAhludoi/nDf818WjtbBtJ5hwy4eXC0MDqBpB
 n3zYhGTPJUjKXweqE7zZ5ocDO0AXhCEdq87FmWnN9r54LoN70C5pd7Ha6QqOy7anm3bI
 7E9ZaOsSdFKOXZ0oG6rBMIRtQ1/BzIBgLseXBdUn4GUeWqFifaszD+4C3ktMdKnFbARG
 TFQ0uY6sPx0XxvlgFctCA0g3LMW0BpPoMJ9rpUz3ic2ZpL7uptjAKC9kanybJrrPkRb3
 QrfQ==
X-Gm-Message-State: AOAM532jl3k0q2WXihwqTWZfI8Dw7m/RG5sNh2qYbuQ9/IvDdqX9oYj0
 LnFM37Dck05jkp0RRMzlcdy+UdFv7Tc=
X-Google-Smtp-Source: ABdhPJzwgN7oneIBzjWgEYG1ij6WsGK4rMhOwP5dDZ6ynvgYB+9os0mc0YRgyTvPGpS3N44mYcHSnTxodu4=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:9935:5a5e:c7b6:e649])
 (user=seanjc job=sendgmr) by 2002:a05:6214:92b:: with SMTP id
 dk11mr1719346qvb.46.1630528242737; Wed, 01 Sep 2021 13:30:42 -0700 (PDT)
Date: Wed,  1 Sep 2021 13:30:28 -0700
In-Reply-To: <20210901203030.1292304-1-seanjc@google.com>
Message-Id: <20210901203030.1292304-4-seanjc@google.com>
Mime-Version: 1.0
References: <20210901203030.1292304-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH v3 3/5] tools: Move x86 syscall number fallbacks to .../uapi/
From: Sean Christopherson <seanjc@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Oleg Nesterov <oleg@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
 Andy Lutomirski <luto@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Ben Gardon <bgardon@google.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, Peter Foley <pefoley@google.com>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>, Shakeel Butt <shakeelb@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move unistd_{32,64}.h from x86/include/asm to x86/include/uapi/asm so
that tools/selftests that install kernel headers, e.g. KVM selftests, can
include non-uapi tools headers, e.g. to get 'struct list_head', without
effectively overriding the installed non-tool uapi headers.

Swapping KVM's search order, e.g. to search the kernel headers before
tool headers, is not a viable option as doing results in linux/type.h and
other core headers getting pulled from the kernel headers, which do not
have the kernel-internal typedefs that are used through tools, including
many files outside of selftests/kvm's control.

Prior to commit cec07f53c398 ("perf tools: Move syscall number fallbacks
from perf-sys.h to tools/arch/x86/include/asm/"), the handcoded numbers
were actual fallbacks, i.e. overriding unistd_{32,64}.h from the kernel
headers was unintentional.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/arch/x86/include/{ => uapi}/asm/unistd_32.h | 0
 tools/arch/x86/include/{ => uapi}/asm/unistd_64.h | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename tools/arch/x86/include/{ => uapi}/asm/unistd_32.h (100%)
 rename tools/arch/x86/include/{ => uapi}/asm/unistd_64.h (100%)

diff --git a/tools/arch/x86/include/asm/unistd_32.h b/tools/arch/x86/include/uapi/asm/unistd_32.h
similarity index 100%
rename from tools/arch/x86/include/asm/unistd_32.h
rename to tools/arch/x86/include/uapi/asm/unistd_32.h
diff --git a/tools/arch/x86/include/asm/unistd_64.h b/tools/arch/x86/include/uapi/asm/unistd_64.h
similarity index 100%
rename from tools/arch/x86/include/asm/unistd_64.h
rename to tools/arch/x86/include/uapi/asm/unistd_64.h
-- 
2.33.0.153.gba50c8fa24-goog

