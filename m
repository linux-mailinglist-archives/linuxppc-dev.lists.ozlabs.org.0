Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C41F8812B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 14:51:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=thzeN1GR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V094V31gyz3dXY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 00:51:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=thzeN1GR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V093m0Vttz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 00:51:14 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-29dedcd244dso4580461a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 06:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710942671; x=1711547471; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8e4BaWXclywnzI3Jk7S4TKlOxYeGBb8JSlPzQCJxxg=;
        b=thzeN1GRkZ56ZOE2kkAszo2pJzbnOAF826qFwsQv9uFMYaP7rkkL9/Jsx32ZsXuZPD
         6Mkjz2i3BICYTW7TFUC7+eyRvdZxo0viOUv76+wvmD/4PVTBbTexkoCaddwUfXs0AeHR
         PLZ6poVU65c64qsx7tB06fTYmI++YMDu6zTSucBxcCWMbnvC0skSoYAilEGQmlyhRRyT
         h12Hi+fJz7j57KhTLjSpny5fdOtjIvCQfC4eSKDg9CWyzTazNpgYQcHkhxCuO/PVuMAS
         XJGjIfFVu/BdoH8O0phhvFkSsQpnT/tFfB4uac60uc/lgL+Vh0McpzNEso++yhGTLgQA
         3kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710942671; x=1711547471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8e4BaWXclywnzI3Jk7S4TKlOxYeGBb8JSlPzQCJxxg=;
        b=ITIpewfclPiO9nNpNk8W7P9B7Lcxivl1wn5VO8oFOZmC1K3+U8rtohhr+c7MsAQKba
         8mPl9TgzElnkCBE8V81o342h8L8eLG9HmpW8Qy0Us988Etor4Kw7DiH2+8NSTOUlZk5Y
         9njqe6YxLA/+d1PqPM40oVLDEIIRTFDoSDq3f5noQp496eLZ58dOrd09bZimGmJVwRrn
         cHH15rcAGfMYztXR75lup9NN2tE+NobBCkkb6QeCYPvNgaLuAazv3zi1E2RD611nSJGj
         zFDoW5HJXZ5uNY8oV6N43Sxmt07IT1SBTMi91xvI7tyl7RGRbONWSywug+Xvk7G/PL1P
         7ryw==
X-Forwarded-Encrypted: i=1; AJvYcCVCU1yM6+451prUhM//HdK7z1Px913dIi63ILw8T9/kOk3mEJLZIlGztjycavoWbpCK+JIjfDGrr0q/pl/7sz8/uOdvQ/5+SphgcSiIRA==
X-Gm-Message-State: AOJu0YxR60Epz1iOUpgG3LZBNsPAOUO5ykWcl5JAlYyFM/MsqNsvXMn3
	UKBDV1r392HzgO5TrhZt7/M21/M3Ef8Ggch08F8YAUzcigdaqOTsuGWV8Q7EyI7QbVmQOdeI+t6
	XGtUiPmEwteP8r5zpIjdMMLzVou86ZNYXBpQ0ow==
X-Google-Smtp-Source: AGHT+IFsUIwk02qC8x3xR6wX6hTw++PqVrYDzZneUQhrgnsJwX1DHRCbykwe+cTEelP+DZO8ncZNxbGnxie1HjumVQU=
X-Received: by 2002:a17:90a:77cc:b0:29f:ea48:375c with SMTP id
 e12-20020a17090a77cc00b0029fea48375cmr3411136pjs.42.1710942671518; Wed, 20
 Mar 2024 06:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240228161018.14253-1-huschle@linux.ibm.com> <5a32e8e1-67cf-4296-a655-f0fc35dc880a@arm.com>
 <ZfL/hROYxQudcTuX@DESKTOP-2CCOB1S.> <66c4286e-deaf-44a0-be62-0928529ae73f@arm.com>
 <4b25ab45b762e64b9df09d4d12d8289f@linux.ibm.com> <CAKfTPtDyrsnq-CSFo+upzdOJpuH=JkRzSALad-OL29OvqkK2dg@mail.gmail.com>
 <65fa8a7c.050a0220.c8ec5.0278SMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <65fa8a7c.050a0220.c8ec5.0278SMTPIN_ADDED_BROKEN@mx.google.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 20 Mar 2024 14:51:00 +0100
Message-ID: <CAKfTPtBA7ECeYJYdzL9ybeXLbpEudLfB6V9s+DZiJUmpnPf_kQ@mail.gmail.com>
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

On Wed, 20 Mar 2024 at 08:04, Tobias Huschle <huschle@linux.ibm.com> wrote:
>
> On Tue, Mar 19, 2024 at 02:41:14PM +0100, Vincent Guittot wrote:
> > On Tue, 19 Mar 2024 at 10:08, Tobias Huschle <huschle@linux.ibm.com> wrote:
> > >
...
> > >
> > > Haven't seen that one yet. Unfortunately, it does not help to ignore the
> > > eligibility.
> > >
> > > I'm inclined to rather propose propose a documentation change, which
> > > describes that tasks should not rely on woken up tasks being scheduled
> > > immediately.
> >
> > Where do you see such an assumption ? Even before eevdf, there were
> > nothing that ensures such behavior. When using CFS (legacy or eevdf)
> > tasks, you can't know if the newly wakeup task will run 1st or not
> >
>
> There was no guarantee of course. place_entity was reducing the vruntime of
> woken up tasks though, giving it a slight boost, right?. For the scenario

It was rather the opposite, It was ensuring that long sleeping tasks
will not get too much bonus because of vruntime too far in the past.
This is similar although not exactly the same intent as the lag. The
bonus was up to 24ms previously whereas it's not more than a slice now

> that I observed, that boost was enough to make sure, that the woken up tasks
> gets scheduled consistently. This might still not be true for all scenarios,
> but in general EEVDF seems to be stricter with woken up tasks.
>
> Dismissing the lag on wakeup also does obviously not guarantee getting
> scheduled, as other tasks might still be involved.
>
> The question would be if it should be explicitly mentioned somewhere that,
> at this point, woken up tasks are not getting any special treatment and
> noone should rely on that boost for woken up tasks.
>
> > >
> > > Changing things in the code to address for the specific scenario I'm
> > > seeing seems to mostly create unwanted side effects and/or would require
> > > the definition of some magic cut-off values.
> > >
> > >
