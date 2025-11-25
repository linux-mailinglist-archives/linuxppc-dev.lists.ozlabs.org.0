Return-Path: <linuxppc-dev+bounces-14488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BCBC8637B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 18:32:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dG8s24XScz2yG5;
	Wed, 26 Nov 2025 04:32:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764091942;
	cv=none; b=Ey5irYSoboVG6UK3EAFMNxFhtEe4ccsHUQzN37gALUr4E3eoj0WzgIUSy5/hjDokeEa9PPmPNG00JZulj6TqKDbx3taH0SULGWOFX+2bZ2PW10ujVSi32tnfoflEk/7fEnSW/IFMnBJ+15E5vUpTCI/MABo9Qf5/tDB4iaP+7CFTe3xgJNbSrGYePWSmvGcngAmeJ5psTWoyqozLVSzj3g7swsp8X/Q+zyY5BqStWNVPyc74si8zlx5jBxg0jGJWd4HYXQ/lOOVoNleWDSYxnEs4FM8POQtgPQXhF6uVxeQScfRQXzSPvWJTjUv0nn7tYhK5qBhfUniVIliPbsR9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764091942; c=relaxed/relaxed;
	bh=owLmR4S/oaLdVE3nlx9TsbZXLQStwKHuP3nkO6I+PE4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oKcyqTys4eX3vpWcY90U5jZ7HCcEZTeUQ77Q4eQrRwpbxvBCexzZSogv/m8UIHuEaFl5AwmbcWSfzadAhtCzc5c1YWDn/saC6SLHJxoZIyQZd95USO/NTgR1xOd9Y7WLgt5deufHwFKO4djmnJJMjScjpWd3crIhzDa+2Gew1pjegKbnWT8zsK5OvubQ7W7g46pR0/skSoLmfS87cCUVX0sVKQ20mkDI8seXo/3QxVS+oZLXFys5PTed9GJ3Lb8D7Rg7BZ2QThiSfSbrAZ+NKKHeRp6KjywXjaW+ZoTjRsskqkyNCvG0/oXENCvXVaVg5RlT3p9G7T79iQty1SxB9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nr6cZGfS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nr6cZGfS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dG8s13MCCz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 04:32:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B4C460250;
	Tue, 25 Nov 2025 17:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC08C4CEF1;
	Tue, 25 Nov 2025 17:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764091932;
	bh=nnAEPQ59gqP0qnrmNI3FJEAbvJ+MZOEUAcLlq2prKCE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nr6cZGfS3O34sgUcHJr7KtS+Mp52RlENxbRA2dOu/d4YFQzwnvtmp3Sq5//ODUpfl
	 +JTv5kdtE8yRGxiVrRPo0z9izXQ4Qd7pOleXhGLoV+myrsB8q9Z1Q0r5elNASWV8mA
	 SkTNueFUG1lHdCCOI0S/bo6eQeJ5jJCa5HA65TtY=
Date: Tue, 25 Nov 2025 09:32:11 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Breno Leitao <leitao@debian.org>, tony.luck@intel.com,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 acpica-devel@lists.linux.dev, osandov@osandov.com,
 xueshuai@linux.alibaba.com, konrad.wilk@oracle.com,
 linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, kernel-team@meta.com, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, James Morse
 <james.morse@arm.com>, Robert Moore <robert.moore@intel.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver
 O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH RESEND v5] vmcoreinfo: Track and log recoverable
 hardware errors
Message-Id: <20251125093211.081d4ba0e18f1f9a85a0de5f@linux-foundation.org>
In-Reply-To: <20251118141002.GEaRx-Oge8ZxtR4Vzi@fat_crate.local>
References: <20251010-vmcore_hw_error-v5-1-636ede3efe44@debian.org>
	<vpilvvscosdl4o4cvbmtsrrp4btfwr5iidywmuiawfrgtlcwrr@ubtdbxfqyqpu>
	<20251118141002.GEaRx-Oge8ZxtR4Vzi@fat_crate.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 18 Nov 2025 15:10:02 +0100 Borislav Petkov <bp@alien8.de> wrote:

> On Tue, Nov 18, 2025 at 05:01:47AM -0800, Breno Leitao wrote:
> > Do you know what is the right tree for this patch?
> > 
> > I am wondering if it should go through Kdump, x86 or RAS/MCE tree?
> 
> I can take it if akpm wants me to...
> 

I don't feel I'll add much value here so please take it via the
appropriate tree.

I'll toss it in mm.git for linux-next exposure and shall drop it again
when it appears in -next via another route.

It's a shame it took us two weeks to get onto this - it's a bit late
for the upcoming merge window.

