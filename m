Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62117EEA7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 01:56:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOUKBo4I;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOUKBo4I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWdlM3GmTz3dHG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 11:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOUKBo4I;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOUKBo4I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWdkS3S4Cz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 11:55:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700182553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4LapoxfhvOL55w/2dX60cKVAQiuf12D1o1P52tBY/F0=;
	b=SOUKBo4IMF5rheHjr41HC+vwhGKRZXmDeVrBvJQUbSmVOG3dwI3le21OUoWRmIsM+ylaIH
	0Exb3bhkwYciJVghT+x04l09HrMEE5pPXsDusTsmPZfUqGw/o8SXyH1jO8cunNxEtfIg6j
	6wxwl8XikCMz8U+0OJsfV1GZHnGy5I0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700182553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4LapoxfhvOL55w/2dX60cKVAQiuf12D1o1P52tBY/F0=;
	b=SOUKBo4IMF5rheHjr41HC+vwhGKRZXmDeVrBvJQUbSmVOG3dwI3le21OUoWRmIsM+ylaIH
	0Exb3bhkwYciJVghT+x04l09HrMEE5pPXsDusTsmPZfUqGw/o8SXyH1jO8cunNxEtfIg6j
	6wxwl8XikCMz8U+0OJsfV1GZHnGy5I0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-hlErw1ZmNAuXtPqs3bx_HQ-1; Thu,
 16 Nov 2023 19:55:49 -0500
X-MC-Unique: hlErw1ZmNAuXtPqs3bx_HQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B851238149B2;
	Fri, 17 Nov 2023 00:55:48 +0000 (UTC)
Received: from localhost (unknown [10.72.112.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF2591C060AE;
	Fri, 17 Nov 2023 00:55:47 +0000 (UTC)
Date: Fri, 17 Nov 2023 08:55:44 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/7] kexec_file, arm64: print out debugging message if
 required
Message-ID: <ZVa6EDP8EI2jWhQL@MiWiFi-R3L-srv>
References: <20231114153253.241262-5-bhe@redhat.com>
 <202311160022.QM6xJYSy-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311160022.QM6xJYSy-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/16/23 at 12:58am, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on arm64/for-next/core]
> [also build test WARNING on tip/x86/core powerpc/next powerpc/fixes linus/master v6.7-rc1 next-20231115]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_file-add-kexec_file-flag-to-control-debug-printing/20231114-234003
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20231114153253.241262-5-bhe%40redhat.com
> patch subject: [PATCH 4/7] kexec_file, arm64: print out debugging message if required
> config: arm64-randconfig-001-20231115 (https://download.01.org/0day-ci/archive/20231116/202311160022.QM6xJYSy-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160022.QM6xJYSy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311160022.QM6xJYSy-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    arch/arm64/kernel/machine_kexec.c: In function '_kexec_image_info':
> >> arch/arm64/kernel/machine_kexec.c:35:23: warning: unused variable 'i' [-Wunused-variable]
>       35 |         unsigned long i;
>          |                       ^

Yes, this is an obvious one missed, will fix and update in new post,
thanks.

