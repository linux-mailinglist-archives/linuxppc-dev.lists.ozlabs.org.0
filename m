Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DDA88717F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 18:03:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mTIO13x6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1TDB177bz3wBJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 04:03:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mTIO13x6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1TCJ5dJlz3w56
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 04:02:20 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e04ac4209eso20297655ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711126937; x=1711731737; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FokECRCKDFSvWdQlq198p2mJBvxWlTy6rfKRldf1OUE=;
        b=mTIO13x6vley/+TiWKit36huHP3qirsEpa7a7YRYq01nA2HG0XEnZFwM1yAZMmTboT
         TMszQF0NIPLR1WMBeO+vlPp9zcgGxz3p//UyBRMJJVUNpL9QvPf8et8cvbyv78YPKKA1
         YJwi55dhZpicmtukWLQT1rFrnTEGuO8qOyiY+0imDi9MCdL0jsC7tNppfz9L3GD/ug+P
         OZ5FG+pjaYqWFcFCc+gN6BLUG/GZSGoidpvXlXeCNAswfQgbaZwFzrJxD5ylNtSWguyg
         MyW4umhNvfAVemgBUlzGmJsjw3Cgmi0yPYFQUVqGWPjQuUYVA4QGiByKM3+wC5EHK4su
         Ji4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711126937; x=1711731737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FokECRCKDFSvWdQlq198p2mJBvxWlTy6rfKRldf1OUE=;
        b=hnVeUUWGcXaZnTFTlhlRTMrz9vttwSqxUQDX49oZN6sG9dG/s9iDjCoHCPFEy58vlH
         Fcy8qaNeQu5oIvRFc1zkbfbpUK4tyv1H746dckS0iLU/7PhPtJ8s6RXKXWW8nX6JrDFS
         C1T1XouM0UFYv5la85n3L2ZP+AWHcADA6pbtrY7PB1zO6TjYcCi4nhAtT5l0yGuVYXt+
         ak2KUYg9pcNHVmoZGyV/6IQv7MLtE7ueXB5P147TplwpxYnPM39QPtreoGz5e8RoGTx8
         /hI/M4YjYcMyCASjzkUhxCsrQH6lk89XMxD36/ELIRje1+04FgVmcjodUsJ3eKxSycF1
         gHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEKlLr0GTC7ww17x0FqlAypXJL+aB25BWK/Gg28T/iNKzQLNmjDCfJJxGwPLu6DMEL1kgfOd0VT3xijqwtgsdQrYT4AwwjsMcHSntF3w==
X-Gm-Message-State: AOJu0YwiEgYRohtpw/RpkA2jHkuR8KxLPI6VASSX6xR3pyR9rOQj8A4o
	TrMIgCSqSjpuanYpu+V5vgCSdSwyrGSUne07lbG1nIlrpnjURSl+/DJJTjr4IHi4Xa0RZB4ZBV4
	hxM1xtk+cdlisoB7dBS8Rqa3yWhMx1xTTKQWD0k10yPu6Wo/Y00Y=
X-Google-Smtp-Source: AGHT+IENwh//6sLgcAqzxnJVnVpd66zXyuxgJJpLL7SyiDKB5DoNOJAorNwqZN2UlpGRBelhcanxNeLS7zSknKQgV4w=
X-Received: by 2002:a17:902:c255:b0:1e0:20c3:7c39 with SMTP id
 21-20020a170902c25500b001e020c37c39mr295946plg.24.1711126937416; Fri, 22 Mar
 2024 10:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240228161018.14253-1-huschle@linux.ibm.com> <5a32e8e1-67cf-4296-a655-f0fc35dc880a@arm.com>
 <ZfL/hROYxQudcTuX@DESKTOP-2CCOB1S.> <66c4286e-deaf-44a0-be62-0928529ae73f@arm.com>
 <4b25ab45b762e64b9df09d4d12d8289f@linux.ibm.com> <CAKfTPtDyrsnq-CSFo+upzdOJpuH=JkRzSALad-OL29OvqkK2dg@mail.gmail.com>
 <65fa8a7c.050a0220.c8ec5.0278SMTPIN_ADDED_BROKEN@mx.google.com>
 <CAKfTPtBA7ECeYJYdzL9ybeXLbpEudLfB6V9s+DZiJUmpnPf_kQ@mail.gmail.com> <65fc25ae.810a0220.f705f.4cdbSMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <65fc25ae.810a0220.f705f.4cdbSMTPIN_ADDED_BROKEN@mx.google.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 22 Mar 2024 18:02:05 +0100
Message-ID: <CAKfTPtCv37JA+5D6WQbgsjeY7-Vx4tD+6PFDH+wc8TtPE58T9A@mail.gmail.com>
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

On Thu, 21 Mar 2024 at 13:18, Tobias Huschle <huschle@linux.ibm.com> wrote:
>
> On Wed, Mar 20, 2024 at 02:51:00PM +0100, Vincent Guittot wrote:
> > On Wed, 20 Mar 2024 at 08:04, Tobias Huschle <huschle@linux.ibm.com> wrote:
> > > There was no guarantee of course. place_entity was reducing the vruntime of
> > > woken up tasks though, giving it a slight boost, right?. For the scenario
> >
> > It was rather the opposite, It was ensuring that long sleeping tasks
> > will not get too much bonus because of vruntime too far in the past.
> > This is similar although not exactly the same intent as the lag. The
> > bonus was up to 24ms previously whereas it's not more than a slice now
> >
>
> I might have gotten this quite wrong then. I was looking at place_entity
> and saw that non-initial placements get their vruntime reduced via
>
>     vruntime -= thresh;

and then
    se->vruntime = max_vruntime(se->vruntime, vruntime)

>
> which would mean that the placed task would have a vruntime smaller than
> cfs_rq->min_vruntime, based on pre-EEVDF behavior, last seen at:
>
>    af4cf40470c2 sched/fair: Add cfs_rq::avg_vruntime
>
> If there was no such benefit for woken up tasks. Then the scenario I observed
> is just conincidentally worse with EEVDF, which can happen when exchanging an
> algorithm I suppose. Or EEVDF just exposes a so far hidden problem in that
> scenario.
