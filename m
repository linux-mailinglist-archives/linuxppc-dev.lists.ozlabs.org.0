Return-Path: <linuxppc-dev+bounces-2966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825F9C0047
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 09:45:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkbHP0V8Wz3bkP;
	Thu,  7 Nov 2024 19:45:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730969105;
	cv=none; b=ILops891S+lqU4vVKCDaaGCYx2vfhb3IHWOC7COpF6sWF9ESTcw+SQBf1QeW/xyK29LK6kbt8jLXBXmtmm6vPFvrw2qxrTkq7BncUvgbK6k433UHU4UC8A6JiLJmkz7itVqSCb/Sw24HxlMosFhIwWDJiWcejlmdxGgC61xbaOhORzQZg9yyiTa+6K+/G/4TRcLAHecOkpSkUXZqYXCqC5Pkb8hfaACU4eaF3AxKEagt/5z+v7y8tvVraBH30MNrxXx4qFJtO6VGEPm+pOQKW5uKSUIpcCYz0fKs4/M0mhpU1Dpwnsbp2Up4iHz9wIjv1c3QE4OfG/V4xVxeBYT6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730969105; c=relaxed/relaxed;
	bh=cgUFzH7BmSz6PbT9WkTtB0jIuPaS6lKzVJSy+ZLIIvs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ovEpE0iYV1+/NQkuv9LuB0LTd4slE+VSCAKxtBtwfJhBYkP6d4q4wXKEVn5OjG87SFqrGe2IK05gVmjGS7gHC7Ucpnx2A/VY7V1V59M2emzTMIQUwcJPbSjVthGBjbbvMAWUlfhA8z6KvlvKcVbCWKpuoeX1yxcMat8hF3wsCgZkelGLnlDs4FUJJG7t6+katoKuA6R06bUHenAbga/wMEAywa5mZ0EMoyvwm2vM2jOuiUS4QLHWdnPzoj1mMYWvSIsnzqMySMr7CGIaseYcrwSUqwcqJAU8rSQdmqMnIEm0p/wKoQYK4YbjkNGp/rEGO/PaZsZEQewVE2lI2iBGFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HKRIiGml; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HKRIiGml;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkbHN1CMgz3bkp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 19:45:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730969100;
	bh=cgUFzH7BmSz6PbT9WkTtB0jIuPaS6lKzVJSy+ZLIIvs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HKRIiGmlv72BRS9r4wPyTvR2c6biM3wKAqiYJG1WLFpWHqSSeCqVLTZ92gRaO8zj+
	 9ZQKeZSPWPEZs3vsETv5cSvRxaXNZPf+ZsLqsuwiOq/LRNbjgnrvC/WxIO3hEKlcc3
	 UuGYEZ6KTrw49SUPKM/Zpy7F5ClUJgZlyHbI+cgckVtu3Fe1NUZtYJYTc+OTMGHvFy
	 vGOg4f/j8PuVsJo1hELblzBnb6FXgDfavLtEX7iRlVB8OD3gB9OYQ/JE0Mn1K0hIni
	 LX8syaGC27zHG8qhObJO0H/uMxgqc8hzm+gxAVJjDOCKN+LzMZXu1FHqKn2s5bDC0Y
	 QA2B7RcyE0mLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkbHJ5K3Sz4xFb;
	Thu,  7 Nov 2024 19:45:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: kjain@linux.ibm.com
In-Reply-To: <20240819122401.513203-1-mpe@ellerman.id.au>
References: <20240819122401.513203-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: Fix dtl_access_lock to be a rw_semaphore
Message-Id: <173096894648.18315.12733159334801198565.b4-ty@ellerman.id.au>
Date: Thu, 07 Nov 2024 19:42:26 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 19 Aug 2024 22:24:01 +1000, Michael Ellerman wrote:
> The dtl_access_lock needs to be a rw_sempahore, a sleeping lock, because
> the code calls kmalloc() while holding it, which can sleep:
> 
>   # echo 1 > /proc/powerpc/vcpudispatch_stats
>   BUG: sleeping function called from invalid context at include/linux/sched/mm.h:337
>   in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 199, name: sh
>   preempt_count: 1, expected: 0
>   3 locks held by sh/199:
>    #0: c00000000a0743f8 (sb_writers#3){.+.+}-{0:0}, at: vfs_write+0x324/0x438
>    #1: c0000000028c7058 (dtl_enable_mutex){+.+.}-{3:3}, at: vcpudispatch_stats_write+0xd4/0x5f4
>    #2: c0000000028c70b8 (dtl_access_lock){+.+.}-{2:2}, at: vcpudispatch_stats_write+0x220/0x5f4
>   CPU: 0 PID: 199 Comm: sh Not tainted 6.10.0-rc4 #152
>   Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
>   Call Trace:
>     dump_stack_lvl+0x130/0x148 (unreliable)
>     __might_resched+0x174/0x410
>     kmem_cache_alloc_noprof+0x340/0x3d0
>     alloc_dtl_buffers+0x124/0x1ac
>     vcpudispatch_stats_write+0x2a8/0x5f4
>     proc_reg_write+0xf4/0x150
>     vfs_write+0xfc/0x438
>     ksys_write+0x88/0x148
>     system_call_exception+0x1c4/0x5a0
>     system_call_common+0xf4/0x258
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: Fix dtl_access_lock to be a rw_semaphore
      https://git.kernel.org/powerpc/c/cadae3a45d23aa4f6485938a67cbc47aaaa25e38

cheers

