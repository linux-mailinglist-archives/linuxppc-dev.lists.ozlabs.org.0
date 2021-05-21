Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5438CA93
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 18:04:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmrz624bGz3bvm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 02:04:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GPbGcKTy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=GPbGcKTy; 
 dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmryd1vhzz305x
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 02:04:24 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id p20so24554430ljj.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u+o46hanR9P7zvSnBnu4BF9jcYec6WA6HmpllzjQX4U=;
 b=GPbGcKTyZK1/TQFrE4YKnGplyqqw8O0vITSws9ZhnTVJCCaTm7OUWRS25f3Vz5Lc8M
 xH7QmsSzP+Yy70WMcNG4UZXmxTChocRH6xPQTujQavLnp3JhVSZ9IybxhnslUFjIt+Im
 ItLm0oy9KujzeSTBPMA5ub5bTjudE1K7cR0Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u+o46hanR9P7zvSnBnu4BF9jcYec6WA6HmpllzjQX4U=;
 b=EHQfE78qCBVdfBOwuiK6kzSabh1eDdn8W7c5nnEoux1IECmjo++jRiZxtMLkRSDWl2
 nQgw1aAxTgXE26oyOxUKAzp7cYDTzlhbYnkY5hNwCwbhFnhxhtLcGpT2dyTcbPd3bYjs
 xLm7Yga9fFyBCTsnyUk5bMCubtnccUncxPvDngmgWyDxMOLVV6Maln/sOhc9kBkMmRdm
 HrP+kqY76LdKUe/i9uWDVOYcL5Kdi5L9qCs54NRjWHQ26CIhClEnyu19K/Co8OJwlsmT
 Pg0F3WVgia0xv4MihCTbs/toH7G4tuhOsg67k94TYqvgX1CJoSgXlPAG1eQU1ILQbAU0
 5Ujg==
X-Gm-Message-State: AOAM533Ci7Why8p02qCQzwFO+YXns3GWvG1CJ8Yes089UOEHwKDH2Dam
 9jVb3tRY1RvBpyO983bSFKUbp4qt9Q4BusrR
X-Google-Smtp-Source: ABdhPJzz93McTGpm6HjZYbGWGuraoQrdkkYJWf0lMcTWfMrkvRR/JBU3LllF0acbLFU0y2vrpeuijw==
X-Received: by 2002:a2e:b524:: with SMTP id z4mr7411784ljm.62.1621613054929;
 Fri, 21 May 2021 09:04:14 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id m4sm716688ljp.9.2021.05.21.09.04.12
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 09:04:13 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id j6so27764234lfr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 09:04:12 -0700 (PDT)
X-Received: by 2002:a05:6512:36c5:: with SMTP id
 e5mr2652442lfs.41.1621613052578; 
 Fri, 21 May 2021 09:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
 <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
 <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
 <CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com>
 <5ea8fa4f-a5a2-7dc4-7958-23df6a2c1f3a@linux.ibm.com>
 <874kewme7a.fsf@linux.ibm.com>
In-Reply-To: <874kewme7a.fsf@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 May 2021 06:03:56 -1000
X-Gmail-Original-Message-ID: <CAHk-=whUHnm1CQ3LC0Qz=BBkhBRZkNW6ZmQZvSac2vju7gfeVg@mail.gmail.com>
Message-ID: <CAHk-=whUHnm1CQ3LC0Qz=BBkhBRZkNW6ZmQZvSac2vju7gfeVg@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 21, 2021 at 3:04 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> We could do MOVE_PMD with something like below? A equivalent MOVE_PUD
> will be costlier which makes me wonder whether we should even support that?

Well, without USE_SPLIT_PTE_PTLOCKS the pud case would be trivial too.
But everybody uses split pte locks in practice.

I get the feeling that the rmap code might have to use
pud_lock/pmd_lock. I wonder how painful that would be.

             Linus
