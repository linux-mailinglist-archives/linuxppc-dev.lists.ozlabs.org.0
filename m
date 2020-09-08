Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E069261591
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 18:53:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmB6Y475fzDqMN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 02:53:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=ro0mfI7e; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmB3z5LN6zDqML
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 02:50:50 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id h6so4650993qtd.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DV+gQLv9KnSn6wrXrnjXKog79JEGsdr3NCQZUTP7wo4=;
 b=ro0mfI7e6o5R6nOx7IgFUpVZTpTNNgYxuNoHO1ZTIWCSv8F14fUv8NNxvJGX1AcWeI
 oj7gCSAYZ03NFCz5Yk1kdUptkTcEL2jg8k11suWyutzG/tWAIQXgDxiQblccjtxHBq6L
 kvNqI5HUBkxeKHd24CpDimqy4hgbQPB39a2JCrCOqtLYKmvwq7KqLwkr3dN+7hSUPnh6
 TR8Owt7kdiRswdyRuOKgGH1ZR5NMgAb2sXuRjcTQZxLhQ3O+qMLYfpmGdhjOOeplwt/x
 6ymBEYuloFU2ZFrjpMQAOD9/tejA2+Vownc4iXkVZG0XvXRU+MhpglYnEb7nrfrc0N/Q
 eT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DV+gQLv9KnSn6wrXrnjXKog79JEGsdr3NCQZUTP7wo4=;
 b=D2y/RJGLVJ74GCEoVVetGHmeQ4E5kOEdsvbFLfCifW/Y1RONyCf5Zp9jUnhyYW20KE
 3zqe/FkQxBouGi5tILWHDRw5uuwCTJvVgptbeKglprrMaRnv9o0V1LseD/0uoY9h3hZs
 89PVyMfKW+ZK7OsW/kPFhDe516B5Vi/bNpT/+IvD5bAXV0AqwFC3O+ouWHWDuwsCdclO
 tSKraKCGY0Vi0efNmAJJr1EP4veE7kzv3tRXnI+pxM23gZ/odFjqkBCizI+lolFagKfF
 X3oivnRc35AI9eWOP4P31OPcJTFLtkzS4mDOxXgIfQgt897ERZuJro53xay0OUWGoo/H
 6psA==
X-Gm-Message-State: AOAM5335HcCAkQjXkeCNP3Dwkrt7TiyMNotIIOCO4z8kb6briak0Sei4
 OVO3g7gArAgrDNdGScVjPFTUOA==
X-Google-Smtp-Source: ABdhPJxjfXp5IoloTJj/bCrL/54bjExs0CfMitFhwgml2lahaEv5edAwMhZbPvKqrJkUZhLE+xAqzA==
X-Received: by 2002:aed:3b78:: with SMTP id q53mr957080qte.195.1599583846959; 
 Tue, 08 Sep 2020 09:50:46 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id s47sm15389452qtb.13.2020.09.08.09.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 09:50:46 -0700 (PDT)
Date: Tue, 8 Sep 2020 12:50:44 -0400
From: Qian Cai <cai@lca.pw>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH -next] fork: silence a false postive warning in __mmdrop
Message-ID: <20200908165043.GD5147@lca.pw>
References: <20200604150344.1796-1-cai@lca.pw>
 <20200722100637.GR119549@hirez.programming.kicks-ass.net>
 <20200722131900.GA4041@lca.pw>
 <20200722134406.GN10769@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722134406.GN10769@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 22, 2020 at 03:44:06PM +0200, Peter Zijlstra wrote:
