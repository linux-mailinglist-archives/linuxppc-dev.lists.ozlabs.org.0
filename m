Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 038DF20E6AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 00:09:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49whVQ6ZB1zDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 08:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=penberg@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KsYeoNtN; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wTgS44Z8zDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 00:01:33 +1000 (AEST)
Received: by mail-qv1-xf44.google.com with SMTP id g11so7664593qvs.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8FrjxWdY/Gjwce8t0JyeJsnYTMhQlskObJO/oLUWzfo=;
 b=KsYeoNtN/hmKD60koJPvKXhY1HT5rh0BdsIymjK2OY+Ah5csm67fWOMInZoSB5MyiF
 z81tpEOU7gbEs2Eu9dK1IU73/ldLFTcOuXQ4NQt1zxjMaUlUH9xpuPmQkDZyG2XpHE5A
 z0rDQ6F3p6odfLFvjQ20/v+vqn3osPhCyUtrTurdqBrAHPO36wwugYL1OqGKXGdazN2M
 p5mNNLqMsIqkd1lea0NNKZvGNZ4NvI4uksXON6N73LrjpsMxdX6M9+heVdl/zTyGvkYj
 tkHXxI8XU7hiVfWyn9RhwdGCF2zdf8eMUPHFh6FNadOyOkvVyTEcnpjW7aa7VVLEWYLN
 vdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8FrjxWdY/Gjwce8t0JyeJsnYTMhQlskObJO/oLUWzfo=;
 b=C6YMT9no16T5ShHTPq4jXaw/cXaHDYEJ6HIQY5O6pEc8KozF3KkaHEeFzC6iiZtFmz
 wsEH8ophLTJwDyKGBn6nN+p3dMkpaBUeCAILWkpIHz1S+YT0NXhYPLoA2RT+mElCZ4tM
 zp2rhSNCMPNlRz4Hd8YF8gzMhoyc8XouFOYEYjBC5kcykK/WRyXuoTWGusjA+gCErTGv
 O/lJgF9iWM+Fz6FcNMsmOEVmqTumyIExt+7cuA8G6p2jL69QCH6hPVaqBc5fWBbLwXJp
 FkLAvdKEZiFUgZijl0vYBaqOkxgWsVIP9M31GIJGmKf+jLUi65/IpfeqF6/m6Oh5rHSj
 56+g==
X-Gm-Message-State: AOAM5326itZiWJLLmfvsLba7r6ykZdLXosHvvbODjyVQu8bi3ZKIHaft
 gGGX/ma1SdI8qhBQBAtb9HNR9x6GLF4xnbl0XrM=
X-Google-Smtp-Source: ABdhPJwRvnHK4e9FuZZ286EO2eHunvWxUS+jw1hxD70l+wfbFL9aDwHZRKLC21a2KPKCyOwmNUkOhP18WuRSaAVXDjg=
X-Received: by 2002:ad4:4cc3:: with SMTP id i3mr8130354qvz.114.1593439286277; 
 Mon, 29 Jun 2020 07:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200627143453.31835-1-rppt@kernel.org>
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
From: Pekka Enberg <penberg@gmail.com>
Date: Mon, 29 Jun 2020 17:01:14 +0300
Message-ID: <CAOJsxLE47WP9aMY3nh=E7C1a_esHt=sBFWCnsVA2umZ7TZ6TTA@mail.gmail.com>
Subject: Re: [PATCH 0/8] mm: cleanup usage of <asm/pgalloc.h>
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Jun 2020 08:06:39 +1000
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
Cc: ia64 <linux-ia64@vger.kernel.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 "list@ebiederm.org:DOCUMENTATION <linux-doc@vger.kernel.org>,
 list@ebiederm.org:MEMORY MANAGEMENT <linux-mm@kvack.org>,
 " <linux-arch@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 27, 2020 at 5:35 PM Mike Rapoport <rppt@kernel.org> wrote:
> Most architectures have very similar versions of pXd_alloc_one() and
> pXd_free_one() for intermediate levels of page table.
> These patches add generic versions of these functions in
> <asm-generic/pgalloc.h> and enable use of the generic functions where
> appropriate.

Very nice cleanup series to the page table code!

FWIW:

Reviewed-by: Pekka Enberg <penberg@kernel.org>
