Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC2ECE11
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 11:40:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474wZ84ngXzF6p4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 21:40:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474wWn4xvlzF6Lh
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2019 21:38:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="g49lDOe5"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 474wWm5qgPz9sP3;
 Sat,  2 Nov 2019 21:38:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572691109;
 bh=5RClX4y8vcmtSUeclqeO3VGG9Etde6mUrdDpsNuHw9o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=g49lDOe5eK9pq0FWc6ETtg4jYEqnpnYYFlAujf5WZsem8sr1CRdfBaKKUxyLdLUPH
 VTKjLTS1tx0qXLDjCmqDG8ZW9nT/i8a85/q+bv3TfmTFMDUrZ/tO2UyDotPjED7p9+
 zlXwSmPJqC6/GkYQRYDceLh/Gext+jy49otL3kt1kYzZrg52s2Yo5rQRso3Ry/5Ukj
 JveP7F5T5UDTGMCVzlVip0D4tHRGHDPJeMpUqkzWJGKhnB3kBKLWOcUNlHB2FVsjec
 SRqwqaiW6iPgTHe453Q8BAD5oMt3Yddqyav2Vt0g5zecOJLPcGmYnKezQW853NPg22
 M8Lypo2xP9LJA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jason Yan <yanaijie@huawei.com>, Scott Wood <oss@buserror.net>
Subject: Re: Pull request: scottwood/linux.git next
In-Reply-To: <935d65ed-526b-2cdc-31e0-d7856e750a04@huawei.com>
References: <20191022232155.GA26174@home.buserror.net>
 <935d65ed-526b-2cdc-31e0-d7856e750a04@huawei.com>
Date: Sat, 02 Nov 2019 21:38:24 +1100
Message-ID: <878soy36n3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason Yan <yanaijie@huawei.com> writes:
> Hi Michael, Can you pull this to linux-next so that we can test it on 
> linux-next for some time?

Yes I plan to, I've just been busy doing other things.

As Scott said it's in linux-next anyway.

cheers

> On 2019/10/23 7:21, Scott Wood wrote:
>> This contains KASLR support for book3e 32-bit.
>> 
>> The following changes since commit 612ee81b9461475b5a5612c2e8d71559dd3c7920:
>> 
>>    powerpc/papr_scm: Fix an off-by-one check in papr_scm_meta_{get, set} (2019-10-10 20:15:53 +1100)
>> 
>> are available in the Git repository at:
>> 
>>    git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git next
>> 
>> for you to fetch changes up to 9df1ef3f1376ec5d3a1b51a4546c94279bcd88ca:
>> 
>>    powerpc/fsl_booke/32: Document KASLR implementation (2019-10-21 16:09:16 -0500)
>> 
>> ----------------------------------------------------------------
>> Jason Yan (12):
>>        powerpc: unify definition of M_IF_NEEDED
>>        powerpc: move memstart_addr and kernstart_addr to init-common.c
>>        powerpc: introduce kernstart_virt_addr to store the kernel base
>>        powerpc/fsl_booke/32: introduce create_kaslr_tlb_entry() helper
>>        powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper
>>        powerpc/fsl_booke/32: implement KASLR infrastructure
>>        powerpc/fsl_booke/32: randomize the kernel image offset
>>        powerpc/fsl_booke/kaslr: clear the original kernel if randomized
>>        powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter
>>        powerpc/fsl_booke/kaslr: dump out kernel offset information on panic
>>        powerpc/fsl_booke/kaslr: export offset in VMCOREINFO ELF notes
>>        powerpc/fsl_booke/32: Document KASLR implementation
>> 
>>   Documentation/powerpc/kaslr-booke32.rst       |  42 +++
>>   arch/powerpc/Kconfig                          |  11 +
>>   arch/powerpc/include/asm/nohash/mmu-book3e.h  |  11 +-
>>   arch/powerpc/include/asm/page.h               |   7 +
>>   arch/powerpc/kernel/early_32.c                |   5 +-
>>   arch/powerpc/kernel/exceptions-64e.S          |  12 +-
>>   arch/powerpc/kernel/fsl_booke_entry_mapping.S |  25 +-
>>   arch/powerpc/kernel/head_fsl_booke.S          |  61 +++-
>>   arch/powerpc/kernel/machine_kexec.c           |   1 +
>>   arch/powerpc/kernel/misc_64.S                 |   7 +-
>>   arch/powerpc/kernel/setup-common.c            |  20 ++
>>   arch/powerpc/mm/init-common.c                 |   7 +
>>   arch/powerpc/mm/init_32.c                     |   5 -
>>   arch/powerpc/mm/init_64.c                     |   5 -
>>   arch/powerpc/mm/mmu_decl.h                    |  11 +
>>   arch/powerpc/mm/nohash/Makefile               |   1 +
>>   arch/powerpc/mm/nohash/fsl_booke.c            |   8 +-
>>   arch/powerpc/mm/nohash/kaslr_booke.c          | 401 ++++++++++++++++++++++++++
>>   18 files changed, 587 insertions(+), 53 deletions(-)
>>   create mode 100644 Documentation/powerpc/kaslr-booke32.rst
>>   create mode 100644 arch/powerpc/mm/nohash/kaslr_booke.c
>> 
>> 
