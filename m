Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AB24A488C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 14:47:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnTrM2dC2z3cPp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 00:46:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnTqq4Gm9z2xBl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 00:46:30 +1100 (AEDT)
Received: from mail-oi1-f174.google.com ([209.85.167.174]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mf0Ru-1mcSQy1RPe-00gViq for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan
 2022 14:46:26 +0100
Received: by mail-oi1-f174.google.com with SMTP id x193so26815902oix.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 05:46:26 -0800 (PST)
X-Gm-Message-State: AOAM533n6gSol5Nx/f+xmKqxZoN2L5f0XUKYcqtBJm4nhVb+z6D5L+mp
 pNcq2+fvlmLnzIQ328Z1XKUDJD7Xwclblo61ax4=
X-Google-Smtp-Source: ABdhPJxqzdad29yoPfVQVqkeuINyquIZpxlEvxSx06sdTnz4rryvUZKfSJUaDKGmBUmu6Be3uaLlJuvMhrTHZxz8Zkc=
X-Received: by 2002:aca:f03:: with SMTP id 3mr13235991oip.102.1643635190773;
 Mon, 31 Jan 2022 05:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-6-guoren@kernel.org>
 <YffUqErSVDgbGLTu@infradead.org>
 <CAK8P3a1jZyVBW70K6_u3mvXYNowV4DTBxivKc2L=HbRK8SgRXg@mail.gmail.com>
 <YffdbErmAjAWYuD9@infradead.org>
In-Reply-To: <YffdbErmAjAWYuD9@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 31 Jan 2022 14:19:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0VZt8PF1C4W0X4+SNhP=NbHAigq3N6fEawNpPd-RZDjw@mail.gmail.com>
Message-ID: <CAK8P3a0VZt8PF1C4W0X4+SNhP=NbHAigq3N6fEawNpPd-RZDjw@mail.gmail.com>
Subject: Re: [PATCH V4 05/17] riscv: Fixup difference with defconfig
To: Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EZCShChMx+P7xz8yqKDtr8YUEeElzWDN54AHOsQ5GvMoxXS2xEh
 L0G0CoT7MY3Kt/kSbrYF/AXdq0Wtjs0/sPcPb44os6e3GS2/QRRsXo36L+7i/GJR69Nxmq4
 1tHHJzrCsUOE+/atPOS5wj/8guUwo/ulIELkC2BtQHyJ0+gzk+DeioiZepIkD9a7Rr0dMco
 dm8xvUq1+hSlcmkiOjA1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nLIYVSri5Oc=:pc+UJbFvkdmRgCgcUqnolM
 E2NQtXlIbdT6M4b76s9yBmjMaFQ0BidghigD4MZBzn6iW4Gf2iyxkEUNevFL1+KiDKrpU50xz
 71jC4VhmS7NT/QfkYkw5InkZc0a79tc93mEDzbY1X1yJ2YrFG141Vsz7nd+P4+u0B3pPSn22P
 NJcrMwUScDXIo8C4nx0zNVsRSGyD/pVRuuK7IKld/0SoqbXGs6XbXLcdEJcacpaXvle++6W98
 FhCPLz91BUYYQdq6ULLzJ1+wGM6TWlCSo5U2pXPAMjCbavJuFI55D9NprfDDBwekyRnBaeSa9
 RRy63HBlYaREmgCGbGQflvsZSi8U2UiQHbCPMpkSN1XbWV5/pijnr4w5dsqYpV+Gxpvb01duX
 m8j/4eZdL7Nv4jYJhjbaMWoFYXS0JE9MfZBU8luq/2WeNHRsKjVsmAikM5SONEE4EXXZZAG1s
 OFpqExAvBvc3HEUK35BE3n6NiQf6umBrD02u5ZvnTjFgqVSSJ0DR4+0tGnF+ka711eI/FFq3D
 2B61kzbjBX5zVt84cXzVhPf33P7D80vBTLOf0NcZxcX/nDXUO5Sx5gAseYXGKujdXbdgLpIK9
 HalPplpKLeAgJEuvOunm7JEyvK3yOs5g4wLtpUdqcmdyM0ZhD0bSDzwHU6H4w25MYpXBHFdKg
 NeMNStUC740TGrq8gJ8EJFs9P5C3YVd6ZiC5RxZby75vBzy2UFPBvBmNFNlQ4/f4h5amgHskq
 rxvUn0cqMCCwArYu3vKpxHcVu4f4wXNV0HTUV8o/v/K1z7QdMcRS7DKR7U2BLb2fk/bVgIOvQ
 5YySHIWAjDtd9V4Rv+Jh0V+J+/LSHb9zIER9GQa2f9qGpdhb73pqwOfXUnpsXbcmTkKu1Rz
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Drew Fustini <drew@beagleboard.org>, liush <liush@allwinnertech.com>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, gregkh <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 2:00 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Jan 31, 2022 at 01:48:58PM +0100, Arnd Bergmann wrote:
> > I thought that is what the patch does, there is already the normal 64-bit
> > defconfig, and the new makefile target makes this shared with 32-bit
> > to prevent them from diverging again.
>
> I ment using a common fragment and the deriving both 32-bit and 64-bit
> configs from it. The 64-bit specific fragment will be empty for now,
> but we will sooner or later have an option that can only go into the
> 64-bit defconfig.

Ah right, that should work as well, not sure if it makes much of a difference.

I suggested this method because it is the same thing we do on powerpc.

        Arnd
