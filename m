Return-Path: <linuxppc-dev+bounces-1296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26BA9772B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 22:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4Tbv07Lpz2yVT;
	Fri, 13 Sep 2024 06:31:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726173066;
	cv=none; b=bf2LbWW8c7PyIJmdPdu/H4jLfHck+T3tXZ26COKIrcnRLYAEuSvZNy020s9RuUswmo/y5r+2+jf4u35ruFb3EnSZxVmZfNH22znfRglEleWJpUyb32Zb4eOcQrdEOYUwn49Z3MttCGAInEkOZqaSNStmWGfwbPlX/Ar7qEDfh5OarVtBmpkwGTcKerWjrcF71qQlm8B+Er/Uqf2VWZcYFaVuMk6kpqg22MsoJZ001Ha7QtMiqIzWwA8UffW2zVHosWIj1hYsZyumS/NJGpMTN/vlyWGs19tBeCnNykLsBRvzN6vvplagB7g5+wSs0XDRYk61O6cczxufzPk1PbkIug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726173066; c=relaxed/relaxed;
	bh=yLPhhW7Y6mbWdZPPRUIkvARITfuZTEZkDii7oKKU+Ek=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=hTDAF5psbSTb+5TrDH2XVg/RhDIVqwtYT1YnZJ2x9aC3K6sEclqlNJwSp2DMGqaBXkHJVyWdInTQhs4B5ogb9MsEayk7Vkbj4F1QMI9QmnctN+0+GNX6Nl9vWBG2sixJuDufEpxzO5w4UW7z/cn2JJz9omsT/0Xw040JbNpzempre1Xt59YMteheL1SjLyepBciIcP3n6C1CJ3dy1xN2h5OLiDYqaTJHnt3cwd/H7V+FX/BChaVBxHoYzuYg5GTC6faYz3u1qdBrbR6qF3/apre6B65X54hYOZiRA96H/iU8qsd9x5lUQWpcmcZd6gPUbnihExkI2FNtNKvgvzphpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3oSTAFq1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3hu_jzgskdo4sebjedbumyiweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3oSTAFq1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com; envelope-from=3hu_jzgskdo4sebjedbumyiweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4Tbt09v0z2yGh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 06:31:03 +1000 (AEST)
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-82cf28c74efso214836839f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 13:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726173061; x=1726777861; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLPhhW7Y6mbWdZPPRUIkvARITfuZTEZkDii7oKKU+Ek=;
        b=3oSTAFq1rd7jYBrFFfMd6t8ApWg4ngrejZ5/Tpguvw3YUgUVK9g78a0+3XnqJYkCQm
         01vLOCGOGjOgtK2mJKJAfJTVg6atji8wyz4cSXfJp0fz018vOxoSbYlC8QHIsru++vsM
         1PrG9RpZ7aBgm2AfRJk0ywA0DiJgV+g4Xl6y6OMaeWs+TV27dlJTCMPbkx9Cs3yCEq6k
         ki66jHSk45I3MZRADi3TmTQo/wn2tNSfalBUGMWAuk69JUdifrwzxArVt5oMC7tHaGhp
         lfLlseRf+CIL9ydW/BWjNAboj8rK2Iocd03oaAYdkaoF8B8gd2M+URz2bR/yl/LODomN
         /g+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726173061; x=1726777861;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLPhhW7Y6mbWdZPPRUIkvARITfuZTEZkDii7oKKU+Ek=;
        b=XjNfpcSnvLeVSll0tXooYj1JbSP+2Vc0HY0vmOEdmTm7I5RLEEJgaktujQWuKsgEkm
         djpTwIgFgOUPZQK1MqPhV5V5a1wK94oaZ3g0oMWomxHY7/75BnAd7b7EJL+oUpbHlD5d
         /mzrylA9zzMgbPHcvzxvdP5GN7ZCvvXMH2Yv+ciE3snxC60pGw8qhlnvMb1Bl8vTZaGo
         3e4mr6OX4AszfQGoKThNVfXvbnOgD+f7sOKOwTXlZRfSbSmMNHUTXV7Qc3dVMdzOuTPi
         yzie+TUAQw2CyJFiT9BBtgrCWzE+vFfasDS9l357SS8H6aF7flGuhyRLXAcG/qKwzpK1
         9ZCw==
X-Forwarded-Encrypted: i=1; AJvYcCV+oCN0zN0kcyQSLwBdC+g6kqocfYEiSXICGoPpyoQ6b7AJ49kfCGYOp/X3WFKFhmRnlnalcOBT1sYJunY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyje9AxA+zh/aNHNp7uilaA8NE2AWee1UHVdjP+awENYMrFF7tT
	7xMxQPQ+UM0G/8ofBe5O+LOxg3+n5DDKBUjqHtBDS5ZGQEMiLkQPQjD69PjRGw1n0vgOHwa7G3s
	aXYDcha+qMyPgMiUKWLLyEQ==
X-Google-Smtp-Source: AGHT+IEvNBP56SW+DzYGXpGSQjGH7l5m6WCB475tagf/GqT0PVTompxQRWYnVlmUdK8417EDaVC+g6P+CB3gV00+3Q==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6638:1412:b0:4c0:8165:c391 with
 SMTP id 8926c6da1cb9f-4d36136b75dmr162015173.4.1726173061371; Thu, 12 Sep
 2024 13:31:01 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:31:00 +0000
In-Reply-To: <ZuIgE2-GElzSGztH@google.com> (message from Sean Christopherson
 on Wed, 11 Sep 2024 15:56:19 -0700)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Message-ID: <gsntldzwd37f.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 5/5] perf: Correct perf sampling with guest VMs
From: Colton Lewis <coltonlewis@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, will@kernel.org, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Sep 11, 2024, Colton Lewis wrote:
>> Previously any PMU overflow interrupt that fired while a VCPU was
>> loaded was recorded as a guest event whether it truly was or not. This
>> resulted in nonsense perf recordings that did not honor
>> perf_event_attr.exclude_guest and recorded guest IPs where it should
>> have recorded host IPs.

>> Rework the sampling logic to only record guest samples for events with
>> exclude_guest clear. This way any host-only events with exclude_guest
>> set will never see unexpected guest samples. The behaviour of events
>> with exclude_guest clear is unchanged.

> Nit, "with exclude_guest clear" is easy to misread as simply "with  
> exclude_guest"
> (I did so at least three times).  Maybe

>    The behavior of exclude_guest=0 events is unchanged.

> or

>    The behavior of events without exclude_guest is unchanged.

> I think it's also worth explicitly calling out that events that are  
> configured
> to sample both host and guest may still be prone to misattributing a PMI  
> that
> arrived in the host as a guest event, depending on the KVM arch and/or  
> vendor
> behavior.

Done

