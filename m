Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72493A0A1E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 04:41:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0BDv1sBHz3bwc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 12:41:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=syy+MK4m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=syy+MK4m; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0BDP3Grpz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 12:40:36 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id b11so26909833edy.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 19:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p+D0KtrR3ySKv9LEuftUeYWRIhXsDsdXtnrq6QYaDHk=;
 b=syy+MK4mAE5Ta3E44ycW61wKy+jm9LP5Fc8EsQgZPGGAsTggdfkkW77kT5EhJwXDKl
 I+XPhfw/dXEghiCZs+YwRrNu+QpDXlaSfO/oKAb3I25xjfc8AB1U4a1ug6DK5nq6fYyd
 z9Ahfz+gjJW/7LpiY87jTM3q+tmyvsVG2oHfqF/LMJWBYmBstCFvwwO3/CP2by6a4IoJ
 sYhO8Ck/O8z3eqgK6CIN/U8YILwblIfkNFy6M7Q/dd80PdTlxn/YDmRgNboQf0VetYHO
 CGv/VWscu7/9Z3LqyQEyL2oBD8RrzzNvbEnOuZ+GEyqpWIc0GYBpGEuy4OTtiwh7w7tj
 FGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p+D0KtrR3ySKv9LEuftUeYWRIhXsDsdXtnrq6QYaDHk=;
 b=aXN/fz+P7aZ9zU5amzIDRjG+sD3oyDMArqfoHk+iBKGU1xLOmEHhhyzHHCexVumSPP
 h46juXVYkbu+4yGFcMUSyZOk6k06MSaEqSk2M8OZAtQPWhruV1VCkYg4KjdUfY6u/Hrd
 MZibObzumx7YVDZRQK7jGi/nuzEkVCLjaW0dJTueRmsbH8+VM++pDCxl3CjqUG+Ukg12
 bqh3GXrSLFhafD1hRDvvzFfAkkHiN3yrv/6WX//ye+oEXIMlZFZJRm3eJZ9apfC0/4oC
 JCs9YzitvBYuxymTHvYf2/VqZYOqDo/hn/w9zzLVZiPb6u/TA/Cwlei1y9oYZkMH+4Lt
 n38g==
X-Gm-Message-State: AOAM531GSlmDdqNPbdT6sg13fzX865TrQgdwOr2tpx92MF7RBO4xX/yv
 uFB0j46sczPOHJ8HD3rh9Rg3AaPvBim4SKNlQHhm
X-Google-Smtp-Source: ABdhPJwft6pcgB0QhLBi7pt1iV0pHMufLyRKQEjEH8t6ci5z3HEcu7wmJlWNIAy6UnuWowq/YZCxYIxjO4ZEPjn7Lg0=
X-Received: by 2002:a05:6402:348f:: with SMTP id
 v15mr16610509edc.135.1623206426948; 
 Tue, 08 Jun 2021 19:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <CAFqZXNsh9njbFUNBugidbdiNqD3QbKzsw=KgNKSmW5hv-fD6tA@mail.gmail.com>
 <CAHC9VhQj_FvBqSGE+eZtbzvDoRAEbbo-6t_2E6MVuyiGA9N8Hw@mail.gmail.com>
 <CAFqZXNsVFv2yh5cXwWYXscYTAuoCKk4H-JbPAYzDbwKUzSDP3A@mail.gmail.com>
In-Reply-To: <CAFqZXNsVFv2yh5cXwWYXscYTAuoCKk4H-JbPAYzDbwKUzSDP3A@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 8 Jun 2021 22:40:15 -0400
Message-ID: <CAHC9VhSNWK11f+u8v+MN0VHC3_4u+30jom80rwaat8OsJKo5fQ@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To: Ondrej Mosnacek <omosnace@redhat.com>
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
Cc: SElinux list <selinux@vger.kernel.org>,
 network dev <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Steven Rostedt <rostedt@goodmis.org>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 8, 2021 at 7:02 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> On Thu, Jun 3, 2021 at 7:46 PM Paul Moore <paul@paul-moore.com> wrote:

...

> > It sounds an awful lot like the lockdown hook is in the wrong spot.
> > It sounds like it would be a lot better to relocate the hook than
> > remove it.
>
> I don't see how you would solve this by moving the hook. Where do you
> want to relocate it?

Wherever it makes sense.  Based on your comments it really sounded
like the hook was in a bad spot and since your approach in a lot of
this had been to remove or disable hooks I wanted to make sure that
relocating the hook was something you had considered.  Thankfully it
sounds like you have considered moving the hook - that's good.

> The main obstacle is that the message containing
> the SA dump is sent to consumers via a simple netlink broadcast, which
> doesn't provide a facility to redact the SA secret on a per-consumer
> basis. I can't see any way to make the checks meaningful for SELinux
> without a major overhaul of the broadcast logic.

Fair enough.

-- 
paul moore
www.paul-moore.com
