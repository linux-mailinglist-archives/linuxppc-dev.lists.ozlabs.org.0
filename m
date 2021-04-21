Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A692366C4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLbv4NTZz3027
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:14:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLVT3qnxz30KH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:21 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLVT0LXDz9vG1; Wed, 21 Apr 2021 23:09:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210418135413.1204031-1-mpe@ellerman.id.au>
References: <20210418135413.1204031-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: Stop calling printk in rtas_stop_self()
Message-Id: <161901050083.1961279.5022448585409752434.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:20 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 18 Apr 2021 23:54:13 +1000, Michael Ellerman wrote:
> RCU complains about us calling printk() from an offline CPU:
> 
>   =============================
>   WARNING: suspicious RCU usage
>   5.12.0-rc7-02874-g7cf90e481cb8 #1 Not tainted
>   -----------------------------
>   kernel/locking/lockdep.c:3568 RCU-list traversed in non-reader section!!
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: Stop calling printk in rtas_stop_self()
      https://git.kernel.org/powerpc/c/ed8029d7b472369a010a1901358567ca3b6dbb0d

cheers
