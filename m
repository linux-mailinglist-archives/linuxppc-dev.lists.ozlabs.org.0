Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B4C256970
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 19:32:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bf3SB6BNGzDqlS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 03:32:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=YhUjtZ6U; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bf3Q70W6ZzDqdV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 03:30:20 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id r13so2323008ljm.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 10:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tcoa+YjQiCXzGdpiXTdeu40vvjnErZlPnbw45C2h1Hg=;
 b=YhUjtZ6UWDO6ICBxyUejNtYoojZ1/MzasHc6HRhV1QQG0ZTdq1nBIaLOW2DmRHE1RK
 8sokc72j0PovTAfxw6ZBkZRQnzWFlOSdsut22Y5F3m8DXx3aZaYvcaysiimrlXYjmvVQ
 fx718s8yIazse/haX/97e3zZOvICf6iGBWCFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tcoa+YjQiCXzGdpiXTdeu40vvjnErZlPnbw45C2h1Hg=;
 b=FH2Zj9ZOtYfhACDmrT5Aj/qCNtE7rgYhwHtfXML4g/VNb/Tc8r/DcaO4mzAWbUOlP/
 uynUomFAoT5mY2uAsYxGfd0NGgcp6uEDIy7WzI2LDzkp7uosrFzQ3la16Jta/OnyT/OO
 rx6CWLmxhCEWaM/bJMebGUNoFvJuEx62GgAPeYKao9WDB8SQgE+W/iu7YCe2sgiBtFzp
 XYqZSAzTRXrWF42Ct92WfJcSZLC2+n1JWaOfvUUUtBCoUgi7nzcj1uhAI4R9PN64gDWP
 gQ5S7fXdoXBPpzguJkqaPzMHCgmqKkdzOpCl0Z9W415ERRQiU8zGUCxfbsoqCXzxsNsh
 qQdQ==
X-Gm-Message-State: AOAM531YKDwR5EMpq9SqAsF+6SgXa2fjmSC1h4VVnrQD0/1moFkQnMom
 yjyeMdeGw6QEGf75rlhLPD34stCF3oJzOA==
X-Google-Smtp-Source: ABdhPJy3kxrGiQDUJz+fufRy1YESQP5xLqlcH7QkXJiHbpFyxnVQN+elQ2+L7ZqH0JNkDfge++ZYZg==
X-Received: by 2002:a2e:b892:: with SMTP id r18mr1746569ljp.249.1598722214519; 
 Sat, 29 Aug 2020 10:30:14 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id j17sm743295lfr.32.2020.08.29.10.30.12
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 10:30:12 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id k10so1344023lfm.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 10:30:12 -0700 (PDT)
X-Received: by 2002:ac2:58db:: with SMTP id u27mr2019987lfo.142.1598722211766; 
 Sat, 29 Aug 2020 10:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200829105116.GA246533@roeck-us.net>
 <20200829124538.7475-1-luc.vanoostenryck@gmail.com>
In-Reply-To: <20200829124538.7475-1-luc.vanoostenryck@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 29 Aug 2020 10:29:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=whH0ApHy0evN0q6AwQ+-a5RK56oMkYkkCJtTMnaq4FrNQ@mail.gmail.com>
Message-ID: <CAHk-=whH0ApHy0evN0q6AwQ+-a5RK56oMkYkkCJtTMnaq4FrNQ@mail.gmail.com>
Subject: Re: [PATCH] fsldma: fsl_ioread64*() do not need lower_32_bits()
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000008765a305ae078552"
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Joerg Roedel <joerg.roedel@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dan Williams <dan.j.williams@intel.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000008765a305ae078552
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 29, 2020 at 5:46 AM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> But the pointer is already 32-bit, so simply cast the pointer to u32.

Yeah, that code was completely pointless. If the pointer had actually
been 64-bit, the old code would have warned too.

The odd thing is that the fsl_iowrite64() functions make sense. It's
only the fsl_ioread64() functions that seem to be written by somebody
who is really confused.

That said, this patch only humors the confusion. The cast to 'u32' is
completely pointless. In fact, it seems to be actively wrong, because
it means that the later "fsl_addr + 1" is done entirely incorrectly -
it now literally adds "1" to an integer value, while the iowrite()
functions will add one to a "u32 __iomem *" pointer (so will do
pointer arithmetic, and add 4).

So this code has never ever worked correctly to begin with, but the
patches to fix the warning miss the point. The problem isn't the
warning, the problem is that the code is broken and completely wrong
to begin with.

And the "lower_32_bits()" thing has always been pure and utter
confusion and complete garbage.

