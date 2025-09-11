Return-Path: <linuxppc-dev+bounces-12034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3DCB537C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 17:29:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN1hM24Slz2yGx;
	Fri, 12 Sep 2025 01:29:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757604595;
	cv=none; b=kCx4LlPW3PPD8NRqm5r8bOsymIEVZci8NmiR4MwH1Ox1AnvwAmgP5kxTq1V3UIPup8iDjIwfjP5l0vpr6XWQuZDrIUPhCNHtT1ybPLlk917DLP+RKTYvAZVBPJXHjxcrc9A0XWyvJhYyVSWP3Ywc/ub/vUgUxHSoBWXqVwl/+0gmwhon8i8EXwXIMK6vQSgM6KGAhcuTuUt4NXmihWIewRCA6Y0lD/RfCFIqdfC6fbwzrktOjKwfDmG+ZH7GLje7zI5tlngj6DlFlnaV6K4FZS4GoFrxtTUaZzmtnuQ1NOffN7EZVfnqzfO4ZHLiu1/oQCXOiRn5kyzy4BgmXKIVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757604595; c=relaxed/relaxed;
	bh=kThTStovM5zRnmTibRovdCW9EC5VzQ8qr9pFwun47c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPCwL0ajewvq9EO5VvHZ3yefEmGoLPhbtZz1Emslpvfoyut+4XRz6GUKj1jwmn/zeUaPUw2nF19GjPifXtb35eitJG41Jx+tHncWgE22y086e4ulUzczef+b1pEc5njwzDNgPwTFqfNte18nGvEGHhj1z2Cy8MoRIEljTzFGKNsUXMLcYXN8F9Se4OzGDSyIP8wSa1ZyrfRa6th2vbC6I0+JzKPPTLDRsildQwwfp77bloz9sFtYJ3X0SXobymFQX6FL2xrsVEXsb1wWM47Smu+WgvQn+4+CS5cv3PWUFtoWd5kyjQB+J8+Rfg1/48V0JJZViyDob+JxM/iIoH/yOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SkS/iX79; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SkS/iX79;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cN1hL19Shz2xnn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 01:29:52 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-24b164146baso4965245ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 08:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757604591; x=1758209391; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kThTStovM5zRnmTibRovdCW9EC5VzQ8qr9pFwun47c0=;
        b=SkS/iX79RhTfMoqQmP+5P6aCAjSL/j31mNgXyla3qSYm7vD9UR14wDNFkq9kcNfPHD
         2FiwxxDDMwWDun2tC1W+CnikfZX+JusbCfBxJvijEFU1ku6PNUVlfadbJPRUKODYMWUS
         8JUoZpZ2VlqjWmnsQVpsHz3xsA2n//ISBSRIpSPH8lEhRehVcK9Uvk4J3PsdVJsu8mUE
         efX/KkK2f6xiKEuCBsWHKNlg+P9k+d4y8nAFGz2xorgJuDirLKOpMlOWSdmdBg6cqMEy
         CRVKKDsZinhhqGe4Gfx0dDHzuTY+6eIITJNE8oL9RImYvLhgIHK/bGD9jJPkFYYPt7LE
         dCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757604591; x=1758209391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kThTStovM5zRnmTibRovdCW9EC5VzQ8qr9pFwun47c0=;
        b=R+XuT9ZNOm+pyefZKrXIN4ZEaUrjJ+hFknHY46ZOrQp7GEJL/drvp7c+e7UmCw1RX5
         KhNgtCi7xdO9fykGPNLfw+C2PEzi+4qMvhjA14o7nYMIFylMbrBdlbBPFNQAxuHp0G73
         F7I0qm1gY4pWhQmDGJcx60/p2VeCpPBAbsdaCb1iRrnonUmKU/mTIFQe8plBhOB27KAu
         10VxR7T/H/oCH9EvKXRIQ6M0HPYLedBS7eJxj33fGQimSiIjpsONjKMF8rnVQjnqDWWV
         qCVeQm4VLc00oJJOdv+n+FlqwsIOWmLu4kqupF/a9TYfcON0Hc859rts0dn3/Tz3xPjl
         24sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtUu+z/Kn9WbOpg74GOH58s2SlQ6r8hz1qjCdbdg8ZaryfUBERUH2R5XCkToDq8doLdTUphA8En4eID34=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yztk94juzF7a6rZbgiFLO1NPJqhzdkKIV4PO+MMfqK9kE1TOPuF
	5cYaN9hhQv41nRzP2v5v+7aPGTBRM5M77k3BlyutW7tHplKJyHfUxPqu
