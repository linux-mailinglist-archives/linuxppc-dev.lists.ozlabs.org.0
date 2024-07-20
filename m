Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6053938319
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jul 2024 01:10:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=ndgXfHC4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WRMhS0Zx1z3cRs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jul 2024 09:10:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=ndgXfHC4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WRMgk712pz3cGS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jul 2024 09:09:37 +1000 (AEST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4WRMgY5Jvxz9sQm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jul 2024 01:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1721516969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3hQ7rW0uqzPwXuEwVK9t+WFNfa7kKLnBdSdH9MFkRyc=;
	b=ndgXfHC4iCpdmqs4BJOARKJ+r63R1YsPNXGJYCtMjsQG8LtIQhGctl9lrLq+eLpwN7yL5T
	ipguPiwpWAhN8HgCmBuqDYqhAeyiDhwkX9Y9LUtc0kFf0hwYmhL2gZOuDTFx9kAAbfM55S
	M0iJrANhyYPWLbzSrlSYEybfGgwbfThlNoM44Cw3FsiZmhXe3KaKgV+cGEr4qWnVQOjtzl
	WDuqozJw9zCr8QIMnLirmJfxIl75iLcWjdVfoKStVXBuc4r52NbGqvECLVaQ9fnQlRM+3q
	6Khz8aFcew6MQbX1oDo4gSj8l5uwvxs+UEp4vlx2Y8DhIudQjo2xAW934bKnbQ==
Date: Sun, 21 Jul 2024 01:09:26 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: Kernel build failure with MEM_ALLOC_PROFILING=y set (Talos II,
 v6.10-rc5)
Message-ID: <20240721010926.60efacc3@yea>
In-Reply-To: <20240629153128.4660755c@yea>
References: <20240629153128.4660755c@yea>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 75727a27fd850f830e6
X-MBO-RS-META: 739axpqcw634rtu3hpq78p1uras6x7dg
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 29 Jun 2024 15:31:28 +0200
Erhard Furtner <erhard_f@mailbox.org> wrote:

> I get a build failure on v6.10-rc5 on my Talos II when MEM_ALLOC_PROFILING=y is enabled:
> 
> [...]
>   LD [M]  fs/xfs/xfs.o
>   LD [M]  fs/bcachefs/bcachefs.o
>   AR      built-in.a
>   AR      vmlinux.a
>   LD      vmlinux.o
>   OBJCOPY modules.builtin.modinfo
>   GEN     modules.builtin
>   GEN     .vmlinux.objs
>   MODPOST Module.symvers
> ERROR: modpost: "page_ext_get" [arch/powerpc/kvm/kvm-hv.ko] undefined!
> ERROR: modpost: "mem_alloc_profiling_key" [arch/powerpc/kvm/kvm-hv.ko] undefined!
> ERROR: modpost: "page_ext_put" [arch/powerpc/kvm/kvm-hv.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:145: Module.symvers] Fehler 1
> make[1]: *** [/usr/src/linux-stable/Makefile:1886: modpost] Fehler 2
> make: *** [Makefile:240: __sub-make] Fehler 2
> 
> Same .config builds fine without MEM_ALLOC_PROFILING set. Kernel .config attached.

Build problem still there on now released v6.10 with MEM_ALLOC_PROFILING=y.

Can't bisect as build with MEM_ALLOC_PROFILING fails since it's introduction in v6.10-rc1.

Regards,
Erhard
