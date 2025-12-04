Return-Path: <linuxppc-dev+bounces-14595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4139ACA2D80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 09:38:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMSb74bq4z2xHG;
	Thu, 04 Dec 2025 19:38:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764837523;
	cv=none; b=AIMflfCgahWWAEMYqxRdjgZ99LlO1oju7H+uqSJ1pcwDG+NZTvjikIjLLB5dhpUgv/9v85CnXzZ7volbXntGV+UzZdS0Kde3yqTtAGhSc2Ra0A58eWyoiSMWEEXq3OXsRU1dFWJ3nSJFbDyvBMW7nLu4WbohcUNPiloWjYhVH77ZH6YND4v0lM0UdCtnJ8sTdbN84SjtG8DcFD26DpB05C9I3xLFJXf5nQqB1nHPx7F7XEMTdRachq9nWrRBPAX8DEgPrFWbMOWj9Yr6Fl01C8Yn7p7hMLmxHZzFB8OtbNMrdNo1Z/mT09l53ZGZQVlohPaeNBGWAa0KwqqbhxewfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764837523; c=relaxed/relaxed;
	bh=0JlKi5Mxej8/+ZcumeV18Yc+KKJCP9ofTFD7HkIbArE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGB7RExYJVYQMtte8KvuwuAtfxc+QH1tLDKirfHV9YEyYHWZSLf8jdqXEPY5LmUx886q8jg9Dvia7Xf1k41Upw1FNgrGzX/rZkUxzcafx6l7lhK/7pttfdUgQMaj/KAwqR3eQwuTO97nfH0SiPapoGSP7pwUmARcV0PZJtG0zpj/lLOVu6fLL7ncuPL4zwApTrOr895eTw8tzE3xKrt5uLdRB8/nee5CAcjUIBVABqk6lT8TGg5cKWte6yyWz6zz/6d4Z+ksBGo3i2X+YPeqmibbi9q7YIlOEcCzRtBaOUiGBmH9QLjR9QA1o8MdsrV9NI/aparYJC0PmYQ9hpKwpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pfC21ifX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pfC21ifX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMSb60pX6z2x99
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 19:38:40 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-bb2447d11ceso413003a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 00:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764837517; x=1765442317; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0JlKi5Mxej8/+ZcumeV18Yc+KKJCP9ofTFD7HkIbArE=;
        b=pfC21ifXNd2BT2WUn6U93jDVUkCsNAqHpKYB4unQjnPSoNT1bZ4k41ouFoWqqe+7jo
         r9j6Zn+DLgZmKRapLTRDehKvavHZnAAa6EYHzT2in3QdI3FYkw7t73demkwx11YJG/9T
         5dNoIiEDrYpYf5Akwa/Ej2u9JRjmD9wOAiik7fMlFA1/uOpOfnQYJrfipkT0q1NHiwvK
         1yPBtz9m+1lwdwAnl4jbKWqGfd59sPcgJWpmpAhE0fatDUCYvmse23nmnCwP7UhxbMr0
         w92s6wVTIdp8IpX2T+MBkCC/R6H5AO1Usu0siV9YzXeVDRy/n7Dcs1loAr+CXFDAX7sH
         BEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764837517; x=1765442317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JlKi5Mxej8/+ZcumeV18Yc+KKJCP9ofTFD7HkIbArE=;
        b=e4yiRT5x+MWL2uxNealnkRX3cvVZ9Jrl5J5hromUA5fzpgfGxyc3rBydCQJMta/uDQ
         W1n7ra6SgCm0d/Brell38EohklNy/O9zws/ctQH8uPtnA2atcObqYxpxPj2Wxn3yxC5W
         SIviMg9WvZdbuLL9VZbiJvGbLiPmhsJcp5zSFuJS8/0OcYOLpeBUIQR5AQN3uw6wtbmz
         j8Zhbcjo9cpP2LvD0n2PstiMp0u1gIyRwYVO5Cso4X0g6fYNxI60FhQStdOPH1QV/752
         TVVcs8Kg/sbgDXmbBhk3RXx/jcB6pTKnh/xN8DsLaoDYu6winoPErfw228wuriFEXTmP
         2yIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwB56eu5EvVJ09+m72dnYPeRWwZrlSDo1ZjZhLpGJKGvwlbtEWz7Pv7vjD5VP0GSbkQJRhaxOlFr6cuTs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzmIyFtgioEHycjYAuKKjPBa/G0eeuMkyZhz3E6qSHs/7EInxT3
	eitXBG1HjW25wf2O6RQ10Bx9Vz2qoscq+w7r76FNoqz5CWBm8KzQYIxGPsAZqqvpCgY8wdWWA1y
	shCu70R7Lijytvk2LpbPQauauC8f/fHzefAPluzmGsQ==
