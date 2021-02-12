Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2E3197D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 02:12:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcFp76192zDwhB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 12:11:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=MXmM2de7; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DcFlP48SnzDvZB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 12:09:36 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 65CEC20B6C40;
 Thu, 11 Feb 2021 17:09:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 65CEC20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613092174;
 bh=3zzV73EkFkyAFdXlcurFqdYMOv5kFYuG+PJrfjUphp0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MXmM2de7TfpqZuJwO4ub1wkhJKgb/jdcBxS+arQ0yNQnI1al+YvbGIBOeT9Bqg18I
 d1NUo3q8EJWF+w6XyVj9ZVhah5VxcshbiXjU6M3k8whqnh8YDPSrt5BLEeVRp/qMPc
 ePohmOBtDmUSJR+6vnpAOKAuZ8RF4v2KeBs98ewI=
Subject: Re: Fwd: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup
 function
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <202102120032.Bv0MoYv7-lkp@intel.com>
 <40fd1869-dcb4-36ae-e997-b8486dd4846c@linux.microsoft.com>
 <b534117e-333d-097c-a3c0-2a80985bd37f@linux.microsoft.com>
 <87mtwap35f.fsf@manicouagan.localdomain>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <b4ebf962-4210-5d17-2149-6b152d587f95@linux.microsoft.com>
Date: Thu, 11 Feb 2021 17:09:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87mtwap35f.fsf@manicouagan.localdomain>
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
Cc: Rob Herring <robh@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/11/21 3:59 PM, Thiago Jung Bauermann wrote:
> 
> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> 
>> On 2/11/21 9:42 AM, Lakshmi Ramasubramanian wrote:
>>> Hi Rob,
>>> [PATCH] powerpc: Rename kexec elfcorehdr_addr to elf_headers_mem
>>> This change causes build problem for x86_64 architecture (please see the
>>> mail from kernel test bot below) since arch/x86/include/asm/kexec.h uses
>>> "elf_load_addr" for the ELF header buffer address and not
>>> "elf_headers_mem".
>>> struct kimage_arch {
>>>       ...
>>>       /* Core ELF header buffer */
>>>       void *elf_headers;
>>>       unsigned long elf_headers_sz;
>>>       unsigned long elf_load_addr;
>>> };
>>> I am thinking of limiting of_kexec_alloc_and_setup_fdt() to ARM64 and
>>> PPC64 since they are the only ones using this function now.
>>> #if defined(CONFIG_ARM64) && defined(CONFIG_PPC64)
>> Sorry - I meant to say
>> #if defined(CONFIG_ARM64) || defined(CONFIG_PPC64)
>>
> 
> Does it build correctly if you rename elf_headers_mem to elf_load_addr?
> Or the other way around, renaming x86's elf_load_addr to
> elf_headers_mem. I don't really have a preference.

Yes - changing arm64 and ppc from "elf_headers_mem" to "elf_load_addr" 
builds fine.

But I am concerned about a few other architectures that also define 
"struct kimage_arch" such as "parisc", "arm" which do not have any ELF 
related fields. They would not build if the config defines 
CONFIG_KEXEC_FILE and CONFIG_OF_FLATTREE.

Do you think that could be an issue?

thanks,
  -lakshmi

> 
> That would be better than adding an #if condition.
> 
>>> void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
>>>                      unsigned long initrd_load_addr,
>>>                      unsigned long initrd_len,
>>>                      const char *cmdline)
>>> {
>>>       ...
>>> }
>>> #endif /* defined(CONFIG_ARM64) && defined(CONFIG_PPC64) */
>>> Please let me know if you have any concerns.
>>> thanks,
>>>    -lakshmi
> 

