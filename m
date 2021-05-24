Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF87F38F222
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 19:17:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpkRb523Jz3bsv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 03:17:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=cV5W3NmA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=cV5W3NmA; 
 dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpkR775Xkz2yXq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 03:17:05 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id q3so11553716lfu.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nc7F/YNBdgjDdP/qhNEAcnLGrc409bn4ko9tRV0fC6M=;
 b=cV5W3NmA+15ESzIpW1CgdKehYcwWRodRFr3vjpfRjFT8a+bfb2OoW/+ozwXcJM2vZk
 EkmxyfR93ogCNbdLjQkSlu6ERD8y88l2JWxB0oFlpPWzohFsqjfyKPd+UF0Dp8McMiXR
 FTxNo2yJHgOX+UVUeX5DA3/5hjjkm0pe43ZKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nc7F/YNBdgjDdP/qhNEAcnLGrc409bn4ko9tRV0fC6M=;
 b=pZiiHTLW9SsEekhV5Tksl80fI+WGifpSWhJ+1Ngv4S0UlVfmavVWtRHJVdSP0SWlpP
 tqcMMCYN37yQd2F60Myq8s/tlq4sYseAHDW9CAr9+guu4wm/dctmKoxObASsxRdtRCLz
 VWGyb6GWzT8fH6WALOolu5q3hA8uCAsu1WX+w+1kkCaPnamYtcSnAo72DDMxYHPxLwqX
 upM2A05+xU+RU3Q6MFGB1vz3mnRopqCzZHXTtfYA+KgTxOKroGWbVlmhFdv/jwj+rhIE
 NF1zwYfq7TqD2WTCvCzfc4Re0Vtsm6q27d6xIgJep2wdh4eIoY252JlnG9rE47MOdrO0
 icRQ==
X-Gm-Message-State: AOAM530jS3lUgN7rTwjfJU41SYmqtvI26O+MWQPr0vnP3G+negDVYvOG
 Q41XA+ntx3q7ljhUv8hX1bEbxtjeB+zIxXUoKS4=
X-Google-Smtp-Source: ABdhPJxX/TamrpFkD+Vvglu6R7ViRYwRbPTLEce8ZQk16dW6lKjprwEwB71ZJf+oe19wp2ovoTkicw==
X-Received: by 2002:ac2:43ce:: with SMTP id u14mr11133478lfl.662.1621876620029; 
 Mon, 24 May 2021 10:17:00 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id u3sm1828332ljg.78.2021.05.24.10.16.59
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 10:16:59 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id w15so34567713ljo.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 10:16:59 -0700 (PDT)
X-Received: by 2002:a2e:968e:: with SMTP id q14mr17720803lji.507.1621876618963; 
 Mon, 24 May 2021 10:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210524133818.84955-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210524133818.84955-1-aneesh.kumar@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 May 2021 07:16:43 -1000
X-Gmail-Original-Message-ID: <CAHk-=whtmtA0SC5pjoeJ5+nHeiroQen0bph1abMJyb6Ge1b_wQ@mail.gmail.com>
Message-ID: <CAHk-=whtmtA0SC5pjoeJ5+nHeiroQen0bph1abMJyb6Ge1b_wQ@mail.gmail.com>
Subject: Re: [PATCH v6 updated 9/11] mm/mremap: Fix race between mremap and
 pageout
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

On Mon, May 24, 2021 at 3:38 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Avoid the above race with MOVE_PMD by holding pte ptl in mremap and waiting for
> parallel pagetable walk to finish operating on pte before updating new_pmd

Ack on the concept.

However, not so much on the patch.

Odd whitespace change:

> @@ -254,6 +254,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>         if (WARN_ON_ONCE(!pmd_none(*new_pmd)))
>                 return false;
>
> +
>         /*
>          * We don't have to worry about the ordering of src and dst
>          * ptlocks because exclusive mmap_lock prevents deadlock.

And new optimization for empty pmd, which seems unrelated to the
change and should presumably be separate:

> @@ -263,6 +264,10 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>         if (new_ptl != old_ptl)
>                 spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
>
> +       if (pmd_none(*old_pmd))
> +               goto unlock_out;
> +
> +       pte_ptl = pte_lockptr(mm, old_pmd);
>         /* Clear the pmd */
>         pmd = *old_pmd;
>         pmd_clear(old_pmd);

And also, why does the above assign 'pte_ptl' without using it, when
the actual use is ten lines further down?

So I think this patch needs some cleanup.

              Linus
