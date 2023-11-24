Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A397F6A59
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 02:58:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ijRXAftj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ijRXAftj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbynp3dDNz3dRs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 12:58:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ijRXAftj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ijRXAftj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sbymx4gS0z3cLY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 12:58:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700791086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SiHqBG5n3pSa5R94END0/8W0OBeOhpXL3D/OFSohC2M=;
	b=ijRXAftj8POW/y+UTgPvOP2WCvvQLP/poHkJ8GaGZv4HXe1owr3938fZAoc8et9G8KW4dV
	3jIiq5LzyIZYHq3c8wfqMI5wbJlJbgfj75SL0EiiBW6Jhc2gWDyN4QfL6JCerO+jv2fZBu
	vOf6I+bari0+hY1HBzlxmL4HHfYUdhs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700791086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SiHqBG5n3pSa5R94END0/8W0OBeOhpXL3D/OFSohC2M=;
	b=ijRXAftj8POW/y+UTgPvOP2WCvvQLP/poHkJ8GaGZv4HXe1owr3938fZAoc8et9G8KW4dV
	3jIiq5LzyIZYHq3c8wfqMI5wbJlJbgfj75SL0EiiBW6Jhc2gWDyN4QfL6JCerO+jv2fZBu
	vOf6I+bari0+hY1HBzlxmL4HHfYUdhs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-_W8SERA3N_Gf5HeqVWenIA-1; Thu,
 23 Nov 2023 20:58:02 -0500
X-MC-Unique: _W8SERA3N_Gf5HeqVWenIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A870E28EC110;
	Fri, 24 Nov 2023 01:58:01 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03C1B2166B2A;
	Fri, 24 Nov 2023 01:58:00 +0000 (UTC)
Date: Fri, 24 Nov 2023 09:57:57 +0800
From: "bhe@redhat.com" <bhe@redhat.com>
To: Yujie Liu <yujie.liu@intel.com>
Subject: Re: [PATCH 2/7] kexec_file: print out debugging message if required
Message-ID: <ZWADJcg5smQHZzMT@MiWiFi-R3L-srv>
References: <20231114153253.241262-3-bhe@redhat.com>
 <202311160431.BXPc7NO9-lkp@intel.com>
 <ZVcvBft/T3cbRBWr@MiWiFi-R3L-srv>
 <39ccb4fda795a76996cf6d1c3b25909692358211.camel@intel.com>
 <ZVdyLdAzgNBXfjiW@MiWiFi-R3L-srv>
 <ZV9YYEK4L160ECQ+@MiWiFi-R3L-srv>
 <ZV/55OkN7bV02LY8@yujie-X299>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZV/55OkN7bV02LY8@yujie-X299>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, lkp <lkp@intel.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/24/23 at 09:18am, Yujie Liu wrote:
> On Thu, Nov 23, 2023 at 09:49:20PM +0800, bhe@redhat.com wrote:
> > On 11/17/23 at 10:01pm, Baoquan He wrote:
> > > On 11/17/23 at 09:37am, Liu, Yujie wrote:
> > > > Hi Baoquan,
> > > > 
> > > > On Fri, 2023-11-17 at 17:14 +0800, Baoquan He wrote:
> > > > > Hi,
> > > > > 
> > > > > On 11/16/23 at 05:04am, kernel test robot wrote:
> > > > > > Hi Baoquan,
> > > > > > 
> > > > > > kernel test robot noticed the following build errors:
> > > > > > 
> > > > > > [auto build test ERROR on arm64/for-next/core]
> > > > > > [also build test ERROR on tip/x86/core powerpc/next powerpc/fixes linus/master v6.7-rc1 next-20231115]
> > > > > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > > > > And when submitting patch, we suggest to use '--base' as documented in
> > > > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > > > > 
> > > > > > url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_file-add-kexec_file-flag-to-control-debug-printing/20231114-234003
> > > > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> > > > > > patch link:    https://lore.kernel.org/r/20231114153253.241262-3-bhe%40redhat.com
> > > > > > patch subject: [PATCH 2/7] kexec_file: print out debugging message if required
> > > > > > config: hexagon-comet_defconfig (https://download.01.org/0day-ci/archive/20231116/202311160431.BXPc7NO9-lkp@intel.com/config)
> > > > > > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160431.BXPc7NO9-lkp@intel.com/reproduce)
> > > > > > 
> > > > > 
> > > > > Thanks for reporting.
> > > > > 
> > > > > I met below failure when following the steps of provided reproducer.
> > > > > Could anyone help check what's wrong with that?
> > > > 
> > > > Sorry this seems to be a bug in the reproducer. Could you please change
> > > > the compiler parameter to "COMPILER=clang-16" and rerun the command? We
> > > > will fix the issue ASAP.
> > 
> > Any update for the reproducer? I would like to post v2 with the fix. I
> > doubt it's the same issue as another report on this patch, while not
> > quite sure.
> 
> Setting "COMPILER=clang-16" is exactly the correct fix and should
> reproduce the issue in this report. We've fixed the steps of reproducer
> but this will only take effect in future reports.

Thanks, Yujie. I thought you were asking me to use "COMPILER=clang-16"
to get information to debug. I have done the testing according to
Nathan's suggestion and can confirm it's the same issue as the one on
arm64. Will post v2.

> 
> > > 
> > > Here you are. Thanks for your quick response.
> > > ------------------------------
> > > [root@~ linux]# COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-16 ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
> > > Compiler will be installed in /root/0day
> > > lftpget -c https://cdn.kernel.org/pub/tools/llvm/files/./llvm-16.0.6-x86_64.tar.xz
> > > /root/linux                                                                             
> > > tar Jxf /root/0day/./llvm-16.0.6-x86_64.tar.xz -C /root/0day
> > > PATH=/root/0day/llvm-16.0.6-x86_64/bin:/root/.local/bin:/root/bin:/usr/lib64/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
> > > make --keep-going LLVM=1 CROSS_COMPILE=hexagon-linux- LLVM_IAS=1 --jobs=128 KCFLAGS=-Warray-bounds -Wundef -fstrict-flex-arrays=3 -funsigned-char -Wenum-conversion W=1 O=build_dir ARCH=hexagon olddefconfig
> > > make[1]: Entering directory '/root/linux/build_dir'
> > >   GEN     Makefile
> > >   HOSTCC  scripts/basic/fixdep
> > >   HOSTCC  scripts/kconfig/conf.o
> > >   HOSTCC  scripts/kconfig/confdata.o
> > >   HOSTCC  scripts/kconfig/expr.o
> > >   HOSTCC  scripts/kconfig/lexer.lex.o
> > >   HOSTCC  scripts/kconfig/menu.o
> > >   HOSTCC  scripts/kconfig/parser.tab.o
> > >   HOSTCC  scripts/kconfig/preprocess.o
> > >   HOSTCC  scripts/kconfig/symbol.o
> > >   HOSTCC  scripts/kconfig/util.o
> > >   HOSTLD  scripts/kconfig/conf
> > > #
> > > # configuration written to .config
> > > #
> > > make[1]: Leaving directory '/root/linux/build_dir'
> > > 
> > > > 
> > > > > [root@~ linux]# COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
> > > > > Compiler will be installed in /root/0day
> > > > > lftpget -c https://cdn.kernel.org/pub/tools/llvm/files/
> > > > > get1: /pub/tools/llvm/files/: files/: Is a directory
> > > > > Failed to download https://cdn.kernel.org/pub/tools/llvm/files/
> > > > > clang crosstool install failed
> > > > > Install clang compiler failed
> > > > > setup_crosstool failed
> > > > 
> > > > 
> > > 
> > 
> 

