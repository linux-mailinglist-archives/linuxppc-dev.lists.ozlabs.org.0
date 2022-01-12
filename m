Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35248BFE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 09:29:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYghZ0LKmz3bbC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 19:29:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYgh23QH6z2xBx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 19:28:48 +1100 (AEDT)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MBll6-1nD6tU0npE-00C8RD for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan
 2022 09:28:44 +0100
Received: by mail-wr1-f43.google.com with SMTP id x4so2721061wru.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 00:28:43 -0800 (PST)
X-Gm-Message-State: AOAM530yFbjH2uADvXzALMZOyuCNZeGUMIaH0T1TT6BBvpjjO4/LXPIO
 Wduu5qiDLyNJJAR7wxAnF1TkmGkysSwR900gsh0=
X-Google-Smtp-Source: ABdhPJzCQAXjKL7v7gwqeNOizFH7EmO4xK5MJG/Z0khXPuJErSXk+hZMQMifsbbqaAU9IP9YduLhizzW87q9+u/zsmI=
X-Received: by 2002:a05:6000:16c7:: with SMTP id
 h7mr6863134wrf.317.1641976123587; 
 Wed, 12 Jan 2022 00:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20220111083515.502308-1-hch@lst.de>
 <20220111083515.502308-5-hch@lst.de>
 <CAK8P3a0mHC5=OOGV=sGnC9JqZWxzsJyZbTefnCtryQU3o3PY_g@mail.gmail.com>
 <20220112075609.GA4854@lst.de>
In-Reply-To: <20220112075609.GA4854@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 12 Jan 2022 09:28:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1ONn=FiPU3669MjBMntS-1K5bgX4pHforUsYJ7yhwZ-g@mail.gmail.com>
Message-ID: <CAK8P3a1ONn=FiPU3669MjBMntS-1K5bgX4pHforUsYJ7yhwZ-g@mail.gmail.com>
Subject: Re: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in
 fcntl.h
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VOJqlejMXaRdTb88eG//FZGDoydWp5kkuPsXP8s2oFMZ1a6qp4M
 njm3yW6J/auNV04skzU0EMO7gBr4ajoCecOHpDPlgVqEHDo+GwYj39j2LSMox6UDYjjk84p
 MANtA2882HLEZ9GY5e5RAkVu7a+r+71JFin2e8vDc0lzsKWASkrQdL86Bh8biocFr3KaHWn
 cN3ww15LraJBdX4dDICTg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HjIeWfOe2HU=:Uw9A2AV9dUNMAEBEyz3Xks
 8+aDjg+1LLikj0I+/PQoSN/LDfzeXuBKB/7atElrJtiPT2UMjVrDpaBfpf+Ln+xqKi92CxWRw
 lXMC1e6ga/P6uslI98NR5/AipKwTI/4gItAU+cXtRGi+BUENgsRdU/VFBJcFi4TgTkJVbFkwa
 Edb0BKIVa35j4kuJ1WtEgUYpxmadip1h1/6QFysQytyAXKsW9Nw3opNf58JTS6wsPjlJ2OSr9
 64wTWb6YEKiwVfDZOU27gpa0Vz2g/Hwp7ltzkRcgD3iiKfS5m1w11R2ozhzSvjY2xyaC+nOr0
 XqMLlh72ofFhgxat2CQR5ni5dZkIZYNKcrQZzzPDjs61+HvzPRMj6qJre7ZI4S77Du01jLhoL
 uD01n4hCz8WTtquRJNBq9x8ZytYnSI7ZZp+DzlYXH6AHWzBQNDI1v2MlPNX4q9i8r4V9iOFOt
 WKkQp7SAtbIXQlSMtpx8e2as2DC1ejrK/Sm1WubqRwMM04yY/GyF6WSKAAAczQ/Pvu5ASw1Ys
 NN4Bj1duj5sxkEUN0Gw5uvBJj6U10qaJux17jHVfMclSs/xDdRadobMPr1oRxo85Qaj42YGQF
 2rG27xMNjUnEskAqtMxOiuwyCC0151h0FWB8XW9p0LFE/oJ/7MP0tetRZ9Zh3mI0xSqs2OE3U
 1f0l0KpQKjD8unDiOFTGhz1ZFtPCd7inu3XuYsttANSKOETk46qGmH8lLKlX5JHAeZVM=
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
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 the arch/x86 maintainers <x86@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 12, 2022 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Jan 11, 2022 at 04:33:30PM +0100, Arnd Bergmann wrote:
> > This is a very subtle change to the exported UAPI header contents:
> > On 64-bit architectures, the three unusable numbers are now always
> > shown, rather than depending on a user-controlled symbol.
>
> Well, the change is bigger and less subtle.  Before this change the
> constants were never visible to userspace at all (except on mips),
> because the #ifdef CONFIG_64BIT it never set for userspace builds.

I suppose you mean /always/ visible here, with that ifndef.

> > This is probably what we want here for compatibility reasons, but I think
> > it should be explained in the changelog text, and I'd like Jeff or Bruce
> > to comment on it as well: the alternative here would be to make the
> > uapi definition depend on __BITS_PER_LONG==32, which is
> > technically the right thing to do but more a of a change.
>
> I can change this to #if __BITS_PER_LONG==32 || defined(__KERNEL__),
> but it will still be change in what userspace sees.

Exactly, that is the tradeoff, which is why I'd like the flock maintainers
to say which way they prefer. We can either do it more correctly (hiding
the constants from user space when they are not usable), or with less
change (removing the incorrect #ifdef). Either way sounds reasonable
to me, I mainly care that this is explained in the changelog and that the
maintainers are aware of the two options.

        Arnd