X-Gm-Gg: ASbGncvXju/WcVfaRrGm64h6OnxOSYO4+dsyb/orRBR4qeLYNDjEmWW+zl3tPBsZ6o/
	LbS9WJ4HVt8tC5J4leUL0A+q+ZeCismhT2guu9ToumnK1mZSg5Zexa2DG3Fm5AVsPjNAKFcz3EM
	ywmRSVHNNtX6mu23G8OUihDcANEHM8324Q+ZDDmt543EkttekVvs2rRNn+luuH8O1+42LAhQnMD
	aUDFuHj/JsdZEnRnNAWqz3U+zrKCXMtyeInW6wijbRi8SG0b+jXYVcfhWYFpIAV9fOFtO1G7qLn
	o/XBge7tpVpm3VBNrorXYjzKWzNi78oXHv+8y/X9S0Zvmt7qhPyLJAXrG477a6fa9LO/4qVjj6G
	Gbk3C3q1v0Suq3WFFQo6SBY/SFQ/QP5aIDCorm7JcYnY=
X-Google-Smtp-Source: AGHT+IEm+RRE/bSI/p1po+MT/rTHPppO+spju+6fiNrk6imJFGLoJV3GyLq2kmt3HiwkxgdZ+AvXKg==
X-Received: by 2002:a17:902:db0a:b0:246:a165:87c7 with SMTP id d9443c01a7336-25173308aa2mr244946455ad.42.1757604590762;
        Thu, 11 Sep 2025 08:29:50 -0700 (PDT)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6c2csm22602105ad.11.2025.09.11.08.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:29:50 -0700 (PDT)
Date: Thu, 11 Sep 2025 11:29:46 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	gregkh@linuxfoundation.org, vschneid@redhat.com, iii@linux.ibm.com,
	huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, vineeth@bitbyteword.org, jgross@suse.com,
	pbonzini@redhat.com, seanjc@google.com
Subject: Re: [RFC PATCH v3 03/10] sched: Static key to check paravirt cpu push
Message-ID: <aMLq6ht48Mej_4zW@yury>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-4-sshegde@linux.ibm.com>
 <aMIrgI9J4fuXntRz@yury>
 <b751b212-c4a5-4e7e-ad0f-df8cd3de19f7@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b751b212-c4a5-4e7e-ad0f-df8cd3de19f7@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 11, 2025 at 08:07:46PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 9/11/25 7:23 AM, Yury Norov wrote:
> > On Wed, Sep 10, 2025 at 11:12:03PM +0530, Shrikanth Hegde wrote:
> > > CPUs are marked paravirt when there is contention for underlying
> > > physical CPU.
> > > 
> > > The push mechanism and check for paravirt CPUs are in sched tick
> > > and wakeup. It should be close to no-op when there is no need for it.
> > > Achieve that using static key.
> > > 
> > > Architecture needs to enable this key when it decides there are
> > > paravirt CPUs. Disable it when there are no paravirt CPUs.
> > 
> 
> Hi Yury, Thanks for looking into this series.
> 
> > Testing a bit is quite close to a no-op, isn't it? Have you measured
> > the performance impact that would advocate the static key? Please
> > share some numbers then. I believe I asked you about it on the previous
> > round.
> 
> The reasons I thought to keep are:
> 
> 1. In load balance there is cpumask_and which does a loop.
> Might be better to avoid it when it is not necessary.
> 
> 2. Since __cpu_paravirt_mask is going to in one of the memory node in large NUMA systems
> (likely on boot cpu node), access to it from other nodes might take time and costly when
> it is not in cache. one could say same for static key too. but cpumask can be large when
> NR_CPUS=8192 or so.
>
> 
> In most of the cases hackbench,schbench didn't show much difference.
 
So, you're adding a complication for no clear benefit. Just drop it.

