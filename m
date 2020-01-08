Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C03134B59
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 20:15:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tJqC3mvRzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 06:15:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="aXBKpkre"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tJnQ4t8QzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 06:13:45 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id w21so4671232otj.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 11:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nwzT+0Ljs8ayMxiId4ILWJbQFwhi5ruplGd3VdIX3RM=;
 b=aXBKpkre4lcb7sMUk8RY7fqYF6hOlQVFhJATgnLjVCY7K15QLYyf7hixiIBa3HZVMC
 ExlCfpewfRpBKMlrL2bkTmYPm4CaGYlyL7tRjpgwgPPKYXDXxvC/+KRYGg7RVNI+Zch3
 OJDriIxWyOMcD19jmlVDHU8kJyYPULCFXFwxijHaC7h6OhkrZpOvqpN/E+KTL4l7U/4j
 xMaDx7uVFsBEhMyQ6lG95oYF9HfECFKNHuarmwK5/8nBEJr63/BKQtroqLrTIogIYeYL
 rpBX2fz3/DPf9u8qNUR4UvRqVBL+6fbPeQn8qT6bzEnk6MNhhgAhhL1sSxjlwCfUWh9O
 nRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nwzT+0Ljs8ayMxiId4ILWJbQFwhi5ruplGd3VdIX3RM=;
 b=pTE029r4+bfuUdNkZCwa721ckA9KAFFiA8CJmwE0hn4XjW0+TxJZWh4eCKdJHj1VKh
 8Y7oqUkCV7PmWrGAlZK5CKmJdyAyJaCxvG9lPww5FRFwygW+yKjHj+WwZ7JoOYV7CiIG
 fLkiO6c8zccUL/izrcgDHJFTkTWYYu5I3r8LU0JR5uqEtx8Cts9//FSSz7wGdJqiyyvg
 WN1zha8Ikz5ZDmjF2/CDIgU3CkNFmFYGtmf+NUUygOeizbBGhojzCJYSZqUV3FhumK1U
 cBS1awPjVOXc3XNWTiz+cF8AlkT8UyFC4pbNI74RNWY8GylEwaNEXixTTh+k+qSRFaBZ
 Vbrg==
X-Gm-Message-State: APjAAAXiUKqKZHpQ2iPFUSJYxjQqX3GJb6jXVBnmoldkFQKL1M0dYJkw
 tK9tNgY/3awpaCGUihivPwELq/fejYvlwzEn6GTyiw==
X-Google-Smtp-Source: APXvYqyvspS0KBUPu+LfGCtgbi8xLvL1j8+dWGl+2876Wfu60VTn5s+jGWcdaAy33x3gyVzhze0VmNrhk5SnuXfeXQA=
X-Received: by 2002:a9d:68d3:: with SMTP id i19mr4986153oto.71.1578510824036; 
 Wed, 08 Jan 2020 11:13:44 -0800 (PST)
MIME-Version: 1.0
References: <CAPcyv4hdpMs5om4_VrYUz98aWDJ9eRhj7WJr312Jwn6LCmAm9Q@mail.gmail.com>
 <5D5ED235-EB67-4072-8CCA-C046B7EC031C@redhat.com>
In-Reply-To: <5D5ED235-EB67-4072-8CCA-C046B7EC031C@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 8 Jan 2020 11:13:33 -0800
Message-ID: <CAPcyv4jJgBm6rhLn2685HN3DnBKB1FO2ONXC1=Aftspu1hiqmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] mm/memory_hotplug: Rename mhp_restrictions to
 mhp_modifiers
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-ia64@vger.kernel.org, Linux-sh <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Eric Badger <ebadger@gigaio.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 8, 2020 at 11:08 AM David Hildenbrand <david@redhat.com> wrote:
>
>
>
> > Am 08.01.2020 um 20:00 schrieb Dan Williams <dan.j.williams@intel.com>:
> >
> > =EF=BB=BFOn Wed, Jan 8, 2020 at 9:17 AM Logan Gunthorpe <logang@deltate=
e.com> wrote:
> >>
> >>
> >>
> >>> On 2020-01-08 5:28 a.m., David Hildenbrand wrote:
> >>> On 07.01.20 21:59, Logan Gunthorpe wrote:
> >>>> The mhp_restrictions struct really doesn't specify anything resembli=
ng
> >>>> a restriction anymore so rename it to be mhp_modifiers.
> >>>
> >>> I wonder if something like "mhp_params" would be even better. It's
> >>> essentially just a way to avoid changing call chains rough-out all ar=
chs
> >>> whenever we want to add a new parameter.
> >>
> >> Sure, that does sound a bit nicer to me. I can change it for v3.
> >
> > Oh, I was just about to chime in to support "modifiers" because I
> > would expect all parameters to folded into a "params" struct. The
> > modifiers seem to be limited to the set of items that are only
> > considered in a non-default / expert memory hotplug use cases.
> >
>
> It=E2=80=98s a set of extended parameters I=E2=80=98d say.

Sure, we can call them "mhp_params" and just clarify that they are
optional / extended in the kernel-doc.
>
