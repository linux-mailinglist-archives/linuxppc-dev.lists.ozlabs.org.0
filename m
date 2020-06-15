Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E21F9AE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:51:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lvRw3PsMzDqFt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:51:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lvK85gQ3zDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 00:46:03 +1000 (AEST)
Received: from mail-qv1-f45.google.com ([209.85.219.45]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MJEMt-1jUgJZ2fud-00Kg9r for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun
 2020 16:40:46 +0200
Received: by mail-qv1-f45.google.com with SMTP id d12so5016123qvn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 07:40:45 -0700 (PDT)
X-Gm-Message-State: AOAM533oBGRfUMqNhg1GXQYVVf/3sTSmwqX29FIeiZMAuKaxCfuB8Hsv
 ths9sFCYkx849PJQy+tSw840Bk6CHq17G9wUIug=
X-Google-Smtp-Source: ABdhPJy5G+lqXMDgYV5VNdPxt3xfenQEOCWyA8aXe4/SWcJM/wjewAOCgmyKi30Ru8Z83jxOnA642v09TgrEUqRdTlc=
X-Received: by 2002:ad4:4b33:: with SMTP id s19mr23452579qvw.211.1592232044975; 
 Mon, 15 Jun 2020 07:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200615130032.931285-1-hch@lst.de>
 <20200615130032.931285-3-hch@lst.de>
 <CAK8P3a0bRD3RzE_X6Tjzu9Tj+OhHhP+S=k6+VYODBGko8oQhew@mail.gmail.com>
 <20200615141239.GA12951@lst.de>
In-Reply-To: <20200615141239.GA12951@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Jun 2020 16:40:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2MeZhayZWkPbd4Ckq3n410p_n808NJTwN=JjzqHRiAXg@mail.gmail.com>
Message-ID: <CAK8P3a2MeZhayZWkPbd4Ckq3n410p_n808NJTwN=JjzqHRiAXg@mail.gmail.com>
Subject: Re: [PATCH 2/6] exec: simplify the compat syscall handling
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:U9AjeVR7ocAu+vObKJL90dkMWWMfXmINutmHjCczkuk0rMvEK/Y
 i7JJfGHssSbH0Jho+bXSNfZhjWnDuXVMSkmwdn0zzY7ycAxcNOIEkbSaSHHIcSHsFEaxihV
 jbpFwo/jo/10lx4mTa9B40pzfTcEg4SD3eio/NeucLYokpHnPe7MonAdsHBu622DSQFPexK
 F7tNJy/oRyAPjSAp7bE/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DQT7++88h/4=:XEPLf78WouCW9Rlid2ayRj
 WWz/0iUXTat3VjDd2DxWTsCTARpzQDtSP9DdgO+27bQKCLP8qwWi6zJHKK2IAySrcWdmhK4ja
 8/5tW4Zk7lWycWyZlxbW/C94LbdprZh97ZBc3+MPT6ig9aZpZ6/Yu1iP9fI/yHfqYDNRtybJ8
 FB+ULzgUhmD75zJ5icoZqm7pEgaFH6y6uCRsagDE6sLmHeC6QNf8bpEDEXNZ64TeoSFSH/PWV
 E46KT2BRvt7v7b9X1ZAOYXbI3Cy4pyJE1jb1QQ2ZG/pp79Nt+CLTmn+REf2FC3SAieOJnvXOk
 ZhRH/PKP/U54BZochTYonopueScEuxad4scmgwNUDUCdws671217NyvmJ/y6l6jugOsOY7kX+
 y2L2vlMt2YX+f/jpsKXBsr0TkbOSZEU5OQyMxeRBwV9SL+bsg0WInqYG0WSf70PhOied13WsY
 A6Ow6/5L9fcqEc+o+KoSTRUSkzGRY20Iztm2lL/QSSR9JSR1PLUCxxkd+TdnoY2I+jFfw9SFi
 TJbb7+v6m2F1cEl5PpscJgoOTo5AwQ5ZVvPZGhoPfJLc1vTwuV0OsZp/2BaDxgW9yGOsa+lNx
 WDyk4XomtG3y3yxyL6kh61eFQ2Y7+xMiTGeogR/Wb4GE+ZlsAEjGWYEe4xro0VXCno68KmYzC
 QNWEUg+B6HnPQrMMWP/DvC+4glVABdyXHI5UkdmXu2GZh0YUGjRSb4tx+5s0KjLqC4vcDogAI
 g4YTLfX8d3XvEaMMmAKyeETuXG2ZyjmEFVsnaHIdHVKtzBby8uVYBADUTOeMGH7afweaauXlE
 NG9ZGuHPSmXL5hoxYFLzaqm1tIg7j/dw4pXrkfdCY8pI/dc/X0=
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 4:12 PM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Jun 15, 2020 at 03:31:35PM +0200, Arnd Bergmann wrote:

>
> > I don't really understand
> > the comment, why can't this just use this?
>
> That errors out with:
>
> ld: arch/x86/entry/syscall_x32.o:(.rodata+0x1040): undefined reference to
> `__x32_sys_execve'
> ld: arch/x86/entry/syscall_x32.o:(.rodata+0x1108): undefined reference to
> `__x32_sys_execveat'
> make: *** [Makefile:1139: vmlinux] Error 1

Ah, I see: it's marked x32-only, so arch/x86/entry/syscall_x32.c
uses the __x32 prefix instead of the __x64 one. Marking it 'common'
instead would make it work, but also create an extra entry point
for native processes, something that commit
6365b842aae4 ("x86/syscalls: Split the x32 syscalls into their own table")
was trying to avoid.

      Arnd