X-Gm-Gg: ASbGnctY8Fsoq+8wRlHNFarrDk0dLsu7Ncub0nHLbn3GdXA7hwPh2BS59SMZEu2kE6B
	Y629HFUwC9AOgIaMv+7c4zJ/qbfuGDhiWYr0cWgNeLxQ5I+bpVke6JLMFOvMLIOhBONhGfb4K4r
	gXnyMKQLCewSIiSXYGjRYIk04Ccr9ewBP3N26OrUz/lB5x7yjECGXzLybbKCPgrhK/hZwiomPps
	vEtXHvb86iNVwHBLM88Xqs66n3wMSIvES88MwpiHv7Shsl8+xhy9amy7EvKJ/VwEKHhUlwZI6Na
	Hg3ej1qF9+1k96WBNke21gHzqDLp
X-Google-Smtp-Source: AGHT+IFZEAv1ezVPCker9GLaQZImi3N5jH6VXIGomJJWxOm3zS/LZIZssrCOD1GSIIbrPIuYSxinKKQkE6vNP8MxkPE=
X-Received: by 2002:a05:693c:3111:b0:2a4:3592:c5fb with SMTP id
 5a478bee46e88-2aba424d110mr1567722eec.12.1764837517021; Thu, 04 Dec 2025
 00:38:37 -0800 (PST)
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
Precedence: list
MIME-Version: 1.0
References: <20251203152414.082328008@linuxfoundation.org>
In-Reply-To: <20251203152414.082328008@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 4 Dec 2025 14:08:24 +0530
X-Gm-Features: AWmQ_bnogH29i6myZ_z674xGj0T3c_RPNdGl1-x_I57yUAyVvG1sIUwN6973xXs
Message-ID: <CA+G9fYvmhQs9qx-XpLiaOUZQKj=gR=-X5MoJ1auRmbC7cC+AXw@mail.gmail.com>
Subject: Re: [PATCH 5.15 000/392] 5.15.197-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Ian Rogers <irogers@google.com>, linux-mips@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 3 Dec 2025 at 21:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.197 release.
> There are 392 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 05 Dec 2025 15:23:16 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.197-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

The arm, mips and powerpc builds failed on the stable-rc 5.15.197-rc1.

Build regressions: arm, fuse-tegra30.c:250:10: error: 'const struct
tegra_fuse_soc' has no member named 'cells'
Build regressions: arm, fuse-tegra30.c:250:18: error: initialization
of 'const struct attribute_group *' from incompatible pointer type
'const struct nvmem_cell_info *' [-Werror=incompatible-pointer-types]
Build regressions: arm, fuse-tegra30.c:251:10: error: 'const struct
tegra_fuse_soc' has no member named 'num_cells'

Build regressions: mips, tlb-r4k.c:591:31: error: passing argument 1
of 'memblock_free' makes integer from pointer without a cast
[-Werror=int-conversion]

Build regressions: powerpc, mm/mempool.c:68:17: error: 'for' loop
initial declarations are only allowed in C99 or C11 mode

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

ARM build regressions are due to,

  soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups
  [ Upstream commit b9c01adedf38c69abb725a60a05305ef70dbce03 ]

MIPS build regressions are due to,

  MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
  commit 841ecc979b18d3227fad5e2d6a1e6f92688776b5 upstream.

Powerpc build regressions are due to,

  mm/mempool: replace kmap_atomic() with kmap_local_page()
  [ Upstream commit f2bcc99a5e901a13b754648d1dbab60f4adf9375 ]

### arm build error
drivers/soc/tegra/fuse/fuse-tegra30.c:250:10: error: 'const struct
tegra_fuse_soc' has no member named 'cells'
  250 |         .cells = tegra114_fuse_cells,
      |          ^~~~~
drivers/soc/tegra/fuse/fuse-tegra30.c:250:18: error: initialization of
'const struct attribute_group *' from incompatible pointer type 'const
struct nvmem_cell_info *' [-Werror=incompatible-pointer-types]
  250 |         .cells = tegra114_fuse_cells,
      |                  ^~~~~~~~~~~~~~~~~~~
drivers/soc/tegra/fuse/fuse-tegra30.c:250:18: note: (near
initialization for 'tegra114_fuse_soc.soc_attr_group')
drivers/soc/tegra/fuse/fuse-tegra30.c:251:10: error: 'const struct
tegra_fuse_soc' has no member named 'num_cells'
  251 |         .num_cells = ARRAY_SIZE(tegra114_fuse_cells),
      |          ^~~~~~~~~
cc1: some warnings being treated as errors

### mips Build error
arch/mips/mm/tlb-r4k.c: In function 'r4k_tlb_uniquify':
arch/mips/mm/tlb-r4k.c:591:31: error: passing argument 1 of
'memblock_free' makes integer from pointer without a cast
[-Werror=int-conversion]
  591 |                 memblock_free(tlb_vpns, tlb_vpn_size);
      |                               ^~~~~~~~
      |                               |
      |                               long unsigned int *
