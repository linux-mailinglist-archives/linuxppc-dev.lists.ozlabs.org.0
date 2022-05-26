Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712DF534C6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 11:18:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L82Qw08Vkz3bph
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 19:18:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SNsVYqh2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SNsVYqh2;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L82QF2xYDz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 19:17:24 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id f4so872458pgf.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 02:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=RCgUh5Lq8QPmTMiRgC0qjo8EnHunxrcEa1VXXIDed4s=;
        b=SNsVYqh2bpGXL6+XRcWO7v15rBAOUUDbH0ElMOaa0mQKLxAN2zPaFWhF7tPDGlWDe5
         w9cGGFZrf1KBwLEZ09p9vdHxaijfWIweXIR9bwUYHaingiUI+aAaSASt/2BNFbxUBCty
         jB19LifKy9aYwya2O3lEXmV7GOnIpWvcZdzGuNEFDMZIDv2qDwjA47MWD3Hc6HdJ68mb
         cagkJfKI62Od+so6/JhFk/VvKaAPhGcQ7/msrn0WRyq3H+UUERFPZ7VwRtWjWVh2gX4j
         3X/sUWy8BwU5xIIqmyeDtHQhdv/wILJ9loMcULskKHOhjEA56cGf2QB699/QPeqdJjfy
         BnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=RCgUh5Lq8QPmTMiRgC0qjo8EnHunxrcEa1VXXIDed4s=;
        b=6NormHG4/PBl117vReEP65zdNF9UzePQjz6V8KjZepxTolxNf3BEs02tKqAdk+caAX
         JKpuSUKzLtljyOMfdTynOyUIyRd3zoby/oJ91nDk2LTY1QkaKNfEE76WWpcrF7ErWTd0
         WFF+k9SlcORuuNNVmTX4uojcJG6qwQyaLyM5wJkRtovSccRkR7g8dyb7RN9W/zztHwsO
         bVo6xQcBabLzdm+0mtp7Xg9W3aE/RiXjPCJjhFFjAfoQxs5hO2xM8Dz1evxnE+aMHVQr
         ILOiOJBl31H9H4yX44IrLgi9sfkuV2PVZzcC47pJGhO4hGXV8kWDtE/CyfBdqCOIydRM
         1fow==
X-Gm-Message-State: AOAM531GWMfjB2lgMkQxEw/lnBhLKShGuDeDOjpAXSELtfTlBd429b/b
	/hleXMT93lQY/TPv/heB/vFd069ModW1Gw==
X-Google-Smtp-Source: ABdhPJxeftYE4Os0sLEuAQ/sB303gmPy587QszBwr5+LDbuh9IUtwDmEwduwMULLbXIr9i+2Z7E75A==
X-Received: by 2002:a05:6a00:21c8:b0:4c4:4bd:dc17 with SMTP id t8-20020a056a0021c800b004c404bddc17mr37569856pfj.57.1653556639659;
        Thu, 26 May 2022 02:17:19 -0700 (PDT)
Received: from localhost (subs02-180-214-232-6.three.co.id. [180.214.232.6])
        by smtp.gmail.com with ESMTPSA id m15-20020aa7900f000000b00518ebba4462sm923204pfo.119.2022.05.26.02.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 02:17:18 -0700 (PDT)
Date: Thu, 26 May 2022 16:17:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: dangling pointer to '__str' error on ppc64_defconfig, GCC 12.1.0
Message-ID: <Yo9Fm/hdtac1t9sW@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, David Howells <dhowells@redhat.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi everyone,

Attempting to build ppc64_defconfig kernel with powerpc64-unknown-linux-gnu
(GCC 12.1.0) on v5.18, I got build error on ftrace.o:

  CC      arch/powerpc/kernel/trace/ftrace.o
  CC      init/init_task.o
In file included from ./include/asm-generic/bug.h:22,
                 from ./arch/powerpc/include/asm/bug.h:156,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/thread_info.h:13,
                 from ./include/asm-generic/preempt.h:5,
                 from ./arch/powerpc/include/generated/asm/preempt.h:1,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:55,
                 from arch/powerpc/kernel/trace/ftrace.c:16:
