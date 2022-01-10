Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B74897C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 12:43:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXX6527J4z3bVx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 22:43:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXX5Z2VT1z2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 22:43:29 +1100 (AEDT)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MkYsS-1mdu7u3FZG-00m72T for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan
 2022 12:43:24 +0100
Received: by mail-wr1-f49.google.com with SMTP id v6so26135994wra.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 03:43:24 -0800 (PST)
X-Gm-Message-State: AOAM531l6sCp1DFHh4LqXWXBpb/WsNYuHxiBbl6H6z3SJMCWXL686X3x
 zeNgR7SlcAqxLsnDmq5hEUROBkbyazIYtNVhSB0=
X-Google-Smtp-Source: ABdhPJzLcQEl2WnX1Puj9mlVNbd4vaTr3cFkZQMjDOmTeJ+poLBbKI4XZ3sC+IOr25uQ9in4zKpCyj1iJaRs8pYrhxQ=
X-Received: by 2002:adf:fd46:: with SMTP id h6mr1566034wrs.192.1641815003810; 
 Mon, 10 Jan 2022 03:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-2-guoren@kernel.org>
In-Reply-To: <20211228143958.3409187-2-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Jan 2022 12:43:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0E+2=BnKienWp_VuT2g=YcEfP81SJmgbrLWZbdhRXXrA@mail.gmail.com>
Message-ID: <CAK8P3a0E+2=BnKienWp_VuT2g=YcEfP81SJmgbrLWZbdhRXXrA@mail.gmail.com>
Subject: Re: [PATCH V2 01/17] kconfig: Add SYSVIPC_COMPAT for all architectures
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:eLYLdACDfYNacwXUhY1jVROTOnf4jT4zLo6W3sMwn94JCU+5htE
 PWg2tsdPUVo6JIpyXGzSXCbMNJExa1nIH7Ly8a1M/L0lG67f40Vf7lvcxGTDaugAY9ShCV6
 DTB1tOIid2VBbnnfC1G2c80PT5WBG/snYKeRWJB1iF8KfEvzFVolqWDICsHWGfrsrjfMnCh
 qpqf6h8oQVLL9yVwQo20g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A1BOAlZPRak=:j/4j0gcme16Uyh1aDI7Kpw
 prjFUdddtvRjyjVVEZH94d+5qfTTdknNu3uLp1iA/81XoBRu4PAkLe1qDK0sKONI58Tuu8c/S
 BBxGq5o2PK9RTY5yt0r4mk+4TtpBKB4sp7PhVS8khYt3ShquM+xwxd9VAiWrL6fHLsa7Kc/f7
 y5tSLWp6FK29RCa9Jr4RXy7EawaC32r8/xxx0R+O61syQ810mi/JhLKOZMcciZnyrdf8dqTjJ
 3ZyGJHgRoPNb/ZdWb2/FenlLFD0fXPeBKnPtd1citXTKGE5d5iaDYG6h5DsohANtyOOY0j6t5
 C4WjNLKqYkCzOk3ArQBB4WHzFHAGCeCVcaIVmer7A5Dz3ckj03hj3hU0OBpFoOOvc2cTT5TFy
 sMlE+7tsI3Ek/w8EGloIHNrwXyCBPVAHFnI80XszurYMgzvtLqhJXQN3QzS5Evr5gBbBhxOgc
 mJimnMYaZBSI0NZisFNRvN5nl1bUTiuzmxfem4WW9hi+cg/hvBDFi1B/kWUL+tRD72g8HKsoF
 aMRkhvHVfU7K0FuZPq1ZX3epXlLssSfZJW006DC72gEtieysB3k0Rxw+SB2gIO9NJ0hvGQNZq
 bXJKpIqxvpRHexbVQdye8+d2HGj56ImZi1a5/+eTSik63U5FpJBqDiwDVzpQlWDHdUpM3c7bB
 Fj1ZcRujvaQdfCH+e0DBX1V/7++JzbLt4e6rSD1DJwPCZ3J/ytJduAlPXh3W3LJbRPOJnuKZs
 sZL8/tSx2ArESb6U1tZwOQR6UzkFwFKVSPzT9OlYAfHsFiTdvqaY6/GFtWk88l9ty1r+VENZV
 0ENvO9IyMHWIF195fAL925M7TE4KO87ey/zYvmpRAnqGjQgMC0=
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Drew Fustini <drew@beagleboard.org>, gregkh <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 28, 2021 at 3:39 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The existing per-arch definitions are pretty much historic cruft.
> Move SYSVIPC_COMPAT into init/Kconfig.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christoph Hellwig <hch@infradead.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
