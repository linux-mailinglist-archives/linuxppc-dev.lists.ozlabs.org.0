Return-Path: <linuxppc-dev+bounces-14718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0186FCB4162
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 22:47:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRTpC5n2Pz2xc2;
	Thu, 11 Dec 2025 08:47:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765403235;
	cv=none; b=S59byIBOW5WCWrvTfTRFmwewDwlcq+mnPq/oYlZbVo0hPt5rprfKzbpPpYQaOoCzaiN9sczCeI2QO2gxSFpSwYS9O3rnu8N+fztyNkuhF9wlkVJ3fdAn6+EQjcJsnETwbmzryAX5wxdmOYCfqEDZ0Fskr8TVVDR29C9ZlfZsK9DfF8OJdMm5GAXdIZFNrORz4glMZCWzrp2AYoKORzeo7EoavdGEBaqa2IhTH2vTtbZGt5u4lSl0KCa+jVDXjnIsbtN4NPgaCWYLoOJAUget8Od15XjlHvTXU2v+iTegjlP5CeD77GQZY9pGyEcs1T6GAcFt+IAFY57D6DfZULeGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765403235; c=relaxed/relaxed;
	bh=pxZDdsouZCBDb6I5k4+p3GInNgxofkpJ637+MTJ+Nz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SchmUJCANG11P9uKY1N4pTa4ZC3L3p9Dq1KFtQEQWPCyNlY7pcMWtQjry1jclB6Ju7E5dww0OYpHzpWr/yFln/e5wuju1PugQC4pK1moKpEX6c8mY2G6I9pDxs2TmhKFKQm5qYdoKTCDyGAo+oZuxXEjDZT7vQsk0Rm+daA47ucZnEFVKeFPrGn5R32kiG2BcSpL08tpR7mJkEOzzWGOPvERk5RtRywN2WhNSjAsy2WrhEJXdKB18y1W8OcijCViD1jizkORr0+Bd0vvAxjepwGBBg8SjTqhCBXeYClohxXUTbS/ozC+TkB0waQhOvVnebDKBiYruZxcwyhZHpR6Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcgTSCxu; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcgTSCxu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRTpB3pP2z2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Dec 2025 08:47:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF281600C4;
	Wed, 10 Dec 2025 21:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABBFC4CEF1;
	Wed, 10 Dec 2025 21:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765403201;
	bh=CtPmu3s6j/Afk4hTIM99WwojepaZ69Af8Rt3jzdX23E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fcgTSCxurOThWarqcF/z6TsvWAcHnosfPCoHnTw5h7pjV6aWZ9Ka4gGNgYu2c6lSJ
	 +XJVkAgCEWfvgd+pTFsIOveQCBvQjqmBLFKYZZVs9Vcx07CYpnl0a1ofjianRwPf7n
	 FdfFQo0WweEN76bwzzxLTYEY2GX3gA+D5bSvybOms60YQ5qU60ffNLmLqEX9SF+Y3k
	 4iP8HvFv2RGEPZ+WNuubpQz71aB3uPhawCrVcbzRo+VJldnkXgTFvTnW3QNSKBWxLT
	 EV4HIpx+iYgrVGXx3RrX3PX5UmPLJ+fdc5eQyFxMLvLaFnDvXl/YSyrujusvKHQJAO
	 RXn7IHRxBY4Sw==
