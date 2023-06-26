Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EA773EEB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 00:35:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ShSUUeWM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqjMz01K0z3bZ6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 08:35:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ShSUUeWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3yxkazaykdbwk62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqjLy4SNNz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 08:34:16 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c11d081de8dso3588574276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687818852; x=1690410852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vg4hZm9fpFWiBqixG4Q+f/nHkPQNxqem1yZABI6YEs=;
        b=ShSUUeWMwkrdEa66IXZbjWWZ4aBDFom9NA6fJIsGwYfKgB45x9toU7dW2ozN0p9+mU
         IqKGlPdo+TPDCHZuFfprIkuUgPJM2qLKKczAbAinwB/qUhPnNyXB1JUqXYZZ76s7rP3h
         s/Hh/OIAgzxJ0ON9PYiC7h3wb7MoqxO4DcAXYvahDQP0Xg/gAJhAV7v2VD0ioLy5eY5Q
         BxUwnE1GBKPXWY2wl+xxDYIBhbtQkIvXx8DleLSDKv1ez3DtpFpHZKPdxALD7yk67AqF
         JOhtxXvnDZ9kSnyYcddKliUend4yaF+MiUCL9VirPX3nTpK09PhK5cCBkPx3kpBnsz/T
         9Rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687818852; x=1690410852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vg4hZm9fpFWiBqixG4Q+f/nHkPQNxqem1yZABI6YEs=;
        b=QsHHCfjfFdAmcHdUFapNfqLn7X+TtAGZwLhA/ujR/H3V5WGZOm9QYVko88/rpvo4uZ
         de5iL6a6P45gUwiPdxTfjXKfwuOnGF5skSqEtSIbrN/k28OKWHnTEp1zOlcsqP+xms4C
         PkTGVYD7qTm+5zQxXIj4edI/3mRfExQePlIY7FYlbXeV+Xz2LVxaIGUcQq4IwoutGqHV
         zLkkmL/vzjrzGdoIKxeyrJTkTc9gHA+cuaw8Xqivkz4fa87kpe3u76TDlVbzuOAStC0c
         bqplibLsbAUomeWtXDefVBzH6JMytNHRUGT3Zc5ZK2eHbbmTMc4Hyny1SxZ6emQdvJ4w
         XzwQ==
X-Gm-Message-State: AC+VfDymaWJwhju9e53oB1ogv/OtB87OonbxqRLdFpsvp8WPQaZhS4KN
	586BNOApuRPxtcHyebxAD6MVxOPJlx4=
X-Google-Smtp-Source: ACHHUZ6By2nwy1N4OsGA0iP40C8/7BpgMrb+W8CG/njrH1qS7qUc13yLXXj+AhZqSxHnuO5I0vzWbc1VeaQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:e701:0:b0:c00:3434:f639 with SMTP id
 e1-20020a25e701000000b00c003434f639mr4728541ybh.1.1687818851762; Mon, 26 Jun
 2023 15:34:11 -0700 (PDT)
Date: Mon, 26 Jun 2023 15:34:10 -0700
In-Reply-To: <fc70263c-b7af-d8e0-14f4-4ffcde67aa3e@redhat.com>
Mime-Version: 1.0
References: <20230623125416.481755-1-thuth@redhat.com> <20230623125416.481755-3-thuth@redhat.com>
 <ZJWrKtnflTrskPkX@google.com> <fc70263c-b7af-d8e0-14f4-4ffcde67aa3e@redhat.com>
Message-ID: <ZJoSYnZGYrAj11RN@google.com>
Subject: Re: [kvm-unit-tests PATCH 2/2] Link with "-z noexecstack" to avoid
 warning from newer versions of ld
From: Sean Christopherson <seanjc@google.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico =?iso-8859-1?Q?B=F6hr?= <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 23, 2023, Thomas Huth wrote:
> On 23/06/2023 16.24, Sean Christopherson wrote:
> > On Fri, Jun 23, 2023, Thomas Huth wrote:
> > > Newer versions of ld (from binutils 2.40) complain on s390x and x86:
> > > 
> > >   ld: warning: s390x/cpu.o: missing .note.GNU-stack section implies
> > >                executable stack
> > >   ld: NOTE: This behaviour is deprecated and will be removed in a
> > >             future version of the linker
> > > 
> > > We can silence these warnings by using "-z noexecstack" for linking
> > > (which should not have any real influence on the kvm-unit-tests since
> > > the information from the ELF header is not used here anyway, so it's
> > > just cosmetics).
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   Makefile | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/Makefile b/Makefile
> > > index 0e5d85a1..20f7137c 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -96,7 +96,7 @@ CFLAGS += -Woverride-init -Wmissing-prototypes -Wstrict-prototypes
> > >   autodepend-flags = -MMD -MF $(dir $*).$(notdir $*).d
> > > -LDFLAGS += -nostdlib
> > > +LDFLAGS += -nostdlib -z noexecstack
> > 
> > Drat, the pull request[1] I sent to Paolo yesterday only fixes x86[2].
> 
> Oops, sorry, I did not notice that patch in my overcrowded mailboxes (or
> forgot about it during KVM forum...) :-/

Heh, you gave a Reviewed-by[*], so either its the latter, or you've got a clone
running around :-)

[*] https://lore.kernel.org/all/916aac4f-97b8-70c2-de39-87438eb4aea4@redhat.com

> > Paolo, want me to redo the pull request to drop the x86-specific patch?
> 
> I can also respin my patch on top of your series later ... the problem
> currently also only seems to happen on x86 and s390x, on ppc64 and aarch64,
> the linker does not complain ... so maybe it's even better to do it
> per-architecture only anyway? Opinions?

I don't think it makes sense to do this per-arch, other architectures likely aren't
problematic purely because of linker specific behavior, e.g. see

https://patches.linaro.org/project/binutils/patch/1506025575-1559-1-git-send-email-jim.wilson@linaro.org
