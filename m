Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE0220CEA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 14:30:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6GtV6Hn6zDqY1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 22:30:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=d7fTd5KW; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6GqF3dg5zDqWj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 22:27:19 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 9F49228115E;
 Wed, 15 Jul 2020 08:27:15 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Dl7BREeXYyAE; Wed, 15 Jul 2020 08:27:15 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 628C528115D;
 Wed, 15 Jul 2020 08:27:15 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 628C528115D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594816035;
 bh=TPZk1GxCJoMUtYrz9jqLjh21bcDfMdLDKQPSdffICmI=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=d7fTd5KWxvmgO4I8LgyPOUjfjlKiObobBtc68vjoGxtqLj+iGrO9px2YRd+0OxLqB
 PCXMgM51z27gLqvyXwAclVTQ7TNoj22s1a0AiFsejmKKDq54zCagSw7CI1vvzc1bGz
 gn7L4hDJj0qgjhsPdjy3R4TZKBwdlHCzbwpCWICdi1zgN8YeVd60kijEoRSTTA7w2k
 EllO2ulvcs0ExLTmolqWMzxVgcS0EQRQIbwFC0tqApBErwJrC1jlzMQE6u4h9xRRg5
 EyUz+zXrhfqatsRPGJVhkcZBhz3HdMgAGie6tRl7WpRxn6vsUi1Uyxh7YjEFIa6bPC
 tdz9sw90KTjsw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OrLV38hoRJkS; Wed, 15 Jul 2020 08:27:15 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 5612A28115C;
 Wed, 15 Jul 2020 08:27:15 -0400 (EDT)
Date: Wed, 15 Jul 2020 08:27:15 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <849841781.14062.1594816035327.JavaMail.zimbra@efficios.com>
In-Reply-To: <20200715094829.252208-1-npiggin@gmail.com>
References: <20200715094829.252208-1-npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc: select ARCH_HAS_MEMBARRIER_SYNC_CORE
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: powerpc: select ARCH_HAS_MEMBARRIER_SYNC_CORE
Thread-Index: 3xz9KaI4NJiQWIgfXkzcTMmBc5tGIA==
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
 Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andy Lutomirski <luto@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jul 15, 2020, at 5:48 AM, Nicholas Piggin npiggin@gmail.com wrote:
[...]
> index 47bd4ea0837d..a4704f405e8d 100644
> --- a/arch/powerpc/include/asm/exception-64s.h
> +++ b/arch/powerpc/include/asm/exception-64s.h
> @@ -68,6 +68,13 @@
>  *
>  * The nop instructions allow us to insert one or more instructions to flush the
>  * L1-D cache when returning to userspace or a guest.
> + *
> + * powerpc relies on return from interrupt/syscall being context synchronising
> + * (which hrfid, rfid, and rfscv are) to support ARCH_HAS_MEMBARRIER_SYNC_CORE
> + * without additional additional synchronisation instructions. soft-masked
> + * interrupt replay does not include a context-synchronising rfid, but those
> + * always return to kernel, the context sync is only required for IPIs which
> + * return to user.
>  */
> #define RFI_FLUSH_SLOT							\
> 	RFI_FLUSH_FIXUP_SECTION;					\

I suspect the statement "the context sync is only required for IPIs which return to
user." is misleading.

As I recall that we need more than just context sync after IPI. We need context sync
in return path of any trap/interrupt/system call which returns to user-space, else
we'd need to add the proper core serializing barriers in the scheduler, as we had
to do for lazy tlb on x86.

Or am I missing something ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
