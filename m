Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6EA8946D6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Apr 2024 23:58:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7lJB1y55z3dXg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 08:58:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.179; helo=mail-pg1-f179.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7lHj6l0lz30dn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 08:57:52 +1100 (AEDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5ce2aada130so2870829a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Apr 2024 14:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712008670; x=1712613470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8UfSrf52JJMdrVtOwtjSHHbkV0f0ZXXQAnL3rbNBFc=;
        b=tTnWophWctC9nvk9H79QnT2KnzThtoFVbA0fVOuxZ+a0wzqxY2ATz/6kcaTZuyMePe
         O5zNAPimMar26SaSVxo9D0BwIzGDHrFQXlT+8bl7dHBHRcS+tOkZqiwPc/hmdmxa+Kkj
         SJJbiTEyH0fESpTnQ3p3dUpYMkDJiTs4UjMDg309JXmhofmd+gHFKUONbj3F74W4ap2h
         q34+PmuBZohTgnfsNVsGUag8SkYTFJHMP6Il7SSq9tuALh6waTdF5Q3HEBbY+0ItWLmX
         HxsVg9kOBNso/doSKnbpErdsfczgBhLM6wBC2Cr6UgyvyiYF0zIZgO3GBRISG0w7b4Qj
         tIiA==
X-Forwarded-Encrypted: i=1; AJvYcCU3RO0W+Rsa7QLnvoA9FQAJHsd/K/DZ+eD7aaYGwzpG7BicXH8RTXc4+B0E4+0mcJYFDAN2Z3ihMcZGNhYdl4erR5VtjL+G11fULQVhEg==
X-Gm-Message-State: AOJu0Yw3U3RvjFhpgZReu3uKODZnwAdGNPzf1Zey8N+utQ2y7yMZOB+r
	k5QVezMmYJlE7Laut9j7BEF3IyooVusWyvfWeK93ASis+N+MtJtE/vV6teUzEfBcS7jMpmfdAie
	BtIzGL67iflqigkKqURh9Djbepmc=
X-Google-Smtp-Source: AGHT+IE5CshP9G95K3h6KzIjH3gXNmWewC8ljIs5UZIW6UwkBnj40+kP4TBtCCpOFctnp8quyiwNg1BhuAspPAB29L0=
X-Received: by 2002:a17:90a:540d:b0:29b:961a:29c3 with SMTP id
 z13-20020a17090a540d00b0029b961a29c3mr7476698pjh.49.1712008670215; Mon, 01
 Apr 2024 14:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240309072513.9418-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240309072513.9418-1-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 1 Apr 2024 14:57:39 -0700
Message-ID: <CAM9d7chQBpqipotQwc_ASYhzi9ZOP+TfenBzFJjyQ3-j5kGRBg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add data type profiling support for powerpc
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Sorry for the super late reply.


On Fri, Mar 8, 2024 at 11:25=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> The patchset from Namhyung added support for data type profiling
> in perf tool. This enabled support to associate PMU samples to data
> types they refer using DWARF debug information. With the upstream
> perf, currently it possible to run perf report or perf annotate to
> view the data type information on x86.
>
> This patchset includes changes need to enable data type profiling
> support for powerpc. Main change are:
> 1. powerpc instruction nmemonic table to associate load/store
> instructions with move_ops which is use to identify if instruction
> is a memory access one.
> 2. To get register number and access offset from the given
> instruction, code uses fields from "struct arch" -> objump.
> Add entry for powerpc here.
> 3. A get_arch_regnum to return register number from the
> register name string.
>
> These three patches are the basic foundational patches.
> With these changes, data types is getting identified for kernel
> and user-space samples. There are still samples, which comes as
> "unknown" and needs to be checked. We plan to get those addressed
> in follow up. With the current patchset:
>
>  ./perf record -a -e mem-loads sleep 1
>  ./perf report -s type,typeoff --hierarchy --group --stdio
> Snippet of logs:
>
>  Total Lost Samples: 0
>
>  Samples: 277  of events 'mem-loads, dummy:u'
>  Event count (approx.): 149813
>
>             Overhead  Data Type / Data Type Offset
>  ...................  ............................
>
>     65.93%   0.00%     (unknown)
>        65.93%   0.00%     (unknown) +0 (no field)
>      8.19%   0.00%     struct vm_area_struct
>         8.19%   0.00%     struct vm_area_struct +136 (vm_file)
>      4.53%   0.00%     struct rq
>         3.14%   0.00%     struct rq +0 (__lock.raw_lock.val)
>         0.83%   0.00%     struct rq +3216 (avg_irq.runnable_sum)
>         0.24%   0.00%     struct rq +4 (nr_running)
>         0.14%   0.00%     struct rq +12 (nr_preferred_running)
>         0.12%   0.00%     struct rq +2760 (sd)
>         0.06%   0.00%     struct rq +3368 (prev_steal_time_rq)
>         0.01%   0.00%     struct rq +2592 (curr)
>      3.53%   0.00%     struct rb_node
>         3.53%   0.00%     struct rb_node +0 (__rb_parent_color)
>      3.43%   0.00%     struct slab
>         3.43%   0.00%     struct slab +32 (freelist)
>      3.30%   0.00%     unsigned int
>         3.30%   0.00%     unsigned int +0 (no field)
>      3.22%   0.00%     struct vm_fault
>         3.22%   0.00%     struct vm_fault +48 (pmd)
>      2.55%   0.00%     unsigned char
>         2.55%   0.00%     unsigned char +0 (no field)
>      1.06%   0.00%     struct task_struct
>         1.06%   0.00%     struct task_struct +4 (thread_info.cpu)
>      0.92%   0.00%     void*
>         0.92%   0.00%     void* +0 (no field)
>      0.74%   0.00%     __int128 unsigned
>         0.74%   0.00%     __int128 unsigned +8 (no field)
>      0.59%   0.00%     struct perf_event
>         0.54%   0.00%     struct perf_event +552 (ctx)
>         0.04%   0.00%     struct perf_event +152 (pmu)
>      0.20%   0.00%     struct sched_entity
>         0.20%   0.00%     struct sched_entity +0 (load.weight)
>      0.18%   0.00%     struct cfs_rq
>         0.18%   0.00%     struct cfs_rq +96 (curr)

Cool!  I'm happy to see it works well on powerpc too.

Lots of codes are still assuming x86 so you may need to
add separate logics like parsing the instruction location.

And instruction tracking is also a great concern.
But we may have something in the clang/LLVM to produce
more debug information and hopefully we can remove the
instruction tracking at all.

https://github.com/llvm/llvm-project/pull/81545

Anyway I'm really looking forward to seeing v2 soon.

Thanks,
Namhyung

>
> Athira Rajeev (3):
>   tools/perf/arch/powerpc: Add load/store in powerpc annotate
>     instructions for data type profling
>   tools/erf/util/annotate: Set register_char and memory_ref_char for
>     powerpc
>   tools/perf/arch/powerc: Add get_arch_regnum for powerpc
>
>  .../perf/arch/powerpc/annotate/instructions.c | 66 +++++++++++++++++++
>  tools/perf/arch/powerpc/util/dwarf-regs.c     | 29 ++++++++
>  tools/perf/util/annotate.c                    |  5 ++
>  3 files changed, 100 insertions(+)
>
> --
> 2.43.0
>
