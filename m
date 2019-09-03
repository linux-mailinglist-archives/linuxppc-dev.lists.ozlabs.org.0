Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48971A60E2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 07:57:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mx7f1M11zDqY2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 15:57:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ys9Y1fQI"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mx5Y1gJVzDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 15:55:58 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id h7so14644402wrt.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 22:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=X7sSiUySVZV9o7/lrwJkuFeTAt0kOUYd/2rnVcX4C8w=;
 b=Ys9Y1fQIYN15V0apg8nw2x0mdkLG1gGNdLtlgz4yLuv9IaPS1KM1uIJ8JN37YtoltE
 l8m2NDUGfIn0E5p4sarsomM9ekjwyWsHsGnAUD5wkCtuvsEbywJGCy1q+CDsMJrIYNCq
 Lh6kM0IYyvOWZoWc62AfycTE0J7CU6MwvpmfPExJ7BjxJZGNPfCfYqfF59G8B/9AvTZV
 IxhS+n5aKbC1rVX+jOnVOQvJG5nrFZnCbpYfYjlPcQmQYmtXkc4qvJlrFWSLocMFeqDg
 WTRxJ1TqYC6NiivsiaabMgS91UanJWDR3VngBpHqlgCIHu81YQ49cfa6u1eu05K0Vh8g
 F24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X7sSiUySVZV9o7/lrwJkuFeTAt0kOUYd/2rnVcX4C8w=;
 b=AHMbBYX86dcv0PiGAl0mNDioOzvoGW/Oz1LWeu7HKwGrS6n+Cz3eKSNf1C36hPRecn
 C4mJLM+OLk2fbj5ffeRcRFvLu/9hpYLcgLvhVLZrlYRPWHYpRNJtRm/A0rYWgzIAM+Nt
 rgbgUH1zZy44dbO+1haJSD+IYAci2qp/n2yeJjzIGuT+AOvItPUVNU52kxNYyITMIc2T
 MD4u/x/ky1+sNurAtfAPh77am8AfshOFM6mJbMCgN/NfYbmu0fFmnWCR+EClSF528JdL
 n4BSq6Yuyqnw+NLmk0Lv1szG10fnPEDzpefkSttwovyKf4E8BdbZS6b550E+qWLFnF5r
 4fLQ==
X-Gm-Message-State: APjAAAUvK/gHAJrXpJNE1f0egKeYqdnB906BCxaPDJI2kmnmxzyzlz1U
 LlhNECDkGGm9F4LbE4yaX9Y=
X-Google-Smtp-Source: APXvYqyBhTmrTiKTpFKgVK1t14H6EtrLzraSNMVF6fR+NHY6gWzA/qnovaxj2pzBYW88+FhaukDwWQ==
X-Received: by 2002:a5d:6602:: with SMTP id n2mr10555596wru.317.1567490155857; 
 Mon, 02 Sep 2019 22:55:55 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id a130sm7848265wmf.48.2019.09.02.22.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 22:55:55 -0700 (PDT)
Date: Mon, 2 Sep 2019 22:55:53 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
Message-ID: <20190903055553.GC60296@archlinux-threadripper>
References: <20190812023214.107817-1-natechancellor@gmail.com>
 <878srdv206.fsf@mpe.ellerman.id.au>
 <20190828175322.GA121833@archlinux-threadripper>
 <CAKwvOdmXbYrR6n-cxKt3XxkE4Lmj0sSoZBUtHVb0V2LTUFHmug@mail.gmail.com>
 <20190828184529.GC127646@archlinux-threadripper>
 <6801a83ed6d54d95b87a41c57ef6e6b0@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6801a83ed6d54d95b87a41c57ef6e6b0@AcuMS.aculab.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 LKML <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 09:59:48AM +0000, David Laight wrote:
> From: Nathan Chancellor
> > Sent: 28 August 2019 19:45
> ...
> > However, I think that -fno-builtin-* would be appropriate here because
> > we are providing our own setjmp implementation, meaning clang should not
> > be trying to do anything with the builtin implementation like building a
> > declaration for it.
> 
> Isn't implementing setjmp impossible unless you tell the compiler that
> you function is 'setjmp-like' ?

No idea, PowerPC is the only architecture that does such a thing.

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/tree/arch/powerpc/kernel/misc.S#n43

Goes back all the way to before git history (all the way to ppc64's
addition actually):

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=61542216fa90397a2e70c46583edf26bc81994df

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/arch/ppc64/xmon/setjmp.c?id=5f12b0bff93831620218e8ed3970903ecb7861ce

I would just like this warning fixed given that PowerPC builds with
-Werror by default so it is causing a build failure in our CI.

Cheers,
Nathan
