Return-Path: <linuxppc-dev+bounces-12937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB26BE1CCE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 08:47:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnJRG1kvrz30Vl;
	Thu, 16 Oct 2025 17:47:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760597242;
	cv=none; b=VfXWSalBLmZWNvM1MwhNUwWLePUhnBmCmo6gFQPJYYOD1qMtcnTDPF6yxdkZtBgpV47ryfJoOWACZFnBCEkhobrXM1u6rdXk38XOszgUrPmNc0rXff1JYpZjdFtTQ35o0PllrIiKuzqVabJ5PITFQlg6R03oCr4r2CHkjWYnxRGO7jVC8jfvXKX6MQGFT2x65DD9U9loDwTrzOAsmk1OaMN+j5P+t/D5sX08E95thvwq9TkYmqrj+uxAAvCqtnk0rquCwxWQuyWkr8+AAl2Pvgdz8PoPGHu2SfwbYus8Kckeg+CKgVH2Xqy8JJdcgSDsPQfWWoUeWMg+ufW9S5SiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760597242; c=relaxed/relaxed;
	bh=Pb7LDfzXXyVo0hRBho4QG2UtvxZMiV3GvGZlWCU6TMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1r1+flelADFFxGrdQQRyChEw2VegMcXb5XiCJuh5ug3NjMiJsF9yxkOJRQFvDNRiQX1Ym5pa7LFVO8YDaaCEtRqpLiBVlLPUJ8NJKLXGt+p8/MvmLf1afVnAYMXGPQ16bBbe8N/iYdmxZg4MMrwjmYL2hkOrY7cERK4QPj8FvyCaiAwKE7TvsCwSknyAU9YrOT7lGY66zZYyeEQGrXWAniweu80uNuXk2G0iKDQpe7cX2wy63MEMVoOMfjXCmofZZFcCLnltiULBdIxRXDvs415REuRHRqlGRkNWfjfH4kgcuLn4isMeEGOg4oCyzEAePgYhnDlPvVk+I8oF+uFXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b7y6jGCi; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b7y6jGCi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnJRF2jCXz2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:47:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F7FB63DE4;
	Thu, 16 Oct 2025 06:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19869C4CEF1;
	Thu, 16 Oct 2025 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760597238;
	bh=izt9ZkFRB355gQZtjFJag0Q84QEoofTBJy9ofvbfAUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7y6jGCiJXRMvK9si/w0a5xxGSGQqn7X37hueTdWpz8b2rpfumL7nTwbWhz9AMNP2
	 hCV1L+EPDBtckSaF6/Jb4iYGQX0bHX52UyUug0mgqxlv0JXiuptuVVqLuWVy8VeTe/
	 ONZjaZJ4z+t4Fu21erjmIuXzd7YcWRiElidQCunpzjGLYsITU8kRvNXTtPGmcgeuu9
	 52fil7LFj+g/7welq6jae945YZqmsaANmeTzwxrywcVe0jp1LyNzQBA0e7/JiTNa0T
	 Ck6PEcYrjpUrU95xnOWDW7ppEClrne6RzBGYaqo8f3og11G0uPb9X9qk5yprsmaete
	 srBMDFUT1mELg==
Date: Thu, 16 Oct 2025 12:17:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Subject: Re: BAR resizing broken in 6.18 (PPC only?)
Message-ID: <yn2ladybszyrxfridi3z3rx4ogfh6c42bcxq5qld64gul2xltt@6hir2oknxfmg>
References: <f9a8c975-f5d3-4dd2-988e-4371a1433a60@hogyros.de>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9a8c975-f5d3-4dd2-988e-4371a1433a60@hogyros.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

+ Ilpo

