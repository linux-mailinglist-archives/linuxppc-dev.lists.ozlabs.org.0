Return-Path: <linuxppc-dev+bounces-7412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC87DA77B43
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 14:48:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRnq96FsFz2yZN;
	Tue,  1 Apr 2025 23:48:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743511701;
	cv=none; b=nc8A7riYiBqY9k+3mU4o4ZNCBoIaewkIZ/uA+TZS6Au1A5PORf8qHylRWRjAXHV/D3AdzbXc97NsJUz2sYDZ8L/v9mLuT+Y6xaRIVS1fpMRyJehu3gjWy2bOANs6k9tem/UHta25zwQr+ghZ095uhxb2C5/EKU0X4duIFN6hj7oWIarbOhnBcX1qmRm4h0f33fJBrXpylnDrWD7tXsLOJ1ssAv4naVVvoPiqRzag+zs8ABGKiMjjC1/fKcRM4M67OxnULAyOi/PMrb1EljILSfXDjC47mQRzN2EXPzcJXvFab84x/JKcyBgAAAi2Q8hVOPBVZu+eTUpqhmmQw4h4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743511701; c=relaxed/relaxed;
	bh=IhOXe4xrLWQg1QgwsFqVSOzco+rqx0QhBazJTWNkxkg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEECwABLm5YXbBdbGfkT0STpw3BBQHXBI7/n4y0v8LkNXmK2kASMSJ6hZX6YPIPb7df12Bra3PJzFm6erfVclbtz2mdjNwjAtQMSCQONHa2a+331q0ObRqfFnc5aMd0UdDbBgJ61Y0BGqs/DaKuJvOgIGtIa1tQXT5vT2l43EJzXfkQCB+W6mAiUSHuR1BiMMsEx6SUBYZYGXN2EZRwGjRocqsixcLKHdz3NC7gOcGbthJPLr7z3QzHWbHxm3lJ4r2RVX+alzmmWc4XLAq9w2/WRc1eG2ZJ0dd4ynZfoLorgo3bMeUDzvNlVCpXodsAQqEzck+6U36H3xJ2wh2oLbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VTCB/Nmy; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=olsajiri@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VTCB/Nmy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=olsajiri@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRnq82wVxz2ySX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 23:48:19 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so44444285e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Apr 2025 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743511694; x=1744116494; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IhOXe4xrLWQg1QgwsFqVSOzco+rqx0QhBazJTWNkxkg=;
        b=VTCB/NmyLoSxRoXTbbTRyOd/AbOb7e+mSAeoRDHOo/d5ULnE90Xl0r3gjw4npexR7c
         cRHQaAgnWHXHD6xvsLvSf3hcNwYbTzvTh2sGWDGcpJ9afZ9wv3E+41LoHoP8qQvEoqkS
         5qlunFijqyzjyU6PZBZl8BAMUewoCJRvoOT9FDGbOpiemXpHivRi9ILhtZyrXrVq1Djp
         JVcHsiQ4LlAI6Nuofx7Xxh4K8lKWkM1WvPvMNn3+yrbUNXbulnXCFaJePdrZKnhbCrZB
         uxf8I/Z6aZ18QNLu3XsiQXIjU9gk6eVeBvTTuSzGnOy97986GIXaxUe4okakWN9F8iSY
         LsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511694; x=1744116494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhOXe4xrLWQg1QgwsFqVSOzco+rqx0QhBazJTWNkxkg=;
        b=V/B8hKaDX5MI2xh+OhecFKrmg4y2D+0KMijwc/dvxU2cFp0nfPF/UjqT1R9EUJ7EMg
         ch/w3/CIoUhOes1ZLAECGFKhGYP57qMtlWu8vM5IG0wf5h04IZSsv08jxawyNn1r0Xoe
         5ezoCSz7zkUXoWF75xUScNqHVGYcm6Q+QFYzusGrIZ0E/w9gra9syTOHIgQejP7qUcGX
         wmXtobkfBXoYKwNwRAjd3jTffLC2MZyQzga3Q1ZelAq7XNj148cV0jYvgH2diynHIOIS
         hpROAFUbpmxQmcW9ShY3zRzCLN6NXOPmOcYXhmPNpuLiKrd1naote7HUjMSnIXOLjiQI
         agWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMNJlu4/Uv+/JLX1zPoXJQqOt4vPp86SKjc/eQT5PzkKcKJOEMh9KIuBi7ImKQVu14qmoBjgsef3hbsPc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKFVRF3w2xs7Yyh0IFRt+5Vm43qSSz+8qNCUmI8An3czwSYqA0
	SBr2QonfXmIYS7tSe56aJ7/oBi9G5fMr9SxqGpwWMp1n1l65252G
