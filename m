Return-Path: <linuxppc-dev+bounces-7398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECBA76768
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Mar 2025 16:08:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRCfc1RLYz2yhV;
	Tue,  1 Apr 2025 01:08:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743430135;
	cv=none; b=Vq12KK1cZEUtvv95l5/jt99X29M/YMii+pV06ad3YCM6kOf0TFVuNIcNupSyCMHzWBIAEMrLyFMf9VL9vU70l7qS9a3RirOoHY38EXEskTHKtr1d1PB5caAgi09uETOAVYqIHPNHzQwtOAxLCg2eZ7M/kIkZ8x6VgFvrunYcENWB6cQcTvFYKyCQvIdi7F6hQV3cZOCTv2qNW9HK0qjET2601wv9e6HqjFeJ4IHTQpEu5Os4nao6rO1luc3DwI0qjEjca7/XYjHMDbLF5Uqc9WTbb+AEWYRcWgLOhhvYqRaeq6ogJ9QfToSMpxa4bve/AtpS5eSDxctCGk5YyDG+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743430135; c=relaxed/relaxed;
	bh=NgnaikQwKq0Fw4eJigDSqqrGfVP3EB4K4CJJy6WjhhE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h88mEun2PU9ljtWENM3vTWaFpE2x4MFNoOg4Fp1z5wR/rI2kUc/JkYqS68B0VP+NtQKTY+kJ9GJJZ7yPdZ+LfPt0UgvjH3T37n22G6bsvUK2zllEfBw4Ks/HimktvbRqtBWcwrbllBY30pZfnOendbFKn5V3gaaiD1O/JBsFdd3rMiDqrzmUKq0qv4lcT4NLmKOWIRIza5x/SBuPdLqd9zlgprk+fsc/ukTDEt5yYZAnYTWr6rMTMUPYA5tkZXgk6M8MPXSKRiSutprisbDoOYutPq52lXoIPwSFydCeJ1Rj58KWntj7ghzaEN9x+855JYpUprc2YaUrwiHd1Xegjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=odkp=ws=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=odkp=ws=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRCfZ2yjmz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 01:08:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5141438B4;
	Mon, 31 Mar 2025 14:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E1BC4CEE3;
	Mon, 31 Mar 2025 14:08:42 +0000 (UTC)
Date: Mon, 31 Mar 2025 10:09:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: "Naveen N. Rao" <naveen@kernel.org>, Hari Bathini
 <hbathini@linux.ibm.com>, bpf@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann
 <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas
 Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia
 <vishalc@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>, Michal =?UTF-8?B?U3VjaMOhbmVr?=
 <msuchanek@suse.de>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
 live-patching@vger.kernel.org
Subject: Re: [BUG?] ppc64le: fentry BPF not triggered after live patch
 (v6.14)
Message-ID: <20250331100940.3dc5e23a@gandalf.local.home>
In-Reply-To: <rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr>
References: <rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 31 Mar 2025 21:19:36 +0800
Shung-Hsi Yu <shung-hsi.yu@suse.com> wrote:

> Hi all,
> 
> On ppc64le (v6.14, kernel config attached), I've observed that fentry
> BPF programs stop being invoked after the target kernel function is live
> patched. This occurs regardless of whether the BPF program was attached
> before or after the live patch. I believe fentry/fprobe on ppc64le is
> added with [1].
> 
> Steps to reproduce on ppc64le:
> - Use bpftrace (v0.10.0+) to attach a BPF program to cmdline_proc_show
>   with fentry (kfunc is the older name bpftrace used for fentry, used
>   here for max compatability)
> 
>     bpftrace -e 'kfunc:cmdline_proc_show { printf("%lld: cmdline_proc_show() called by %s\n", nsecs(), comm) }'
> 
> - Run `cat /proc/cmdline` and observe bpftrace output
> 
> - Load samples/livepatch/livepatch-sample.ko
> 
> - Run `cat /proc/cmdline` again. Observe "this has been live patched" in
>   output, but no new bpftrace output.
> 
> Note: once the live patching module is disabled through the sysfs interface
> the BPF program invocation is restored.
> 
> Is this the expected interaction between fentry BPF and live patching?
> On x86_64 it does _not_ happen, so I'd guess the behavior on ppc64le is
> unintended. Any insights appreciated.

Hmm, I'm not sure how well BPF function attachment and live patching
interact. Can you see if on x86 the live patch is actually updated when a
BPF program is attached?

Would be even more interesting to see how BPF reading the return code works
with live patching, as it calls the function directly from the BPF
trampoline. I wonder, does it call the live patched function, or does it
call the original one?

-- Steve


> 
> 
> Thanks,
> Shung-Hsi Yu
> 
> 1: https://lore.kernel.org/all/20241030070850.1361304-2-hbathini@linux.ibm.com/


