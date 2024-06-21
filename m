Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8E91253F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 14:28:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bell.net header.i=@bell.net header.a=rsa-sha256 header.s=selector1 header.b=MtwagWwb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5Gq11lG4z3cXl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 22:28:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bell.net header.i=@bell.net header.a=rsa-sha256 header.s=selector1 header.b=MtwagWwb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bell.net (client-ip=209.71.212.37; helo=cmx-torrgo001.bell.net; envelope-from=dave.anglin@bell.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 196 seconds by postgrey-1.37 at boromir; Fri, 21 Jun 2024 22:27:34 AEST
Received: from cmx-torrgo001.bell.net (mta-tor-005.bell.net [209.71.212.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5GpG0HtSz3c6n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 22:27:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1718972855; 
        bh=4BexjXnCLKq50SSuz100skGcAaq1IqURNAr0X4nDn9U=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=MtwagWwbpv7CpUMRX+vScBPyROEnoQNi/jAD/RaX33EBGMDgA+jHTADzlpMwYsxn34dDXDMVxQv4Uxi8LufNOIuo3qzto3QIUiHwNZILXqpfLEKYqxA/GnL40XdUsc+6QACzBoKmHfOenlibwo6PHswS0+APAmBpU78EHBQwO5mAvrfPYNlRlOgiVnBF3x4Rg4lGFL0NtMdT8SIDLcv+6ZJeo/wbHMBm/XIAiwPblrmzjVoouhuRn0lAP7pxJhel8Ufcf+5V/WKYaxpNI/vJ9td2jZgPv8zQ6mRqqo790W5/9ga4IVSa7Vtp7kwnDtOkc2wGMDNRlq7m8wxsScrf3Q==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-Originating-IP: [70.52.162.67]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 66756720000522AE
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgedgheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuefgnffnpdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhohhhnucffrghvihguucetnhhglhhinhcuoegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvtheqnecuggftrfgrthhtvghrnhepjeelffffjeehgffgueehleegfeegueeigedtkeffgeduueetffegffejudekgfeunecukfhppeejtddrhedvrdduiedvrdeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrvddrgeelngdpihhnvghtpeejtddrhedvrdduiedvrdeijedpmhgrihhlfhhrohhmpegurghvvgdrrghnghhlihhnsegsvghllhdrnhgvthdpnhgspghrtghpthhtohepfeegpdhrtghpthhtoheprgguhhgvmhgvrhhvrghlrdiirghnvghllhgrsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggtrghinhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrgh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received-SPF: softfail (cmx-torrgo001.bell.net: domain bell.net does not
 designate 70.52.162.67 as permitted sender) identity=mailfrom;
 receiver=cmx-torrgo001.bell.net; client-ip=70.52.162.67;
 envelope-from=dave.anglin@bell.net; helo=[192.168.2.49];
Received: from [192.168.2.49] (70.52.162.67) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 66756720000522AE; Fri, 21 Jun 2024 08:22:45 -0400
Message-ID: <761c5902-9f6e-404e-8265-3060946368c9@bell.net>
Date: Fri, 21 Jun 2024 08:22:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] parisc: use generic sys_fanotify_mark
 implementation
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Arnd Bergmann <arnd@arndb.de>,
 LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
 Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-8-arnd@kernel.org>
 <e80809ba-ee81-47a5-9b08-54b11f118a78@gmx.de>
 <e22d7cd7-d247-4426-9506-a3a644ae03c4@cs-soprasteria.com>
 <1308b23a-d7c0-449e-becd-53c42114661e@app.fastmail.com>
 <3444b93ce46c7e7c156f912495e5c35ccf275549.camel@physik.fu-berlin.de>
Content-Language: en-US
From: John David Anglin <dave.anglin@bell.net>
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <3444b93ce46c7e7c156f912495e5c35ccf275549.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "musl@lists.openwall.com" <musl@lists.openwall.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, LTP List <ltp@lists.linux.it>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Xi Ruoyao <libc-alpha@sourceware.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-06-21 4:54 a.m., John Paul Adrian Glaubitz wrote:
> Hi,
>
> On Fri, 2024-06-21 at 08:28 +0200, Arnd Bergmann wrote:
>> It's more likely to be related to the upward growing stack.
>> I checked the gcc sources and found that out of the 50 supported
>> architectures, ARGS_GROW_DOWNWARD is set on everything except
>> for gcn, stormy16 and  32-bit parisc. The other two are
>> little-endian though. STACK_GROWS_DOWNWARD in turn is set on
>> everything other than parisc (both 32-bit and 64-bit).
> Wait a second! Does that mean that on 64-bit PA-RISC, the stack is
> actually growing downwards? If yes, that would be a strong argument
> for creating a 64-bit PA-RISC port in Debian and replacing the 32-bit
> port.
No, the stack grows upward on both 32 and 64-bit parisc.  But stack arguments
grow upwards on 64-bit parisc.  The argument pointer is needed to access these
arguments.  In 32-bit parisc, the argument pointer is at a fixed offset relative to the
stack pointer and it can be eliminated.

Dave

-- 
John David Anglin  dave.anglin@bell.net

