Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E09466E10F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 15:42:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxBS01jJxz3cdL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 01:42:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=isovalent-com.20210112.gappssmtp.com header.i=@isovalent-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hrBf6+m2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isovalent.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=quentin@isovalent.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=isovalent-com.20210112.gappssmtp.com header.i=@isovalent-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hrBf6+m2;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxBQz4tppz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 01:41:13 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id t5so26395799wrq.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 06:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Zd4ckig5+l+fDHoq+3Cg5EEDjyvUymTQ0k84rOwVsY=;
        b=hrBf6+m2UMiJy0DaFTl5CCY2LDHWPJ0TgHDVrEthrBJjHsrWVf9QDjyKzQ/WDzdJps
         1OkBtqw7LO4BHmvyV8LbV+/888Nz0EZD9N9KFeEbAK3FMGDK1EvcCp2MHke+pMqlS8L3
         sJQzOkBPOUUd3IQogsoYCa8SopnmuIZonC6vehv7XNJa9Q4ekvcGZmItPBaTtXktD5xE
         BJrwVlAvuEj9a9B8MGpmNU3HtbbR3WcXx8bakHfzK6ktzcFiICw1L1mGsU9KikIIXAtU
         K3/QHJeQxb7I3UNgAPWXS4Vz/UaQRaNInXNxkkHmBZ7SjuAV2N4+JpYFH9XTxWgF3KmS
         e+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Zd4ckig5+l+fDHoq+3Cg5EEDjyvUymTQ0k84rOwVsY=;
        b=bcSm0TRa+K1N8bGoDzfAlHi4MZkTf5Uwi0JBGwJ5lcCoyVFDWFUxJux1isouDhbZRF
         JSDBvPdMNDBoFFLrEiwTSAl3nv7D/eqeahZE7S3CPLQYvVaj1gyCneSQtRfg6dlB9a80
         BTkVLMoSk9TuBvo9QGi6sm94DVTTLPfrfsCjQM7J/+Ro8Yr07mI2NE4AQd3UWtp1T//O
         mTqNcIxpRJKc6V8DlJQTyzaOa669oJmb9YFs4e8DLHAUQFH0OV3+XbPgyvlnqdfGK+UM
         o0O0xHX7PqE3OLv93vcge6vPdk7Hst2HZb+nGlSEy4rEjN+ajf0DBE85BRlDozF/hPjs
         FEww==
X-Gm-Message-State: AFqh2koJGwxiyqsEV2+sLpYm5hmyTGELcYszA4zThSNb7sYNLJDkaZlB
	FTLTmkHertUe+ORttkbxNYXsKQ==
X-Google-Smtp-Source: AMrXdXvOsILeXKcAbS9ORal0WZ3Au5kJfv7Pnr7I72hOal9JtYYKjZzX65kwJNeuOv3u8QxJcdMI+A==
X-Received: by 2002:adf:f0cd:0:b0:2bd:d783:377 with SMTP id x13-20020adff0cd000000b002bdd7830377mr3296826wro.22.1673966467790;
        Tue, 17 Jan 2023 06:41:07 -0800 (PST)
Received: from [192.168.178.32] ([51.155.200.13])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d534a000000b00272c0767b4asm29388590wrv.109.2023.01.17.06.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 06:41:07 -0800 (PST)
Message-ID: <376f9737-f9a4-da68-8b7f-26020021613c@isovalent.com>
Date: Tue, 17 Jan 2023 14:41:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tonghao Zhang <tong@infragraf.org>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
 <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org>
 <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <0792068b-9aff-d658-5c7d-086e6d394c6c@csgroup.eu>
 <C811FC00-CE38-4227-B2E8-4CD8989D8B94@infragraf.org>
 <4ab9aafe-6436-b90d-5448-f74da22ddddb@csgroup.eu>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <4ab9aafe-6436-b90d-5448-f74da22ddddb@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hou Tao <houtao1@huawei.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>, "linux-arm-kernel@lists.infradead.or" <linux-arm-kernel@lists.infradead.or>, KP Singh <kpsingh@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Hao Luo <haoluo@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Jiri Olsa <jolsa@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@li
 sts.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

2023-01-17 14:25 UTC+0000 ~ Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> 
> Le 17/01/2023 à 15:18, Tonghao Zhang a écrit :
>>
>>
>>> On Jan 17, 2023, at 7:36 PM, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>>
>>>
>>>
>>> Le 17/01/2023 à 08:30, Christophe Leroy a écrit :
>>>>
>>>>
>>>> Le 17/01/2023 à 06:30, Tonghao Zhang a écrit :
>>>>>
>>>>>
>>>>>> On Jan 9, 2023, at 4:15 PM, Christophe Leroy
>>>>>> <christophe.leroy@csgroup.eu> wrote:

[...]

>>>>>> Sure I will try to test bpftool again in the coming days.
>>>>>>
>>>>>> Previous discussion about that subject is here:
>>>>>> https://patchwork.kernel.org/project/linux-riscv/patch/20210415093250.3391257-1-Jianlin.Lv@arm.com/#24176847=

