Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D627332B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 21:52:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwFTF3M4WzDqvD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 05:52:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MzlFGtZx; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwFRG3g1RzDqRm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 05:50:32 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id u13so9964700pgh.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 12:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hfum0xk/RZI5/Ob/LotdK/fUqBVcECeLZPhlAXF7GSA=;
 b=MzlFGtZxMRR3IzQFO78/27PAi9Tln8PEKmg4AWR1bn4Yo/X9UINdsoC9HczWeOPzK7
 QNTmfcvvkJG792tUX68D4WrnSFP9CgJoYPCVFNR3GKZ+FyLm9t8ZFvvG1E2VbgZ5QAOS
 +fB2gXbEHSaAuwNmKSv0Pd9zLHo+Oakazz/3+sTuhR7vJmpMwG3RSQFWLIHrAFmxsCGF
 rqx+I3MNILJxZtgM/ON8s9FbFBrflmYiKAX23PoTz6WxO8eG+V87SwM9NqDKQlik6d31
 oPGbYOdDpITjhl+sn2utDDkLbhUp7n/Am/HwVzM1DY93mI1ZfI1r1BvJTjtfivUMY2U6
 ZKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hfum0xk/RZI5/Ob/LotdK/fUqBVcECeLZPhlAXF7GSA=;
 b=RfE5aC757HbkMrppfE/k/XGai5m/68W6mSJAObgn3cH3azAi4ZGNEqfmTEoY/k0xLi
 Hgz9NyOPTjdH2Y2iGZhW1uPFMmm3UIbWr6Cb0sw8cX8KaWwXtokiou7lKPyZhTUIxmWE
 yqwbfWBTBzu5i9919TkaTua6tbvMi2YMyY9bdgrRWBZROoZcCakIPFfKkH70Mst1T09v
 xPJf0xUmfJ+wx3ao1KMqbQH1DBSgK7iCWuzj3nY5xNVED+HtESOm7A/wzfrjg0HmsNn1
 ZuTRRG69OlVV8UTn6lbjjZK+wR9RLJcXu9epSrR6xF9C8AhUX4amxijMivAZ6ZRw995c
 0yQg==
X-Gm-Message-State: AOAM532KFUomGTCrBO92zbMLJnWH9FKTrsvEwY3AhJQJ+PpS4U2+3E9e
 1mIjJaQIknZW9PPlUbQxQIZwOG0mjInH2pB6lfy8zg==
X-Google-Smtp-Source: ABdhPJz0K7J9Kcn11+9meMrf3vRxVrLQJR4W3Bic2SiC1mK4LkwttbXKUrEWzTmF/9m2Ua801TzhyzK2CS2WC7W1H4g=
X-Received: by 2002:a62:5586:0:b029:13e:d13d:a108 with SMTP id
 j128-20020a6255860000b029013ed13da108mr1208250pfb.36.1600717828686; Mon, 21
 Sep 2020 12:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdkGd6mPw_OKHwmpVs_xxFW2oqAoXyr7M8hu3PCCwkqCEQ@mail.gmail.com>
 <CAPcyv4jZfbuS8zHZXBNqRTi_1HzHLUztkxDmsruMk5PGinGhPg@mail.gmail.com>
In-Reply-To: <CAPcyv4jZfbuS8zHZXBNqRTi_1HzHLUztkxDmsruMk5PGinGhPg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 21 Sep 2020 12:50:17 -0700
Message-ID: <CAKwvOdnVeAFu_Zb2KNuCUcVRWcqsX9r855uyKAMR4+FM8LTdoQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYZGF4X3N1cHBvcnRlZOKAmQ==?=
To: Dan Williams <dan.j.williams@intel.com>
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
Cc: Dave Jiang <dave.jiang@intel.com>, "kernelci.org bot" <bot@kernelci.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 11:47 AM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Mon, Sep 21, 2020 at 11:35 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Hello DAX maintainers,
> > I noticed our PPC64LE builds failing last night:
> > https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/388047043
> > https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/388047056
> > https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/388047099
> > and looking on lore, I see a fresh report from KernelCI against arm:
> > https://lore.kernel.org/linux-next/?q=dax_supported
> >
> > Can you all please take a look?  More concerning is that I see this
> > failure on mainline.  It may be interesting to consider how this was
> > not spotted on -next.
>
> The failure is fixed with commit 88b67edd7247 ("dax: Fix compilation
> for CONFIG_DAX && !CONFIG_FS_DAX"). I rushed the fixes that led to
> this regression with insufficient exposure because it was crashing all
> users. I thought the 2 kbuild-robot reports I squashed covered all the
> config combinations, but there was a straggling report after I sent my
> -rc6 pull request.
>
> The baseline process escape for all of this was allowing a unit test
> triggerable insta-crash upstream in the first instance necessitating
> an urgent fix.

No worries; just checking that failures are root-caused.  I see it on
top of v5.9-rc6:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/.
I don't see it on -next today, but assume it will be there tomorrow.
Thanks for the info.
-- 
Thanks,
~Nick Desaulniers
