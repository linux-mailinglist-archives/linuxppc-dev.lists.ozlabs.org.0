Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CF74FA1F4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 05:25:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kb0rM463sz3bcR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 13:25:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=xOlvG7rB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=xOlvG7rB; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kb0ql0F6cz2xmZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 13:25:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2C0D62044;
 Sat,  9 Apr 2022 03:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED296C385A4;
 Sat,  9 Apr 2022 03:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1649474717;
 bh=QztxxwJbpCCCWMERmgAVm2Swrx1fqBXopvd4ffA8cw8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xOlvG7rB7RRzvIkCUU5vTfg+1GYBSbt9aLhxymSUz6j82IvAUZyhUMvzaGHaHWrai
 /30zp4sk0EJuLzTcNx1jeTyIQkrta0X3p3JUMHXmbqkzlICaKfXwDXA9ys7ce2rx0R
 21w+T41QYox5acwiAGfZVpGfZiqcvn5HzUaTHR6g=
Date: Fri, 8 Apr 2022 20:25:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v9 0/4] mm: Enable conversion of powerpc to default
 topdown mmap layout
Message-Id: <20220408202516.254e22a8293a57324650bd3f@linux-foundation.org>
In-Reply-To: <cover.1649401201.git.christophe.leroy@csgroup.eu>
References: <cover.1649401201.git.christophe.leroy@csgroup.eu>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri,  8 Apr 2022 09:24:58 +0200 Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Rebased on top of Linux 5.18-rc1
> 
> This is the mm part of the series that converts powerpc to default
> topdown mmap layout, for merge into v5.18

We're at 5.18-rc1.  The 5.18 merge window has closed and we're in
fixes-only mode.

If there's a case to be made that these patches are needed by 5.18
users then please let's make that case.  Otherwise, this is 5.19-rc1 material.

And if it is indeed all 5.19-rc1 material, then please carry all four
in the powerpc tree with Acked-by: Andrew Morton
<akpm@linux-foundation.org>.

Also, [4/4] has a cc:stable.  This is a bit odd because -stable
candidates should be standalone patches, staged ahead of all
for-next-merge-window material, so we can get them merged up quickly.

More oddly, [4/4]'s changelog provides no explanation for why the patch
should be considered for backporting.

