Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D65A711A661
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 09:59:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XrTX0rz1zDqTG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:59:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=bsingharora@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uJpx+Q19"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XrRf62K3zDq6y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 19:57:50 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id p17so6087718wma.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bIfbFzQT9ZxQ4e4nrVfDT9ML1R0zmGFtDVqaemsabhc=;
 b=uJpx+Q19Yd4mqLiAv4f6/WEmTj6mWda8GNON/9Rdezxz5kx3l3dZWBqDZKm1/2UHwD
 I81acq/2ABa0OgURZlnD+fM8kkHgF88QHaeSppMNU6iAwcHCrjUL53WylnGvcHMqX2Vf
 4ohDimaFbXsHS8Tan/pl+RuDPjqxOmn2E0Z4hZold6iy3lJanZci/UMsY/phE6oqyXH5
 F24tciCxJ4DJqq1/oWBViZ0nFOgPUvRBJW4Z1C/DYq2IZ1jcycQ3L9Le8p3DB3UYhpxS
 tPXOXOhYqhg8MdbYPB0J6g4mSUeCJtuouF4Ugc8hjoJLhzaUHyOOz1eLqpzsb1QBD9Jz
 bkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bIfbFzQT9ZxQ4e4nrVfDT9ML1R0zmGFtDVqaemsabhc=;
 b=AgM5Cgm2LvfOD1nzRAC/2h6Xr33fUPLaZepmreI8MjhoTBM/7MFOqzjQuav3LAEW35
 eiunD2OTZFuhEZpdBD14yyT5E85QjzwPQogAckrHiLCp9DYf6obBYy3Isna6E9ODUkjM
 ecXDg5rsO/00lXmYg3PqBBOKk3cM0gs7z9MIyvmhg8Qi1Tqm/tym725jYiPkT7Yy64OT
 2YRR1YrCWxqqtR3p/+5OjE2bVfFk5nNDeQvadq1kDpb6MxYuu4VBdNv2U0AR0thrfxpZ
 cd7B+b/j9bguO+7mYEF+kn1Z8codLmQWAEgBl1MiuQIxMDL+LOPtBnxWrXP9S5eoTELV
 /J5Q==
X-Gm-Message-State: APjAAAXCWDo1jMeXkaNZHJ4Hfqha/D20m/YlqMfSLmP483WHpR0udpv8
 fnomBjlq2ZJ3Prt1BLK2lFo=
X-Google-Smtp-Source: APXvYqxtxQFKb7qdFmlxMXocQoPsun4uH3c9fqHeS8JZuQs2cKgZ/ll/OsMTOxA9oMKlvUoGsqv+yA==
X-Received: by 2002:a7b:cd0a:: with SMTP id f10mr2377880wmj.111.1576054665197; 
 Wed, 11 Dec 2019 00:57:45 -0800 (PST)
Received: from [192.168.68.108] (115-64-122-209.tpgi.com.au. [115.64.122.209])
 by smtp.gmail.com with ESMTPSA id
 q6sm1513859wrx.72.2019.12.11.00.57.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Dec 2019 00:57:44 -0800 (PST)
