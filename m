Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990935C1C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 11:56:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJkf02xqjz30JG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 19:56:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJkdd5rDqz309y
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 19:56:03 +1000 (AEST)
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MyNoa-1lkNLW3Utg-00ydVF for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr
 2021 11:55:58 +0200
Received: by mail-wm1-f52.google.com with SMTP id k128so6426594wmk.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 02:55:57 -0700 (PDT)
X-Gm-Message-State: AOAM530KkitZ8pp9svm50COW47BrpdQ7nv3AejkbgEqLd25lHn3kFcNX
 T6O4DkzpVO3LxH3ReAA4yrp022Kp8WLYShu/7Ms=
X-Google-Smtp-Source: ABdhPJzTfxxaxsVCZqgwljY94HrF+v5FbHKG19HOl8IGqXY6e9UlqBjrbb/hk/qI5QxcbCRl2V2ekh7/KCvv8xos6no=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr3077982wmi.75.1618221357638; 
 Mon, 12 Apr 2021 02:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210412085545.2595431-1-hch@lst.de>
 <20210412085545.2595431-2-hch@lst.de>
In-Reply-To: <20210412085545.2595431-2-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 12 Apr 2021 11:55:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2MSJarPMfJ8RrSKDMXte3KQec=+GQ-LzV6HB7-Nm1FcQ@mail.gmail.com>
Message-ID: <CAK8P3a2MSJarPMfJ8RrSKDMXte3KQec=+GQ-LzV6HB7-Nm1FcQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] uapi: remove the unused HAVE_ARCH_STRUCT_FLOCK64
 define
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:HN1i/tIKssi+Q6nZtfFCctnFuYxexKGWuG8D9U+RjYWKr7PIhcy
 II7glUUiMwG40qfC2bDtAFcGMMSIUgnUGkVDtJ1WE+nTjKS+hMw1BpVHIp8zoyA5472rsEj
 wBJNrr0wsiWl6xQC9ORWyHF1TUKCqf1XXyYrAaWRsax446kn9H5VBLpjkHC6fPvfdswWgWM
 Fh0GeMYIUiTQ1ZUKw2/mg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OgUZvUE+adY=:7guKUSdVoMDVapqnLtTfg9
 z5fZGvZYI9neUu+isO6rmXJZdI0QAp41++B4tCFrLez7x07pbMI899oHEBxRLEcN+whLGCdJv
 vFt/+ZHwxku8DbzJFnn4LviEe/oB+b0EF+3xtvOpjJwU1RR8cCqepJd9jTL4J7esqnKraQJM5
 1c3nR7KRlFkFrlRvdyH27ddEIIQsJLKYFhZugmzoUrVx7twd88M0ezJHNLY+va473BhIhnN+z
 SXczIHQfeYIr3l5ARVuqdHydqeUEk8gO8Do0GEBsmrETzyOyevyuHrmyqapc8GyiTjmwi/WDZ
 a7lsYi53TQjxTUVFdrBRnkLQYmbzf6L1HkaQKQ2mqKyapO3trq5zCJzTg9vuoV0jWTCtG2EAz
 XLZQrvPq3hmcd9FJ9saEi//aIclJTwQqcC0SBskP5g8Ii8yigzmz1tWogeLfoUuMxz1JgDBO2
 aqlazTOtx6LWhnLDxIeA3vG6nEYjSnUw8k6gkQr4RWZIN/BT3RHtsKHIVZb+kywwRZm7mrUEe
 bG4Du3vUyTV+eL3Dpd3A+niEA8dgwzExdlXK43p8d1OTnwV7daf2euLz9V1GvFXKXPAVJaWlB
 et6HGRn893W4hQ4AdShT9ZnpgJ1e9h7wcy
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 10:55 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The patch looks good, but I'd like to see a description for each one.
How about:

| The check was added when Stephen Rothwell created the file, but
| no architecture ever defined it.

        Arnd
