Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B703767D98E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:21:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2xXy4m2Nz3fH5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:21:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=wfU526Qe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=wfU526Qe;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2xX00XFDz3fCT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 10:20:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2EE8EB81ECD;
	Thu, 26 Jan 2023 23:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A8FC433D2;
	Thu, 26 Jan 2023 23:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1674775225;
	bh=2bi/yWCYSEbTwdoD+ZRnucs0IxsKcEa74FkUlbYIl8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wfU526QeHtT25Dp80XTfipC5chr8bRteULrVAX3GXOkya9cbsZIy8wrbQ6brmYz0F
	 vDGtdvSGZRQfERjweZU4px5C7Ix57ztsuDbAmmGFSywUjlhFzG0KOqtrvPm17eZhaV
	 02GCDMBiwBb7OPcfnJtFBFIWpxTHuJ9C+PSjF7U4=
Date: Thu, 26 Jan 2023 15:20:24 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] kasan: Fix Oops due to missing calls to
 kasan_arch_is_ready()
Message-Id: <20230126152024.bfdd25de2ff5107fa7c02986@linux-foundation.org>
In-Reply-To: <150768c55722311699fdcf8f5379e8256749f47d.1674716617.git.christophe.leroy@csgroup.eu>
References: <150768c55722311699fdcf8f5379e8256749f47d.1674716617.git.christophe.leroy@csgroup.eu>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Jan 2023 08:04:47 +0100 Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> On powerpc64, you can build a kernel with KASAN as soon as you build it
> with RADIX MMU support. However if the CPU doesn't have RADIX MMU,
> KASAN isn't enabled at init and the following Oops is encountered.

Should we backport to -stable?  If so, can we identify a suitable Fixes: target?

Thanks.
