Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0411DA6DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 03:03:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RZHq3kLhzDqXb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 11:03:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c44;
 helo=mail-oo1-xc44.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JUSfhkaK; dkim-atps=neutral
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RZGB0xzrzDqJ2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 11:01:53 +1000 (AEST)
Received: by mail-oo1-xc44.google.com with SMTP id i9so385881ool.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 18:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LuDq9zr9w9fCZ3XVYzjVFkV0xVlRh0j8ysT1ayVpGXA=;
 b=JUSfhkaKPHyf3R71r6UzDPQQFMF6PP2S6/9djTj2c3CbYKBmJAndqXGRhYH+ZRK7SZ
 JYPhzszNu+fhjI49EtydIEuqYUmcAJZa/ja1cXt2vkEEBVekwR04acgtpf4QHEDHfMtK
 N1kkVfv0FgJnRpSzHRDgMwj7QqJf7VzMwZjwGo3jZaDxocvNuuXmSsRJncA5Wlvp173T
 xJN0Ic8kIVDEqRtyivMQNGwY1Z/lS0rVPza/0qk/gDkDAyQ8KiTLTR9jV9XrcIycLZtl
 vwyfRxOq+T+lZjSc8RAjBnFSS75wG/AMklV5yZCycvd0P0T4e/de6usY6ITrsBBGzJXe
 y7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LuDq9zr9w9fCZ3XVYzjVFkV0xVlRh0j8ysT1ayVpGXA=;
 b=n+K4oc+nX31G8e9Ja3FmEqmrxyYry6fUV0eoffdxBDNyTj4aT4z8GefQVx5of4qUJK
 FAofv9YTWbxEMOGQXqdB0/99Gy8zPnURv5qoybZwsgIZKtr/Vzyg5RAZkv6SV11F3uFk
 zVISoZe3CG6erPMf4horKelfNSFwEjC1rM9NMYVZ4fxGzM0PeL4NaWHMF6nkyUNUPwHY
 7RbhGWiyebhtmUJC1+n+cd95MWhljb4MZvIQ91uX1BuBT6r29wWeb0tUAsdX5ErYiRWP
 DnwPEAyFuE8eHQJIjqPvHHh7RHl5jLa52UB+RV/jyFCLX7mk+sMXHoR72lVt038iOXAy
 HLWg==
X-Gm-Message-State: AOAM5326m5EWSf9YCxSf2NGZxQ+ZxWuMeChu//9HmloxkhIkNgtiP7JK
 eLnewmonDzJBIPpmDIklRA8=
X-Google-Smtp-Source: ABdhPJxoIWg752+ypDuUAFNxPiicTAvrQ86sb+jfzcnO0Y4wf7hYsTWp9BnkA3txvzGncCq76tf+aA==
X-Received: by 2002:a4a:831a:: with SMTP id f26mr113422oog.72.1589936509881;
 Tue, 19 May 2020 18:01:49 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id m17sm342137otr.80.2020.05.19.18.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 18:01:49 -0700 (PDT)
Date: Tue, 19 May 2020 18:01:48 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Fwd: [CRON] Broken: ClangBuiltLinux/continuous-integration#1432
 (master - 0aceafc)
Message-ID: <20200520010148.GA3327346@ubuntu-s3-xlarge-x86>
References: <ClangBuiltLinux/continuous-integration+164415390+broken@travis-ci.com>
 <5eb43a0c8d43d_13fb5db924ca0104770@travis-pro-tasks-6cc9887df6-4zmjd.mail>
 <CAKwvOdmendjEgurRBAyi4R0rDZRdwfHjddS_pfOQ6761XiiFMA@mail.gmail.com>
 <87d07fcdee.fsf@mpe.ellerman.id.au>
 <CAKwvOdn0Spc15v3WUE_rdrb5UvaTXmOvjEJOsD7ahktQOwQk+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdn0Spc15v3WUE_rdrb5UvaTXmOvjEJOsD7ahktQOwQk+A@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 19, 2020 at 05:56:32PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> Looks like our CI is still red from this:
