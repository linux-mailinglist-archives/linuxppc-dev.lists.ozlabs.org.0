Return-Path: <linuxppc-dev+bounces-10194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0ABB0217D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 18:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdxgQ0QpXz2ys0;
	Sat, 12 Jul 2025 02:17:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752250625;
	cv=none; b=EKhdCWRKIpAv6L4rdZWeEKaQp3MX+CNWp0kE8Kg0gbWnTBATG0RN6FZrSyHZ1Csvv5W2UJX3+AvZYKGRY01dmJgm2hEza95HuGBdNxqmi+MRsnOlwTZhR/rglYxV5L4B1I4xNzJuDFCHxP2rxl7nl2Z3ODKkaE9kAHM+eBkCk1Zg3HPkGW+ncykHWnNGGJ4ozgonwc1HuKl6AuAC+kXKgCNiPUODcczgAPOtE7NIyeTJLLJdUXy6RP3cztGMfXaAstn5CrRSvZJN73lOkdn/U0zb+MmJjg0QoPNc0QQR5Sb37Y18rSYjmWMpn6JRn63U3ktaNO6SUFWs52Zj25P/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752250625; c=relaxed/relaxed;
	bh=N69y6RAWrW+VLoFuLAUhgQMkb1DzeOqb/BwKA2ls4OE=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D9T3RHGMD1uTFGcSuy5cdkBWGdpvyoSQqtZpH+Ikb3AOSLHZKbEUpsQWwBLk3ZL89DETycnjG3aXTwoGjEc4FYAL6IZ52VPRaz+ZlSCViDGHy2rdMAAPsSCrlRTIvoPMg0z2QK4ilcnvp0WhKz0XVtggamKPS07wXFWv58O18SCVOP4rtINH0dYuXScO4pgBYJZMvqfiAlLpWt3uut2nVh1QGPYwEMifdiljLwdmsr03O6t7JrHFkKU1pkMKF7BLl5X3uGp7/nhFeWHY2/eFWCY1wInkaZANCuo33f5lGeb9XqRAY8YT6hUkfWDRVdr0GSS3Q+60FqS2kscW8YBnIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RoKLZ4OF; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hjywbZdT; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RoKLZ4OF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hjywbZdT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdxgN69Mpz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jul 2025 02:17:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752250618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N69y6RAWrW+VLoFuLAUhgQMkb1DzeOqb/BwKA2ls4OE=;
	b=RoKLZ4OFcfhBr94zAZfm2sS2onqnBh0R6kiKcQhWP2A/dUrFz17fQhl9383FWiIqD/xxjJ
	DjOR9eptQLVYDSj3E57QvOP9/Qwh9TNvctnH57TJ/NBARBOhc1zgvd20bBraZyloHBHJKK
	XLH2ycebQPuoj1OfQV5JY3lmLdUhBLY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752250619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N69y6RAWrW+VLoFuLAUhgQMkb1DzeOqb/BwKA2ls4OE=;
	b=hjywbZdTRep7VmKznLQJyOgnQ44Sh37cRQ/eVXKLivpdiIJuFyy7C0pwaAr6S8yRsGf6uu
	OI85QpJDYhN0T/edpvcqmw/wZYrM8CXO6pBYpFompMCjfyVwH1fyeaaDWijoO8qRywGkNg
	WplOeel1S6UsywSXTSac/RVJ11JIz8w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-R-ZUB1VGMk6Puvsvq3xneQ-1; Fri, 11 Jul 2025 12:16:57 -0400
X-MC-Unique: R-ZUB1VGMk6Puvsvq3xneQ-1
X-Mimecast-MFC-AGG-ID: R-ZUB1VGMk6Puvsvq3xneQ_1752250616
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450df53d461so17671925e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 09:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752250616; x=1752855416;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N69y6RAWrW+VLoFuLAUhgQMkb1DzeOqb/BwKA2ls4OE=;
        b=sEnx+SegVQbyS0676mdRxP3g5UvNmR/MJpxwzrYopweBrGQurAYKVlJqdsr3ZH+WXT
         U9D5ykPBAGvV7FaCUix4G2QgvACunAREgq0jScxGZh1laB4u9k7RFPfMVtKYrtHBBkIr
         BjbxRPEqT9dE7m/FbrQ6gJudVNkOEneML6rVe0mWGIuTwgE8WCXw2HcOolb/yw3zyLwp
         WlaRCqr/LLkwubTL1t0ns7+TV0AaUFJYVCG+RgBJWdCyLVCMWKkpnAoooBUJbn1xApMz
         JeS2eBfQVJCzk5Y5c9mVQhrKTpvP44bntwC1CuKnGvZrmMqOTwUugA85caKWDDOPZ82y
         sxcw==
