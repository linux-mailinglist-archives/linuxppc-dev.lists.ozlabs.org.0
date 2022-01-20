Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF5494C86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 12:10:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jffv54KCrz3cTr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 22:10:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jfftf3WZDz30Mf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 22:10:17 +1100 (AEDT)
Received: from mail-oo1-f41.google.com ([209.85.161.41]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N0FE1-1mPZPG1jXj-00xORP for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 12:10:13 +0100
Received: by mail-oo1-f41.google.com with SMTP id
 v10-20020a4a860a000000b002ddc59f8900so1932364ooh.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 03:10:12 -0800 (PST)
X-Gm-Message-State: AOAM5326MF3Iv4A74jmyjA4gjEDGGQBRsUqBD/nVns+oRYS18lC3+T0t
 fh1SleiBePSgyPEqM3fL/1o/OaRzviKLP+sszgc=
X-Google-Smtp-Source: ABdhPJxdLg6SDZjsvGmAsYmn2qy9+2h/ODrSB5K/8pY/EXdxIA8KLQS4DyhVSmna3jImvkgL6VaV1O46bPcTyjt0SVc=
X-Received: by 2002:a05:6808:1490:: with SMTP id
 e16mr6881848oiw.84.1642673470519; 
 Thu, 20 Jan 2022 02:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-18-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-18-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 11:10:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1_qwRpfHRyF75WEqfxGxgVnfB15vNS-egQctx7R5-DvA@mail.gmail.com>
Message-ID: <CAK8P3a1_qwRpfHRyF75WEqfxGxgVnfB15vNS-egQctx7R5-DvA@mail.gmail.com>
Subject: Re: [PATCH V3 17/17] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:V+2lpM0/z4B7CFt83W8wQSERi2B8Ye9M0xhTGkecqUjLlgoHsrx
 WeFDDT5QGlAKQ9d/zAHLUfaSbOh9aq021Rl0gLKzk+2wqjm5Pfl2mmKjgXUqEeP8QKfh+8E
 KUoE0Rxiz00xsusvUqAhoDr9n6g4v74i+nuyKOs/0HXIp9PE29hNMu/rTBhwfhRxFWfxOtz
 Eni7y5x2fw8bknlt97fwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E+BVfOF0zJk=:KMuzx03ok2IS8YPNDgui57
 ko3glzdWM2bz1cr3wfrQ85cDJWEjWV8edEXfh8NSw/ESNFAegtHEMviaBkTNuIaDK/Bs0pOwx
 as/osu9j4MeGvnsHV6pyzWkNdoMXk02eceUkpU9+Ff+wKPeauAWwI58pKCceMWUIVenPutO2w
 8p6r0XP9UHkuXuHK0ae2vTlvSfC2Qn8wCf9lR+xQ4cwEO2TnNQbl9hHCxsjNqUK53QOlVcC9s
 G9Fkc0AaHqM3OgAHqpJ3ksTjsop0pQDJsP26E3LTY5ybnwdan1vEX4hOcUh5SqagOg6rkKQrE
 JwCfJ6dYdI/pzeBrLDQA0XKJx/URtBkzJwaYF9XNGcSKDDLakvV95+nQ1/xOZDPqodahz3K9W
 gBlQdLePySc5cJWo9JJIthX+hHbteBLN/fUyvgmpJKHyEJo7C2AKIu5+r1sjV3HV/aC+lsYas
 GFbX3dYplDvARCca8BBGEoAVNu8OW2e6hVMX1pdzktI8LZnNRAnPr9TFHmehFyUZxaFeuzVpP
 II34lFYUXuO3WyCobqK0dgxebLChzPELDhBLNXrCCbvN68G/sZtm0m3ZlKr/cmuSoGTTiPlLa
 UCPLd3m8qIVFeuiFLCNSS3INiLslUZ6kLwREzGFzloO+LVR/zc0j960950tRTdHQHT5hrBYSP
 VJ/E93V1MerQUQHMim8RUuMrM4v21g5X8TTG2O03lClXoA0TRK02DwEvzb57jnw5FTXmQKADw
 8lPTxiumYSz6ewqr+uXX4cOOKdxaeYWOf72b8ZjeJ6E+z1TIdvt1w6e5+7JbH3I9ZliCxOjHR
 AeSVsxGtodZui9IzXMpxAWm98TSB5F03PnLrb2X76TUJ1KgE+Q=
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
> Current riscv doesn't support the 32bit KVM/arm API. Let's make it
> clear by not selecting KVM_COMPAT.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  virt/kvm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index f4834c20e4a6..a8c5c9f06b3c 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
>
>  config KVM_COMPAT
>         def_bool y
> -       depends on KVM && COMPAT && !(S390 || ARM64)
> +       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)

Maybe this should be flipped around into a positive list now?
The remaining architectures would be mips, powerpc and x86, but it's unclear
if this actually meant to work on all of them, or any potential ones
added in the
future.

       Arnd
