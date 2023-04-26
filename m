Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B186EF404
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:09:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yMv4wsDz3f4v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:09:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yMP2QwHz3cHX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:08:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yMK3pf9z4xKX;
	Wed, 26 Apr 2023 22:08:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 01/32] powerpc/configs/64s: Update defconfig for symbol movement
Message-Id: <168251050531.3973805.14695996823859947795.b4-ty@ellerman.id.au>
Date: Wed, 26 Apr 2023 22:01:45 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 Apr 2023 23:23:44 +1000, Michael Ellerman wrote:
> Update ppc64_defconfig to account for symbols moving around, no actual
> changes.
> 
> 

Applied to powerpc/next.

[01/32] powerpc/configs/64s: Update defconfig for symbol movement
        https://git.kernel.org/powerpc/c/cc876c7a245979e3e860da66a693fc5d94543010
[02/32] powerpc/configs/64s: Drop SPLPAR which is default y
        https://git.kernel.org/powerpc/c/91c4ef9539c439af454674b0a617f1b855056066
[03/32] powerpc/configs/64s: Drop IPV6 which is default y
        https://git.kernel.org/powerpc/c/1ce7fda142af48f5c603cc72061e4e8bd32edab6
[04/32] powerpc/configs/6s: Drop obsolete crypto ALGs
        https://git.kernel.org/powerpc/c/94d0b37feedc3701d5da4f69448d12352f437837
[05/32] powerpc/configs/64s: Enable PAPR_SCM
        https://git.kernel.org/powerpc/c/64fcdb2930290c84a65147410551857e60a7db2c
[06/32] powerpc/configs/64s: Add secure boot options to defconfig
        https://git.kernel.org/powerpc/c/d892ed0420e20a6423a165fdebb228590ece5f95
[07/32] powerpc/configs/64s: Select ARCH_WANT_DEFAULT_BPF_JIT
        https://git.kernel.org/powerpc/c/e0fe568ebbc0705fe2fe4ea62be752fad9d801d0
[08/32] powerpc/configs/64s: Enable PREEMPT_VOLUNTARY
        https://git.kernel.org/powerpc/c/3a4b71786e9828a0b85600013da7fbe8cb3d0138
[09/32] powerpc/configs/64s: Enable AUDIT
        https://git.kernel.org/powerpc/c/1b813ac21b5d2c142bcbe0dbd58a23dcc8594d59
[10/32] powerpc/configs/64s: Enable common accounting options
        https://git.kernel.org/powerpc/c/88e284b64b0b3193fc3c451d12e912f58375904c
[11/32] powerpc/configs/64s: Enable NO_HZ_FULL
        https://git.kernel.org/powerpc/c/ea87ec60e96e55ed034fbf1f91300b9bf12e412a
[12/32] powerpc/configs/64s: Enable common CGROUP & related options
        https://git.kernel.org/powerpc/c/6c95035e06e8c38ce8d9a74f53ac49ede86e584f
[13/32] powerpc/configs/64s: Enable CHECKPOINT_RESTORE
        https://git.kernel.org/powerpc/c/b92c4675f0b20ccf493449c02357f0ff1241f6db
[14/32] powerpc/configs/64s: Enable ZSWAP & ZRAM
        https://git.kernel.org/powerpc/c/90ae13b654ee58d5d0d0152d196d0419021273e6
[15/32] powerpc/configs/64s: Enable SLAB hardening options
        https://git.kernel.org/powerpc/c/40605274cf9b26f921df6d1875e3cf6fcc22dec0
[16/32] powerpc/configs/64s: Enable YAMA, LANDLOCK & BPF LSMs
        https://git.kernel.org/powerpc/c/2e46fbe0881b18e4e338035958e1f49263629ca1
[17/32] powerpc/configs/64s: Enable SELINUX
        https://git.kernel.org/powerpc/c/69c483660ef9735a71ca280f48584068c903c278
[18/32] powerpc/configs/64s: Enable KUNIT and most tests
        https://git.kernel.org/powerpc/c/5029aa2a47bd18c654a20a6b1a84b9e418189ad9
[19/32] powerpc/configs/64s: Enable EMULATED_STATS
        https://git.kernel.org/powerpc/c/7ccad8eee0d92f7566e4f9e12f2f26d74885f1a5
[20/32] powerpc/configs/64s: Enable DEBUG_VM & other options
        https://git.kernel.org/powerpc/c/3c18a2094ffe06626f09c923067ab284b294d5c6
[21/32] powerpc/configs/64s: Enable SCHEDSTATS
        https://git.kernel.org/powerpc/c/d3a85f29c30d9876440c03933b3793607f616ed6
[22/32] powerpc/configs/64s: Enable IO_STRICT_DEVMEM
        https://git.kernel.org/powerpc/c/6880db8fe1d042b164473fd865ee2ec6f5ee3df6
[23/32] powerpc/configs/64s: Use SHA512 for module signatures
        https://git.kernel.org/powerpc/c/649181aea2be6deaa1c9aef66e765a7ba0d077c5
[24/32] powerpc/configs/64s: Drop REISERFS
        https://git.kernel.org/powerpc/c/a4f64f73b6a368c067beae20e0fac6625e8768cb
[25/32] powerpc/configs/64s: Enable BLK_DEV_NVME
        https://git.kernel.org/powerpc/c/22f615cb87af5a26c0ac91d02020575edb5aeb89
[26/32] powerpc/configs/64s: Enable VLAN support
        https://git.kernel.org/powerpc/c/48b2e99def2d92dbf2f7cb4b7f42ee8d98c56768
[27/32] powerpc/configs/64s: Enable PSTORE
        https://git.kernel.org/powerpc/c/262a3589df8cd28c152c46c166be9e552da90ed3
[28/32] powerpc/configs/64s: Enable Device Mapper options
        https://git.kernel.org/powerpc/c/4f6cfb53646794a2dc14210fbfedd5c6db38ba2c
[29/32] powerpc/configs: Add IBMVETH=y and IBMVNIC=y to guest configs
        https://git.kernel.org/powerpc/c/9ee937539e9bd0bef2ad845b3dfa34fa997775c5
[30/32] powerpc/configs: Incorporate generic kvm_guest.config into guest configs
        https://git.kernel.org/powerpc/c/bac949621c40ec09357c6a8beaacac235ae39239
[31/32] powerpc/configs: Make pseries_le an alias for ppc64le_guest
        https://git.kernel.org/powerpc/c/596ddea8be17b5f4e2f72a0c9af313444d51d177
[32/32] powerpc/configs: Make pseries_defconfig an alias for ppc64le_guest
        https://git.kernel.org/powerpc/c/9ecda934f43b1502c420653b02d54d4ffd7ae4cb

cheers
