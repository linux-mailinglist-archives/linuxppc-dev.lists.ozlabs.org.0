Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7312C668A8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 05:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtScS2pzDz3fC3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 15:10:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=YZomyCx9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=YZomyCx9;
	dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtSbV3qGkz3bTM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 15:09:08 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id e22so5757832qts.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 20:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EXUMvVNfXG4qSkejYmhEflbNl3f1wy9uAsg7bFSwbSc=;
        b=YZomyCx9zkrAbhPakcudoYBPZQ8rkARTHLtKi53pDnaU6mgLGZa3xZIRDUHeRfmNce
         GC1P6x1PEISxajWTwyAnBGitw9C9AP8NxUWXwmpcBLQQFp+crCOndn1tsVb6xKlm4KyD
         av00SfY68vg8S2VYP+YhHBi3oHDyAFOENLTVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXUMvVNfXG4qSkejYmhEflbNl3f1wy9uAsg7bFSwbSc=;
        b=ynU1ExT6JOMxspNfr8l0PQw5q6HwWkW/cwDgBr2j9JSKZuGpzlTVTnVDdL7cbmqdaZ
         oTR+g7/gqteR+jJOm21CUjsoDBoDTlgg+qHNluoGLU/CfdMajovQrSeT0EC1DDUaKlbv
         lkwgJn3RlRNQOxeYWwcizcKWmYx9nQ4eyM5ox16rN8JDDVi7/nhgLILTvfEqNPDo0N3T
         uSxw8ZOz2AaN4fK5JqnZ+FG58CA+BcIdKaKguuQMQqPK0S37BuoqYzANb3DdTPPN32ZW
         2zFn4FYeFSArBBeauUrS8YvvePp5wLM5YJzkm+oDv9O88Abuo6awK9+mr/DqxZn8gHrD
         snRg==
X-Gm-Message-State: AFqh2ko1zSuu168INGtWIg4VA5DO+r25S6xKMHt/kUNYE8SXkLShusVI
	Z/4axOOEA88ifLZSwiJNliHqk3wJ9SkaynjqsT4=
X-Google-Smtp-Source: AMrXdXv6b4PlISeFWe4HA/LkaynagLLRRTuyHzkzurmPO45GZUX2lOy8ZREWG7FNcAAe0Tx4ee38sw==
X-Received: by 2002:a05:622a:1f91:b0:3a5:460f:9650 with SMTP id cb17-20020a05622a1f9100b003a5460f9650mr124157560qtb.46.1673582945606;
        Thu, 12 Jan 2023 20:09:05 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id s10-20020a05620a29ca00b006fcb77f3bd6sm12101582qkp.98.2023.01.12.20.09.04
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 20:09:04 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id p96so2006819qvp.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 20:09:04 -0800 (PST)
X-Received: by 2002:a05:6214:5e87:b0:532:2dd4:825d with SMTP id
 mm7-20020a0562145e8700b005322dd4825dmr1103173qvb.94.1673582944399; Thu, 12
 Jan 2023 20:09:04 -0800 (PST)
MIME-Version: 1.0
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
 <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com> <CAGudoHE0tzL8OAqvwpDR4Nn_g70a8qBdE_+-fmhXF-DEx_K6kg@mail.gmail.com>
In-Reply-To: <CAGudoHE0tzL8OAqvwpDR4Nn_g70a8qBdE_+-fmhXF-DEx_K6kg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Jan 2023 22:08:48 -0600
X-Gmail-Original-Message-ID: <CAHk-=wgEhGotFkQwTc5YiuQAc6Y0qiAkRXHsvSepkhkKb6jXpA@mail.gmail.com>
Message-ID: <CAHk-=wgEhGotFkQwTc5YiuQAc6Y0qiAkRXHsvSepkhkKb6jXpA@mail.gmail.com>
Subject: Re: lockref scalability on x86-64 vs cpu_relax
To: Mateusz Guzik <mjguzik@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, tony.luck@intel.com, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Jan Glauber <jan.glauber@gmail.com>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 12, 2023 at 7:12 PM Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> I did not want to make such a change without redoing the ThunderX2
> benchmark, or at least something else arm64-y. I may be able to bench it
> tomorrow on whatever arm-y stuff can be found on Amazon's EC2, assuming
> no arm64 people show up with their results.

I don't think ThunderX2 itself is particularly interesting, but sure,
it would be good to have numbers for some modern arm64 cores.

The newer Amazon EC2 cores (Graviton 2/3) sound more relevant (or
Ampere?)  The more different architecture numbers we'd have for that
"remove cpu_relax()", the better.

                   Linus
