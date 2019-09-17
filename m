Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A8B4553
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 03:47:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XQw61kYhzF3mK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 11:47:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qr+aSMOP"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XQt12Lh4zF3hQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 11:45:28 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id j4so3617578iog.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 18:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7bGwUfVbajk2F57st+1DWbahv0ujMqW2uHKJm+/hm+s=;
 b=Qr+aSMOPbOV9sRRVb5ORet69hg/Q83loY58UC+ExOepNtKfuf/fUAP9+jQG4qid9xM
 nxmTgR1nh5+JcfOt76xoeQ5HaBbfgeQKxHnD6wbxAhVFhLnvotVCcsEX5bqwkPk+dOQ0
 5fJCMsv9RTDT1RYtnyzBboAit/GLAaAT6Jj3NNNH8ITFE0eAY3YThSc/PgcxjWE+T+YP
 QgO2ya4IDN7BaZNIly6BKPPEte6zkj6XvGRL+UuLUczJMtmKE3s2GcwP4alq1VzEQ/rm
 brpgumzdY2APOZA6zQZbioskWn3xLSxZVN9zr4ml4qqeykt//qhy+i4thCyZkMO0gs6S
 n97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7bGwUfVbajk2F57st+1DWbahv0ujMqW2uHKJm+/hm+s=;
 b=gt8/uf0Dys6FVAQ/D2w88cNIVPPZnODU1Oa1CwOSpqKc7yuAQPhvIRPdwrZV+FcOub
 e5nHVdqg5HOUVKGSSwSTTG/fGpPldirHC+T4369RAAaADDsEe6uN6XfTyNPTHcvkAQxH
 5EhLK1c90bzLBchQ0h2HPbEeurOk5oLEHYAATw/mTSPzWYLldXfxmP2h8rhru+Q2SeN3
 dlA6XUI6LpIkqUpCI0rWLpy3Cyfzx+HEldxUhQRQ1rEDER3j6gEGVzFSnZ9GItkwHzXY
 fc/PVZgyc1hTROTiu2s6bfXje8fQYAbG980stfL2IYxbP5CpoJkElgVZ9W5Kt+dsRqbC
 zXJQ==
X-Gm-Message-State: APjAAAWim+1yeSY+NyQ1vCUkbT/z5o3MMzK6bu/BUb7brWxQkicfAUa7
 cv+RcXKFx52aF+rvlRBRV6wc6DArJsV/+rDjl+k=
X-Google-Smtp-Source: APXvYqyQt3yUL2bdC/ZdGqXpQ2nRnGzBVebRnxufuQErBFN1mNpISktuQab6MPF3tiniERIwz0d1UD8aJfV2iGbzRms=
X-Received: by 2002:a6b:7503:: with SMTP id l3mr1013999ioh.293.1568684725290; 
 Mon, 16 Sep 2019 18:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-6-oohall@gmail.com>
 <20190917010421.GE21303@tungsten.ozlabs.ibm.com>
In-Reply-To: <20190917010421.GE21303@tungsten.ozlabs.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 17 Sep 2019 11:45:14 +1000
Message-ID: <CAOSf1CERpP0aFKoTiBprLXfr-CwRhix0wGosXBYnMffFtzF+gQ@mail.gmail.com>
Subject: Re: [PATCH 05/14] powerpc/eeh: Defer printing stack trace
To: Sam Bobroff <sbobroff@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 17, 2019 at 11:04 AM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> On Tue, Sep 03, 2019 at 08:15:56PM +1000, Oliver O'Halloran wrote:
> > Currently we print a stack trace in the event handler to help with
> > debugging EEH issues. In the case of suprise hot-unplug this is unneeded,
> > so we want to prevent printing the stack trace unless we know it's due to
> > an actual device error. To accomplish this, we can save a stack trace at
> > the point of detection and only print it once the EEH recovery handler has
> > determined the freeze was due to an actual error.
> >
> > Since the whole point of this is to prevent spurious EEH output we also
> > move a few prints out of the detection thread, or mark them as pr_debug
> > so anyone interested can get output from the eeh_check_dev_failure()
> > if they want.
> >
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>
> I think this is a good change, and even in the normal case it will place
> the stacktrace closer to the rest of the recovery information.
>
> But, I think it would make more sense to put the stacktrace into the
> struct eeh_event, rather than the struct eeh_pe. Is there some reason
> we can't do that? (It would save a fair bit of memory!)

Two reasons:

1) the eeh_event structures are allocated with GFP_ATOMIC since
eeh_dev_check_failure() can be called from any context. Minimising the
number of atomic allocations we do is a good idea as a matter of
course.
2) We don't pass the eeh_event structure to the event handler
function. I guess we could, but... eh

I don't see the memory saving as hugely significant either. There's
always fewer eeh_pe structures than there are PCI devices since some
will share PEs (e.g. switches, multifunction cards) so you'd be saving
a dozen KB at most.

root@zaius1:~# lspci | wc -l
59
root@zaius1:~# echo $(( $(lspci | wc -l) * 64 * 8))
30208

I think we'll live...

>
> Cheers,
> Sam.
