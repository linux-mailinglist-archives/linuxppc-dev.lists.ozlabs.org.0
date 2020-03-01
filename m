Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE0175208
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 04:08:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W4q16DvyzDqtd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 14:08:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CiaCaHuF; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W4nN1rVSzDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 14:07:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583118436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuiAbO2SkXe4tDJeax00CsvNvM/vImoEM31blqjC8GQ=;
 b=CiaCaHuFQb3fIclx0ASZWEwkwkNn7FnbHYHqGovb7gA/tF1qZVv0y2CIGM8AkFQaqGkHGg
 Hg9QTW0jcn6I2vXBUa37LZikYXDMmSuhfMXEVY+Ll/C+ywNWCj1i5+LhvKDJ4WwUcqegX/
 +fJck6I5SyC6TjInJW10vUD0UCF7npY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-gRt72wHUP0qPT1akVSjzLg-1; Sun, 01 Mar 2020 18:04:58 -0500
X-MC-Unique: gRt72wHUP0qPT1akVSjzLg-1
Received: by mail-wr1-f71.google.com with SMTP id y28so4814990wrd.23
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2020 15:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XuiAbO2SkXe4tDJeax00CsvNvM/vImoEM31blqjC8GQ=;
 b=XgqHIJzmERuNQXXDwYVMjm1qTppokLN4/HcnmcYrQdKFn5D5IK4eo4xl3wXpEM6VNk
 SXbSd8NqJcF8vJuzpZvTBY5cppfcToVjLacIVwNOmyVZxmRdKejB18uvoEtycx0cX02t
 URv00GHwr9qHfoprE/PpDiETX3M4ndvt4FkJsHROwJu2y8yHZVSEEg8lhRwe1tDeABnS
 iMH1zYK4lEGusSXNbVgC3Shsp0rZt9E61+INzvF5toWUuCDeJ+54uuG8Dr7nWLAPrW0A
 zqLFGu10Mrt6BweQtr5e/cpqq18kDUQzXSXw0cjJSBHKz2MhCssZ/FvoaM9YzwK7hPvw
 QY5Q==
X-Gm-Message-State: APjAAAUB+BTzO4RkcXNTy+itK0QSG4Cle1B3e+Donqwzc9smqzDk3mWn
 0YiMw4xRoAHWH5Z2itnXsLofDn4mpeMHpC0QsK7Po5dBwODjkQe3oUor9LPMDfo+gRNL3M3YQlK
 bWVJsJkbPw2KbzDiCIFDIQDurrA==
X-Received: by 2002:a5d:4450:: with SMTP id x16mr17790260wrr.242.1583103897241; 
 Sun, 01 Mar 2020 15:04:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZ81jnnpEyXE5TvNbbTV7yDlXqCyAOUV481fDaVG/wEa0g78PtTo/ZOKikXehmdYNrR5rO3w==
X-Received: by 2002:a5d:4450:: with SMTP id x16mr17790237wrr.242.1583103896891; 
 Sun, 01 Mar 2020 15:04:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e1d9:d940:4798:2d81?
 ([2001:b07:6468:f312:e1d9:d940:4798:2d81])
 by smtp.gmail.com with ESMTPSA id i204sm13279922wma.44.2020.03.01.15.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 15:04:56 -0800 (PST)
Subject: Re: [GIT PULL] Second batch of KVM changes for Linux 5.6-rc4 (or rc5)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <1583089390-36084-1-git-send-email-pbonzini@redhat.com>
 <CAHk-=wiin_LkqP2Cm5iPc5snUXYqZVoMFawZ-rjhZnawven8SA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4f115b07-7d94-da4f-edb2-f4d565c4289e@redhat.com>
Date: Mon, 2 Mar 2020 00:04:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wiin_LkqP2Cm5iPc5snUXYqZVoMFawZ-rjhZnawven8SA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/03/20 22:33, Linus Torvalds wrote:
> On Sun, Mar 1, 2020 at 1:03 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> Paolo Bonzini (4):
>>       KVM: allow disabling -Werror
> 
> Honestly, this is just badly done.
> 
> You've basically made it enable -Werror only for very random
> configurations - and apparently the one you test.
> Doing things like COMPILE_TEST disables it, but so does not having
> EXPERT enabled.

Yes, I took this from the i915 Kconfig.  It's temporary, in 5.7 I am
planning to get it to just !KASAN, but for 5.6 I wanted to avoid more
breakage so I added the other restrictions.  The difference between
x86-64 and i386 is really just the frame size warnings, which Christoph
triggered because of a higher CONFIG_NR_CPUS.

(BTW, perhaps it makes sense for Sparse to have something like __nostack
for structs that contain potentially large arrays).

> I've merged this, but I wonder why you couldn't just do what I
> suggested originally?  Seriously, if you script your build tests,
> and don't even look at the results, then you might as well use
> 
>    make KCFLAGS=-Werror

I did that and I'm also adding W=1; and I threw in a smaller than
default frame size warning option too because I don't want cpumasks on
the stack anyway.  However, that wouldn't help contributors.  I'm okay
if I get W=1 or frame size warnings from patches from other
contributors, but I think it's a disservice to them that they have to
set KCFLAGS in order to avoid warnings.

> the "now it causes problems for
> random compiler versions" is a real issue again - but at least it
> wouldn't be a random kernel subsystem that happens to trigger it, it
> would be a _generic_ issue, and we'd have everybody involved when a
> compiler change introduces a new warning.

Yes, and GCC prereleases are tested with Linux, for example by doing
full Rawhide rebuilds.  If we started using -Werror by default
(including allyesconfig), they would probably report warnings early.
Same for clang.

I hope that Linux can have -Werror everywhere, or at least a
CONFIG_WERROR option that does it even if it defaults to n for a release
or more.  But I don't think we can get there without first seeing what
issues pop up in a few subsystems or arches---even before considering
new compilers---so I decided I would just try.

Paolo

> Adding the powerpc people, since they have more history with their
> somewhat less hacky one. Except that one automatically gets disabled
> by "make allmodconfig" and friends, which is also kind of pointless.

> Michael, what tends to be the triggers for people using
> PPC_DISABLE_WERROR? Do you have reports for it? Could we have a
> _generic_ option that just gets enabled by default, except it gets
> disabled by _known_ issues (like KASAN).
> 
> Being disabled for "make allmodconfig" is kind of against one of the
> _points_ of "the build should be warning-free".

