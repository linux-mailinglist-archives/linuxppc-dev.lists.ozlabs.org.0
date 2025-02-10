Return-Path: <linuxppc-dev+bounces-6063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 915D6A2F9D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 21:20:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsGDS0PCkz30Qk;
	Tue, 11 Feb 2025 07:20:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739218855;
	cv=none; b=auRuFR/eoiQ1Ai7+hbXphGnHECSZwoMc4dVla+Gui3IGLogVdSDuaiDQZ0FB0Y8/S1U1PrAXx8zV/AZSjjejnatnhQ4w7+jfCkhKaUQa4WavZTM9S+4i/YFlSNne2dczv/S4BQB7zqMNMx5zB5HPinlroSlJCLofmrjEl4pDthA/1epREelOYrS0nZ8cW75yWqMj0MBHiV3K9tbRhE1ItHjsWgSC+U40zJuIWhmcOQrxZoynn1zlLfubtmUqnJxNVdgdd8cjF2n4GXpjqMlFlXbWiNvYrgq1u/LCZNFXCGuPVoZcd+AhajNSoXqylMWkIiq2F7S9u29jenN2iJj4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739218855; c=relaxed/relaxed;
	bh=+U4SNtAYoNj/slS851MmEMQHfNyRR3XcIfGGghXow/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVQMdF3ltrGieU6FJjck6TXWYtbsSdwxK4tGUd5CDufRpRVyHfQo+XA4o1swH+I4gwYcTVAbgNEvdqQFoMA2FiMU/iIO2JY8YEMy4LsYZ136d0A/ajDqvPnYh4B3fXCBv8G8oXioKl0wlRE7pwYRIDjemasRXyEu/FktVH4nNmd5+ARRz4eAqbzZ+Jxat8zQ9dJNyXagEMg9SRxW5lF58z7g0uyzX8PkwKrGdUYb5Y1klgg27n99BaArKi8sDG0o1ySnI9uDMFa8DqGu4BT15gZ2/DNM57q/5y5J4dFkQbilFFO65vBSGlNTKJM0Ofgb3q54qrDIdL+rJoub18jKcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DXihOpy9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DXihOpy9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsGDR0Mf4z30Nl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 07:20:54 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21f5660c2fdso62130845ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 12:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739218853; x=1739823653; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+U4SNtAYoNj/slS851MmEMQHfNyRR3XcIfGGghXow/M=;
        b=DXihOpy9Q0sD5kQV283Sfa1EsrtxIkrFNXWhsDbQEWPR/19zDoWw3Eg9DBt36iU9lg
         Xhj7ag/ZFg94NvQmiaeIOQfvURVg2VeJCrSxgT3cxey0Dw/rMUiAXPb5teuqp4Sg0rF3
         KTZJvSdfj5ctylOSCZZfbD2Iz++0i2QCvTkrdugpAPK4OXoOzxYt638YneDG+oTJhnog
         FsDeHisW7f+iglIklgtTX2OqrTYg/extrylRF2kqNiCVUIUEtWQlOekr2Miv++O+mzph
         XZXnuZg874L4KXilIvUHW1k7tlO3hLYlOkX/7jpg4kNlqngFt45cWuUVzqecVTB2eGJ6
         Zu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739218853; x=1739823653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U4SNtAYoNj/slS851MmEMQHfNyRR3XcIfGGghXow/M=;
        b=ihYHvg7tFUbj510c2lwre0cFiVfzvyuvFRUFDRJBgPvS4f+ljOi381hVC3MBw1BJVb
         obHlECyzGWg03bItuGDQt+kHS30Tv0qz9MKYEHeNj5devjH4U6k0gzRLTp98KPSDGFfk
         3PgO1GaoK9EQ8OhQ/bCTPzTefU9lwGI4cEVyhSik49yK6Y8CHlZm4v5rW90NSOpM8HGQ
         h8pCUMUBdPf7/L7pZM4I62uoMVHDR9tUYdxqRw4e9ZlByv3BwZxosSxLtRuDoRkB6RmK
         72WLePby6zPWLrJM4P+Qe1HZ6hvgoZJlr9LCaR8rozM2jIUwUhohQXoKNwugDzCpF0qk
         +bjg==
