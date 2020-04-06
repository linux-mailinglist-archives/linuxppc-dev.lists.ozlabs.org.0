Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58E19F663
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:05:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wrPH2q42zDqRy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:05:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrK85Yh3zDqNg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:01:48 +1000 (AEST)
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MdNTy-1imNgD0wq0-00ZSk0 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr
 2020 15:01:41 +0200
Received: by mail-qt1-f172.google.com with SMTP id c14so12725667qtp.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 06:01:41 -0700 (PDT)
X-Gm-Message-State: AGi0PuZKJSh6Kxlm9lZhRvg/idm3UXnd6UVo9ascV/hs0OjnaL2Ca9LR
 1q8HNvgkGuSTO5oABnpiZQiyWDgphJ7H9fK8I8c=
X-Google-Smtp-Source: APiQypKGl0rcjmxPk7LYkIyq/3sFEAQ9JSPbooEo+AQI5dEX6atvP7qavyGi7h4ravOrmygkje1eLWDqMVjJqya7e2s=
X-Received: by 2002:ac8:d8e:: with SMTP id s14mr20274585qti.204.1586178100052; 
 Mon, 06 Apr 2020 06:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200406120312.1150405-1-hch@lst.de>
 <20200406120312.1150405-3-hch@lst.de>
In-Reply-To: <20200406120312.1150405-3-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 6 Apr 2020 15:01:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a02LQNOehukgaCj81wg1D2XhW1=_mQZ72cT6nQdO=mhOw@mail.gmail.com>
Message-ID: <CAK8P3a02LQNOehukgaCj81wg1D2XhW1=_mQZ72cT6nQdO=mhOw@mail.gmail.com>
Subject: Re: [PATCH 2/6] binfmt_elf: open code copy_siginfo_to_user to
 kernelspace buffer
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:NawjapGPLfDXFNI2x9lzW9uS0D2IXon+92uq59ydRPsyVxVBwDH
 5h4/SzdPZ3K+0heoPtdYwi7XCBA5lhh2ZEhZPVyX/SRDg7hqv847xjIXbvFDTJGOichhSRp
 Aj4gx4RY9md2AlwvpDu1HDe/xLgDrABBHTRjtQweWMfPEZr6zoeh+/WUxXjNJ3Keq1am0yl
 RlZ6ozraKQ2dBxlVZzIQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c077CRhLjAc=:l1aAxS10rIkhe8UfCjLBFm
 1Hr5qGZP0pRnS0QkP7NAEW3K0h86xPZezMsHlZeaSdFCGIm8IeMlad7JpBK9xM33ombJYRSrE
 sgHrESPL8VHygS/y6FVII08q1oJcj/u4Ax5ZwKylkI1Iczc7sLaOPKyUdDSo5xcicd40TFImb
 PW+8ov3Lt42x1+uj7zCeLqNH/TV4hNfZTcSaIJ3Agc2wRLMxPRz9nr7jTfLty6MeYj1CBjJ0j
 IljX+B6/skFB0OGZLbxIJJ/QOqsUDf0X29jlKsoyOWYyAbQRSaHPzRs4Z4iy+Df5ekDNtpIJo
 3kw1AE/Z+TIKqX3NlxhP05nKxwHdg0qfX8ggTi7XgevjKZTKc2MrOb/fOxVGGrXqqc9fr9zRU
 bdvr5M8qSFWgMTeTmmJDAL+cz+5zOCaGb9E6ALwWLLIrgcQ5j3egDTsMhVWsqNa3+NWjGYW0K
 O3mw6b9a+XIidEseMO3VLgk8Xs/Bm5/mBfGsxryrcUaIbaBfec07aR8iT5u6+6kQ1uDV4RejF
 DKEMALMwNUABnJMER00M4h9p2QeJFYvDj/4x4J0khDVn1J82I0I9UHFuQ4BwGNh3qAMScwT2j
 jCoafj1eyXJqzw/CvYI5PwifPcxta04gKTjcrT2q9tANCSd+xCpgYWkgXM3VZUI+2Fk9+WndU
 v6owzqDBrhDL3oH0BWr+/hFV3UbIZ2w3j+qb/GG+Jy5w4PBRR+UGTiPcTtBARuoNH+i9J0iGu
 NUVMHPx6SIjcwMdHSxPhfuomssPPUh8JsI4j9m0K1YgZR7mpJkEl4JQXhOfkvC3XmrhPv9Pbb
 ewoE1PIQ6+ZvxlH/+9EPEhTSAAuYe1jcsi+33eNMiemTYM6Tho=
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 6, 2020 at 2:03 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Instead of messing with the address limit just open code the trivial
> memcpy + memset logic.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/binfmt_elf.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index f4713ea76e82..d744ce9a4b52 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -1556,10 +1556,9 @@ static void fill_auxv_note(struct memelfnote *note, struct mm_struct *mm)
>  static void fill_siginfo_note(struct memelfnote *note, user_siginfo_t *csigdata,
>                 const kernel_siginfo_t *siginfo)
>  {
> -       mm_segment_t old_fs = get_fs();
> -       set_fs(KERNEL_DS);
> -       copy_siginfo_to_user((user_siginfo_t __user *) csigdata, siginfo);
> -       set_fs(old_fs);
> +       memcpy(csigdata, siginfo, sizeof(struct kernel_siginfo));
> +       memset((char *)csigdata + sizeof(struct kernel_siginfo), 0,
> +               SI_EXPANSION_SIZE);
>         fill_note(note, "CORE", NT_SIGINFO, sizeof(*csigdata), csigdata);
>  }

I think this breaks compat binfmt-elf mode, which relies on this trick:

fs/compat_binfmt_elf.c:#define copy_siginfo_to_user     copy_siginfo_to_user32
fs/compat_binfmt_elf.c#include "binfmt_elf.c"

At least we seem to only have one remaining implementation of
__copy_siginfo_to_user32(), so fixing this won't require touching all
architectures, but I don't see an obvious way to do it right. Maybe
compat-binfmt-elf.c should just override fill_siginfo_note() itself
rather than overriding copy_siginfo_to_user().

       Arnd