Subject: Re: [PATCH v2 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kasan-dev@googlegroups.com, christophe.leroy@c-s.fr,
 aneesh.kumar@linux.ibm.com
References: <20191210044714.27265-1-dja@axtens.net>
 <20191210044714.27265-5-dja@axtens.net>
 <71751e27-e9c5-f685-7a13-ca2e007214bc@gmail.com>
 <875zincu8a.fsf@dja-thinkpad.axtens.net>
From: Balbir Singh <bsingharora@gmail.com>
Message-ID: <2e0f21e6-7552-815b-1bf3-b54b0fc5caa9@gmail.com>
Date: Wed, 11 Dec 2019 19:57:34 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <875zincu8a.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/12/19 4:21 pm, Daniel Axtens wrote:
> Hi Balbir,
> 
>>> +Discontiguous memory can occur when you have a machine with memory spread
>>> +across multiple nodes. For example, on a Talos II with 64GB of RAM:
>>> +
>>> + - 32GB runs from 0x0 to 0x0000_0008_0000_0000,
>>> + - then there's a gap,
>>> + - then the final 32GB runs from 0x0000_2000_0000_0000 to 0x0000_2008_0000_0000
>>> +
>>> +This can create _significant_ issues:
>>> +
>>> + - If we try to treat the machine as having 64GB of _contiguous_ RAM, we would
>>> +   assume that ran from 0x0 to 0x0000_0010_0000_0000. We'd then reserve the
>>> +   last 1/8th - 0x0000_000e_0000_0000 to 0x0000_0010_0000_0000 as the shadow
>>> +   region. But when we try to access any of that, we'll try to access pages
>>> +   that are not physically present.
>>> +
>>
>> If we reserved memory for KASAN from each node (discontig region), we might survive
>> this no? May be we need NUMA aware KASAN? That might be a generic change, just thinking
>> out loud.
> 
> The challenge is that - AIUI - in inline instrumentation, the compiler
> doesn't generate calls to things like __asan_loadN and
> __asan_storeN. Instead it uses -fasan-shadow-offset to compute the
> checks, and only calls the __asan_report* family of functions if it
> detects an issue. This also matches what I can observe with objdump
> across outline and inline instrumentation settings.
> 
> This means that for this sort of thing to work we would need to either
> drop back to out-of-line calls, or teach the compiler how to use a
> nonlinear, NUMA aware mem-to-shadow mapping.

Yes, out of line is expensive, but seems to work well for all use cases.
BTW, the current set of patches just hang if I try to make the default
mode as out of line


> 
> I'll document this a bit better in the next spin.
> 
>>> +	if (IS_ENABLED(CONFIG_KASAN) && IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
>>> +		kasan_memory_size =
>>> +			((phys_addr_t)CONFIG_PHYS_MEM_SIZE_FOR_KASAN << 20);
>>> +
>>> +		if (top_phys_addr < kasan_memory_size) {
>>> +			/*
>>> +			 * We are doomed. Attempts to call e.g. panic() are
>>> +			 * likely to fail because they call out into
>>> +			 * instrumented code, which will almost certainly
>>> +			 * access memory beyond the end of physical
>>> +			 * memory. Hang here so that at least the NIP points
>>> +			 * somewhere that will help you debug it if you look at
>>> +			 * it in qemu.
>>> +			 */
>>> +			while (true)
>>> +				;
>>
>> Again with the right hooks in check_memory_region_inline() these are recoverable,
>> or so I think
> 
> So unless I misunderstand the circumstances in which
> check_memory_region_inline is used, this isn't going to help with inline
> instrumentation.
> 

Yes, I understand. Same as above?


>>> +void __init kasan_init(void)
>>> +{
>>> +	int i;
>>> +	void *k_start = kasan_mem_to_shadow((void *)RADIX_KERN_VIRT_START);
>>> +	void *k_end = kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END);
>>> +
>>> +	pte_t pte = __pte(__pa(kasan_early_shadow_page) |
>>> +			  pgprot_val(PAGE_KERNEL) | _PAGE_PTE);
>>> +
>>> +	if (!early_radix_enabled())
>>> +		panic("KASAN requires radix!");
>>> +
>>
>> I think this is avoidable, we could use a static key for disabling kasan in
>> the generic code. I wonder what happens if someone tries to boot this
>> image on a Power8 box and keeps panic'ing with no easy way of recovering.
> 
> Again, assuming I understand correctly that the compiler generates raw
> IR->asm for these checks rather than calling out to a function, then I
> don't think we get a way to intercept those checks. It's too late to do
> anything at the __asan report stage because that will already have
> accessed memory that's not set up properly.
> 
> If you try to boot this on a Power8 box it will panic and you'll have to
> boot into another kernel from the bootloader. I don't think it's
> avoidable without disabling inline instrumentation, but I'd love to be
> proven wrong.
> 
>>
>> NOTE: I can't test any of these, well may be with qemu, let me see if I can spin
>> the series and provide more feedback
> 
> It's actually super easy to do simple boot tests with qemu, it works fine in TCG,
> Michael's wiki page at
> https://github.com/linuxppc/wiki/wiki/Booting-with-Qemu is very helpful.
> 
> I did this a lot in development.
> 
> My full commandline, fwiw, is:
> 
> qemu-system-ppc64  -m 8G -M pseries -cpu power9  -kernel ../out-3s-radix/vmlinux  -nographic -chardev stdio,id=charserial0,mux=on -device spapr-vty,chardev=charserial0,reg=0x30000000 -initrd ./rootfs-le.cpio.xz -mon chardev=charserial0,mode=readline -nodefaults -smp 4

qemu has been crashing with KASAN enabled/ both inline/out-of-line options. I am running linux-next + the 4 patches you've posted. In one case I get a panic and a hang in the other. I can confirm that when I disable KASAN, the issue disappears

Balbir Singh.

> 
> Regards,
> Daniel
> 
