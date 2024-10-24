Return-Path: <linuxppc-dev+bounces-2559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE29AF5B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 01:08:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZM5c4pCcz2yMk;
	Fri, 25 Oct 2024 10:08:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729811284;
	cv=none; b=buAIB7VsRrRIh33azZ4nB3OeiSDDr+RgrY5a/AyXJfY8yEDvx1Ye5kKlXlUXQbePjHwshvXFgcIRSy0SdZBPJiLAgsfCpfkzLbu50T2NfBvYrnyrZN1jLJHzFuvZDMSQ2r+aQMUw1P7XImhRkn6tSmwCjXAvl9WIo4UKCndevx3XXg0wwCF8BVigxhqkCD6hSFyi4xZeABJ+c2t0LH7orPZplNddTIqwfPW2WNt6L+WGcGdo9bVktG1THDmybsBur8f5jGAlk5GglU4qALsZc2i4JQEtTPIXpJF4LUPeziQ8nZQYKQiFV5izMe9KwQiJW/AwqO7OzJGD8QPIRvnHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729811284; c=relaxed/relaxed;
	bh=LwjW5mBSAuFOFhEIlf3utQozI9vTmaDM4dHrZQJtjd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfVpF/LW8Nmy8ir3p2Q7HdndYj9KX6pccbMIDV0X3V0cZHdrSMwmhQ+MEtmtg4VYTVUUldXIS6rZ7KZG0FiPPurneh0alMXGRt8KOBwgyDIb3guk9Tw7LGrivmTphkS6XPsHIEMHoPMbSUdCQcpYJmyqg22HT/x255X9rMy4gahNPj6dWvukRqeRvmRgJ4Wo7b9u44x9Z0kQp1N7kWYLGqcOUea/29/DcLEMfqQksFX9k0gYeEGUcE8NUgTleNB6GtC3WZaD33z6MQ2AQYMQZPeOhsSMqWzVpeLNqnXJ3Yx7ve++V8bAU488Sp6sjFYdUGIAzgn19wK7BI1M3SNG0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vf0V72bo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vf0V72bo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZM5b5J09z2yMX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 10:08:03 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20ca4877690so35965ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 16:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729811282; x=1730416082; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LwjW5mBSAuFOFhEIlf3utQozI9vTmaDM4dHrZQJtjd0=;
        b=vf0V72bo0CPIHXw5DXsDm0mGhq+w5PxdNUTj5uzt3hLVlX9yUGxCiasdibdnUoI1nZ
         WRo1rXihR0psRQXQAiHgzwaw7VtrB9m7LkCTmrTY9BHicGi3Cbf+iTLB+RPyGDpv7qBk
         rl1bX5QkzzMBbVkshKrs/211HmByTJiBsKhCPAbo5RdhowihBxcWY780Jz2gNygb//km
         tuy8a62c8VC0mPifBbeWwO6kW4T/5R+BbDiv09DBdgiVjmZocvfp9YAA9NrqlEo4rIEe
         +VnwUAwcibp+le3x5/0AwMrSDXHLbbF3cgt9doEDIctaRzKH1Ai2M9CFNIEjsbAMunoH
         effQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729811282; x=1730416082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwjW5mBSAuFOFhEIlf3utQozI9vTmaDM4dHrZQJtjd0=;
        b=dMhJEmx5GWrisw7ErRrjcCLjdK8wgJjNMMGGsTRWQancGDR7gQMa5YH7tJ5xy14Fye
         X1dw74F3VGPARrIKTlf+Ix6SHyfC5B8V3Xcx4LolOX3kj5ONhkAbd4rxDKlLv/kRLlOl
         O3x60mGR0qlxO+JOJBnlOG4sFgW6yEtRM7y6XhIYWrDcM/nE2uvp/rGIh1SAG6oemrYB
         9C8qIzJhDCNGeDGXKmKYlc4lPBFqE1msMFvWUqMfMhhHschrzifX1wMRIpdWer1JDpv2
         69G2ZaRHhatCseClbSawrJfr9Fk5HaZUiTg3tj1zmIW9qMNu4DNLp74JgAMDiM0CPhkJ
         5u3w==
X-Forwarded-Encrypted: i=1; AJvYcCWA5b+w/Z6CJvLZejYsDiFLkXbRmkvseK39/hsyx+xQ5OclzEauJ0ZHZtZoRqqmvlqKtpDUTk2oif7DGcs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzmr0Y7jTtwjYP0kokqUYnZBC3+SfFgM6soaFzmaPodvsiQJiqk
	iY8eFWpNoMl6vv7km3za2Cxh6MGxxwwwWh7jhX7jqw8zuwpv+iM6nbYyEClxSg==
X-Google-Smtp-Source: AGHT+IGPM0ZptJIpwnMZ9CfEcrh9lVIEAKuBohD9dLT7W11XHiulVCeuXJZu5S3Q/78EfDc25LTScg==
X-Received: by 2002:a17:902:daca:b0:20c:a659:deba with SMTP id d9443c01a7336-20fc212d688mr1257735ad.4.1729811281798;
        Thu, 24 Oct 2024 16:08:01 -0700 (PDT)
Received: from google.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e48ad66sm2087361a91.4.2024.10.24.16.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 16:08:01 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:07:57 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 0/3] Extended MODVERSIONS Support
Message-ID: <20241024230757.GD1382412@google.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
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
In-Reply-To: <20241023-extended-modversions-v7-0-339787b43373@google.com>
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 23, 2024 at 02:31:27AM +0000, Matthew Maurer wrote:
> This patch series is intended for use alongside the Implement DWARF
> modversions series [1] to enable RUST and MODVERSIONS at the same
> time.
> 
> Elsewhere, we've seen a desire for long symbol name support for LTO
> symbol names [2], and the previous series came up [3] as a possible
> solution rather than hashing, which some have objected [4] to.
> 
> This series adds a MODVERSIONS format which uses a section per column.
> This avoids userspace tools breaking if we need to make a similar change
> to the format in the future - we would do so by adding a new section,
> rather than editing the struct definition. In the new format, the name
> section is formatted as a concatenated sequence of NUL-terminated
> strings, which allows for arbitrary length names.
> 
> Emitting the extended format is guarded by CONFIG_EXTENDED_MODVERSIONS,
> but the kernel always knows how to validate both the original and
> extended formats.
> 
> Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
> selected, and will implicitly select EXTENDED_MODVERSIONS.
> 
> This series depends upon the module verification refactor patches [5]
> that were split off of v5, and DWARF-based versions [1].
> 
> linuxppc-dev is requested to look at the ppc-specific munging,
> as Luis would like some eyes on there [6].
> 
> [1] https://lore.kernel.org/lkml/20241008183823.36676-21-samitolvanen@google.com/
> [2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
> [3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
> [4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/
> [5] https://lore.kernel.org/linux-modules/20241015231651.3851138-1-mmaurer@google.com/T/#t
> [6] https://lore.kernel.org/lkml/ZxahDv5ZKdM__0sZ@bombadil.infradead.org/
> 
> Changes in v7:
> - Fix modpost to detect EXTENDED_MODVERSIONS based on a flag
> - Drop patches to fix export_report.pl

Unless Luis prefers to deal with this separately, perhaps you can
just include a patch to delete export_report.pl in this series?

Sami