> 
> https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/builds/166854584
> 
> Filing a bug to follow up on:
> https://github.com/ClangBuiltLinux/linux/issues/1031
> 
> On Thu, May 7, 2020 at 8:29 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Nick Desaulniers <ndesaulniers@google.com> writes:
> > > Looks like ppc64le powernv_defconfig is suddenly failing the locking
> > > torture tests, then locks up?
> > > https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/329211572#L3111-L3167
> > > Any recent changes related here in -next?  I believe this is the first
> > > failure, so I'll report back if we see this again.
> >
> > Thanks for the report.
> >
> > There's nothing newly in next-20200507 that seems related.
> >
> > Odd that it just showed up.
> >
> > cheers
> >
> >
> > > ---------- Forwarded message ---------
> > > From: Travis CI <builds@travis-ci.com>
> > > Date: Thu, May 7, 2020 at 9:40 AM
> > > Subject: [CRON] Broken: ClangBuiltLinux/continuous-integration#1432 (master
> > > - 0aceafc)
> > > To: <ndesaulniers@google.com>, <natechancellor@gmail.com>
> > >
> > >
> > > ClangBuiltLinux
> > >
> > > /
> > >
> > > continuous-integration
> > > <https://travis-ci.com/github/ClangBuiltLinux/continuous-integration?utm_medium=notification&utm_source=email>
> > >
> > > [image: branch icon]master
> > > <https://github.com/ClangBuiltLinux/continuous-integration/tree/master>
> > > [image: build has failed]
> > > Build #1432 was broken
> > > <https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/builds/164415390?utm_medium=notification&utm_source=email>
> > > [image: arrow to build time]
> > > [image: clock icon]7 hrs, 0 mins, and 54 secs
> > >
> > > [image: Nick Desaulniers avatar]Nick Desaulniers
> > > 0aceafc CHANGESET →
> > > <https://github.com/ClangBuiltLinux/continuous-integration/compare/877d002bdcfe6bc5cb0255c3c39192e8175e2c19...0aceafcfcca7c4a095957efae0939a612d755077>
> > >
> > > Merge pull request #182 from ClangBuiltLinux/i386
> > >
> > > i386
> > >
> > > Want to know about upcoming build environment updates?
> > >
> > > Would you like to stay up-to-date with the upcoming Travis CI build
> > > environment updates? We set up a mailing list for you!
> > > SIGN UP HERE <http://eepurl.com/9OCsP>
> > >
> > > [image: book icon]
> > >
> > > Documentation <https://docs.travis-ci.com/> about Travis CI
> > > Have any questions? We're here to help. <support@travis-ci.com>
> > > Unsubscribe
> > > <https://travis-ci.com/account/preferences/unsubscribe?repository=6718752&utm_medium=notification&utm_source=email>
> > > from build emails from the ClangBuiltLinux/continuous-integration
> > > repository.
> > > To unsubscribe from *all* build emails, please update your settings
> > > <https://travis-ci.com/account/preferences/unsubscribe?utm_medium=notification&utm_source=email>.
> > >
> > > [image: black and white travis ci logo] <https://travis-ci.com>
> > >
> > > Travis CI GmbH, Rigaer Str. 8, 10427 Berlin, Germany | GF/CEO: Randy Jacops
> > > | Contact: contact@travis-ci.com | Amtsgericht Charlottenburg, Berlin, HRB
> > > 140133 B | Umsatzsteuer-ID gemäß §27 a Umsatzsteuergesetz: DE282002648
> > >
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
> 

This is probably still a manifestation of
https://github.com/ClangBuiltLinux/continuous-integration/issues/262
because rekicking the tests usually fixes it.

We should probably just disable the torture tests like we do for x86_64
for CI because we do not have access to QEMU 5.0.0 where this should be
fixed. I believe it is slated for 4.2.1 as well but we still have to
wait for that to be updated and packaged in Ubuntu.

Relevant threads:

https://lore.kernel.org/linuxppc-dev/20200410205932.GA880@ubuntu-s3-xlarge-x86/

https://lore.kernel.org/qemu-devel/20200414111131.465560-1-npiggin@gmail.com/

Cheers,
Nathan
