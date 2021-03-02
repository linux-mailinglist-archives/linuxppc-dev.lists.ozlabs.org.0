Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E02632A3F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 16:26:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqgvl1qvWz3d2p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 02:26:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=pLLCBLu/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=pLLCBLu/; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DqgvJ2Gq6z2yRh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 02:26:03 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9687820B83EA;
 Tue,  2 Mar 2021 07:26:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9687820B83EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1614698761;
 bh=lwnEHkkImr8dT+pu5zA94ImzVDh1eaKp+2wplr8dTxw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pLLCBLu/Gt65UbzyLnL9BV31JdFvnxcEvpWZedW6aek9Fr7BAvJMq8pE7+I3D21HR
 IhAQWA5ZLk63w0dE3FSSr4HbxcROs4K0Ok7obQWUOQTWh9PrLQWbwmnRiQ5oDBMNjX
 vvxYK8ZzE4nI3spfi8YNiR8jeYbt6avdkMKdo2vQ=
Subject: Re: [PATCH v19 00/13] Carry forward IMA measurement log on kexec on
 ARM64
To: Rob Herring <robh@kernel.org>
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
 <CAL_JsqKiOVo2rDhstAA-jUkMJiajHM=uwfj3JQd64h_eEfSjTw@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <7828ec90-a768-f96f-192f-d00dec2344af@linux.microsoft.com>
Date: Tue, 2 Mar 2021 07:25:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKiOVo2rDhstAA-jUkMJiajHM=uwfj3JQd64h_eEfSjTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, tao.li@vivo.com,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 vincenzo.frascino@arm.com, Frank Rowand <frowand.list@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 "AKASHI, Takahiro" <takahiro.akashi@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, devicetree@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/2/21 7:06 AM, Rob Herring wrote:
> On Sun, Feb 21, 2021 at 11:49 AM Lakshmi Ramasubramanian
> <nramas@linux.microsoft.com> wrote:
>>
>> On kexec file load Integrity Measurement Architecture (IMA) subsystem
>> may verify the IMA signature of the kernel and initramfs, and measure
>> it.  The command line parameters passed to the kernel in the kexec call
>> may also be measured by IMA.  A remote attestation service can verify
>> a TPM quote based on the TPM event log, the IMA measurement list, and
>> the TPM PCR data.  This can be achieved only if the IMA measurement log
>> is carried over from the current kernel to the next kernel across
>> the kexec call.
>>
>> powerpc already supports carrying forward the IMA measurement log on
>> kexec.  This patch set adds support for carrying forward the IMA
>> measurement log on kexec on ARM64.
>>
>> This patch set moves the platform independent code defined for powerpc
>> such that it can be reused for other platforms as well.  A chosen node
>> "linux,ima-kexec-buffer" is added to the DTB for ARM64 to hold
>> the address and the size of the memory reserved to carry
>> the IMA measurement log.
>>
>> This patch set has been tested for ARM64 platform using QEMU.
>> I would like help from the community for testing this change on powerpc.
>> Thanks.
>>
>> This patch set is based on
>> commit f31e3386a4e9 ("ima: Free IMA measurement buffer after kexec syscall")
>> in https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
>> "ima-kexec-fixes" branch.

[...]

>>
>> Lakshmi Ramasubramanian (10):
>>    kexec: Move ELF fields to struct kimage
>>    arm64: Use ELF fields defined in 'struct kimage'
>>    powerpc: Use ELF fields defined in 'struct kimage'
>>    x86: Use ELF fields defined in 'struct kimage'
>>    powerpc: Move ima buffer fields to struct kimage
>>    powerpc: Enable passing IMA log to next kernel on kexec
>>    powerpc: Move arch independent ima kexec functions to
>>      drivers/of/kexec.c
>>    kexec: Use fdt_appendprop_addrrange() to add ima buffer to FDT
>>    powerpc: Delete unused function delete_fdt_mem_rsv()
>>    arm64: Enable passing IMA log to next kernel on kexec
>>
>> Rob Herring (3):
>>    of: Add a common kexec FDT setup function
>>    arm64: Use common of_kexec_alloc_and_setup_fdt()
>>    powerpc: Use common of_kexec_alloc_and_setup_fdt()
>>
>>   arch/arm64/Kconfig                     |   1 +
>>   arch/arm64/include/asm/kexec.h         |   4 -
>>   arch/arm64/kernel/machine_kexec_file.c | 194 +----------
>>   arch/powerpc/Kconfig                   |   2 +-
>>   arch/powerpc/include/asm/ima.h         |  30 --
>>   arch/powerpc/include/asm/kexec.h       |  14 +-
>>   arch/powerpc/kexec/Makefile            |   7 -
>>   arch/powerpc/kexec/elf_64.c            |  30 +-
>>   arch/powerpc/kexec/file_load.c         | 183 +---------
>>   arch/powerpc/kexec/file_load_64.c      |  21 +-
>>   arch/powerpc/kexec/ima.c               | 219 ------------
>>   arch/x86/include/asm/kexec.h           |   5 -
>>   arch/x86/kernel/crash.c                |  14 +-
>>   arch/x86/kernel/kexec-bzimage64.c      |   2 +-
>>   arch/x86/kernel/machine_kexec_64.c     |   4 +-
>>   drivers/of/Makefile                    |   6 +
>>   drivers/of/kexec.c                     | 458 +++++++++++++++++++++++++
>>   include/linux/kexec.h                  |   8 +
>>   include/linux/of.h                     |   7 +
>>   security/integrity/ima/ima.h           |   4 -
>>   security/integrity/ima/ima_kexec.c     |   9 +-
>>   21 files changed, 539 insertions(+), 683 deletions(-)
>>   delete mode 100644 arch/powerpc/include/asm/ima.h
>>   delete mode 100644 arch/powerpc/kexec/ima.c
>>   create mode 100644 drivers/of/kexec.c
> 
> I fixed up the Fixes tags and applied for 5.13.
> 

Thanks a lot Rob.

  -lakshmi


