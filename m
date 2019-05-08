Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 119CD17B1A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 15:54:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zdJ348znzDqDY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 23:54:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="GgArHWlW"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zdCm0G8BzDqGW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 23:50:40 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id y25so8094073oih.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2019 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2EurxZMr2RolSsa7vNYJaos3juIlj/g/eKIBE0b5hok=;
 b=GgArHWlWkQXoHwkDnK52AErLjHNxY5Gtmfi45DghAvzYSBWNm6e7PeK3JgF31tT39u
 Q8JR+JNhhGsG4Y7l9oZGDgiuq1Vd5RwpB/qtfTMetqQ89+0JLpGSnC6dCfhpwx19hpSY
 dW71jKTymLLEW0H/kPBh86F7O8Pl6ugXsxDoo7RkHtzfBaDJhKBBOLKKOiQUz6mX4dfy
 /qJ/gwBQBKlIHCytwcPCDVmTqECvadxzkRYOgECHpEhiJhC26ncnwbpfGzSI5baBNh4g
 EXfGGgHq+v/FJ3xWAj5JIAmNaj4uBs1RsRNGNVmeAZDVHZ7DoyszSVQnNrDKMABq0UGH
 +EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2EurxZMr2RolSsa7vNYJaos3juIlj/g/eKIBE0b5hok=;
 b=KEPGkZsoxR5xmN7xk9EiMZpCsWhfqpC6S3m6FhA+46srlWXqgBLDqQRwHnF775uUSk
 FxYbbJ3RqfhJtjk7rAmO3I2tKcZQ6zSkcERUdi8GOZHsKWYRLGoku5zI1jAB6Y36n1Uk
 EW2AapHkDpHUwpVXE4e1ZAWd74xx7+2yEMEsx5g0/fNg6UbEPunHYcogyryiHINOnmAw
 W4ezKYvppcwS50FxlmD6JTx/0sIzLMHqo5lAMNecpa3M8TZSJjjz6uaww0+QugUO1cNt
 kvmU6Q/YvMdtiQ0Y10NMwB/pAJi5TLELJEfn7icX+VeX/zr9CDdpEgoSb1VuZlgzCbXV
 qpjg==
X-Gm-Message-State: APjAAAVlCut4Ar0BJogGImh1vVcJ1iaUWECFvmjUOWkOc3vjXU1MHyK+
 L0psuHrZJon9USMAiD34puGmeRSVhD41MH7lBmXaVA==
X-Google-Smtp-Source: APXvYqyeIjtF65mpJyGOqNS4h3BV3LQvlNHfYva0fI5IeZSoAKQb2exqaAUh3L7sY+Pt68OUPCAnfn3ZcLOt3M41mPQ=
X-Received: by 2002:aca:4208:: with SMTP id p8mr2432775oia.105.1557323437130; 
 Wed, 08 May 2019 06:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-8-david@redhat.com>
 <CAPcyv4h2PgzQZrD0UU=4Qz_yH2C_hiYQyqV9U7CCkjpmHZ5xjQ@mail.gmail.com>
 <1d369ae4-7183-b455-646a-65bbbe697281@redhat.com>
In-Reply-To: <1d369ae4-7183-b455-646a-65bbbe697281@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 8 May 2019 06:50:25 -0700
Message-ID: <CAPcyv4jtS6G_ZqLCdO4gOjS9K2cuX=ywFHemhSb46aQvS8pa8A@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] mm/memory_hotplug: Make
 unregister_memory_block_under_nodes() never fail
To: David Hildenbrand <david@redhat.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, linux-ia64@vger.kernel.org,
 Linux-sh <linux-sh@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Linux MM <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 8, 2019 at 12:22 AM David Hildenbrand <david@redhat.com> wrote:
>
>
> >>  drivers/base/node.c  | 18 +++++-------------
> >>  include/linux/node.h |  5 ++---
> >>  2 files changed, 7 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/base/node.c b/drivers/base/node.c
> >> index 04fdfa99b8bc..9be88fd05147 100644
> >> --- a/drivers/base/node.c
> >> +++ b/drivers/base/node.c
> >> @@ -803,20 +803,14 @@ int register_mem_sect_under_node(struct memory_block *mem_blk, void *arg)
> >>
> >>  /*
> >>   * Unregister memory block device under all nodes that it spans.
> >> + * Has to be called with mem_sysfs_mutex held (due to unlinked_nodes).
> >
> > Given this comment can bitrot relative to the implementation lets
> > instead add an explicit:
> >
> >     lockdep_assert_held(&mem_sysfs_mutex);
>
> That would require to make the mutex non-static. Is that what you
> suggest, or any other alternative?

If the concern is other code paths taking the lock when they shouldn't
then you could make a public "lockdep_assert_mem_sysfs_held()" to do
the same, but I otherwise think the benefit of inline lock validation
is worth the price of adding a new non-static symbol.
