Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C3A42D300
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 08:53:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVKqQ6fQZz3bmr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 17:53:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVKpz5L3Gz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 17:52:58 +1100 (AEDT)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MVaQW-1m9NqM1Q8K-00RbBv for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct
 2021 08:52:54 +0200
Received: by mail-wr1-f53.google.com with SMTP id t2so16096290wrb.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 23:52:53 -0700 (PDT)
X-Gm-Message-State: AOAM533WaVAhQAgmq+H64JOGSICJd3Om4PwDYlnEAgeni74iQEUpd/un
 b3zQOLytIgOyrc07mA8Xe239Wd4TFVGcLwhjld4=
X-Google-Smtp-Source: ABdhPJzeBTr+3DEnjaiwNy7gvQWkqUGAIbkSnDvR5fWNapib2lyvZarNpPFQYOoReWXwS6roLyGXQKeyYYuevT3SsXg=
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr17137447wmi.173.1634194372923; 
 Wed, 13 Oct 2021 23:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <dbc9a149826eaa18f524635e64c207c85560c2aa.1634190022.git.christophe.leroy@csgroup.eu>
In-Reply-To: <dbc9a149826eaa18f524635e64c207c85560c2aa.1634190022.git.christophe.leroy@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Oct 2021 08:52:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3yAcU0JAri0f9q6HVrZwX_4i6Y9X4P8MebN_Krt-SLQA@mail.gmail.com>
Message-ID: <CAK8P3a3yAcU0JAri0f9q6HVrZwX_4i6Y9X4P8MebN_Krt-SLQA@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] asm-generic: Define 'func_desc_t' to commonly
 describe function descriptors
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:39Xd9kqeeUH+o0TtX8JwD4TCnfN/XiKQHBMvoyq93MBJ8acwNPh
 JmkMN7nxCtYIm3fCvzD3X/NA6x/O+7FSo9Z1h0arnXsM7I853fBjk06PdJSr+uTofYugtD3
 B1YZN/UliRy/YOH2dD9i3wYcAgzTJHjK7/NuI+iMbjDKp/gFvIdAnOxtabkvRxZOEghbwzm
 Io/aYULUuRLRWY1WWY1Tw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nD2W7hZ1u38=:8grZbweI03/FxxpuF+BeO6
 YudhiT8CQHz4KY83oLVj73lioNJy1t87Lf7ol2VxadHAjKdD97rYUg2qOu8GJ2DFNg2alwzC0
 iEM6tac5IlfjnEhYd+R4pT9ylfCYGa+CYP08QAbKe1rFzX99uSRd9rN51dg6egVsjz5hTjiZ6
 E0dn4kCH0G12cN9KwdDhYttH8xKpcMlTeeGWqqezz5+GX4MAY2fl2icrdFZpeghrB3SfcNxrJ
 FJ5tvDYdzKyszA3Pn+jeqSIDTASrNzj5BVfkf7hV6oeDC4nsoFFFMQCjIO21NTevroL5ycyIC
 N1q8qr3MyFZefF4EsH+6NTvWRGZ/qib4h+vnxbiupj3/SjWyMsD0FZgEKjqvIhDsJ17C+Iafy
 4cukhOD3DEgyXIfAlxpt4tgtETymXzKJrQF8S8w5rmFDq786ohlSj45wig8mP6kBZQo9JoHJw
 UIycZeKHY09i1dvIfcfmNRVN5numCbueu/8PVjRto6exSO9es+fuon+4jWFym0g3W/+ZTJJpO
 QmqYWZsHWR+pBmGKHn+7BQZkd0RR93qQh/y92F/HbLceW1OXvbgw6D+BBL9em7mBKfHNKqGhE
 VhoojyeVPS7EBYwQsz6cLltTbqSJZulBxgGSEROkWXhkJ+G92Jkn+FOGyXUBKq8F88k8WSsdV
 2Pd2bs5B43ZTlesAJkuQUg9SicgKNnvoTFZgNw2csAtccAvPRVN9ghsLOV5FcJpyvnlCyvDQu
 pdtkbrzp5MAg1VdVyMKMkwOvcu8hz6Zp4wfCsJ856oEsPIptPSW3rzIIwMxo4363Nk2GiMnjx
 66FwJnoEfPA2gUKKmI8XuF1Nn23hIFFRJ7owj1Jtr5NxzwNobaziDwC+B+AEZ+G6lGeSy076r
 6mcUIsc1AW+lsQal9hFA==
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 14, 2021 at 7:49 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> We have three architectures using function descriptors, each with its
> own name.
>
> Add a common typedef that can be used in generic code.
>
> Also add a stub typedef for architecture without function descriptors,
> to avoid a forest of #ifdefs.
>
> It replaces the similar func_desc_t previously defined in
> arch/powerpc/kernel/module_64.c
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Arnd Bergmann <arnd@arndb.de>
