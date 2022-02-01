Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C92D4A5997
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 11:03:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp0rG2kNhz3bSx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 21:03:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m8l3iizy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=matorola@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=m8l3iizy; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp0qY0qd9z2xsY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 21:03:02 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id jx6so52841971ejb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mClIZuGiU90N8/wVEGuz0kPrT8HDVsO1SF0mMBp9TKA=;
 b=m8l3iizy6m+bL/jBYQ1WY3ATqWzlyg2KTCyNULM3eVNvkC5wqKTucOmaIxZWFKKHKC
 O4vEtqtNwuq399PL5WPFG5Z7vCu6zPPjoimtCnr8vb/5lojlVqjvZJwxMJzVd0Vk35+r
 ZVAR+4L1KqtGJhgkD+zr3U76KGUGG1P7/BPweFRor+Y6JBV2yCS0CX+UFmYJA0lC10As
 KSMXOwfQMpM5C1cOo7NxFB454lv8KZ0AWzZzM/pxNJiKv31JpTcyWfsVCUPzCl573dFS
 WOqZrDF8DuO60afmvVeUg1FCdgzqdmHYIJrUyRb6laaV9nlyKLCU0X2qcosie45x9Rgc
 yezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mClIZuGiU90N8/wVEGuz0kPrT8HDVsO1SF0mMBp9TKA=;
 b=EWwZ4fP2k6i0GhlRUNZGahkAWOKHEjL/42pzMGBDhjN+w/0mTu01A70RpFJ7+sZ+BV
 wPRC1zuY9O7lUuWkZiwciJtONJdVue1TySV/7jovWreMgAdtQsm6RUdllrkM9hg/iUBn
 VAAYLtx+i9c7gkB0PWnrrBJ1dZGfyq1zm6F3jQk1omFMI+ksnqXXm+yA/Yh0E8RimyLk
 SXpgrizW+Ig1LKzAQt1Gp9FiTvyHNOQX09iGiCQ1UIEF2FKCmTuSyOZFe33NbyWc6KXR
 +dMa9kDTieFSr/uIvUIStd9Qc6PssIuEsVaWMcBQ91u7MflwsY6gT6MuXsw5FKnBi+Nb
 89Jw==
X-Gm-Message-State: AOAM530RkZ9GNq4YWnRUtNdyY5sCLfWYMO/BlQc16S77adRxYEpRg9Nd
 /H5xkAPI3tPELlg1v/yeeCG/VytaDo3SsjhjpVU=
X-Google-Smtp-Source: ABdhPJyfD5PfJ3o2DgbfikfmuisQ6IDuSCV1txCGADlAID79HMnZ8k2HT/445aAlBSn/3Hrxj9wDnw0NxNHNH60hLfE=
X-Received: by 2002:a17:907:1c1c:: with SMTP id
 nc28mr20280513ejc.651.1643709778741; 
 Tue, 01 Feb 2022 02:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20220128151540.164759-1-david@redhat.com>
In-Reply-To: <20220128151540.164759-1-david@redhat.com>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Tue, 1 Feb 2022 13:02:45 +0300
Message-ID: <CADxRZqx_rAkwFVwSc1ohm-RqKD=-pcBsR+rBrRaw9KazQncANQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
To: David Hildenbrand <david@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>, Rich Felker <dalias@libc.org>,
 Paul Mackerras <paulus@samba.org>,
 Sparc kernel list <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 2:11 PM David Hildenbrand <david@redhat.com> wrote:
>
> ... and call node_dev_init() after memory_dev_init() from driver_init(),
> so before any of the existing arch/subsys calls. All online nodes should
> be known at that point.
>
> This is in line with memory_dev_init(), which initializes the memory
> device subsystem and creates all memory block devices.
>
> Similar to memory_dev_init(), panic() if anything goes wrong, we don't
> want to continue with such basic initialization errors.
>
> The important part is that node_dev_init() gets called after
> memory_dev_init() and after cpu_dev_init(), but before any of the
> relevant archs call register_cpu() to register the new cpu device under
> the node device. The latter should be the case for the current users
> of topology_init().
>
> RFC because I tested only on x86-64 and s390x, I think I cross-compiled all
> applicable architectures except riscv and sparc.

Compiled and boot tested on sparc.

Tested-by: Anatoly Pugachev <matorola@gmail.com> (sparc64)
