Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D798137C3D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 08:53:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vsXn5Jy1zDqWd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 18:53:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=palmerdabbelt@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=o/riBuR2; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vgVG3rGNzDqjV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 11:20:15 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id l24so1755722pgk.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 16:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=c3X7AVrd0eaweLYAuO8RL12YZV2EtbyuB8unmVAV0Nc=;
 b=o/riBuR2mH3VghdAJD08lJGw+G6Nmt2YFqawukfV3FgIyraZCC33g4w6UUkTg4B9YA
 bPaQ7HIdl9EVvkaFzug0pY/FlWJECuXnToQMWAXeRVE0al9hqWVAVcLgt0QhvWPJSBsQ
 bB5dxtI06QKGwTmE7+MmdzSWdr5sWOBaOx8ylflwJxzwunQWhFk0yZMqgjvLjx3Ta6Qw
 IY0NzO2fCoYN5CkwLwDpJMeX7S6jXG0r+Ka/MngphRFWsDvtkDRIbForX/TrNPi0+IDh
 9ZHCf9TkSZkGR/2ZIQQ0xtQVlRTLSLv2/gi03mwbtBLmcgcOWB86bKQt7FFpTbEBt+yn
 J0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=c3X7AVrd0eaweLYAuO8RL12YZV2EtbyuB8unmVAV0Nc=;
 b=EEl45SFvpR7XGPUWFm9DFKuGNUz/OMh4NcjB52mWUgYjsSAnu0B9QFbYICG9ZJ1RyX
 0o1kf/pKWZJ68F63T48PRud2vQ5xQn+pJHNAhIU89AK935YsYMnzfEC9AXJutzu4ejMx
 1Ck0wYfDdBj5h166cmjRxfaqFs7pEn2N72jUXfEUKhxncCfHLC2SC8nOa8scqhFUa1tF
 ZdJnSJwSFxruWtSyhtxS5dLTNZcNy46GyP9uyrkjsqJyGovND2apdCy6Eg2fw5Wf4zq3
 b8/aB5gZ38E4NP7UWa+Ed8XLudz2EOf+ulQSYAM8YIGy6ktnF5kpTAkcbYxqB+qn2N9F
 sf5Q==
X-Gm-Message-State: APjAAAW9PFjslwmxuVoGvQ6jB9Oi6BtlsyGu2MPwegObQhWzXNi/gr42
 cTjBju3O8zBrObJUdXimOQF2XQ==
X-Google-Smtp-Source: APXvYqz94HjiloVFGVWbZus+RYXmvPQjwFd3nN3tcOUYSqCGg0YFmHQZNCSbn5YazmB7epfwxn4mvg==
X-Received: by 2002:a63:e30a:: with SMTP id f10mr7422254pgh.331.1578702011266; 
 Fri, 10 Jan 2020 16:20:11 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id c14sm4013510pjr.24.2020.01.10.16.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 16:20:10 -0800 (PST)
Date: Fri, 10 Jan 2020 16:20:10 -0800 (PST)
X-Google-Original-Date: Fri, 10 Jan 2020 16:19:54 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: Re: linux-next: build warning after merge of the bpf-next tree
To: alexandre@ghiti.fr
In-Reply-To: <a367af4d-7267-2e94-74dc-2a2aac204080@ghiti.fr>
References: <a367af4d-7267-2e94-74dc-2a2aac204080@ghiti.fr>
 <20191018105657.4584ec67@canb.auug.org.au>
 <20191028110257.6d6dba6e@canb.auug.org.au>
Message-ID: <mhng-0daa1a90-2bed-4b2e-833e-02cd9c0aa73f@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 11 Jan 2020 18:51:38 +1100
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, daniel@iogearbox.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org,
 linux-next@vger.kernel.org, zong.li@sifive.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jan 2020 14:28:17 PST (-0800), alexandre@ghiti.fr wrote:
> Hi guys,
>
> On 10/27/19 8:02 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Fri, 18 Oct 2019 10:56:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> Hi all,
>>>
>>> After merging the bpf-next tree, today's linux-next build (powerpc
>>> ppc64_defconfig) produced this warning:
>>>
>>> WARNING: 2 bad relocations
>>> c000000001998a48 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_start
>>> c000000001998a50 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_end
>>>
>>> Introduced by commit
>>>
>>>    8580ac9404f6 ("bpf: Process in-kernel BTF")
>> This warning now appears in the net-next tree build.
>>
>>
> I bump that thread up because Zong also noticed that 2 new relocations for
> those symbols appeared in my riscv relocatable kernel branch following
> that commit.
>
> I also noticed 2 new relocations R_AARCH64_ABS64 appearing in arm64 kernel.
>
> Those 2 weak undefined symbols have existed since commit
> 341dfcf8d78e ("btf: expose BTF info through sysfs") but this is the fact
> to declare those symbols into btf.c that produced those relocations.
>
> I'm not sure what this all means, but this is not something I expected
> for riscv for
> a kernel linked with -shared/-fpie. Maybe should we just leave them to
> zero ?
>
> I think that deserves a deeper look if someone understands all this
> better than I do.

Can you give me a pointer to your tree and how to build a relocatable kernel?
Weak undefined symbols have the absolute value 0, but the kernel is linked at
an address such that 0 can't be reached by normal means.  When I added support
to binutils for this I did it in a way that required almost no code --
essetially I just stopped dissallowing x0 as a possible base register for PCREL
relocations, which results in 0 always being accessible.  I just wanted to get
the kernel to build again, so I didn't worry about chasing around all the
addressing modes.  The PIC/PIE support generates different relocations and I
wouldn't be surprised if I just missed one (or more likely all) of them.

It's probably a simple fix, though I feel like every time I say that about the
linker I end up spending a month in there...
