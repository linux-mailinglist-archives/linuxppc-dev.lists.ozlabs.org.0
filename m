Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F03E1A6D01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 22:12:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491KXg5SrzzDqPM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 06:12:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sGiHveUF; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491KVm1vGRzDqLT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 06:10:39 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id b7so5898202oic.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 13:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=Jo1CFsY5zk8abkk0OMLxJjiIsujxmtrwxbQ2I4Rzdjs=;
 b=sGiHveUFdt0c+vYET/KfvOuUtYHikFuJcbqDC0QqijOKf8O1gV8JDlUCPyjUvpT1Ve
 Q2fYyzV1zdXJ4tSKfH8k4mWec6oewfOcpKInd3/Yz90roBd8ByBEmkNM7Tav6DD6MiIU
 j0FXZzcgJbGYgixMkqtQiF0htyBcbWakhaCxCWBqxje+FAmzKr5uVpawwHK9pOGXcRj1
 iqbpF+dTFbAYNob2rx6oIPZNJn4oENTI/ubnh1CqdTczz/cFjm4gGwYfDaxdC0oidNTV
 BnNt8+3thUd1iUwzPYJstZlZYzMjEdx/KAzAqoTMf/VDMLr3oQXFqzfh/3HT220gbMPv
 yMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Jo1CFsY5zk8abkk0OMLxJjiIsujxmtrwxbQ2I4Rzdjs=;
 b=hIzzIIAswcOi+XPGFQoFcNTdqWhJ5/Ujk6eW0YTQB7JPgasQWesPPy7eCdQIIYknFl
 eVGX/n47GiwMpUJEFNImN03x3vt9wS/9T/8o2ejMdcRKtLPKWfaTzeheSRgzPk0ORQXQ
 PPKDU4GdMmRUcwuAQxD4vw1XXpFsuPI+FOYftixDOMjGscegwCrRTFGkGppgTeJgLkCd
 AbN/8e8pgxUPLni5+gAvXaANorJrVi/8hlGyl/UFqh4C4GgyO7faBPFkNOzZBCjRxDpb
 kvg+PD/0vHmEt18DWjOO4xXJwS4kcWIdSwq25AALTd3UDznrEm8B3NskFknfN3KLpPJC
 rzbw==
X-Gm-Message-State: AGi0PubN5wwHZtnJs3ogqa5HdThMHRH5B4vS5xgStnFaTn2BRMIIr4dq
 K1JPuoa62hEXjQUOWZb6Q/L80pO3
X-Google-Smtp-Source: APiQypIqkUGZp5pKTF9SKyc7KIcM1kqKZeqVQArylcXK/SrmdVl7uAQdjj1jGQc/Uvcjjw7YW2y7Zw==
X-Received: by 2002:aca:5358:: with SMTP id h85mr2522889oib.42.1586808636411; 
 Mon, 13 Apr 2020 13:10:36 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id u205sm5060954oia.37.2020.04.13.13.10.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Apr 2020 13:10:35 -0700 (PDT)
Date: Mon, 13 Apr 2020 13:10:34 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com
Subject: -Wincompatible-pointer-types in
 arch/powerpc/platforms/embedded6xx/mvme5100.c
Message-ID: <20200413201034.GA18373@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

0day reported a build error in arch/powerpc/platforms/embedded6xx/mvme5100.c
when building with clang [1]. This is not a clang specific issue since
it also happens with gcc:

$ curl -LSs https://lore.kernel.org/lkml/202004131704.6MH1jcq3%25lkp@intel.com/2-a.bin | gzip -d > .config
$ make -j$(nproc) -s ARCH=powerpc CROSS_COMPILE=powerpc-linux- olddefconfig arch/powerpc/platforms/embedded6xx/mvme5100.o
arch/powerpc/platforms/embedded6xx/mvme5100.c: In function 'mvme5100_add_bridge':
arch/powerpc/platforms/embedded6xx/mvme5100.c:135:58: error: passing argument 5 of 'early_read_config_dword' from incompatible pointer type [-Werror=incompatible-pointer-types]
  135 |  early_read_config_dword(hose, 0, 0, PCI_BASE_ADDRESS_1, &pci_membase);
      |                                                          ^~~~~~~~~~~~
      |                                                          |
      |                                                          phys_addr_t * {aka long long unsigned int *}
In file included from arch/powerpc/platforms/embedded6xx/mvme5100.c:18:
./arch/powerpc/include/asm/pci-bridge.h:139:32: note: expected 'u32 *' {aka 'unsigned int *'} but argument is of type 'phys_addr_t *' {aka 'long long unsigned int *'}
  139 |    int dev_fn, int where, u32 *val);
      |                           ~~~~~^~~
In file included from ./include/linux/printk.h:7,
                 from ./include/linux/kernel.h:15,
                 from ./include/linux/list.h:9,
                 from ./include/linux/rculist.h:10,
                 from ./include/linux/pid.h:5,
                 from ./include/linux/sched.h:14,
                 from ./include/linux/ratelimit.h:6,
                 from ./include/linux/dev_printk.h:16,
                 from ./include/linux/device.h:15,
                 from ./include/linux/of_platform.h:9,
                 from arch/powerpc/platforms/embedded6xx/mvme5100.c:15:
./include/linux/kern_levels.h:5:18: error: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Werror=format=]
    5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
      |                  ^~~~~~
./include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
   14 | #define KERN_INFO KERN_SOH "6" /* informational */
      |                   ^~~~~~~~
./include/linux/printk.h:305:9: note: in expansion of macro 'KERN_INFO'
  305 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~~~~
arch/powerpc/platforms/embedded6xx/mvme5100.c:142:2: note: in expansion of macro 'pr_info'
  142 |  pr_info("mvme5100_pic_init: pci_membase: %x\n", pci_membase);
      |  ^~~~~~~
arch/powerpc/platforms/embedded6xx/mvme5100.c:142:44: note: format string is defined here
  142 |  pr_info("mvme5100_pic_init: pci_membase: %x\n", pci_membase);
      |                                           ~^
      |                                            |
      |                                            unsigned int
      |                                           %llx
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:267: arch/powerpc/platforms/embedded6xx/mvme5100.o] Error 1
make[3]: *** [scripts/Makefile.build:488: arch/powerpc/platforms/embedded6xx] Error 2
make[2]: *** [scripts/Makefile.build:488: arch/powerpc/platforms] Error 2
make[1]: *** [Makefile:1722: arch/powerpc] Error 2
make: *** [Makefile:328: __build_one_by_one] Error 2

I am not sure how exactly this should be fixed. Should this driver just
not be selectable when CONFIG_PHYS_ADDR_T_64BIT is selected or is there
something else that I am missing?

[1]: https://lore.kernel.org/lkml/202004131704.6MH1jcq3%25lkp@intel.com/

Cheers,
Nathan
