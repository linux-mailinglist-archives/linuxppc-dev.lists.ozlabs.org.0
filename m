Return-Path: <linuxppc-dev+bounces-7269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE2A6BF61
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 17:13:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK6tw1l9Jz30Qk;
	Sat, 22 Mar 2025 03:13:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::830"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742573606;
	cv=none; b=VdY6kb4oeOIfZNwu2bVeEE1krgcx+/VIVQ62EciIMxdMWxp6UqZaIVF7k9gNJflwXRGRRSYPiV05CszMBbscIf/bbxzgo58zWEtuT4grEIqYMLKcPlYx6sthGUGGPKTVAf0rZki6aa/dk21s7gXS2mtOA0WtnvrqvmN16ElSqMzxUQUtHtqY+cg0ZzfL8GVUBWwU2sHrVoSf7ZQ1feBSztT2b/H0HKlXNghLvljW5kU5B+TcnlyQfJXbKhfyZblQjF0j9JUPiahqyC2wsXG7C706f0SS9pbXzMdOW4XOCKigtdzEo/AThtnoFHHrBWBVIPVOphNGJWAVHZ2dQ2RmgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742573606; c=relaxed/relaxed;
	bh=4DB6Et2/ns18QKw/fxCT3wrpCitAogjqJ6rF7Sc/IdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+s5uoQh/nZ1Zryh24DOJ41xfpx1mHpO6T408bYfWlZt+CuwuixGbNv2DoxBSIl0zREvVmhagducPK5GEUheALwtHHtMsAqpzstEBrPgyCEVMs2FNeVCUs/HftT17AfHm/6/5yUVakvThEuSHdYUQI0aFcAskNTT3K0Dzqw2+vBn1o1ezpunhP5RfQke034IawiOCIv+7/feS6Ybd2LEUxRodRjBPN7iu0Z4FTw4KkJUJAydAw7rHSXrJnU7at8FWZVfVJV2rDT/EGjRlGttYU5KbF12SqXKt+ztTjY3vsAYn0oyHOi6lbVxd82daYOwhHG6UyCYfifABZEZks3Z4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Tjmw9sT4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Tjmw9sT4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK6ts16F2z3041
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 03:13:24 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-476693c2cc2so361711cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 09:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742573601; x=1743178401; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DB6Et2/ns18QKw/fxCT3wrpCitAogjqJ6rF7Sc/IdI=;
        b=Tjmw9sT469i2o5dh1tRvGj0WgxYjAynqGI+bErTwQnVf7uAzUw5M4GSe81PA5c8TAI
         OGeVTNgUQIW7y3ikSjpefeBcfIXSraQqxEPpn3rP4qZzqyQ85J6FF82k7J8fSUOuGja5
         WGC1aAZSfvWzkGX9b2exH+EKxWGsRQ8/MKhTNoqSba6GXf+zRHdSor0/Y/eNuWjXRPPk
         Z7g9FLUPOl3H4X4cJElNaF3iCx3Sx8ubVr2Hz1aRBuPbHLEagmqYFp6GfjJKhVz+efns
         4tjbcH5PsNF9XFMiS2HCQ5JpCX6UgbsVuCvPQ0TL4TNUvpMhem6IUDn8/zxNI3J1Y7iL
         OCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573601; x=1743178401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DB6Et2/ns18QKw/fxCT3wrpCitAogjqJ6rF7Sc/IdI=;
        b=snd3upgEi4AHs4VPYjCdB/CBUP2eZqp/H2gSbWYA5iameScryx8Bl2KkW/0aOpYALW
         9iy5oWsQ34/HEAjBO51V6Nujex1RdZn0+ahAf95pf4HW9P5PZgMu9g1TWIL71zhLTYWe
         /aMUmj0oT/LH5lgUDImwUazZ+/yIP5NaEk9xmlvWpZyeHUF81HpMllRgVjUjPcjDMOs1
         J1T4ec1GAEaVAio9syABP9eZ1QI6Bz/daLCGuV63qaD0CLHj6dLznnCFoao40oiL2If7
         iZhPPLyTPEJrjlfrbzTVUe/xq42bzKbpISbKTK3WwLWuMn7d7hWzgG3G8SvZ6S5SzBzE
         fVrA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Qn1QumNUJ+d0zXv+V3pIDCv8qHrs1MEdTAwFsd81KPjHm9tm7uERwA/NKc7QjYe/FqdxKGt/k/m/1qY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwpeqKGUI/7fam0nbDgdsIsr8cHsvLSQbssFN5w8MO6s6JGdvko
	C1PdJEPGxNLztZ33OQDIGX4g4dE2jQoUeJW9AZLW3/u0FNsp3HjYcIUPoDze4SZEmBR/VDXWMXp
	mebjidTnXmrqksSRrwFJYjEVwFMk8xr+gHxCF
