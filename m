Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C7D52210D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 18:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyNYs3Wjzz3cLc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 02:20:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DbTNnQAN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=DbTNnQAN; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyNYF18JHz3bsF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 02:20:00 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 137so405472pgb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 09:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9+Df9lfV5BwTT/sLBioPDv57rZs72h8hdScRQUqmfRs=;
 b=DbTNnQANFcOXKwYHrReNWPiVuWl37/eCn4xpzxdHqJGhGuDe4NiGluHjLalIKfeceQ
 alveLnONa7r6tMV6vwpk/x2irD0RL1pBt++semHssHPj+E0dC5AwNOvBOEzK1KFqzsoL
 ZpRW0OsU6syK+H/xXU4Gg5J8fATjoQZiJ0V5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9+Df9lfV5BwTT/sLBioPDv57rZs72h8hdScRQUqmfRs=;
 b=f7uR+3EyzmDKdIiOAasJSMxD7XB7zSF8HjJ/4wRWi2uTqjViMxl2CwynPsgbsgB5xd
 JmUdPX7Wo4FsyqtCEUTee2vU5uHNPGbD/Zhg9sJ93mk19Rq3oiSSuR83fQLt6n/oWCUC
 2Bo0RmyHS0SSEugDLXnetAPoIgjgyWIEsiLaRwyBxFo2NToYQTQ8kvjxIZmUHoZKIw5X
 h80AExKdTOGVwLdwXC9IbmXh1Kurx+eDv7cg/yam0YLdbqYdoj105KuEUotrzl9yiPLT
 hxx7fTJOmy4+bJR8conQPe83u3zJ/b9in1Vyh0LlYVhqapZ2sZnrb2f0Q9nSrQFMZNLY
 nQFQ==
X-Gm-Message-State: AOAM533JAHueUu26QcnI6J3V9vZzZFDQ+I/gFy+8n6ZSL8YaIvGD/GuP
 G9sQyBGPLq7+PXYcJlADKOuR+Q==
X-Google-Smtp-Source: ABdhPJwzS6y0yYlhwv0j5NGUmmES9XNaWWTJ+WEmYXv9m0JkzXUvVE28UhT6GLMK52JLwaAtdFpfew==
X-Received: by 2002:a65:63d9:0:b0:374:6b38:c6b3 with SMTP id
 n25-20020a6563d9000000b003746b38c6b3mr17713801pgv.195.1652199597370; 
 Tue, 10 May 2022 09:19:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a170902e84800b0015ea3a491a1sm2332544plg.191.2022.05.10.09.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:19:56 -0700 (PDT)
Date: Tue, 10 May 2022 09:19:56 -0700
From: Kees Cook <keescook@chromium.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH -next] powerpc: add support for syscall stack randomization
Message-ID: <202205100917.5480D91@keescook>
References: <20220505111932.228814-1-xiujianfeng@huawei.com>
 <1652173338.7bltwybi0c.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652173338.7bltwybi0c.astroid@bobo.none>
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
Cc: mark.rutland@arm.com, Xiu Jianfeng <xiujianfeng@huawei.com>,
 linux-kernel@vger.kernel.org, paulus@samba.org,
 linux-hardening@vger.kernel.org, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 07:23:46PM +1000, Nicholas Piggin wrote:
> Excerpts from Xiu Jianfeng's message of May 5, 2022 9:19 pm:
> > Add support for adding a random offset to the stack while handling
> > syscalls. This patch uses mftb() instead of get_random_int() for better
> > performance.
> 
> Hey, very nice.

Agreed! :)

> > [...]
> > @@ -82,6 +83,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
> >  
> >  	kuap_lock();
> >  
> > +	add_random_kstack_offset();
> >  	regs->orig_gpr3 = r3;
> >  
> >  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> 
> This looks like the right place. I wonder why other interrupts don't
> get the same treatment. Userspace can induce the kernel to take a 
> synchronous interrupt, or wait for async ones. Smaller surface area 
> maybe but certain instruction emulation for example could result in
> significant logic that depends on user state. Anyway that's for
> hardening gurus to ponder.

I welcome it being used for any userspace controllable entry to the
kernel! :)

Also, related, have you validated the result using the LKDTM test?
See tools/testing/selftests/lkdtm/stack-entropy.sh

> 
> > @@ -405,6 +407,7 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
> >  
> >  	/* Restore user access locks last */
> >  	kuap_user_restore(regs);
> > +	choose_random_kstack_offset(mftb() & 0xFF);
> >  
> >  	return ret;
> >  }
> 
> So this seems to be what x86 and s390 do, but why are we choosing a
> new offset for every interrupt when it's only used on a syscall?
> I would rather you do what arm64 does and just choose the offset
> at the end of system_call_exception.
> 
> I wonder why the choose is separated from the add? I guess it's to
> avoid a data dependency for stack access on an expensive random
> function, so that makes sense (a comment would be nice in the
> generic code).

How does this read? I can send a "real" patch if it looks good:


diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
index 1468caf001c0..ad3e80275c74 100644
--- a/include/linux/randomize_kstack.h
+++ b/include/linux/randomize_kstack.h
@@ -40,8 +40,11 @@ DECLARE_PER_CPU(u32, kstack_offset);
  */
 #define KSTACK_OFFSET_MAX(x)	((x) & 0x3FF)
 
-/*
- * These macros must be used during syscall entry when interrupts and
+/**
+ * add_random_kstack_offset - Increase stack utilization by previously
+ *			      chosen random offset
+ *
+ * This should be used in the syscall entry path when interrupts and
  * preempt are disabled, and after user registers have been stored to
  * the stack.
  */
@@ -55,6 +58,24 @@ DECLARE_PER_CPU(u32, kstack_offset);
 	}								\
 } while (0)
 
+/**
+ * choose_random_kstack_offset - Choose the random offsset for the next
+ *				 add_random_kstack_offset()
+ *
+ * This should only be used during syscall exit when interrupts and
+ * preempt are disabled, and before user registers have been restored
+ * from the stack. This is done to frustrate attack attempts from
+ * userspace to learn the offset:
+ * - Maximize the timing uncertainty visible from userspace: if the
+ *   the offset is chosen at syscall entry, userspace has much more
+ *   control over the timing between chosen offsets. "How long will we
+ *   be in kernel mode?" tends to be more difficult to know than "how
+ *   long will be be in user mode?"
+ * - Reduce the lifetime of the new offset sitting in memory during
+ *   kernel mode execution. Exposures of "thread-local" (e.g. current,
+ *   percpu, etc) memory contents tends to be easier than arbitrary
+ *   location memory exposures.
+ */
 #define choose_random_kstack_offset(rand) do {				\
 	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
 				&randomize_kstack_offset)) {		\


-- 
Kees Cook
