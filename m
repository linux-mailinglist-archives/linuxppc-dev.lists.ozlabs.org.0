Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEAADCEE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 21:02:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vwQK0WTfzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 06:02:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZI5aiYWM"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vwMw6gPCzDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 06:00:28 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id 83so6129041oii.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=t99ObJB56KhBS/WNpgsgAnYcJ+G543s7eRggbvF+GSc=;
 b=ZI5aiYWM+xn39N9ZL4bzOc/HegZiWV9I8vBroRd4GUo4BX8a7uWfmvRi1rOlQ0yOrm
 F2179cWsuL18gEZhsafeFRl2Kd1ODlkoge3lflx7dcGTLhP5mUamYddeu5/X3VGr74F9
 VWi93Dqdvc2LrlYCPsfEqE5NP58rgHfjloniDzkqOnOP4qFHLzxyCRYDZeJhxSQ0dQNg
 XzdQ6ua1WZ61PFAu9IJbUwo1iVS70dOWIMPFL7LvxLeUbsw1NOGnUy3xQ+qNVitnWQbW
 tfJfJJ/on8S90wHJ0FlTGGVjqegtf10GO1HyEhdxyJShol9qzaWIQXbdtRMuLFIdRj+G
 bttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=t99ObJB56KhBS/WNpgsgAnYcJ+G543s7eRggbvF+GSc=;
 b=a8Ez7hmhsiPvs5OJI3zVn7CrnFr0ulK1P8XmLnpqnZ2DIzDIeUh1UXrn+Ljr19K81z
 +dDHdO0C5zViGMuDbioPuM9pbdwE7UXYrbwLJ82Sg6WPzVWiN70omvyeAwnDfj+N0Fh9
 twU5ZywydxCxnXnP3XQuAabpZcIgfAyOlqTeOnuVzDVlzwmkTykAIZ3E5Sdqc6gVFs8y
 9R7POMXiU9eTM3sBBb45TnN8+7iqWJZK5z8JbCKN6Gg143kq2bSluCIr/cC6uoDzumkM
 pWT85eZUyH6qSccR4p/oW0bk2gj3WqoS/dx0ArtOfpgwxFk9356Wd+3aAelJoBZO7svb
 Phsw==
X-Gm-Message-State: APjAAAX5DU9L1pj6cutiPKcOJlfZX5QUX4GSY4R9A5bHBSBrrPesBl9k
 rHdc8RP9sDWcCXjkL878jaw=
X-Google-Smtp-Source: APXvYqzCUlmptopKF+iqEPn/QEAG2McNNSZzczXsm6/Z8KP5BPeeLepxWUZOBD8o9+Z2WvXmnnIjSw==
X-Received: by 2002:aca:1b04:: with SMTP id b4mr2309849oib.81.1571425224537;
 Fri, 18 Oct 2019 12:00:24 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id u14sm1745760otj.61.2019.10.18.12.00.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Oct 2019 12:00:23 -0700 (PDT)
Date: Fri, 18 Oct 2019 12:00:22 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v4 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
Message-ID: <20191018190022.GA1292@ubuntu-m2-xlarge-x86>
References: <20190911182049.77853-1-natechancellor@gmail.com>
 <20191014025101.18567-1-natechancellor@gmail.com>
 <20191014025101.18567-4-natechancellor@gmail.com>
 <20191014093501.GE28442@gate.crashing.org>
 <CAKwvOdmcUT2A9FG0JD9jd0s=gAavRc_h+RLG6O3mBz4P1FfF8w@mail.gmail.com>
 <20191014191141.GK28442@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014191141.GK28442@gate.crashing.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 14, 2019 at 02:11:41PM -0500, Segher Boessenkool wrote:
> On Mon, Oct 14, 2019 at 08:56:12AM -0700, Nick Desaulniers wrote:
> > On Mon, Oct 14, 2019 at 2:35 AM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> > >
> > > On Sun, Oct 13, 2019 at 07:51:01PM -0700, Nathan Chancellor wrote:
> > > > r374662 gives LLVM the ability to convert certain loops into a reference
> > > > to bcmp as an optimization; this breaks prom_init_check.sh:
> > >
> > > When/why does LLVM think this is okay?  This function has been removed
> > > from POSIX over a decade ago (and before that it always was marked as
> > > legacy).
> > 
> > Segher, do you have links for any of the above? If so, that would be
> > helpful to me.
> 
> Sure!
> 
> https://pubs.opengroup.org/onlinepubs/9699919799/xrat/V4_xsh_chap03.html
> 
> Older versions are harder to find online, unfortunately.  But there is
> 
> https://kernel.org/pub/linux/docs/man-pages/man-pages-posix/
> 
> in which man3p/bcmp.3p says:
> 
> FUTURE DIRECTIONS
>        This function may be withdrawn in a future version.
> 
> Finally, the Linux man pages say (man bcmp):
> 
> CONFORMING TO
>        4.3BSD.   This  function   is   deprecated   (marked   as   LEGACY   in
>        POSIX.1-2001): use memcmp(3) in new programs.  POSIX.1-2008 removes the
>        specification of bcmp().
> 
> 
> > I'm arguing against certain transforms that assume that
> > one library function is faster than another, when such claims are
> > based on measurements from one stdlib implementation.
> 
> Wow.  The difference between memcmp and bcmp is trivial (just the return
> value is different, and that costs hardly anything to add).  And memcmp
> is guaranteed to exist since C89/C90 at least.
> 
> > The rationale for why it was added was that memcmp takes a measurable
> > amount of time in Google's fleet, and most calls to memcmp don't care
> > about the position of the mismatch; bcmp is lower overhead (or at
> > least for our libc implementation, not sure about others).
> 
> You just have to do the read of the last words you compare as big-endian,
> and then you can just subtract the two words, convert that to "int" (which
> is very inconvenient to do, but hardly expensive), and there you go.
> 
> Or on x86 use the bswap insn, or something like it.
> 
> Or, if you use GCC, it has __builtin_memcmp but also __builtin_memcmp_eq,
> and those are automatically used, too.
> 
> 
> Segher

Just as an FYI, there was some more discussion around the availablity
and use of bcmp in this LLVM bug which spawned
commit 5f074f3e192f ("lib/string.c: implement a basic bcmp").

https://bugs.llvm.org/show_bug.cgi?id=41035#c13

I believe this is the proper solution but I am fine with whatever works,
I just want our CI to be green without any out of tree patches again...

Cheers,
Nathan
