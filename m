Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A519E68FCFD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 03:16:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PC0pd3xQrz3f89
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 13:16:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pgn69CTV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pgn69CTV;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PC0lg2zDvz302m
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 13:13:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675908815; x=1707444815;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NzZXRZocCxTlg4xICmd7Qp6ksuikdd06JlplJdPe+vA=;
  b=Pgn69CTVEfQXjhiHkwWZGkAujqymbAT7UaUgW0icIFiqT583JYQtIKbY
   te+x49kZ1EQyVzWD7ciZ1mROmiWqMnJc9uaVB9TgQVdHf3QON+hdmHsHz
   ygNebUzdbeg+z2aqxb8BAmbgDHkCkQWO7X3VP7GoImyT/45D2/faHgzFo
   VKfgEiXCI/kACf+rOyedbzk0JMspPdg698L5ch6VbsAtnkZ+sRDeYxBal
   DmfJPtCwTESYdGr2xt871MPSY7d1PHPxBk1DMB+Eh2TpOaT6w0ahUNnew
   TnoHoIS49KsE7QElk7xtUv39tQjs/50VlsQG0U64+eASROQhW7QlFcxGE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416208847"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="416208847"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 18:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="699880774"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="699880774"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Feb 2023 18:13:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPwR6-0004kq-0i;
	Thu, 09 Feb 2023 02:13:20 +0000
Date: Thu, 09 Feb 2023 10:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 2ea31e2e62bbc4d11c411eeb36f1b02841dbcab1
Message-ID: <63e45695.Jh05K1/WBwkR7mGU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 2ea31e2e62bbc4d11c411eeb36f1b02841dbcab1  powerpc/64s/interrupt: Fix interrupt exit race with security mitigation switch

elapsed time: 724m

configs tested: 2
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
