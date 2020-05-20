Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4331DC33E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 01:54:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S8jg3kptzDqfb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 09:54:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.66; helo=mail-io1-f66.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S8h21jGFzDqR7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 09:52:46 +1000 (AEST)
Received: by mail-io1-f66.google.com with SMTP id q8so3967847iow.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 16:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3dbkyD/cvpqM50H27FORebvzPzcKiAhshHA3jHU7b0g=;
 b=g8UvWqYQARJaZ4w9Xe5VvZvnetxKTjx/SrO4H594W88z9j/km45LcvRaCI9ygOFMuV
 b+MZ9SCqJj9SUQz6S7SVsgHkuslQsm297MtZK8Mx9OPiixI9M3iY8Raf5bF4XkuTkJBO
 g/9HYc3xYiTN+rSa4MOco9M/BvOHFLmc5Qml5PsQ6tS9gQV2kdQ5UuqPe8fXIwF0KZb4
 eMrYjtFV8iiQncB+Yf/ddjfFSIF5PVUVWD6BHcRsDYXRgsO+p0BD1QHX4Cz9gv61F6FL
 XZzeNsjHE5p8LQBmH1rCZ+PZsRz+3BngqFYJGZUMXCtNZkiS2/WEtOBaDB+KQo1HUHJ6
 zA9g==
X-Gm-Message-State: AOAM533zLRzucx/Ony6gGojF0z33ZxtYosK0RME3rjRcJ04KdMZuj/g/
 0LcQdv6mdM21igSpeweSfOF7DoWF
X-Google-Smtp-Source: ABdhPJzf+pt8BC827mr+1sFQfT17Sj5SOzGzwID4BRDsR8znXTxeis/JLl1xSdewEupTL5yHPQ9AjA==
X-Received: by 2002:a02:3215:: with SMTP id j21mr1546580jaa.47.1590018763708; 
 Wed, 20 May 2020 16:52:43 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id p3sm1696965iog.31.2020.05.20.16.52.43
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 16:52:43 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id o5so5334472iow.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 16:52:43 -0700 (PDT)
X-Received: by 2002:a5e:8b4b:: with SMTP id z11mr5539177iom.78.1590018762757; 
 Wed, 20 May 2020 16:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200518221904.GA22274@embeddedor>
 <202005181529.C0CB448FBB@keescook>
In-Reply-To: <202005181529.C0CB448FBB@keescook>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 20 May 2020 18:52:21 -0500
X-Gmail-Original-Message-ID: <CADRPPNR-Croux9FgnrQJJmdF2jNnuAmC+2xMJSgSbkbRv9u8Mw@mail.gmail.com>
Message-ID: <CADRPPNR-Croux9FgnrQJJmdF2jNnuAmC+2xMJSgSbkbRv9u8Mw@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: Replace one-element array and use
 struct_size() helper
