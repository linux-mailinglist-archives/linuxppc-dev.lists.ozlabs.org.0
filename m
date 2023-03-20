Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E126C1D48
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 18:07:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgLkj4k7Yz3cMc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 04:07:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SE/hkZak;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SE/hkZak;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgLjk6J1dz3cFt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 04:06:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679331979; x=1710867979;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nMpguQBfxSul1dNNY2Z2RHUaVPhMvz/6HPsmceIZJxk=;
  b=SE/hkZakmOtvSn1p2velmCUsNLErHOVD1hdjHuUBlBJ6JxAwzDTN0F45
   Ihv3RsJgzWEdElfrAmmbNLtRDePdAb903ww6klM6dQIaRs+hrsuV+eYLP
   VJ6FpDeE7uLSV+K07xzJzQvvlUTpcFDyved+8WYC25+YuRbC7vWKWpywE
   lC50UTePtXGNVg4owx5FQ2uWMqh1gHmyU2CKkyfza1EdAnK0bonLQcbwU
   PchLq8GdHQTYA1GeiilUaxe8CZNhA4kd7jrVvhS8NWCtzA5cZSsUB6SQz
   0FskaJ0yKSPJdPZPRLT9T27Jr9B2KEidC/U8AsII9apAf3l0kuFaRBvrR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318370788"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="318370788"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 10:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="711426322"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="711426322"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Mar 2023 10:05:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peIxB-000BAv-1B;
	Mon, 20 Mar 2023 17:05:49 +0000
