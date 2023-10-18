Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF797CE88C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 22:09:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KAMWwI1q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9hlJ72TDz3cP5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 07:09:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KAMWwI1q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9hkL6rtdz300q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 07:08:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697659723; x=1729195723;
  h=date:from:to:cc:subject:message-id;
  bh=puIumT9JOurPcyiE4yOEbMFKWDCJhBN5ZKyxpK9WT2I=;
  b=KAMWwI1qTyVgEFoP8ThSziUF9YvRFbV04MPTrn2+aIjAPA4cGXDfYHaX
   gvwlvMTSabOI33iqJTYL6zEnYqKPtWXCPV1JFBfBDgXbsqVMeoF2JZaRt
   u9Vt4EbdSAkLnnXaZcINXDLO3exTV3LjouBfdmDM9sgxuRp60X6wWChfy
   Op7apAfqh1q9mejD4hW3ei0i741YTiNO5LZcM3/mnEoPfpZnbWz1sLDbr
   oGNW7jsAolOtC1chMeZA2oA3QHmfvR1ioct5V0Yn6tyro2fhI8Q04H21+
   DcUhr1DQ1+jHYIK3u0eazrUbk87AqjyYVyvdCgysEL9l9QSFLtjFkAkl/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="472335033"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="472335033"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 13:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="706589755"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="706589755"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Oct 2023 13:08:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtCq2-0000yE-2y;
	Wed, 18 Oct 2023 20:08:18 +0000
