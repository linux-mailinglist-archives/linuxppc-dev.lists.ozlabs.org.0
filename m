Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B087FEFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 14:42:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mSecvh7G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzXvk3Ct0z3vY1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 00:42:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mSecvh7G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzXv06pzCz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 00:41:30 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dddbe47ac1so36736235ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710855686; x=1711460486; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QkH9co6nduiKcJJYKmYutH4boWdY0DvPoemwdNHxcDM=;
        b=mSecvh7GRcH55j7iF6/IrZF/Wppzq8ajLQy7thIR22ufkvBodOfCuavpjJhp56EiBD
         3c/CnTLsDfNPhGgevCbkFKa7VUXBnPSb7/yaijJMQjfXbtv5dVlIegnTBdtwX+LG+zzb
         E0xQCxTDrpx2J8FjgjF1G7SAUmbOakZnU8qL75TiDamJbrdQm1FnyVU7lXxL3Jb6Tr8Q
         0D2zGsjB9Gr/wnlC2VhkXNkfAff8MapCHwjXkZOsLWsR5Xe5Sqd+B4Glmw2flMxpeIXd
         aT+DYlsJFwR9rydYITLBR1Z259QrZup9877lL82JwFJRTzkwuygcAWWl8rsWqOADq3SG
         7+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710855686; x=1711460486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkH9co6nduiKcJJYKmYutH4boWdY0DvPoemwdNHxcDM=;
        b=Bcvy25IGeK8PqFKPP5axy2Z96Q+B3BtsmqBd/4xec0lq8huhsoehqaC9IVRSXERLBQ
         WvI32Keb84zgbv0QQZBLYNxQD8FtDQmxXxx1rEVEhsKOXi/AfKSCjMRPATXBjdkvjDbq
         CVf+eZ8zANAhrsRREzK3tojzH3XpWKaSrGzGYZ8hPqVDMNI43FOWodo6ozjZHxSJKN9G
         QCvEsYJvuDJGhYq34xNg8lWwiz7ppWtFajqvf7RyPLuEbhfNxQYkrQTtf+qKVTeAuo2E
         UjCPCw3k0QhPE2LenP8JpSDTjM8XiTIHeNAfuixjS97Q5e5s4ZI/J4xG7/YQWcTLhbzH
         7VBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe/kGRSp195ouGfgQXwJB8rMxcBX3wrZqFi51SqdbH0WAu1v/MnyTk26p67awKYGK8vLWvd5FyovZzRBIAwWksDUg6ZfzW/zsQvjRibA==
X-Gm-Message-State: AOJu0Yw2RUumTLsuCuuYuWENgjAafd4oYksTyc9VcCR6iyE1EMUVLnw7
	FPNBxfGWvQ0liwze5YzAnEjOPpYRtJKlMimyhsnCLX1c6yY/V9w49gYXije7FIw94Lt5SxhLu1t
	FGFCvMKr4EVWiSEJFmPKx94srowR7RvUqJ3O9cw==
X-Google-Smtp-Source: AGHT+IEAbi0auRWgIpSpp8odJgiWiLOLp0RBR9BR3RBs5ux9Mb65HmgLxN0vr1fSWZK37iYVFCgfrwQjcZWrsLKnr5s=
X-Received: by 2002:a17:903:2387:b0:1e0:3620:375d with SMTP id
 v7-20020a170903238700b001e03620375dmr3235503plh.17.1710855686271; Tue, 19 Mar
 2024 06:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240228161018.14253-1-huschle@linux.ibm.com> <5a32e8e1-67cf-4296-a655-f0fc35dc880a@arm.com>
 <ZfL/hROYxQudcTuX@DESKTOP-2CCOB1S.> <66c4286e-deaf-44a0-be62-0928529ae73f@arm.com>
 <4b25ab45b762e64b9df09d4d12d8289f@linux.ibm.com>
