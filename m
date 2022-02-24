Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA44C28B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 10:59:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K47gD4SZ8z3cM5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 20:59:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K47fp3gzwz2x9Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 20:59:29 +1100 (AEDT)
Received: from mail-ed1-f44.google.com ([209.85.208.44]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MVaQW-1nmQyv0cqq-00RWv7 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb
 2022 10:59:25 +0100
Received: by mail-ed1-f44.google.com with SMTP id bq11so2053355edb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 01:59:24 -0800 (PST)
X-Gm-Message-State: AOAM531mn6ZnvJnIY2gTZ7+XCiUQKah0Z9cc1MeVJ9sIlM8lSi0XFoys
 rwqikVcly6yhfWrQkmnU8KOue6tv8kHwNdylQSU=
X-Google-Smtp-Source: ABdhPJxKnbR5fQtLrHkUQmPSDD+xkHkCuZRWZe5PlaQucJaWZYHMl1I+Wr1dE0VfS6g2+fYVY4BPWlfD5Z76idC1Sco=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr1559929wra.407.1645695092672; Thu, 24
 Feb 2022 01:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-12-guoren@kernel.org>
In-Reply-To: <20220224085410.399351-12-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 24 Feb 2022 10:31:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3wg9S_zPad74FiJzYBn0M9bQyunuKzmH3z_QQrags5ng@mail.gmail.com>
Message-ID: <CAK8P3a3wg9S_zPad74FiJzYBn0M9bQyunuKzmH3z_QQrags5ng@mail.gmail.com>
Subject: Re: [PATCH V6 11/20] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1ZUYRet6GgYL2kBD6z39LhH9rQHSacstRMZ/PcLIWHQva65OBb7
 rhb13YndUIp9G1VXHJChJ8EIeRSQsZvOZBVEU8NIWYabkqPZTlrYKrNpG9J/vrLmgRJ78i9
 mgtlr/X7SZuUovgh74P7OFQuN86QtHMKK/J8NqHijlXnIDaqGPx0CrSOmsvXxOyMjqNl6MJ
 1ncEltnKbT4s+FZ8SChGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JJMoQ7vo2Qw=:1hVq87c5ciK/RGrnWJnsl7
 JylDoGXxtKr2uiiJqZlCrDRcuWglR77wD/08/zuArZHYmU2CGcJL6SLsCiHjddxiry60uBMVo
 qV3YyvfEp90oC7zsbQIIQJkwntF9We2/fL3TLbIyc1G4SXw+vUKihevluwbvXwma2zcBTt5NY
 NZCotC8nfoAfXvMloQ0qIDxL+McDHyg6k0GSzK3TvfirN/KjC9e7beNGbtod48dYWMgIfRV1c
 AmFA2zv+UF2K0niTJ7LfEgMF300Lrqsw3kopbTNJ4+iMUTb1uNrZFcsG9/ziT8KiQQDSr3lfc
 PM/LBAYeGFmFv81qtZSPjU4ZniADlGtLGgfa+1YCJ4EE05UbQAfu27YhCJ4gBsOSjuOikHT+X
 aS5L9kdweVo8WNiE7h+pBqYxUH45XiQUdf7qQ/gaqWUUvvhK3oZdXkzvPJpkK9czfr37cYDzV
 3BTeQMKhYtHqnT9751FJkm78Pyd8fM3OvkhpI2RkoLbmeeJo44QxNZPPk/E+J0KdY4nt9bDJl
 6mL01KYirXvg1d+BP/2lMCP+VyFl6oeu7M7b4FHadxwt22eHDzmZhnO7ES7LpTNs7PIFLO/4a
 7lL3y0XPNyX6cgvdeJLKx8fJDytH/gxQPJ1Ix9p/U9JiwV561T2JaezamVGngstMzlOvr8Rc3
 hPqZHFbRny7yL/xUg3WeZaGL1akLtsaBA+xJVTKU991bkIDDZWzGfv/Ph/ckCLrNXNw6qjMD7
 GlDgtBbbyDSN6A6pC3cjImz7ZazAV2USzGzOnxtnqMtg+pKQwjMfuSQpqf1HQrD0MRngcbTpm
 rsW2Re5B300/QM7uLdBJ4xvddsKv3EVkD5NIhwVrfYD0MNj0+4=
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
 gregkh <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 24, 2022 at 9:54 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement compat sys_call_table and some system call functions:
> truncate64, ftruncate64, fallocate, pread64, pwrite64,
> sync_file_range, readahead, fadvise64_64 which need argument
> translation.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>

Here, I was hoping you'd convert some of the other architectures to use
the same code, but the changes you did do look correct.

Please at least add the missing bit for big-endian architectures here:

+#if !defined(compat_arg_u64) && !defined(CONFIG_CPU_BIG_ENDIAN)
+#define compat_arg_u64(name)           u32  name##_lo, u32  name##_hi
+#define compat_arg_u64_dual(name)      u32, name##_lo, u32, name##_hi
+#define compat_arg_u64_glue(name)      (((u64)name##_hi << 32) | \
+                                        ((u64)name##_lo & 0xffffffffUL))
+#endif

with the lo/hi words swapped. With that change:

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