Date: Wed, 10 Dec 2025 15:46:40 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: mahesh@linux.ibm.com, oohall@gmail.com, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	bhelgaas@google.com, tpearson@raptorengineering.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	vaibhav@linux.ibm.com, sbhat@linux.ibm.com, ganeshgr@linux.ibm.com
Subject: Re: [PATCH v2 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove
 locking in EEH event handling
Message-ID: <20251210214640.GA3541600@bhelgaas>
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
In-Reply-To: <20251210142559.8874-1-nnmlinux@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 10, 2025 at 08:25:59AM -0600, Narayana Murty N wrote:
> The recent commit 1010b4c012b0 ("powerpc/eeh: Make EEH driver device
> hotplug safe") restructured the EEH driver to improve synchronization
> with the PCI hotplug layer.
> 
> However, it inadvertently moved pci_lock_rescan_remove() outside its
> intended scope in eeh_handle_normal_event(), leading to broken PCI
> error reporting and improper EEH event triggering. Specifically,
> eeh_handle_normal_event() acquired pci_lock_rescan_remove() before
> calling eeh_pe_bus_get(), but eeh_pe_bus_get() itself attempts to
> acquire the same lock internally, causing nested locking and disrupting
> normal EEH event handling paths.
> 
> This patch adds a boolean parameter do_lock to _eeh_pe_bus_get(),
> with two public wrappers:
>     eeh_pe_bus_get() with locking enabled.
>     eeh_pe_bus_get_nolock() that skips locking.
> 
> Callers that already hold pci_lock_rescan_remove() now use
> eeh_pe_bus_get_nolock() to avoid recursive lock acquisition.
> 
> Additionally, pci_lock_rescan_remove() calls are restored to the correct
> position—after eeh_pe_bus_get() and immediately before iterating affected
> PEs and devices. This ensures EEH-triggered PCI removes occur under proper
> bus rescan locking without recursive lock contention.
> 
> The eeh_pe_loc_get() function has been split into two functions:
>     eeh_pe_loc_get(struct eeh_pe *pe) which retrieves the loc for given PE.
>     eeh_pe_loc_get_bus(struct pci_bus *bus) which retrieves the location
>     code for given bus.
> 
> This resolves lockdep warnings such as:
> <snip>
> [   84.964298] [    T928] ============================================
> [   84.964304] [    T928] WARNING: possible recursive locking detected
> [   84.964311] [    T928] 6.18.0-rc3 #51 Not tainted
> [   84.964315] [    T928] --------------------------------------------
> [   84.964320] [    T928] eehd/928 is trying to acquire lock:
> [   84.964324] [    T928] c000000003b29d58 (pci_rescan_remove_lock){+.+.}-{3:3}, at: pci_lock_rescan_remove+0x28/0x40
> [   84.964342] [    T928]
>                        but task is already holding lock:
> [   84.964347] [    T928] c000000003b29d58 (pci_rescan_remove_lock){+.+.}-{3:3}, at: pci_lock_rescan_remove+0x28/0x40
> [   84.964357] [    T928]
>                        other info that might help us debug this:
> [   84.964363] [    T928]  Possible unsafe locking scenario:
> 
> [   84.964367] [    T928]        CPU0
> [   84.964370] [    T928]        ----
> [   84.964373] [    T928]   lock(pci_rescan_remove_lock);
> [   84.964378] [    T928]   lock(pci_rescan_remove_lock);
> [   84.964383] [    T928]
>                        *** DEADLOCK ***
> 
> [   84.964388] [    T928]  May be due to missing lock nesting notation
> 
> [   84.964393] [    T928] 1 lock held by eehd/928:
> [   84.964397] [    T928]  #0: c000000003b29d58 (pci_rescan_remove_lock){+.+.}-{3:3}, at: pci_lock_rescan_remove+0x28/0x40
> [   84.964408] [    T928]
>                        stack backtrace:
> [   84.964414] [    T928] CPU: 2 UID: 0 PID: 928 Comm: eehd Not tainted 6.18.0-rc3 #51 VOLUNTARY
> [   84.964417] [    T928] Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_022) hv:phyp pSeries
> [   84.964419] [    T928] Call Trace:
> [   84.964420] [    T928] [c0000011a7157990] [c000000001705de4] dump_stack_lvl+0xc8/0x130 (unreliable)
> [   84.964424] [    T928] [c0000011a71579d0] [c0000000002f66e0] print_deadlock_bug+0x430/0x440
> [   84.964428] [    T928] [c0000011a7157a70] [c0000000002fd0c0] __lock_acquire+0x1530/0x2d80
> [   84.964431] [    T928] [c0000011a7157ba0] [c0000000002fea54] lock_acquire+0x144/0x410
> [   84.964433] [    T928] [c0000011a7157cb0] [c0000011a7157cb0] __mutex_lock+0xf4/0x1050
> [   84.964436] [    T928] [c0000011a7157e00] [c000000000de21d8] pci_lock_rescan_remove+0x28/0x40
> [   84.964439] [    T928] [c0000011a7157e20] [c00000000004ed98] eeh_pe_bus_get+0x48/0xc0
> [   84.964442] [    T928] [c0000011a7157e50] [c000000000050434] eeh_handle_normal_event+0x64/0xa60
> [   84.964446] [    T928] [c0000011a7157f30] [c000000000051de8] eeh_event_handler+0xf8/0x190
> [   84.964450] [    T928] [c0000011a7157f90] [c0000000002747ac] kthread+0x16c/0x180
> [   84.964453] [    T928] [c0000011a7157fe0] [c00000000000ded8] start_kernel_thread+0x14/0x18

I have no comment on the patch itself, but the timestamps above aren't
relevant and could be removed.  Maybe also the "T928" part.

Bjorn

