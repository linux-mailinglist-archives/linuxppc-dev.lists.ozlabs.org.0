Return-Path: <linuxppc-dev+bounces-13174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BAEBFDEBA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 20:46:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csJ630Qqnz30RJ;
	Thu, 23 Oct 2025 05:46:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761158778;
	cv=none; b=DcTWqNUXeo5fGJ7PGrlSkXfynFk3MsY0hAY8LjuQjBNx8spCeh67AiL+wh7w/Y/7Y+1mEXBwtAlrcG7+bFR7DSBhIGOuZsA3dZ5/1f4+X1wI3lk6QlWKoDuQeRV2569f176vxP6vAl06fT0TnQJm9xM0FHuR1VOAnNqt1QrLQy8opSfK9WCE1tTavJJCDIR9tS6LsxcJfRODPR/dh2zpp98tfbENIPCZMbkVEqPFzNHwZ5H1XZbYBDl+9lNgAgOUGts2oB5w6DX86xKlF0dqq+3ew9bwWnvj8iLACcpQ2BXz2nW3QIKHGy5DcL6Ea/pNsdQ0hx1drHOysNbtH2OcrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761158778; c=relaxed/relaxed;
	bh=Y5LU3IumH/ybekjL605GOzLVsbqQp3MsudwytfNYQFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f44lktQh78bPgPTL0lKqUSnrwalZJd0c5qi+E0mcxqMMcc9zL5wz36pT/Jl6DtLjG24S8/bQxcyjIleradmHjoBxIQDL2DUg8rtYTQq5AusZzMNwd4PxwwYVH6gQ4rVjf15ZSbyiLuyb+ixmJkcP+Ps7Am0C0AYxzZAE5Bsivdg5r5TcfxYs/o2nzOZviNfCW9t5miSElFwjswa+mEfZrVsDcKfk6RpUmdotpDixqvUsbe3f0DLtddDzeke/riL8fWDeTGyB6kO/0AsKeGrNUYDDdBSXtI8eWq+cHcK1h1PcX5HXGIvRUjQ2+kRCVeF9y+m4aOEREzqoVNcaKCn/AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RoVlI262; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3dyb5aaykdpyqcylhaemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RoVlI262;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3dyb5aaykdpyqcylhaemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csJ621By4z2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 05:46:17 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3304def7909so5882113a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 11:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761158776; x=1761763576; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5LU3IumH/ybekjL605GOzLVsbqQp3MsudwytfNYQFY=;
        b=RoVlI262J0oqaRanGv130KyPUgiJMP3Ihi1QWtaWH3cOchYcUr+JnyQLtz9jR7FatN
         vVbupoS98Y2mlcEAffZw17JIMeaDumguTkGTEHdUQB+86bSBEYXdR9+G8JfdRWhEqAFO
         7M9eD1vKfZbIB8aLEi+VtpDZ9W2Ulv7Yw2CVHLfXdRSeCUbBWs7RugumT2u6niL4eXwT
         AftcQD7x0Vr5w2Z7pj4e+pkCKdyCsAiRTDfUqvzRB1qwhCfI8KX5wh2uKyxbo3ofpX3O
         bu+LoqkbEGwqktH/tBMmcnEDEIuGwm1uveNyVmG7JHhZ3+qlxmlOYHZqF2LUeBxq0nbN
         bW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761158776; x=1761763576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5LU3IumH/ybekjL605GOzLVsbqQp3MsudwytfNYQFY=;
        b=oCP9LF4vIiTYrpyiw4u9BI4fbNsMAE8xXyU0Uxl7TGXCd3C7TlW+ekZiYZPHt8P40s
         rlXvu0UYOzFs5SIgtcfKI94cZ0Asg8iU5MSyL86H1Qtw5hZxHC5RbR5xb7L2w95+q5p5
         s0CzZdcoHVKCQX344+EMVTgz+kV4wR0X7LgEvZIQfjQvy7BEXdyCxo64t+TDPduoeUo1
         JUy4I3x9bSd7n7RVsLmKMB4Ze9rgh1WCI1d6iSw6JZX1/rJzyDJIJ2RZU1jW73XlTR5o
         bwwSW5gxzIiWPRn+3OhQ91ohjcY62BBjTvhCK2cUah4gpyelNcsz2XShQNuM1nBhIqEt
         T84A==