X-Gm-Gg: ASbGncsayyRbNsoWeu9TR5victfU6ioAPszETBgu00P/jRXPslBCcCyWNB0dEFiHIZg
	y4KvypDZVE4JV3Z5imymlg84Bd/xtbj9Yy+H/7MT1RnpbkEeYHSsNxB64f8h2+GlIdFrpt5+c5J
	fEdH0IglPveFGvImnWfBpu65q2iiVjozJBA5e8vVlmjGJ2qY4et6p/g6spHcXauBxFX55Q8RFwo
	hWNUuXdctu/y+vsLY/683erf/NA2ZtWUoHPDF2gkhEqhIWwGSTyPzQgxRIdefFIZdMOh6snX95p
	1ow1LkAfyB8pG1Nlm2EdV1C/NYehyDCqAakVhaT5NQ==
X-Google-Smtp-Source: AGHT+IHFGVvpXaO6oBAfea5m4iRVIFgk5rQKky/21TQY7Ax3YRJMq6NtUyS4+SEkcfaP8JICKNn9KA==
X-Received: by 2002:a05:600c:4606:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-43d91170787mr102959385e9.12.1743511693699;
        Tue, 01 Apr 2025 05:48:13 -0700 (PDT)
Received: from krava ([173.38.220.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e082sm14281943f8f.69.2025.04.01.05.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:48:13 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 1 Apr 2025 14:48:10 +0200
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	"Naveen N. Rao" <naveen@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>, bpf@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Vishal Chourasia <vishalc@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	Song Liu <song@kernel.org>
Subject: Re: [BUG?] ppc64le: fentry BPF not triggered after live patch (v6.14)
Message-ID: <Z-vgigjuor5awkh-@krava>
References: <rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr>
 <20250331100940.3dc5e23a@gandalf.local.home>
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
In-Reply-To: <20250331100940.3dc5e23a@gandalf.local.home>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Mar 31, 2025 at 10:09:40AM -0400, Steven Rostedt wrote:
> On Mon, 31 Mar 2025 21:19:36 +0800
> Shung-Hsi Yu <shung-hsi.yu@suse.com> wrote:
> 
> > Hi all,
> > 
> > On ppc64le (v6.14, kernel config attached), I've observed that fentry
> > BPF programs stop being invoked after the target kernel function is live
> > patched. This occurs regardless of whether the BPF program was attached
> > before or after the live patch. I believe fentry/fprobe on ppc64le is
> > added with [1].
> > 
> > Steps to reproduce on ppc64le:
> > - Use bpftrace (v0.10.0+) to attach a BPF program to cmdline_proc_show
> >   with fentry (kfunc is the older name bpftrace used for fentry, used
> >   here for max compatability)
> > 
> >     bpftrace -e 'kfunc:cmdline_proc_show { printf("%lld: cmdline_proc_show() called by %s\n", nsecs(), comm) }'
> > 
> > - Run `cat /proc/cmdline` and observe bpftrace output
> > 
> > - Load samples/livepatch/livepatch-sample.ko
> > 
> > - Run `cat /proc/cmdline` again. Observe "this has been live patched" in
> >   output, but no new bpftrace output.
> > 
> > Note: once the live patching module is disabled through the sysfs interface
> > the BPF program invocation is restored.
> > 
> > Is this the expected interaction between fentry BPF and live patching?
> > On x86_64 it does _not_ happen, so I'd guess the behavior on ppc64le is
> > unintended. Any insights appreciated.
> 
> Hmm, I'm not sure how well BPF function attachment and live patching
> interact. Can you see if on x86 the live patch is actually updated when a
> BPF program is attached?

above works for me on x86, there's both 'this has been live patched'
and bpftrace output

> 
> Would be even more interesting to see how BPF reading the return code works
> with live patching, as it calls the function directly from the BPF
> trampoline. I wonder, does it call the live patched function, or does it
> call the original one?

yes, that should work, Song fixed some time ago with:
  00963a2e75a8 bpf: Support bpf_trampoline on functions with IPMODIFY (e.g. livepatch)

jirka


> 
> -- Steve
> 
> 
> > 
> > 
> > Thanks,
> > Shung-Hsi Yu
> > 
> > 1: https://lore.kernel.org/all/20241030070850.1361304-2-hbathini@linux.ibm.com/
> 
> 

