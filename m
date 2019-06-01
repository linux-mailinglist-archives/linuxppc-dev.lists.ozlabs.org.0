Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BBA32130
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2019 01:48:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GdKq5zM3zDqfX
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2019 09:47:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45GdJh38sFzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2019 09:46:55 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 12DA014FA9CFA;
 Sat,  1 Jun 2019 16:46:44 -0700 (PDT)
Date: Sat, 01 Jun 2019 16:46:43 -0700 (PDT)
Message-Id: <20190601.164643.756724745563418604.davem@davemloft.net>
To: hch@lst.de
Subject: Re: RFC: switch the remaining architectures to use generic GUP v2
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190601074959.14036-1-hch@lst.de>
References: <20190601074959.14036-1-hch@lst.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 01 Jun 2019 16:46:44 -0700 (PDT)
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
Cc: x86@kernel.org, dalias@libc.org, ysato@users.sourceforge.jp,
 linux-sh@vger.kernel.org, jhogan@kernel.org, linuxppc-dev@lists.ozlabs.org,
 khalid.aziz@oracle.com, npiggin@gmail.com, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, paul.burton@mips.com, paulus@samba.org,
 andreyknvl@google.com, sparclinux@vger.kernel.org,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christoph Hellwig <hch@lst.de>
Date: Sat,  1 Jun 2019 09:49:43 +0200

> below is a series to switch mips, sh and sparc64 to use the generic
> GUP code so that we only have one codebase to touch for further
> improvements to this code.  I don't have hardware for any of these
> architectures, and generally no clue about their page table
> management, so handle with care.
> 
> Changes since v1:
>  - fix various issues found by the build bot
>  - cherry pick and use the untagged_addr helper form Andrey
>  - add various refactoring patches to share more code over architectures
>  - move the powerpc hugepd code to mm/gup.c and sync it with the generic
>    hup semantics

I will today look seriously at the sparc64 stuff wrt. tagged pointers.
