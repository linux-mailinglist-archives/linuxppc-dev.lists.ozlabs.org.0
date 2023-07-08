Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A574BF41
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 23:19:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Nb3QCbvk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz37Q2ggwz3c27
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 07:19:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Nb3QCbvk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz36V2wGpz30f0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 07:18:56 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso5019717e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688851128; x=1691443128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYkpMcCqLkVQ1Acc1vLb6z5Gk8ZLjHpR5RYSSOrvZGs=;
        b=Nb3QCbvkIpeTDcpUQ65nqxbIAfPmInaCnV0Kn+S1p+cWlTmFngKhFoWR/L/+W5m6f1
         AyBgaXE9ZNr/xXLKhklSQHcGCB0KoKMN5zQd8RVI6cKw9IyADeXsgg7JxiRDExhiBOiL
         X/3IXLdza+9v4CmV3u+di3BhkYQFm7NBZzYrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688851128; x=1691443128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYkpMcCqLkVQ1Acc1vLb6z5Gk8ZLjHpR5RYSSOrvZGs=;
        b=UTXvsrkV9LSenI+SDIR9SJWmSUeSFbDj42dZpori/kLZafWD+oNZFsNSFTHmZuzAaU
         ttD7EMw4R2jM0EkW6UPT/6PZld9B2J1/h9r4N4ctRarLzbSV7NmdJlFpQqufqth/WnDp
         ZpF8iUGjcj4YeiSTpmC7UJ2QNzT+FLhPhGB3TRj3dQFL+LKsMD13Aj4xZsatNBwFJhWk
         OiEXuHe3i1ZzpVm94KIHZvACs0gvNxHz+y8kWn08+s2sio+HQncr4ksWOm5TAWSipp8j
         3ji9wFeVmMnIGr8x+GCW3ZUzCBA99HGsYPngaCEfR3QE8u527/y+EAvIFYCTYmDzgtj6
         G+Pg==
X-Gm-Message-State: ABy/qLaspxdtOaY/DxmwlIbclNiSekuhRY/rET+mFaFgLQhJDMzTTB/l
	SIsx3L86pzlj7aqGMqx9jf2Wq+oSFpRrMKGdjnRTok7F
X-Google-Smtp-Source: APBJJlEur6pEEOgaavNHqEzVV82DeBaUybswr66jV1OTdu6pPpfJRfuGgPEPv5kbxf9kqL1Er26XZA==
X-Received: by 2002:a19:7710:0:b0:4fb:8a92:4fd5 with SMTP id s16-20020a197710000000b004fb8a924fd5mr6131702lfc.54.1688851128253;
        Sat, 08 Jul 2023 14:18:48 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id c11-20020a19760b000000b004fb7d6e3e81sm1126936lff.111.2023.07.08.14.18.46
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 14:18:46 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso5026262e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 14:18:46 -0700 (PDT)
X-Received: by 2002:a19:670b:0:b0:4f8:742f:3bed with SMTP id
 b11-20020a19670b000000b004f8742f3bedmr6097080lfc.37.1688851126226; Sat, 08
 Jul 2023 14:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
In-Reply-To: <20230708191212.4147700-3-surenb@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 14:18:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com>
Message-ID: <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Suren Baghdasaryan <surenb@google.com>
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, liam.howlett@oracle.com, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, willy@infradead.org, bagasdotme@gmail.com, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 8 Jul 2023 at 12:12, Suren Baghdasaryan <surenb@google.com> wrote:
>
>  kernel/fork.c | 1 +
>  1 file changed, 1 insertion(+)

I ended up editing your explanation a lot.

I'm not convinced that the bug has much to do with the delayed tlb flushing.

I think it's more fundamental than some tlb coherence issue: our VM
copying simply expects to not have any unrelated concurrent page fault
activity, and various random internal data structures simply rely on
that.

I made up an example that I'm not sure is relevant to any of the
particular failures, but that I think is a non-TLB case: the parent
'vma->anon_vma' chain is copied by dup_mmap() in anon_vma_fork(), and
it's possible that the parent vma didn't have any anon_vma associated
with it at that point.

But a concurrent page fault to the same vma - even *before* the page
tables have been copied, and when the TLB is still entirely coherent -
could then cause a anon_vma_prepare() on that parent vma, and
associate one of the pages with that anon-vma.

Then the page table copy happens, and that page gets marked read-only
again, and is added to both the parent and the child vma's, but the
child vma never got associated with the parents new anon_vma, because
it didn't exist when anon_vma_fork() happened.

Does this ever happen? I have no idea. But it would seem to be an
example that really has nothing to do with any TLB state, and is just
simply "we cannot handle concurrent page faults while we're busy
copying the mm".

Again - maybe I messed up, but it really feels like the missing
vma_start_write() was more fundamental, and not some "TLB coherency"
issue.

            Linus
