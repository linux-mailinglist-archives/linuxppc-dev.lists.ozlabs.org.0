Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9019CD82
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 01:33:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tfWh6Gh4zDrfM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 10:33:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RU7KK9hh; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tfTp5tG3zDqfd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 10:31:42 +1100 (AEDT)
Received: by mail-il1-x141.google.com with SMTP id i75so5415297ild.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 16:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jmXWSnZFrGmmooR0jk9MQKfEVRvqr4Bhu0RmJo6EKnI=;
 b=RU7KK9hhnWQJ37k68Oi3oIEBbXk/64ZO2mh73lxhk7GTlRqey4MxSgxLfvF3eU4HqV
 +t+7bc0tVqKgfh06b3PP78MbdPAsUHqAtLBknJWTZ8RvMmDjpI/v1Vch4E7CJCZPyA63
 L3XUGRqhzy0Hx4URAzBCSIn/0sV4q/oM/C7hExlaNjLGXTCVc4dG1qceJvhiqFEm/UYC
 NYLs0iA9ZC9+lP+5dWVwBJCQ/Y2Ee9kCnAxXWVue+h1ynLNzgC6POAuoC2qo1VMHX72D
 X7r73yxULfTxkMLLEsjFzcU1jpbimQTZtMyilSANjjyIRHnfCL03W5cABR2zVVWi8suK
 Bnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jmXWSnZFrGmmooR0jk9MQKfEVRvqr4Bhu0RmJo6EKnI=;
 b=eZY+wLARa/3ARtnAQ1IwcKjy3abw0evATd0axTXZGe46GL5Kn5PvYjpRX5JF70aj/h
 J9pxp59ixTMXSfgJnJ4sdsSY9zTSBOp9PRyiqAnUSHIqHVQxx9sc45jpBXEhIKmdtDS0
 gvxt7+ebU2O9Vicf5dXo58Axc1+VwIa+Horruxp/aOH/lvquIiSgckeuMQZH7teHHlfS
 eRATIGNwhh9ESMmTdRWHFAGayRjF1z+139IgGYl6O0/G7liTpk/eJ1e46XuUdxFMGg2E
 cb9zb6iCmPLkuZSA4RB3TJiKVjM3xYccvgYqx5V8W44GBIAREyrYOdHCI/wU5AloFRJf
 +Yng==
X-Gm-Message-State: AGi0PuagcxjqnDU2w4N9j+AOIa7hDO8dZgOwgDjMA+a2yicTXtuzc8t2
 8IIp48Fn9vToVx/DBamzToB7w73GCz7kyluZ/NU=
X-Google-Smtp-Source: APiQypK+zEl2CUhXKeN1pMFtLbx4xPC9hxcsM3MweNUup1O/ZINcmABvKJgjGr2DS3uy3r8m7Wbjhq7W2uEpl1447J8=
X-Received: by 2002:a92:39cc:: with SMTP id h73mr5683281ilf.298.1585870299305; 
 Thu, 02 Apr 2020 16:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200402195156.626430-1-leonardo@linux.ibm.com>
 <CAOSf1CEihBDDRny5S_7TA5Cqbdgsh6zN=kdq83OSgaLbRphtrg@mail.gmail.com>
 <6b4a4a0d4f7af723d0a5a12f4267717a507ce3f0.camel@linux.ibm.com>
In-Reply-To: <6b4a4a0d4f7af723d0a5a12f4267717a507ce3f0.camel@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 3 Apr 2020 10:31:28 +1100
Message-ID: <CAOSf1CHSCMsQgJTcMPiRUFDxBF=WVpTRk7-bzyg6iit8bmm7rg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] powerpc/kernel: Enables memory hot-remove after
 reboot on pseries guests
To: Leonardo Bras <leonardo@linux.ibm.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 3, 2020 at 10:07 AM Leonardo Bras <leonardo@linux.ibm.com> wrote:
>
> Hello Oliver, thank you for the feedback.
> Comments inline:
>
> On Fri, 2020-04-03 at 09:46 +1100, Oliver O'Halloran wrote:
> >
> > I don't really understand why the flag is needed at all. According to
> > PAPR any memory provided by dynamic reconfiguration can be hot-removed
> > so why aren't we treating all DR memory as hot removable? The only
> > memory guaranteed to be there 100% of the time is what's in the
> > /memory@0 node since that's supposed to cover the real mode area.
>
> All LMBs are listed in DR memory, even the base memory.
>
> The v1 of the patch would work this way, as qemu would configure it's
> DR memory with (DRC_INVALID | RESERVED) flags and the hot-added memory
> with (ASSIGNED) flag. Looking for assigned flag would be enough.
>
> But as of today, PowerVM doesn't seem to work that way.
> When you boot a PowerVM virtual machine with Linux, all memory is added
> with the same flags (ASSIGNED).
>
> To create a solution that doesn't break PowerVM, this new flag was made
> necessary.

I'm still not convinced it's necessary. Why not check memory@0 and use
the size as a clip level? Any memory above that level gets marked as
hotpluggable and anything below doesn't. Seems to me that would work
on all current platforms, so what am I missing here?

>
> Best regards,
> Leonardo Bras
