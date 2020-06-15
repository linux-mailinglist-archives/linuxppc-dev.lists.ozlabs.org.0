Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 983751F9BE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:22:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lw6f6NppzDqHx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 01:22:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lvrC3P8SzDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 01:09:31 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E658068B05; Mon, 15 Jun 2020 17:09:26 +0200 (CEST)
Date: Mon, 15 Jun 2020 17:09:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/6] exec: simplify the compat syscall handling
Message-ID: <20200615150926.GA17108@lst.de>
References: <20200615130032.931285-1-hch@lst.de>
 <20200615130032.931285-3-hch@lst.de>
 <CAK8P3a0bRD3RzE_X6Tjzu9Tj+OhHhP+S=k6+VYODBGko8oQhew@mail.gmail.com>
 <20200615141239.GA12951@lst.de>
 <CAK8P3a2MeZhayZWkPbd4Ckq3n410p_n808NJTwN=JjzqHRiAXg@mail.gmail.com>
 <20200615144310.GA15101@lst.de>
 <CAK8P3a17h782gO65qJ9Mmz0EuiTSKQPEyr_=nvqOtnmQZuh9Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a17h782gO65qJ9Mmz0EuiTSKQPEyr_=nvqOtnmQZuh9Kw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

On Mon, Jun 15, 2020 at 04:46:15PM +0200, Arnd Bergmann wrote:
> How about this one:
> 
> diff --git a/arch/x86/entry/syscall_x32.c b/arch/x86/entry/syscall_x32.c
> index 3d8d70d3896c..0ce15807cf54 100644
> --- a/arch/x86/entry/syscall_x32.c
> +++ b/arch/x86/entry/syscall_x32.c
> @@ -16,6 +16,9 @@
>  #undef __SYSCALL_X32
>  #undef __SYSCALL_COMMON
> 
> +#define __x32_sys_execve __x64_sys_execve
> +#define __x32_sys_execveat __x64_sys_execveat
> +


arch/x86/entry/syscall_x32.c:19:26: error: ‘__x64_sys_execve’ undeclared here (not in a function); did you mean ‘__x32_sys_execve’?
   19 | #define __x32_sys_execve __x64_sys_execve
      |                          ^~~~~~~~~~~~~~~~
arch/x86/entry/syscall_x32.c:22:39: note: in expansion of macro ‘__x32_sys_execve’
   22 | #define __SYSCALL_X32(nr, sym) [nr] = __x32_##sym,
      |                                       ^~~~~~
./arch/x86/include/generated/asm/syscalls_64.h:344:1: note: in expansion of macro ‘__SYSCALL_X32’
  344 | __SYSCALL_X32(520, sys_execve)
      | ^~~~~~~~~~~~~
arch/x86/entry/syscall_x32.c:20:28: error: ‘__x64_sys_execveat’ undeclared here (not in a function); did you mean ‘__x32_sys_execveat’?
   20 | #define __x32_sys_execveat __x64_sys_execveat
      |                            ^~~~~~~~~~~~~~~~~~
arch/x86/entry/syscall_x32.c:22:39: note: in expansion of macro ‘__x32_sys_execveat’
   22 | #define __SYSCALL_X32(nr, sym) [nr] = __x32_##sym,
      |                                       ^~~~~~
./arch/x86/include/generated/asm/syscalls_64.h:369:1: note: in expansion of macro ‘__SYSCALL_X32’
  369 | __SYSCALL_X32(545, sys_execveat)
      | ^~~~~~~~~~~~~
make[2]: *** [scripts/Makefile.build:281: arch/x86/entry/syscall_x32.o] Error 1
make[1]: *** [scripts/Makefile.build:497: arch/x86/entry] Error 2
make[1]: *** Waiting for unfinished jobs....
kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x14: unreachable instruction
make: *** [Makefile:1764: arch/x86] Error 2
make: *** Waiting for unfinished jobs....