I *think* the right patch is the one attached, but since this code is
clearly utterly broken, I'd want somebody to test it.

It has probably never ever worked on 32-bit powerpc, or did so purely
by mistake (perhaps because nobody really cares - the only 64-bit use
is this:

    static dma_addr_t get_cdar(struct fsldma_chan *chan)
    {
        return FSL_DMA_IN(chan, &chan->regs->cdar, 64) & ~FSL_DMA_SNEN;
    }

and there are two users of that: one which ignores the return value,
and one that looks like it might end up half-way working even if the
value read was garbage (it's used only to compare against a "current
descriptor" value).

Anyway, the fix is definitely not to just shut up the warning. The
warning is only a sign of utter confusion in that driver.

Can somebody with the hardware test this on 32-bit ppc?

And if not (judging by just how broken those functions are, maybe it
never did work), can somebody with a ppc32 setup at least compile-test
this patch and look at whether it makes sense, in ways the old code
did not.

                Linus

--0000000000008765a305ae078552
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_kefxvfs30>
X-Attachment-Id: f_kefxvfs30

IGRyaXZlcnMvZG1hL2ZzbGRtYS5oIHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1h
L2ZzbGRtYS5oIGIvZHJpdmVycy9kbWEvZnNsZG1hLmgKaW5kZXggNTZmMThhZTk5MjMzLi5jNTc0
ZDIyM2Q1MmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hL2ZzbGRtYS5oCisrKyBiL2RyaXZlcnMv
ZG1hL2ZzbGRtYS5oCkBAIC0yMDUsMTAgKzIwNSwxMCBAQCBzdHJ1Y3QgZnNsZG1hX2NoYW4gewog
I2Vsc2UKIHN0YXRpYyB1NjQgZnNsX2lvcmVhZDY0KGNvbnN0IHU2NCBfX2lvbWVtICphZGRyKQog
ewotCXUzMiBmc2xfYWRkciA9IGxvd2VyXzMyX2JpdHMoYWRkcik7Ci0JdTY0IGZzbF9hZGRyX2hp
ID0gKHU2NClpbl9sZTMyKCh1MzIgKikoZnNsX2FkZHIgKyAxKSkgPDwgMzI7CisJdTMyIHZhbF9s
byA9IGluX2xlMzIoKHUzMiBfX2lvbWVtICopYWRkcik7CisJdTMyIHZhbF9oaSA9IGluX2xlMzIo
KHUzMiBfX2lvbWVtICopYWRkciArIDEpOwogCi0JcmV0dXJuIGZzbF9hZGRyX2hpIHwgaW5fbGUz
MigodTMyICopZnNsX2FkZHIpOworCXJldHVybiAoKHU2NCl2YWxfaGkgPDwgMzIpICsgdmFsX2xv
OwogfQogCiBzdGF0aWMgdm9pZCBmc2xfaW93cml0ZTY0KHU2NCB2YWwsIHU2NCBfX2lvbWVtICph
ZGRyKQpAQCAtMjE5LDEwICsyMTksMTAgQEAgc3RhdGljIHZvaWQgZnNsX2lvd3JpdGU2NCh1NjQg
dmFsLCB1NjQgX19pb21lbSAqYWRkcikKIAogc3RhdGljIHU2NCBmc2xfaW9yZWFkNjRiZShjb25z
dCB1NjQgX19pb21lbSAqYWRkcikKIHsKLQl1MzIgZnNsX2FkZHIgPSBsb3dlcl8zMl9iaXRzKGFk
ZHIpOwotCXU2NCBmc2xfYWRkcl9oaSA9ICh1NjQpaW5fYmUzMigodTMyICopZnNsX2FkZHIpIDw8
IDMyOworCXUzMiB2YWxfaGkgPSBpbl9iZTMyKCh1MzIgX19pb21lbSAqKWFkZHIpOworCXUzMiB2
YWxfbG8gPSBpbl9iZTMyKCh1MzIgX19pb21lbSAqKWFkZHIrMSk7CiAKLQlyZXR1cm4gZnNsX2Fk
ZHJfaGkgfCBpbl9iZTMyKCh1MzIgKikoZnNsX2FkZHIgKyAxKSk7CisJcmV0dXJuICgodTY0KXZh
bF9oaSA8PCAzMikgKyB2YWxfbG87CiB9CiAKIHN0YXRpYyB2b2lkIGZzbF9pb3dyaXRlNjRiZSh1
NjQgdmFsLCB1NjQgX19pb21lbSAqYWRkcikK
--0000000000008765a305ae078552--
