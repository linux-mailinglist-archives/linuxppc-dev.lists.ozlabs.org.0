Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D19186EDE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:45:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h0xM4pzSzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:45:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Kfy/sLZ2; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gxMb3KZ0zDqD1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 00:04:11 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id t3so7971814plz.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 06:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=gm3nq+v+QGkPerUNlfinQphw8ITuvw6SnqWBKvCOlbs=;
 b=Kfy/sLZ2EJ8aIHhCS04gM9F/jxgjFnksWPjtofT3qFbPgmsCJvVSILgnVnJ9JopX7r
 /6iQbFuvpTGcks/S4vd7OboaCmKYRrF9fU54K8Ai/l5br9Ets4/O6n4IObJOV/PL6IDm
 Z4uMmAhFuXiX+LLk4v/IQ+2isK6vhxak/HuMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=gm3nq+v+QGkPerUNlfinQphw8ITuvw6SnqWBKvCOlbs=;
 b=nwDCZOdFuX6TARiNwaP4eaAET3vD25LQUNgQaa7Th9TqaMCiw+9he2PuCo6G6pkN0u
 u3DJY4Pi82paMRq+jFL2xVSE9RP9H4mHYRtdIUwymiJ1W/M5vPx/3Ue6Z07NKKTbvCri
 OlfzS1r/GFuAeYviNChV0o5amc/pUJsM6vwAlZwURLDaOJhTaE9l71nRH/vXayaK15QT
 66Lox4zKkfeT/yRNIE7LyvJ5SmKXI26Rko/RxhimGSxll5+/jiOjAMqD/AISIkESePqC
 YU6rUJyGArIZXMEllXjb0NmKxQoQ0INZLiWMal/wzuVjKkjZ4/Il/v9vDfDn6c15Iq4C
 82og==
X-Gm-Message-State: ANhLgQ2EDlf8yGE2eNnyp3E9hmJ6+QXU/rSllOlmMfPThCsDA6264RDs
 4o77NNnEzFoUTbalCQ1eW4tG9g==
X-Google-Smtp-Source: ADFU+vskn1/3oxwY8FsGP4p1/BKcID7x94CYnVnY3jeAL5V0sf+PfLygADfeW6PK2s6r/iybZGCsmA==
X-Received: by 2002:a17:90a:bf0b:: with SMTP id
 c11mr26426966pjs.28.1584363846927; 
 Mon, 16 Mar 2020 06:04:06 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-789d-cd2c-42e1-23af.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:789d:cd2c:42e1:23af])
 by smtp.gmail.com with ESMTPSA id h22sm65481456pgn.57.2020.03.16.06.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 06:04:05 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 mpe@ellerman.id.au
Subject: Re: [PATCH v3 0/9] crypto/nx: Enable GZIP engine and provide userpace
 API
In-Reply-To: <1583540877.9256.24.camel@hbabu-laptop>
References: <1583540877.9256.24.camel@hbabu-laptop>
Date: Tue, 17 Mar 2020 00:04:02 +1100
Message-ID: <87y2s0o3i5.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mikey@neuling.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Haren,

If I understand correctly, to test these, I need to apply both this
series and your VAS userspace page fault handling series - is that
right?

Kind regards,
Daniel

