Return-Path: <linuxppc-dev+bounces-1959-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5D997FCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 10:31:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPNHx4K8kz3bpW;
	Thu, 10 Oct 2024 19:30:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728549053;
	cv=none; b=SrKgJV/ap6gjxzaRylERB9Mzu90bpdxNmTaTMJ9eFzDYcLz3V2yD2VUmhvioICkOaAOyBtz0zhGZ+wzP67KWYJdIlHpXCV64JufiIUVRMCtzBjyzZq8OpA3d4EI4XGleGFxNqKkjL/rShq2PV0b24wXbSTnjuvZAJy3XxMKuNFfOqrVizTyRPmBjsHesDJtZYuwYixoBoZOYMu5UEUJRtk0a3yYkibLNrE8RzcjGrhT42xVy6lMHqFWilRvkNhGhDwFvMGQJ8lPs8EgXze66gwbV1Xv8HiWCjMyfp9eyFaKNIV+bobYMNXuu5xA5Dq++D/1UOWQkI+Uzbjgp+B2tFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728549053; c=relaxed/relaxed;
	bh=xjRgM2erkgK9qh8AbT3u9Jz1xqlQ+SHokymxxsnkwPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBxSNWxTqrSV7FO/4grOX72e3YIBlWQCNEA9K6yfxV0GTuODJasQjSQBQ48Pf+Yvjti78dKpvZCYetZnkqGpbIWIV9GvQZtWuwbsKA+eJkHwjsqfWyimi1flg2db31JjI56YAP2BxJgvYSTAdnlhHoLdv0YCQpS88zNeYzj/ZEvqHmg+VkFvUtI7lGNR22GbBOwU/npxUKNOhFaW/l9trYgZLV3w4YcawVXYvN2/DHXmA6gWEHy8SsfaUGlDjrlvIj5fF0jISZo5XzZBE40cyxOpvp2kHKLVt7Nv7VlLAYoRvb3bKf8x3p8mkKB3vmN3PwhiZ8IpfDi5qXZaDmMLXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jvza2d8C; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jvza2d8C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPNHw0Kvjz3bnD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 19:30:50 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e2a0a7c035so579733a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 01:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728549047; x=1729153847; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xjRgM2erkgK9qh8AbT3u9Jz1xqlQ+SHokymxxsnkwPs=;
        b=jvza2d8C1pv5SAXN9sodHHad73HpJU5viKoyTDwZ/zH+zlYye+F/8PFhNaPPs8uQfu
         Tr58DHg7tiUo+LslvJEFZwx+u3h+ppdGWmWjw1fzlL+B+qbHIit8KuSpx+D3h4/XoBjc
         ft+zjgyUra36Py114//mnaA4kzNr1o4d/q7TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728549047; x=1729153847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjRgM2erkgK9qh8AbT3u9Jz1xqlQ+SHokymxxsnkwPs=;
        b=qNaA7Rcyg0m719UtL9XAmIj0bDpqXsE3yK1C58JzY6gFxyXRfbgSNh2pbZhlFd/2MN
         OpNpsynPLtd3PxXNsUv5CkgwqpGczX05jCYbYmgqRazpmbTh9QhjdDFLkHkE9aMS0s6b
         IXSmrV8HCMKSTRWP5skOMV/TwDYyqH7rgfHlQElikz90blfjnf5zUNg4/RzV3m/VMaL9
         CSu9KKmprEIn283bc9diqU6LYXAsRjf23N8jpwKvqSUw8Ws1dUsxs0mR838Fvpc00vgP
         mQFta5JKljkb7Q9I/OwrYbuC6dMNyvpGRWRX+rL6u6cyET1tHdeRMYfXG0w1ujV2ijsK
         DkAw==
X-Forwarded-Encrypted: i=1; AJvYcCVFCSdn3bIv+6Vg+2iX1SMK17xyOnFGRi+itWGMRzzB4dY2HzTE8K3NdRBEbJAuuc7OQM8A9snWbwzSZm4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz61eFavH8kr86xhnbef7NGmNTdA1IK5bTLbcGH8CuhZbV8Cfhj
	b2aZd+mk7dPlolo5FP+wbpFAzQsRYNFx1WYjD78rtsnQLSxDqZ0SPrEB/D6tpg==
X-Google-Smtp-Source: AGHT+IGiHJLVn7EEJZoiHDg1IHJwEmo5BKI2W3X+EqMqHJDA19Xi8bq+M3epyy60EICvZVegJa7iQQ==
X-Received: by 2002:a17:90a:178e:b0:2e2:cc47:ce1a with SMTP id 98e67ed59e1d1-2e2cc47ce65mr2245610a91.1.1728549047177;
        Thu, 10 Oct 2024 01:30:47 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c13a:abb0:1c8:a3c3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5f0a424sm730808a91.28.2024.10.10.01.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:30:46 -0700 (PDT)
