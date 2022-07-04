Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEF35653B3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3fz60dCz3dQr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:36:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3dv3vwlz3bYS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:35:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3dv0FRlz4xYN;
	Mon,  4 Jul 2022 21:35:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 00/35] Add group constraints and event code test as part of selftest
Message-Id: <165693438450.9954.5279784636109768833.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:04 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 19:10:38 +0530, Athira Rajeev wrote:
> Patch series extends the perf interface selftests
> to cover scenarios for event code checking,
> group constraints, and also thresholding/branch related
> interface tests in sampling area.
> 
> In this series, patches 1 to 14 adds additional tests under
> "powerpc/sampling_tests". These adds support for handling
> sample type PERF_SAMPLE_BRANCH_STACK along with interrupt regs.
> It adds utility functions and test for thresh_cmp and branch
> filters programmed in control register. Some of the tests needs
> to be skipped for "Generic Compat PMU" environment. Hence utility
> functions are added in "include/utils.c" and "sampling_tests/misc.h"
> to detect platform based on "auxv" entries.
> 
> [...]

Applied to powerpc/next.

[01/35] selftest/powerpc/pmu: Add mask/shift bits for extracting threshold compare field
        https://git.kernel.org/powerpc/c/42e0576eec75479fa7709c41e5c3b9ec556b8f4d
[02/35] testing/selftests/powerpc: Add support to fetch "platform" and "base platform" from auxv to detect platform.
        https://git.kernel.org/powerpc/c/a069b5f980e3b65b64b6322b71d5819f90dbb42b
[03/35] selftest/powerpc/pmu: Add interface test for mmcra_thresh_cmp fields
        https://git.kernel.org/powerpc/c/50d9c30a685c14e41e44d48a08a08703c680d861
[04/35] selftest/powerpc/pmu: Add support for branch sampling in get_intr_regs function
        https://git.kernel.org/powerpc/c/61d89900315aa25f6da0c1bc800ce295d74d69f1
[05/35] selftest/powerpc/pmu: Add interface test for mmcra_ifm field of indirect call type
        https://git.kernel.org/powerpc/c/c55dabc6d577a864cd618107ea6aaa6cad8c987b
[06/35] selftest/powerpc/pmu: Add interface test for mmcra_ifm field for any branch type
        https://git.kernel.org/powerpc/c/faa64ddc1e398131e7eaadc8f03cb7bd3904eff2
[07/35] selftest/powerpc/pmu: Add interface test for mmcra_ifm field for conditional branch type
        https://git.kernel.org/powerpc/c/014fb4a3ae746276f4320f7010d03157485051cb
[08/35] selftest/powerpc/pmu: Add interface test for bhrb disable field
        https://git.kernel.org/powerpc/c/84cc4e66d90f6624f821df381073813dd502f657
[09/35] selftest/powerpc/pmu: Refactor the platform check and add macros to find array size/PVR
        https://git.kernel.org/powerpc/c/9cfd110a36649f9452120a648f15f32d1c82b99d
[10/35] selftest/powerpc/pmu: Add selftest to check branch stack enablement will not crash on any platforms
        https://git.kernel.org/powerpc/c/2ac05f8f2e4b9068e5bbc0836b35abafd70f02c1
[11/35] selftest/powerpc/pmu: Add selftest to check PERF_SAMPLE_REGS_INTR option will not crash on any platforms
        https://git.kernel.org/powerpc/c/11bbc524390572dfe1bd0375c7e7ab8f9ddf4b34
[12/35] selftest/powerpc/pmu: Add selftest for checking valid and invalid bhrb filter maps
        https://git.kernel.org/powerpc/c/f6380e05aa92b005ac6f38be92afbdd2a0706cff
[13/35] selftest/powerpc/pmu: Add selftest for mmcr1 pmcxsel/unit/cache fields
        https://git.kernel.org/powerpc/c/0321f2d0ae6959f79f5b8a21b31694b54dbaa35d
[14/35] selftest/powerpc/pmu: Add interface test for bhrb disable field for non-branch samples
        https://git.kernel.org/powerpc/c/78cd598af648131d2e9a32825c59b8d1e9ec9357
[15/35] selftest/powerpc/pmu: Add support for perf event code tests
        https://git.kernel.org/powerpc/c/0a110a4b69dacc30ce4f6c10c0396bd2fd097831
