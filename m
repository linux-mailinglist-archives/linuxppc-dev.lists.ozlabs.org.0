Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2842D69F994
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 18:05:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMMxJ6tbCz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 04:05:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Y1ljMAsE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMMwG0hpXz2yXL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 04:05:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8seSikIduHdwWlxLKvtsNdKihKZpOnnG/byEzPIYqpo=; b=Y1ljMAsEbY1xeALhV24P6D+VB8
	W1bdI7nU0WhWoHx4NgJjUs1eL4F579QHnU+VRNoxr0EmxLBTqZ3vOKnmHpwMB+Sofv3xiO5BeF6WD
	1LD1NvVLmJ2+7rgSzEr2KFdkQGbvBYCsMTfz8sZqwESBDJCLccPcpvy9GuBpXxB4wGZyirHyFJlTf
	gndmj7kqHoQ049GccgXjz/BpbKTlsy/A8I1wozGsWIJRtFjTTw2VRwpq8mSkA9UdnUdhM7yIf7jgi
	NcbLaUrNNJrkpHmN4j4xvoM8KhBnKHeFAYPSNMidGw19ugtisIBpD9l0VLYU1g+Tbm+Yn6Ihuibqi
	eg9uba3g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pUsXk-00CbPL-05;
	Wed, 22 Feb 2023 17:04:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 58890300446;
	Wed, 22 Feb 2023 18:04:32 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0DE9520DD8076; Wed, 22 Feb 2023 18:04:32 +0100 (CET)
Date: Wed, 22 Feb 2023 18:04:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
Message-ID: <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118153529.57695-1-andrzej.hajda@intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 04:35:22PM +0100, Andrzej Hajda wrote:

> Andrzej Hajda (7):
>   arch: rename all internal names __xchg to __arch_xchg
>   linux/include: add non-atomic version of xchg
>   arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
>   llist: simplify __llist_del_all
>   io_uring: use __xchg if possible
>   qed: use __xchg if possible
>   drm/i915/gt: use __xchg instead of internal helper

Nothing crazy in here I suppose, I somewhat wonder why you went through
the trouble, but meh.

You want me to take this through te locking tree (for the next cycle,
not this one) where I normally take atomic things or does someone else
want this?
