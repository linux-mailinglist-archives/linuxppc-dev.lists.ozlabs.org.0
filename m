Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9206A3B1F14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 18:55:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G98Xg2vJ6z3bwg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 02:55:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CueGo6nh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CueGo6nh; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G98XD487Wz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 02:55:24 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id c16so3866239ljh.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ax+qMkz9tc+3GIw6VBZG84/vn46E053CBBShLS/lu7Y=;
 b=CueGo6nhL0ih/I8+FW2BDzxSi8s4y6185nndbX4VnBGU3Q0H2Dp7iJ49iu+3Go58DR
 yqUuhfV3Ox29PVtvujH9wwUuCShzRU8yiOVxzFinEjKUAJAS0aTMVkDBL/dqryqKGyky
 NpznK3UeD2MPMmPb/Lv+GFPLtebrapqwECa55UF+u7pJn21DUBY2OP+7tjRH3FyOCpuH
 WOA2/vw1hBW/rfog/bzKCiV5ZjXIf28yVBXXXuGxf3/e4kKGxkUCeGguZxtnd+TI0VuF
 +oL0McSqtoJmyHof+hJzkoDTkfVTXv2p9QvJiEJIrRbohBXdMIrZa5ojlZUh2rPjduL7
 qDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ax+qMkz9tc+3GIw6VBZG84/vn46E053CBBShLS/lu7Y=;
 b=bzrfMKqL7JOYPGUt4mCU9LZ2Mgex0pcyvKpNEyJ7MG9KBe/RNtYUsHSwy76te2/THD
 AFP8S55qtv7e9DY7YcVkIih/bqiwZh8Gz+hPoN7m6jxmM4uuyBalsKtbBBb9cQcVH3J3
 WubGMzg3u0x/6K5+VQI0jGY6d1zr8rQI8Cr1n8K09bCmO6HeFE4dt96U9Tkkrn9be6cN
 o1fQO5eU+dUOJmAVtbxCOgn9FwHtNEoL2Jl7oAicVW31Fkos09ne8SyF14IcDMBShdp+
 p5ETsMjFUMFK0DYXj/8mltXcDXZ/+LeQLZqMwgJHfdv5EDiYDrCJnMIgtatCxkajxI/d
 mNqA==
X-Gm-Message-State: AOAM531oc0WoNYSmdTXoeUxYXt5WrtQKpEKFXmFVulvzgTsDtqA6er+S
 xrrS1eHmTOUmxvcRXRzVgG6TnZQc0hFrtJyq8aVsvA==
X-Google-Smtp-Source: ABdhPJxoNHsqS0Cspo6atJ2cS4VJgFv31o0Wr8mvnTzi19fZT73UHF2RR+bG/GciFyWIfq1NDhfzJrZct1B7Gxe2TMs=
X-Received: by 2002:a2e:90ca:: with SMTP id o10mr476096ljg.299.1624467318567; 
 Wed, 23 Jun 2021 09:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book>
 <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book>
 <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com>
 <20210623120835.GB29143@vingu-book>
 <5D874F72-B575-4830-91C3-8814A2B371CD@linux.vnet.ibm.com>
In-Reply-To: <5D874F72-B575-4830-91C3-8814A2B371CD@linux.vnet.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 23 Jun 2021 18:55:07 +0200
Message-ID: <CAKfTPtBKn27=jryS_sxsVb+0yHDze_PMcLuyFtDkDo0H9Nzqww@mail.gmail.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Odin Ugedal <odin@uged.al>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 23 Jun 2021 at 18:46, Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:
>
>
> > Ok. This becomes even more weird. Could you share your config file and more details about
> > you setup ?
> >
> > Have you applied the patch below ?
> > https://lore.kernel.org/lkml/20210621174330.11258-1-vincent.guittot@linaro.org/
> >
> > Regarding the load_avg warning, I can see possible problem during attach. Could you add
> > the patch below. The load_avg warning seems to happen during boot and sched_entity
> > creation.
> >
>
> Here is a summary of my testing.
>
> I have a POWER box with PowerVM hypervisor. On this box I have a logical partition(LPAR) or guest
> (allocated with 32 cpus 90G memory) running linux-next.
>
> I started with a clean slate.
> Moved to linux-next 5.13.0-rc7-next-20210622 as base code.
> Applied patch #1 from Vincent which contains changes to dequeue_load_avg()
> Applied patch #2 from Vincent which contains changes to enqueue_load_avg()
> Applied patch #3 from Vincent which contains changes to attach_entity_load_avg()
> Applied patch #4 from https://lore.kernel.org/lkml/20210621174330.11258-1-vincent.guittot@linaro.org/
>
> With these changes applied I was still able to recreate the issue. I could see kernel warning
> during boot.
>
> I then applied patch #5 from Odin which contains changes to update_cfs_rq_load_avg()
>
> With all the 5 patches applied I was able to boot the kernel without any warning messages.
> I also ran scheduler related tests from ltp (./runltp -f sched) . All tests including cfs_bandwidth01
> ran successfully. No kernel warnings were observed.

ok so Odin's patch fixes the problem which highlights that we
overestimate _sum or don't sync _avg and _sum correctly

I'm going to look at this further

>
> Have also attached .config in case it is useful. config has CONFIG_HZ_100=y

Thanks, i will have a look

>
> Thanks
> -Sachin
>