[16/35] selftest/powerpc/pmu: Add selftest for group constraint check for PMC5 and PMC6
        https://git.kernel.org/powerpc/c/9258c0aa755fac469869dd647a6c3d5299ff7725
[17/35] selftest/powerpc/pmu: Add selftest to check PMC5/6 is excluded from some constraint checks
        https://git.kernel.org/powerpc/c/4000c2e5d40a3ee340c3940949d658fc52a56603
[18/35] selftest/powerpc/pmu: Add selftest to check constraint for number of counters in use.
        https://git.kernel.org/powerpc/c/827765a449dbc41ad19ab3e31757c93cac47b728
[19/35] selftest/powerpc/pmu: Add selftest for group constraint check when using same PMC
        https://git.kernel.org/powerpc/c/38b6da45304e55de11b8b79a0f31a4d61818e63e
[20/35] selftest/powerpc/pmu: Add selftest for group constraint check for radix_scope_qual field
        https://git.kernel.org/powerpc/c/dc431be3b54901744e84f5f94f0f0a2b5d36bb7f
[21/35] selftest/powerpc/pmu: Add selftest for group constraint for MMCRA Sampling Mode field
        https://git.kernel.org/powerpc/c/beebeecb47d3b93198fe46922fd4ba2af2090cdd
[22/35] selftest/powerpc/pmu: Add selftest for group constraint check MMCRA sample bits
        https://git.kernel.org/powerpc/c/122b6b9e57006520addd9f3a44f6b7e3ce503044
[23/35] selftest/powerpc/pmu: Add selftest for checking invalid bits in event code
        https://git.kernel.org/powerpc/c/5196a27978dcc74251eab14cffa8fa96813e0365
[24/35] selftest/powerpc/pmu: Add selftest for reserved bit check for MMCRA thresh_ctl field
        https://git.kernel.org/powerpc/c/0c90263339da3e4cdcbf57cfa43d6d866c3ac95e
[25/35] selftest/powerpc/pmu: Add selftest for blacklist events check in power9
        https://git.kernel.org/powerpc/c/a77c69766c7d4a213e65a4ecdedda7c22f2deb01
[26/35] selftest/powerpc/pmu: Add selftest for event alternatives for power9
        https://git.kernel.org/powerpc/c/5958ad4392b0f437605ade8bab42447b0d97ad8c
[27/35] selftest/powerpc/pmu: Add selftest for event alternatives for power10
        https://git.kernel.org/powerpc/c/3f1a87425f8c2f9af745923865a4765e36a2ed3c
[28/35] selftest/powerpc/pmu: Add selftest for PERF_TYPE_HARDWARE events valid check
        https://git.kernel.org/powerpc/c/8efeedf5aac77b58f68e6eb9df62758ba1882bb3
[29/35] selftest/powerpc/pmu: Add selftest for group constraint check for MMCR0 l2l3_sel bits
        https://git.kernel.org/powerpc/c/20b3073f8727e20332379f145b6eecf580291b2c
[30/35] selftest/powerpc/pmu: Add selftest for group constraint check for MMCR1 cache bits
        https://git.kernel.org/powerpc/c/291c01ed207d83c8910e0fb21944e6ef84021956
[31/35] selftest/powerpc/pmu: Add selftest for group constraint check for MMCRA thresh_cmp field
        https://git.kernel.org/powerpc/c/8eaca8c4b4ed9a2058e4f232d56b5973191fec37
[32/35] selftest/powerpc/pmu: Add selftest for group constraint for unit and pmc field in p9
        https://git.kernel.org/powerpc/c/142c9bd1ff215f364a5d683a9dd0b7c413397185
[33/35] selftest/powerpc/pmu: Add selftest for group constraint check for MMCRA thresh_ctl field
        https://git.kernel.org/powerpc/c/c178606ab51076d464fe537cd7a6bcbc615939e5
[34/35] selftest/powerpc/pmu: Add selftest for group constraint check for MMCRA thresh_sel field
        https://git.kernel.org/powerpc/c/9ac92fecd1dbfcabd64925571b94151d7a814878
[35/35] selftest/powerpc/pmu: Add test for hardware cache events
        https://git.kernel.org/powerpc/c/ab8bca92aebcb59d81dc95ddebe241052f2bb411

cheers
