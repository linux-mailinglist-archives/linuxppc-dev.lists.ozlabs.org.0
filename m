Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3274BEF3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 21:23:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yZP9mqmp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz0Xw5y9dz3bWS
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 05:23:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yZP9mqmp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz0X46NhDz30NK
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 05:22:27 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-577497ec6c6so36405987b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688844144; x=1691436144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FxH4Sn2IVEMSRJMI6h54/CoL9VNO3HIcD6stV0UszU=;
        b=yZP9mqmpeQMLkFovdtEmI4WKMEtko+pAQ1BEDfa+W5OHCr7jJVo29zKlMe4dc5y4+/
         ctYdxCnqqkyKx9WIui1Qqv5Ci88AGheDwsXz2NaxdeLoR4MDhJacff2brnbgaJOICM0/
         FUirKv//hF+3UgB0qF4zsmJdaL2b4sPGgHQwVh5lM+8VF9WIzAMiuuZ3N12zpITmJW2P
         bwvS7I0B45kBtMhXgHGcTY3U6QrBUujNiAIQ4YtZb+FEXhaB5xpVyoqlik6jHJ2HE/rE
         iQRENfjy1+wSccJQm6AdI6rIf3TRZOKTIXbalO5K2RUxxGox0Tcs59Z6qdZpfnU1mAbL
         9T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688844144; x=1691436144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FxH4Sn2IVEMSRJMI6h54/CoL9VNO3HIcD6stV0UszU=;
        b=kVgg0JVBB3pDtyOrH/vpM9S3/OlpTezp5iUQ5KPWQrUAPhrVY0tEKI2HzINSbDSSh+
         D8oGogtRvx2aTlDJMIyp5Sk2r0pjr2l0f9jN8Lt1zS/MvJQUCJLTDpuc/kLWU+KZ+RUV
         t01IE/4tCyGQxu/IdidjAJ7G5QKG0eOy6TDjNpABwxRurONDiXFGTtD9HpV2ji4Z++xc
         4zCsaeOLv6IVclClTLvBy0ApJUXenHwSDkw0OPVw+VOqq5dRn+E+ABzv4Vr4itGMExdR
         er5hpU+zsIdCv4BlXMy/1pXMhUxpOhHFcTrI4RaOZhP+VWe23CLB2Dz6Jbh0KkfuGE1s
         V6sw==
X-Gm-Message-State: ABy/qLY1sPghw/j1pV8C2DQ4k/Tynshm+LeWDM0PjYKAoZ9L6ddWhTT2
	PIYrhbKpa1Yph7n0/AdTebw6Cw3OPhoGnZHNtAmARw==
X-Google-Smtp-Source: APBJJlGKL8J4JHA6mAQOwpLYAy2LOkRrcxRPz0EwZZ4kcff6g2abFfEEg9qIuCiKp4H+yMTT0PzACvox6UCyMAwV86o=
X-Received: by 2002:a0d:dc83:0:b0:570:8482:4074 with SMTP id
 f125-20020a0ddc83000000b0057084824074mr10341749ywe.42.1688844144270; Sat, 08
 Jul 2023 12:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
In-Reply-To: <20230708191212.4147700-3-surenb@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 12:22:13 -0700
Message-ID: <CAJuCfpFBnweDUBnxEZQbqxYNtrY08C+1LxYsB_5zaMhrb=AHEg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, liam.howlett@oracle.com, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, willy@infradead.org, bagasdotme@gmail.com, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 8, 2023 at 12:12=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> When forking a child process, parent write-protects an anonymous page
> and COW-shares it with the child being forked using copy_present_pte().
> Parent's TLB is flushed right before we drop the parent's mmap_lock in
> dup_mmap(). If we get a write-fault before that TLB flush in the parent,
> and we end up replacing that anonymous page in the parent process in
> do_wp_page() (because, COW-shared with the child), this might lead to
> some stale writable TLB entries targeting the wrong (old) page.
> Similar issue happened in the past with userfaultfd (see flush_tlb_page()
> call inside do_wp_page()).
> Lock VMAs of the parent process when forking a child, which prevents
> concurrent page faults during fork operation and avoids this issue.
> This fix can potentially regress some fork-heavy workloads. Kernel build
> time did not show noticeable regression on a 56-core machine while a
> stress test mapping 10000 VMAs and forking 5000 times in a tight loop
> shows ~5% regression. If such fork time regression is unacceptable,
> disabling CONFIG_PER_VMA_LOCK should restore its performance. Further
> optimizations are possible if this regression proves to be problematic.

Sending this earlier version of the patch per request from Linus and
with his explanation here:
https://lore.kernel.org/all/CAHk-=3Dwi-99-DyMOGywTbjRnRRC+XfpPm=3Dr=3Dpei4A=
=3DMEL0QDBXA@mail.gmail.com/

>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Reported-by: Jiri Slaby <jirislaby@kernel.org>
> Closes: https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@=
kernel.org/
> Reported-by: Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com>
> Closes: https://lore.kernel.org/all/b198d649-f4bf-b971-31d0-e8433ec2a34c@=
applied-asynchrony.com/
> Reported-by: Jacob Young <jacobly.alt@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217624
> Fixes: 0bff0aaea03e ("x86/mm: try VMA lock-based page fault handling firs=
t")
> Cc: stable@vger.kernel.org
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  kernel/fork.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/fork.c b/kernel/fork.c
> index b85814e614a5..d2e12b6d2b18 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -686,6 +686,7 @@ static __latent_entropy int dup_mmap(struct mm_struct=
 *mm,
>         for_each_vma(old_vmi, mpnt) {
>                 struct file *file;
>
> +               vma_start_write(mpnt);
>                 if (mpnt->vm_flags & VM_DONTCOPY) {
>                         vm_stat_account(mm, mpnt->vm_flags, -vma_pages(mp=
nt));
>                         continue;
> --
> 2.41.0.390.g38632f3daf-goog
>