Date: Thu, 10 Oct 2024 17:30:33 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
	Luis Chamberlain <mcgrof@kernel.org>,
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
	Steven Rostedt <rostedt@goodmis.org>,
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
Subject: Bisected: [PATCH v5 8/8] x86/module: enable ROX caches for module
 text
Message-ID: <20241010083033.GA1279924@google.com>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-9-rppt@kernel.org>
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
In-Reply-To: <20241009180816.83591-9-rppt@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On (24/10/09 21:08), Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Enable execmem's cache of PMD_SIZE'ed pages mapped as ROX for module
> text allocations.
> 

With this modprobe disappoints kmemleak

[   12.700128] kmemleak: Found object by alias at 0xffffffffa000a000
[   12.702179] CPU: 5 UID: 0 PID: 410 Comm: modprobe Tainted: G                 N 6.12.0-rc2+ #760
[   12.704656] Tainted: [N]=TEST
[   12.705526] Call Trace:
[   12.706250]  <TASK>
[   12.706888]  dump_stack_lvl+0x3e/0xdb
[   12.707961]  __find_and_get_object+0x100/0x110
[   12.709256]  kmemleak_no_scan+0x2e/0xb0
[   12.710354]  kmemleak_load_module+0xad/0xe0
[   12.711557]  load_module+0x2391/0x45a0
[   12.712507]  __se_sys_finit_module+0x4e0/0x7a0
[   12.713599]  do_syscall_64+0x54/0xf0
[   12.714477]  ? irqentry_exit_to_user_mode+0x33/0x100
[   12.715696]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   12.716931] RIP: 0033:0x7fc7af51f059
[   12.717816] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8f 1d 0d 00 f7 d8 64 89 01 48
[   12.722324] RSP: 002b:00007ffc1d0b0c18 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   12.724173] RAX: ffffffffffffffda RBX: 00005618a9439b20 RCX: 00007fc7af51f059
[   12.725884] RDX: 0000000000000000 RSI: 000056187aea098b RDI: 0000000000000003
[   12.727617] RBP: 0000000000000000 R08: 0000000000000060 R09: 00005618a943af60
[   12.729361] R10: 0000000000000038 R11: 0000000000000246 R12: 000056187aea098b
[   12.731101] R13: 0000000000040000 R14: 00005618a9439ac0 R15: 0000000000000000
[   12.732814]  </TASK>
[   12.733362] kmemleak: Object 0xffffffffa0000000 (size 2097152):
[   12.734800] kmemleak:   comm "modprobe", pid 410, jiffies 4294880489
[   12.736334] kmemleak:   min_count = 2
[   12.737228] kmemleak:   count = 0
[   12.738043] kmemleak:   flags = 0x5
[   12.738917] kmemleak:   checksum = 0
[   12.739783] kmemleak:   backtrace:
[   12.740606]  kmemleak_vmalloc+0x29/0xc0
[   12.741532]  kasan_alloc_module_shadow+0xbe/0xe0
[   12.742649]  execmem_vmalloc+0x116/0x220
[   12.743596]  execmem_alloc+0xfb/0x3d0
[   12.744479]  load_module+0x1e84/0x45a0
[   12.745383]  __se_sys_finit_module+0x4e0/0x7a0
[   12.746452]  do_syscall_64+0x54/0xf0
[   12.747319]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   12.748772] kmemleak: Not scanning unknown object at 0xffffffffa000a000
[   12.750364] CPU: 5 UID: 0 PID: 410 Comm: modprobe Tainted: G                 N 6.12.0-rc2+ #760
[   12.752441] Tainted: [N]=TEST
[   12.753165] Call Trace:
[   12.753760]  <TASK>
[   12.754279]  dump_stack_lvl+0x3e/0xdb
[   12.755165]  kmemleak_load_module+0xad/0xe0
[   12.756165]  load_module+0x2391/0x45a0
[   12.757068]  __se_sys_finit_module+0x4e0/0x7a0
[   12.758135]  do_syscall_64+0x54/0xf0
[   12.759099]  ? irqentry_exit_to_user_mode+0x33/0x100
[   12.760292]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   12.761508] RIP: 0033:0x7fc7af51f059
[   12.762372] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8f 1d 0d 00 f7 d8 64 89 01 48
[   12.772361] RSP: 002b:00007ffc1d0b0c18 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   12.774957] RAX: ffffffffffffffda RBX: 00005618a9439b20 RCX: 00007fc7af51f059
[   12.776635] RDX: 0000000000000000 RSI: 000056187aea098b RDI: 0000000000000003
[   12.778283] RBP: 0000000000000000 R08: 0000000000000060 R09: 00005618a943af60
[   12.779949] R10: 0000000000000038 R11: 0000000000000246 R12: 000056187aea098b
[   12.781619] R13: 0000000000040000 R14: 00005618a9439ac0 R15: 0000000000000000
[   12.783319]  </TASK>

