Return-Path: <linuxppc-dev+bounces-52-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 416DC95049A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 14:13:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=r3l1+fhI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjqz92x4Wz2xs7;
	Tue, 13 Aug 2024 22:13:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=r3l1+fhI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjp4l35bXz2xWV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 20:47:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E8F661632;
	Tue, 13 Aug 2024 10:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A2CC4AF09;
	Tue, 13 Aug 2024 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723546067;
	bh=Ushq3yq7eWPKyCu11/TlftefcEeOEHU4isTbb6y9I+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3l1+fhIRmS9mVp9YWscCFT0O+MMtFftrTyItd37qVs5e8+2XwFCbwuB6TvXljSfa
	 IP1Scsg6cBjg3zWrUne6jNxPwG1JNQsnKaT0JkRQ1mcbCZji01evJYP156ZxJXo2IP
	 f7lcKvbRAFa8yVN5r2qYVLRU3zy45mkz15IyKHWw=
Date: Tue, 13 Aug 2024 12:47:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: dennis@kernel.org, tj@kernel.org, cl@linux.com, mpe@ellerman.id.au,
	benh@kernel.crashing.org, paulus@samba.org,
	christophe.leroy@csgroup.eu, mahesh@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5.10 v2] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Message-ID: <2024081318-onion-record-fdc7@gregkh>
References: <20240806071616.1671691-1-ruanjinjie@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806071616.1671691-1-ruanjinjie@huawei.com>

On Tue, Aug 06, 2024 at 07:16:16AM +0000, Jinjie Ruan wrote:
> From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> 
> [ Upstream commit 0db880fc865ffb522141ced4bfa66c12ab1fbb70 ]
> 
> nmi_enter()/nmi_exit() touches per cpu variables which can lead to kernel
> crash when invoked during real mode interrupt handling (e.g. early HMI/MCE
> interrupt handler) if percpu allocation comes from vmalloc area.
> 
> Early HMI/MCE handlers are called through DEFINE_INTERRUPT_HANDLER_NMI()
> wrapper which invokes nmi_enter/nmi_exit calls. We don't see any issue when
> percpu allocation is from the embedded first chunk. However with
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there are chances where percpu
> allocation can come from the vmalloc area.
> 
> With kernel command line "percpu_alloc=page" we can force percpu allocation
> to come from vmalloc area and can see kernel crash in machine_check_early:
> 
> [    1.215714] NIP [c000000000e49eb4] rcu_nmi_enter+0x24/0x110
> [    1.215717] LR [c0000000000461a0] machine_check_early+0xf0/0x2c0
> [    1.215719] --- interrupt: 200
> [    1.215720] [c000000fffd73180] [0000000000000000] 0x0 (unreliable)
> [    1.215722] [c000000fffd731b0] [0000000000000000] 0x0
> [    1.215724] [c000000fffd73210] [c000000000008364] machine_check_early_common+0x134/0x1f8
> 
> Fix this by avoiding use of nmi_enter()/nmi_exit() in real mode if percpu
> first chunk is not embedded.
> 
> CVE-2024-42126
> Cc: stable@vger.kernel.org#5.10.x
> Cc: gregkh@linuxfoundation.org
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Tested-by: Shirisha Ganta <shirisha@linux.ibm.com>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://msgid.link/20240410043006.81577-1-mahesh@linux.ibm.com
> [ Conflicts in arch/powerpc/include/asm/interrupt.h
>   because machine_check_early() and machine_check_exception()
>   has been refactored. ]
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Also fix for CONFIG_PPC_BOOK3S_64 not enabled.
> - Add Upstream.
> - Cc stable@vger.kernel.org.

You forgot a 5.15.y version, which is of course required if we were to
take a 5.10.y version :(

Please resubmit both.

thanks,

greg k-h

