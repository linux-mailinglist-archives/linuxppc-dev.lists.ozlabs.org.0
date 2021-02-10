Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5EF316CEA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 18:37:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbRmB2hg3zDsbS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 04:37:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=ZTb8yL5X; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DbRgb1dhlzDwjP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 04:33:30 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id A053020B6C40;
 Wed, 10 Feb 2021 09:33:24 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A053020B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612978405;
 bh=6iW/jXFaWAWQ/vudECjORFajSX6aWkb9ApB+qY8R+5s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZTb8yL5XLLS13AwmIB0pBulw3hYrXQ7SwfAX4H7q9qS6I+HQBCVy9jYth6WFHk3uB
 Xc7IAPEvtuRTX5eJ+zUIRRi/bZZwPAn0kvRAhLC7XNVAAL2oILyaf8l9xH0G8wVqTw
 SbGUH+X0F4AQdN5xxah0sgRaMp+OyWIF/jmjTm5g=
Subject: Re: [PATCH v17 00/10] Carry forward IMA measurement log on kexec on
 ARM64
To: Rob Herring <robh@kernel.org>
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210210171500.GA2328209@robh.at.kernel.org>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <5c002c32-bc49-acda-c641-7b1494ea292d@linux.microsoft.com>
Date: Wed, 10 Feb 2021 09:33:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210171500.GA2328209@robh.at.kernel.org>
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, zohar@linux.ibm.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, will@kernel.org, prsriva@linux.microsoft.com,
 hsinyi@chromium.org, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com, gregkh@linuxfoundation.org,
 joe@perches.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/10/21 9:15 AM, Rob Herring wrote:
> On Tue, Feb 09, 2021 at 10:21:50AM -0800, Lakshmi Ramasubramanian wrote:
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
>> commit 96acc833dec8 ("ima: Free IMA measurement buffer after kexec syscall")
>> in https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
>> "next-integrity" branch.
> 
> Is that a hard dependency still? Given this is now almost entirely
> deleting arch code and adding drivers/of/ code, I was going to apply it.
> 

I tried applying the patches in Linus' mainline branch -
PATCH #5 0005-powerpc-Move-ima-buffer-fields-to-struct-kimage.patch 
doesn't apply.

But if I apply the dependent patch set (link given below), all the 
patches in this patch set apply fine.

https://patchwork.kernel.org/project/linux-integrity/patch/20210204174951.25771-2-nramas@linux.microsoft.com/

thanks,
  -lakshmi


