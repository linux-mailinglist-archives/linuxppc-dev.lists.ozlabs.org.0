Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B68A934616F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 15:27:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Yc05KNXz3bcb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 01:27:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kuI5z7BT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33;
 helo=mail-yb1-xb33.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kuI5z7BT; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Ybc1F2Gz30B1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 01:27:06 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id o66so10527634ybg.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a1UKA4D9x9QmZ1+15HTh/Ges6E1m3MBK/glmFQ+WIEA=;
 b=kuI5z7BTwTCzb12byWHvnez5Mri863aUQ3Lj3wB4GHCyfdrM6k/PvMxgsDLB4Q56Du
 Oxsn7JJ1zTtYNbr+YMmHvo6+bSmAhFKqpRsRl/nUyYPyQYUnvqE2CkV6pZCpEPho8r7H
 iqwsDC953u7rl0alzpfcXzROoV7ZCUkD+yPfl1BRJp5RXXPidKuNgSjSa1EDTy5rb5C9
 udHkwgLnN9LTrHQcLroeHvLDQIAIelJWHyRQ4Ot9kLYJofbjoaEPhk4WmZAjuJhBcjxv
 NMRUwLmWeC6RbgjskE7+IApMwa1xCSPkjAzLo89sQxdH6lmwytLDKK29WysJnQOKW+Me
 b7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a1UKA4D9x9QmZ1+15HTh/Ges6E1m3MBK/glmFQ+WIEA=;
 b=PW3IfpnYTBFUhfPpOQ285nI9Z6KxQGWf5O6M7GQQo3Wqu6aCSJjrjvUm0D9l6+eHft
 DzLBHqNoHzE72IOfdPDAH6AXmiKXm9A9UoylDVniB7qNSgaRElaMv97skJ28SOD9oFN5
 CdZDDrmqYO0vQkfpFCVcZp59wNQRJoBUL74X5Zc7fJREbkX6CmR52VZYQkrwuFKSRxmj
 7sqfRqLJ1mP1OWAqGZ9RPEtrXNSN9WJBg/OdHdJ0+0F8UOPfuRnQlryolcg2C+t05VQw
 6JcJPR8NskyLkGjqHMJKMtVSaC/BPXl0ciDUhDZzq/UOisfn9hSzCem3RZ45m4PFzNou
 7e8w==
X-Gm-Message-State: AOAM531SVJqyJoIk93XopNnKi7jd8yEL9F6yZjBE+2Tpeo+NuuWVU5Uk
 qhFv8s3GRgyTVG0rht9eGFi1iQS0IxGWtAXeOm4=
X-Google-Smtp-Source: ABdhPJybD3ce1ekRim1ZhIjnmLmlL/O7qPnH3M5AavmL+8L6MPDtRHWU2dnXIV05AjFpWSQvRk0Q2y0+VBJ4qWnrVSI=
X-Received: by 2002:a5b:449:: with SMTP id s9mr5786215ybp.115.1616509620027;
 Tue, 23 Mar 2021 07:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210323032624.1039422-1-mpe@ellerman.id.au>
 <CANiq72n-tMww2U+eQ=iHOh5u1JQgjM0b1E3XQ9jpWMfpdQ5+=g@mail.gmail.com>
 <87mtuugj61.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mtuugj61.fsf@mpe.ellerman.id.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Mar 2021 15:26:49 +0100
Message-ID: <CANiq72nx6Z=m-Fye7QYuQdjq9q0ZvH2+rkbrfQq-yQRMAadTYg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rust for Linux for ppc64le
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>,
 rust-for-linux@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 1:16 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> It would be nice to be in the CI. I was building natively so I haven't
> tried cross compiling yet (which we'll need for CI).

Indeed -- in the CI we already cross-compile arm64 (and run under QEMU
both arm64 as well as x86_64), so it is easy to add new ones to the
matrix.

> I can send a pull request if that's easiest.

No worries, I will pick the patches. But, of course, feel free to join
us in GitHub! :-)

Cheers,
Miguel
