Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BED24E38C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 00:44:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYGlz4pt3zDrLj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 08:44:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p7LCpJWh; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYGkJ3r5FzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 08:42:47 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g15so1525503plj.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=4UWlKWRwFhMMQv4f/JDXmRT+IPsV6O51XHRajg1UNPE=;
 b=p7LCpJWhWXdAx14JgK9TDLJJ3BCvufZbmghRyHVQLMM0vpPRzQq3iDkxgW+5B2M8Fr
 TZjTY1SBBZ5eRzY2WIrfka7rQfiLpRXq/DXb2rpBQ+pfzVWBHZx50fKSz9oVqrlsclkk
 DfcOtMu4MHaLkKhfCyYyrR/ZqL+GKNv8V5ESRlW++QX72hA8d7MOA5UxxSbDEMvckjm2
 oJAwLvOw7f6jQF9dr5YdN0vs8KCf5DkGkL1irNYBf3a0WocvL+APIsazA5tedsv8U3WK
 JHV9yWGMZVp5FTd+wR4YZHJfGjbC5amLwRi0zjCmvUkC6Y4hPphjuXzaTdTDm9MKbST7
 WhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4UWlKWRwFhMMQv4f/JDXmRT+IPsV6O51XHRajg1UNPE=;
 b=DjJWA3ruxUNZ9Z53u8rzxLDOVWx5TVoWXR7QkCit4b45TV9ZkpQvsmxuSM1UTkDEyw
 pY5jSx30Sqp4dlGd1sC1XOovgJZSXBEuT0DPMOodZNWG9l+FeIUOJi7ejBQQKL3m7ZRb
 wL83n0X7l8KiyjFAOZmtOyT+MpaLfeOlah5CUU9ymf2e2ujhiC4ZB0euCHu+fBuYlTpn
 iOTcZaQ4g/0v9v4n1Mf7wR97ur2S844wUPWLH8nWEbF1O7bngrZYLOd176BzCD/0N9eL
 970LE01jEBGj0EUmGnfpkuYLd92H6gGarK7/+V3D2vDXG/VEk9vVCAsDSHCfkEXEVu24
 pjLA==
X-Gm-Message-State: AOAM531JUqg6aAvCzhDOH4TtrO8p4Y6yPmhpDQWxtyJfFohpbPS+IA8z
 8C2rSD/X+UNcLN73JLjfwImGgzC28+o=
X-Google-Smtp-Source: ABdhPJzyk5gtyaEQvYqdChTxy/Co2Lk+Pe4/qWzCnpygMz9yMFZCgfiZ1vuBUvB8wjDn5B/HdIgtuA==
X-Received: by 2002:a17:902:b081:: with SMTP id
 p1mr4122273plr.195.1598049766139; 
 Fri, 21 Aug 2020 15:42:46 -0700 (PDT)
Received: from localhost (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id z126sm3602084pfc.94.2020.08.21.15.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 15:42:45 -0700 (PDT)
Date: Sat, 22 Aug 2020 08:42:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 01/12] mm/vmalloc: fix vmalloc_to_page for huge vmap
 mappings
To: Andrew Morton <akpm@linux-foundation.org>
References: <20200821151216.1005117-1-npiggin@gmail.com>
 <20200821151216.1005117-2-npiggin@gmail.com>
 <20200821130757.289570e4bb491672087d3396@linux-foundation.org>
In-Reply-To: <20200821130757.289570e4bb491672087d3396@linux-foundation.org>
MIME-Version: 1.0
Message-Id: <1598049375.u9pf1rciw6.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andrew Morton's message of August 22, 2020 6:07 am:
> On Sat, 22 Aug 2020 01:12:05 +1000 Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>=20
>> vmalloc_to_page returns NULL for addresses mapped by larger pages[*].
>> Whether or not a vmap is huge depends on the architecture details,
>> alignments, boot options, etc., which the caller can not be expected
>> to know. Therefore HUGE_VMAP is a regression for vmalloc_to_page.
>=20
> I assume this doesn't matter in current mainline?
> If wrong, then what are the user-visible effects and why no cc:stable?

I haven't heard any reports, but in theory it could cause a prolem. The
commit 029c54b095995 from the changelog was made to paper over it. But
that was fixed properly afterward I think by 737326aa510b.

Not sure of the user visible problems currently. I think generally you
wouldn't do vmalloc_to_page() on ioremap() memory, so maybe callilng it
a regression is a bit strong. _Technically_ a regression, maybe.

Thanks,
Nick
