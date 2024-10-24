Return-Path: <linuxppc-dev+bounces-2557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2FB9AF5A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 01:02:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZLyd2Gn9z2xmk;
	Fri, 25 Oct 2024 10:02:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729810921;
	cv=none; b=PT3D4dmctxUctwUdLEmGIGx/X7fcD/MuPMRvFaRJMZd0R8r4llR5BGk7/CLiPijJJFxZocIXP3cOV44ISU16rERU/CJLJLGSQk5pprBp1XsMOeH8OISDZQLfE3BGrv2/bVzq3yQwIFCuJUPQIzRQZZ4aemqt40qX9WlYpxl04a/qnNpH0TXBy3U/F5/E5Zx/CeG+cYo8LbXeW+oNTrlfeMHnPfXSU6QXEiNwvpcYm7BI3iVOGSQPHr4AVZrUVUZ+I8XyD1GvUrfdnae9MtD+LknBBMNg8f4VWkMXlxf03p0xrRiPkDyuSrpBX8EvGWN75RHzgEaVfiFcjRVwx1gHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729810921; c=relaxed/relaxed;
	bh=YWPqFC2idLXwWLVGXP8sgBtLusvgfrCXLHA1CgLV1iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odsVJw44wwu9s1toB801GTM+V7vVBgvO10RtdwEP2vQO/hNqJ0V0Z96a2F9mOLSXkEcFfmVnGw1peLhYg83JERofeGZEH0rPfcDbD6JNbTkA/4tVpSxAzvIlUgohLgZkomJezoxcBZJSYusOi1ZCKIf8/JGQrmRuk41lcK1NLRYlVoLxuy6LLmlQ4cYDUeUK5jeUS9DPz19NhKTLlZUsDI8k6jduCI50Mg1miD/An3E7LKbiPQVF/3cq8pu2MWdlbNnxdY1Khkwotc2icOO7F4cpOqtWE7v4RPbUNLnujLuHRdxaKW580y7aXCHPnAmCdNjBE8UBHhoDvNHO2t69Dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=njdbIb51; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=njdbIb51;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZLyc2jRbz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 10:02:00 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20ca03687fdso41335ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 16:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729810918; x=1730415718; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YWPqFC2idLXwWLVGXP8sgBtLusvgfrCXLHA1CgLV1iw=;
        b=njdbIb51kOMToQxMaWZmegqpXEoRWfCtKKEJKs/PAqwRnm9IyDx68eeo76/ZW1MbQf
         Gx6pQFjeW/DYyui8SeFgZlWTXg83fm3AKFgnwVCvqEzSVpioH8CPoLkHWugyZzZ1sHv2
         RXoHJpDigbj0RqyT2+LrMBgaBq0tXYzCItuVlnXdqYqUt0KuLghQ5cx92PnDml7eOYRq
         CSQjWsxRYdLL7OSGOa0N3ayQEUWYNeFbi6/abPxFh1+4yg1M2A9rlhh6Pg5C8f6OcTXt
         Yaa5MSAvpjzPFPb0V1rsExUsholqG4BM4njI+inn//9kIHsTMkEYkIYfp9tz0+X0wnfh
         yIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729810918; x=1730415718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWPqFC2idLXwWLVGXP8sgBtLusvgfrCXLHA1CgLV1iw=;
        b=fi2OQ480OIoZb2T4N/QhiEww9uoTtgMrYtLnx/CwDV17njQQJl+bHmrK3iUMGkXM+f
         157s9j2v92poYfWeWNs+qSILdKURN7Qq2tAdxEGLgYj01nQd7EL/Q+SDm7LlUsNpcB4V
         8rVg5dyTUb9pcQ8QPXgO8amZNiP4BsLIT4erTBnnZCRXXqmIQ2Yy4poMkAQpMEimp+7p
         xSsgzPa7NtnOUfUahzokVQf06mfzBN32dKE95b3cgRQ0P0tohAISwXZxzp6evLWn2l2x
         MUmB6m5aorYZQa2PHgZwkwYjBCGV/qnpkaM2NUQ2iGrjLBtqxy+6nO+VN9yPgLkJpwSr
         WEfg==
X-Forwarded-Encrypted: i=1; AJvYcCU0gllOf2o3zIXhlLAjzii7WD9uY9ajghc8p6tZSz+RjkJ5MnP/NpAKpwGvJCLlAOkafkekkwc8V3lg2s0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBExllh8szoJnjBVx+HcZG0V43846kB0o+G/5w3p+oAk3j+N23
	y37bKW88wC9mkhVV6YONVk4o71lNEuiYNffCd8IwbC/b5/kZKqAWxTm5vkL5Jg==
X-Google-Smtp-Source: AGHT+IECEzj2j2R3HEQNqRkKqGUxd9Vcb7D0j4G32E56QFP5qsmcyNWJW/GLTUqkmxlzQwTttNdiEQ==
X-Received: by 2002:a17:902:cec8:b0:20c:a8cf:fa27 with SMTP id d9443c01a7336-20fc2219a8dmr1193475ad.18.1729810917420;
        Thu, 24 Oct 2024 16:01:57 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3572efbsm26644a91.22.2024.10.24.16.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 16:01:56 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:01:52 +0000
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
Subject: Re: [PATCH v7 2/3] modpost: Produce extended MODVERSIONS information
Message-ID: <20241024230152.GB1382412@google.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-2-339787b43373@google.com>
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
In-Reply-To: <20241023-extended-modversions-v7-2-339787b43373@google.com>
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 23, 2024 at 02:31:29AM +0000, Matthew Maurer wrote:
> Generate both the existing modversions format and the new extended one
> when running modpost. Presence of this metadata in the final .ko is
> guarded by CONFIG_EXTENDED_MODVERSIONS.
> 
> We no longer generate an error on long symbols in modpost if
> CONFIG_EXTENDED_MODVERSIONS is set, as they can now be appropriately
> encoded in the extended section. These symbols will be skipped in the
> previous encoding. An error will still be generated if
> CONFIG_EXTENDED_MODVERSIONS is not set.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Thanks for fixing this, LGTM.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