X-Forwarded-Encrypted: i=1; AJvYcCVt2IfNcYuVVkb7kYTAmDZptgFDPgrS/MXXVJvm3ZaNzpUcI2n+r/is/v8BMd0BVAHaACqdfRkquOgdLe8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+pNqqBQvHFiJ5oo0wuunmdgrADYxNizSf1OfRokBDiG/TR7hP
	wllHxH4JAv/px5nNjI4AAfU2ULztvLsdlIWdy00oFw8LFGo36Ub0sD3equLWh3sJWmONkMMhZI8
	VyGDzPQ==
X-Google-Smtp-Source: AGHT+IGZcCmPNTyYelUhOZ+RcEbayx11WFQSaVwU+Yrmb47JNxNNavWgCeScqZcEPGI7kg/CaUjf/Kp5mDE=
X-Received: from pjdq23.prod.google.com ([2002:a17:90a:2e17:b0:33d:9628:960e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52d0:b0:332:1edf:a694
 with SMTP id 98e67ed59e1d1-33bcf8fbbd3mr23327257a91.31.1761158775693; Wed, 22
 Oct 2025 11:46:15 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:46:14 -0700
In-Reply-To: <48d66446-40be-4a4e-a5af-c19e0b8d9182@linux.ibm.com>
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
 <aPZIGCFk-Rnlc1yT@google.com> <48d66446-40be-4a4e-a5af-c19e0b8d9182@linux.ibm.com>
Message-ID: <aPkmdsnG1qsaW3Ro@google.com>
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

On Tue, Oct 21, 2025, Shrikanth Hegde wrote:
> 
> Hi Sean.
> Thanks for taking time and going through the series.
> 
> On 10/20/25 8:02 PM, Sean Christopherson wrote:
> > On Wed, Sep 10, 2025, Shrikanth Hegde wrote:
> > > tl;dr
> > > 
> > > This is follow up of [1] with few fixes and addressing review comments.
> > > Upgraded it to RFC PATCH from RFC.
> > > Please review.
> > > 
> > > [1]: v2 - https://lore.kernel.org/all/20250625191108.1646208-1-sshegde@linux.ibm.com/
> > > 
> > > v2 -> v3:
> > > - Renamed to paravirt CPUs
> > 
> > There are myriad uses of "paravirt" throughout Linux and related environments,
> > and none of them mean "oversubscribed" or "contended".  I assume Hillf's comments
> > triggered the rename from "avoid CPUs", but IMO "avoid" is at least somewhat
> > accurate; "paravirt" is wildly misleading.
> 
> Name has been tricky. We want to have a positive sounding name while
> conveying that these CPUs are not be used for now due to contention,
> they may be used again when the contention has gone.

I suspect part of the problem with naming is the all-or-nothing approach itself.
There's a _lot_ of policy baked into that seemingly simple decision, and thus
it's hard to describe with a human-friendly name.

> > > Open issues:
> > > 
> > > - Derivation of hint from steal time is still a challenge. Some work is
> > >    underway to address it.
> > > 
> > > - Consider kvm and other hypervsiors and how they could derive the hint.
> > >    Need inputs from community.
> > 
> > Bluntly, this series is never going to land, at least not in a form that's remotely
> > close to what is proposed here.  This is an incredibly simplistic way of handling
> > overcommit, and AFAICT there's no line of sight to supporting more complex scenarios.
> > 
> 
> Could you describe these complex scenarios?

Any setup where "don't use this CPU" isn't a viable option, e.g. because all cores
could be overcommitted at any given time, or is far, far too coarse-grained.  Very
few use cases can distill vCPU scheduling needs and policies into single flag.

E.g. if all CPUs in a system are being used to vCPU tasks, all vCPUs are actively
running, and the host has a non-vCPU task that _must_ run, then the host will need
to preempt a vCPU task.  Ideally, a paravirtualized scheduling system would allow
the host to make an informed decision when choosing which vCPU to preempt, e.g. to
minimize disruption to the guest(s).

