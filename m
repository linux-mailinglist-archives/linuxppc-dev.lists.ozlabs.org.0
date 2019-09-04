Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1474CA9762
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 01:54:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P0zk12yxzDqvh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 09:54:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::144; helo=mail-lf1-x144.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="Cnu5WYs/"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P0xS333xzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 09:52:44 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id c12so415153lfh.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 16:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lkW/YWLZKFkaRlur1cRxiMMOTA0gNhHwo+TbpZCC63g=;
 b=Cnu5WYs/aAthmsXfnwtWzL5CNjpaY23sMnhFtcX1zve3r2rc/Ho+dRzPF32HPRMBnj
 gveXLtTDU7YHSGctyOcfke7l1YNaudqputmw6AJ3ZcUOsNYmqHCIu9DY9WHGlywCQ4Su
 iCCcCFmwH9f6fkeMSqS83pY7B6dx4aSlHZljU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lkW/YWLZKFkaRlur1cRxiMMOTA0gNhHwo+TbpZCC63g=;
 b=pgaqV3vTkm9VNO7hyT1OYuAFGRIlKKb+7G5jWxVq1Tj3lXXsQwRKMiPsASQW4P2gw1
 Q4Mc3q9U18CLvl25OZgace8hEIhkGdnr2RBvIA7nZPyJD6ZWWHthmRP1TyKIl28m2W+t
 WPUxx8odwpxcmXU5rt5GH58KpzJdyAFzqswcYpjFrZO+VtAOI5aRj+o9tupdZkOsEwVv
 ackkLxArEHmpJzTLLOX8dgtrvzFzdNwcS++bg4VTiJtWgEnqAgZ+o4Fbk5Cq6ItogEKp
 rFJ4IEH4B8HbUhNvML1njIwvmNVUDWR+TyYv7QfARdnQwtdRkteuVlP4YuYnZe/4lO8A
 +iPA==
X-Gm-Message-State: APjAAAVTnKqsOV7ZuHYos6GdB1aatD7QQFAB6IEvM92mqPkMwTA9+dqt
 BUrs8iQ2kZqoxmb6TYeUnGhP9DRC6x4=
X-Google-Smtp-Source: APXvYqykGbhgfSBXBLBH1o8i7IlE1E+8po07OnsWYKZFZOrlWA8cjXqI6ItGf9Br0dZB8bomYkgE0g==
X-Received: by 2002:ac2:4853:: with SMTP id 19mr377402lfy.69.1567641160581;
 Wed, 04 Sep 2019 16:52:40 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id i17sm72484lfj.35.2019.09.04.16.52.40
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2019 16:52:40 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id e17so416411ljf.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 16:52:40 -0700 (PDT)
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr127121lja.180.1567640710863; 
 Wed, 04 Sep 2019 16:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-11-cyphar@cyphar.com>
 <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com>
 <20190904214856.vnvom7h5xontvngq@yavin.dot.cyphar.com>
 <CAHk-=wgcJq21Hydh7Tx5-o8empoPp7ULDBw0Am-du_Pa+fcftQ@mail.gmail.com>
 <20592.1567636276@warthog.procyon.org.uk>
 <CAHk-=wg7Wq1kj8kZ+SSpfU_o991woW60NWca9yBA2ccs2eNx8Q@mail.gmail.com>
 <20190904232911.GN1131@ZenIV.linux.org.uk>
In-Reply-To: <20190904232911.GN1131@ZenIV.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Sep 2019 16:44:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjx3y1Y7iE6T0yiERc8G5iT1sTABWbX_nFxw9NVHCFCPA@mail.gmail.com>
Message-ID: <CAHk-=wjx3y1Y7iE6T0yiERc8G5iT1sTABWbX_nFxw9NVHCFCPA@mail.gmail.com>
Subject: Re: [PATCH v12 10/12] namei: aggressively check for nd->root escape
 on ".." resolution
To: Al Viro <viro@zeniv.linux.org.uk>
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 David Howells <dhowells@redhat.com>, linux-parisc@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux API <linux-api@vger.kernel.org>, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Linux Containers <containers@lists.linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 4, 2019 at 4:29 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Wed, Sep 04, 2019 at 03:38:20PM -0700, Linus Torvalds wrote:
> > On Wed, Sep 4, 2019 at 3:31 PM David Howells <dhowells@redhat.com> wrote:
> > >
> > > It ought to be reasonably easy to make them per-sb at least, I think.  We
> > > don't allow cross-super rename, right?
> >
> > Right now the sequence count handling very much depends on it being a
> > global entity on the reader side, at least.
> >
> > And while the rename sequence count could (and probably should) be
> > per-sb, the same is very much not true of the mount one.
>
> Huh?  That will cost us having to have a per-superblock dentry
> hash table; recall that lockless lockup can give false negatives
> if something gets moved from chain to chain, and rename_lock is
> first and foremost used to catch those and retry.  If we split
> it on per-superblock basis, we can't have dentries from different
> superblocks in the same chain anymore...

That's exactly the "very much depends on it being a global entity on
the reader side" thing.

I'm not convinced that's the _only_ way to handle things. Maybe a
combination of (wild handwaving) per-hashqueue sequence count and some
clever scheme for pathname handling could work.

I've not personally seen a load where the global rename lock has been
a problem (very few things really do a lot of renames), but
system-wide locks do make me nervous.

We have other (and worse) ones. tasklist_lock comes to mind.

             Linus