X-Forwarded-Encrypted: i=1; AJvYcCUA0Hn4vo5PtG7aXf89isLZNLDRr1f1ebpnxL3jfuBh4ENHclcxOG5Fen1slsooBQPHB+BooJ0bhFUzwLk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwpJNOsk9R4Ykp/Zj0AKhcCcp0mJ6gRPJrGHxmGbSSDAiHlJFw0
	sLmrKWtU+74e7AS3LPMPALdfoxA5pDSejFBDMkVeiTA3H2w1ow0m
X-Gm-Gg: ASbGnctAaK1qsp1RKivUbJqG8eGfbHkJmjSPfQRZGN9WURoVzGfJcV3RT0INR8GnrDs
	zq9NQayRua9yCg02TwhlWEzwMaPmfioTGlp8ljXOwL7UMHFzM2ZFcy+Zu1upVEiHrJlM90YI9tn
	e/fr4qQZYUiNYri33AUuE9UAD0J062uqwHFqyBgLXyf8I7N2Duemn/fjAxKxH+44lLcm7HY7xMo
	zfAB+b4sGn4KpVsCBzdqZsRmDZdLKKphoZVcyz4O84VvEE5ggJqtb3ivrwRP5fSRSZPFQfWanN4
	Da8Qezplbi7+DDU=
X-Google-Smtp-Source: AGHT+IFFp7T1utLBt4O/HjDrewHfjUvFxkAs6j6ggHA+b7oWllB60ZkZFVyLSjMCjdbjvvvdajt23Q==
X-Received: by 2002:a17:903:94e:b0:215:9470:7e82 with SMTP id d9443c01a7336-21f4e6a035bmr293695885ad.4.1739218852479;
        Mon, 10 Feb 2025 12:20:52 -0800 (PST)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650ce0bsm82768025ad.21.2025.02.10.12.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:20:51 -0800 (PST)
Date: Mon, 10 Feb 2025 15:20:50 -0500
From: Yury Norov <yury.norov@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Tamir Duberstein <tamird@gmail.com>,
	David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Brad Figg <bfigg@nvidia.com>, David Hildenbrand <david@redhat.com>,
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
Message-ID: <Z6pfomw-3LuWoQQo@thinkpad>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad>
 <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 10, 2025 at 11:35:48AM -0800, John Hubbard wrote:
> On 2/9/25 11:54 PM, Geert Uytterhoeven wrote:
> > On Sat, 8 Feb 2025 at 18:53, Yury Norov <yury.norov@gmail.com> wrote:
> > > On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> > > > On 7/27/24 12:35 AM, Shuah Khan wrote:
> ...
> > > > The crux of the argument seems to be that the config help text is taken
> > > > to describe the author's intent with the fragment "at boot". I think
> > 
> > IMO, "at boot" is a misnomer, as most tests can be either builtin
> > or modular.
> 
> Right.
> 
> > 
> > > KUNIT is disabled in defconfig, at least on x86_64. It is also disabled
> > > on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to
> 
> OK so I just bought a shiny new test machine, and installed one of the
> big name distros on it, hoping they've moved ahead and bought into the kunit
> story...
> 
> $ grep KUNIT /boot/config-6.8.0-52-generic
> # CONFIG_KUNIT is not set
> 
> ...gagghh! No such luck. One more data point, in support of Yuri's complaint. :)
> 
> > 
> > I think distros should start setting CONFIG_KUNIT=m.
> 
> Yes they should! kunit really does have important advantages for many use
> cases, including bitmaps here, and "CONFIG_KUNIT is not set" is the main
> obstacle.

Hi John, Geert, Tamir,

Can you please explain in details which advantages KUNIT brings to
the test_bitmap.c, find_bit_benchmark.c and other low-level tests?

I'm not strongly against moving under KUNIT's hat, but I do:
 - respect commitment of my contributors, so I don't want to wipe git
   history for no serious reason;
 - respect time of my testers, so no extra dependencies;
 - respect time of reviewers.

Tamir,

If it comes to v2, can you please begin your series with an exhaustive
and clear answer to the following questions:
 - What do the tests miss now?
 - What do _you_ need from the tests? Describe your test scenario.
 - How exactly KUNIT helps you testing bitmaps and friends better?
 - Is there a way to meet your needs with a less invasive approach,
   particularly without run-time dependencies?

Thanks,
Yury

