Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3DA35B007
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 21:11:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHl3P5dHqz3bwH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 05:11:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CIhhz328;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CIhhz328; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHl2z0KWvz2yyM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 05:11:06 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2CC2611AF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 19:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618081863;
 bh=rBfw+r2um68UpFbzVkxVlHHyJ+hgFPf/zBrFYQw7TNI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CIhhz328zzet5a/BvXZzSs9qZeOvsRmdTIQX8oHvPt4oPq31f6SdMiRQlV3wwxeNa
 GmirfKbnBbXy13rC5mPC5X4IYTxOrbfSp201pVc2ivwXNFWXhMjpUUd6Z3P6GdAypc
 hXQbk3jNgzXE4abVKr5LlTbMx3yus3tJYykOkPF4g5QUy/4sEmN3QnSl1XUTyImSG8
 +nrIDp4z3hEGajjGuvQYOwmAvld9GZf6ZqRXKlZ6kJNOxc2eYZ8HIjAVZ3TijeONug
 5j3gyVLCEPaB6nGAjThA9V1IH5nKdc2cpKmOF0OJJIEPxgrvw2FaG4CSqtEAVnEU7R
 BXNDi+Akq/Lhw==
Received: by mail-ot1-f42.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so8983428oto.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 12:11:03 -0700 (PDT)
X-Gm-Message-State: AOAM532clOMaMOkCMiTGX/GSrajPzMXgcRrpgPartsdG4px+fHiVkHUt
 kMNJEpjvfztvSZJ8xQ09qX3BFF/iVjoUscrvjlk=
X-Google-Smtp-Source: ABdhPJy5fKRN+b0N+vdm7HuaN0voD9Ksx0FbjR4NiXXEFlqO3Rbtb6TftW/JNl1MSl+hXOUABL/gf3HkAiDbD0wFK7g=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr17843523otq.251.1618081863076; 
 Sat, 10 Apr 2021 12:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210409185105.188284-3-willy@infradead.org>
 <202104100656.N7EVvkNZ-lkp@intel.com>
 <20210410024313.GX2531743@casper.infradead.org>
In-Reply-To: <20210410024313.GX2531743@casper.infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 10 Apr 2021 21:10:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3uEGaEN-p06vFP+jwbFt3P=Bx4=aRN+kUyB4PcFPxLRg@mail.gmail.com>
Message-ID: <CAK8P3a3uEGaEN-p06vFP+jwbFt3P=Bx4=aRN+kUyB4PcFPxLRg@mail.gmail.com>
Subject: Re: Bogus struct page layout on 32-bit
To: Matthew Wilcox <willy@infradead.org>
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 10, 2021 at 4:44 AM Matthew Wilcox <willy@infradead.org> wrote:
> +                       dma_addr_t dma_addr __packed;
>                 };
>                 struct {        /* slab, slob and slub */
>                         union {
>
> but I don't know if GCC is smart enough to realise that dma_addr is now
> on an 8 byte boundary and it can use a normal instruction to access it,
> or whether it'll do something daft like use byte loads to access it.
>
> We could also do:
>
> +                       dma_addr_t dma_addr __packed __aligned(sizeof(void *));
>
> and I see pahole, at least sees this correctly:
>
>                 struct {
>                         long unsigned int _page_pool_pad; /*     4     4 */
>                         dma_addr_t dma_addr __attribute__((__aligned__(4))); /*     8     8 */
>                 } __attribute__((__packed__)) __attribute__((__aligned__(4)));
>
> This presumably affects any 32-bit architecture with a 64-bit phys_addr_t
> / dma_addr_t.  Advice, please?

I've tried out what gcc would make of this:  https://godbolt.org/z/aTEbxxbG3

struct page {
    short a;
    struct {
        short b;
        long long c __attribute__((packed, aligned(2)));
    } __attribute__((packed));
} __attribute__((aligned(8)));

In this structure, 'c' is clearly aligned to eight bytes, and gcc does
realize that
it is safe to use the 'ldrd' instruction for 32-bit arm, which is forbidden on
struct members with less than 4 byte alignment. However, it also complains
that passing a pointer to 'c' into a function that expects a 'long long' is not
allowed because alignof(c) is only '2' here.

(I used 'short' here because I having a 64-bit member misaligned by four
bytes wouldn't make a difference to the instructions on Arm, or any other
32-bit architecture I can think of, regardless of the ABI requirements).

      Arnd
