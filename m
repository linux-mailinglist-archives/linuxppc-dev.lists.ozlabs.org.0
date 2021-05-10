Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D698F377C42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 08:28:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdrjV6kvJz2yRX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 16:28:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=s9HXI1C3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s9HXI1C3; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdrj4088nz2xv3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 16:28:22 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id s20so8603040plr.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 23:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=8aR7WY5CZTqAiWESNPXFHkeKW1KzCf5tU1hXn+HW1Kw=;
 b=s9HXI1C3iGShy3MBh/f3z23PGT7oo5fSNATzZC5wVH3AyhfCxO3IHtSzJqwfJzLkr8
 Sa94IYs01uF3tVT5jCOiTBQEMn/XoCyaQHBKgUAzdE3dBndEIbFJwrVf/l99vo8602z9
 Tkhrh01vYkzv7Mdv2lLXElxNxjJLQfYBN7RetbJMrWZsFCTCsmKEj/YySnC5QIJoVXH/
 dJlR8y/FZhpvfW2Gal5NjKzmAdxFgMeJluGzGy8uLVEuNTmMvvmPckmmPCHDD18dHnKj
 4R/wJtCq/sQ6zh7aRVXYZyrEEkHXhZirPAOS3BtK0EfRGtwNsN9wEzj2w/OT30aaNivM
 YoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8aR7WY5CZTqAiWESNPXFHkeKW1KzCf5tU1hXn+HW1Kw=;
 b=mjIvwX2vSoo+E4VVmg0iDbCRNdQELC+oQOAZJWW5y3hQxRVgvOtXHWAwnG77WoNqIR
 ThkuruHV16iWFmNlmdxgg6s/MNgNUW8Y2w04cMz5I4fBB8P7XsvTLDEKqjIWbgSfpOnh
 hnGyGSJDgxcBVLd/5uCGsAEdhYk3Z9vOkfxtFuIycWRPfhkFYBTjaU4OFwR1hTmH2Tbl
 texySZF9J/kz4zDoowxXSahAGguvaV2iIrubMGC/uVgoxxm3T08Q94GUPpNeDyeb9AGQ
 Yy76O0NsnAQDA99poxuYrhuFii/BRVdqXYwYnprbluP+Dp7BWXIGOjhvly57xMbPn7Y9
 fm4Q==
X-Gm-Message-State: AOAM5308zE4dy89dOHFZukfyt4W/ZyU2NR2CZrT2zEzw8JAhw1EFsu0d
 RP7PDGf8fxiF/+zKAglYiQU=
X-Google-Smtp-Source: ABdhPJx8PUcyQWV5bJ29htOosYznRoAQ6XJNYhgJTv4qLNWMdTyMXBo1DbKc9tZ7rV5saYG+CXONcA==
X-Received: by 2002:a17:90a:20b:: with SMTP id
 c11mr25164418pjc.44.1620628099647; 
 Sun, 09 May 2021 23:28:19 -0700 (PDT)
Received: from localhost (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id d129sm3575475pfa.6.2021.05.09.23.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 23:28:19 -0700 (PDT)
Date: Mon, 10 May 2021 16:28:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3 PATCH 10/16] powerpc/pseries/vas: Integrate API with
 open/close windows
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <4b66c4eea2c0213be658180c987d81f3bb82293d.camel@linux.ibm.com>
In-Reply-To: <4b66c4eea2c0213be658180c987d81f3bb82293d.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620628043.agzu72dwu1.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of April 18, 2021 7:08 am:
> +static int deallocate_free_window(struct vas_window *win)
> +{
> +	int rc =3D 0;
> +
> +	rc =3D plpar_vas_deallocate_window(win->winid);
> +	if (!rc)
> +		kfree(win->lpar.name);

Oh, did this kfree sneak in here? The allocation appears in patch 11
I think.

Thanks,
Nick

