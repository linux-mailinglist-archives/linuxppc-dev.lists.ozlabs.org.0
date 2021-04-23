Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 909E33695C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 17:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRd7Z3Qy7z30Dy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Apr 2021 01:12:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tmtZqCy5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tmtZqCy5; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRd773Yjkz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Apr 2021 01:12:03 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEDA3611BE
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619190720;
 bh=HiFp+/fV6KtN9LOlfDWZfa9Qoub4g53Rau1i3L8M0IU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tmtZqCy5UaTNYD8CumrO6wwO32nqomAH5XDbxC8d+XJuiG0w3JIIWDFOPC9w7JVri
 /SxIZFVy2UlMHtzsFDHMHSBZPGaZvD0kQWDdKSzWScK+04AM7KBahu32DU3Vu/tc3N
 LkVUUgU5Nyh5LZjO255WY+Sae+g3s7ICLSom8PF+X6d0QCWuPJc4v2xr7xQWtlEwIe
 uhHH18Sqcb/6YF35t4t2apQROaop0MuvIdOI7rXg/fu9ScdaSb9edQaHUgG46vO+R+
 qXgqaRNSyXPSejPuV4vmCuceqjoiVDZLuQa/7jt29QLbsVO8Srd2kNNbAPpNNp/uRK
 YABQ6JW2dnkUA==
Received: by mail-ej1-f47.google.com with SMTP id u17so74456455ejk.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 08:12:00 -0700 (PDT)
X-Gm-Message-State: AOAM532RjHzJtNb/niGkQ3bzUxsraCF/UW+dDjOlnQAVtnXWziXYa6ip
 DcQU0zQNczsgkgZQq1cPfN3nDx2TxfQp2Ts4Cg==
X-Google-Smtp-Source: ABdhPJwHLV5bKd8oToiLGfYb43Jwd+X0+6eCLiTOm00Km5CRO4ct0Ibbh3qk/uaJfBFavcUpQrvE8sEFEmy7HsRtm1M=
X-Received: by 2002:a17:907:70d3:: with SMTP id
 yk19mr4800031ejb.108.1619190719409; 
 Fri, 23 Apr 2021 08:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
 <87r1j3ys8i.fsf@dja-thinkpad.axtens.net>
 <875z0daz46.fsf@mpe.ellerman.id.au>
 <3a6b9c56f81e47d08e6bf70d8222725f@AcuMS.aculab.com>
In-Reply-To: <3a6b9c56f81e47d08e6bf70d8222725f@AcuMS.aculab.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Apr 2021 10:11:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJO51TQbJbvWN65vOGLgdAGP_+VPBnKLZjq_QKMChPdSw@mail.gmail.com>
Message-ID: <CAL_JsqJO51TQbJbvWN65vOGLgdAGP_+VPBnKLZjq_QKMChPdSw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
To: David Laight <David.Laight@aculab.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "lkp@intel.com" <lkp@intel.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 "bauerman@linux.ibm.com" <bauerman@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 9:42 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Michael Ellerman
> > Sent: 23 April 2021 14:51
> ...
> > > (Does anyone - and by anyone I mean any large distro - compile with
> > > local variables inited by the compiler?)
> >
> > This is where I say, "yes, Android" and you say "ugh no I meant a real
> > distro", and I say "well ...".
> >
> > But yeah doesn't help us much.
>
> And it doesn't seem to stop my phone crashing either :-)
>
> Of course, I've absolutely no way of finding out where it is crashing.
> Nor where the massive memory leaks are that means it need rebooting
> every few days.

You need a new phone. :) My Pixel3 uptime is sitting at 194 hours
currently. It would be more, but those annoying security updates
require reboots. I have had phones that I setup to reboot every night
though.

Rob