To: Kees Cook <keescook@chromium.org>
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 18, 2020 at 5:57 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, May 18, 2020 at 05:19:04PM -0500, Gustavo A. R. Silva wrote:
> > The current codebase makes use of one-element arrays in the following
> > form:
> >
> > struct something {
> >     int length;
> >     u8 data[1];
> > };
> >
> > struct something *instance;
> >
> > instance = kmalloc(sizeof(*instance) + size, GFP_KERNEL);
> > instance->length = size;
> > memcpy(instance->data, source, size);
> >
> > but the preferred mechanism to declare variable-length types such as
> > these ones is a flexible array member[1][2], introduced in C99:
> >
> > struct foo {
> >         int stuff;
> >         struct boo array[];
> > };
> >
> > By making use of the mechanism above, we will get a compiler warning
> > in case the flexible array does not occur last in the structure, which
> > will help us prevent some kind of undefined behavior bugs from being
> > inadvertently introduced[3] to the codebase from now on. So, replace
> > the one-element array with a flexible-array member.
> >
> > Also, make use of the new struct_size() helper to properly calculate the
> > size of struct qe_firmware.
> >
> > This issue was found with the help of Coccinelle and, audited and fixed
> > _manually_.
> >
> > [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> > [2] https://github.com/KSPP/linux/issues/21
> > [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> >
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  drivers/soc/fsl/qe/qe.c | 4 ++--
> >  include/soc/fsl/qe/qe.h | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> > index 447146861c2c1..2df20d6f85fa4 100644
> > --- a/drivers/soc/fsl/qe/qe.c
> > +++ b/drivers/soc/fsl/qe/qe.c
> > @@ -448,7 +448,7 @@ int qe_upload_firmware(const struct qe_firmware *firmware)
> >       unsigned int i;
> >       unsigned int j;
> >       u32 crc;
> > -     size_t calc_size = sizeof(struct qe_firmware);
> > +     size_t calc_size;
> >       size_t length;
> >       const struct qe_header *hdr;
> >
> > @@ -480,7 +480,7 @@ int qe_upload_firmware(const struct qe_firmware *firmware)
> >       }
> >
> >       /* Validate the length and check if there's a CRC */
> > -     calc_size += (firmware->count - 1) * sizeof(struct qe_microcode);
> > +     calc_size = struct_size(firmware, microcode, firmware->count);
> >
> >       for (i = 0; i < firmware->count; i++)
> >               /*
> > diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
> > index e282ac01ec081..3feddfec9f87d 100644
> > --- a/include/soc/fsl/qe/qe.h
> > +++ b/include/soc/fsl/qe/qe.h
> > @@ -307,7 +307,7 @@ struct qe_firmware {
> >               u8 revision;            /* The microcode version revision */
> >               u8 padding;             /* Reserved, for alignment */
> >               u8 reserved[4];         /* Reserved, for future expansion */
> > -     } __attribute__ ((packed)) microcode[1];
> > +     } __packed microcode[];
> >       /* All microcode binaries should be located here */
> >       /* CRC32 should be located here, after the microcode binaries */
> >  } __attribute__ ((packed));
> > --
> > 2.26.2
> >
>
> Hm, looking at this code, I see a few other things that need to be
> fixed:
>
> 1) drivers/tty/serial/ucc_uart.c does not do a be32_to_cpu() conversion
>    on the length test (understandably, a little-endian system has never run
>    this code since it's ppc specific), but it's still wrong:
>
>         if (firmware->header.length != fw->size) {
>
>    compare to the firmware loader:
>
>         length = be32_to_cpu(hdr->length);
>
> 2) drivers/soc/fsl/qe/qe.c does not perform bounds checking on the
>    per-microcode offsets, so the uploader might send data outside the
>    firmware buffer. Perhaps:

We do validate the CRC for each microcode, it is unlikely the CRC
check can pass if the offset or length is not correct.  But you are
probably right that it will be safer to check the boundary and fail
quicker before we actually start the CRC check.  Will you come up with
a formal patch or you want us to deal with it?

>
>
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 447146861c2c..c4e0bc452f03 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -451,6 +451,7 @@ int qe_upload_firmware(const struct qe_firmware *firmware)
>         size_t calc_size = sizeof(struct qe_firmware);
>         size_t length;
>         const struct qe_header *hdr;
> +       void *firmware_end;
>
>         if (!firmware) {
>                 printk(KERN_ERR "qe-firmware: invalid pointer\n");
> @@ -491,19 +492,39 @@ int qe_upload_firmware(const struct qe_firmware *firmware)
>                 calc_size += sizeof(__be32) *
>                         be32_to_cpu(firmware->microcode[i].count);
>
> -       /* Validate the length */
> +       /* Validate total length */
>         if (length != calc_size + sizeof(__be32)) {
>                 printk(KERN_ERR "qe-firmware: invalid length\n");
>                 return -EPERM;
>         }
>
>         /* Validate the CRC */
> -       crc = be32_to_cpu(*(__be32 *)((void *)firmware + calc_size));
> +       firmware_end = (void *)firmware + calc_size;
> +       crc = be32_to_cpu(*(__be32 *)firmware_end);
>         if (crc != crc32(0, firmware, calc_size)) {
>                 printk(KERN_ERR "qe-firmware: firmware CRC is invalid\n");
>                 return -EIO;
>         }
>
> +       /* Validate ucode lengths and offsets */
> +       for (i = 0; i < firmware->count; i++) {
> +               const struct qe_microcode *ucode = &firmware->microcode[i];
> +               __be32 *code;
> +               size_t count;
> +
> +               if (!ucode->code_offset)
> +                       continue;
> +
> +               code = (void *)firmware + be32_to_cpu(ucode->code_offset);
> +               count = be32_to_cpu(ucode->count) * sizeof(*code);
> +
> +               if (code < firmware || code >= firmware_end ||
> +                   code + count < firmware || code + count >= firmware_end) {
> +                       printk(KERN_ERR "qe-firmware: invalid ucode offset\n");
> +                       return -EIO;
> +               }
> +       }
> +
>         /*
>          * If the microcode calls for it, split the I-RAM.
>          */
>
>
> I haven't tested this.
>
>
> --
> Kees Cook
