Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02D39CA78
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 20:18:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fy7Cr1B7lz30Fl
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 04:18:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dq91qTUD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=dq91qTUD; 
 dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fy7CF0cshz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 04:17:26 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 131so16017326ljj.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Jun 2021 11:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hWseLMsHC1Tl+tjltvawHbNPgfRx7qxCEi8/dkUNOU4=;
 b=dq91qTUDZfLAHHlQj01Xackwp7mLXGslcYSqKR8QjQWjay1MPlIiBx9Q2OjLRJv3Ny
 tUvoHIhp+fIOQUEt5cgx436HWwJytvd/+6hnvkb9my5cWuHI21RlTnevNOOSMWGTQ9Xp
 QlUNP5FJUEwnP+uHbMzVIztOiIoJLIajgm2Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hWseLMsHC1Tl+tjltvawHbNPgfRx7qxCEi8/dkUNOU4=;
 b=F8unSVu98MOxSptc7NlxsXFVEhWgxpTTuu2LYuwk6LlRamZFJAvgdei088RHXsXrto
 y3Uj1UcXyy9VfCD7i+NO2aQwpsmKdfwsm0aj0IwtBEDIeKkNEDcpyVZEnII45C+7UHoD
 8LqVavu+9rN03UNzAy23xWIaSzgFGf5qBfekijGODpS6dOUXqSeXV9edZHNhhwX39KgZ
 h1NXUTA4q4fXiHZfQd5dcCq1hrzcynZo6Em4XebooKhhZ9RNMnELGj03btumcoYGMoup
 LrHEcv/E8RU1ygqrEC/a9zPFIo+QIIfQ75Lnt/TkFZW2SykIFkaGzZ4PjEiAkzWz93wX
 1n9w==
X-Gm-Message-State: AOAM530cfWKhyHokj/sN2SGmOUEpKP7JngYSY59o4fDGPyHkwhmjfW6n
 GQhWLJpxKmCoCKPBT3jgFv7Vln3JYwZGAslzD1g=
X-Google-Smtp-Source: ABdhPJxDQ9376fYsncGsNm4YWDYIA7Uai1UA8MgZwGtVIqer0dF81HQBhEnNwaay54Mooo+XQ+6YeQ==
X-Received: by 2002:a2e:331a:: with SMTP id d26mr8227665ljc.249.1622917039216; 
 Sat, 05 Jun 2021 11:17:19 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id w21sm1143869ljo.41.2021.06.05.11.17.18
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 11:17:18 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id a2so19049729lfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Jun 2021 11:17:18 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id
 a11mr6305938lfs.377.1622917038058; 
 Sat, 05 Jun 2021 11:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net>
 <CAHC9VhR-kYmMA8gsqkiL5=poN9FoL-uCyx1YOLCoG2hRiUBYug@mail.gmail.com>
 <c7c2d7e1-e253-dce0-d35c-392192e4926e@iogearbox.net>
 <CAHC9VhS1XRZjKcTFgH1+n5uA-CeT+9BeSP5jvT2+RE5ougLpUg@mail.gmail.com>
 <2e541bdc-ae21-9a07-7ac7-6c6a4dda09e8@iogearbox.net>
 <CAHC9VhT464vr9sWxqY3PRB4DAccz=LvRMLgWBsSViWMR0JJvOQ@mail.gmail.com>
 <3ca181e3-df32-9ae0-12c6-efb899b7ce7a@iogearbox.net>
 <CAHC9VhTuPnPs1wMTmoGUZ4fvyy-es9QJpE7O_yTs2JKos4fgbw@mail.gmail.com>
 <f4373013-88fb-b839-aaaa-3826548ebd0c@iogearbox.net>
 <CAHC9VhS=BeGdaAi8Ae5Fx42Fzy_ybkcXwMNcPwK=uuA6=+SRcg@mail.gmail.com>
 <c59743f6-0000-1b15-bc16-ff761b443aef@iogearbox.net>
 <CAHC9VhT1JhdRw9P_m3niY-U-vukxTWKTE9q6AMyQ=r_ohpPxMw@mail.gmail.com>
 <CAADnVQ+0bNtDj46Q8s-h=rqJgZz2JaGTeHpbmof3e7fBBQKuDQ@mail.gmail.com>
 <64552a82-d878-b6e6-e650-52423153b624@schaufler-ca.com>
In-Reply-To: <64552a82-d878-b6e6-e650-52423153b624@schaufler-ca.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Jun 2021 11:17:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiUVqHN76YUwhkjZzwTdjMMJf_zN4+u7vEJjmEGh3recw@mail.gmail.com>
Message-ID: <CAHk-=wiUVqHN76YUwhkjZzwTdjMMJf_zN4+u7vEJjmEGh3recw@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To: Casey Schaufler <casey@schaufler-ca.com>
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
Cc: Jiri Olsa <jolsa@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>,
 SElinux list <selinux@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ondrej Mosnacek <omosnace@redhat.com>, Andrii Nakryiko <andrii@kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf <bpf@vger.kernel.org>,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 5, 2021 at 11:11 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> You have fallen into a common fallacy. The fact that the "code runs"
> does not assure that the "system works right". In the security world
> we face this all the time, often with performance expectations. In this
> case the BPF design has failed [..]

I think it's the lockdown patches that have failed. They did the wrong
thing, they didn't work,

The report in question is for a regression.

THERE ARE NO VALID ARGUMENTS FOR REGRESSIONS.

Honestly, security people need to understand that "not working" is not
a success case of security. It's a failure case.

Yes, "not working" may be secure. But security in that case is *pointless*.

              Linus
