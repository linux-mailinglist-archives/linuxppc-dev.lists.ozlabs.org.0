Return-Path: <linuxppc-dev+bounces-1271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71151975DC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 01:46:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3xzj0ZNvz2yDt;
	Thu, 12 Sep 2024 09:46:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726095385;
	cv=none; b=NdMYg3tjXV7jXkLpQU2xUL0wToFXAXQNhCidVLOEUEQjeyT73izRo+7pFXXhjkQMr748xhDhKw7XTvcROuuShiK2bKhlvhJMyHUPpsxqCqSAP7aXHKWc7HH6HZOeDootyRuAb/HpsNxDNQRq8OdbiZNgzzb05HPxa9VIQLPhohOCOaMlhVggb3O3ovOgi7gtYpAg6ZLvdrO7zrupyfGJE/t3KsKTkbR7PVwglhzSoMtO33Cj7fHfSscXtxa5iStm1O+9HIDqwn1bw/lEpHlrq4FB2i5K1je8n94fJ0C92HZel2rnNKwz7vLdkmogzok6rc8LhqMElB8+9tw5o9Rw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726095385; c=relaxed/relaxed;
	bh=mBS3D2KdJA6HsOBF2WNnyBQbckZXPd9OPRyAx0Hk9Is=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EmZOqBWTY1D1r1Jaw0t2p/0ls9CUbQmuiyXwuseLfYLLRtPrUKyrOut1jbljvuNybTemLMyvyFLVZTWWXrltaBe6azmjcASeCH9Z6OQkR9zEbOPndlrlkGocTJnlB++dYElTcNg9mm+buWB2GppHaS4egfI2rgM/7ilIj1d3KQkCkNObnqrkaWx0Wcm5DCs3sO+prBBRC1nrB9ud4HZ/el6exfaOCrJh43lshKD7o85x8zU8HyPIWsVGIhb3dkYjiwf+/RJBTZY/ks/501IPhr/i61UvxIDBpmIAKxHjB8pOgDwmmhC3cfS+y41i5nhyJAa6Iu54UYtT7u3ExLaFGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=H4LIdnxV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3fcdizgykdbsj51ea37ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=H4LIdnxV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3fcdizgykdbsj51ea37ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3wt11rb0z2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 08:56:23 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e1a892d8438so990247276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 15:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726095381; x=1726700181; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mBS3D2KdJA6HsOBF2WNnyBQbckZXPd9OPRyAx0Hk9Is=;
        b=H4LIdnxVSLQvbezf6LNRJbeSHt04PUeE2m94T8wqaqJ+P/jYbi72IBc7KwACRN7BOq
         oCCuRKtri8MQuZ9auhrEegWGDzSevlj8R7DSg0g9w6T5mvdD/rqvbDWBTMFuOR5zUd/p
         kkFupNXCiBjYJD4MknYaUIsQ9bTaxhVmvrakaZmBRjm6KaPd+6dSasILAGLDQGN+VEA6
         jPJsXehIbUbEt8rKN7XcxcWf8LdZ1CM3MUK8CGvHh/gXYJHnIR3UxVV+VDTJiF4dGzow
         Ha4bnonlxIZU7cRZ4yv/6bPAzlk1nCx1Vg0RjlsCRdbXhbQAiCRGeqfZLeW1zSI4PH1N
         +ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726095381; x=1726700181;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBS3D2KdJA6HsOBF2WNnyBQbckZXPd9OPRyAx0Hk9Is=;
        b=vrOpjXGPbNvoqhpcyMOai2mcLOQvYHqqD4rvO2jbBber+ufkiA5AxzKu2uzQpIKvIO
         OH136xuQK7Wj+u3rFiCGRxRmvG11G3vyK3pN2WvfhgJk9+VHF258v5zkM+ndMAxZD9hi
         0+9KCHXAN1zeRYsvrUfY9qbqSpG9xiqwGO3NIOwp8vUogKIaWnCwhEyzvCZNyGdKJ5dR
         P7sDdnA/Z8V5wryjJoDX/xm/FuO8hELfPzyKaNYtuaT6Xz1/csYRDgzDo4Lte0sT9bWI
         dYJ8dSrshUDBy31vcJHdNhpPD81lkuOMjHhfF6uc+oAofRYc4IghjMXyyRsSggKGSTsz
         suIA==
X-Forwarded-Encrypted: i=1; AJvYcCUjvcdESmbY5eFJjsj3fN9O9HEgHF8+mwF3IMeYN3k3eXKHLQwNj9NowfEoBOtm00qlU1czbsE+aV/l+oY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1pFhpDlzHgtXNo+q3uQPHixgaTiDREq2Denov3lllglBC7/vi
	Hf83iP/AT56/ImYXN3+dMA6dAKsCrnZBjhr1wqUW6QFLLlcmurTLzFxWw8h6Ov9Gf9J9ZnPbMgG
	z/w==
X-Google-Smtp-Source: AGHT+IEoqmUAJ1tvpPAJVzioyGi+fn8A8xKnd0a1Zk3H0MPaPxV6IznaYWnB2Res1beHC7Hgla2hvlhylw8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2946:0:b0:e13:e775:5a3c with SMTP id
 3f1490d57ef6-e1d9db9e484mr1092276.2.1726095380603; Wed, 11 Sep 2024 15:56:20
 -0700 (PDT)
Date: Wed, 11 Sep 2024 15:56:19 -0700
In-Reply-To: <20240911222433.3415301-6-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20240911222433.3415301-1-coltonlewis@google.com> <20240911222433.3415301-6-coltonlewis@google.com>
Message-ID: <ZuIgE2-GElzSGztH@google.com>
Subject: Re: [PATCH v2 5/5] perf: Correct perf sampling with guest VMs
From: Sean Christopherson <seanjc@google.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 11, 2024, Colton Lewis wrote:
> Previously any PMU overflow interrupt that fired while a VCPU was
> loaded was recorded as a guest event whether it truly was or not. This
> resulted in nonsense perf recordings that did not honor
> perf_event_attr.exclude_guest and recorded guest IPs where it should
> have recorded host IPs.
> 
> Rework the sampling logic to only record guest samples for events with
> exclude_guest clear. This way any host-only events with exclude_guest
> set will never see unexpected guest samples. The behaviour of events
> with exclude_guest clear is unchanged.

Nit, "with exclude_guest clear" is easy to misread as simply "with exclude_guest"
(I did so at least three times).  Maybe 

  The behavior of exclude_guest=0 events is unchanged.

or

  The behavior of events without exclude_guest is unchanged.

I think it's also worth explicitly calling out that events that are configured
to sample both host and guest may still be prone to misattributing a PMI that
arrived in the host as a guest event, depending on the KVM arch and/or vendor
behavior.

