Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6E716BF95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 12:29:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RcCG6C5rzDqTY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 22:29:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=broadcom.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=sreekanth.reddy@broadcom.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=QSWYzPYT; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RV5B40y4zDqTD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 17:53:29 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id i1so11564510oie.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 22:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fSxteq8BvR6bLu5LA6jd2BwkLJks1DyRranxnHnzEYU=;
 b=QSWYzPYTbGtdSQcLlCKj5AEGOQ+3AMV+xZg0/U1875q3JKfM5DYKKf5p6HAK6CwjIP
 AOzaHHJjmake0476dUff+71jZhuvNc745oA0rLIGZ2I2H4J5IKOXbhyQXmahB1wqF2Iv
 U7eNIah3q24sEOYyMKrA6vRUfjNnXNBHWLXsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fSxteq8BvR6bLu5LA6jd2BwkLJks1DyRranxnHnzEYU=;
 b=nqHRVHjidiS6RU1T8k64ZySiWu+roT8WIRzRfM1XxhDgInWhDxHgI8f0gDmFbuFwQ8
 Zt5rOxvqtHjFXfUckxrWpcERz9D0dEpZaAh3ey7xSth6YNtVculGV5m5qqO9hcEvrPZ3
 X7ODZ4SUQ6B5i+6NZ8+GTP0qpKXoKjpYihDbAkLGbU8epCGDP9wi4ZlrSd/Ir/lInuTy
 lLuXVM9vzfcORluBFlYzug+lDF9IYwXAnsxDWAsGey45GOBYe4Ww2Wz4+37yWIdJTp2d
 LDMCssCqGuSKhP6YgQzoIqzfp+VhEywrClNCr867F+OBTmXkgCj68Di/nJPvr5fIYmFl
 quEQ==
X-Gm-Message-State: APjAAAXRDatLPYbqsZVzuurUlWqfp3aqU+jn/Cn5SA0iYL1hs6PMIHlZ
 oJPcjRmXTDnY2p7vRsiHuaQXot4T/Qm4BHx+/wxVqQ==
X-Google-Smtp-Source: APXvYqzA/xFMqccjb+BVRQhIHMzDqHfwlaweZ5oYatBKG1/zxpMzG0KS3wxN/jHbU7SS9W3Ga5Oz56oRA9wsAEb0Dk0=
X-Received: by 2002:aca:f587:: with SMTP id t129mr2226747oih.143.1582613605142; 
 Mon, 24 Feb 2020 22:53:25 -0800 (PST)
MIME-Version: 1.0
References: <1578489498.29952.11.camel@abdul>
 <1578560245.30409.0.camel@abdul.in.ibm.com>
 <20200109142218.GA16477@infradead.org>
 <1578980874.11996.3.camel@abdul.in.ibm.com>
 <20200116174443.GA30158@infradead.org> <1579265473.17382.5.camel@abdul>
 <1582611644.19645.6.camel@abdul.in.ibm.com>
In-Reply-To: <1582611644.19645.6.camel@abdul.in.ibm.com>
From: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Date: Tue, 25 Feb 2020 12:23:13 +0530
Message-ID: <CAK=zhgpWCz0+xpSGymbQEAbysH_rQf=s8iQ1gn4KwysP3c1Gcw@mail.gmail.com>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when unloading
 mpt3sas driver
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 25 Feb 2020 22:26:28 +1100
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 Chaitra P B <chaitra.basappa@broadcom.com>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 PDL-MPT-FUSIONLINUX <MPT-FusionLinux.pdl@broadcom.com>,
 manvanth <manvanth@linux.vnet.ibm.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Christoph Hellwig <hch@infradead.org>, jcmvbkbc@gmail.com,
 iommu@lists.linux-foundation.org, linux-next <linux-next@vger.kernel.org>,
 Oliver <oohall@gmail.com>, "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 25, 2020 at 11:51 AM Abdul Haleem
<abdhalee@linux.vnet.ibm.com> wrote:
>
> On Fri, 2020-01-17 at 18:21 +0530, Abdul Haleem wrote:
> > On Thu, 2020-01-16 at 09:44 -0800, Christoph Hellwig wrote:
> > > Hi Abdul,
> > >
> > > I think the problem is that mpt3sas has some convoluted logic to do
> > > some DMA allocations with a 32-bit coherent mask, and then switches
> > > to a 63 or 64 bit mask, which is not supported by the DMA API.
> > >
> > > Can you try the patch below?
> >
> > Thank you Christoph, with the given patch applied the bug is not seen.
> >
> > rmmod of mpt3sas driver is successful, no kernel Oops
> >
> > Reported-and-tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
>
> Hi Christoph,
>
> I see the patch is under discussion, will this be merged upstream any
> time soon ? as boot is broken on our machines with out your patch.
>

Hi Abdul,

We have posted a new set of patches to fix this issue. This patch set
won't change the DMA Mask on the fly and also won't hardcode the DMA
mask to 32 bit.

[PATCH 0/5] mpt3sas: Fix changing coherent mask after allocation.

This patchset will have below patches, Please review and try with this
patch set.

Suganath Prabu S (5):
  mpt3sas: Don't change the dma coherent mask after      allocations
  mpt3sas: Rename function name is_MSB_are_same
  mpt3sas: Code Refactoring.
  mpt3sas: Handle RDPQ DMA allocation in same 4g region
  mpt3sas: Update version to 33.101.00.00

Regards,
Sreekanth

> --
> Regard's
>
> Abdul Haleem
> IBM Linux Technology Centre
>
>
>
