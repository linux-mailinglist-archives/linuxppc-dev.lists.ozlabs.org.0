Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D5C841F25
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 10:17:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GIQpSoHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPKLh6xJhz3cFf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 20:17:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GIQpSoHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=wenst@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPKKv1frYz2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 20:16:32 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d73066880eso29633515ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 01:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706606190; x=1707210990; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qSmJDkz986T7M3StX+74NzpcKDLTKyki6HvWHSvEFfE=;
        b=GIQpSoHA6udwkItAQ3VeR+DABxGerCHuuqxnq0+pUUQLd00lDVM2pA3awzgYNhLU/i
         SmRoahh9hwhfCEpsc2FV9LzBQ3PbMN9MPSrBQXAPgwlBV2YS4Mwm2ANwMJWbfvwb7gcv
         x5jg3rvuY9MES9J31uwophh/DX65PUEWokZZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706606190; x=1707210990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSmJDkz986T7M3StX+74NzpcKDLTKyki6HvWHSvEFfE=;
        b=i7V01MESfCEK5mZphrEW+1IL7+sZN50KxfOnd7lVEnqhEGnrXDzwE6NhE/XovWmCZM
         E9fHzqIez145XcMystCA6L7UbCfTsFbBIqkuB0idjxDW/1pNt5twLOnzgRyNTQikJbj0
         /sBxkvvs5v6GuGekeDLVlz7Ev+SfFSOsnOIZSPE+21JRWYxaPMqzxhA0M8CHtzqKQVS9
         VA5TiPFYRuq0hamwjREbAYlB4YDmEXX8xA37IXc7uu2tcADIpgqXuRKEYkpsIMA3MpbI
         btfiu0Zzcv1dkZV/STwBq3f3JZoJmjFFSUkG+A2/S/51d/Gyszxtq1Sdgj7OIF3Dgivf
         ZVfQ==
X-Gm-Message-State: AOJu0Yw1JVUUdi9fTMdh+oFgYf9oC1Sd8mTwCPqqOxu1Ed4oa9UD9+9i
	AwISMsGrv9yL5HHg68jr2yE9bE326zJQ4IrrVfuPIZlTRRYPhUMqqa5bmhVDCg==
X-Google-Smtp-Source: AGHT+IHFU/he6S9dxGtNcZ4mRuNpcLuFDaUOykdO5oi66rSbqDidpgnEH7smXpQQlGgP3nvFq0Mnaw==
X-Received: by 2002:a17:903:22cd:b0:1d7:7edb:e9b9 with SMTP id y13-20020a17090322cd00b001d77edbe9b9mr9062280plg.37.1706606189953;
        Tue, 30 Jan 2024 01:16:29 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:469:110f:d748:6896])
        by smtp.gmail.com with ESMTPSA id i18-20020a170902c95200b001d7439bf914sm6701420pla.235.2024.01.30.01.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:16:29 -0800 (PST)
Date: Tue, 30 Jan 2024 17:16:26 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Message-ID: <20240130091626.GA3684878@google.com>
References: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
 <ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, Jan 29, 2024 at 12:09:50PM -0800, Luis Chamberlain wrote:
> On Thu, Dec 21, 2023 at 10:02:46AM +0100, Christophe Leroy wrote:
> > Declaring rodata_enabled and mark_rodata_ro() at all time
> > helps removing related #ifdefery in C files.
> > 
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Very nice cleanup, thanks!, applied and pushed
> 
>   Luis

On next-20240130, which has your modules-next branch, and thus this
series and the other "module: Use set_memory_rox()" series applied,
my kernel crashes in some very weird way. Reverting your branch
makes the crash go away.

I thought I'd report it right away. Maybe you folks would know what's
happening here? This is on arm64.

