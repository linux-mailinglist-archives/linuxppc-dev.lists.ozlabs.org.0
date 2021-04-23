Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5533693F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 15:45:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRbCN57dkz30Cs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 23:45:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=isovalent-com.20150623.gappssmtp.com header.i=@isovalent-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=GQ9SWSJA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=isovalent.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=quentin@isovalent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=isovalent-com.20150623.gappssmtp.com
 header.i=@isovalent-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=GQ9SWSJA; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRWX76Hl2z2yQm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 20:59:51 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id z6so7961300wmg.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isovalent-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=POTZ/1KbTme2ehdkYN4t8NUzorpYmuLDB40ValCRCzY=;
 b=GQ9SWSJA7G7fyBqL5po7yWgTUyHybJVBlTbgimQMgeLWnHWPXCKisioR3lZg+tWt9h
 z7HehOh3qZDxqUF30ai6ZxU2U1Ow8Hgk0PqsAAC8Krl1BFBv1LZT6QdVT/JFwyXax67L
 yuhPNrcw/yNhw/HJ/+mBzX14R/l6x0ltK3lCOOHEpIJIqdhDC2YNufJNDNzcMBJzYj7J
 qXutqCgEPewjWKcMIBsTzFe/Bmpc7u7/mRj+o83NFL3pJXd98Xo9so+tu+SwhEVXrFw7
 JXcq+GREZl6F3rYzfj9RA96tSdlkEWNtZt6P/WPXfX78yWs83/u4GkJ5e7gZ4nQ0GGXG
 J7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=POTZ/1KbTme2ehdkYN4t8NUzorpYmuLDB40ValCRCzY=;
 b=SEXVG1eZXnMi/B4G5QvIkxO+uxrf9D0I+fi0Xe67tyuN5+zzu67MrNqquua5o2Klx8
 i74EFiN5VREZ5EKD5jKOCKfSIRwEbpRyTHKKsQSbrcQdyQeujJdFhOx76ilXpjAn425t
 byQtA9jb1/oiurL9gVQlQRQxXz+Dg0CUcpEhach4BwkYaO+RGrk+r+oTSijZ8YT22Xbq
 kNZDvcktM9RN9Q/5xXqhd0UITJ07otFaPbGqgacaONURzmuJFN+sBDIJk1fIvNOML3Z8
 PW/fblOjF3qLj4fOouzmwInmanFnUh0cckAYVlSLY8jZMsMAPS2rsaI5jV/0ubGRG6J4
 P//g==
X-Gm-Message-State: AOAM530KvYI+O64yQmWVsQ4bLO95xcTr80Shnt9I2U/xkhhNcPS5Hsnb
 lz+xzQ1znQOQ02o3uwnuY27axw==
X-Google-Smtp-Source: ABdhPJzObvm9TMswQFwB877SBftpV3WuHpQFVBzCA+XkW+5tO9tLL2qswInPQ8jeRFQ5yWhqFZ0H4A==
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr3570424wmf.104.1619175586997; 
 Fri, 23 Apr 2021 03:59:46 -0700 (PDT)
Received: from [192.168.1.8] ([149.86.88.56])
 by smtp.gmail.com with ESMTPSA id e18sm9152733wrc.85.2021.04.23.03.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 03:59:46 -0700 (PDT)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
 <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
 <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
 <0dea05ba-9467-0d84-4515-b8766f60318e@csgroup.eu>
 <CAADnVQ+oQT6C7Qv7P5TV-x7im54omKoCYYKtYhcnhb1Uv3LPMQ@mail.gmail.com>
 <be132117-f267-5817-136d-e1aeb8409c2a@csgroup.eu>
 <58296f87-ad00-a0f5-954b-2150aa84efc4@isovalent.com>
 <6a809d3f-c9e3-0eb7-9c1d-a202ad848424@csgroup.eu>
From: Quentin Monnet <quentin@isovalent.com>
Message-ID: <ab1c3803-179c-7882-2bba-9eeda5211ad1@isovalent.com>
Date: Fri, 23 Apr 2021 11:59:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6a809d3f-c9e3-0eb7-9c1d-a202ad848424@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Apr 2021 23:44:23 +1000
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
Cc: Ian Rogers <irogers@google.com>, Song Liu <songliubraving@fb.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Zi Shen Lim <zlim.lnx@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Shubham Bansal <illusionist.neo@gmail.com>,
 Mahesh Bandewar <maheshb@google.com>, Will Deacon <will@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 paulburton@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Tobias Klauser <tklauser@distanz.ch>,
 grantseltzer@gmail.com, Xi Wang <xi.wang@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Luke Nelson <luke.r.nels@gmail.com>,
 Heiko Carstens <hca@linux.ibm.com>, KP Singh <kpsingh@kernel.org>,
 iecedge@gmail.com, Simon Horman <horms@verge.net.au>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Jianlin Lv <Jianlin.Lv@arm.com>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Wang YanQing <udknight@gmail.com>, tsbogend@alpha.franken.de,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Network Development <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>,
 linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, bpf <bpf@vger.kernel.org>,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

2021-04-23 12:46 UTC+0200 ~ Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> 
> Le 23/04/2021 à 12:26, Quentin Monnet a écrit :
>> 2021-04-23 09:19 UTC+0200 ~ Christophe Leroy
>> <christophe.leroy@csgroup.eu>
>>
>> [...]
>>
>>> I finally managed to cross compile bpftool with libbpf, libopcodes,
>>> readline, ncurses, libcap, libz and all needed stuff. Was not easy but I
>>> made it.
>>
>> Libcap is optional and bpftool does not use readline or ncurses. May I
>> ask how you tried to build it?
> 
> cd tools/bpf/
> 
> make ARCH=powerpc CROSS_COMPILE=ppc-linux-

Ok, you could try running directly from tools/bpf/bpftool/ next time
instead.

Readline at least is for a different tool under tools/bpf/, bpf_dbg (But
I'm still not sure where that ncurses requirement was pulled from). The
requirements for specific kernel options probably came from yet another
tool (runqslower, I think).

Quentin
