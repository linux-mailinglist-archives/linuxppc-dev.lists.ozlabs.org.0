Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3F3494DDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 13:26:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfhZ372Vpz3cDy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 23:26:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfhYd41QFz30LY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 23:25:40 +1100 (AEDT)
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MKuGD-1mrUBo06Pd-00LENY for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 13:25:37 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so13253469wmb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 04:25:36 -0800 (PST)
X-Gm-Message-State: AOAM5320gm0QCyvvSolBH85QPbHKIpE7DXJWjaZzI2jV88SQ1o0ZOclD
 SHvnSvJgR5y9pQNfxm+bgO8t/Jqg8M6Hktz8uos=
X-Google-Smtp-Source: ABdhPJxEAFXYVk6DktXv3061JPbB7MqrKutmOAXqbVu5eyk6Pz36dhnH8dbuNkOxd7GlFiEfJn/5TzSKv0rhSZwiTMY=
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr8113766wmj.82.1642671479094; 
 Thu, 20 Jan 2022 01:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-14-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-14-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:37:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a03-3QTC-vxmnbouK7wBd8iunPGZpX0-Jf6ntS1DY0E=w@mail.gmail.com>
Message-ID: <CAK8P3a03-3QTC-vxmnbouK7wBd8iunPGZpX0-Jf6ntS1DY0E=w@mail.gmail.com>
Subject: Re: [PATCH V3 13/17] riscv: compat: signal: Add rt_frame
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xRB8w0/QbjoCLaihZ4x8KC1j6veZWKbnfyXwv+xB8SLJ708OHMF
 anMPrC60pKOASEbWcaxyfG8r3B+OzByxcKZSMecmitdhKKvuTooc1s3TQ02W5ZFDdNXwMi8
 sKaL8lc/CKBmH9YHj6RqmHTuLFm4JeAinHSUQ0FEgtcgHonkpxGtdFNJPcOXLIumzriIyF3
 B+FFgwYkIdlqh5rctUziA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OUJ0XQwlGvI=:I9pCq/P8MtDXuxwa6lBl7x
 5lo8z2E2ZuB7F4ZAcacUSZDnn20rZKl1iYsOqVoLsBm+DhFn7+DuAxolql3G3JCb2xCXNMm9/
 ybvo6Q3xD3tYvyQxU1Wr6GPQAKTeWKhBXqYprfHaAbA5zlg8kBIKeMNAHmdxCRV+r/WPH6ECq
 0Xj/dki29hRgYg61GUhfjm2TTP30tiGwCf0SkNQ9poX/B3z2VQ/jDo0PjQ8JtyiMdOpd7uMX2
 QwGtz8Re1A3zA7n6RCUFpKY8dEQxsI8SpqqNQl6yfw2I3VKMCNwVx9NzbEh29IDosBCJkGHB5
 kW07fF/TbK/iPSwIKGuv7EIGR1+La6e10RqpxpVVYS+WCPN9z+kAbY8oq5XO7na4Y9Kvq8yN9
 uSHGV7+OBkxmT8Hpm3udd7EpSuF5tKntrsrfQe63OmcsmL8DMXXYjJl4NlUD23oT7WjOgTA/k
 skuGl+Ii9XfiK2IAIfR89+zesllsgKtN7o+ZPMU4lQkRxBi6cf+OelGQc25hzBZBsQtzCJzax
 8Wi5tWiFS9HB7ZTAOW0JXFKHEkQtC1se+hEAeeWQi0/VBMb4d05clwI7gJMfQJNZjpKqXKwAo
 iRWFrs135DQlOcpE8mk314rtgpOppP83ELpuiv8uvEzK1HgeEjxYzdIyeEw16riHiDDs+pshK
 GFLj+FLDGr/wVpQa6q085wBXSPBocS3EY+ya2+BIzKCrmXRPD4GHHIzAzsxFy3Uf7ed9A74rM
 iaxOxrSNKbynR88MctCjfp3HZ9HtGqwKHAypeRFRmSINsyL+WMwcRwy/Sjp3gH846W9h7AIkt
 yl1VmNA+ntzr4yOZVwVcRE5gADYfipyxyjlSgHVvZDdL92Y1AA=
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
> Implement compat_setup_rt_frame for sigcontext save & restore. The
> main process is the same with signal, but the rv32 pt_regs' size
> is different from rv64's, so we needs convert them.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

I hope someone else can properly review this part, it's not my area
but it looks complex enough that it could bring subtle bugs.

       Arnd
