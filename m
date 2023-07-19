Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA495758E9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 09:17:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gX7b5UN9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5RwT3m1hz30XV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 17:17:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gX7b5UN9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Rvd1RShz2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 17:16:42 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b703cbfaf5so98972671fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689750997; x=1692342997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqjGnkydjRYo2dESqfO3eXpJEsuUSuu3liWybMYNxjM=;
        b=gX7b5UN9DkeHJXYwujSe1mjmePWQplvCvP44U3BFMNFhyjzTNc5cPL0b0FlYXl4Hcq
         jxN76VnlMs/9ozWflSmx+8DKY2OPbWWT7ADykcn5N3+7vzltbgVCMSrmganHSQMB0To9
         M8iQKIij7Ois9wkxeKl3uimcVDRE1EU2yCMg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689750997; x=1692342997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqjGnkydjRYo2dESqfO3eXpJEsuUSuu3liWybMYNxjM=;
        b=LWMSHw3RlQjwcjNjVDh9Y3V/1Qsv+jm+hEThXqO4z/fdAfCu/sX8lps/6rab96/+3q
         rCxz/wvWV+icyi7yZoW8X/9qRNWmW3P35ZbXhvjCxfl0WtEOdTE48hXnqNP+h5fhGxsT
         F4qaTlS077Zhfd6dyoqO8Y7W38QoyOnhkLn1gs1R0ng9xrB+fROnNP6oN6nxkr3pOCyr
         d65mmm81HD4d3llmLQE/aNi+svYcs/86ulbjUa1WuQWfcv+d2DQs7w8DTmw7s1dMsEmG
         j9644KbCreZqS8x6oPxtgzY+cL/t6JwS7gMmTCZq3B3jhGItIw07ptSFV7jXTy0k6TqK
         XBnw==
X-Gm-Message-State: ABy/qLZt2WSHZ496nJp8hiAKna4+b76iacH+4zWMHWxIPiofR8oIw09m
	E02nqiAz/T3Ykv7upjKoZR8YWgkfDpPFsLHh9myyBg==
X-Google-Smtp-Source: APBJJlFqhwQMdurqFqZbJF6PVLk2bfOiT9p8qJTEaQQQ3Jq/BQQ5+E1DH8yM8SRT8kMqvgYsDBHQZ/8q8j2PVmM/Edg=
X-Received: by 2002:a2e:b164:0:b0:2b7:1c0f:f221 with SMTP id
 a4-20020a2eb164000000b002b71c0ff221mr1255715ljm.39.1689750997071; Wed, 19 Jul
 2023 00:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-6-stevensd@google.com>
 <ZLd9/V6EAxSwEAzY@yzhao56-desk.sh.intel.com>
In-Reply-To: <ZLd9/V6EAxSwEAzY@yzhao56-desk.sh.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Wed, 19 Jul 2023 16:16:26 +0900
Message-ID: <CAD=HUj58w8O_XnpOSr_+VH8-evcn+y7ReWPZ-96QesXF4mUybw@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn
To: Yan Zhao <yan.y.zhao@intel.com>
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 19, 2023 at 3:35=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wro=
te:
>
> On Tue, Jul 04, 2023 at 04:50:50PM +0900, David Stevens wrote:
> > @@ -4451,7 +4461,8 @@ static int direct_page_fault(struct kvm_vcpu *vcp=
u, struct kvm_page_fault *fault
> >
> >  out_unlock:
> >       write_unlock(&vcpu->kvm->mmu_lock);
> > -     kvm_release_pfn_clean(fault->pfn);
> > +     if (fault->is_refcounted_page)
> > +             kvm_set_page_accessed(pfn_to_page(fault->pfn));
> For a refcounted page, as now KVM puts its ref early in kvm_faultin_pfn()=
,
> should this kvm_set_page_accessed() be placed before unlocking mmu_lock?
>
> Otherwise, if the user unmaps a region (which triggers kvm_unmap_gfn_rang=
e()
> with mmu_lock holding for write), and release the page, and if the two
> steps happen after checking page_count() in kvm_set_page_accessed() and
> before mark_page_accessed(), the latter function may mark accessed to a p=
age
> that is released or does not belong to current process.
>
> Is it true?

Yes, good catch. During some testing last week, I actually found this
bug thanks to the WARN_ON the first patch in this series added to
kvm_is_ad_tracked_page. I'll fix it in the next revision, after Sean
gets a chance to comment on the series.

Thanks,
David