Christophe, apologies from dropping the discussion the last time, it
seems your last message on that thread didn't make it to my inbox at the
time :/. Thanks a lot for looking into that again!

>>>>> Hi Christophe
>>>>> Any progress? We discuss to deprecate the bpf_jit_enable == 2 in 2021,
>>>>> but bpftool can not run on powerpc.
>>>>> Now can we fix this issue?
>>>>
>>>> Hi Tong,
>>>>
>>>> I have started to look at it but I don't have any fruitfull feedback yet.
>>>
>>> Hi Again,
>>>
>>> I tested again, the problem is still the same as one year ago:
>>>
>>> root@vgoip:~# ./bpftool prog
>>> libbpf: elf: endianness mismatch in pid_iter_bpf.
>> It seem to be not right ehdr->e_ident[EI_DATA]. Do we can print the real value?
>> /*
>>   * e_ident[EI_DATA]
>>   */
>> #define ELFDATANONE     0
>> #define ELFDATA2LSB     1
>> #define ELFDATA2MSB     2
>> #define ELFDATANUM      3
>>
>> bpf_object__elf_init:
>> obj->efile.ehdr = ehdr = elf64_getehdr(elf);
>>
>>> libbpf: failed to initialize skeleton BPF object 'pid_iter_bpf': -4003
>>> Error: failed to open PID iterator skeleton
>>>
>>> root@vgoip:~# uname -a
>>> Linux vgoip 6.2.0-rc3-02596-g1c2c9c13e256 #242 PREEMPT Tue Jan 17
>>> 09:36:08 CET 2023 ppc GNU/Linux
>> On my pc, elf is little endian.
>> # readelf -h tools/bpf/bpftool/pid_iter.bpf.o
>> ELF Header:
>>    Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
>>    Class:                             ELF64
>>    Data:                              2's complement, little endian # x86_64
>>    Version:                           1 (current)
>>    OS/ABI:                            UNIX - System V
>>    ABI Version:                       0
>>    Type:                              REL (Relocatable file)
>>    Machine:                           Linux BPF
>>    Version:                           0x1
>>    Entry point address:               0x0
>>    Start of program headers:          0 (bytes into file)
>>    Start of section headers:          64832 (bytes into file)
>>    Flags:                             0x0
>>    Size of this header:               64 (bytes)
>>    Size of program headers:           0 (bytes)
>>    Number of program headers:         0
>>    Size of section headers:           64 (bytes)
>>    Number of section headers:         13
>>    Section header string table index: 1
>>
> 
> Yes, must be something wrong with the build, I get same as you :
> 
> $ LANG= readelf -h pid_iter.bpf.o
> ELF Header:
>    Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
>    Class:                             ELF64
>    Data:                              2's complement, little endian
>    Version:                           1 (current)
>    OS/ABI:                            UNIX - System V
>    ABI Version:                       0
>    Type:                              REL (Relocatable file)
>    Machine:                           Linux BPF
>    Version:                           0x1
>    Entry point address:               0x0
>    Start of program headers:          0 (bytes into file)
>    Start of section headers:          34704 (bytes into file)
>    Flags:                             0x0
>    Size of this header:               64 (bytes)
>    Size of program headers:           0 (bytes)
>    Number of program headers:         0
>    Size of section headers:           64 (bytes)
>    Number of section headers:         13
>    Section header string table index: 1
> 
> 
> Whereas I expect the same as bpftool I suppose, which is :
> 
> $ LANG= readelf -h bpftool
> ELF Header:
>    Magic:   7f 45 4c 46 01 02 01 00 00 00 00 00 00 00 00 00
>    Class:                             ELF32
>    Data:                              2's complement, big endian
>    Version:                           1 (current)
>    OS/ABI:                            UNIX - System V
>    ABI Version:                       0
>    Type:                              EXEC (Executable file)
>    Machine:                           PowerPC
>    Version:                           0x1
>    Entry point address:               0x100027d0
>    Start of program headers:          52 (bytes into file)
>    Start of section headers:          1842896 (bytes into file)
>    Flags:                             0x0
>    Size of this header:               52 (bytes)
>    Size of program headers:           32 (bytes)
>    Number of program headers:         9
>    Size of section headers:           40 (bytes)
>    Number of section headers:         39
>    Section header string table index: 38
> 

pid_iter.bpf.o should be generated from that command in bpftool's Makefile:

	$(OUTPUT)%.bpf.o: skeleton/%.bpf.c $(OUTPUT)vmlinux.h \
			$(LIBBPF_BOOTSTRAP)
		$(QUIET_CLANG)$(CLANG) \
			-I$(or $(OUTPUT),.) \
			-I$(srctree)/tools/include/uapi/ \
			-I$(LIBBPF_BOOTSTRAP_INCLUDE) \
			-g -O2 -Wall -fno-stack-protector \
			-target bpf -c $< -o $@

My understanding is that "-target bpf" is supposed to pick the
endianness for the host (see "llc --version | grep bpf". If that's not
the case, could you please try to turn that into '-target bpfeb' in the
Makefile instead? I'd be curious to see if it helps.

Quentin