X-Forwarded-Encrypted: i=1; AJvYcCXCy3fz9jQNnKBGn3GhWJaLzykdBjXjHnWc5uwsMms9D4FSkblFTICJNb9nTdoyt+rttqMo1IW9ukdPzgg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxpOhKje+zLs9rBbAMUn4xQQ33XpSNtGrO3nig/14nszKoi29WP
	xacTyhzeav1pxd2AVFilcP91SpEWIAomVq8BPgyN033f+rtV4uZeRxYgFbt8wn8pxSdKqc8tlDy
	0B5Qe1XCrelz4A47hY55sc5b6IWqiMDqEKZa0SuQ8f4cIbZ0vpFfRxiJW6JqmWcszHmE=
X-Gm-Gg: ASbGncsPupXpLEDuJa3eCGyIUDFkLSU8zfFXfUrhe86b+57GGm392sRSpya0IAKf+W+
	EB+Dg/sBgAT+AOu/EamuVMny1SOcfTabLGp9UALWpcQuwsg3GCWknob0lnpCeaoFdlv2kY0yScZ
	kskdabM6KhoIKCQ2PtLKiHRMuHL8jKnNWbUhPNdub8gHHW4+ZGpisI6uVueZehiE93QZuTRVJqi
	tZdaCy529hY3mAnmcW2e5gTQjAxjRRtSP3re583CaruI/B+Jof5uhSnVfaSzASew6zKlJ11eRVx
	DQc/+YhwzMb5Tv+tGhzo7LUPZqquek5FD0KoV0OUbnWJytPTmkJp5rZuqDNv/MlDw2es3nQkzgi
	kaQCvd4uYhGqToDwf2tCI+2yU
X-Received: by 2002:a05:600c:a08:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-454f4255c7amr36001895e9.18.1752250615734;
        Fri, 11 Jul 2025 09:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqKqz+Nwu7qwpmpBJkgzK4CfoTHj5MeRmnd9QnXmnsCEbZD4jDrigJcYLQOC87BIdZzV/wAA==
X-Received: by 2002:a05:600c:a08:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-454f4255c7amr36001175e9.18.1752250615191;
        Fri, 11 Jul 2025 09:16:55 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d4cbsm4924805f8f.50.2025.07.11.09.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 09:16:54 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>, Li Chen <me@linux.beauty>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>, Peter Zijlstra <peterz@infradead.org>, Sohil
 Mehta <sohil.mehta@intel.com>, Brian Gerst <brgerst@gmail.com>, Patryk
 Wlazlyn <patryk.wlazlyn@linux.intel.com>, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Juri
 Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, Li Chen <chenl311@chinatelecom.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Tobias Huschle <huschle@linux.ibm.com>, Mete Durlu <meted@linux.ibm.com>,
 Joel Granados <joel.granados@kernel.org>, Guo Weikang
 <guoweikang.kernel@gmail.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 1/4] smpboot: introduce SDTL_INIT() helper to tidy
 sched topology setup
In-Reply-To: <ba4dbdf8-bc37-493d-b2e0-2efb00ea3e19@amd.com>
References: <20250710105715.66594-1-me@linux.beauty>
 <20250710105715.66594-2-me@linux.beauty>
 <ba4dbdf8-bc37-493d-b2e0-2efb00ea3e19@amd.com>
Date: Fri, 11 Jul 2025 18:16:52 +0200
Message-ID: <xhsmhqzym1z4b.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
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
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _1OWISrAIsTGD2wxV3sGSJ7P-CO1M_UnbDtwqSlWCcs_1752250616
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/07/25 11:20, K Prateek Nayak wrote:
> Tangential discussion: I was looking at this and was wondering why we
> need a "tl->flags" when there is already sd_flags() function and we can
> simply add SD_OVERLAP to sd_numa_flags().
>
> I think "tl->flags" was needed when the idea of overlap domains was
> added in commit e3589f6c81e4 ("sched: Allow for overlapping sched_domain
> spans") when it depended on "FORCE_SD_OVERLAP" sched_feat() which
> allowed toggling this off but that was done away with in commit
> af85596c74de ("sched/topology: Remove FORCE_SD_OVERLAP") so perhaps we
> can get rid of it now?
>
> Relying on SD_NUMA should be enough currently. Peter, Valentin, what do
> you think of something like below?
>

I remember asking myself the same question when I mucked about the SD
flags; I ended up convincing myself to let it be but I couldn't find any
note as to why. Looking at things in their current state, I agree with you,
we could just bin it.


