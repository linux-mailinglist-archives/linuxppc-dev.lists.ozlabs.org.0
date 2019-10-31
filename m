Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E519EA903
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 02:55:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473T0f1jj5zF5LJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 12:54:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="iGKfW31d"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Syc2yWGzF5KJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 12:53:10 +1100 (AEDT)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D3602080F;
 Thu, 31 Oct 2019 01:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572486787;
 bh=URBSmu6OiJ+FEUgwhQ/RHgs7YGynWuZQ6yJNH/NdOYo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iGKfW31d7qGcARhBSAzQxOBLQn/dCL82lvBprLnWzX5XoAwPnoF2RrQ1HG2Bu6meu
 +34QEr984x+fQw75FaA/ijzSXqwVHQ8Sei9CzsTHjH/tQHOb1GcR6oXscfByuZ9Ksj
 jQ/Hm/HTZ9CLc++H+jpMq2wBLrUC3z6tg8Wr9fPw=
Date: Wed, 30 Oct 2019 18:53:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/3] arch: ipcbuf.h: make uapi asm/ipcbuf.h self-contained
Message-Id: <20191030185306.a75acc68ed2b911970ccd4b8@linux-foundation.org>
In-Reply-To: <CAK7LNASrZpJ0J7N_YvSza2QQ_cQQ+Z04Cf5-Or4ivKMb9UVuMQ@mail.gmail.com>
References: <20191030063855.9989-1-yamada.masahiro@socionext.com>
 <CAK7LNASrZpJ0J7N_YvSza2QQ_cQQ+Z04Cf5-Or4ivKMb9UVuMQ@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 X86 ML <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 31 Oct 2019 10:33:00 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Andrew,
> 
> I think this patch has already been picked up to your tree,
> but I noticed a typo in the commit message just now.
> Please see below.
> 
> ...
>
> > Include <asm/posix_types.h> to make it self-contained, and add it to
> 
> Include <linux/posix_type.h> to make ...
> 
> Could you please fix it up locally?

No probs, done.
