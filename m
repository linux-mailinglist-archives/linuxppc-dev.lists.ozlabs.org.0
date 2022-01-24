Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4789498972
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 19:56:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjK2M511Jz3bcZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 05:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.44; helo=mail-ua1-f44.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjK1x07Ytz2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 05:55:48 +1100 (AEDT)
Received: by mail-ua1-f44.google.com with SMTP id w21so32801100uan.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 10:55:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ME4XZXZ5PNYvzDH4OmBox2BIuMK+Mc5MwbGfrqjcLBM=;
 b=WcKIqTjUdF46eDBv+AgW/SfXTeTdW2cGstKE7DxytVlcDXYuFtY4muxNFnaTSxNNiZ
 wlsJb5FlqzgbzzCmD25c4E+lrsRgymmzIlRI+WQQEJ18mgRwilth7I9O4ohAg8NrcktN
 56VVbiAYDqGvNZR14P4DoQxTtPjemcQ6LViv4J1lEmjYNNj7gHthotDj/6+Y5mJQ8Wai
 AQUkKqqmo3M041oWe8F+1NnqncDewUj3Uvu5Q1ylQP/p795iBV8LTAx3QOAGV0BZjGZS
 TtpLwTdGpQ5q91ZxvI5qnWTtd0cHp2buXYwN5lUSqp8f0ZLi4s1tVz5lrfbmqeyFn3vT
 +BoQ==
X-Gm-Message-State: AOAM530vpbHtUw9ttXagfGxX+xhKywTdtveJNIPD5FHqPlpIg9pvNMXO
 QG1XfgXXdp1fhFMDkG0zrbqUFPcM4dBgzA==
X-Google-Smtp-Source: ABdhPJxICRx6AqJl2FUZ2BrBi7hjpw4iCiPFhuWu3jmxKbWUkuCGRNw9bFKA8jxB58yAx1irj7QS5g==
X-Received: by 2002:a67:3394:: with SMTP id z142mr4598650vsz.54.1643050544080; 
 Mon, 24 Jan 2022 10:55:44 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id 128sm2706768vsz.4.2022.01.24.10.55.43
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 10:55:43 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id l1so30983776uap.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 10:55:43 -0800 (PST)
X-Received: by 2002:a9f:2070:: with SMTP id 103mr2821729uam.122.1643050543058; 
 Mon, 24 Jan 2022 10:55:43 -0800 (PST)
MIME-Version: 1.0
References: <20220123125737.2658758-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2201240851560.2674757@ramsan.of.borg>
 <CADnq5_MUq0fX7wMLJyUUxxa+2xoRinonL-TzD8tUhXALRfY8-A@mail.gmail.com>
In-Reply-To: <CADnq5_MUq0fX7wMLJyUUxxa+2xoRinonL-TzD8tUhXALRfY8-A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jan 2022 19:55:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUWqHYbbavtMT-XAD_sarDPC5xnc3c0pX1ZAh3Wuzuzg@mail.gmail.com>
Message-ID: <CAMuHMdWUWqHYbbavtMT-XAD_sarDPC5xnc3c0pX1ZAh3Wuzuzg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.17-rc1
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 KVM list <kvm@vger.kernel.org>, Network Development <netdev@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Tobin C. Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alex,

On Mon, Jan 24, 2022 at 7:52 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> On Mon, Jan 24, 2022 at 5:25 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, 23 Jan 2022, Geert Uytterhoeven wrote:
> > >  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: error: control reaches end of non-void function [-Werror=return-type]:  => 1560:1
>
> I don't really see what's going on here:
>
> #ifdef CONFIG_X86_64
> return cpu_data(first_cpu_of_numa_node).apicid;
> #else
> return first_cpu_of_numa_node;
> #endif

Ah, the actual failure causing this was not included:

In file included from /kisskb/src/arch/x86/um/asm/processor.h:41:0,
                 from /kisskb/src/include/linux/mutex.h:19,
                 from /kisskb/src/include/linux/kernfs.h:11,
                 from /kisskb/src/include/linux/sysfs.h:16,
                 from /kisskb/src/include/linux/kobject.h:20,
                 from /kisskb/src/include/linux/pci.h:35,
                 from
/kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:25:
/kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: In
function 'kfd_cpumask_to_apic_id':
/kisskb/src/arch/um/include/asm/processor-generic.h:103:18: error:
called object is not a function or function pointer
 #define cpu_data (&boot_cpu_data)
                  ^
/kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1556:9:
note: in expansion of macro 'cpu_data'
  return cpu_data(first_cpu_of_numa_node).apicid;
         ^
/kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1560:1:
error: control reaches end of non-void function [-Werror=return-type]
 }
 ^

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
