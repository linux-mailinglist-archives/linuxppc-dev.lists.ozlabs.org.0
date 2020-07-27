Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6267822ED09
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 15:20:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFgQR2yJpzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 23:19:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=mingo.kernel.org@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m9lNB2hw; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFgMr4v0nzDqtS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 23:17:39 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id qc22so2235176ejb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iNBgboLv8PrTHcQjEn6Y9Jz21Y45h4oiyFqkeuFiwIo=;
 b=m9lNB2hwvTAN4kqxBWcMSgc2vgMnClGnzEA91il0qX2jUYtR538v0I2sE26G/ytH/P
 T4RpMxw+ereB4LMTBg2ajmg9kqdKW0PgzzSeU8sTmBmdVnTqfF+APt1NR6U7rTn935Vq
 RQz9PBK/vu4qFbPbvkHcqKwFfkOzCuJ4h+lGMYyZXSMcIcrTC+SXb72CDkt1H97ma2U4
 dxl6QtFhkWvIB5irb0Xg+cpAMxL/blcAidpAhInbfCNTpdTTjQPSxxB84V3NvhskyUdN
 m/7dCRpV+nbGGnpwKuOtMgwrYNVnDEROAp6X0BETYaS+7C3vmXsY7wLNy0rSb/5F4ZFM
 L7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=iNBgboLv8PrTHcQjEn6Y9Jz21Y45h4oiyFqkeuFiwIo=;
 b=TcedtUTCw5pTpEbOiv5+sPFxKuz7jBl4BJgPxPUNqwiZ5jzcaP2cBYSC256Ec2Rjy2
 GB8sl3wk8KxPMZyIWNMr+7a/yt2HZlm1NvrGDRaUgGqfLUOXZSdd2CyocfvBL0ZI8yfy
 3wn+WrIrFeIEIxls4Uf6NQT6/67S4zjnh/8bho42NJ38GoNCdxQiNlS3d27iSfIBSToI
 okbB5DVDKnRdtfiBN5H2BpRXrC2VyXwO3MvDxJNnETZbjyE53M79FgbfEXB8asjFmuvT
 BbVH3gmkwC3P8knuqGS1pmaipjXpmCLkT8DmGJhH57OFyqnZOTvWXLBi97/qjeNbIxOp
 DKtA==
X-Gm-Message-State: AOAM5306rMfGtBkFVz0YLi/fmKcxxpdVG/uHmYTdccyODxDEZ5q7vaQ+
 4wYscHxK2pL1ftJ+yzgndiU=
X-Google-Smtp-Source: ABdhPJyVxWiINoqkfFlfIcdrJsa1NvE979dm5Bc7LcNowaJCcOqoBIdVfKcSurwauXtjizprI63uuQ==
X-Received: by 2002:a17:906:1751:: with SMTP id
 d17mr20468545eje.140.1595855854375; 
 Mon, 27 Jul 2020 06:17:34 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id y7sm6961705ejd.73.2020.07.27.06.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 06:17:33 -0700 (PDT)
Date: Mon, 27 Jul 2020 15:17:31 +0200
From: Ingo Molnar <mingo@kernel.org>
To: peterz@infradead.org
Subject: Re: [PATCH] lockdep: Fix TRACE_IRQFLAGS vs NMIs
Message-ID: <20200727131731.GB105139@gmail.com>
References: <20200727124852.GK119549@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727124852.GK119549@hirez.programming.kicks-ass.net>
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
Cc: linux-arch@vger.kernel.org, linux-sh@vger.kernel.org, jcmvbkbc@gmail.com,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, borntraeger@de.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* peterz@infradead.org <peterz@infradead.org> wrote:

> 
> Prior to commit 859d069ee1dd ("lockdep: Prepare for NMI IRQ state
> tracking") IRQ state tracking was disabled in NMIs due to nmi_enter()
> doing lockdep_off() -- with the obvious requirement that NMI entry
> call nmi_enter() before trace_hardirqs_off().
> 
> [ afaict, PowerPC and SH violate this order on their NMI entry ]
> 
> However, that commit explicitly changed lockdep_hardirqs_*() to ignore
> lockdep_off() and breaks every architecture that has irq-tracing in
> it's NMI entry that hasn't been fixed up (x86 being the only fixed one
> at this point).
> 
> The reason for this change is that by ignoring lockdep_off() we can:
> 
>   - get rid of 'current->lockdep_recursion' in lockdep_assert_irqs*()
>     which was going to to give header-recursion issues with the
>     seqlock rework.
> 
>   - allow these lockdep_assert_*() macros to function in NMI context.
> 
> Restore the previous state of things and allow an architecture to
> opt-in to the NMI IRQ tracking support, however instead of relying on
> lockdep_off(), rely on in_nmi(), both are part of nmi_enter() and so
> over-all entry ordering doesn't need to change.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/x86/Kconfig.debug   |    3 +++
>  kernel/locking/lockdep.c |    8 +++++++-
>  lib/Kconfig.debug        |    6 ++++++
>  3 files changed, 16 insertions(+), 1 deletion(-)

Tree management side note: to apply this I've created a new 
tip:locking/nmi branch, which is based off the existing NMI vs. IRQ 
tracing commits included in locking/core:

ed00495333cc: ("locking/lockdep: Fix TRACE_IRQFLAGS vs. NMIs")
ba1f2b2eaa2a: ("x86/entry: Fix NMI vs IRQ state tracking")
859d069ee1dd: ("lockdep: Prepare for NMI IRQ state tracking")
248591f5d257: ("kcsan: Make KCSAN compatible with new IRQ state tracking")
e1bcad609f5a: ("Merge branch 'tip/x86/entry'")
b037b09b9058: ("x86/entry: Rename idtentry_enter/exit_cond_rcu() to idtentry_enter/exit()")
dcb7fd82c75e: ("Linux 5.8-rc4")

This locking/nmi branch can then be merged into irq/entry (there's a 
bunch of conflicts between them), without coupling all of v5.9's 
locking changes to Thomas's generic entry work.

Thanks,

	Ingo
