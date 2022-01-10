Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B252489A0B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 14:36:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXZbg0FqWz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 00:36:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXZb04Trlz30L4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 00:35:40 +1100 (AEDT)
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M9nAB-1n1fe12UZp-005qiP for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan
 2022 14:35:36 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so5194945wme.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 05:35:35 -0800 (PST)
X-Gm-Message-State: AOAM533EMYeZdzcb43w0QhDm9c2M6QFj8+F/x5t1Bf3rTQzUi9vOSJqE
 obiwZN5qPh3eAWBtShuBd6KH9DPVf5/dKIsXO7w=
X-Google-Smtp-Source: ABdhPJxi0Z/ZiBz/NSOKjhoGPprS74nLPOzeNY5wtnvdjs0k7wca4Io+stHgBpdw9GGPmWr9NuMWVabYObO8sOckUL0=
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr8601383wmf.173.1641821735504; 
 Mon, 10 Jan 2022 05:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-4-guoren@kernel.org>
In-Reply-To: <20211228143958.3409187-4-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Jan 2022 14:35:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2zn9M6X09WsjJ9HYiS9WnO_YPCvJLSBk+HaH+yZHQqfA@mail.gmail.com>
Message-ID: <CAK8P3a2zn9M6X09WsjJ9HYiS9WnO_YPCvJLSBk+HaH+yZHQqfA@mail.gmail.com>
Subject: Re: [PATCH V2 03/17] asm-generic: fcntl: compat: Remove duplicate
 definitions
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:a624zTBUPTdGB6t26pRWABhZ68zOTTNJ5OmGnM+aS1OIvkvoWE7
 OPV+9HWWx4UiSt7OZ7xMlmw2YZjoUQAtqkZiqmhTfnFRFjEv+OxG77+KDwFElbmzcgkhsF/
 cq6aTWI8A4ppgcDHjM3r8VxiacRkP+3Yz40ENrVlJA80bRkRdovWB9nlX3mmG/f+BcTtOan
 BPndXe7+TlQ9MF8PKJZ9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X2Bc2BBNFTM=:pmZed2hZy09EffyCgGvGD9
 TuREaBme81VOBwbzz70wiSrmtuWg6CNna5QSV6MCd8Z0IeLZ0zi0Y4wmtzzjUPfXOVa/dLexV
 vZJH4KUw4aU3lXylT3y+wCp6hcT72C8FTSCvua52ILvHq4+LV5bdaaepfCNqtljS6dauf4lGZ
 D2tuD24imTIVXIa213PdokAOClFsglIuCRe7McZDuStFPjOSSw9U5iRsyr1DXdMzrk2Nx2XZI
 WyR95ZptmeH1Hu9OG8u1tFq16h913xMGG0tDc8hhq2rp0EQwmEKFrPi2Ft6tAYv8FjRJ349u9
 PW5cgp5dxuVv8OPORvxvcsZMdUaGk/4F9jui1vixNTKvegx2QwW6xVI2TKmaMUx4cAxFxpdhA
 dqZcmyMt+R0MQvSzCODxknq7SV2pZf8PNZyNVkledTfPlwUoQaTRGi9jND6m4WcndWO77U7rR
 iYcpgtyhBHnJVEDuj/ZGht3LT/47EzQ2HsFRr2r+1xjmeEX0LAK+ssxqG8z4mTcSq1iFxz08u
 45yB41TsYuID7qwrrN3AnzS1GxdI5d/VCOMUUB/wHmv+x9dJUcWvDGzGL7XGmB+8SdabG/b/8
 384YkKOoke/HozvefMXdL1tP2P0gkRVUN8TpFH5apqI8UQHOqHEXD3tfDXHtIxxRTrl1NSgr8
 tjluKjVHpe92KvsesFvYwZuFm1cD+KvNKAIFiIZe14Smty3f0qFaBrhy79O0r2+otws8=
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
 "J. Bruce Fields" <bfields@fieldses.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, inux-parisc@vger.kernel.org,
 linux-s390 <linux-s390@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Drew Fustini <drew@beagleboard.org>, gregkh <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup.patel@wdc.com>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 28, 2021 at 3:39 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Remove duplicate F_GETLK64,F_SETLK64,F_SETLKW64 definitions in
> arch/*/include/asm/compat.h.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

Unfortunately, this one does not look correct to me:

> @@ -116,7 +116,7 @@
>  #define F_GETSIG       11      /* for sockets. */
>  #endif
>
> -#ifndef CONFIG_64BIT
> +#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
>  #ifndef F_GETLK64
>  #define F_GETLK64      12      /*  using 'struct flock64' */
>  #define F_SETLK64      13

The problem here is that include/uapi/ headers cannot contain checks for
CONFIG_* symbols because those may have different meanings in user space
compared to kernel.

This is a preexisting problem in the header, but I think the change
makes it worse.

With the current behavior, user space will always see the definitions,
unless it happens to have its own definition for CONFIG_64BIT already.
On 64-bit parisc, this has the effect of defining the macros to the
same values as F_SETOWN/F_SETSIG/F_GETSIG, which is potentially
harmful. On MIPS, it uses values that are different from the 32-bit numbers
but are otherwise unused. Everywhere else, we get the definition from
the 32-bit architecture in user space, which will do nothing in the kernel.

The correct check for a uapi header would be to test for
__BITS_PER_LONG==32. We should probably do that here, but
this won't help you move the definitions, and it is a user-visible change
as the incorrect definition will no longer be visible. [Adding Jeff and Bruce
(the flock mainainers) to Cc for additional feedback on this]

For your series, I would suggest just moving the macro definitions to
include/linux/compat.h along with the 'struct compat_flock64'
definition, and leaving the duplicate one in the uapi header unchanged
until we have decided on a solution.

        Arnd
