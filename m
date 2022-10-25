Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C3060D196
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 18:25:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxckB2NfWz3cFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 03:25:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=me2iS3za;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=me2iS3za;
	dkim-atps=neutral
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxcjD6fVWz2y32
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 03:24:48 +1100 (AEDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-12c8312131fso16243347fac.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g89ernk4UyCE+8kwxR3Jyv5/vIX5YuI8xLhm1A4ERjI=;
        b=me2iS3zan7xp1lungXtMEHy478+snmQ8PXpOfSfZSvbJpysiWhm32N2znOhdc3DIf+
         i0qjOkqEogsZJ5y6xybLljNskJ4VSaPPSh/WslH9zG7/IypmvQEhGkJtSmxDgSwYQ1cv
         glkmy8ynnRP4r/oDDmsF1hEYOWqONzMpjpvJh2D36dc9NGvX5lF7Wma0F0oBpG18Wfwz
         TFW29rNtsoF23Mt5hSd2bF2FiBx7q3SCkd2D5QjnMXVB1SPGacORoQdTuuSt2qvk2Pv5
         uWP6xyX4xNT7wTLo6BD++jqfcVco5sbCU9o1tZOfpFSIbMwsFK3yfXK4pHMkXfafviXH
         FEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g89ernk4UyCE+8kwxR3Jyv5/vIX5YuI8xLhm1A4ERjI=;
        b=klwQsZOrOaUYo7ZJqwyOV/A17eP9N2+Pj/Py7jZVQKhjk1QrzWlRJVzA+fw6xS0fHs
         EGk5Beulx9oi7GCl6jex/s3xlD7n6n2hMxslO1UAyKq07OdHHb4kjSFat6v9USItaE1C
         zB36uwkX/XWME7Qv/TPb3sJTH8o8T9UDdSVrHuCkG8WPhAEj3hhWDxOpyWVLFRginKl/
         coFIANl8jW4rVRP893UpQOlyfya8NjQIxEC3k/YIyD56ioRAEqWfJq0WhiReoz58MROT
         UI/vPnHP9Rjj2snyJ8e5U1Ea5patAhHdVWuPR24hVHL1iWQSaH36MKm3redjt9vbkLT/
         h0gQ==
X-Gm-Message-State: ACrzQf28vJo3uWK1sroHLXrYd49MmDYNlC9Pu7wOKjbV2Iv/S8/0sEKd
	CLS1x+r/MdZb8GG2dd2NnLA=
X-Google-Smtp-Source: AMsMyM66skY8peYqQCsAcNYATCWaSdXlgJng8rKLnrFG3anQDSwtsS3nLdGUBEzL0fGXbrprb79aXQ==
X-Received: by 2002:a05:6870:a7a5:b0:131:886b:214f with SMTP id x37-20020a056870a7a500b00131886b214fmr23648014oao.83.1666715084217;
        Tue, 25 Oct 2022 09:24:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f13-20020a4ad80d000000b00480dac71228sm1265549oov.24.2022.10.25.09.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 09:24:43 -0700 (PDT)
Date: Tue, 25 Oct 2022 09:24:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 6.1-rc2
Message-ID: <20221025162441.GA1128834@roeck-us.net>
References: <CAHk-=wgLV1tNP0EYz7qWK-xeKzO6bh5Kogbpn2wxKLPPpOit3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgLV1tNP0EYz7qWK-xeKzO6bh5Kogbpn2wxKLPPpOit3w@mail.gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 23, 2022 at 04:03:45PM -0700, Linus Torvalds wrote:
> Hmm. Usually rc2 is a pretty quiet week, and it mostly started out
> that way too, but then things took a turn for the strange. End result:
> 6.1-rc2 ended up being unusually large.
> 
> The main reason is fairly benign, though: Mauro had screwed up the
> media tree pull request during the merge window, so rc2 ends up having
> a "oops, here's the part that was missing" moment. Since it had all
> been in linux-next (yes, I checked, so nobody else should try that
> trick), I ended up pulling that missing part during the rc2 week.
> 
> But if you ignore that media tree portion, things look pretty normal for an rc2.
> 
> Anyway, ignoring those media changes, we have a little bit of
> everything in here - arch updates, drivers (gpu, device mapper,
> networking), EFI, some core kernel fixes (mm, scheduler, cgroup,
> networking). The full shortlog is appended (and that shortlog does
> include the media pieces).
> 
> Please do go test,

Build results:
	total: 152 pass: 152 fail: 0
Qemu test results:
	total: 499 pass: 499 fail: 0

================

Runtime warnings

powerpc
-------

BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1

Not a new problem (seen as far back as v5.15.y), but fixed by:
    "powerpc/64s: Disable preemption in hash lazy mmu mode"
    "powerpc/64s: Fix hash__change_memory_range preemption warning"
    "powerpc: fix reschedule bug in KUAP-unlocked user copy"

at:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221013151647.1857994-1-npiggin@gmail.com/
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221013151647.1857994-2-npiggin@gmail.com/
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221013151647.1857994-3-npiggin@gmail.com/

================================
WARNING: inconsistent lock state
inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.

Fixed by:
    "powerpc/64s: Add lockdep for HPTE lock"
    "powerpc/64s: make HPTE lock and native_tlbie_lock irq-safe"
    "powerpc/64s: make linear_map_hash_lock a raw spinlock:

at:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221013230710.1987253-1-npiggin@gmail.com/
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221013230710.1987253-2-npiggin@gmail.com/
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221013230710.1987253-3-npiggin@gmail.com/

Guenter
