Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4372872690
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 19:31:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M02YG5HD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq4073Rpsz3vkL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 05:31:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M02YG5HD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq3zP4jYCz3vXM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 05:30:55 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5e152c757a5so4225345a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Mar 2024 10:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709663453; x=1710268253; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BbRXv9fOpJT3+Uo6ehSYyOlnxYRIbTCPo+Tg5qTYzY=;
        b=M02YG5HDJpfsfsIrnrawcfkuFgNhcnPJ9NR2oTE6+C5tCV8XoCTvj2Cjnr34i/ajLi
         ilgB2FyHRO+N+BktHxUX7jTz9tSTblwJt8WJDoesPy/v/0VhH2C69wCE9S9tMoZCIKyd
         4CJBqLklUBnVdkerp2RhQNxm7s/ytrEIDoovc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709663453; x=1710268253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BbRXv9fOpJT3+Uo6ehSYyOlnxYRIbTCPo+Tg5qTYzY=;
        b=XyGxBjMuD+GmAPNeOCMya8EQusoR4I+d6AR+BkaYalEynLKy09gR/a/xzx08YW9ZAA
         zVN7vm/TxbGqNaFqcOvf/nBAN3I5XNdRoh82I8YV2/U7rDEcb05Lby9S9hwIDYyWyJ0S
         ho7ASoXjU7/jZtE59XFEu0JPsOjlZ/8YCYDFh80otShowY2Vyvbmz22g0DunTGD0fsi+
         c4V77Ze6uG5YXs9BU1L3bF0yx7hXsV351uf7CxhAQyCnf6Xew2KLGXvgK0aycg+pQ9XN
         5829ICwD2DL3R2+rWHgRF5plJCsxBsAr2lnXzjPbYoJRLuE+jtxU5+VzfajK1ITas7Zr
         c/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4L5Y9jDKYze8H1iZz6cAPK1XiK9IKNWBVMoFgfVRHSJWsfhzfJxqB8yu6i/XBndgOKtxJ9m8ioJ10i10ev0s9bW63wObtBOIWROQHfA==
X-Gm-Message-State: AOJu0YwR6NsKdBv98Xd7+Xg/RVlSy6baeNTdIpcEdrVnSDhoAyph2E9D
	mwySgKeMPsfLA+DSwf/Sal80EFpVl9qT+Wj0+Mbs5Nq2R60jKZX4UmbFMJcEhQ==
X-Google-Smtp-Source: AGHT+IHNuTSf8TvgcewoDpdmqD+AxXkDbE9lASH+dBA+qNMstP1GGJ+ib90FII9UGPPbwOnuc/Ua6w==
X-Received: by 2002:a05:6a21:6da4:b0:1a1:4d8b:6f2c with SMTP id wl36-20020a056a216da400b001a14d8b6f2cmr2636204pzb.2.1709663452870;
        Tue, 05 Mar 2024 10:30:52 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l20-20020a63da54000000b005cd8044c6fesm9498680pgj.23.2024.03.05.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 10:30:52 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Fix load_unaligned_zeropad build failure
Date: Tue,  5 Mar 2024 10:30:48 -0800
Message-Id: <170966344685.711906.6879783407944074958.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305125644.3315910-1-mpe@ellerman.id.au>
References: <20240305125644.3315910-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Tanzir Hasan <tanzhasanwork@gmail.com>, andy.shevchenko@gmail.com, linuxppc-dev@lists.ozlabs.org, Kees Cook <keescook@chromium.org>, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 05 Mar 2024 23:56:44 +1100, Michael Ellerman wrote:
> This test is userspace code, but uses some kernel headers via symlinks,
> and mocks other headers, in order to test load_unaligned_zeropad().
> 
> Currently the test fails to build with:
> 
>   In file included from load_unaligned_zeropad.c:26:
>   word-at-a-time.h:7:10: fatal error: linux/bitops.h: No such file or directory
>       7 | #include <linux/bitops.h>
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] selftests/powerpc: Fix load_unaligned_zeropad build failure
      https://git.kernel.org/kees/c/3fe1eb4dd2e4

Take care,

-- 
Kees Cook

