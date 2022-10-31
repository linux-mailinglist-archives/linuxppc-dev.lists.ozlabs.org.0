Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E17E1613336
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 11:04:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N17zf60xrz3cJr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 21:04:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=NVMInip0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=NVMInip0;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N17yg5W7lz2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 21:03:37 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id y14so28047576ejd.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 03:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij0opVplOZ4JlIp6K8xwI+xLgpGAyEZHWtU1AyZKEUo=;
        b=NVMInip05i3j2Mewd8/9DA5VH9moDODkHGKksq2V35DG4ZziDSBIvUuAT9vkgpRf0d
         21cfnb+Ic7yb0fKpaQko2/3X06kq6xe/XCHQEYDl6OhLI2/0FrdGqDZUQd1J7/senkcv
         DOl89eFWBJftp3vto1gh5cWgUBeCTuph9SIKiz0krDlDYUjX/89nzBZ1SkCF6yXeBQ5L
         oy/FLx+eyQ0Wt0BTeHJp3vkdt0LtCHU4KDi4RBqwOyUiIBl9/k/dAugnydtOxw9EUUT/
         ArMtYe3iEM2RkUy0/xdIxnvFPevgupjBBbMoUxHQvvlem6IUyPz4BSgqjGCJMagdWnvZ
         oKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij0opVplOZ4JlIp6K8xwI+xLgpGAyEZHWtU1AyZKEUo=;
        b=p4jS+1T13TYomWq1cXVFF1n7w4BYp1RixetW8cllh+QK/nW4XA+YVR+A5YExT0ofLg
         7set24jlWxxl29IkY2xhkVvD78Cn6RkhgOuc++06SQ7rFbHOR9bB3IHw3bYsaBUbCPrq
         2TmbZkSvYL1jBOuG7zYaFGEZaxYywpiMJEOoBRFWNkdOjDopSQwe9ximAPi4jzbqA/LU
         IjyUrqbq75Q6r9olj1BVJ2ZygckkXN2Kono0OKJ3sukMiKHgaULCLolfcXvYK2AU8OAS
         U6okwb6Y4dpfsjzpXNyHfz96UrJXvW5G79QxbMWFTJCeQFX5XRQAnbFuF2/eO77gMuJX
         xkbQ==
X-Gm-Message-State: ACrzQf1ZpnoXPKM6q08OnyVQcFLEz+2s+oEePSSrTHyw0YS7WVPWe8Xi
	3fQ1GeLPpDM+eB2c5wJlAs56Yw==
X-Google-Smtp-Source: AMsMyM6ycpS4chQBPAohNrxS8VumeP7MjXmU/tZoBGLw1w6j4emq8bR2PAjr2PZhdKbiabGv9P0mtA==
X-Received: by 2002:a17:906:9745:b0:78d:480f:cee7 with SMTP id o5-20020a170906974500b0078d480fcee7mr11952970ejy.192.1667210609260;
        Mon, 31 Oct 2022 03:03:29 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id eh22-20020a0564020f9600b00461bacee867sm3048302edb.25.2022.10.31.03.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 03:03:28 -0700 (PDT)
Date: Mon, 31 Oct 2022 11:03:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <20221031100327.r7tswmpszvs5ot5n@kamzik>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com>
 <20221028074828.b66uuqqfbrnjdtab@kamzik>
 <Y1vrMMtRwb0Lekl0@yury-laptop>
 <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1+OUawGJDjh4DOJ@zn.tnic>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, openrisc@lists.librecores.org, Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 31, 2022 at 09:58:57AM +0100, Borislav Petkov wrote:
> On Mon, Oct 31, 2022 at 09:06:04AM +0100, Andrew Jones wrote:
> >  The valid cpumask range is [0, nr_cpu_ids) and cpumask_next() always
> >  returns a CPU ID greater than its input, which results in its input
> >  range being [-1, nr_cpu_ids - 1). Ensure showing CPU info avoids
> >  triggering error conditions in cpumask_next() by stopping its loop
> 
> What error conditions?
> 
> What would happen if @n is outside of the valid range?

Currently (after the revert of 78e5a3399421) with DEBUG_PER_CPU_MAPS we'll
get a warning splat when the cpu is outside the range [-1, nr_cpu_ids) and
cpumask_next() will call find_next_bit() with the input plus one anyway.
find_next_bit() doesn't explicity document what happens when an input is
outside the range, but it currently returns the bitmap size without any
side effects, which means cpumask_next() will return nr_cpu_ids.
show_cpuinfo() doesn't try to show anything in that case and stops its
loop, or, IOW, things work fine now with an input of nr_cpu_ids - 1. But,
show_cpuinfo() is just getting away with a violated cpumask_next()
contract, which 78e5a3399421 exposed. How about a new commit message like
this

  seq_read_iter() and cpuinfo's start and next seq operations implement a
  pattern like

    n = cpumask_next(n - 1, mask);
    show(n);
    while (1) {
        ++n;
        n = cpumask_next(n - 1, mask);
        if (n >= nr_cpu_ids)
           break;
        show(n);
    }

  which loops until cpumask_next() identifies its CPU ID input is out of
  its valid range, [-1, nr_cpu_ids - 1). seq_read_iter() assumes the
  result of an invalid input is to return nr_cpu_ids or larger without any
  side effects, however the cpumask API does not document that and it
  reserves the right to change how it responds to invalid inputs. Ensure
  inputs from seq_read_iter() are valid.

Thanks,
drew
