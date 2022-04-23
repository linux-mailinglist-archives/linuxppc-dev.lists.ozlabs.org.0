Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3208850C82C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 10:06:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlkPj0QL9z3bs8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 18:06:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.172;
 helo=mail-qt1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlkPG1M2hz3bWx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 18:06:08 +1000 (AEST)
Received: by mail-qt1-f172.google.com with SMTP id hf18so7078417qtb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 01:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MnsKeIXdOWL+qzKGmeKdJ+/k4zo4q4coagprsKaIqao=;
 b=SOSxPnk+uQsmsHIuG+ZshW0pCVD6IUlzEyZcs6pbHdwMUH0mc/H8nNHjXLRp82/rBL
 N89LYIJmftpZ+nI96Y9xOuJ2tiF7oqCIoYwxtCfekvkgxJaxv7fx+7pQgVoSgkk0nTxe
 dJog0dBPI3DXPtJ5UsZUkye/LBP6vmxmvLs7B3YBRuLQDhCw+gDkX74mfFE1kpsjOg7R
 oZkZcP/AtLjIfJp97aY/N8s3J2yRT7wwvyymSxZkWmwJYHFh+I+kxYKg64X7Ix7WTkuH
 9MDhGU49Vg5TAd+vVsPGSQh3nKyxscYLqvKfDjJXWFRoOmHf+kuzppo5ctT5SXR2FaRV
 Qo8g==
X-Gm-Message-State: AOAM53020PAcaAVhwH1iHRUEPEaKp0sDAvP5Nvr0qn7VdB3fgIAlHJty
 2EHNeV+901tmihVeffet1noHmJrTuGPG8w==
X-Google-Smtp-Source: ABdhPJyJQk9mYwk2NZ0pnQNmaW8kiFEy65mBh9Wvy3qqb+b6B4oaFfmfctNkeKTg24dOjHHUcP+5dw==
X-Received: by 2002:ac8:7387:0:b0:2f1:eb13:ceb2 with SMTP id
 t7-20020ac87387000000b002f1eb13ceb2mr5724444qtp.51.1650701164538; 
 Sat, 23 Apr 2022 01:06:04 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 n22-20020ac85b56000000b002f1d7a2867dsm2519413qtw.67.2022.04.23.01.06.03
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 01:06:03 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id j2so18433701ybu.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 01:06:03 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr8029426ybq.393.1650701163360; Sat, 23
 Apr 2022 01:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220421070440.1282704-1-hch@lst.de>
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 23 Apr 2022 10:05:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw6c-dEOJUyZaQqOj=udmk9X8pxyd-nyph4K4at7iaDQ@mail.gmail.com>
Message-ID: <CAMuHMdUw6c-dEOJUyZaQqOj=udmk9X8pxyd-nyph4K4at7iaDQ@mail.gmail.com>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
To: Christoph Hellwig <hch@lst.de>
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
Cc: netdev <netdev@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 11:14 PM Christoph Hellwig <hch@lst.de> wrote:
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/lib/checksum.c             | 2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
