Return-Path: <linuxppc-dev+bounces-4345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F69F78A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2024 10:39:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDQVD449Nz30TJ;
	Thu, 19 Dec 2024 20:39:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734601140;
	cv=none; b=DeUzjHr8GX8ObjJaik1s6psMuvbp5Aqse9NsKXu5anCh8qUzffXjgT04yX576YQuJCS5Sq4FrmmDbn4WGxbKlFeYmAu31PeklYblLgMXxzI7Ckd9nC8AtZbF42FYt+e2HoeJVbgyExzweI/nt/1JeDt++XhkF8kjI6wyv1neuaU5O2sL+ixYTm9FR+c+oMQGy9oRV3GYAlCV2chq2nIyXhxoOTX7Vl3Q/RBogv+r2wUc37DmJmrgRZxVJlL4ond2CH8qY3nAmrkgcoCxQ6aatYrrv23Bcvy2F2cCL7oRTXSlkZyORXECX7j0ilopzN+AyHh5tsZqHbvRjpgiMFl6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734601140; c=relaxed/relaxed;
	bh=cN41kWTluMaXD6M5K4WvE2Qa3/QfNFex8eaDIEn3mt0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uwz3OwzrihDClKc4j7dY3Cbs4k1co7cGSiy+Dx/nkOcnlhIqBX7Tw52uNZS6+sbkyJlWv6RVJuh0q2EJQuEZ7VNZuWC4fNf4hXVDsSA5jps9cy/YsOpUza/i6AwUYLO7BhRPQAyYPEPDq4SuRU6TFzZSr75IQI+o7DDxbHTEaeEHqRwI5N2uqauHokkYi035AVRZHfEdUmG/MewUlGl21qNdmDoMla33IervN3nNGa7XO7itjxPPMKbB9FTFr4Oiy63NfAt3vJfH0iIkkpCmkRJRtqTP4CVTtVwL0uANxOwP4wSncqHSGsNN26oz8/mahPr4tg8CbAAMQc8IGtQVig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JOTMW93s; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JOTMW93s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDQV95yQmz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 20:38:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734601138; x=1766137138;
  h=date:from:to:cc:subject:message-id;
  bh=TtPTYosvQtU81Y4wsTVnZdxalet+bgwLeWQW1AfAYwI=;
  b=JOTMW93s/v+iv5zlUAWDHncaN06xnVbFViXbBouoWXFPklWaZcXGCvVV
   PHYs03GVkr3M2jGCGaR+QJXYK9OB+CzerZ07wdk9ba2dh1yYfdCWQOxxK
   GBFnNlY7C9ou2HVLVJc1RxhnC6iw/HNoKB34Q09ExNbHjIcGTKGJXqh80
   vX4923ni3OEWMoCqW8v/LHJLgGF893wFqlie9LSUNwSMvKzl3wQS+fgq2
   FQynQWvnKDxSUm+gdo5qwvFqs0WzQ5+bUb7YkWc41+oBoGArUhFXuL9r6
   FmjpsZMZ4gQ9M6Q4FuuV1eqoi3rKxTph40BdhTSJ/F5YY9eiPJWXN2CGX
   w==;
X-CSE-ConnectionGUID: 3Qnbh4TCSFWhU+X0gD1M0Q==
X-CSE-MsgGUID: buDg2CYQRZeTQ20lpmW3ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35003568"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="35003568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 01:38:52 -0800
X-CSE-ConnectionGUID: ufPG/YcDTcGpnS1opVWJcw==
X-CSE-MsgGUID: CbMg6GY9TwqfA8s84j1rEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98618575"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Dec 2024 01:38:52 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOCzZ-00009F-0S;
	Thu, 19 Dec 2024 09:38:49 +0000
Date: Thu, 19 Dec 2024 17:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 05aa156e156ef3168e7ab8a68721945196495c17
Message-ID: <202412191707.GoPMxSAB-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 05aa156e156ef3168e7ab8a68721945196495c17  powerpc/pseries/vas: Add close() callback in vas_vm_ops struct

elapsed time: 1443m

configs tested: 14
configs skipped: 148

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc               allmodconfig    gcc-14.2.0
powerpc                allnoconfig    gcc-14.2.0
powerpc               allyesconfig    clang-16
powerpc    randconfig-001-20241218    gcc-14.2.0
powerpc    randconfig-001-20241219    clang-18
powerpc    randconfig-002-20241218    clang-15
powerpc    randconfig-002-20241219    clang-16
powerpc    randconfig-003-20241218    clang-17
powerpc    randconfig-003-20241219    clang-20
powerpc64  randconfig-001-20241219    gcc-14.2.0
powerpc64  randconfig-002-20241218    clang-20
powerpc64  randconfig-002-20241219    clang-18
powerpc64  randconfig-003-20241218    gcc-14.2.0
powerpc64  randconfig-003-20241219    clang-16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

