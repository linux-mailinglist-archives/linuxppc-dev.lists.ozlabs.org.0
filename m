Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B673111205B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 00:41:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SJQt08GWzDqSF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 10:41:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="BVDTej5T"; 
 dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SJP46zH9zDqD7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 10:39:51 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id w5so2142209pjh.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2019 15:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=VLxOzUzazoD/qcDrmOBxEpKT8zDKcGdwgU5iRuwbvZA=;
 b=BVDTej5T5iPzOrkTJzDqFc6OR2z4FPZlBL/ec9JzS5BWEHzO3yAsa5FUayJxxboWSk
 /NmsrBFO6off0z0J9KA9ANmo+Kg6ZEEy4JFXANgLAbKUqXOd7nWimwAU3g+7JSyYtniF
 luueY9YGQqvoKS6c6ZgSbMCqcbVgC0gnq6pxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=VLxOzUzazoD/qcDrmOBxEpKT8zDKcGdwgU5iRuwbvZA=;
 b=buK6KOpvN9AcswtuWeGkTwQpy11CQTzhXGbg0NaKAyP+BAeBCGhCX+hXrZkRnx4Zxv
 aKkgbm9oaLtpFs04IDkOdCXFgF2uiNQSyn9kb3EYigd9K7kc1kU6UgPmhd/MOOZdmm8Y
 KhMH4TTvJyevrC1v6uTre5Ao21f+uHLPmez2CccdREFXut5mK7FK/DUQnoAuLbZeFyoE
 oLgccvs00zoCXfCd3Vwysr7mJ+VqsFmiMEho5hZ3RjzJKaaUJV51ultrZBamfGK2FQKk
 fQx/JJbTnhoElc6IBpFtTPgMRtAK9wv/NVpYvABt4XnYNRcEjWeykz06jEX2/2+hxYCn
 ynOg==
X-Gm-Message-State: APjAAAUdtO28xa1qCAHYD3qJS2J47GjhOg6U3b1HYSYAv9CmauCcSkXL
 HLVgSZH6YKJX3zn2qHWVUggbaA==
X-Google-Smtp-Source: APXvYqxmFcsDN3sphv0XP5SZYxQVF8tmLokQpIt8byFY9Ezv3IKSzcUQbsn+XlYAv+hALGoWbMDaaQ==
X-Received: by 2002:a17:90a:b706:: with SMTP id l6mr23416pjr.53.1575416388603; 
 Tue, 03 Dec 2019 15:39:48 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7daa-d2ea-7edb-cfe8.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7daa:d2ea:7edb:cfe8])
 by smtp.gmail.com with ESMTPSA id z26sm4463572pgu.80.2019.12.03.15.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 15:39:47 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, Marco Elver <elver@google.com>
Subject: Re: [PATCH v2 1/2] kasan: support instrumented bitops combined with
 generic bitops
In-Reply-To: <87r21lef1k.fsf@mpe.ellerman.id.au>
References: <20190820024941.12640-1-dja@axtens.net>
 <877e6vutiu.fsf@dja-thinkpad.axtens.net>
 <878sp57z44.fsf@dja-thinkpad.axtens.net>
 <CANpmjNOCxTxTpbB_LwUQS5jzfQ_2zbZVAc4nKf0FRXmrwO-7sA@mail.gmail.com>
 <87a78xgu8o.fsf@dja-thinkpad.axtens.net>
 <87y2wbf0xx.fsf@dja-thinkpad.axtens.net>
 <CANpmjNN-=F6GK_jHPUx8OdpboK7nMV=i=sKKfSsKwKEHnMTG0g@mail.gmail.com>
 <87r21lef1k.fsf@mpe.ellerman.id.au>
Date: Wed, 04 Dec 2019 10:39:44 +1100
Message-ID: <87pnh5dlmn.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 the arch/x86 maintainers <x86@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kasan-dev <kasan-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,
> I only just noticed this thread as I was about to send a pull request
> for these two commits.
>
> I think I agree that test_bit() shouldn't move (yet), but I dislike that
> the documentation ends up being confusing due to this patch.
>
> So I'm inclined to append or squash in the patch below, which removes
> the new headers from the documentation. The end result is the docs look
> more or less the same, just the ordering of some of the functions
> changes. But we don't end up with test_bit() under the "Non-atomic"
> header, and then also documented in Documentation/atomic_bitops.txt.
>
> Thoughts?

That sounds good to me.

Regards,
Daniel

>
> cheers
>
>
> diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
> index 2caaeb55e8dd..4ac53a1363f6 100644
> --- a/Documentation/core-api/kernel-api.rst
> +++ b/Documentation/core-api/kernel-api.rst
> @@ -57,21 +57,12 @@ The Linux kernel provides more basic utility functions.
>  Bit Operations
>  --------------
>  
> -Atomic Operations
> -~~~~~~~~~~~~~~~~~
> -
>  .. kernel-doc:: include/asm-generic/bitops/instrumented-atomic.h
>     :internal:
>  
> -Non-atomic Operations
> -~~~~~~~~~~~~~~~~~~~~~
> -
>  .. kernel-doc:: include/asm-generic/bitops/instrumented-non-atomic.h
>     :internal:
>  
> -Locking Operations
> -~~~~~~~~~~~~~~~~~~
> -
>  .. kernel-doc:: include/asm-generic/bitops/instrumented-lock.h
>     :internal:
>  
