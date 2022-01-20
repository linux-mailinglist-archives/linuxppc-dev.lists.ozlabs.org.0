Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B611494CF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 12:29:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfgKH3HChz3bT3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 22:29:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfgJr3ZKNz30Ky
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 22:29:31 +1100 (AEDT)
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MYLqs-1mp2dZ0K8o-00VM7Y for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 12:29:27 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso6656941wmh.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 03:29:26 -0800 (PST)
X-Gm-Message-State: AOAM530QW/jOdatE1nMn32aDS21iI7rw0TYlCB+kWKlG04WJ7ekXPhPY
 8SH+ERsG6QvRsVaSO3j7+HGlqFBGRIL7yM7OlUw=
X-Google-Smtp-Source: ABdhPJxuH3ieTJMrWvtM18t+kt/eQKxNsX0S1JRfafUu0rov1od6UeEmq8/soY26aK2ZvAh1u2FgbOu1pscCT0xGmKw=
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr8086318wmj.82.1642671086465; 
 Thu, 20 Jan 2022 01:31:26 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-8-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-8-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:31:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
Message-ID: <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
Subject: Re: [PATCH V3 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:SZ41ugoseP2Lcu3S121ZTTFGEhosnmOZttYNneUIWAhhxJKNSpf
 SInQfD4LWBIjYo4Oyl6XB8y8ZpPP8GFPPM/f77A0tpIeTIpG/5WdHnR3atlKE8sSXa83SDu
 eP7p4mD9mGnYxLdU2nTCMbQxPvwnbSEm9MCUEgnqi/1UkNHtiRyH4+18pWeHfVInDprsX++
 7058eOK+cmms2Udp78CHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VLnwDnOY4zk=:Btz4f/vZVGmwl3mlBJlodm
 uO2BNJP9LLrmG2FYHtc1zKooqjGTF41l57qC+LveFFpFy9U2qny+WHEWmlcMIxo5SP+DP9w+s
 WTpea2L/wtoPjlbnQ9STqNL9XVuOetUI+Bx50c0JfHwssQElRH2QFWrtApkSmiER4F3ASgX0E
 bvlF0fnGbPn7ymKXmYOO9F7Tc52nYC9UsWvw6l7C2/AWbvfTJImF+3mgf6sICc912lwyfk9k8
 jhjUzANsRIFIt4Juua6tlYsw3PES2iF/VueZG43hlM247SSsEopSrinB6MsAjeskNLJSC7hTi
 ug0ETjy1TEMlUQNSq36d+hqwqaRqaqGjfZ65qLmGX7Z1nXVkG3IOEBZQrN+Eu77RSMLznC3Ia
 ZuOQZ1zgTToVKU1gwXgkGeiA5XxNuJq4Ylvtgs37HhQwSRISUMxG18ee+XZMyctLU7PZl1xj/
 RsqPZJ4trPn2zp8LmDZBURVCAsDrhgYgHGmOH074mtAPc5hBxgR7LrbjMSFINgRYiscSo94Kr
 +Lh1PtQFCgqYUev8FZTkPu2tIzQpwNgF+9wU+7LnGyP6PrPxMOyVtOocdJ7rnpJ/xvLYdc4Dp
 ynOQhzZWZ9u+T3RFBmoE172HvWXSvDdj94aa6qpO/x1u21wjNYMQcHz3DcFUboLIlu53dqKNO
 EMFvPPi0R74eb8vnONlHLTdftEOkVLHj0oxkwunuHvJHHvIRDxwSWhv0LS63ISfyjanoKRKf8
 5Y5kRHjx5yOjx/Y4HWCCibgYdnhyiAO6OKe81acJvAsKEguYWBG/WlVfCnudQmRqfJchgLZ1t
 GD+jJnbgxmtg3u8pWVGuKKcrfCAaQ0tEJr2IJp/nJMszNKCy7Y=
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
> Make TASK_SIZE from const to dynamic detect TIF_32BIT flag
> function. Refer to arm64 to implement DEFAULT_MAP_WINDOW_64 for
> efi-stub.
>
> Limit 32-bit compatible process in 0-2GB virtual address range
> (which is enough for real scenarios), because it could avoid
> address sign extend problem when 32-bit enter 64-bit and ease
> software design.
>
> The standard 32-bit TASK_SIZE is 0x9dc00000:FIXADDR_START, and
> compared to a compatible 32-bit, it increases 476MB for the
> application's virtual address.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