In-Reply-To: <4b25ab45b762e64b9df09d4d12d8289f@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 19 Mar 2024 14:41:14 +0100
Message-ID: <CAKfTPtDyrsnq-CSFo+upzdOJpuH=JkRzSALad-OL29OvqkK2dg@mail.gmail.com>
Subject: Re: [RFC] sched/eevdf: sched feature to dismiss lag on wakeup
To: Tobias Huschle <huschle@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, srikar@linux.vnet.ibm.com, Luis Machado <luis.machado@arm.com>, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, nd <nd@arm.com>, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 19 Mar 2024 at 10:08, Tobias Huschle <huschle@linux.ibm.com> wrote:
>
> On 2024-03-18 15:45, Luis Machado wrote:
> > On 3/14/24 13:45, Tobias Huschle wrote:
> >> On Fri, Mar 08, 2024 at 03:11:38PM +0000, Luis Machado wrote:
> >>> On 2/28/24 16:10, Tobias Huschle wrote:
> >>>>
> >>>> Questions:
> >>>> 1. The kworker getting its negative lag occurs in the following
> >>>> scenario
> >>>>    - kworker and a cgroup are supposed to execute on the same CPU
> >>>>    - one task within the cgroup is executing and wakes up the
> >>>> kworker
> >>>>    - kworker with 0 lag, gets picked immediately and finishes its
> >>>>      execution within ~5000ns
> >>>>    - on dequeue, kworker gets assigned a negative lag
> >>>>    Is this expected behavior? With this short execution time, I
> >>>> would
> >>>>    expect the kworker to be fine.
> >>>
> >>> That strikes me as a bit odd as well. Have you been able to determine
> >>> how a negative lag
> >>> is assigned to the kworker after such a short runtime?
> >>>
> >>
> >> I did some more trace reading though and found something.
> >>
> >> What I observed if everything runs regularly:
> >> - vhost and kworker run alternating on the same CPU
> >> - if the kworker is done, it leaves the runqueue
> >> - vhost wakes up the kworker if it needs it
> >> --> this means:
> >>   - vhost starts alone on an otherwise empty runqueue
> >>   - it seems like it never gets dequeued
> >>     (unless another unrelated task joins or migration hits)
> >>   - if vhost wakes up the kworker, the kworker gets selected
> >>   - vhost runtime > kworker runtime
> >>     --> kworker gets positive lag and gets selected immediately next
> >> time
> >>
> >> What happens if it does go wrong:
> >> From what I gather, there seem to be occasions where the vhost either
> >> executes suprisingly quick, or the kworker surprinsingly slow. If
> >> these
> >> outliers reach critical values, it can happen, that
> >>    vhost runtime < kworker runtime
> >> which now causes the kworker to get the negative lag.
> >>
> >> In this case it seems like, that the vhost is very fast in waking up
> >> the kworker. And coincidentally, the kworker takes, more time than
> >> usual
> >> to finish. We speak of 4-digit to low 5-digit nanoseconds.
> >>
> >> So, for these outliers, the scheduler extrapolates that the kworker
> >> out-consumes the vhost and should be slowed down, although in the
> >> majority
> >> of other cases this does not happen.
> >
> > Thanks for providing the above details Tobias. It does seem like EEVDF
> > is strict
> > about the eligibility checks and making tasks wait when their lags are
> > negative, even
> > if just a little bit as in the case of the kworker.
> >
> > There was a patch to disable the eligibility checks
> > (https://lore.kernel.org/lkml/20231013030213.2472697-1-youssefesmat@chromium.org/),
> > which would make EEVDF more like EVDF, though the deadline comparison
> > would
> > probably still favor the vhost task instead of the kworker with the
> > negative lag.
> >
> > I'm not sure if you tried it, but I thought I'd mention it.
>
> Haven't seen that one yet. Unfortunately, it does not help to ignore the
> eligibility.
>
> I'm inclined to rather propose propose a documentation change, which
> describes that tasks should not rely on woken up tasks being scheduled
> immediately.

Where do you see such an assumption ? Even before eevdf, there were
nothing that ensures such behavior. When using CFS (legacy or eevdf)
tasks, you can't know if the newly wakeup task will run 1st or not


>
> Changing things in the code to address for the specific scenario I'm
> seeing seems to mostly create unwanted side effects and/or would require
> the definition of some magic cut-off values.
>
>
