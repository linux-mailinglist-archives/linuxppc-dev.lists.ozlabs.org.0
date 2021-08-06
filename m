Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D37DD3E2CF2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 16:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh7k861t2z3cYW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 00:52:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh7jk67FRz3bmf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 00:52:09 +1000 (AEST)
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mati7-1mjQHX3OgN-00cQv0 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Aug
 2021 16:52:04 +0200
Received: by mail-wr1-f48.google.com with SMTP id d8so11432399wrm.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Aug 2021 07:52:04 -0700 (PDT)
X-Gm-Message-State: AOAM531zlWm96QSQ8VudtU0wRM4usTz2i443xkJ8l9CYCov8nB1OZYCn
 MST50LpDpaCMPPBQ7vj+dwjFK6K5TBqj05YM0BI=
X-Google-Smtp-Source: ABdhPJzaR6qJfePFLgCHPEvS2rl+ctcdCp7KoQ3Fcdv85XiJXg5JdFJiE2fEE5Q5uLbt8pe01lz22DOOlzKs3X1rUrA=
X-Received: by 2002:adf:f446:: with SMTP id f6mr11689710wrp.361.1628261523856; 
 Fri, 06 Aug 2021 07:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210806030138.123479-1-xianting.tian@linux.alibaba.com>
 <20210806030138.123479-2-xianting.tian@linux.alibaba.com>
In-Reply-To: <20210806030138.123479-2-xianting.tian@linux.alibaba.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 6 Aug 2021 16:51:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2=BmVv0tvUKaca+LYxuAussAJtAJW9O3fRN2CbV2-9aw@mail.gmail.com>
Message-ID: <CAK8P3a2=BmVv0tvUKaca+LYxuAussAJtAJW9O3fRN2CbV2-9aw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CWwIIv4pyhdNE4mN8f4XtprjfxP1kCZL5ngO3JZdXOtL3jNkvS2
 ctG+obuaiqWvaB8BYGcMLKBLrdHaHI02FATZbXPNjUMdMG46A+2fLAZN0ugW/MQes76DPLW
 3gWZv4Gwe9tSMzrernXngzNtGYCs8YfqoyDsn+pjwqbunnkO5Qfgzut92v1ZSc3wMD6WNwK
 1jvjl07XpeLUwpUCi75Zg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:taeBenBSWCw=:mEQvoS0roRqoAj3JIIIWzn
 +oLmeo6JypZKvdTsCOh7xk9mlbFMn4etPRR2LRDPKnS+aJ89PHs0x2mSC67RaeoLyCyGoSMA7
 1qW0upbnIam5lfolSa3KRJ4v+mXeutyQhoNrNCzPl+acD1x+8JXSOWKODK86elbHRhMK40ECA
 eeQeAgf/K92yTxP4OIDLbD4zC7JGZBcb+a0AmlqylO2YOUDuHZg2sVOgX0LEE6HgbidkFEJh2
 dF5hFYg3z7oZ4we7x6+53YOjdC+HKsIka1C5+sZUJPKs7UN64+NELgeXWxmuJGAPc1a9T84X1
 P0hcGbVZMk+3rzBbJ7yRxiEsKOe5f/+k4aUAb0dwRlgv6d10pIw6t2VnQtSD8VWr59jin89oo
 Jg9LhXHADCYMCdZHmKN5TIYabKD4DYTuSQLgoXzpC8cn6YEYnSJCcPTYnjdoDFez7OBhIy9Wj
 tQt+y48sWAiFJDoSrA2ScPXZhsZBd1tmqYbXRGDlWOnI6vqw5ZShUrlQFf7wu82rDcoeSUGFK
 CRtAAznLuX3RegOfjrkrwE4smeCZWDtdsFXnE0SIvBbfaYM/FQfTom6HeN7as2RZHcfiSa9q5
 bH3b4GXOSzQSQErnado2qBmu6JXBqnn13viYwRpMV9zgRQqSWkLm5ZmeTQFHAuC/gQ8TjPsTW
 5Ly4YYW4zrlMWo5BZMKKPCBSwPJj5be66PVJZIBv22BemhNoOos4+i72RuJfmTV+/hOvmPe7q
 3maVbQlkmuQPqwgrRMIXmvhpSVsJQI6HZam+EmnSxBLw7O/XKwiJfPiC5S/SHTuz2tdTZ3hG3
 h6hj/dCIv7PTJJeBUZvKOaLDLmOIZXNdscvoskvqJ1mKBvr1VpRV4FeYtK1WprlIkjBFQ/cE/
 otruh8oTbSF5u/Eew1qONIeIQ2m5AhdN7lXMjVVg/x4KZ7y6gJj8svPWENmv+Jx1w75hv+I02
 2jLP/8Wvy8LPDMKDuFXnisdlJAhm5D00f9fr9N0xttzC0lXdAovBg
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jiri Slaby <jirislaby@kernel.org>,
 Amit Shah <amit@kernel.org>, gregkh <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Guo Ren <guoren@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Omar Sandoval <osandov@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 6, 2021 at 5:01 AM Xianting Tian
<xianting.tian@linux.alibaba.com> wrote:
> @@ -163,6 +155,13 @@ static void hvc_console_print(struct console *co, const char *b,
>         if (vtermnos[index] == -1)
>                 return;
>
> +       list_for_each_entry(hp, &hvc_structs, next)
> +               if (hp->vtermno == vtermnos[index])
> +                       break;
> +
> +       c = hp->c;
> +
> +       spin_lock_irqsave(&hp->c_lock, flags);

The loop looks like it might race against changes to the list. It seems strange
that the print function has to actually search for the structure here.

It may be better to have yet another array for the buffer pointers next to
the cons_ops[] and vtermnos[] arrays.

> +/*
> + * These sizes are most efficient for vio, because they are the
> + * native transfer size. We could make them selectable in the
> + * future to better deal with backends that want other buffer sizes.
> + */
> +#define N_OUTBUF       16
> +#define N_INBUF                16
> +
> +#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))

I think you need a higher alignment for DMA buffers, instead of sizeof(long),
I would suggest ARCH_DMA_MINALIGN.

       Arnd
