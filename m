Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B376E4C10E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:00:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Y3T01L6z3cSH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 22:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3Y332dKjz30RD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 21:59:57 +1100 (AEDT)
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8oOk-1oGbDb067i-015uEs for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb
 2022 11:59:53 +0100
Received: by mail-wr1-f46.google.com with SMTP id d17so4058383wrc.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 02:59:52 -0800 (PST)
X-Gm-Message-State: AOAM531FSlsKA/NA0EAcKjmha1M9HZM86IfL9AhrXSdyuM6WKRtqaCiQ
 lfXsWuhUJqDkeme4zebWaf0gAePIwq6LC7E8QC4=
X-Google-Smtp-Source: ABdhPJz3tjc3IejYq+UPcpb0b0B/1/NsttPG6/6KnMrBytsQxjHYO0/p2daBPMgz1AgVYfLNcxR3Ydw+Oyz4L5S8GiA=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr23150986wri.219.1645613992251; Wed, 23
 Feb 2022 02:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <mhng-36783ff3-37c2-454b-9337-8cb124195255@palmer-ri-x1c9>
In-Reply-To: <mhng-36783ff3-37c2-454b-9337-8cb124195255@palmer-ri-x1c9>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Feb 2022 11:59:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1W3Ns1WYiSGXb3Qn6-p+SPsx1UGqXdTkk2taPB72OZUA@mail.gmail.com>
Message-ID: <CAK8P3a1W3Ns1WYiSGXb3Qn6-p+SPsx1UGqXdTkk2taPB72OZUA@mail.gmail.com>
Subject: Re: [PATCH V5 00/21] riscv: compat: Add COMPAT mode support for rv64
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+XSzde2/zhmz0Y9d0jzFGW4Fp2liSFJCCUir0D1P6McXmp5ek+i
 PwG76jTiAnApTH9nQq2AB4v8fp6g56h5qsR+yFKl1IBGFJWYRMhH0YsAHWxMeM4qV0TRMhu
 bF2aZNfMDX1ehH8SsxQNXTfNj4QlcjM1vnyeR4MMkdGU9HWyCGqdaW0UCUY/HXGGaqiWXnD
 aiHYaDERFuYV2wd95WYWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lskyLvOKVmU=:RJvJ7r/U/0LRNSuYLxXQcb
 VwgkcJFSdn9m/zy09q1MJy3YVgEE0kW1Up2QLUkzXkUU2mpEwd+rbrj2fFfh8jXHyvQwq4o/L
 p+mhfOfxmdkeMDYgTVkkgbwLEvZCrklLcm1jUB4EyoHumNIxdGl8kYHOat0thIIjGwarTFTjT
 jg/bK709mpclogcWNhicpqUAyehsRHazF4jSllb4tPGVaXUAxlRCVTrWwojZ4mHc3UQgTwzaM
 5rftlNsrSebmCAkHkp9gMYVCSocU4pRvZniXioaOUGgaPf8zKDLPRgoyFsi9S0OqAy6qCGGko
 lmOcwXJ5fyonhhBxHCpFQAkDWDTdCvXMMPsg/h8Ffv4sqV0pUc2WGs0mJFyrlLrLXnqKBaoXx
 SPafIvmVxGG9sjWp+hY60KPvtqx4suyQWwmPN2rNektOZoyviPdyTzn7/Ch6NRpVXX214BZol
 A7Z2zivmt4dgUzwtwWgTu6956JIv6Svx5DjhQKV6VEHiXbSYHCDkJUW8e6Qx4OYuw3ygNaL9A
 K91gORjym9H8+QLMOrwaeR8y6tr8TxaYptZfycPrs97473upKDS7b31cv0+H7f2W7bY7l5+Zj
 YcEMOSxITBYIR0PCvgHxmDEnm/nWw4sNS5W9RjWQDPqT++4tpzeQu/NgRenI4nkT2ljlbH+3/
 voLz1ddIgRqClBTyPAe2+J8q0VUmwx3xD3K3ao9DC4pmeznJTRLIqKipabu+9Vipztu0=
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
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 2:43 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 01 Feb 2022 07:05:24 PST (-0800), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Currently, most 64-bit architectures (x86, parisc, powerpc, arm64,
> > s390, mips, sparc) have supported COMPAT mode. But they all have
> > history issues and can't use standard linux unistd.h. RISC-V would
> > be first standard __SYSCALL_COMPAT user of include/uapi/asm-generic
> > /unistd.h.
>
> TBH, I'd always sort of hoped we wouldn't have to do this: it's a lot of
> ABI surface to keep around for a use case I'm not really sure is ever
> going to get any traction (it's not like we have legacy 32-bit
> userspaces floating around, the 32-bit userspace is newer than the
> 64-bit userspace).

The low-end embedded market isn't usually that newsworthy, but the
machines ship in huge quantities, and they all run 32-bit user
space for good reasons:

The cheapest Linux systems at the moment use a low-end MIPS or
Arm core with a single DDR2 (32MB to 128MB) or DDR3 (128MB
to 512MB) memory chip that for now is a bit cheaper than a larger
LP-DDR4 (256MB+). The smaller configurations will go away over
time as they get outpriced by systems with LP-DDR4, but a 32-bit
system with 256MB will keep beating a 64-bit-only system with
512MB on price, and will run most workloads better than a 64-bit
system with the same amount of RAM.

On the Arm side, I hope that these systems will migrate to Armv8
based designs (Cortex-A53/A35 or newer) running 64-bit kernel
with 32-bit user space to replace the currently dominant but aging
32-bit Cortex-A7 cores. As you say, RISC-V is at a disadvantage
here because there is no existing 32-bit ecosystem, but it may take
a chunk of that market anyway based on licensing cost. Between
doing this using pure 32-bit cores or on mixed 32/64-bit cores,
I found Guo Ren's explanation very sensible, it lets you use the
same chip both as a low-end embedded version with SiP
memory, or using an external DDR3/LPDDR4 chip with enough
capacity to run a generic 64-bit distro.

> My assumption is that users who actually wanted the
> memory savings (likely a very small number) would be better served with
> rv64/ilp32, as that'll allow the larger registers that the hardware
> supports.  From some earlier discussions it looks like rv64/ilp32 isn't
> going to be allowed, though, so this seems like the only way to go.

Right, between rv32 user space and a hypothetical rv64-ilp32 target,
I think it's clear that the former is better because it means introducing
only one fringe ABI rather than two incompatible ones with minor
performance differences.

        Arnd