In file included from arch/mips/mm/tlb-r4k.c:15:
include/linux/memblock.h:107:31: note: expected 'phys_addr_t' {aka
'unsigned int'} but argument is of type 'long unsigned int *'
  107 | int memblock_free(phys_addr_t base, phys_addr_t size);
      |                   ~~~~~~~~~~~~^~~~
cc1: all warnings being treated as errors

### powerpc build error
mm/mempool.c: In function 'check_element':
mm/mempool.c:68:17: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
   68 |                 for (int i = 0; i < (1 << order); i++) {
      |                 ^~~
mm/mempool.c:68:17: note: use option '-std=c99', '-std=gnu99',
'-std=c11' or '-std=gnu11' to compile your code
mm/mempool.c: In function 'poison_element':
mm/mempool.c:101:17: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
  101 |                 for (int i = 0; i < (1 << order); i++) {
      |                 ^~~
make[2]: *** [scripts/Makefile.build:289: mm/mempool.o] Error 1

## Build
* kernel: 5.15.197-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: d6138097171ea16c4b0e51c3414d51c473f820cc
* git describe: v5.15.196-393-gd6138097171e
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.196-393-gd6138097171e

## Test Regressions (compared to v5.15.195-118-g59a59821e6b5)
* arm, build
  - clang-21-defconfig
  - clang-21-lkftconfig
  - clang-21-lkftconfig-no-kselftest-frag
  - clang-nightly-lkftconfig-kselftest
  - gcc-12-defconfig
  - gcc-12-lkftconfig
  - gcc-12-lkftconfig-debug
  - gcc-12-lkftconfig-kasan
  - gcc-12-lkftconfig-kunit
  - gcc-12-lkftconfig-libgpiod
  - gcc-12-lkftconfig-no-kselftest-frag
  - gcc-12-lkftconfig-perf
  - gcc-12-lkftconfig-rcutorture
  - gcc-8-defconfig

* mips, build
  - clang-21-allnoconfig
  - clang-21-defconfig
  - clang-21-tinyconfig
  - gcc-12-allnoconfig
  - gcc-12-ath79_defconfig
  - gcc-12-bcm47xx_defconfig
  - gcc-12-bcm63xx_defconfig
  - gcc-12-cavium_octeon_defconfig
  - gcc-12-defconfig
  - gcc-12-e55_defconfig
  - gcc-12-malta_defconfig
  - gcc-12-rt305x_defconfig
  - gcc-12-tinyconfig
  - gcc-8-allnoconfig
  - gcc-8-ath79_defconfig
  - gcc-8-bcm47xx_defconfig
  - gcc-8-bcm63xx_defconfig
  - gcc-8-cavium_octeon_defconfig
  - gcc-8-defconfig
  - gcc-8-malta_defconfig
  - gcc-8-rt305x_defconfig
  - gcc-8-tinyconfig

* powerpc, build
  - gcc-12-ppc6xx_defconfig
  - gcc-8-allnoconfig
  - gcc-8-ppc6xx_defconfig


## Metric Regressions (compared to v5.15.195-118-g59a59821e6b5)

## Test Fixes (compared to v5.15.195-118-g59a59821e6b5)

## Metric Fixes (compared to v5.15.195-118-g59a59821e6b5)

## Test result summary
total: 28764, pass: 21862, fail: 2212, skip: 4511, xfail: 179

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 101 total, 86 passed, 15 failed
* arm64: 28 total, 28 passed, 0 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 22 total, 0 passed, 22 failed
* parisc: 3 total, 3 passed, 0 failed
* powerpc: 22 total, 19 passed, 3 failed
* riscv: 8 total, 8 passed, 0 failed
* s390: 9 total, 9 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 24 total, 24 passed, 0 failed

## Test suites summary
* boot
* kselftest-arm64
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-exec
* kselftest-fpu
* kselftest-futex
* kselftest-intel_pstate
* kselftest-kcmp
* kselftest-livepatch
* kselftest-membarrier
* kselftest-mincore
* kselftest-mqueue
* kselftest-openat2
* kselftest-ptrace
* kselftest-rseq
* kselftest-rtc
* kselftest-sigaltstack
* kselftest-size
* kselftest-timers
* kselftest-tmpfs
* kselftest-tpm2
* kselftest-user_events
* kselftest-vDSO
* kselftest-x86
* kunit
* lava
* libgpiod
* libhugetlbfs
* log-parser-boot
* log-parser-build-clang
* log-parser-build-gcc
* log-parser-test
* ltp-capability
* ltp-commands
* ltp-containers
* ltp-controllers
* ltp-cpuhotplug
* ltp-crypto
* ltp-cve
* ltp-dio
* ltp-fcntl-locktests
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-hugetlb
* ltp-math
* ltp-mm
* ltp-nptl
* ltp-pty
* ltp-sched
* ltp-smoke
* ltp-syscalls
* ltp-tracing
* perf
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org