[   10.481015] Unable to handle kernel paging request at virtual address ffffffde85245d30
[   10.490369] KASAN: maybe wild-memory-access in range [0x000000f42922e980-0x000000f42922e987]
[   10.503744] Mem abort info:
[   10.509383]   ESR = 0x0000000096000047
[   10.514400]   EC = 0x25: DABT (current EL), IL = 32 bits
[   10.522366]   SET = 0, FnV = 0
[   10.526343]   EA = 0, S1PTW = 0
[   10.530695]   FSC = 0x07: level 3 translation fault
[   10.537081] Data abort info:
[   10.540839]   ISV = 0, ISS = 0x00000047, ISS2 = 0x00000000
[   10.546456]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[   10.551726]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   10.557612] swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000041f98000
[   10.565214] [ffffffde85245d30] pgd=100000023ffff003, p4d=100000023ffff003, pud=100000023ffff003, pmd=10000001121eb003, pte=0000000000000000
[   10.578887] Internal error: Oops: 0000000096000047 [#1] PREEMPT SMP
[   10.585815] Modules linked in:
[   10.590235] CPU: 6 PID: 195 Comm: (udev-worker) Tainted: G    B              6.8.0-rc2-next-20240130-02908-ge8ad01d60927-dirty #163 3f2318148ecc5fa70d1092c2b874f9b59bdb7d60
[   10.607021] Hardware name: Google Tentacruel board (DT)
[   10.613607] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   10.621954] pc : module_bug_finalize+0x118/0x148
[   10.626823] lr : module_bug_finalize+0x118/0x148
[   10.631463] sp : ffffffc0820478d0
[   10.631466] x29: ffffffc0820478d0 x28: ffffffc082047ca0 x27: ffffffde8d7d31a0
[   10.631477] x26: ffffffde85223780 x25: 0000000000000000 x24: ffffffde8c413cc0
[   10.631486] x23: ffffffde8dfcec80 x22: ffffffde8dfce000 x21: ffffffde85223ba8
[   10.631495] x20: ffffffde85223780 x19: ffffffde85245d28 x18: 0000000000000000
[   10.631504] x17: ffffffde8aa15938 x16: ffffffde8aabdd90 x15: ffffffde8aab8124
[   10.631513] x14: ffffffde8acdd380 x13: 0000000041b58ab3 x12: ffffffbbd1bf9d91
[   10.631522] x11: 1ffffffbd1bf9d90 x10: ffffffbbd1bf9d90 x9 : dfffffc000000000
[   10.631531] x8 : 000000442e406270 x7 : ffffffde8dfcec87 x6 : 0000000000000001
[   10.631539] x5 : ffffffde8dfcec80 x4 : 0000000000000000 x3 : ffffffde8bbadf08
[   10.631548] x2 : 0000000000000001 x1 : ffffffde8eaff080 x0 : 0000000000000000
[   10.631556] Call trace:
[   10.631559]  module_bug_finalize+0x118/0x148
[   10.631565]  load_module+0x25ec/0x2a78
[   10.631572]  __do_sys_init_module+0x234/0x418
[   10.631578]  __arm64_sys_init_module+0x4c/0x68
[   10.631584]  invoke_syscall+0x68/0x198
[   10.631589]  el0_svc_common.constprop.0+0x11c/0x150
[   10.631594]  do_el0_svc+0x38/0x50
[   10.631598]  el0_svc+0x50/0xa0
[   10.631604]  el0t_64_sync_handler+0x120/0x130
[   10.631609]  el0t_64_sync+0x1a8/0x1b0
[   10.631619] Code: 97c5418e c89ffef5 91002260 97c53ca7 (f9000675)
[   10.631624] ---[ end trace 0000000000000000 ]---
[   10.642965] Kernel panic - not syncing: Oops: Fatal exception
[   10.642975] SMP: stopping secondary CPUs
[   10.648339] Kernel Offset: 0x1e0a800000 from 0xffffffc080000000
[   10.648343] PHYS_OFFSET: 0x40000000
[   10.648345] CPU features: 0x0,c0000061,7002814a,2100720b
[   10.648350] Memory Limit: none

