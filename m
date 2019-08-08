Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F166685DE4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 11:10:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4642dS5X17zDqZb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 19:10:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Os4xjysX"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4642bX3ThYzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 19:08:23 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id b7so65512924otl.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2019 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=45RFhgOOH9i9PHL0nBkZvR4v7gs8GCJIJKlYgNdMtSQ=;
 b=Os4xjysXbSGRFzEM6a3kbSbF2m+oyZsRALS75rmkUIGd2opLdc5vMcR04lay+oeCrL
 R09NKQJvNBSRsFIEMBN4x2cb+Zd1miSzLFaJB/e6l08QGzXvhSeSf37QI2omLIsQWzW5
 S3sz1pMmOmDC6+HOQg9ha74fYgUn5lH5by3oPPdLr2cB68l1iPxyjY+NEfZBmxd68H6Q
 GfB6Lsjeuej6WsJxkflAPa1xnrigL+KPoUi7c8UgJ6+egzdN+ncNa12ROhrhzCiWuueJ
 vhTgFYIrv3RrOhgfKrxNF1yTYAE5QKvIYrKR4i+swo2RiCn/IKbp7/0KaPRzhVmt5dDF
 BJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=45RFhgOOH9i9PHL0nBkZvR4v7gs8GCJIJKlYgNdMtSQ=;
 b=NxcXc9pWq9R9JbhQ5RPdWj1m87nCVNWvoPfxil9rqsOBtlKSwCH03JRsODgHxI1T7I
 9ReyfhcLwQnxw/ZQmmB9B+BIuxrvuEP7iUO3l2WRS+69BXPrS1t5nCepgWW11m2M8Net
 cvC3xA3B0r/sdg6XnhvEsiX3OsxrcIAN6w5VBu9DfHFOFa/gIBg4DzcWHKJCJz90Zb8y
 iRoMUEb9cRS3LxZZryLr6OiHmE199zrGMvXWsNTt4l8G1z84MDooCIEp09UffzMI8Jz/
 x/20W9pKR4HeTvz4mHzLDqwQRIm5+3jBUFAHo900cu3Lx0T8WDWYCEX8+phJu3srBw6v
 5oRw==
X-Gm-Message-State: APjAAAWzz5H5U/ktdVzlzXzNGSqkfDIsJH6J9ofMvqBsg5OqfZzLCaqC
 5MmvmmKndH1pUqCj44HCSjl46y702gwHsBqJtAw=
X-Google-Smtp-Source: APXvYqyi4TRFCy9BjeFXyr9KSedagzzfTKKyw2ebnfsp6NrFs5d+V2/FSE688HSAivrjI7RrEzZE8V3CHZfW4K6gnuc=
X-Received: by 2002:a6b:fb10:: with SMTP id h16mr13604117iog.195.1565255300784; 
 Thu, 08 Aug 2019 02:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565149456.git.sbobroff@linux.ibm.com>
 <1cd007696df2db87a0b1e5677520806d4d9b3e24.1565149456.git.sbobroff@linux.ibm.com>
 <1da83896323a35fc91312cd8eaf3a82b819f84eb.camel@gmail.com>
In-Reply-To: <1da83896323a35fc91312cd8eaf3a82b819f84eb.camel@gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 8 Aug 2019 19:08:09 +1000
Message-ID: <CAOSf1CF+DGmyWZuK9bixz3o0Tu-hpH_tXpNVh4XbMo0ZiozpEg@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] powerpc/eeh: Add bdfn field to eeh_dev
To: Jordan Niethe <jniethe5@gmail.com>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 8, 2019 at 5:05 PM Jordan Niethe <jniethe5@gmail.com> wrote:
>
> On Wed, 2019-08-07 at 13:44 +1000, Sam Bobroff wrote:
> > From: Oliver O'Halloran <oohall@gmail.com>
> >
> > Preparation for removing pci_dn from the powernv EEH code. The only
> > thing we really use pci_dn for is to get the bdfn of the device for
> > config space accesses, so adding that information to eeh_dev reduces
> > the need to carry around the pci_dn.
> >
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > [SB: Re-wrapped commit message, fixed whitespace damage.]
> > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/eeh.h     | 2 ++
> >  arch/powerpc/include/asm/ppc-pci.h | 2 ++
> >  arch/powerpc/kernel/eeh_dev.c      | 2 ++
> >  3 files changed, 6 insertions(+)
> >
> > diff --git a/arch/powerpc/include/asm/eeh.h
> > b/arch/powerpc/include/asm/eeh.h
> > index 7f9404a0c3bb..bbe0798f6624 100644
> > --- a/arch/powerpc/include/asm/eeh.h
> > +++ b/arch/powerpc/include/asm/eeh.h
> > @@ -121,6 +121,8 @@ static inline bool eeh_pe_passed(struct eeh_pe
> > *pe)
> >  struct eeh_dev {
> >       int mode;                       /* EEH mode                     */
> >       int class_code;                 /* Class code of the device
> > */
> > +     int bdfn;                       /* bdfn of device (for cfg ops) */
> > +     struct pci_controller *controller;
>
> The other members of the structure get a comment, maybe it would be
> more consistant if this one did too?

At some point we need to go through all the EEH documentation /
comments and get rid of everything that is not useful or just straight
up wrong. The comments here are in-offensive, but they mostly just
repeat the information in the variable name so it's hard to see the
value.
