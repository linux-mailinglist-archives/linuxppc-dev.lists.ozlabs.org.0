Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A2832E96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 19:03:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jWU2/wy0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGnXX4hc8z3cPN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 05:03:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jWU2/wy0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGnWd3Qkgz3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 05:02:19 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5ff45c65e60so9264757b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 10:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705687335; x=1706292135; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5b/i454jUf4ojxYvY+VxBq+cGu5zdwzrcVsmFXePrUc=;
        b=jWU2/wy0WpsGglkIMWfT4gDB/IkpdAiTRa0yRChzJyXv9GDlsvvqpK0hYpqT2AliVo
         KGQS06EfLUrDKKiCPh8zd/Bcq4i4yuKqknRIPzZL173/+ObcTfQ/g6qsIhYEL9lS46W5
         k+jJA4ZMlu/KhP1DH0QbbdhOElPlYFvlT5/nM5WH6X92exefLy8utDaLrr7REdx5bibP
         zk+0BeB3r2s8wM5f7sPQyyIKPE6WlhXJC3Z60u8OmvYpcjfntMJYikAW+UcvXoZvgEtV
         19wrx4RjcIaKe7/BJ4du8qd4h0CMcXgTVKOtW+8D2O8573HkQMvim/8wo2pO+Ak0wUCa
         op7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705687335; x=1706292135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5b/i454jUf4ojxYvY+VxBq+cGu5zdwzrcVsmFXePrUc=;
        b=brvOYVYwlnnbfKD0MuPxf2fAmjISnsp3DSYzuNVGvVje2/DcgZ4McLOwwP9QxS0SMF
         WHfJyta9DDl1QeiXlcB1MCSNd4wgAC7oRSgm/L/pcx0dIJT3EzEBpVhnZXGgN+zaCn3y
         DvYS+eZ7U3OgeaA7oUayfrCtUlbUzVKvKrhPV5laV91D8i4v1lJZKODdQvsHVzofO9wR
         ooS9qgKJXM9DjtAV15AabUR2SC5LuqV/RWGKkPK825sE0rNqpsLE/VvH6aE8uYhgsbCJ
         tbJb6Rr4Uvzju1g9pOEB/MUqi2188M22dkYQKHfTBGQrgBkCGSS/Wz0Y1+DoPQDOAw03
         qZ5Q==
X-Gm-Message-State: AOJu0Yy/h0YHRa+p5yDPRMxu+PNBSgfA3+0bL7d+gnDWoR4VLmZaRjio
	3qld1oOGkuipBu7ytececkLQrGiNBW2zJz+9bM3HyZa6H2M0/Tgm
X-Google-Smtp-Source: AGHT+IH9gcZrsox+4pkG+XVC3K2DCkhX2jg2gbQvfcMMKA5AWgDkyl6PTnKywYab9xjZ/eqMztcaSA==
X-Received: by 2002:a0d:e003:0:b0:5ff:9567:c81 with SMTP id j3-20020a0de003000000b005ff95670c81mr286738ywe.22.1705687334593;
        Fri, 19 Jan 2024 10:02:14 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2288:782e:a717:678d])
        by smtp.gmail.com with ESMTPSA id n68-20020a0dcb47000000b005ff877093easm1389519ywd.143.2024.01.19.10.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 10:02:14 -0800 (PST)
Date: Fri, 19 Jan 2024 10:02:13 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Shijie Huang <shijie@amperemail.onmicrosoft.com>
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <Zaq5JT6SaiogCEkT@yury-ThinkPad>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
 <Zao13I4Bb0tur0fZ@kernel.org>
 <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, chenhuacai@kernel.org, cl@os.amperecomputing.com, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, arnd@arndb.de, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, Huang Shijie <shijie@os.amperecomputing.com>, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 19, 2024 at 04:50:53PM +0800, Shijie Huang wrote:
> 
> 在 2024/1/19 16:42, Mike Rapoport 写道:
> > On Fri, Jan 19, 2024 at 02:46:16PM +0800, Shijie Huang wrote:
> > > 在 2024/1/19 12:42, Yury Norov 写道:
> > > > This adds another level of indirection, I think. Currently cpu_to_node
> > > > is a simple inliner. After the patch it would be a real function with
> > > > all the associate overhead. Can you share a bloat-o-meter output here?
> > > #./scripts/bloat-o-meter vmlinux vmlinux.new
> > > add/remove: 6/1 grow/shrink: 61/51 up/down: 1168/-588 (580)
> > > Function                                     old     new   delta
> > > numa_update_cpu                              148     244     +96
> > > 
> > >   ...................................................................................................................................(to many to skip)
> > > 
> > > Total: Before=32990130, After=32990710, chg +0.00%
> > It's not only about text size, the indirect call also hurts performance
> 
> The cpu_to_node() is called at very low frequency, most of the times is in
> the kernel booting time.
 
That doesn't matter. This function is a simple inliner that dereferences
a pointer, and I believe all of us want to keep it simple. 
 
> > > > Regardless, I don't think that the approach is correct. As per your
> > > > description, some initialization functions erroneously call
> > > > cpu_to_node() instead of early_cpu_to_node() which exists specifically
> > > > for that case.
> > > > 
> > > > If the above correct, it's clearly a caller problem, and the fix is to
> > > > simply switch all those callers to use early version.
> > > It is easy to change to early_cpu_to_node() for sched_init(),
> > > init_sched_fair_class()
> > > 
> > > and workqueue_init_early(). These three places call the cpu_to_node() in the
> > > __init function.
> > > 
> > > 
> > > But it is a little hard to change the early_trace_init(), since it calls
> > > cpu_to_node in the deep
> > > 
> > > function stack:
> > > 
> > >    early_trace_init() --> ring_buffer_alloc() -->rb_allocate_cpu_buffer()
> > > 
> > > 
> > > For early_trace_init(), we need to change more code.
> > > 
> > > 
> > > Anyway, If we think it is not a good idea to change the common code, I am
> > > oaky too.
> > Is there a fundamental reason to have early_cpu_to_node() at all?
> 
> The early_cpu_to_node does not work on some ARCHs (which support the NUMA),
> such
> 
> as  SPARC, MIPS and S390.

So, your approach wouldn't work either, right? I think you've got a
testing bot report on it already...

You can make it like this:

  #ifdef CONFIG_ARCH_NO_EARLY_CPU_TO_NODE
  #define early_cpu_to_node cpu_to_node
  #endif
 
> > It seems that all the mappings are known by the end of setup_arch() and the
> > initialization of numa_node can be moved earlier.
> > > > I would also initialize the numa_node with NUMA_NO_NODE at declaration,
> > > > so that if someone calls cpu_to_node() before the variable is properly
> > > > initialized at runtime, he'll get NO_NODE, which is obviously an error.
> > > Even we set the numa_node with NUMA_NO_NODE, it does not always produce
> > > error.

You can print this error yourself:

  #ifndef cpu_to_node
  static inline int cpu_to_node(int cpu)
  {
        int node = per_cpu(numa_node, cpu);

  #ifdef CONFIG_DEBUG_PER_CPU_MAPS
        if (node == NUMA_NO_NODE)
                pr_err(...);
  #endif

          return node;
  }
  #endif