> On Wed, Jul 22, 2020 at 09:19:00AM -0400, Qian Cai wrote:
> > On Wed, Jul 22, 2020 at 12:06:37PM +0200, peterz@infradead.org wrote:
> > > On Thu, Jun 04, 2020 at 11:03:44AM -0400, Qian Cai wrote:
> > > > The linux-next commit bf2c59fce407 ("sched/core: Fix illegal RCU from
> > > > offline CPUs") delayed,
> > > > 
> > > > idle->active_mm = &init_mm;
> > > > 
> > > > into finish_cpu() instead of idle_task_exit() which results in a false
> > > > positive warning that was originally designed in the commit 3eda69c92d47
> > > > ("kernel/fork.c: detect early free of a live mm").
> > > > 
> > > >  WARNING: CPU: 127 PID: 72976 at kernel/fork.c:697
> > > >  __mmdrop+0x230/0x2c0
> > > >  do_exit+0x424/0xfa0
> > > >  Call Trace:
> > > >  do_exit+0x424/0xfa0
> > > >  do_group_exit+0x64/0xd0
> > > >  sys_exit_group+0x24/0x30
> > > >  system_call_exception+0x108/0x1d0
> > > >  system_call_common+0xf0/0x278
> > > 
> > > Please explain; because afaict this is a use-after-free.
> > > 
> > > The thing is __mmdrop() is going to actually free the mm, so then what
> > > is finish_cpu()'s mmdrop() going to do?
> > > 
> > > ->active_mm() should have a refcount on the mm.
> > 
> > Well, the refcount issue you mentioned then happens all before bf2c59fce407 was
> > introduced as well, but then it looks harmless because mmdrop() in finish_cpu()
> > will do,
> > 
> > 	if (unlikely(atomic_dec_and_test(&mm->mm_count)))
> > 		__mmdrop(mm);
> 
> That's not harmless, that's a use-after-free. Those can cause memory
> corruption bugs and the like at best. Who knows what's at the location
> of mm->mm_count after we've already freed it.
> 
> > where that atomic_dec_and_test() see the negative refcount and will not involve
> > __mmdrop() again. It is not clear to me that once the CPU is offline if it
> > needs to care about its idle thread mm_count at all. Even if this refcount
> > issue is finally addressed, it could hit this warning in finish_cpu() without
> > this patch.
> > 
> > On the other hand, if you look at the commit 3eda69c92d47, it is clearly that
> > the assumption of,
> > 
> >    WARN_ON_ONCE(mm == current->active_mm);
> > 
> > is totally gone due to bf2c59fce407. Thus, the patch is to fix that discrepancy
> > first and then I'll look at that the imbalance mmdrop()/mmgrab() elsewhere.
> 
> No, you're talking nonsense. We must not free @mm when
> 'current->active_mm == mm', never.

Yes, you are right. It still trigger this below on powerpc with today's
linux-next by fuzzing for a while (saw a few times on recent linux-next before
as well but so far mostly reproducible on powerpc here). Any idea?

[12802.547809][T191552] BUG mm_struct (Tainted: G           O     ): Poison overwritten
[12802.547824][T191552] -----------------------------------------------------------------------------
[12802.547824][T191552] 
[12802.547843][T191552] Disabling lock debugging due to kernel taint
[12802.547867][T191552] INFO: 0x000000000e2a54ec-0x000000000e2a54ec @offset=96464. First byte 0x6a instead of 0x6b
[12802.547889][T191552] INFO: Allocated in dup_mm+0x48/0x6d0 age=955 cpu=108 pid=191552
[12802.547915][T191552] 	__slab_alloc+0xa4/0xf0
[12802.547937][T191552] 	kmem_cache_alloc+0x314/0x4a0
[12802.547959][T191552] 	dup_mm+0x48/0x6d0
dup_mm at kernel/fork.c:1344
[12802.547978][T191552] 	copy_process+0x11bc/0x19a0
[12802.548010][T191552] 	kernel_clone+0x120/0xb80
[12802.548031][T191552] 	__do_sys_clone+0x88/0xd0
[12802.548055][T191552] 	system_call_exception+0xf8/0x1d0
[12802.548083][T191552] 	system_call_common+0xe8/0x218
[12802.548093][T191552] INFO: Freed in __mmdrop+0x144/0x250 age=942 cpu=69 pid=882503
[12802.548140][T191552] 	kmem_cache_free+0x47c/0x500
[12802.548161][T191552] 	__mmdrop+0x144/0x250
__mmdrop at kernel/fork.c:685
[12802.548170][T191552] 	do_exit+0x3f4/0xed0
[12802.548212][T191552] 	do_group_exit+0x5c/0xd0
[12802.548244][T191552] 	sys_exit_group+0x1c/0x20
[12802.548277][T191552] 	system_call_exception+0xf8/0x1d0
[12802.548309][T191552] 	system_call_common+0xe8/0x218
[12802.548342][T191552] INFO: Slab 0x0000000048df84af objects=64 used=64 fp=0x0000000000000000 flags=0x87fff8000010200
[12802.548379][T191552] INFO: Object 0x00000000583c5ba3 @offset=96384 fp=0x00000000681f5d04
[12802.548379][T191552] 
[12802.548419][T191552] Redzone 000000004a1ea01e: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[12802.548445][T191552] Redzone 0000000037d12952: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[12802.548471][T191552] Redzone 000000008124eae0: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[12802.548511][T191552] Redzone 000000009b782382: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[12802.548559][T191552] Redzone 0000000005c781f2: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[12802.548608][T191552] Redzone 00000000f334982a: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[12802.548645][T191552] Redzone 0000000018372bc6: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[12802.548706][T191552] Redzone 00000000de34ccbe: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
[12802.548755][T191552] Object 00000000583c5ba3: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.548804][T191552] Object 000000007701f6eb: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.548864][T191552] Object 00000000796c61b2: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.548912][T191552] Object 00000000d5d3e0a7: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.548960][T191552] Object 00000000be4c7347: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.548997][T191552] Object 000000000e2a54ec: 6a 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  jkkkkkkkkkkkkkkk
[12802.549034][T191552] Object 000000005f2499ea: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549093][T191552] Object 000000007dfc6e96: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549120][T191552] Object 0000000033cbf36a: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549135][T191552] Object 00000000b62c5d59: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549172][T191552] Object 00000000fc047f4a: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549210][T191552] Object 00000000c28e582c: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549258][T191552] Object 0000000058ab5b6a: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549316][T191552] Object 000000005a56e917: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549364][T191552] Object 000000005a3db061: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549426][T191552] Object 00000000831930db: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549464][T191552] Object 00000000dfbae818: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549500][T191552] Object 000000007c1d0838: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549548][T191552] Object 0000000061011d8a: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549585][T191552] Object 000000000e949754: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549634][T191552] Object 000000006413f485: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549671][T191552] Object 00000000c2345eaa: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549718][T191552] Object 0000000092085813: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549755][T191552] Object 00000000bd1573c3: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549813][T191552] Object 00000000ea86aa44: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549862][T191552] Object 00000000f6c1034d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549910][T191552] Object 000000001d90fa29: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.549958][T191552] Object 000000001397fc70: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.550016][T191552] Object 0000000073b0be2d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.550053][T191552] Object 00000000887c2ae9: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.550101][T191552] Object 00000000b662d1ef: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.550183][T191552] Object 000000000f9f4844: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.550280][T191552] Object 0000000030f51915: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.550406][T191552] Object 0000000055fe92a1: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.550518][T191552] Object 0000000018acbccc: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.550641][T191552] Object 0000000003bc1e0d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.550755][T191552] Object 000000002d3ab81e: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.550879][T191552] Object 000000008e60297f: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.551005][T191552] Object 00000000816738aa: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.551104][T191552] Object 000000001418ad0f: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.551226][T191552] Object 00000000f753b837: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.551363][T191552] Object 000000003456e3f7: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.551489][T191552] Object 000000006e6ba90f: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.551609][T191552] Object 00000000731663e1: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.551730][T191552] Object 00000000c3364461: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.551854][T191552] Object 00000000eebcf88b: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.551956][T191552] Object 000000004de29fa4: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.552067][T191552] Object 000000005bd1967e: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.552184][T191552] Object 00000000d8d1d981: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.552321][T191552] Object 00000000fd01955d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.552447][T191552] Object 000000005aad9974: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.552555][T191552] Object 000000007fa2efe4: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.552653][T191552] Object 000000001e6bbc3d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.552782][T191552] Object 000000004e7b9320: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.552913][T191552] Object 000000007660c732: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.553024][T191552] Object 0000000005fe5824: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.553125][T191552] Object 000000007072b5da: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.553257][T191552] Object 00000000ce50558d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.553375][T191552] Object 00000000ee40426b: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.553508][T191552] Object 00000000151dd063: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.553588][T191552] Object 000000006dde4155: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.553719][T191552] Object 00000000bba9c8b4: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.553835][T191552] Object 0000000081fef250: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.553952][T191552] Object 00000000db9d7aa0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.554078][T191552] Object 00000000513748d5: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.554190][T191552] Object 000000001b7e4b57: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.554313][T191552] Object 00000000969509b3: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.554430][T191552] Object 00000000df85a9df: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.554558][T191552] Object 00000000d526fda8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.554664][T191552] Object 000000008be58260: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.554784][T191552] Object 000000006a8d52b0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.554911][T191552] Object 00000000ad1dfd55: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.555005][T191552] Object 00000000873b52ea: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.555134][T191552] Object 000000009716c879: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.555249][T191552] Object 00000000eca252fd: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.555371][T191552] Object 000000002d09f068: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.555493][T191552] Object 0000000095d7f3b1: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.555617][T191552] Object 000000009b66f877: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.555728][T191552] Object 00000000d4d0da23: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.555848][T191552] Object 00000000545dfae3: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.555965][T191552] Object 00000000c686086a: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.556093][T191552] Object 0000000076efef7b: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.556213][T191552] Object 000000007642cc9f: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.556313][T191552] Object 00000000a2c7182e: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.556431][T191552] Object 00000000d8508993: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.556570][T191552] Object 0000000007078b31: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.556676][T191552] Object 000000002111128f: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.556769][T191552] Object 0000000096a989ba: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.556904][T191552] Object 00000000078fa309: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.557025][T191552] Object 00000000b68d0e77: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.557158][T191552] Object 00000000144b15b3: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.557247][T191552] Object 00000000a806800d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.557351][T191552] Object 000000005edb4355: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.557484][T191552] Object 0000000049aaca1e: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.557600][T191552] Object 000000000eb0b7f9: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[12802.557727][T191552] Object 000000008fdb29be: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
[12802.557831][T191552] Redzone 00000000c5a61231: bb bb bb bb bb bb bb bb                          ........
[12802.557947][T191552] Padding 000000003163b13a: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[12802.558076][T191552] Padding 0000000092412b1a: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[12802.558187][T191552] Padding 00000000319fa8cb: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[12802.558314][T191552] Padding 00000000963c7ce8: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[12802.558432][T191552] CPU: 71 PID: 191552 Comm: trinity-main Tainted: G    B      O      5.9.0-rc4-next-20200908+ #1
[12802.558551][T191552] Call Trace:
[12802.558590][T191552] [c000201cb3427620] [c000000000701758] dump_stack+0xec/0x144 (unreliable)
[12802.558691][T191552] [c000201cb3427660] [c0000000003cb53c] print_trailer+0x278/0x2a0
[12802.558794][T191552] [c000201cb34276f0] [c0000000003c0d14] check_bytes_and_report+0x184/0x1b0
[12802.558900][T191552] [c000201cb34277a0] [c0000000003c1000] check_object+0x2c0/0x330
[12802.558990][T191552] [c000201cb3427800] [c0000000003c11ec] alloc_debug_processing+0x17c/0x1e0
[12802.559096][T191552] [c000201cb3427880] [c0000000003c5468] ___slab_alloc+0xb78/0xc60
[12802.559190][T191552] [c000201cb3427980] [c0000000003c55f4] __slab_alloc+0xa4/0xf0
[12802.559284][T191552] [c000201cb34279d0] [c0000000003c5954] kmem_cache_alloc+0x314/0x4a0
[12802.559362][T191552] [c000201cb3427a50] [c0000000000c4818] dup_mm+0x48/0x6d0
[12802.559445][T191552] [c000201cb3427b00] [c0000000000c665c] copy_process+0x11bc/0x19a0
[12802.559528][T191552] [c000201cb3427c20] [c0000000000c7210] kernel_clone+0x120/0xb80
[12802.559630][T191552] [c000201cb3427d00] [c0000000000c7cf8] __do_sys_clone+0x88/0xd0
[12802.559714][T191552] [c000201cb3427dc0] [c00000000002c748] system_call_exception+0xf8/0x1d0
[12802.559810][T191552] [c000201cb3427e20] [c00000000000d0a8] system_call_common+0xe8/0x218
[12802.559906][T191552] FIX mm_struct: Restoring 0x000000000e2a54ec-0x000000000e2a54ec=0x6b
[12802.559906][T191552] 
[12802.560030][T191552] FIX mm_struct: Marking all objects used
