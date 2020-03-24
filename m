Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A961C19034B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 02:23:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mYR85BMczDqwD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 12:23:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=hdG3K0QG; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mYPN0NWlzDqjW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 12:21:42 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id m14so500502oic.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 18:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+4Gkwa2G1ZvtAVtLLGAEnxqc8kb/47goUTTzJiwNkCw=;
 b=hdG3K0QGGf0OSVfqsu+FIJ5ZZAFSUtp6tH1qczcvKGNR9xYLbHKOG8boELnc4B1SgD
 d2aUAPTzFxP6R5O+d/Rjd/NhrqxLVARqIt6n5IxywosSeJ3LhNmEkYtaMc2y2fjr6o30
 Gg7M8th80lb65ZijeOO6hmL8DcJVMiPwqK9uryklEKAM/ZpNURuf1UThR01v8QkHj2Vm
 up7m+UTcQbiC7oOmUmKJ4Vhjgr5kjiG5phnPAZXBW7EfUyAWJPGSKQs9SnMRZUdcNSpH
 wKUV7f85qztZrSErNG/BD8aGSTBOugqWu+i86DCV8mM3B+JUZPlHGT8iY9zDrYZrY5hP
 KYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+4Gkwa2G1ZvtAVtLLGAEnxqc8kb/47goUTTzJiwNkCw=;
 b=Z4/6SniJayfAnReYBWEfXdhUDmzV8PkPl4wVaGK1YyNY/BqpB6iSRzf/TRjKr7DS4V
 RpB460QW9Dy/AaJ5iwVYuZzlQk20u4QNOR0JSLIzgUjIg+A1KykQsn45GfNtWPTRjndk
 J0kgSl4wAqIOYJvjDgaTNStqU7ETKymU4sp1aWFxYp9WI82h88aApMgV39HF6HkJ4Soo
 H4l76WD7DtLGg2u4kut3wdfF2prx6bbO7w0125Kuzzy1YHKZxZ2GZZ3/DZAJZN40ViY7
 hO4r0R2yRcyGwwfuLExu2g3Upq1TNHcVVgTYdIYQzHa29VbfG7ukjIdtYmJ+mbVZ+qaF
 FgWg==
X-Gm-Message-State: ANhLgQ2Wfw+nec/gGNh27d0NjqgWa0xuTqb7KckHOQFYV+Q3E9e9G2yt
 n2HtN8dMFJlIRYpH/7jhvIoIrtQaG+cS7MCB353KxkTZ
X-Google-Smtp-Source: ADFU+vtR+zfDGu6b9EvlKwPHbaugAQTL77/k93YOHOTwCOIL3riH+keQFZWvZt4YHPs0IL1wVEEMyLWti3Do08G4gIM=
X-Received: by 2002:aca:ef82:: with SMTP id n124mr1623535oih.73.1585012898928; 
 Mon, 23 Mar 2020 18:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200205052056.74604-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hBAk-dwO4=AT7cQm5YUwCBg0AECsZsiCjRJ_ZGWvWUAw@mail.gmail.com>
 <87y2ta8qy7.fsf@linux.ibm.com>
 <CAPcyv4hNV88FJybgoRyM=JuKgrwYaf+CLWfFWt5X3yFMrecU=Q@mail.gmail.com>
 <25eabdd9-410f-e4c3-6b0e-41a5e6daba10@linux.ibm.com>
 <CAPcyv4iFP6_jkocoyv-6zd0Y8FEYFA3Pk6brH5+_XQ9+U896wQ@mail.gmail.com>
 <87k13fnzt8.fsf@linux.ibm.com>
In-Reply-To: <87k13fnzt8.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 23 Mar 2020 18:21:27 -0700
Message-ID: <CAPcyv4hfdOUvxDsCrBu05K0pmZ_spCOOiP3YyLLuFWW-HqT+LA@mail.gmail.com>
Subject: Re: [PATCH v2] libnvdimm: Update persistence domain value for of_pmem
 and papr_scm device
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 2:25 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
>
> Hi Dan,
>
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> ...
>
>
> >
> >>
> >> Or are you suggesting that application should not infer any of those
> >> details looking at persistence_domain value? If so what is the purpose
> >> of exporting that attribute?
> >
> > The way the patch was worded I thought it was referring to an explicit
> > mechanism outside cpu cache flushes, i.e. a mechanism that required a
> > driver call.
> >
>
> This patch is blocked because I am not expressing the details correctly.
> I updates this as below. Can you suggest if this is ok? If not what
> alternate wording do you suggest to document "memory controller"
>
>
> commit 329b46e88f8cd30eee4776b0de7913ab4d496bd8
> Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Date:   Wed Dec 18 13:53:16 2019 +0530
>
>     libnvdimm: Update persistence domain value for of_pmem and papr_scm device
>
>     Currently, kernel shows the below values
>             "persistence_domain":"cpu_cache"
>             "persistence_domain":"memory_controller"
>             "persistence_domain":"unknown"
>
>     "cpu_cache" indicates no extra instructions is needed to ensure the persistence
>     of data in the pmem media on power failure.
>
>     "memory_controller" indicates cpu cache flush instructions is required to flush
>     the data. Platform provides mechanisms to automatically flush outstanding
>     write data from memory controler to pmem on system power loss.
>
>     Based on the above use memory_controller for non volatile regions on ppc64.

Looks good to me, want to resend via git-format-patch?
