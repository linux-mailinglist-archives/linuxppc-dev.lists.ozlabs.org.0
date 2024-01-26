Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 987D183D258
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 03:05:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=tuc+1XPr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLgy73n1sz3cW2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 13:05:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=tuc+1XPr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLgxK32p4z2xTl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 13:04:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CAA1BCE354C;
	Fri, 26 Jan 2024 02:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74479C433C7;
	Fri, 26 Jan 2024 02:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1706234672;
	bh=HWEos3+udILzj8RZ/TTxlduuwOKMV4VQFbTq8RZGoPM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tuc+1XPr+hUVWa4GOyLQhEugYXMMsybYvWuE0/xs82eeqs83luvv7hWozsTjDEJU2
	 xqH+oihlu/t9Hy0Adp3wCLYFeU2IG8f5LdvEXo7yJ7AqNEu5svDOvx1sFx40QZHZup
	 Q5dVW0OiqBacQI7MjfRyUJZIaPhBJ+rifm367ymU=
Date: Thu, 25 Jan 2024 18:04:24 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/1] arch/arm/mm: fix major fault accounting when
 retrying under per-VMA lock
Message-Id: <20240125180424.121455beae4d56799a0bac28@linux-foundation.org>
In-Reply-To: <20240123064305.2829244-1-surenb@google.com>
References: <20240123064305.2829244-1-surenb@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, linux-riscv@lists.infradead.org, palmer@dabbelt.com, willy@infradead.org, luto@kernel.org, agordeev@linux.ibm.com, will@kernel.org, gerald.schaefer@linux.ibm.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Jan 2024 22:43:05 -0800 Suren Baghdasaryan <surenb@google.com> wrote:

> The change [1] missed ARM architecture when fixing major fault accounting
> for page fault retry under per-VMA lock. Add missing code to fix ARM
> architecture fault accounting.
> 
> [1] 46e714c729c8 ("arch/mm/fault: fix major fault accounting when retrying under per-VMA lock")
> 
> Fixes: 12214eba1992 ("mm: handle read faults under the VMA lock")

What are the userspace-visible runtime effects of this change?

Is a cc:stable backport desirable?

> Reported-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
