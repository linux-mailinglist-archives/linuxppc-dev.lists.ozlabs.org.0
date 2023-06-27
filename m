Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E09ED74026F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 19:43:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HvOjTHjC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrBrW5rRwz3bX2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 03:43:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HvOjTHjC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrBqg3Rygz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 03:42:22 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bd744ffc263so4718378276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687887739; x=1690479739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i618d6TBDc9eRPjFDJkpeqKfOfbO3uM7uCEV9XLltFk=;
        b=HvOjTHjCD8itMm1xp5AnK/TmYH5tQiF1El2gyMO5zpqTY4wM1G2ir3ku6089UY1inQ
         ilXwuLjIDRYIMPHiQPHPbFQRy/hIa9oVwH0QYqAm53mZsyIpL6HgYzNNL/NNLIh2SC53
         /Joi55NqQPacIQIaSPLnjCH7o6qvV31ICWbCQ8IiY+RsTUhqfYiVoVRzcNBSzvMpURs/
         f/RKmZePqghHrHdV5n1so0lsBS2EaZX77ICe7eDI+jllhbMiPBHJhxnD9h+Hh+PnGjAo
         7epexu03a+N5aJGPnt128CQw+E8IVZS3OeUo6R0hlPLkskRaMfOu6WUJJOIpsapTfYI9
         tHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687887739; x=1690479739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i618d6TBDc9eRPjFDJkpeqKfOfbO3uM7uCEV9XLltFk=;
        b=bvCQUr8SS/5RUEZUpSOv3ms9Nu1fKN4RYHQQn6xgh+yh2cYjIr61lWspJKLMJrt/bB
         EPsV+9NNNszca5DmdolmrdwQjuL8feplHrw0dbyuukFTUQbiSkG4N/FQ4oB6M2FVRL5t
         lSbULtQ35sMFvMZCOYWFp1YnW1fCYdXpnmD+zW8mSf1yQrk0L+14zm0ig69B+i99aZcx
         aTk0bW0ynSXpnwNQu4OPKpqlikLtKSDypIO2FjUc1M8yzIHwDlUIjRVHLDZLJHF0u4qW
         RKj7JwYBqdcuO+4w8XU6gsLZRNkSlE5tr7N7C112gC44nkZkvK4nWWrAOUvHUtKyJWhN
         XR8g==
X-Gm-Message-State: AC+VfDykMrznyIT7ltb/D4cbQ1mMvMeB/COmUIxVimcbyTbkyVWgkCsw
	WpB80ARn2WUZnW/ouuSqHXzNhTnBvB7xFU/h73M=
X-Google-Smtp-Source: ACHHUZ5ixDfcfZvsP+Sk9Q2uIR96dLCuXZPewVmRsckC25R1Wt8J/1BC8EjmOgQOvqL4+PjmfxQNP2ok9/vuUSXcV8M=
X-Received: by 2002:a25:86c8:0:b0:c16:ba32:1b1c with SMTP id
 y8-20020a2586c8000000b00c16ba321b1cmr8446597ybm.58.1687887738923; Tue, 27 Jun
 2023 10:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com> <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
In-Reply-To: <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 27 Jun 2023 10:42:07 -0700
Message-ID: <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 26, 2023 at 10:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
> > Part of the conversions to replace pgtable constructor/destructors with
> > ptdesc equivalents.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>
> This patch causes all nios2 builds to fail.

It looks like you tried to apply this patch on its own. This patch depends
on patches 01-12 of this patchset to compile properly. I've cross-compiled
this architecture and it worked, but let me know if something fails
when its applied on top of those patches (or the rest of the patchset).
