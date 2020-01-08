Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224B134B2C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 20:02:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tJWz3RT6zDqVD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 06:02:07 +1100 (AEDT)
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
 header.i=@intel-com.20150623.gappssmtp.com header.b="s9NJQtCq"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tJTm5vQjzDqV5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 06:00:05 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id 59so4577180otp.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 11:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XKG1nbVwzj/tRpstff6fH6LSUuwV4sjHhIFUgWIlV+U=;
 b=s9NJQtCqnectin8Ti+6PJbbfj1iVC29kijEEVzBm9eYM0xqovEdSIvUBRa5QV+2Qzf
 uMjhO+nADZCdf/v+dinki4tHGe/eBYjmY78A0B9gngLOIJZSvsYSGQUcFghNBkzajBm+
 002VIJLs2HYb6/7/565YtsSdwQ7BoFsW7F2g/8JhRZm5aaupLnZ+WjxKHOUtdugZXa+v
 M5Cfg0EYtVYHOoLi8prNlcRFGlvf0CrScWNFvhySDu/GUL/m4BLe/M+OqS31fpVqrUm6
 /h5oOCVTEniuxvpSTmawQh4xsO4jXbtbwJSxpi9ba8XLCoKCbuSjDDKpfn0F41JYkU5K
 2q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XKG1nbVwzj/tRpstff6fH6LSUuwV4sjHhIFUgWIlV+U=;
 b=gN3mn2qZk9BkF/lFL68UwCCR0dCZz511sFjKIE4CciaCUJyycZLSdtjHD1II7+LR/g
 u2/59UU9nAEaU4qUWDZWtFdWVpUd6DDeWWNYqip9+0lmFmnY/cAIxJX5rxVZSYxw2GSt
 fDimxKdR+spgqQ2HyZ9ptAOldRw8vCxrl2RQQHKYSy2LClCmovRFWDeq3e11SPS6vUAX
 qElsUFcdKEaGgIEJGbq82kOdt6QksEdBELHzthEK5ainyHyaYHmwf/z1cuExH3O/fUa0
 71mXCza7HBAob7h6goUU7ceEmeizTqT3DY5lnRhjgfZPsak2ey8FsTc0fX2HCSmD2JKb
 Wx4g==
X-Gm-Message-State: APjAAAU0x/nN+3V1XW9ZPOpOZg955MxY6lpMv2/DdG1ghIEpVonWhOiH
 W9O3/ts1TzY3rW4ly9NwBPG+thcRMoKD7+MNGD+v0g==
X-Google-Smtp-Source: APXvYqxCuOUFRmTIFvW4iH38UfBo5T8KUr6T2q9RXS3eopOSB7fDf5LWtiL93/r45iWPoVq/UfuDWeRs67v8mZX9sdI=
X-Received: by 2002:a9d:68d3:: with SMTP id i19mr4939869oto.71.1578510001998; 
 Wed, 08 Jan 2020 11:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20200107205959.7575-1-logang@deltatee.com>
 <20200107205959.7575-3-logang@deltatee.com>
 <3e432695-e3a9-2aae-e9f5-1b6454886c06@redhat.com>
 <eef4ec73-8823-9f20-93ed-5c09f18c437a@deltatee.com>
In-Reply-To: <eef4ec73-8823-9f20-93ed-5c09f18c437a@deltatee.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 8 Jan 2020 10:59:51 -0800
Message-ID: <CAPcyv4hdpMs5om4_VrYUz98aWDJ9eRhj7WJr312Jwn6LCmAm9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] mm/memory_hotplug: Rename mhp_restrictions to
 mhp_modifiers
To: Logan Gunthorpe <logang@deltatee.com>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>,
 Linux-sh <linux-sh@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Eric Badger <ebadger@gigaio.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 8, 2020 at 9:17 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2020-01-08 5:28 a.m., David Hildenbrand wrote:
> > On 07.01.20 21:59, Logan Gunthorpe wrote:
> >> The mhp_restrictions struct really doesn't specify anything resembling
> >> a restriction anymore so rename it to be mhp_modifiers.
> >
> > I wonder if something like "mhp_params" would be even better. It's
> > essentially just a way to avoid changing call chains rough-out all archs
> > whenever we want to add a new parameter.
>
> Sure, that does sound a bit nicer to me. I can change it for v3.

Oh, I was just about to chime in to support "modifiers" because I
would expect all parameters to folded into a "params" struct. The
modifiers seem to be limited to the set of items that are only
considered in a non-default / expert memory hotplug use cases.
