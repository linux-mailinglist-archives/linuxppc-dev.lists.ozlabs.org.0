Return-Path: <linuxppc-dev+bounces-14530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 789DFC90408
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 22:53:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHVXp1DTjz2xPy;
	Fri, 28 Nov 2025 08:52:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764280378;
	cv=none; b=bPqTHl0CbmKabET7SrqwkRJJVe/mQnRck1QxAH66in7RvZ8rZteJuGXEG6ReFE3LvJqqAxhRX7Gr27a5qk8ULMtgrbNUkOTpDT412N/sWufOw5rOhkwBrOepj6JFbfhOGOhxRMpH26pZ2Cn2uxseKowkqDLmnd2/JwA7jHRPjBRh0tayz6sQnDw+edvZNlsOHJGAs+KO4Ma5GK0j1DAxCTI4AhJZGsSXbNSJFW+/KVQNdNhnEmfsuwkgaDBoh1qe47dXy30nLqfW6VSyHeE1vUslBrDeLBONEQSX6UA2usKXcUw+QktcsqE28zxeNjhLBkC9ign7WpVJ8PtdapYnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764280378; c=relaxed/relaxed;
	bh=jttLJ8TWGePu+ngSo1n4o5hp2pzXFGAv2t0XowsTZMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCAY6Y30lipS8fvhdBwFZU80+6VTD0Pdxm27EPy8XghGuMovGm4VkPmyr7qkONpYgTfwl55u9o5rB7PVCQJpgZSSVXe4W8/KLznFjn1BnVDDzD+hju6meBLK3KKKdVC3T8YhTv4hTnWLMjlfXvg6XQJpwfiAm7ORK1FGZ7cIwf5uVc9fTjDAd7lSQ0A4slEMjL8icVq1NDU33CAY45DEj3+4OU6anENMUzA4ma80E9thAxZoK6kyMhpg2Cjs9pbsSObJLE/ZCxlxSiHkctjB7hQ//c9nhv8p7GTZbyzkgMf4U7mGOnMo14DPLlL/xKUbYe+ZNmATXeQbY0h7bFYY6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LjMe04Cj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LjMe04Cj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHVXm3G60z2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 08:52:55 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8843ebf2facso15684606d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 13:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764280372; x=1764885172; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jttLJ8TWGePu+ngSo1n4o5hp2pzXFGAv2t0XowsTZMg=;
        b=LjMe04CjuRWQL0UEoj+jMRMJjKb585WvgT3HFymeP3c01FIeTS8yr8ORdDH5Sn++Nj
         YE2kn4Lj4yh2U5VBWdInYQ3E4/WUzfvHmOkQ0/Tpu6z/vcIv5O6YTXXd0Xej+ldupG8g
         +DQ/3Fhg9G9FckTis7rNyukRSJ9gQBuke5pxEvuX7I7/DNysteoZ3H8HB/BOcHXXIpKH
         eWGfCfcC3GxGeFlL93MDuxLlFFxWfwkMQi7/V0lv7zKAgOSbJL7MD7qSDIFAPLp7cc9W
         t1dSSX+A9bKBnlHd/oTfdZD0lXqg4epsQu7I4werYDAqLBQi35gYhm4PycRU0p62ZJzY
         VRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764280372; x=1764885172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jttLJ8TWGePu+ngSo1n4o5hp2pzXFGAv2t0XowsTZMg=;
        b=SHuCMcvdM9UMfIc8GKVXlMdh1ebb6IDRBE10bG+8WyYaAdK3I5dWQx4vjIS/+DNZUg
         16nZ8Ci/Zp2q6tuGrqXfGFug6WIUn7Y8Fcqt0x6mfhGAySPY5fScbGlpOwsVvfdaTSq3
         io9nxQZTVuqrC8cZroyTpZU6vh721iTnTL+4UETKj1I+R87L5GCDalR2By4YIbQDipQH
         vBbNPo1z+BSrEXuPp0SvEgdu1P+eue6tWDGJKbx0QJskmS13j3IS+ne3K9n2oH0KSky4
         4UkfQBxs1rmt7/vO/Z0ichPi31pV+MDYkYhB9Vx918t55F5DGhYcQiqdN/Yi29TDS47w
         HJtw==
X-Forwarded-Encrypted: i=1; AJvYcCWdP6lPK99blRj9CVgUrvrf4A8pOb82rbXsc2oVQ66etQcsZh2pSRvFRzJola3MYVBMvR8GWvjkyuzOB5I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxP3IRtOJdT8rPiL9MaBDgsKtwVSziX5uKGQ7QbE1NKCQR7yIwR
	dnNG9rM5vo9B5DAz5r76MO8/cPJEf+48Bto+UO9iF7LxF16LW4QPLfvzFGcs6UVkGarFC4yBdTm
	T7rvhzAK8ZwCqmw3qdXXYN9tm+CPCXdY=
X-Gm-Gg: ASbGnctLguGpWMEneTx8Q3IocWPuLSLx2oZclY949tz2qoLtjdyblRSaMJzu23Qj1py
	YvlK4cIne8cwpioGmT1eQCCwXYmsQ6VJ/0D8YQvpYFh+kQ9xJTzgEnAmE48FOeKvKA1MxagaXuJ
	Fzg6pcnUOJnBAaZ/96zT4F43a3+LlxgWcmOFcuTBem0WpCkmdSxTpu8RdJGh2TttOaTtXmAu4Vp
	mIjuYlpMVFtU4TR2ZejVTuq9/lZn6PbBenL6Eg2OUFoW1VhhuUFN16UzATJtMp/Sa3p+g==
X-Google-Smtp-Source: AGHT+IGi53ssJfVFEVeCKpbOH4PM/Uba/gyP2VL/mpIj2xLrn6No0jDJl3wOawm61ht0VMTz1HcUV32B95MPtil1ISg=
X-Received: by 2002:a05:6214:19c9:b0:880:49bd:e217 with SMTP id
 6a1803df08f44-8847c486a0bmr364162506d6.10.1764280372486; Thu, 27 Nov 2025
 13:52:52 -0800 (PST)
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
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org> <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 05:52:40 +0800
X-Gm-Features: AWmQ_blYpw-GPSWAvHSSwIXD1PKL1aIx4iCUo78DT2gXpdF1CZ018OhwLE5_XJY
Message-ID: <CAGsJ_4wvaieWtTrK+koM3SFu9rDExkVHX5eUwYiEotVqP-ndEQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 28, 2025 at 4:29=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > [dropping individuals, leaving only mailing lists.  please don't send
> > this kind of thing to so many people in future]

Apologies, I missed this one.

The output comes from ./scripts/get_maintainer.pl. If you think the group i=
s
too large, I guess we should at least include Suren, Lorenzo, David, and
a few others in the discussion?

[...]

>
> >
> > This use case also manages to get utterly hung-up trying to do reclaim
> > today with the mmap_lock held.  SO it manifests somewhat similarly to
> > your problem (everybody ends up blocked on mmap_lock) but it has a
> > rather different root cause.

If I understand the use case correctly, I believe retrying with the per-VMA
lock would also be very helpful. Previously, we always retried using
mmap_lock, which can be difficult to acquire under heavy contention, leadin=
g
to long latency while the pages might be reclaimed. With the per-VMA lock, =
it
is much easier to hold and proceed with the work.

Thanks
Barry

