Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B012ADC28
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 17:34:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rsfm6rnFzDqGQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 01:34:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rscx4GsjzDqCk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 01:33:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dDhjutOR"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Rscx2VXTz8t6X
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 01:33:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46Rscx194Fz9sCJ; Tue, 10 Sep 2019 01:33:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dDhjutOR"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46Rscw2W33z9s00
 for <linuxppc-dev@ozlabs.org>; Tue, 10 Sep 2019 01:33:19 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id m11so29732314ioo.0
 for <linuxppc-dev@ozlabs.org>; Mon, 09 Sep 2019 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yVJbRmooCX4u0lvbwVAgp7dGZKoaCdPYyvWjgm/51hU=;
 b=dDhjutORYn9XJpV59znJaxDiEzAGE9Xzc96mJrPl984lQLyLtn2m/qWRwumaE0i2ke
 bmMzylQsa76Koz76Qa9abd25rGx4IjUowE5172wiH7M5ZQSvSYvLSWKdIsFThU+7OK21
 1az6qPuveDhcTUW1kBU3/XNMEwLXtO3hs9H9VFmFvhOTGFdQIgWe2E4GjTbl5v/AJMhE
 F7b06bRfYkkbAlYF3TQWdCEu+XBvbsXYSKPdEqJg3I5TcxP6f+5bZnHItETpXgAJTXwb
 vhaCJSbRdMpV88t17henmCY5ROq4hsP1DI5vDc+kI04WLDvohaCEIzo8WaGyEBfjtgyI
 ERLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVJbRmooCX4u0lvbwVAgp7dGZKoaCdPYyvWjgm/51hU=;
 b=uf6TJZvNG4owjN+LReoH37OL9USG/qcXR/ks0Zo58xGKlh9VRHDp9BZnU+AMxTtiOu
 eoDKEd6SPiFu9INzRem7zJ1s4uwsnZAa+WSCwEY7abYyy37JSPsCeCu5R4Ogt0owgsqw
 hCBhU/Iffc5kbQqfVyZvDl/hy0P7EK6Lfj6e4vC7GRZWy7AjT8CDk6ZTmfmSM8BS5I4P
 XDHGYuIB1mLnwgcs/fwTAEIfdGV0jWENUsXv370PNDsl6a959jfnwJLjxEL3QOKyUbwV
 LacShkgvnelkTVnGRRrGo7mRYXzowzQhSEZaGd4qTodzTZUWBHztaXqkVVqvecehq9Tk
 a0bA==
X-Gm-Message-State: APjAAAXkQm6OPAwFyJwTsF3m68CwuF3PI/V4O7apkc+lHXzwvszhrsEe
 qCTZlRb32bpBrmn2ZrAVZraADZ1yIRNLYjcCueo=
X-Google-Smtp-Source: APXvYqyUuzg30g0FzE/aCo5WMBCqpTrOSK6JcXpnQGy4a+DaKuGS0i6/VJ/vXfXC87CHF9PYbOpS2vEwIaDbO6CsJTY=
X-Received: by 2002:a05:6638:8e:: with SMTP id
 v14mr1998062jao.72.1568043195514; 
 Mon, 09 Sep 2019 08:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630280239.8896.11769233860624935762.stgit@hbathini.in.ibm.com>
 <87sgpcp80n.fsf@mpe.ellerman.id.au>
 <b7c46267-92d8-9202-b657-7cb8e37451fe@linux.ibm.com>
In-Reply-To: <b7c46267-92d8-9202-b657-7cb8e37451fe@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 10 Sep 2019 01:33:04 +1000
Message-ID: <CAOSf1CHjV5PM-rYJ_5-XHmZyBNO_H=Nw8X7+HoOZnL+D7pM-sg@mail.gmail.com>
Subject: Re: [PATCH v5 21/31] powernv/fadump: process architected register
 state data provided by firmware
To: Hari Bathini <hbathini@linux.ibm.com>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 9, 2019 at 11:23 PM Hari Bathini <hbathini@linux.ibm.com> wrote:
>
> On 04/09/19 5:50 PM, Michael Ellerman wrote:
> > Hari Bathini <hbathini@linux.ibm.com> writes:
> >
>
> [...]
>
> >> +/*
> >> + * CPU state data is provided by f/w. Below are the definitions
> >> + * provided in HDAT spec. Refer to latest HDAT specification for
> >> + * any update to this format.
> >> + */
> >
> > How is this meant to work? If HDAT ever changes the format they will
> > break all existing kernels in the field.
> >
> >> +#define HDAT_FADUMP_CPU_DATA_VERSION                1
>
> Changes are not expected here. But this is just to cover for such scenario,
> if that ever happens.

The HDAT spec doesn't define the SPR numbers for NIA, MSR and the CR.
As far as I can tell the values you've assumed here are chip-specific,
non-architected SPR numbers that come from an array buried somewhere
in the SBE codebase. I don't believe you for a second when you say
that this will never change.

> Also, I think it is a bit far-fetched to error out if versions mismatch.
> Warning and proceeding sounds worthier because the changes are usually
> backward compatible, if and when there are any. Will update accordingly...

Literally the only reason I didn't drop the CPU DATA parts of the OPAL
MPIPL series was because I assumed the kernel would do the sensible
thing and reject or ignore the structure if it did not know how to
parse the data.

Oliver
