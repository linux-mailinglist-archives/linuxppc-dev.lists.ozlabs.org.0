Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 123A21F2F3A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 02:49:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gs2h0KD0zDqS7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 10:49:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Fq2WqHVe; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49grzt4N8qzDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 10:46:59 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id t21so12253359edr.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 17:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6zCH4n2iYndxCImQUVO1t9gw8KAnucClc8TKaXcz6VE=;
 b=Fq2WqHVeE81Nk6/Y0DGUX0PV2/hDVPJDGUYPIo3pxtCcQjIa6R//iPZadETarfnAzT
 tlwhSjrEN/2Mjan9gz24mXSQu9dOYhzwWdqc2Q0xT715EekdH3eg0fxIvFgM3eRLWgLN
 78TZPoqHOfMK62A9ZJhEzlwmtqtbesyOCnOYd4H/O4Ti5pd09CcSkCIUY1/sj0tPY8Xc
 3Wc13HH5AEC14rFecdON9Rt3tBXKBzr9b6or5LhepX6BXw5CLcEfmLZAwLOtuGpiRW//
 YK+q6h65xUPqiwCvAKne4a3em0MZjfum74LdoxdMkfCZkPYVK/UwQyfbfpME0PiWBIdQ
 h2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6zCH4n2iYndxCImQUVO1t9gw8KAnucClc8TKaXcz6VE=;
 b=LsuPlZOn4k9qgaNDGLmI3ttXbS1cVVuR3Owx8wWBQX5wmvjSOzu9vlRkeSTWdTzzUP
 +3u1y/UoirJIajK/Aw8L1kCzPr5xHSI/0s9jKJf0ciHi7tNvkL8BCRHGejMjXn5d6WSY
 Z5wStSsAYqGFz5nc7TD7+pAYLOH2VsGRXQ9l2zN010wM7U5q7zJzS51vQNzimwZCmmnA
 xIJT9EJoYZKY/QCsAz6NF4pVwgzg2ybR+i/dCC3V+UzipwPGbmzRcFzIg1MGFUnDd1aJ
 93N6YLb0zDsffd+FeBjBuzrK+s+4nZFGcXEKi4izJBVW/Mi69hhYdvon6qIjf68OlIRx
 ZQEw==
X-Gm-Message-State: AOAM531Dquzti3QG39NP6g1SP2su8Mar7X7C4Ryiz/SAHYxw37Z7mLwf
 hnbBX1zkD2gCkGR4wd+iy9NATKNEk0uUhunvkfAXgw==
X-Google-Smtp-Source: ABdhPJyPiL73dzr0k16R7WSQX3Z3pfrFMXEsfHYxl183PZK4kpvT14ODaxWMSzzuq7exBiIPN3x17ifOOa1H+rWsmBY=
X-Received: by 2002:a50:eb0c:: with SMTP id y12mr23805262edp.165.1591663613143; 
 Mon, 08 Jun 2020 17:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200607131339.476036-6-vaibhav@linux.ibm.com>
 <202006090059.o4CE5D9b%lkp@intel.com>
In-Reply-To: <202006090059.o4CE5D9b%lkp@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 8 Jun 2020 17:46:42 -0700
Message-ID: <CAPcyv4iQo_xgRGPx_j+RPzgWGZaigGRbc_kRzKEFePfVHenx5g@mail.gmail.com>
Subject: Re: [PATCH v11 5/6] ndctl/papr_scm, uapi: Add support for PAPR nvdimm
 specific methods
To: kernel test robot <lkp@intel.com>
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
Cc: Santosh Sivaraj <santosh@fossix.org>, kbuild-all@lists.01.org,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Oliver O'Halloran <oohall@gmail.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 8, 2020 at 5:16 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Vaibhav,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on powerpc/next]
> [also build test WARNING on linus/master v5.7 next-20200605]
> [cannot apply to linux-nvdimm/libnvdimm-for-next scottwood/next]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Vaibhav-Jain/powerpc-papr_scm-Add-support-for-reporting-nvdimm-health/20200607-211653
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-randconfig-r016-20200607 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project e429cffd4f228f70c1d9df0e5d77c08590dd9766)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> In file included from <built-in>:1:
> >> ./usr/include/asm/papr_pdsm.h:69:20: warning: field 'hdr' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> struct nd_cmd_pkg hdr;  /* Package header containing sub-cmd */

Hi Vaibhav,

This looks like it's going to need another round to get this fixed. I
don't think 'struct nd_pdsm_cmd_pkg' should embed a definition of
'struct nd_cmd_pkg'. An instance of 'struct nd_cmd_pkg' carries a
payload that is the 'pdsm' specifics. As the code has it now it's
defined as a superset of 'struct nd_cmd_pkg' and the compiler warning
is pointing out a real 'struct' organization problem.

Given the soak time needed in -next after the code is finalized this
there's no time to do another round of updates and still make the v5.8
merge window.