X-Gm-Gg: ASbGnctdw1P7N1x6hYIbaBHaZY7nlmIGIJlbj8JJd5zA55+DNUWNXxkVLdKfWuPXz5C
	HwSQ+T2m+ZTmmgUxAf7WsR3kjh9NZkIFfwtGLamkn6hf8ICV4j2aA9Z3Xb/DAq5IK980/vQvnZr
	FefTUdS/mky1CZys5te3v79qN9/g==
X-Google-Smtp-Source: AGHT+IFSgyka4WC1voAzOEbVYGRfiKD2rPwZmgBJm5bmCEG2w77v71gm7DM31qNjr/YtvVbNnr/XQWUzc/NWKh6R9Qk=
X-Received: by 2002:a05:622a:4acf:b0:476:d668:fd1c with SMTP id
 d75a77b69052e-4771e0a7e7dmr5053721cf.2.1742573600117; Fri, 21 Mar 2025
 09:13:20 -0700 (PDT)
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
References: <20250320173931.1583800-1-surenb@google.com> <20250320173931.1583800-3-surenb@google.com>
 <Z9z1w2vHfJrwSgWW@infradead.org>
In-Reply-To: <Z9z1w2vHfJrwSgWW@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 21 Mar 2025 09:13:09 -0700
X-Gm-Features: AQ5f1Jr9bSIHVG9XyNi5uOulPdcHUxw5kGAy9us8_XrILBTKaK6kzxC5mMI3vcM
Message-ID: <CAJuCfpF=fk3=s3NLkai0GN5twjgY8AyyL1vZn3T+N7E10SgHug@mail.gmail.com>
Subject: Re: [RFC 2/3] mm: introduce GCMA
To: Christoph Hellwig <hch@infradead.org>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com, 
	vbabka@suse.cz, lorenzo.stoakes@oracle.com, liam.howlett@oracle.com, 
	alexandru.elisei@arm.com, peterx@redhat.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, m.szyprowski@samsung.com, iamjoonsoo.kim@lge.com, 
	mina86@mina86.com, axboe@kernel.dk, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, jack@suse.cz, hbathini@linux.ibm.com, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, aneesh.kumar@kernel.org, 
	bhelgaas@google.com, sj@kernel.org, fvdl@google.com, ziy@nvidia.com, 
	yuzhao@google.com, minchan@kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-16.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 20, 2025 at 10:14=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Thu, Mar 20, 2025 at 10:39:30AM -0700, Suren Baghdasaryan wrote:
> > From: Minchan Kim <minchan@google.com>
> >
> > This patch introduces GCMA (Guaranteed Contiguous Memory Allocator)
> > cleacache backend which reserves some amount of memory at the boot
> > and then donates it to store clean file-backed pages in the cleancache.
> > GCMA aims to guarantee contiguous memory allocation success as well as
> > low and deterministic allocation latency.
> >
> > Notes:
> > Originally, the idea was posted by SeongJae Park and Minchan Kim [1].
> > Later Minchan reworked it to be used in Android as a reference for
> > Android vendors to use [2].
>
> That is not a very good summay.  It needs to explain how you ensure
> that the pages do stay clean forever.

Sure, I'm happy to improve the description. Do you want more details
about how only clean pages end up in the cleancache and how they get
invalidated once the original page gets modified? Or is the concern
that donated pages might be changed by the donor without taking them
away from the cleancache?

>

