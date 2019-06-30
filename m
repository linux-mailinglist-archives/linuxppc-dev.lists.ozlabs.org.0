Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CAB5B24F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 01:16:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cRGQ1fqQzDqVV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 09:16:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="csee+4T6"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cRDk38lhzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 09:15:17 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id e3so24473547ioc.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 16:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ukLhGHbIyQ00fzuRpIZVHRPuZHLlfMkPEmohwK6IU0Q=;
 b=csee+4T62kiCMCAlflioXhkuHod176Tc7bO9lT9cWxEIFbcxm8mgm+3EwgHYTEDgZ5
 7oV4VouHsyf0xPdXpocf7WwzgKPW3dcGYv8dQ23GwxIw9EuPH/1UAZv5r8aFNmuId1Y8
 8vFoNFzxoO3M24exIjWhyLnTrX6wm832dcoq8MNKbWkGo//16woWUX6i7m3fwVX+lCcx
 RIzxEhtSO9+cGZEkQgfUjZ/6mQoqEaDg/1/lsz2VsYbdpSu7FFg+ZZOj9hby4heE/AEP
 mcyOV6M9dI1Nmliy6btJZ3qBwdACH5041sjNG8R9pqfIxLuJrl4zE3RNT6xM4ZE/Yq93
 CLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ukLhGHbIyQ00fzuRpIZVHRPuZHLlfMkPEmohwK6IU0Q=;
 b=lUNW6B2F2/xkHROSujVyNvr8nFhxXdgfXvJByeV9SPbSDnF0CggkKlFBWprkgAG9XB
 kgJTN6ynC/5tpfg/0aqfW6Q6WjNeLqkDdPgyDJXS7hX7eOMOWt6zDEvZFjv0CMB0wg+/
 pYpBjLSLORIuhvIZmF36nQWDXZdQZ4x+55ajzPH39uKkADG5McU6UosGY9u3PQEvbRFv
 hbmfP5dgO/KYlT261E3Idb/DEFRCrawnMPIoixMgkzcrCpcgopLYfRUNtiLOrZRUo0Fn
 T9UetgyWSa2WTXgJ4sc64hr5JjpQcokUCuPiDJKAK09FjoeH1qh7p6IWTLDYKLn9vUOc
 Chsg==
X-Gm-Message-State: APjAAAXB6YQpvCJ/xojROF3xPEK7lBWb1s+8wA3WUydBdU2+pLKi1x87
 DZ54Q5UIv6PxRCTt40hccSYMlF7/ru37zTPkCb4=
X-Google-Smtp-Source: APXvYqyS3xCx6qNfC0ufJx8Mo37UJ8K/UGb+gHELYii/6Aj/ZmA90/bEwqZ0Hr5Z8UfcQUxUl8MdjDh2v7ZyxIVk6wA=
X-Received: by 2002:a05:6602:22cc:: with SMTP id
 e12mr13975769ioe.192.1561936514816; 
 Sun, 30 Jun 2019 16:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190629073813.12973-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190629073813.12973-1-aneesh.kumar@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 1 Jul 2019 09:15:03 +1000
Message-ID: <CAOSf1CH_X7TG7Cato4hBt+U5=5HHHwR3hXQYC-z_GiBQiWnB1w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/mm/nvdimm: Add an informative message if we fail
 to allocate altmap block
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 29, 2019 at 5:39 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Allocation from altmap area can fail based on vmemmap page size used. Add kernel
> info message to indicate the failure. That allows the user to identify whether they
> are really using persistent memory reserved space for per-page metadata.
>
> The message looks like:
> [  136.587212] altmap block allocation failed, falling back to system memory
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/init_64.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index a4e17a979e45..57c0573650dc 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -194,8 +194,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>                  * fail due to alignment issues when using 16MB hugepages, so
>                  * fall back to system memory if the altmap allocation fail.
>                  */
> -               if (altmap)
> +               if (altmap) {
>                         p = altmap_alloc_block_buf(page_size, altmap);
> +                       if (!p)

> +                               pr_info("altmap block allocation failed, " \
> +                                       "falling back to system memory");

I think this is kind of misleading. If you're mapping a large amount
of memory you can have most of the vmemmap backing allocated from the
altmap and one extra block allocated from normal memory. E.g. If you
have 32MB of altmap space, one 16MB block will be allocated from the
altmap, but the 2nd 16MB block is probably unusable due to the
reserved pages at the start of the altmap. Maybe this should be a
pr_debug() so it's only printed along with the "vmemmap_populate ..."
message above?

Also, isn't kernel style to keep printf()s, even long ones, on one line?

Oliver