arch/powerpc/kernel/trace/ftrace.c: In function 'ftrace_modify_code':
./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                                            ^
./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                 ^~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:75:17: note: in expansion of macro 'pr_err'
   75 |                 pr_err("%p: replaced (%s) != old (%s)",
      |                 ^~~~~~
In file included from ./arch/powerpc/include/asm/code-patching.h:14,
                 from arch/powerpc/kernel/trace/ftrace.c:26:
./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
  156 |         char __str[PPC_INST_STR_LEN];   \
      |              ^~~~~
./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                                 ^~~~~~~~~~~
./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                          ^~~~~~~~~~~~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:75:17: note: in expansion of macro 'pr_err'
   75 |                 pr_err("%p: replaced (%s) != old (%s)",
      |                 ^~~~~~
arch/powerpc/kernel/trace/ftrace.c: In function '__ftrace_make_nop_kernel':
./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                                            ^
./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                 ^~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:379:17: note: in expansion of macro 'pr_err'
  379 |                 pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
      |                 ^~~~~~
./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
  156 |         char __str[PPC_INST_STR_LEN];   \
      |              ^~~~~
./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                                 ^~~~~~~~~~~
./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                          ^~~~~~~~~~~~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:379:17: note: in expansion of macro 'pr_err'
  379 |                 pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
      |                 ^~~~~~
arch/powerpc/kernel/trace/ftrace.c: In function '__ftrace_make_call_kernel':
./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                                            ^
./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                 ^~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:638:17: note: in expansion of macro 'pr_err'
  638 |                 pr_err("Unexpected call sequence at %p: %s\n", ip, ppc_inst_as_str(op));
      |                 ^~~~~~
./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
  156 |         char __str[PPC_INST_STR_LEN];   \
      |              ^~~~~
./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                                 ^~~~~~~~~~~
./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                          ^~~~~~~~~~~~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:638:17: note: in expansion of macro 'pr_err'
  638 |                 pr_err("Unexpected call sequence at %p: %s\n", ip, ppc_inst_as_str(op));
      |                 ^~~~~~
arch/powerpc/kernel/trace/ftrace.c: In function '__ftrace_make_nop':
./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                                            ^
./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                 ^~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:205:17: note: in expansion of macro 'pr_err'
  205 |                 pr_err("Expected %08lx found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
      |                 ^~~~~~
./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
  156 |         char __str[PPC_INST_STR_LEN];   \
      |              ^~~~~
./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                                 ^~~~~~~~~~~
./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                          ^~~~~~~~~~~~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:205:17: note: in expansion of macro 'pr_err'
  205 |                 pr_err("Expected %08lx found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
      |                 ^~~~~~
./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                                            ^
./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                 ^~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:139:17: note: in expansion of macro 'pr_err'
  139 |                 pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
      |                 ^~~~~~
./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
  156 |         char __str[PPC_INST_STR_LEN];   \
      |              ^~~~~
./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                                 ^~~~~~~~~~~
./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                          ^~~~~~~~~~~~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:139:17: note: in expansion of macro 'pr_err'
  139 |                 pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
      |                 ^~~~~~
arch/powerpc/kernel/trace/ftrace.c: In function '__ftrace_make_call':
./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                                            ^
./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                 ^~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:506:17: note: in expansion of macro 'pr_err'
  506 |                 pr_err("Unexpected call sequence at %p: %s %s\n",
      |                 ^~~~~~
./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
  156 |         char __str[PPC_INST_STR_LEN];   \
      |              ^~~~~
./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
  418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
      |                                 ^~~~~~~~~~~
./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
  446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
      |                          ^~~~~~~~~~~~~~~~~
./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
  489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~
arch/powerpc/kernel/trace/ftrace.c:506:17: note: in expansion of macro 'pr_err'
  506 |                 pr_err("Unexpected call sequence at %p: %s %s\n",
      |                 ^~~~~~
cc1: all warnings being treated as errors
make[3]: *** [scripts/Makefile.build:288: arch/powerpc/kernel/trace/ftrace.o] Error 1

I also hit this error on current master (commit babf0bb978e3c9
("Merge tag 'xfs-5.19-for-linus' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux")).

Thanks.

Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara
