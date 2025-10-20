Return-Path: <linuxppc-dev+bounces-13063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4DBF1DE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 16:33:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqyZk1Z8mz304h;
	Tue, 21 Oct 2025 01:33:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760970782;
	cv=none; b=SNrZEBoJOIzVNPu7c8tFSq41C4C3qR2moC+c2+jb8lmE9q5dJQu3RryjgbyPKyy5B/Rfa4aHIr8bfYvJ5AuyygftFWq7aAfa3Jty3bNiI9yBRAL+heAwG22WeRrbUGyNTmk62kdoW3+Cl31BtQraguHEvi3sronhFO/iBhhhDGA+9q1jr+AF8+5eEEI9jgJFD59OO1WsEobmN1DHGmFladJtjUIlC6g5Izvy8oljh1hfdhNRC04xAtY7ocq9WfwnMcOsSsa/4giN+Z+u9LWL2IIhgV5G3yJjas8hwX5VLUKMAUY+EHuZIRkq89Cn0/XY9r3SxegdKiG+3LdTgMU6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760970782; c=relaxed/relaxed;
	bh=rxtYEYVGg1xee+FU6QJob1EIzCq4b+DS/H4drZtXgbA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T1Zw2SYRMUBVSnuohAo2cRXTthzf8OtjXf4qfxH1L+ep612/wBEdBKT6Iv7F3faF5j/OE3eLkHK7ceoexFHuIqir0jEJ7C/AolzZ1ubw6bJhQqgPsZKFCTybZ/LhHdQOEzDmXuThQE5Vah5PcstPLo+1dIE6p6rw96wcxtkJOSJfX0aSJ18DYElECHZxq0w6NLYbGirBdM9sLbue88MkFskwDrwX0ReHHm0R/ykZU6P6OWWSEqw3yR+1RTU4REV/9eOZPfBC89MNd6PCywlo+v5PPGGJ2tSO87VWIzQFjUPBW8aN2QnHpv9O6zMHx6rohV8D/kX2HnFXIOurNNW4Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=g5y9D8Sj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3guj2aaykdnae0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=g5y9D8Sj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3guj2aaykdnae0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqyZh4jMvz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 01:33:00 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b5516e33800so6378103a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760970778; x=1761575578; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rxtYEYVGg1xee+FU6QJob1EIzCq4b+DS/H4drZtXgbA=;
        b=g5y9D8Sjww+ZHJNsHWgthNHNyLPH6PdyS29Zq+D2tmcAEvyCuaV3J+Gf920Z9fcU3A
         qr+FGU3ugnNChANa2ch7UHS4+utKQFiyj8in3VqcibrDskFmJ1Gh47A5i4ETq19P6MXk
         57F4zrL0gfOmhYTxObOinMdPW5GkyJyTeNKMACkDDq5XoBASInZqLzH9EG4AK5+vzLOI
         zDurruWSFHJbeOwk04pFnJlYjN9ZBIm+iJXgveKHuFYHMtcaQ+2dBFj5bv6Ev3STXH3+
         nebIthStqHTfaYF6qYypsY5ZvIvEJ+LeQUKgB3qZasRYucQ+a5AqSH3G+czautpJ/yUT
         kI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970778; x=1761575578;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rxtYEYVGg1xee+FU6QJob1EIzCq4b+DS/H4drZtXgbA=;
        b=ms4MmmJqNMovn/ASL7U38JSYbOIXbSBWHGpoUSgOtRWF02pJkzyZtmEJs1zsJuO/1v
         nWJw3uQHACUxM3/W04RVMf3pCE0u3PtHHCrA6s4lHFOTR9ps87JO0AKXl5qTonEoDHbi
         Nn/WWIyGN3AkvjU+ctrbzsBFCX40WTcBI8uBz9K4tuMYdwV+DqosLvptZXFvQZtYzJLw
         H7HihzzYihn/qNy+wzjKQX8x80B8VeryDlUS3KyEcJ8L0eHj3pP5TuYqbOHkOHK9Q1YH
         gwrSPxPzxmb3/5mJglwaj1I9+7wR751mHvt9aLw6R6rDEKdHa3dIB1W1xwlg8arY0D+B
         TihQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyUgWjy3tGN4jKhLIRrrFylQ+G2K0e99p+BaXf6lBkqdSmGyOux2hf1TP7vJh/H/QIXWopICmLdg3bQKs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5zftnXbJIVJMgR7uE9T8Xh1Ra4zmDa95WCNSqru4aIClNsFeI
	g67utB4uPFQbEey4nIDQnd3AmKvfsicYbWidQZCvbkHZrLwYDOx5I92oF+69FUDRWs4Mo7lcLd+
	N+fqZrg==
X-Google-Smtp-Source: AGHT+IHYN3gPwuTbUwp+qLhiw1dSLKSY08s8KoatdQfaWUcMz0x8Il84U6uQREjYTVBx6/2IDE5exBcT4Xo=
X-Received: from plcr12.prod.google.com ([2002:a17:903:14c:b0:290:4eeb:bc7a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1746:b0:28d:190a:1913
 with SMTP id d9443c01a7336-290caf8509bmr147845565ad.38.1760970777614; Mon, 20
 Oct 2025 07:32:57 -0700 (PDT)
Date: Mon, 20 Oct 2025 07:32:56 -0700
In-Reply-To: <20250910174210.1969750-1-sshegde@linux.ibm.com>
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
Precedence: list
Mime-Version: 1.0
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
Message-ID: <aPZIGCFk-Rnlc1yT@google.com>
Subject: Re: [RFC PATCH v3 00/10] paravirt CPUs and push task for less vCPU preemption
From: Sean Christopherson <seanjc@google.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com, 
	maddy@linux.ibm.com, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org, 
	vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com, 
	rostedt@goodmis.org, dietmar.eggemann@arm.com, vineeth@bitbyteword.org, 
	jgross@suse.com, pbonzini@redhat.com
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025, Shrikanth Hegde wrote:
> tl;dr
> 
> This is follow up of [1] with few fixes and addressing review comments.
> Upgraded it to RFC PATCH from RFC. 
> Please review. 
> 
> [1]: v2 - https://lore.kernel.org/all/20250625191108.1646208-1-sshegde@linux.ibm.com/
> 
> v2 -> v3:
> - Renamed to paravirt CPUs

There are myriad uses of "paravirt" throughout Linux and related environments,
and none of them mean "oversubscribed" or "contended".  I assume Hillf's comments
triggered the rename from "avoid CPUs", but IMO "avoid" is at least somewhat
accurate; "paravirt" is wildly misleading.

> - Folded the changes under CONFIG_PARAVIRT.
> - Fixed the crash due work_buf corruption while using
>   stop_one_cpu_nowait. 
> - Added sysfs documentation.
> - Copy most of __balance_push_cpu_stop to new one, this helps it move 
>   the code out of CONFIG_HOTPLUG_CPU. 
> - Some of the code movement suggested. 
> 
> -----------------
> ::Detailed info:: 
> -----------------
> Problem statement 
> 
> vCPU - Virtual CPUs - CPU in VM world.
> pCPU - Physical CPUs - CPU in baremetal world.
> 
> A hypervisor does scheduling of vCPUs on a pCPUs. It has to give each
> vCPU some cycles and be fair. When there are more vCPU requests than
> the pCPUs, hypervsior has to preempt some vCPUs in order to run others.
> This is called as vCPU preemption.
> 
> If we take two VM's, When hypervisor preempts vCPU from VM1 to run vCPU from 
> VM2, it has to do save/restore VM context.Instead if VM's can co-ordinate among
> each other and request for limited  vCPUs, it avoids the above overhead and 
> there is context switching within vCPU(less expensive). Even if hypervisor
> is preempting one vCPU to run another within the same VM, it is still more 
> expensive than the task preemption within the vCPU. So basic aim to avoid 
> vCPU preemption.
> 
> So to achieve this, introduce "Paravirt CPU" concept, where it is better if
> workload avoids these vCPUs at this moment. (vCPUs stays online, don't want
> the overhead of sched domain rebuild and hotplug takes a lot of time too).
> 
> When there is contention, don't use paravirt CPUs.
> When there is no contention, use all vCPUs. 

...

> ------------
> Open issues: 
> 
> - Derivation of hint from steal time is still a challenge. Some work is
>   underway to address it. 
> 
> - Consider kvm and other hypervsiors and how they could derive the hint.
>   Need inputs from community. 

Bluntly, this series is never going to land, at least not in a form that's remotely
close to what is proposed here.  This is an incredibly simplistic way of handling
overcommit, and AFAICT there's no line of sight to supporting more complex scenarios.

I.e. I don't see a path to resolving all these "todos" in the changelog from the
last patch:

 : Ideal would be get the hint from hypervisor. It would be more accurate
 : since it has knowledge of all SPLPARs deployed in the system.
 : 
 : Till the hint from underlying hypervisor arrives, another idea is to
 : approximate the hint from steal time. There are some works ongoing, but
 : not there yet due to challenges revolving around limits and
 : convergence.
 : 
 : Till that happens, there is a need for debugfs file which could be used to
 : set/unset the hint. The interface currently is number starting from which
 : CPUs will marked as paravirt. It could be changed to one the takes a
 : cpumask(list of CPUs) in future.

I see Vineeth and Steven are on the Cc.  Argh, and you even commented on their
first RFC[1], where it was made quite clear that sprinkling one-off "hints"
throughoug the kernel wasn't a viable approach.

I don't know the current status of the ChromeOS work, but there was agreement in
principle that the bulk of paravirt scheduling should not need to touch the kernel
(host or guest)[2].

[1] https://lore.kernel.org/all/20231214024727.3503870-1-vineeth@bitbyteword.org
[2] https://lore.kernel.org/all/ZjJf27yn-vkdB32X@google.com

