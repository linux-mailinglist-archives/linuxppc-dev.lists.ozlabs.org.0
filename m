Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5D4C9739
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 21:44:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7Tkl2X82z3bxM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 07:44:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=F+7BPGYs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=F+7BPGYs; 
 dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7Tk158KJz30Hp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 07:43:51 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id qa43so7355356ejc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Mar 2022 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rAZcpGOFnijhfBt719P+IqprCBqe8sD9TF0Sez9IwiQ=;
 b=F+7BPGYsO9QeRc6BTbvPUJxguXCTYika7fzNVLbSEfMjTVK29FjvhOtCtbBO2oalkB
 9cweHARFFeQAeiDWhTrtcdfTzbCEOfTOrVCN9rTTV3Ek5jpvIVUt3aua8OA61CgDhA1w
 zQABsshAfnGl6gFdFI9HcnnKU8AOre3uWnEew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rAZcpGOFnijhfBt719P+IqprCBqe8sD9TF0Sez9IwiQ=;
 b=pzE6qHDdBlI+GoRlmDb2gybWq53X5yy4KWO2fUUZTJvYnQpvKJ+4GdIxAbGfdVZIRb
 O8WH/GbbDfwImPuZjM1fVbhLGlITr8eEU9YzVtPdblPFvZl6FoASw8/nGfy5h9cbPKsJ
 YHiBFmZzbFgm+AViYC0sQGeeoohY/hL7pf/0DRTeP++gNhiso9o+C+ACSV5MYiDbIItT
 V+28uQA2Mt4tFWfQdzL2W3THzqbkH17QRA1ZShPFsQT9vySMkH4tj+FDTqzFOU5gbMqZ
 /zAy1rvKRCCWcVfCutAu1Owqr4bv+PO2rI5hgx/Vg6bq0u3Jh01sl3cB7qx3EnPWvLDu
 k48Q==
X-Gm-Message-State: AOAM531R4NOhkx+2L0EEi/SvFsLx6RVTWeS8FKRVrpgNcsb0MFjs7E3E
 IoppyYDX+0UxgdHlCRuWS8w6JsM3BVfPvADxZKY=
X-Google-Smtp-Source: ABdhPJwtkBK0NNBhBR0YxhKq36UcH5O532DMYT9mrtOp15jRf1SmOXQHpwuWbudlMat/8MiggfGtbw==
X-Received: by 2002:a17:906:c14c:b0:6d7:1278:d80c with SMTP id
 dp12-20020a170906c14c00b006d71278d80cmr2187144ejc.660.1646167428071; 
 Tue, 01 Mar 2022 12:43:48 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 yy18-20020a170906dc1200b006d6e5c75029sm908175ejb.187.2022.03.01.12.43.47
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 12:43:47 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id d10so33890063eje.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Mar 2022 12:43:47 -0800 (PST)
X-Received: by 2002:ac2:44a4:0:b0:445:8fc5:a12a with SMTP id
 c4-20020ac244a4000000b004458fc5a12amr10608648lfm.27.1646166980002; Tue, 01
 Mar 2022 12:36:20 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-7-jakobkoschel@gmail.com>
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 12:36:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLtKofBbn9kSXRU3MpdX7S2OxN1V5Mc679oJpFnp_VnQ@mail.gmail.com>
Message-ID: <CAHk-=wgLtKofBbn9kSXRU3MpdX7S2OxN1V5Mc679oJpFnp_VnQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] treewide: remove check of list iterator against head
 past the loop body
To: Jakob Koschel <jakobkoschel@gmail.com>
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 linux-block <linux-block@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

So looking at this patch, I really reacted to the fact that quite
often the "use outside the loop" case is all kinds of just plain
unnecessary, but _used_ to be a convenience feature.

I'll just quote the first chunk in it's entirely as an example - not
because I think this chunk is particularly important, but because it's
a good example:

On Mon, Feb 28, 2022 at 3:09 AM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> diff --git a/arch/arm/mach-mmp/sram.c b/arch/arm/mach-mmp/sram.c
> index 6794e2db1ad5..fc47c107059b 100644
> --- a/arch/arm/mach-mmp/sram.c
> +++ b/arch/arm/mach-mmp/sram.c
> @@ -39,19 +39,22 @@ static LIST_HEAD(sram_bank_list);
>  struct gen_pool *sram_get_gpool(char *pool_name)
>  {
>         struct sram_bank_info *info = NULL;
> +       struct sram_bank_info *tmp;
>
>         if (!pool_name)
>                 return NULL;
>
>         mutex_lock(&sram_lock);
>
> -       list_for_each_entry(info, &sram_bank_list, node)
> -               if (!strcmp(pool_name, info->pool_name))
> +       list_for_each_entry(tmp, &sram_bank_list, node)
> +               if (!strcmp(pool_name, tmp->pool_name)) {
> +                       info = tmp;
>                         break;
> +               }
>
>         mutex_unlock(&sram_lock);
>
> -       if (&info->node == &sram_bank_list)
> +       if (!info)
>                 return NULL;
>
>         return info->gpool;

I realize this was probably at least auto-generated with coccinelle,
but maybe that script could be taught to do avoid the "use after loop"
by simply moving the code _into_ the loop.

IOW, this all would be cleaner and clear written as

        if (!pool_name)
                return NULL;

        mutex_lock(&sram_lock);
        list_for_each_entry(info, &sram_bank_list, node) {
                if (!strcmp(pool_name, info->pool_name)) {
                        mutex_unlock(&sram_lock);
                        return info;
                }
        }
        mutex_unlock(&sram_lock);
        return NULL;

Ta-daa - no use outside the loop, no need for new variables, just a
simple "just do it inside the loop". Yes, we end up having that lock
thing twice, but it looks worth it from a "make the code obvious"
standpoint.

Would it be even cleaner if the locking was done in the caller, and
the loop was some simple helper function? It probably would. But that
would require a bit more smarts than probably a simple coccinelle
script would do.

                Linus