Date: Thu, 19 Oct 2023 04:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 2dac75696c6da3c848daa118a729827541c89d33
Message-ID: <202310190456.pryB092r-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, amd-gfx@lists.freedesktop.org, Linux Memory Management List <linux-mm@kvack.org>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 2dac75696c6da3c848daa118a729827541c89d33  Add linux-next specific files for 20231018

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202309200103.grXWDKTx-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310121802.CDAGVdF2-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310170132.IrOpHglA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310171905.azfrKoID-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310181800.Bh66q0T1-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310181854.pKtHd7fD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310182303.V3tTgNQZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310190002.uTcOpMyF-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310190116.5JjceoZJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310190201.4wyYJ6j5-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/kvm/powerpc.c:1061:9: error: implicit declaration of function 'kvmppc_get_vsx_vr'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
arch/powerpc/kvm/powerpc.c:1063:9: error: implicit declaration of function 'kvmppc_set_vsx_vr'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
arch/powerpc/kvm/powerpc.c:1729:52: error: implicit declaration of function 'kvmppc_get_vscr'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
arch/powerpc/kvm/powerpc.c:1732:52: error: implicit declaration of function 'kvmppc_get_vrsave'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
arch/powerpc/kvm/powerpc.c:1780:25: error: implicit declaration of function 'kvmppc_set_vscr'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
arch/powerpc/kvm/powerpc.c:1787:25: error: implicit declaration of function 'kvmppc_set_vrsave'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
arch/s390/include/asm/ctlreg.h:129:9: warning: array subscript 0 is outside array bounds of 'struct ctlreg[0]' [-Warray-bounds=]
arch/s390/include/asm/ctlreg.h:80:9: warning: array subscript 0 is outside array bounds of 'struct ctlreg[0]' [-Warray-bounds=]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:286:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c:72:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
fs/bcachefs/journal_seq_blacklist.c:110:18: warning: array subscript 'i' is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
fs/bcachefs/journal_seq_blacklist.c:148:26: warning: array subscript <unknown> is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
fs/bcachefs/journal_seq_blacklist.c:148:26: warning: array subscript idx is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
fs/bcachefs/journal_seq_blacklist.c:159:26: warning: array subscript <unknown> is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
fs/bcachefs/journal_seq_blacklist.c:159:26: warning: array subscript idx is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
fs/bcachefs/journal_seq_blacklist.c:176:27: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
fs/bcachefs/journal_seq_blacklist.c:176:64: warning: array subscript '(unsigned int) _33 + 4294967295' is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
fs/bcachefs/journal_seq_blacklist.c:189:27: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
fs/bcachefs/snapshot.c:118:66: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
fs/bcachefs/snapshot.c:134:70: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
fs/bcachefs/snapshot.c:168:16: warning: array subscript idx is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
fs/bcachefs/snapshot.c:181:16: warning: array subscript idx is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
fs/bcachefs/snapshot.h:36:21: warning: array subscript <unknown> is outside array bounds of 'struct snapshot_t[0]' [-Warray-bounds=]
include/asm-generic/rwonce.h:44:26: warning: array subscript 0 is outside array bounds of '__u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=]
qcom-rng.c:(.text+0x378): undefined reference to `devm_hwrng_register'
sound/soc/rockchip/rockchip_i2s_tdm.c:1315:34: warning: 'rockchip_i2s_tdm_match' defined but not used [-Wunused-const-variable=]

Unverified Error/Warning (likely false positive, please contact us if interested):

Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml:
Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:
fs/tracefs/event_inode.c:782:11-21: ERROR: ei is NULL but dereferenced.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- alpha-defconfig
|   `-- include-asm-generic-rwonce.h:warning:array-subscript-is-outside-array-bounds-of-__u8-aka-unsigned-char
|-- arc-allmodconfig
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- arc-allyesconfig
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- arm64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- arm64-randconfig-004-20231018
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- csky-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- csky-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- i386-allmodconfig
|   `-- fs-bcachefs-journal_seq_blacklist.h:warning:array-subscript-is-outside-the-bounds-of-an-interior-zero-length-array-struct-journal_seq_blacklist_entry
|-- i386-allyesconfig
|   `-- fs-bcachefs-journal_seq_blacklist.h:warning:array-subscript-is-outside-the-bounds-of-an-interior-zero-length-array-struct-journal_seq_blacklist_entry
|-- i386-buildonly-randconfig-003-20231018
|   `-- sound-soc-rockchip-rockchip_i2s_tdm.c:warning:rockchip_i2s_tdm_match-defined-but-not-used
|-- i386-randconfig-052-20231018
|   `-- fs-tracefs-event_inode.c:ERROR:ei-is-NULL-but-dereferenced.
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- loongarch-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- loongarch-randconfig-001-20231018
|   |-- Documentation-devicetree-bindings-mfd-qcom-pm8xxx.yaml:
|   |-- Documentation-devicetree-bindings-mfd-qcom-tcsr.yaml:
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- m68k-allmodconfig
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- m68k-allyesconfig
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- microblaze-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- microblaze-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- mips-allmodconfig
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- mips-allyesconfig
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- nios2-allmodconfig
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- nios2-allyesconfig
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- nios2-defconfig
|   `-- include-asm-generic-rwonce.h:warning:array-subscript-is-outside-array-bounds-of-__u8-aka-unsigned-char
|-- nios2-randconfig-001-20231018
|   `-- qcom-rng.c:(.text):undefined-reference-to-devm_hwrng_register
|-- openrisc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- openrisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- parisc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- powerpc-randconfig-003-20231018
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- powerpc64-randconfig-r011-20211214
|   |-- arch-powerpc-kvm-powerpc.c:error:implicit-declaration-of-function-kvmppc_get_vrsave
|   |-- arch-powerpc-kvm-powerpc.c:error:implicit-declaration-of-function-kvmppc_get_vscr
|   |-- arch-powerpc-kvm-powerpc.c:error:implicit-declaration-of-function-kvmppc_get_vsx_vr
|   |-- arch-powerpc-kvm-powerpc.c:error:implicit-declaration-of-function-kvmppc_set_vrsave
|   |-- arch-powerpc-kvm-powerpc.c:error:implicit-declaration-of-function-kvmppc_set_vscr
|   `-- arch-powerpc-kvm-powerpc.c:error:implicit-declaration-of-function-kvmppc_set_vsx_vr
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- s390-allmodconfig
|   |-- arch-s390-include-asm-ctlreg.h:warning:array-subscript-is-outside-array-bounds-of-struct-ctlreg
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- s390-allyesconfig
|   |-- arch-s390-include-asm-ctlreg.h:warning:array-subscript-is-outside-array-bounds-of-struct-ctlreg
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   `-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|-- s390-buildonly-randconfig-r004-20220731
|   `-- arch-s390-include-asm-ctlreg.h:warning:array-subscript-is-outside-array-bounds-of-struct-ctlreg
|-- s390-defconfig
|   `-- arch-s390-include-asm-ctlreg.h:warning:array-subscript-is-outside-array-bounds-of-struct-ctlreg
|-- sparc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- sparc64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|-- sparc64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-journal_seq_blacklist_table_entry
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-idx-is-outside-array-bounds-of-struct-snapshot_t
|   |-- fs-bcachefs-snapshot.c:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
|   `-- fs-bcachefs-snapshot.h:warning:array-subscript-unknown-is-outside-array-bounds-of-struct-snapshot_t
`-- x86_64-allyesconfig
    |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
    |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
    |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-(unsigned-int)-_33-is-outside-the-bounds-of-an-interior-zero-length-array-struct-journal_seq_blacklist_entry
    |-- fs-bcachefs-journal_seq_blacklist.c:warning:array-subscript-i-is-outside-the-bounds-of-an-interior-zero-length-array-struct-journal_seq_blacklist_entry
    `-- fs-bcachefs-journal_seq_blacklist.h:warning:array-subscript-is-outside-the-bounds-of-an-interior-zero-length-array-struct-journal_seq_blacklist_entry

elapsed time: 865m

configs tested: 100
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231018   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231018   gcc  
i386         buildonly-randconfig-002-20231018   gcc  
i386         buildonly-randconfig-003-20231018   gcc  
i386         buildonly-randconfig-004-20231018   gcc  
i386         buildonly-randconfig-006-20231018   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-016-20231018   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231018   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-006-20231018   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231018   gcc  
x86_64                randconfig-002-20231018   gcc  
x86_64                randconfig-003-20231018   gcc  
x86_64                randconfig-016-20231018   gcc  
x86_64                randconfig-076-20231018   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
