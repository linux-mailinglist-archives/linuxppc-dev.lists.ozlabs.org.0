Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9516F2CE8EF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 08:56:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnQ5K6cKKzDrPl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 18:56:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D7BZBLvP; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnQ3H67QdzDrMG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 18:54:51 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id s2so2656052plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Dec 2020 23:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Zd7vmIfn6mzRaP11y/d7gH60I8gBLNa0mgMkL/toHvQ=;
 b=D7BZBLvP7Hf1hmbzDKHSvvrVMOcvwF3AuA29oTyK7LjSZGu/VvtRnPQYcM5WAhLexX
 7bxa66KLQ1nPLAHY7ASZKpcwj5k4Gj/sH6hD+9zfRuCPL4Lu5Awdy7z/+hdMDs8coD6V
 l8QYpI7vYdOmv55h5fB66u95Ohlgdwe0LaK+5MOxosaBfJT8hPUQpfvR3VXriGDatcPY
 gC/wXJZUtokL+ZYqMSshMZD74n/sJqggisoqq4cqL2SS5depbndddaDAtLka4PdXM3mG
 ge7JlJgFKZL1EYg7DD8hAPDTSPAXEGItK4mF9rjhF/tHePvbjm4v2usCJOMPjNtlHjbc
 kstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Zd7vmIfn6mzRaP11y/d7gH60I8gBLNa0mgMkL/toHvQ=;
 b=Rzl0Q3VKnI+9dm8EOWIwq4nxjEZxqfMrI72R0NQIFpkpOmY1LMRKThLmRCjvYFdNAg
 /FX1/oxB8iTr5xjrx0hMvODtgs/AyZcIAvcItNO8/6aGMRhs4nSj3NofIx4ar0PGx6Il
 L6c7qYPqAE2Y8fI4NHcG/NfvrUSf4CUH3r3ha4616L6SWayWde+8nU6v8wloOSJa6S6e
 UdMG0UoR6a+DMslZZ74Msjpr+2/aqhNCpKRBnlnBLJsXLXPblEhyWiz2qwa50i6qPrIx
 NYyuew6MuJeg0YxFAzjTpBH6w8OiF+oIlgKb25QvZ7FwH2W+VJo1FPgwdQtP1NnK4NVW
 8Lcw==
X-Gm-Message-State: AOAM532iradI56xhjQFGSxcR7PxYYHRRkYOTibCVRpIDuFHAcjBQG1F+
 NXGbAyujmRRJEy/Sd4CAZv8=
X-Google-Smtp-Source: ABdhPJxeaLakUaj4UZ6Mhmu/RUCo9vMWAs3X7UoKC0s3gdL5d5oy/Bq+kELLNyqZeAnUbZAiHbipyw==
X-Received: by 2002:a17:902:a388:b029:da:bad:ed3 with SMTP id
 x8-20020a170902a388b02900da0bad0ed3mr2711686pla.76.1607068487823; 
 Thu, 03 Dec 2020 23:54:47 -0800 (PST)
Received: from localhost ([1.129.136.201])
 by smtp.gmail.com with ESMTPSA id f15sm1346786pju.49.2020.12.03.23.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 23:54:47 -0800 (PST)
Date: Fri, 04 Dec 2020 17:54:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC v2 2/2] [MOCKUP] sched/mm: Lightweight lazy mm refcounting
To: Andy Lutomirski <luto@kernel.org>
References: <cover.1607059162.git.luto@kernel.org>
 <e69827244c2f1e534aa83a40334ffa00bafe54c2.1607059162.git.luto@kernel.org>
In-Reply-To: <e69827244c2f1e534aa83a40334ffa00bafe54c2.1607059162.git.luto@kernel.org>
MIME-Version: 1.0
Message-Id: <1607065599.ecww2w3xq3.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Nadav Amit <nadav.amit@gmail.com>,
 X86 ML <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Rik van Riel <riel@surriel.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Will Deacon <will@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of December 4, 2020 3:26 pm:
> This is a mockup.  It's designed to illustrate the algorithm and how the
> code might be structured.  There are several things blatantly wrong with
> it:
>=20
> The coding stype is not up to kernel standards.  I have prototypes in the
> wrong places and other hacks.
>=20
> There's a problem with mm_cpumask() not being reliable.

Interesting, this might be a way to reduce those IPIs with fairly=20
minimal fast path cost. Would be interesting to see how much performance=20
advantage it has over my dumb simple shoot-lazies.

For powerpc I don't think we'd be inclined to go that way, so don't feel=20
the need to add this complexity for us alone -- we'd be more inclined to=20
move the exit lazy to the final TLB shootdown path, which we're slowly=20
getting more infrastructure in place to do.

(The powerpc hash MMU code which we're slowly moving away from might=20
never get that capability because it's complex there and hard to do with
that virtualisation model so current big systems (and radix MMU until we
finish the TLB flushing stuff) want something here, but for those the
shoot-lazies could quite likely be sufficient)

But if core code was moved over to something like this for the benefit of
others archs we'd probably just as happily do that.

There's a few nits but I don't think I can see a fundamental problem=20
yet.

Thanks,
Nick
