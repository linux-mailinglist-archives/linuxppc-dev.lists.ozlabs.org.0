Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3341E28F7A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 05:12:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459BJG5XsvzDqWW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 13:12:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a7Sc0Zml"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459BGn5gTfzDqW7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 13:11:29 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id m140so11695341itg.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 20:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7hznSwoqjG8X1odMBGc2satoFe87v1Y0P/9fKHS9SY=;
 b=a7Sc0ZmlEG6jC7OpcrRVUkNXq0SBb3Dc/hNdk5Vi6ayUDLd0Dm8M0wWvJFgwttZZ4M
 aninTKfSUZDRjfNGqPsMzWLja++EezX/hO4fX5nJBzfyFI6kNO7dvjypaoVQz4ys7+R5
 9IVPBxW1C4i6BRZ4f3bqLocvJh1c9QUTPILj4gipCVXMgVTUpT9LBYkMiRDL2TaalXNe
 rQ6wJugIty6JwVWYs5nF97JpvrTENcxT3PWNqVTqRhEna4JwxQokvn2SUzkeP09LHMDC
 DgccA6RcG2CmDNt2DoIHjZymnDK30hw9WxWvnBoApiNxfRbL6LLAu65RJr1Ih71O/P5e
 SodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7hznSwoqjG8X1odMBGc2satoFe87v1Y0P/9fKHS9SY=;
 b=KxDAZ83DQhWxwdJ9MWR0Pk0EvfW6gqdoxf6F/U2ihBXParLBAgDyBiXihw59UCEqYs
 VOCouX/sigypg9nN+NmWvRdjyWS+jx2s2tq4rCGXZKZB50Ej1BzxicgNt9/kQmnChD3K
 1gvtSFrbfj+tBPmAJlfUIy1GlXizZ3w8qWGxH1UkOgs9cqcouz6Aln87xiMrGiIxaxsn
 eHskKB7Xw1NHPLqmFCKv2ipEWGAANvEoCvFfLPenO90XnjOf0RQq0JcvWB0FGndC/Z5U
 zzLJi6gvn0jbEm7ZRDaGO4xiyW2f6d8rVKn/mZRK/aycA/7zdgW9TKXe8EsYmjHuooWh
 wCjQ==
X-Gm-Message-State: APjAAAW4ITIDdxEjFgtV1/cO5gDz2V3vCasfLyGvJrmlwoWySAmMJVtu
 HQsE9GkGpmAag9NYjhQJ3bv6ourgJRzkBFBInA==
X-Google-Smtp-Source: APXvYqz4ssg3ircx9GKZ/bOQFSdzkDIVdQtquf3WB1GzGhZLWMOO7FDaVjBjQGy32wO2lRBtVYsHwdCKMGdQi1fBKFw=
X-Received: by 2002:a24:1dce:: with SMTP id 197mr16766439itj.16.1558667486023; 
 Thu, 23 May 2019 20:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <1556087581-14513-1-git-send-email-kernelfans@gmail.com>
 <10dc5468-6cd9-85c7-ba66-1dfa5aa922b7@suse.com>
 <CAFgQCTstd667wP6g+maxYekz4u3iBR2R=FHUiS1V=XxTs6MKUw@mail.gmail.com>
 <CAFgQCTtQm7SuBRfXik6B065Aa+uQ=Mx6i+Y1q+NJU1GEiUgH4g@mail.gmail.com>
In-Reply-To: <CAFgQCTtQm7SuBRfXik6B065Aa+uQ=Mx6i+Y1q+NJU1GEiUgH4g@mail.gmail.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Fri, 24 May 2019 11:11:13 +0800
Message-ID: <CAFgQCTuAEbST8ZdSJmPDTPbqkL3uZ8j6U-vTWT879wARDhUwTw@mail.gmail.com>
Subject: Re: [PATCHv2] kernel/crash: make parse_crashkernel()'s return value
 more indicant
To: Matthias Brugger <mbrugger@suse.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Julien Thierry <julien.thierry@arm.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Logan Gunthorpe <logang@deltatee.com>,
 linux-s390@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Dave Young <dyoung@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Will Deacon <will.deacon@arm.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Borislav Petkov <bp@alien8.de>, David Hildenbrand <david@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Tony Luck <tony.luck@intel.com>, Baoquan He <bhe@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 Thomas Bogendoerfer <tbogendoerfer@suse.de>,
 Paul Burton <paul.burton@mips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Greg Hackmann <ghackmann@android.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Matthias, ping? Any suggestions?

Thanks,
Pingfan


On Thu, May 2, 2019 at 2:22 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> On Thu, Apr 25, 2019 at 4:20 PM Pingfan Liu <kernelfans@gmail.com> wrote:
> >
> > On Wed, Apr 24, 2019 at 4:31 PM Matthias Brugger <mbrugger@suse.com> wrote:
> > >
> > >
> > [...]
> > > > @@ -139,6 +141,8 @@ static int __init parse_crashkernel_simple(char *cmdline,
> > > >               pr_warn("crashkernel: unrecognized char: %c\n", *cur);
> > > >               return -EINVAL;
> > > >       }
> > > > +     if (*crash_size == 0)
> > > > +             return -EINVAL;
> > >
> > > This covers the case where I pass an argument like "crashkernel=0M" ?
> > > Can't we fix that by using kstrtoull() in memparse and check if the return value
> > > is < 0? In that case we could return without updating the retptr and we will be
> > > fine.
> After a series of work, I suddenly realized that it can not be done
> like this way. "0M" causes kstrtoull() to return -EINVAL, but this is
> caused by "M", not "0". If passing "0" to kstrtoull(), it will return
> 0 on success.
>
> > >
> > It seems that kstrtoull() treats 0M as invalid parameter, while
> > simple_strtoull() does not.
> >
> My careless going through the code. And I tested with a valid value
> "256M" using kstrtoull(), it also returned -EINVAL.
>
> So I think there is no way to distinguish 0 from a positive value
> inside this basic math function.
> Do I miss anything?
>
> Thanks and regards,
> Pingfan
