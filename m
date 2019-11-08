Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8194CF58B5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 21:43:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478sfq5cdmzF5PW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 07:43:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478scx3rqWzF7lX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 07:41:37 +1100 (AEDT)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N33V5-1hlqNF3sD7-013KFA; Fri, 08 Nov 2019 21:34:45 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org
Subject: [PATCH 0/8] y2038: bug fixes from y2038 work
Date: Fri,  8 Nov 2019 21:34:23 +0100
Message-Id: <20191108203435.112759-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:onYIVYfp5Mx1RrUFk0F9wq5iI+dqorjM5aBE72U93aTSbPGsiEH
 OgqmaTzcj80pu1s1hMBgp49QlgyJ7rNubi4HQ+SNtLKHlNHw7UDpadkGCFY+GcDVw41DVye
 FrU7tCGHXGj1wcbqKgqiBp/hv63ZhOmHxE5v1qZQbLWrHUnVlooIDiEJVfnnnRlsetqKDMj
 6/PfgmoNhjrn6CYi3P+AA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QOFaEcYjJco=:LpP0O7KqmYzzQhFaZkcyal
 FgMNXE1daQxw5g7+osrRmtO1r/Rk7SZb2gSVfFPR12Wnc7IMX0g/Rxk5wn3iCdv/0hu1wFFLF
 LmDJIaEn/a03Relme7Zew7b1I3s4FFvlvWFI8/0SB6mHQf6gCRSDwn75+Zpm7VRBJOdLrtjiR
 zyDlq5erQmeqJNIpNkOVgy1A0Hms5P0DaLn7iAKtDM4VvNWM+a2rKKjI4kLkEtrTecHoGkMIR
 9FT+DkjCW5fGsgfiU9AT3gVLuc7Fw7WUyMr29SZm4D13wJIH5t4VNQxyTJFaxTng+UW/GCGSa
 /9oSpjfmfUwf8hpGvcjG/yhtiCBB/5X6AVHls2491zxeDvblSphl3pyHzYwtuSCJJRAcmZn+Y
 I4t+3V3VQrTQMLD487DlqChb0Vb3YD2rIgn2uEdNw9zyTmKHgmriG2/c5K0vlXCRtEzpcln9E
 ROxN6/qPaJ0GF7E1LVOvgIOkEmcfsgAfklQrLo1wEeKPqostqRaMum/JXhWTRyez3MxeaalL+
 f6q2YwwtMETyID8WfRl5YeXoKZ/S5EZI7MkX0l5lzgF1NFOAEF0zs9eNtgTyjJKy90vTyuhSi
 gc3fW9yQ1drTu/YuMhsV74D2d+fRDKY0uLk0rf/vbzQX6JWZFE6MXdZFNZIfGpH/Mdyf5y+R1
 b76w1LDYR35NR9tCZF9wvdaVgWZtzYjnpz2rzlxod1QILUI7cOlKmF4rPl9zKhVtf8duZKYb5
 dr3JXUNniu6SbDLzVPoWCx4QR+a0U6QtOIxI7jZj/DqUMpZwGLBC0rWKg0G3VCdVwkgfihCDU
 YWOfc1p6PqD2idEhRnoPHnfu1YxGao5CFlCqiyXx+Tcb7mlP8937RxgtB0pyRS0IEvLNFhNRB
 hcmLqjR8csnbkKEYkAeg==
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
Cc: Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Corey Minyard <minyard@acm.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org,
 linux-input@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>,
 Arnd Bergmann <arnd@arndb.de>, John Stultz <john.stultz@linaro.org>,
 openipmi-developer@lists.sourceforge.net, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Florian Westphal <fw@strlen.de>,
 linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 netfilter-devel@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I've gone through the remaining uses of time_t etc and come up with a
set of 90 patches of varying complexity and importance, to the point
of being able to remove the old time_t/timeval/timespec from the kernel
headers completely.

This set includes the eight patches that I think should be merged
right away and backported into stable kernels if possible.

Please apply individual patches to the respective maintainer trees
for either v5.4 or v5.5 as appropriate.

For reference, the full series of 90 patches can be found at
https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=y2038-endgame

      Arnd

Arnd Bergmann (8):
  y2038: timex: remove incorrect time_t truncation
  timekeeping: optimize ns_to_timespec64
  powerpc: fix vdso32 for ppc64le
  ipmi: kill off 'timespec' usage again
  netfilter: xt_time: use time64_t
  lp: fix sparc64 LPSETTIMEOUT ioctl
  ppdev: fix PPGETTIME/PPSETTIME ioctls
  Input: input_event: fix struct padding on sparc64

 arch/powerpc/kernel/vdso32/gettimeofday.S |  2 +-
 drivers/char/ipmi/ipmi_si_intf.c          | 40 ++++++++---------------
 drivers/char/lp.c                         |  4 +++
 drivers/char/ppdev.c                      | 16 ++++++---
 drivers/input/evdev.c                     |  3 ++
 drivers/input/misc/uinput.c               |  3 ++
 include/uapi/linux/input.h                |  1 +
 kernel/time/ntp.c                         |  2 +-
 kernel/time/time.c                        | 21 +++++++-----
 net/netfilter/xt_time.c                   | 19 ++++++-----
 10 files changed, 61 insertions(+), 50 deletions(-)

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Corey Minyard <minyard@acm.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net
Cc: linux-input@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org
Cc: coreteam@netfilter.org
Cc: netdev@vger.kernel.org
Cc: sparclinux@vger.kernel.org

-- 
2.20.0

