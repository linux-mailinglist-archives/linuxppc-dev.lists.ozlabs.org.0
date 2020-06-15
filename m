Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2086C1FA07F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 21:43:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m1vk5v36zDqYd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 05:42:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=O0zD/ign; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m1sZ0pNPzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 05:41:03 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id t21so12382623edr.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 12:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4s29RXI4DZmoz7Uu9spIoKDjM10KzT1NJ7eoQ6iGuKQ=;
 b=O0zD/ignX49ZyEfuD6nUnsJTM4Z2o6FY8NMNsDmSNfe6aQVWNrOXTRTPjuGCOQ7uCB
 k9fwQ/N07Of5R++0Wqywf7IkNDOTgpQYrKqFq25Z4tEh9kpSx0iQG8sB0skjvtknQbe8
 LAlKIYFmc59bA3kzhgA6+V+U1gaq//XY0YNfP9M1mcKrtpnepdygD4ppBX7FT2nrwDnH
 SQHjoOUEzTNzr7VSEmdqRr8gky5IcYTdj1QWaJduNkBbFQDElcSFHxEf5PNUM5ITYStm
 7DRJEHhlCSLXRKelwGOwYMezexaBwP1VefdC3djrn0BKXNFFcPnyNgUmAm3/YL88FCYy
 QPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4s29RXI4DZmoz7Uu9spIoKDjM10KzT1NJ7eoQ6iGuKQ=;
 b=L+FXLw16JLkZxy6pPm1M4FK+xVE2liutrImnC9rv9/J9/uJWpwZRx0ZwCEXreDGIUS
 9nDI3vHSSWS/mazuhfR8qJWPOO7CyIGU4Aomfxdfu606lXRN8mbMo0xX81LX7f0Wn9bO
 /PZIuu4FxyFyqTL4/BITAV8AGBHExBjcfVtHoXcLnqu+HKy1EV5cDFk/ZNnTWT9ZrNfy
 3aTOGGovrhNQJqiU9drAAqZfSy1DJlQYskWofRsp5s0VaN+UoEe3qNf+1PPKstV78MAJ
 YP48+0SPXYM5jGbL/grIrIh5xv0DfMc0EiyZF5LVCySt9ZImEN5yKQ4I8CWx2reJVZEM
 ZnyQ==
X-Gm-Message-State: AOAM530R9ww1B5f/sBCr6UoaHs5fOOEWJ4EQ9TvZykjmQ/tXqbqsPV0h
 n7uK8kluIrGHYFDQ9nOnRL+UkVvBwA5dfsiWArS3hg==
X-Google-Smtp-Source: ABdhPJw7gZGRCrEp8Uckb0OtIxiFQkW6W0bIFXefK59EdVk9QlmbMAZVSR15quYWqkF3RICuTtvR0uovNicOGRMtPBI=
X-Received: by 2002:a50:c359:: with SMTP id q25mr26045616edb.123.1592250060573; 
 Mon, 15 Jun 2020 12:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200615124407.32596-1-vaibhav@linux.ibm.com>
 <20200615124407.32596-3-vaibhav@linux.ibm.com>
 <20200615125552.GI14668@zn.tnic>
In-Reply-To: <20200615125552.GI14668@zn.tnic>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 15 Jun 2020 12:40:49 -0700
Message-ID: <CAPcyv4gmAk=mRCVQCgdSEN9JQ9b+C_u0xug-knZpQmGNL_ywxA@mail.gmail.com>
Subject: Re: [PATCH v13 2/6] seq_buf: Export seq_buf_printf
To: Borislav Petkov <bp@alien8.de>
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Ira Weiny <ira.weiny@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 Christoph Hellwig <hch@infradead.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 5:56 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Mon, Jun 15, 2020 at 06:14:03PM +0530, Vaibhav Jain wrote:
> > 'seq_buf' provides a very useful abstraction for writing to a string
> > buffer without needing to worry about it over-flowing. However even
> > though the API has been stable for couple of years now its still not
> > exported to kernel loadable modules limiting its usage.
> >
> > Hence this patch proposes update to 'seq_buf.c' to mark
> > seq_buf_printf() which is part of the seq_buf API to be exported to
> > kernel loadable GPL modules. This symbol will be used in later parts
> > of this patch-set to simplify content creation for a sysfs attribute.
> >
> > Cc: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
> > Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> > Cc: Christoph Hellwig <hch@infradead.org>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> > Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> > ---
> > Changelog:
> >
> > v12..v13:
> > * None
> >
> > v11..v12:
> > * None
>
> Can you please resend your patchset once a week like everyone else and
> not flood inboxes with it?

Hi Boris,

I gave Vaibhav some long shot hope that his series could be included
in my libnvdimm pull request for -rc1. Save for a last minute clang
report that I misread as a gcc warning, I likely would have included.
This spin is looking to address the last of the comments I had and
something I would consider for -rc2. So, in this case the resends were
requested by me and I'll take the grumbles on Vaibhav's behalf.
