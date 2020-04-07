Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B61A0435
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 03:14:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x8Yy51nCzDqsy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 11:13:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LyygrqVL; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x8X83m4YzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 11:12:22 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id l14so930025pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 18:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=3cdUhQp/zpzkOyVvmj6qlGqEL1FKTqwSK/cEYACNo1Q=;
 b=LyygrqVLrfCaDS6whDZy427nStCSkQikCPbl7Ge2Pwyxch3zVwHf2FLJsU0hlZPvcR
 OlhmxukFFK1fwQEGP0DWimeobp9vfksZYCn3p+4nh4c5mmrfQT0OnbJOaiea8CjdodHP
 8DDp0N5GzuQ1pv1wRQhpVy0GD8CGmahwTjpdxdoAU0YnVIPgyFkPJOTGyvardKU1ZK6q
 tTRA6d3rdQ/kpdwh3snHMWlADgHvUGQ0s7nGjA9DL8pkynK2v1UnoKxR84ijbzYHCS9x
 Yx5Sb3hpNCYxDZHF25i7BUUeplUBSOiy+ZaZEHw5/ddzek4O54H6grPHdSnZEdZzYbqh
 bP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=3cdUhQp/zpzkOyVvmj6qlGqEL1FKTqwSK/cEYACNo1Q=;
 b=rmekWyUGwMb4x6HbjpB0eKBJb7fCijNa/SE+W6YLjROHjkAMmox37StwWZlBvHv/NU
 SJJ3tFV3fxLUDS8CV8J+i8CGd/nrKNFq3Nq4v3BnimvcT3Nnw6jPN5NrgfgvhTa7dDXj
 n6n5uiP/NDQnwdJkXey9mVKiKFONwmuJ2mrYgQTBNNybLhUeEohwb1nUBXAh3/G+ILOJ
 k6VbWYHhjLa7lI1YH5zy/IDWqe0sx7jJREtHXX5B2F9FFplMZvHyVTmkN5Gmk+UYbLrH
 WeG5TIkPBUf6Ud70CWWSjKT0nw3fsLlPc6olNGRwcUHFnoX4nArDURkY6290EfSiYjFi
 pA7w==
X-Gm-Message-State: AGi0PuZYM9D1is94AZuy+AoIa1r2nHOy846e9kUQj1o/7jNQNq4tUyR5
 Dls4CVakO92vEz93YVJj5r1Kj1PT
X-Google-Smtp-Source: APiQypLuPGhY0OgC1uV5M40YzrGcLzB+SkCB5iv8ooQ+KJkJlEXTFlZzy8EKLaasRmrLXxN+Ghqf+w==
X-Received: by 2002:a62:1c4a:: with SMTP id c71mr172644pfc.58.1586221939248;
 Mon, 06 Apr 2020 18:12:19 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id i18sm12785222pfr.62.2020.04.06.18.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:12:18 -0700 (PDT)
Date: Tue, 07 Apr 2020 11:10:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v3 15/15] powerpc/kernel: Do not inconditionally save
 non volatile registers on system call
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <5aeaa33383e833f6eca30893fbd188b88e019eaa.1586196948.git.christophe.leroy@c-s.fr>
 <1299b6b50facf78458e7db265fb9936595ea009a.1586196948.git.christophe.leroy@c-s.fr>
In-Reply-To: <1299b6b50facf78458e7db265fb9936595ea009a.1586196948.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586221719.pt68ef9jgc.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 7, 2020 4:16 am:
> +	ret =3D syscall_exit_prepare_end(ret, regs, ti_flags);
> +	if (unlikely(ret & 0x80000000)) {
> +		ret &=3D ~0x80000000;

We could just add our own set of defines for these, there's no real
reason to use _TIF_RESTOREALL as I had.

Thanks,
Nick
=
