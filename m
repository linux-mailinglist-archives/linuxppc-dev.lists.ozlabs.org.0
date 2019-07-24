Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC68A72BB3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 11:49:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45trD52CpWzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 19:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UvwJ2lo5"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45trBJ0kM0zDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:48:07 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id i10so88166100iol.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 02:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8dj50axO8C54fqaJo4sVi0aVeMQ4lAcF1ULpERAzug=;
 b=UvwJ2lo5i2e1IV79pm+YfpJaMt4vPCYwRCPfKRQTknVD4JKC8i+Tdml3VIDmX6axts
 ddU8Nqerb7XM+RxMpBDNg+uv1Oagp+iJSj/JKY3Aut2sBXriivcQ1qAdjrhGzsE6YGGR
 tZdxGvvSDH+KxnCzubx48cE2vYS+WNMqAgiJnUPCLHgUKhsYYXk/U9v4kLsv2jTh1e69
 YSE4SyySlY1m26K+nJC9A1jgEwW6TNRgXTWkf4PCtEooGl1NoI3hEMvAtsO3hbZZewaG
 QX53rLoR8OSMdS5PAoduRHMPqCYgNNyGgURFH68PeO6x0rRYP5qgf3CmlEXG1G9mSuk1
 K/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8dj50axO8C54fqaJo4sVi0aVeMQ4lAcF1ULpERAzug=;
 b=qw3k7mrg/eJ0IZF7hnfy9Z5eMM3yGXmc8f9G+sikia1051Y/oqKTQSQtxYaR9HhDPY
 znIcnvRX6EUvdHYol78Z4sVWKj/8qXv0yd1+LFgf9qrbmxZpo4T3VGCJm+vddUdO8Vkp
 ec+/KEroh826gwFMXzPcXrgh9QBa2+PeHRhvdL/QXUMroYEOxWsL7+Tkqb1cxZ7KbZdq
 +iHEc0NyAGe8BOBRYia8l1iXE0GroDJDMR0Lu14TGuDHl7TPdPjVcRVyotlIjHVMXyfq
 j4eVcVNE8kcKVm6IC0Vw5Dnq09JAkoRfCtCtMe2i76cREm/BfIrLT8YBqqeo7iakXIiE
 diSw==
X-Gm-Message-State: APjAAAUmrQzc8mgPfwfMEppwV6vypumgK0idiWf+uuxxTlxPw9yoUxq7
 xsZZtMtBJfxxbZP0f9DbpgfHxOFyhwTd8AliBACBP0Bm
X-Google-Smtp-Source: APXvYqwslPE8DCguo6zrlZgHFc4w3+R6TEQaE6B0sa8LhS+AyOsn+wpIurngNrSl995UPemHXJJR05CNhCXCKqIMGVg=
X-Received: by 2002:a5d:8497:: with SMTP id t23mr50392900iom.298.1563961685824; 
 Wed, 24 Jul 2019 02:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <d5bbb2e9a39da905d656524bdf9e1b6705fd526a.1563853440.git.sbobroff@linux.ibm.com>
 <201907241746.mKIx06OX%lkp@intel.com>
In-Reply-To: <201907241746.mKIx06OX%lkp@intel.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 24 Jul 2019 19:47:55 +1000
Message-ID: <CAOSf1CGW9+6TRkbQRqNPcGY9o-=s3YVRGO4GWcKx22ZkXvwCpg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] powerpc/eeh: Convert log messages to eeh_edev_*
 macros
To: kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kbuild-all@01.org,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 7:24 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Sam,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.3-rc1 next-20190724]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Sam-Bobroff/powerpc-64-Adjust-order-in-pcibios_init/20190724-134001
> config: powerpc-defconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/powerpc/kernel/eeh_driver.c: In function 'eeh_add_virt_device':
> >> arch/powerpc/kernel/eeh_driver.c:459:17: error: unused variable 'pdn' [-Werror=unused-variable]
>      struct pci_dn *pdn = eeh_dev_to_pdn(edev);

FYI this happens when CONFIG_IOV isn't set. Adding a __maybe_unused
annotation fixes it.

>                     ^~~
>    cc1: all warnings being treated as errors
>
> vim +/pdn +459 arch/powerpc/kernel/eeh_driver.c
>
> 77bd7415 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas 2005-11-03  454
> bf773df9 arch/powerpc/kernel/eeh_driver.c            Sam Bobroff   2018-09-12  455  static void *eeh_add_virt_device(struct eeh_dev *edev)
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  456  {
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  457      struct pci_driver *driver;
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  458      struct pci_dev *dev = eeh_dev_to_pci_dev(edev);
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04 @459      struct pci_dn *pdn = eeh_dev_to_pdn(edev);
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  460
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  461      if (!(edev->physfn)) {
> 6dad7bbd arch/powerpc/kernel/eeh_driver.c            Sam Bobroff   2019-07-23  462              eeh_edev_warn(edev, "Not for VF\n");
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  463              return NULL;
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  464      }
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  465
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  466      driver = eeh_pcid_get(dev);
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  467      if (driver) {
> 46d4be41 arch/powerpc/kernel/eeh_driver.c            Sam Bobroff   2018-05-25  468              if (driver->err_handler) {
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  469                      eeh_pcid_put(dev);
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  470                      return NULL;
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  471              }
> 46d4be41 arch/powerpc/kernel/eeh_driver.c            Sam Bobroff   2018-05-25  472              eeh_pcid_put(dev);
> 46d4be41 arch/powerpc/kernel/eeh_driver.c            Sam Bobroff   2018-05-25  473      }
> 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016-03-04  474
>
> :::::: The code at line 459 was first introduced by commit
> :::::: 67086e32b56481531ab1292b284e074b1a8d764c powerpc/eeh: powerpc/eeh: Support error recovery for VF PE
>
> :::::: TO: Wei Yang <weiyang@linux.vnet.ibm.com>
> :::::: CC: Michael Ellerman <mpe@ellerman.id.au>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
