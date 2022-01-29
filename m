Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689FE4A3210
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 22:40:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmSS51ky2z3cDN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 08:40:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmSRb48mcz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 08:40:25 +1100 (AEDT)
Received: from mail-ot1-f46.google.com ([209.85.210.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M7ehh-1nAL5l23H3-0084rD for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan
 2022 22:40:20 +0100
Received: by mail-ot1-f46.google.com with SMTP id
 e21-20020a9d0195000000b005a3cd7c1e09so2500415ote.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 13:40:19 -0800 (PST)
X-Gm-Message-State: AOAM531uLpvJ4AYUHce7VAkQnVzDRXME4iWY28icHTG0Cu4Wt6OZ70Q+
 GHniq/a6yOt1EJ8l35zGvlv2g1kpNO3B0qSHhp0=
X-Google-Smtp-Source: ABdhPJxSc4cWbyXoSGQiQtpLi4PNMIRU496vg4S4jN8fyO8Z/BY7E62yNehuKgdWMqyCyzVpdMc329RL2rEKIxjEMaU=
X-Received: by 2002:a9d:73da:: with SMTP id m26mr8391513otk.72.1643492418274; 
 Sat, 29 Jan 2022 13:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-4-guoren@kernel.org>
In-Reply-To: <20220129121728.1079364-4-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 29 Jan 2022 22:40:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0jK4quTT6txPakQuuAjyoMXRq1eM35pCFLo0PQNq+p2Q@mail.gmail.com>
Message-ID: <CAK8P3a0jK4quTT6txPakQuuAjyoMXRq1eM35pCFLo0PQNq+p2Q@mail.gmail.com>
Subject: Re: [PATCH V4 03/17] asm-generic: compat: Cleanup duplicate
 definitions
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:HwPiD/p6/eeHsGfaIcl5o38PkbPW+VVoRaEp9MTMMs7X9Q6rdW5
 Nkn/g3TSDxPaA4sux7JRc7cWbrgkw6XggrrWYrAQrhxQrSmHiigQM5vQ/48Oj5QCYLWXdTF
 GyIGGJ8sSmXTAc0VTvXbqmlPVznz/q39isGMQxzaKx/k2cSDT9eciD/kWdQujRs1NAVAaPP
 b3rFFUohAZIyGflb6JZRQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Io9H2hf2r4k=:DYjA0QpXNlB17fh7CJFSs1
 Ph3U1J6dkKj7+b+wJKf0pJxU5zzu9Srt013R8CjwUUbO4w6BRU0UwPqsqg/GO8endkcdSQQUY
 R+NXjfbw4itMvXyTY5pkPyo4l28A6/afQE6oOq2Prz2Bo4avtD8w8RcwoILjPyvsNm9ZeeZRk
 j/m1247k6JOAFIEWBpfylq4RmZI84s8QGZ8bChonDeftTl2kPVk/yHjKMC9ZsM1Soy/sYCDPk
 wwiDff+Ksh2CnLRKMcgRT38iz7xoYmU73aBDxEXMLpKSH1NXeid/6Q4AKhBYf/ed62peGlUmM
 I2HDsI1/qw37we+F/pAZI/9DJ/8MbTc8zaha4ObXQoFDTjqRxSBEWgG16iM8uFiIuccAc3tK3
 YxZVI0Plyy66AVDAKEzRygI/P1vLoH96GmKMhqMXDs8XcBRBlzc39t/05PvOunQlLV6PCJ3/+
 X49rNvux+3uZ0v0IYJq8jwlBxH8E+naAFttsWAeCxHbUqvzSaVDLaYNDwx7suaEoNvH2qtaZV
 nqzkn/YH2POPpR6PNII1Ssjjwukt82csBySfHugu6CUDTQAOQWsArSNyfdLQ+zwREz198k+WV
 6uP1QwRkr28KnFXm/Qt/0d/LrAg4TbmZUcn4t2n0kDIyeVk6rPSkLIVTwvdgxSdkdeU0QykLB
 zrTHk27LtRusdMhM5OarICOzGMGdK9TjOHpWEe2+2N2QAMq10lKOdxXnWfzcXvzpq8r7E9hNY
 EtprgI42IL6XIatvOCsxS8Dg6mPIoDsTlMSAsMqvztFrSANn44hVsNjuOoHUpIG9SpkCSJM37
 sUEE6qeAPIyKR3pUKtKQHQw2hi8TgpFJ4nYuzI5HWuP5YnpDhY=
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
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Drew Fustini <drew@beagleboard.org>, gregkh <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 1:17 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> There are 7 64bit architectures that support Linux COMPAT mode to
> run 32bit applications. A lot of definitions are duplicate:
>  - COMPAT_USER_HZ
>  - COMPAT_RLIM_INFINITY
>  - COMPAT_OFF_T_MAX
>  - __compat_uid_t, __compat_uid_t
>  - compat_dev_t
>  - compat_ipc_pid_t
>  - struct compat_flock
>  - struct compat_flock64
>  - struct compat_statfs
>  - struct compat_ipc64_perm, compat_semid64_ds,
>           compat_msqid64_ds, compat_shmid64_ds
>
> Cleanup duplicate definitions and merge them into asm-generic.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