> Power9 processor supports Virtual Accelerator Switchboard (VAS) which
> allows kernel and userspace to send compression requests to Nest
> Accelerator (NX) directly. The NX unit comprises of 2 842 compression
> engines and 1 GZIP engine. Linux kernel already has 842 compression
> support on kernel. This patch series adds GZIP compression support
> from user space. The GZIP Compression engine implements the ZLIB and
> GZIP compression algorithms. No plans of adding NX-GZIP compression
> support in kernel right now.
>
> Applications can send requests to NX directly with COPY/PASTE
> instructions. But kernel has to establish channel / window on NX-GZIP
> device for the userspace. So userspace access to the GZIP engine is
> provided through /dev/crypto/nx-gzip device with several operations.
>
> An application must open the this device to obtain a file descriptor (fd).
> Using the fd, application should issue the VAS_TX_WIN_OPEN ioctl to
> establish a connection to the engine. Once window is opened, should use
> mmap() system call to map the hardware address of engine's request queue
> into the application's virtual address space. Then user space forms the
> request as co-processor Request Block (CRB) and paste this CRB on the
> mapped HW address using COPY/PASTE instructions. Application can poll
> on status flags (part of CRB) with timeout for request completion.
>
> For VAS_TX_WIN_OPEN ioctl, if user space passes vas_id = -1 (struct
> vas_tx_win_open_attr), kernel determines the VAS instance on the
> corresponding chip based on the CPU on which the process is executing.
> Otherwise, the specified VAS instance is used if application passes the
> proper VAS instance (vas_id listed in /proc/device-tree/vas@*/ibm,vas_id).
>
> Process can open multiple windows with different FDs or can send several
> requests to NX on the same window at the same time.
>
> A userspace library libnxz is available:
>         https://github.com/abalib/power-gzip
>
> Applications that use inflate/deflate calls can link with libNXz and use
> NX GZIP compression without any modification.
>
> Tested the available 842 compression on power8 and power9 system to make
> sure no regression and tested GZIP compression on power9 with tests
> available in the above link.
>
> Thanks to Bulent Abali for nxz library and tests development.
>
> Changelog:
> V2:
>   - Move user space API code to powerpc as suggested. Also this API
>     can be extended to any other coprocessor type that VAS can support
>     in future. Example: Fast thread wakeup feature from VAS
>   - Rebased to 5.6-rc3
>
> V3:
>   - Fix sparse warnings (patches 3&6)
>
> Haren Myneni (9):
>   powerpc/vas: Initialize window attributes for GZIP coprocessor type
>   powerpc/vas: Define VAS_TX_WIN_OPEN ioctl API
>   powerpc/vas: Add VAS user space API
>   crypto/nx: Initialize coproc entry with kzalloc
>   crypto/nx: Rename nx-842-powernv file name to nx-common-powernv
>   crypto/NX: Make enable code generic to add new GZIP compression type
>   crypto/nx: Enable and setup GZIP compresstion type
>   crypto/nx: Remove 'pid' in vas_tx_win_attr struct
>   Documentation/powerpc: VAS API
>
>  Documentation/powerpc/index.rst                    |    1 +
>  Documentation/powerpc/vas-api.rst                  |  246 +++++
>  Documentation/userspace-api/ioctl/ioctl-number.rst |    1 +
>  arch/powerpc/include/asm/vas.h                     |   12 +-
>  arch/powerpc/include/uapi/asm/vas-api.h            |   22 +
>  arch/powerpc/platforms/powernv/Makefile            |    2 +-
>  arch/powerpc/platforms/powernv/vas-api.c           |  290 +++++
>  arch/powerpc/platforms/powernv/vas-window.c        |   23 +-
>  arch/powerpc/platforms/powernv/vas.h               |    2 +
>  drivers/crypto/nx/Makefile                         |    2 +-
>  drivers/crypto/nx/nx-842-powernv.c                 | 1062 ------------------
>  drivers/crypto/nx/nx-common-powernv.c              | 1133 ++++++++++++++++++++
>  12 files changed, 1723 insertions(+), 1073 deletions(-)
>  create mode 100644 Documentation/powerpc/vas-api.rst
>  create mode 100644 arch/powerpc/include/uapi/asm/vas-api.h
>  create mode 100644 arch/powerpc/platforms/powernv/vas-api.c
>  delete mode 100644 drivers/crypto/nx/nx-842-powernv.c
>  create mode 100644 drivers/crypto/nx/nx-common-powernv.c
>
> -- 
> 1.8.3.1
