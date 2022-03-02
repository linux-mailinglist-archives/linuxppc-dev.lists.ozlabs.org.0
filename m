Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F38D4CA536
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:50:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7v8k19HTz3fDW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 23:49:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7v535xHMz3brF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 23:46:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7v543M2xz4xvM;
 Wed,  2 Mar 2022 23:46:48 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Kajol Jain <kjain@linux.ibm.com>
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
Subject: Re: [PATCH 00/20] Add perf sampling tests as part of selftest
Message-Id: <164622490619.2052779.14251446512792457399.b4-ty@ellerman.id.au>
Date: Wed, 02 Mar 2022 23:41:46 +1100
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rnsastry@linux.ibm.com, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jan 2022 12:49:52 +0530, Kajol Jain wrote:
> Patch series adds support for perf sampling tests that
> enables capturing sampling data in perf mmap buffer and
> further support for reading and processing the samples.
> It also addds basic utility functions to process the
> mmap buffer inorder to read total count of samples as
> well as the contents of sample.
> 
> [...]

Patches 1-15 and 17-20 applied to powerpc/next.

[01/20] selftest/powerpc/pmu: Include mmap_buffer field as part of struct event
        https://git.kernel.org/powerpc/c/f961e20f15ed35e9ca154a099897d600b78b0311
[02/20] selftest/powerpc/pmu: Add support for perf sampling tests
        https://git.kernel.org/powerpc/c/c315669e2fbd71bb9387066f60f0d91b0ceb28f3
[03/20] selftest/powerpc/pmu: Add macros to parse event codes
        https://git.kernel.org/powerpc/c/6523dce86222451e5ca2df8a46597a217084bfdf
[04/20] selftest/powerpc/pmu: Add utility functions to post process the mmap buffer
        https://git.kernel.org/powerpc/c/5f6c3061af7ca3b0f9f8a20ec7a445671f7e6b5a
[05/20] selftest/powerpc/pmu: Add event_init_sampling function
        https://git.kernel.org/powerpc/c/54d4ba7f22d1ed5bfbc915771cf2e3e147cf03b2
[06/20] selftest/powerpc/pmu: Add macros to extract mmcr fields
        https://git.kernel.org/powerpc/c/79c4e6aba8dfc9206acc68884498080f451121f7
[07/20] selftest/powerpc/pmu: Add macro to extract mmcr0/mmcr1 fields
        https://git.kernel.org/powerpc/c/2b49e641063e7569493371ef433b9c4ce8c8dd8b
[08/20] selftest/powerpc/pmu: Add macro to extract mmcr3 and mmcra fields
        https://git.kernel.org/powerpc/c/13307f9584ea9408d9959302074dc4e8308b6cab
[09/20] selftest/powerpc/pmu/: Add interface test for mmcr0 exception bits
        https://git.kernel.org/powerpc/c/eb7aa044df18c6f7a88bc17fc4c9f4524652a290
[10/20] selftest/powerpc/pmu/: Add interface test for mmcr0_cc56run field
        https://git.kernel.org/powerpc/c/a7c0ab2e61484c0844eae2f208a06cc940338d83
[11/20] selftest/powerpc/pmu/: Add interface test for mmcr0_pmccext bit
        https://git.kernel.org/powerpc/c/b24142b9d2401468bcd8df157013306d5b4f6626
[12/20] selftest/powerpc/pmu/: Add interface test for mmcr0_pmcjce field
        https://git.kernel.org/powerpc/c/9ac7c6d5e4b570f416d849b263a6f67a617b4fa5
[13/20] selftest/powerpc/pmu/: Add interface test for mmcr0_fc56 field using pmc1
        https://git.kernel.org/powerpc/c/d5172f2585cd0fc9788aa9b25d3dce6483321792
[14/20] selftest/powerpc/pmu/: Add interface test for mmcr0_pmc56 using pmc5
        https://git.kernel.org/powerpc/c/6e11374b08723b2c43ae83bd5d48000d695f13a0
[15/20] selftest/powerpc/pmu/: Add interface test for mmcr1_comb field
        https://git.kernel.org/powerpc/c/2becea3b6acf308642d6c0e9bd41caf7820753f5
[17/20] selftest/powerpc/pmu/: Add interface test for mmcr2_l2l3 field
        https://git.kernel.org/powerpc/c/ac575b2606bf99a0d01a054196e24e1ad82c194d
[18/20] selftest/powerpc/pmu/: Add interface test for mmcr2_fcs_fch fields
        https://git.kernel.org/powerpc/c/9ee241f1b1447c7e8ca90902ab1888aa9e7a3c00
[19/20] selftest/powerpc/pmu/: Add interface test for mmcr3_src fields
        https://git.kernel.org/powerpc/c/02f02feb6b50c67171fd56bc3fd0fd96118c5c12
[20/20] selftest/powerpc/pmu: Add interface test for mmcra register fields
        https://git.kernel.org/powerpc/c/29cf373c5766e6bd1b97056d2d678a41777669aa

cheers
