Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A8739FA1D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 17:14:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzv141y2Pz3bvs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 01:14:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=q/pGziiO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2a;
 helo=mail-vk1-xa2a.google.com; envelope-from=jrdr.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q/pGziiO; dkim-atps=neutral
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzv0c4mPJz2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 01:14:24 +1000 (AEST)
Received: by mail-vk1-xa2a.google.com with SMTP id k71so234425vka.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O1gHl02oivo3RqMJKlwA/A5dzOE7PgpnMHshZI9Ylrs=;
 b=q/pGziiOz9jkwf1xpb1EEOjAPz/8OP9lR8P5rwugXRCKdIw+1wS1ArDWbo56DTgYcO
 2xIIfHxWOdAkxjck+U0UFvbyJXLOxqC0e39gdVGuoyznrtl6Kqsbm0vXEM9F9Ph6UxlB
 rR5msRf1tYIkQmYvAoVpDNmbWTNV7I44HNDPmtNDKlNk0+jSHN0zTfRpSQal7ClgWNKL
 nt58hzE/ILIPgRy01To/yIbhd4Nn1FvYEU+6H+m4XZ6Yl5ZdcJKv99WcwWeAt69su8a1
 jHh7JWQyepBhzoAemaPXbFi97EGcaWlnBbUsAZgHFnVI4KURGRzpgTzD9HaiwUKNr0lJ
 8aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O1gHl02oivo3RqMJKlwA/A5dzOE7PgpnMHshZI9Ylrs=;
 b=l7rNeKoV8eDgD+hyKKOsd4ixm3xmPXg+mRO5ruorIi+pRzW+v0z7z4Pv8Pi6Nl9a3b
 ItQ16u1b+niFj28hFN9K2lla6wZb26FtsOGJHrFf0ZB0/zfx92iWrwQirBvmHSzXVjOF
 q2m8z4EE3f30NefIj+ZOcvFXS81z1Z88WA5NNFhS1H0jLA96p01LKj+gc4cbRwIZdOLb
 4VY6m7D+WlO/XCp1WRb45e50ubSeaRRJ+EXdI4s3TvTbzz1ixt49RIAR/8PzdK99x12N
 Mnku0xRx6GU1Ng+kad6KVcqetp5Mb+NVsmgqG0E70Gp8zZxUYW+/jdsfYJqL48PRpSZ7
 teyA==
X-Gm-Message-State: AOAM533rPXhrMEmZnqt6krQ6u/2RIK0E77pINEh9FpeDUbruGygI7a42
 MkRpPjXBtDTye7Sbua0oT2SeY+TBb9KcwbV4tIU=
X-Google-Smtp-Source: ABdhPJzvEmzWuahJjCnq+ZMJixhpkm3KNp6kok+q20Al/eAGM2mP9WokEC+P56s7XJVWAW/iqzmnjaTihV1wlYq26Ug=
X-Received: by 2002:a05:6122:a1b:: with SMTP id 27mr387134vkn.23.1623165260736; 
 Tue, 08 Jun 2021 08:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-2-wangkefeng.wang@huawei.com>
 <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
 <34f88fdc-1842-7954-bccc-0142a8d66eea@csgroup.eu>
In-Reply-To: <34f88fdc-1842-7954-bccc-0142a8d66eea@csgroup.eu>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 8 Jun 2021 20:44:08 +0530
Message-ID: <CAFqt6zbV32+FsEFywqb6vk90tQ442S63CO+bh=2h8OxxutYQEQ@mail.gmail.com>
Subject: Re: [PATCH v3 resend 01/15] mm: add setup_initial_init_mm() helper
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-sh@vger.kernel.org,
 X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 8, 2021 at 8:27 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 08/06/2021 =C3=A0 16:53, Souptick Joarder a =C3=A9crit :
> > On Tue, Jun 8, 2021 at 1:56 PM Kefeng Wang <wangkefeng.wang@huawei.com>=
 wrote:
> >>
> >> Add setup_initial_init_mm() helper to setup kernel text,
> >> data and brk.
> >>
> >> Cc: linux-snps-arc@lists.infradead.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-csky@vger.kernel.org
> >> Cc: uclinux-h8-devel@lists.sourceforge.jp
> >> Cc: linux-m68k@lists.linux-m68k.org
> >> Cc: openrisc@lists.librecores.org
> >> Cc: linuxppc-dev@lists.ozlabs.org
> >> Cc: linux-riscv@lists.infradead.org
> >> Cc: linux-sh@vger.kernel.org
> >> Cc: linux-s390@vger.kernel.org
> >> Cc: x86@kernel.org
> >> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> >> ---
> >>   include/linux/mm.h | 3 +++
> >>   mm/init-mm.c       | 9 +++++++++
> >>   2 files changed, 12 insertions(+)
> >>
> >> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >> index c274f75efcf9..02aa057540b7 100644
> >> --- a/include/linux/mm.h
> >> +++ b/include/linux/mm.h
> >> @@ -244,6 +244,9 @@ int __add_to_page_cache_locked(struct page *page, =
struct address_space *mapping,
> >>
> >>   #define lru_to_page(head) (list_entry((head)->prev, struct page, lru=
))
> >>
> >> +void setup_initial_init_mm(void *start_code, void *end_code,
> >> +                          void *end_data, void *brk);
> >> +
> >
> > Gentle query -> is there any limitation to add inline functions in
> > setup_arch() functions ?
>
> Kefeng just followed comment from Mike I guess, see
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210604070633.32=
363-2-wangkefeng.wang@huawei.com/#2696253

Ok.
>
> Christophe
>
