Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5421505CA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 13:02:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B6065csdzDqMd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 23:02:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B5wV3VnqzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2020 22:59:37 +1100 (AEDT)
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M8hMn-1iuTen2HWT-004hQG for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Feb
 2020 12:59:32 +0100
Received: by mail-qk1-f178.google.com with SMTP id q15so13914936qki.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Feb 2020 03:59:31 -0800 (PST)
X-Gm-Message-State: APjAAAVxOdnbmwmpLNS4R/T1mjrxhEYBVD6dktjhQ+lgw8YYHmTYQvOQ
 YeNA4DqVG14jTyByfftvyF6QNLdip9thqSTDJ5U=
X-Google-Smtp-Source: APXvYqyvsIiRUM+eJEFAIsaK7CjOU1YcjR9nHLh0/OBPGpCnh1WHcjpw3dP0kWUCKlcYs360p9M7EBVhR7QpHHhxL8A=
X-Received: by 2002:a05:620a:16a7:: with SMTP id
 s7mr22539771qkj.3.1580731170570; 
 Mon, 03 Feb 2020 03:59:30 -0800 (PST)
MIME-Version: 1.0
References: <231ec2e1fd2470ef7a9b8b2c766ff8e4095b6dd3.1580399657.git.christophe.leroy@c-s.fr>
 <202002031426.QLrslGif%lkp@intel.com>
In-Reply-To: <202002031426.QLrslGif%lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 Feb 2020 12:59:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2+Cq_-L662WaQeScTTX1W50wPAkqs1R=fqyrHrd74znw@mail.gmail.com>
Message-ID: <CAK8P3a2+Cq_-L662WaQeScTTX1W50wPAkqs1R=fqyrHrd74znw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] powerpc/vdso: Switch VDSO to generic C
 implementation.
To: kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:soKrXrIXycbu9ydvckTpeWPIhwqShdCsEE7aY2jbwTZdC9fWC3h
 WoN7V0mhteC1toD2f4HoSHtgwudCk1JWbtWeC2DVCbzsobS90SSwlXMSA+wq5xaqeOXnnah
 i5CJSoPkjc7sDhj2ZjaJRcnWJ2uEGJednTzOF9eDtFz1I8Nq9iYsAGellrczBKLCo9nyvzL
 CLivc1BSgt/bUntTHVzZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uw7kRAkL2UE=:/pk5icvsRDa6pVDS6/vTUv
 1i9hQ7fztsiLEB8SfZ8uPDOuzyADZ+cZDglKYRKjRNSaduJt4xT2EZu5fivL1nYB5CPPmd29S
 Tiv99d0Vgz6N9oc2K6wXY+8IxnNUlIfqnbVEd4dZhlAzQlGEZWdyd1gWKUi5B3gv/PRa9NKWM
 vvFnFEhDrVHbXQr4KsNRSb7KZHaQ9ify5Es3Eksst/k9M+37x61rnkDairKoH6Jcwvugk+nlm
 f2LQ9PqCnFBRj9F0XhiCAqZj0GShI0pkMbWo3zONqsoxNSpq96Ejyw+STnJWBm/4tL7xHh8al
 p6gANotouPUArK48FwjkjFOiRv+MTYvAHaaTnbDWKPLdF92FmBMVQAGc1btKWEEJu97lJKCm5
 rMpWzQo2ZWnz0y8E0nOj25+t/fp/zYzL2a7juHsCbsplsFhtpdEz+Oe9K90u+klYAq6j9Q++d
 lSfjqoTz3nMZU9iPBFkt2HSO0AFWd6elzXUlj3zQxdqsTMIfQxiBc++62QiY02il7e6KrIBnx
 o6l+dAxoTnCydvaTs1gomeoQMQnY32sdDyB63DTCMtgT/G2OMkN4KpNgCXwpxmjW6Nt2mIrAD
 no8a+La8/R52EnOdJxt7jSXo/qCx0wykutWt6RHuhUs5Kfcnsl0g3+ICuiXrtqla2F1xnlE4I
 rebCukjCyxrzi+5b1Jb8kVvywjOirHGwGXDeeMo4msEPNq1JF7cqhFBzT4bn629voLZaaQtL6
 5b1n0c2qOEl7CUfXzv/h0Y47XpfYfb4s3UZwxksXdvPZ37V+e6KLiLRX1Qcd0yMorJE8odXrk
 20pPUxdBNHAYJOT8FE8acW6AUO9oAiIxyRMWOfcLB7g9ajnO6c=
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, kbuild-all@lists.01.org,
 the arch/x86 maintainers <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 3, 2020 at 12:28 PM kbuild test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/powerpc/kernel/vdso32/vgettimeofday.c:26:1: error: unknown type name 'time_t'; did you mean 'ktime_t'?
>     time_t __c_kernel_time(time_t *time, const struct vdso_data *vd)
>     ^~~~~~
>     ktime_t


time_t is no longer available in linux-next, so this has to use
__kernel_old_time_t.

      Arnd