Date: Tue, 21 Mar 2023 01:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a
Message-ID: <6418924f.3FGLqXsUadcfPipX%lkp@intel.com>
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
Cc: Linux Memory Management List <linux-mm@kvack.org>, linux-wireless@vger.kernel.org, amd-gfx@lists.freedesktop.org, rcu@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, io-uring@vger.kernel.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a  Add linux-next specific files for 20230320

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202303081807.lBLWKmpX-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303151409.por0SBf7-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303161404.OrmfCy09-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303161521.jbGbaFjJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303171300.g6uEM0X9-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303171506.Af2gNUDA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303190142.TjYYpbba-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303201615.Qfu18nWV-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303202113.O9pAgJGQ-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:211:6: warning: no previous prototype for 'is_synaptics_cascaded_panamera' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:258:10: warning: no previous prototype for 'link_timing_bandwidth_kbps' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:2184: warning: expecting prototype for Check if there is a native DP or passive DP(). Prototype was for dp_is_sink_present() instead
drivers/gpu/drm/imx/lcdc/imx-lcdc.c:411:11: error: call to undeclared function 'devm_drm_of_get_bridge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpu/drm/imx/lcdc/imx-lcdc.c:411:9: error: incompatible integer to pointer conversion assigning to 'struct drm_bridge *' from 'int' [-Wint-conversion]
drivers/gpu/drm/imx/lcdc/imx-lcdc.c:449:61: error: use of undeclared identifier 'DRM_BRIDGE_ATTACH_NO_CONNECTOR'
drivers/gpu/drm/imx/lcdc/imx-lcdc.c:449:8: error: call to undeclared function 'drm_bridge_attach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/net/wireless/legacy/ray_cs.c:628:17: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
include/linux/compiler_types.h:340:27: error: expression in static assertion is not an integer
include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct module'
include/linux/mmzone.h:1749:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
include/linux/rculist.h:392:21: error: invalid use of undefined type 'struct module'
include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct module'
kernel/bpf/../module/internal.h:205:2: error: assigning to 'struct module *' from incompatible type 'void'
kernel/bpf/../module/internal.h:205:2: error: incomplete definition of type 'struct module'
kernel/bpf/../module/internal.h:205:2: error: offsetof of incomplete type 'typeof (*mod)' (aka 'struct module')
kernel/bpf/../module/internal.h:205:2: error: operand of type 'void' where arithmetic or pointer type is required
kernel/bpf/../module/internal.h:212:2: error: assigning to 'struct module *' from incompatible type 'void'
kernel/bpf/../module/internal.h:212:2: error: incomplete definition of type 'struct module'
kernel/bpf/../module/internal.h:212:2: error: offsetof of incomplete type 'typeof (*mod)' (aka 'struct module')
kernel/bpf/../module/internal.h:212:2: error: operand of type 'void' where arithmetic or pointer type is required
loongarch64-linux-ld: clk-mt8173-apmixedsys.c:(.text+0x104): undefined reference to `mtk_clk_register_pllfhs'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces)
drivers/soc/fsl/qe/tsa.c:189:26: sparse: sparse: dereference of noderef expression
drivers/soc/fsl/qe/tsa.c:663:22: sparse: sparse: incorrect type in assignment (different address spaces)
drivers/soc/fsl/qe/tsa.c:673:21: sparse: sparse: incorrect type in assignment (different address spaces)
include/linux/gpio/consumer.h: linux/err.h is included more than once.
include/linux/gpio/driver.h: asm/bug.h is included more than once.
io_uring/io_uring.c:432 io_prep_async_work() error: we previously assumed 'req->file' could be null (see line 425)
io_uring/kbuf.c:221 __io_remove_buffers() warn: variable dereferenced before check 'bl->buf_ring' (see line 219)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_mst_types.c:warning:no-previous-prototype-for-is_synaptics_cascaded_panamera
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:no-previous-prototype-for-link_timing_bandwidth_kbps
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:expecting-prototype-for-Check-if-there-is-a-native-DP-or-passive-DP().-Prototype-was-for-dp_is_sink_present()-inste
|   `-- drivers-net-wireless-legacy-ray_cs.c:warning:strncpy-specified-bound-equals-destination-size
|-- alpha-buildonly-randconfig-r001-20230319
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_mst_types.c:warning:no-previous-prototype-for-is_synaptics_cascaded_panamera
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:no-previous-prototype-for-link_timing_bandwidth_kbps
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:expecting-prototype-for-Check-if-there-is-a-native-DP-or-passive-DP().-Prototype-was-for-dp_is_sink_present()-inste
|-- alpha-buildonly-randconfig-r004-20230319
|   |-- include-linux-compiler_types.h:error:expression-in-static-assertion-is-not-an-integer
|   |-- include-linux-container_of.h:error:invalid-use-of-undefined-type-struct-module
|   |-- include-linux-rculist.h:error:invalid-use-of-undefined-type-struct-module
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-module
|-- alpha-buildonly-randconfig-r005-20230320
|   |-- include-linux-compiler_types.h:error:expression-in-static-assertion-is-not-an-integer
|   |-- include-linux-container_of.h:error:invalid-use-of-undefined-type-struct-module
|   |-- include-linux-rculist.h:error:invalid-use-of-undefined-type-struct-module
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-module
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_mst_types.c:warning:no-previous-prototype-for-is_synaptics_cascaded_panamera
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:no-previous-prototype-for-link_timing_bandwidth_kbps
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:expecting-prototype-for-Check-if-there-is-a-native-DP-or-passive-DP().-Prototype-was-for-dp_is_sink_present()-inste
|-- arc-randconfig-r043-20230319
|   |-- include-linux-compiler_types.h:error:expression-in-static-assertion-is-not-an-integer
|   |-- include-linux-container_of.h:error:invalid-use-of-undefined-type-struct-module
|   |-- include-linux-rculist.h:error:invalid-use-of-undefined-type-struct-module
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-module
|-- arc-randconfig-r043-20230320
|   |-- include-linux-compiler_types.h:error:expression-in-static-assertion-is-not-an-integer
|   |-- include-linux-container_of.h:error:invalid-use-of-undefined-type-struct-module
|   |-- include-linux-rculist.h:error:invalid-use-of-undefined-type-struct-module
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-module
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_mst_types.c:warning:no-previous-prototype-for-is_synaptics_cascaded_panamera
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:no-previous-prototype-for-link_timing_bandwidth_kbps
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:expecting-prototype-for-Check-if-there-is-a-native-DP-or-passive-DP().-Prototype-was-for-dp_is_sink_present()-inste
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_mst_types.c:warning:no-previous-prototype-for-is_synaptics_cascaded_panamera
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:no-previous-prototype-for-link_timing_bandwidth_kbps
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:expecting-prototype-for-Check-if-there-is-a-native-DP-or-passive-DP().-Prototype-was-for-dp_is_sink_present()-inste
|-- arm-randconfig-r046-20230319
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_mst_types.c:warning:no-previous-prototype-for-is_synaptics_cascaded_panamera
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:no-previous-prototype-for-link_timing_bandwidth_kbps
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:expecting-prototype-for-Check-if-there-is-a-native-DP-or-passive-DP().-Prototype-was-for-dp_is_sink_present()-inste
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_mst_types.c:warning:no-previous-prototype-for-is_synaptics_cascaded_panamera
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:no-previous-prototype-for-link_timing_bandwidth_kbps
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:expecting-prototype-for-Check-if-there-is-a-native-DP-or-passive-DP().-Prototype-was-for-dp_is_sink_present()-inste
|-- csky-randconfig-r026-20230319
clang_recent_errors
|-- arm-randconfig-r046-20230320
|   |-- kernel-bpf-..-module-internal.h:error:assigning-to-struct-module-from-incompatible-type-void
|   |-- kernel-bpf-..-module-internal.h:error:incomplete-definition-of-type-struct-module
|   |-- kernel-bpf-..-module-internal.h:error:offsetof-of-incomplete-type-typeof-(-mod)-(aka-struct-module-)
|   `-- kernel-bpf-..-module-internal.h:error:operand-of-type-void-where-arithmetic-or-pointer-type-is-required
|-- hexagon-buildonly-randconfig-r006-20230319
|   |-- kernel-bpf-..-module-internal.h:error:assigning-to-struct-module-from-incompatible-type-void
|   |-- kernel-bpf-..-module-internal.h:error:incomplete-definition-of-type-struct-module
|   |-- kernel-bpf-..-module-internal.h:error:offsetof-of-incomplete-type-typeof-(-mod)-(aka-struct-module-)
|   `-- kernel-bpf-..-module-internal.h:error:operand-of-type-void-where-arithmetic-or-pointer-type-is-required
|-- hexagon-randconfig-r022-20230319
|   |-- kernel-bpf-..-module-internal.h:error:assigning-to-struct-module-from-incompatible-type-void
|   |-- kernel-bpf-..-module-internal.h:error:incomplete-definition-of-type-struct-module
|   |-- kernel-bpf-..-module-internal.h:error:offsetof-of-incomplete-type-typeof-(-mod)-(aka-struct-module-)
|   `-- kernel-bpf-..-module-internal.h:error:operand-of-type-void-where-arithmetic-or-pointer-type-is-required
|-- hexagon-randconfig-r041-20230320
|   |-- kernel-bpf-..-module-internal.h:error:assigning-to-struct-module-from-incompatible-type-void
|   |-- kernel-bpf-..-module-internal.h:error:incomplete-definition-of-type-struct-module
|   |-- kernel-bpf-..-module-internal.h:error:offsetof-of-incomplete-type-typeof-(-mod)-(aka-struct-module-)
|   `-- kernel-bpf-..-module-internal.h:error:operand-of-type-void-where-arithmetic-or-pointer-type-is-required
|-- hexagon-randconfig-r045-20230320
|   |-- kernel-bpf-..-module-internal.h:error:assigning-to-struct-module-from-incompatible-type-void
|   |-- kernel-bpf-..-module-internal.h:error:incomplete-definition-of-type-struct-module
|   |-- kernel-bpf-..-module-internal.h:error:offsetof-of-incomplete-type-typeof-(-mod)-(aka-struct-module-)
|   `-- kernel-bpf-..-module-internal.h:error:operand-of-type-void-where-arithmetic-or-pointer-type-is-required
|-- mips-buildonly-randconfig-r002-20230319
|   `-- kernel-bpf-..-module-internal.h:error:assigning-to-struct-module-from-incompatible-type-void
|-- mips-randconfig-r001-20230319
|   |-- drivers-gpu-drm-imx-lcdc-imx-lcdc.c:error:call-to-undeclared-function-devm_drm_of_get_bridge-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpu-drm-imx-lcdc-imx-lcdc.c:error:call-to-undeclared-function-drm_bridge_attach-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpu-drm-imx-lcdc-imx-lcdc.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-drm_bridge-from-int
|   `-- drivers-gpu-drm-imx-lcdc-imx-lcdc.c:error:use-of-undeclared-identifier-DRM_BRIDGE_ATTACH_NO_CONNECTOR
`-- s390-randconfig-r044-20230319
    |-- drivers-gpu-drm-imx-lcdc-imx-lcdc.c:error:call-to-undeclared-function-devm_drm_of_get_bridge-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- drivers-gpu-drm-imx-lcdc-imx-lcdc.c:error:call-to-undeclared-function-drm_bridge_attach-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- drivers-gpu-drm-imx-lcdc-imx-lcdc.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-drm_bridge-from-int
    `-- drivers-gpu-drm-imx-lcdc-imx-lcdc.c:error:use-of-undeclared-identifier-DRM_BRIDGE_ATTACH_NO_CONNECTOR

elapsed time: 730m

configs tested: 122
configs skipped: 8

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230319   gcc  
alpha        buildonly-randconfig-r002-20230319   gcc  
alpha        buildonly-randconfig-r004-20230319   gcc  
alpha        buildonly-randconfig-r005-20230320   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r024-20230320   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230319   gcc  
arc                  randconfig-r016-20230319   gcc  
arc                  randconfig-r043-20230319   gcc  
arc                  randconfig-r043-20230320   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230319   gcc  
arm                  randconfig-r046-20230320   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230319   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230319   gcc  
csky                 randconfig-r026-20230319   gcc  
hexagon      buildonly-randconfig-r006-20230319   clang
hexagon              randconfig-r041-20230319   clang
hexagon              randconfig-r041-20230320   clang
hexagon              randconfig-r045-20230319   clang
hexagon              randconfig-r045-20230320   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230320   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230320   clang
i386                 randconfig-a002-20230320   clang
i386                 randconfig-a003-20230320   clang
i386                 randconfig-a004-20230320   clang
i386                 randconfig-a005-20230320   clang
i386                 randconfig-a006-20230320   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r011-20230320   gcc  
ia64                 randconfig-r024-20230319   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230320   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230320   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze   buildonly-randconfig-r003-20230319   gcc  
microblaze           randconfig-r032-20230319   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230320   gcc  
mips         buildonly-randconfig-r004-20230320   gcc  
mips                 randconfig-r001-20230319   clang
mips                 randconfig-r036-20230319   clang
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230320   gcc  
nios2                randconfig-r014-20230319   gcc  
nios2                randconfig-r025-20230319   gcc  
nios2                randconfig-r031-20230319   gcc  
nios2                randconfig-r034-20230319   gcc  
openrisc             randconfig-r016-20230320   gcc  
openrisc             randconfig-r035-20230319   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230319   gcc  
parisc               randconfig-r025-20230320   gcc  
parisc               randconfig-r033-20230319   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230319   gcc  
powerpc              randconfig-r013-20230320   gcc  
powerpc              randconfig-r015-20230320   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230319   gcc  
riscv                randconfig-r042-20230319   clang
riscv                randconfig-r042-20230320   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230319   clang
s390                 randconfig-r044-20230320   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r013-20230319   gcc  
sh                   randconfig-r014-20230320   gcc  
sh                   randconfig-r023-20230319   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r015-20230319   gcc  
sparc64              randconfig-r026-20230320   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230320   clang
x86_64               randconfig-a002-20230320   clang
x86_64               randconfig-a003-20230320   clang
x86_64               randconfig-a004-20230320   clang
x86_64               randconfig-a005-20230320   clang
x86_64               randconfig-a006-20230320   clang
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64               randconfig-r023-20230320   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230320   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
