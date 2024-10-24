Return-Path: <linuxppc-dev+bounces-2556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1359AF5A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 01:00:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZLwk6cjtz2xjv;
	Fri, 25 Oct 2024 10:00:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729810822;
	cv=none; b=QO8bKwBlh5ReTn1x8NPxG7pBwNl7KBEbIrdF1Ocx/NKsZnl/jZyHHYB69EfB/lXQ26gueH1uRRKcbY46Vw3wwrUausTmVYrR6p9IXysNOmnFaZ4L4bUfSEaTUS7eguc4NaLZ5/7b60j6TfzoosAVr0lVh3+rOeIAEhJSc5krBvuB1vQ/6E5Y+iFm8XL1twPQ6lttnDcAhRN8Kbst9g8xcqSFmwn2F3KQU7HcvEgPBA5TYyPcyTPPVL/KvjsOQh/02MqhGHvhHNefs7WNB9GRjfuZ5avSlczHMNTSMjMpokGBevrLnHXpInvDRWdHClWt3mpGqmP3+cTr/WiJ/TOlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729810822; c=relaxed/relaxed;
	bh=1N/YHxtexapkwEa/KzhGq9uJiSxlgwwlfK/Xn4dDvz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ukp+k0atgp4DdcKFNxkgfWxhGNc9WUpy+kZxEL+7ezTaX5dYN8BRp+xfYSUOvrz4dwUjy2llQ+ezFasRasb90lIID7CKRjz/9FUy7iFUxBQaP5QUSKKc4Gn51SyUR/pZqyjrXT4lNRhsQrJsq9X28u6YgZMbqPzUDWNH6ornEUEVEazS0k0WK7k+WpcULy0akCHr2qzRnsS/ilyh475pauGdMdZlYuYMuxgZZ0Pck3sFzJsFYaZ7xRgUhhs0bxqntI8SLusQXZiDQG/2XLaRmuuHuqh6ufGJtaOVlxDSJjcbSvRPjZDkgomhWyFDG3xngGSuTmJQg4V+gTuegQRMyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4X5S3Uff; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4X5S3Uff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZLwj2hhxz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 10:00:20 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20ca4877690so34965ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 16:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729810815; x=1730415615; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1N/YHxtexapkwEa/KzhGq9uJiSxlgwwlfK/Xn4dDvz8=;
        b=4X5S3UffH7eFBrLVDqsL+4XTfR6IfbfvRETA15udi8t7l09lrI7v3SVE0VucPy6MkP
         e+otvmr2wWp0WGzx/EVvJSnnE0ZArYV6aDN5iVHfaWyYIOglADd4+LbBLIrrTgnHeINn
         ahbGMkeC1Gc4rUVKCJTGkke18ZehI6AC7xu7dVwGeg4ykoAdxPN4Mn7WJglpx2Tybbi1
         NZTgi1Y/0mDPmXQwuXlOYBQeHlViMa4ipwc9hAn7IRSum73LhfQBIacFCTPq8ZuDbESr
         CnlG06iftQ8sU2KKLO66WKR6euW8wnyMpGkg0U5jaPv+yaxg06JrFvjSH0cWmLQiax7K
         MEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729810815; x=1730415615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1N/YHxtexapkwEa/KzhGq9uJiSxlgwwlfK/Xn4dDvz8=;
        b=ejJsWqkDS9zTC3H/UithLkjCNZZLpCsfDy5MSVSlQG/t3ednuFqfkw5nIUrlBPAByr
         9Pimvfo1d/2youdkHyz48DiOXMD8AWBfUjwcQYXfHqlwU3jevuNNM+CvfTwzstWLuAWI
         HV5k+uuANrta3PMaZ6cH3BKxn4J1SEJK2VN0q5xbGdmrR8RJaGX3VqgCW9D+TDvlr/QR
         r7FGAUaWcnbtYnTJRgE9NGE2A4iE0y5bNZlcaotgylB06F5euQFnL0gBwzjDYmHZmpuG
         0R7oCAroFWLjxMLaFWRxyjo81UicG/SG7Cl35Gh6D2PUya260/00U+ItTiEgV8VKYDX+
         TyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJiGdiy4hdngdPHgZ0CpPRqwmQIyef1rQHs1MFDoKrw2O2v/oOz4w4kCwWtycwW+N5Y47YhtSE1RZirvA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyM50l/f0oa9XC0fKqsllsWuvLopXXQ9wmqtjdXVJUlfUhj8Qlf
	piwhpx9n9xve+BV7kOFCVrGOTMtgPQMi78QuaREf64kuPhtZ7atNOpwnFTszKA==
X-Google-Smtp-Source: AGHT+IF/Dyf8ydqbgus1FTEPKZm1RYCxf83AYTE17X2EEDE3xOS0BfMauJXXQXefEKpmi0ZHk/dmfQ==
X-Received: by 2002:a17:902:d4cb:b0:20c:6c50:dc80 with SMTP id d9443c01a7336-2105b1ccb2amr461955ad.9.1729810815119;
        Thu, 24 Oct 2024 16:00:15 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3555c1dsm29218a91.4.2024.10.24.16.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 16:00:12 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:00:08 +0000
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
Subject: Re: [PATCH v7 1/3] modules: Support extended MODVERSIONS info
Message-ID: <20241024230008.GA1382412@google.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-1-339787b43373@google.com>
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
In-Reply-To: <20241023-extended-modversions-v7-1-339787b43373@google.com>
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 23, 2024 at 02:31:28AM +0000, Matthew Maurer wrote:
> Adds a new format for MODVERSIONS which stores each field in a separate
> ELF section. This initially adds support for variable length names, but
> could later be used to add additional fields to MODVERSIONS in a
> backwards compatible way if needed. Any new fields will be ignored by
> old user tooling, unlike the current format where user tooling cannot
> tolerate adjustments to the format (for example making the name field
> longer).
> 
> Since PPC munges its version records to strip leading dots, we reproduce
> the munging for the new format. Other architectures do not appear to
> have architecture-specific usage of this information.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

