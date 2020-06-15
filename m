Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAAE1F9FAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 20:49:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m0jn31pXzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 04:49:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 14793 seconds by postgrey-1.36 at bilbo;
 Tue, 16 Jun 2020 04:47:26 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m0gf4J05zDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 04:47:25 +1000 (AEST)
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N7xml-1iojCO2m9L-014yc5 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun
 2020 20:47:19 +0200
Received: by mail-qk1-f169.google.com with SMTP id g28so16790657qkl.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 11:47:19 -0700 (PDT)
X-Gm-Message-State: AOAM530vLx0zFOZiqOM/e9c5eyHxC7sNwC5LXmEcHwdxFId/vOmyjM2E
 RfykvJ4ttsJ/iX/YRFvS7+ZYdbdGsmSY1+kI1Gg=
X-Google-Smtp-Source: ABdhPJzcQbK0Gh43Vbjt9NhNlEHEP8lArPvLwYPZGPIYALBqTjBUF1iUc73zpucajmn7+xgOQVN3+L0nF4AR+SfsCY0=
X-Received: by 2002:ae9:c10d:: with SMTP id z13mr15874842qki.3.1592246838316; 
 Mon, 15 Jun 2020 11:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200615130032.931285-1-hch@lst.de>
 <20200615130032.931285-3-hch@lst.de>
 <CAK8P3a0bRD3RzE_X6Tjzu9Tj+OhHhP+S=k6+VYODBGko8oQhew@mail.gmail.com>
 <20200615141239.GA12951@lst.de>
 <CAMzpN2heSzZzg16ws3yQkd7YZwmPPx_4RFCpb9JYfFWJ9gfPhA@mail.gmail.com>
In-Reply-To: <CAMzpN2heSzZzg16ws3yQkd7YZwmPPx_4RFCpb9JYfFWJ9gfPhA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Jun 2020 20:47:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3q-hC7kZwLPbc+E5VYcqthQS4J4Rqo+rKkBRU2n071XA@mail.gmail.com>
Message-ID: <CAK8P3a3q-hC7kZwLPbc+E5VYcqthQS4J4Rqo+rKkBRU2n071XA@mail.gmail.com>
Subject: Re: [PATCH 2/6] exec: simplify the compat syscall handling
To: Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Tk5IGyeOUgQfuapvjyQTPP6oxTJOTp7iiu3kMX83Nqc1cFo/6iw
 ktpsnXHWIitQzlQg1FeqiZyE/DWmn0eYHFkC9l0AVJgR8OhgdG62/eq9LFm5srDMlPnjLTE
 iqmAvQec3nVb5gmWLAVlmDTsqr7TkPhuhhHoy0ZRmCCgUoyZPQo0kNxaxaDfztZvJuTDQOc
 6+3nzR1r2S0HHcMtBSb1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qWjmKt0MTB4=:Qg/SxQVTfDdvYuNvfANwY8
 1Uh2JtbaUvEm93o0GSu7yW1/F7SBM6OplekL9rUqVXcusqoJ3uCZRFqGcrEcpBeCToSdRWN9a
 d53pxJXElwgB7gqrMhk/EaLVWQei0lsIxQSdiSKyfzBF1143Z30bh1DMT6L/3QlZayuF2/b5t
 JG6ijf8RKZTJBGhoe0+uFMkfH8ThxVHCAbzIVZvjlXhH5c4+It8kCuTcST5GbbZNl+aiqZa+5
 D1MINTGNibxFlvAkgBzOJbuhNyDZ7AxMuwXfaupI8SMC2ckpCd87SQZy8UX9muN5jzg9siUBZ
 WBf0OmXov9wpEStZpccEK3zPNIpDIvQB0tsfietKj0h9lCpCRvkFl3OYtnXGekFrmjjtejoc2
 IgVm7fy94yM7cQif2DcL0plrGSe1A6FRv93asvJDWm7lLUaM680QfZrIh3giOfWswTZ0mPvvL
 WhM0afwvDzvHjZZR/trbQoN5oXBCp/c21TLUN37hEDqQ35NhAGBSfEMSPkY6SgBKA+bak2wgW
 TBwASC85ozv+MyDywFhQz0Pf17VX9ewqlwdfIFb89eECR9kX6ucIcjUHcFIiJmVJdqnnRpZSg
 +8hW1yaYnK4ueHREIGJTHw7k4tCVvwgCgrVOQQ1YPrmCXyckAfMZWHM6U0mhSheb7a56siBWT
 hfV8M+0D82nm05CgwovQPN2IP1FI4+zcCQImHDAP/Hszna0OIwmMdG/xcXMMxqanf6A7YIlAC
 nOjCUckU/OzTHTwT+/Ml9DzBjL0npUhD1RL2mnU775REhcV/ptOAmm6q8sahwi3uu40TomP0h
 XBg25ZjXtuQ8LoEkk1Mr4ql29l+dZ9VdLjIAsqaKyC3AZWgoYc=
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
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 4:48 PM Brian Gerst <brgerst@gmail.com> wrote:
> On Mon, Jun 15, 2020 at 10:13 AM Christoph Hellwig <hch@lst.de> wrote:
> > On Mon, Jun 15, 2020 at 03:31:35PM +0200, Arnd Bergmann wrote:

> >
> > I'd rather keep it in common code as that allows all the low-level
> > exec stuff to be marked static, and avoid us growing new pointless
> > compat variants through copy and paste.
> > smart compiler to d
> >
> > > I don't really understand
> > > the comment, why can't this just use this?
> >
> > That errors out with:
> >
> > ld: arch/x86/entry/syscall_x32.o:(.rodata+0x1040): undefined reference to
> > `__x32_sys_execve'
> > ld: arch/x86/entry/syscall_x32.o:(.rodata+0x1108): undefined reference to
> > `__x32_sys_execveat'
> > make: *** [Makefile:1139: vmlinux] Error 1
>
> I think I have a fix for this, by modifying the syscall wrappers to
> add an alias for the __x32 variant to the native __x64_sys_foo().
> I'll get back to you with a patch.

Do we actually need the __x32 prefix any more, or could we just
change all x32 specific calls to use __x64_compat_sys_foo()?

      Arnd
