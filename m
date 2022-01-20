Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91184494D14
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 12:33:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfgPd3vwNz3bSk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 22:33:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.13; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfgPB3694z307j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 22:33:17 +1100 (AEDT)
Received: from mail-lf1-f43.google.com ([209.85.167.43]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mzy6q-1mPr7E1ns6-00x6WO for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 12:33:14 +0100
Received: by mail-lf1-f43.google.com with SMTP id h26so5708401lfv.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 03:33:14 -0800 (PST)
X-Gm-Message-State: AOAM53375mhKg+N4x5BzWdYA5mmzpMcfx3bT4zxpqBDlnVlnJwzWWN4S
 EPmuFVN5gUu88U+VHno4edKdz1++8qz5einQLmY=
X-Google-Smtp-Source: ABdhPJyF4dvXk+FcL9rU+G/uYHJOqasQkkfireul5EseychvyhuLX81WEAdVmBsalytJouvYJnpcpue784HKoQtJs8Q=
X-Received: by 2002:adf:d21b:: with SMTP id j27mr1322485wrh.192.1642671701080; 
 Thu, 20 Jan 2022 01:41:41 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-17-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-17-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:41:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1nUcYjhEE5eyFAE_QqfjhRsZZ81ni8jyR8cPaP5QKJDg@mail.gmail.com>
Message-ID: <CAK8P3a1nUcYjhEE5eyFAE_QqfjhRsZZ81ni8jyR8cPaP5QKJDg@mail.gmail.com>
Subject: Re: [PATCH V3 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:167eSNWL64w8b60gfXB1FiwKOptH5rK4lrUU6lFYmUvdHhpXcWE
 M7wQIV98J5kfnBf6PI0zXZaJHzmTJlV4b6VR0qHGP9wKtq9fqLU7QKYDBYUHmtPXseRSk25
 6Eyo4BwEOcKVE4VzcnKdS20nyl6Vao4GFVlcOHnfP0qf2cUhtX0K5vl1bKUkW3lnqBqE6Tq
 ziNZGWnKwEIhI8pecOp1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Dj5aUqMco0=:KO4ZkMggqVPD916o4YvalO
 gol6KDLCqykpDcIdURKJmDePD5La1p4zvALKTZlm5ianyk1FD87Y56sgruguVxc0D/jjZS6d2
 MbmipoJLtBh+P9HV/X6mjiBakhx1MvDYoOLbejXV33WWtRCUvDADUqB22wAsuLgwoG/5aDC/3
 v/2DbXSXIlYVwXPGxp6UXj/DJh3io0Q+42XLZOh22LX+GV+nEJFcn1/W82zGumuoTMAJz4YNR
 Ty5OvSoG9hyOn0ryevc6XdD8few84QIDwhOkk2tSVJUcrDzUEvZA4n4UfNnyaOy+YIcM856Kp
 1Mr/cBWm0CEUALae9cx/cSJ2/8blRCKMXIlCBkwWSWptONH54/rwaZpHWx45aeRENH5OdE8B/
 ybGWZnkSXuKw0jBvsZnllQDCFd/q6SOiEn34QPGCduLJquRfbGbJ4DAIpxilJ6D7hxMQg7XNC
 omRcHv6zQ2KqtPa3UZXDNcM3Xpi507Q9LAFHQfhZz/4WYf1M5Q5tCiXkCFNSJucd1xeWzqS4H
 TOBnvWgQy/gAwurpCTJYk8aQRCPnPoxEKT68H5AF/h3xMOXvpz083hUblVcTUNpzOIxOTDZfQ
 6cxa7lZ2lkb3FPhVZwjW0z62cKCx3pdKez2O5gKVyCwKa5NMZAyEjvf4hm42xVL0Y8t3hBZrD
 i3M4QFsQvs6pBBKGj4g1/5bd3/6pmB9SCCiscUlyIc4z/7N9Y8d4gy6A54OHbVtFcpdvVhpPU
 Mc7+2LHoSfc3dP7pvmsubX7FqNEClRvZA382DdLgtf5KdJIIinNV9KbdXVyh5+GdQHKwxUoGU
 le30svZykbXbuk8tfWm0oU/HpFFOKFjoVw8d0R+hOwgwjyeMRI=
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, gregkh <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, inux-parisc@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Adds initial skeletal COMPAT Kbuild (Runing 32bit U-mode on 64bit
> S-mode) support.
>  - Setup kconfig & dummy functions for compiling.
>  - Implement compat_start_thread by the way.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
