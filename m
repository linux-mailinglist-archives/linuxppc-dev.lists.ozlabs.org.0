Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E54CB7AE17D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 00:04:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cDmQQj0t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvcMz60k7z3cf6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 08:03:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cDmQQj0t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvcM41bKFz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 08:03:11 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-690d2441b95so5541223b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 15:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695679387; x=1696284187; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+A8WAdX2TlibF4VoiqZkmPW/o1SjeOHi+BAIOL0k6Sc=;
        b=cDmQQj0txnUNvOkgyqlkRHd57oVJyLQ/5R8e2Bn6iDpP042FbNgNGN/rOfziqBzAjI
         ZB/L4zW/HsB52uRsCOmrPDNcpGFU3FBd7eQOVTgidABcBPnqxJ87JZHHOJMLp+9gEOg7
         uFPtCzYnmdYzzg7Ygz3iKs1Xq9Ia03DRV9PGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695679387; x=1696284187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+A8WAdX2TlibF4VoiqZkmPW/o1SjeOHi+BAIOL0k6Sc=;
        b=COwq6xugVyYbnIMR63vW090Li18MBiJMbt/32uWUga21ep4XtY0432gkggGzmoQHCd
         UJsEZ1gbo25+F3yhcO8E2BzGDsBfs+wQ3Hzky5Q5Ea1Xs4Aalxh+2Hor7I733i3iG8GR
         oAlRHb577Uh6eRJ2ktPxTaDYV0M6PCC5uIC3fYLcPvvWqTr28GYlObgMpcFO6B8rXf+R
         UtsdNj57lH2NjbK1h1XISA/NeRyDqNAexCY+BokcyXcNisMjtILF1X1hrsqcqsfOtq7N
         589pQJvKEuydiFwUm6FmIGSI/zQWApbgH1lMJVpvYaRagOy7kUx9XQLED+4QEcxJTdr5
         tKTw==
X-Gm-Message-State: AOJu0Yzd2JayrdzSZ8FHGJfnQgvd3FOhW89CuNfu9gYTIIpY0ZsbDPwq
	5CvPltDRdF3+jmqdil90ez/PtA==
X-Google-Smtp-Source: AGHT+IFWttOmffpB3sN8klMUfhl3I1wt+Bzxiacup9boXKpmgZ0VoST65WtA6BW8OiHory9IHxb5Xw==
X-Received: by 2002:a05:6a21:18f:b0:134:73f6:5832 with SMTP id le15-20020a056a21018f00b0013473f65832mr1361641pzb.16.1695679387311;
        Mon, 25 Sep 2023 15:03:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a16-20020aa78650000000b006862b2a6b0dsm8882839pfo.15.2023.09.25.15.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 15:03:06 -0700 (PDT)
Date: Mon, 25 Sep 2023 15:03:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Fix emit_tests to work with
 run_kselftest.sh
Message-ID: <202309251503.B710D958B7@keescook>
References: <20230921072623.828772-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921072623.828772-1-mpe@ellerman.id.au>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 05:26:10PM +1000, Michael Ellerman wrote:
> In order to use run_kselftest.sh the list of tests must be emitted to
> populate kselftest-list.txt.
> 
> The powerpc Makefile is written to use EMIT_TESTS. But support for
> EMIT_TESTS was dropped in commit d4e59a536f50 ("selftests: Use runner.sh
> for emit targets"). Although prior to that commit a548de0fe8e1
> ("selftests: lib.mk: add test execute bit check to EMIT_TESTS") had
> already broken run_kselftest.sh for powerpc due to the executable check
> using the wrong path.
> 
> It can be fixed by replacing the EMIT_TESTS definitions with actual
> emit_tests rules in the powerpc Makefiles. This makes run_kselftest.sh
> able to run powerpc tests:
> 
>   $ cd linux
>   $ export ARCH=powerpc
>   $ export CROSS_COMPILE=powerpc64le-linux-gnu-
>   $ make headers
>   $ make -j -C tools/testing/selftests install
>   $ grep -c "^powerpc" tools/testing/selftests/kselftest_install/kselftest-list.txt
>   182
> 
> Fixes: d4e59a536f50 ("selftests: Use runner.sh for emit targets")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