On Thu, Oct 16, 2025 at 12:08:46PM +0900, Simon Richter wrote:
> Hi,
> 
> since switching to 6.18rc1, I get
> 
> xe 0030:03:00.0: enabling device (0140 -> 0142)
> xe 0030:03:00.0: [drm] unbounded parent pci bridge, device won't support any
> PM support.
> xe 0030:03:00.0: [drm] Attempting to resize bar from 256MiB -> 16384MiB
> xe 0030:03:00.0: BAR 0 [mem 0x620c000000000-0x620c000ffffff 64bit]:
> releasing
> xe 0030:03:00.0: BAR 2 [mem 0x6200000000000-0x620000fffffff 64bit pref]:
> releasing
> pci 0030:02:01.0: bridge window [mem 0x6200000000000-0x620001fffffff 64bit
> pref]: releasing
> pci 0030:01:00.0: bridge window [mem 0x6200000000000-0x6203fbff0ffff 64bit
> pref]: releasing
> pci 0030:00:00.0: bridge window [mem 0x6200000000000-0x6203fbff0ffff 64bit
> pref]: was not released (still contains assigned resources)
> pci 0030:02:01.0: disabling bridge window [io  0x0000-0xffffffffffffffff
> disabled] to [bus 03] (unused)
> pci 0030:02:02.0: disabling bridge window [io  0x0000-0xffffffffffffffff
> disabled] to [bus 04] (unused)
> pci 0030:02:02.0: disabling bridge window [mem 0x00000000-0xffffffffffffffff
> 64bit pref disabled] to [bus 04] (unused)
> pci 0030:01:00.0: disabling bridge window [io  0x0000-0xffffffffffffffff
> disabled] to [bus 02-04] (unused)
> pci 0030:00:00.0: Assigned bridge window [mem
> 0x6200000000000-0x6203fbff0ffff 64bit pref] to [bus 01-04] cannot fit
> 0x4000000000 required for 0030:01:00.0 bridging to [bus 02-04]
> pci 0030:01:00.0: bridge window [mem size 0x3fc0000000 64bit pref] to [bus
> 02-04] requires relaxed alignment rules
> pci 0030:00:00.0: disabling bridge window [io  0x0000-0xffffffffffffffff
> disabled] to [bus 01-04] (unused)
> pci 0030:01:00.0: bridge window [mem size 0x3fc0000000 64bit pref]: can't
> assign; no space
> pci 0030:01:00.0: bridge window [mem size 0x3fc0000000 64bit pref]: failed
> to assign
> pci 0030:01:00.0: bridge window [mem size 0x3fc0000000 64bit pref]: can't
> assign; no space
> pci 0030:01:00.0: bridge window [mem size 0x3fc0000000 64bit pref]: failed
> to assign
> pci 0030:02:01.0: bridge window [mem size 0x400000000 64bit pref]: can't
> assign; no space
> pci 0030:02:01.0: bridge window [mem size 0x400000000 64bit pref]: failed to
> assign
> pci 0030:02:01.0: bridge window [mem size 0x400000000 64bit pref]: can't
> assign; no space
> pci 0030:02:01.0: bridge window [mem size 0x400000000 64bit pref]: failed to
> assign
> xe 0030:03:00.0: BAR 2 [mem size 0x400000000 64bit pref]: can't assign; no
> space
> xe 0030:03:00.0: BAR 2 [mem size 0x400000000 64bit pref]: failed to assign
> xe 0030:03:00.0: BAR 0 [mem 0x620c000000000-0x620c000ffffff 64bit]: assigned
> xe 0030:03:00.0: BAR 0 [mem 0x620c000000000-0x620c000ffffff 64bit]:
> releasing
> xe 0030:03:00.0: BAR 2 [mem size 0x400000000 64bit pref]: can't assign; no
> space
> xe 0030:03:00.0: BAR 2 [mem size 0x400000000 64bit pref]: failed to assign
> xe 0030:03:00.0: BAR 0 [mem 0x620c000000000-0x620c000ffffff 64bit]: assigned
> pci 0030:00:00.0: PCI bridge to [bus 01-04]
> pci 0030:00:00.0:   bridge window [mem 0x620c000000000-0x620c07fefffff]
> pci 0030:00:00.0:   bridge window [mem 0x6200000000000-0x6203fbff0ffff 64bit
> pref]
> pci 0030:01:00.0: bridge window [mem 0x6200000000000-0x6203fbff0ffff 64bit
> pref]: can't claim; address conflict with 0030:01:00.0 [mem
> 0x6200020000000-0x62000207fffff 64bit pref]
> pci 0030:01:00.0: PCI bridge to [bus 02-04]
> pci 0030:01:00.0:   bridge window [mem 0x620c000000000-0x620c07fefffff]
> pci 0030:02:01.0: bridge window [mem 0x6200000000000-0x620001fffffff 64bit
> pref]: can't claim; no compatible bridge window
> pci 0030:02:01.0: PCI bridge to [bus 03]
> pci 0030:02:01.0:   bridge window [mem 0x620c000000000-0x620c0013fffff]
> xe 0030:03:00.0: [drm] Failed to resize BAR2 to 16384M (-ENOSPC). Consider
> enabling 'Resizable BAR' support in your BIOS
> xe 0030:03:00.0: BAR 2 [mem size 0x10000000 64bit pref]: can't assign; no
> space
> xe 0030:03:00.0: BAR 2 [mem size 0x10000000 64bit pref]: failed to assign
> xe 0030:03:00.0: BAR 2 [mem size 0x10000000 64bit pref]: can't assign; no
> space
> xe 0030:03:00.0: BAR 2 [mem size 0x10000000 64bit pref]: failed to assign
> xe 0030:03:00.0: [drm] Found battlemage (device ID e20b) discrete display
> version 14.01 stepping B0
> xe 0030:03:00.0: [drm] *ERROR* pci resource is not valid
> 
> There's also a bug report[1] on the freedesktop GitLab, but this may be a
> more generic problem.
> 
> I'm unsure what other "assigned resources" would be below the root that are
> not covered by the bridge window of equal size on the upstream port of the
> GPU -- also it would be really cool if it reverted to the old state on
> failure instead of creating an invalid configuration.
> 
> Also, why do we change the BAR assignment while mem decoding is active?
> 

This could be due to the recently merged patch that changes the way we read
bridge resources. We saw a similar bug report with Qcom platforms as well [1].a43ac325c7cb

Could you please try reverting the below mentioned commit and see if that fixes
the issue?

a43ac325c7cb ("PCI: Set up bridge resources earlier")

- Mani

[1] https://lore.kernel.org/lkml/017ff8df-511c-4da8-b3cf-edf2cb7f1a67@packett.cool

-- 
மணிவண்ணன் சதாசிவம்

