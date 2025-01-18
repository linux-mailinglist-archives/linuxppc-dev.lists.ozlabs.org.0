Return-Path: <linuxppc-dev+bounces-5372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC38A15B6B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2025 05:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZkPs4HcGz30VR;
	Sat, 18 Jan 2025 15:38:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::138"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737175121;
	cv=none; b=CGBO5ZWmdTALaAAtMP6ApsPXTp6pOOgGqNHYEOe/0K7mBMyiQASWYFJN6iwXpRfkyANG2ZbtjR9Uy5GhDOap/E5/G1At1MeCH+PpsAeLoV8V1gI1oo5PLRYc8Ck1l/Itaac6LWX74WX7gHWxNjr7kaDmdPsykXVvibEQaibmSArDLmvScSdAMSk6FjXZ0lBVcgsA+QhIll9Z5cavpm+PQvdhBZStRgGbdPW23JfkYdSk6Rvu3JYRbXwyCk89zTo/v5MEzIlzOK5ob9WO1+4aq3eLxIR00NP3izprP/cx+EckfwZPNvZDjTufrreh2fs8c+TOOxfk4YKdJisN9Jh89g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737175121; c=relaxed/relaxed;
	bh=w1vtBdwCDfUdjXlAPq/H8CEoUqmusT1ScqFMMfS7dZ8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DxxHRxi2gM5nLm9wcx7/ifzog1tY2kft2/i51Wdeo/iMRdbUoIrwNdw7S7KfPf9IR0N2gT5s/R9hRjbW3hR8GWyzqQ+HvthKV6BOLtD9UZdDRv+lLGJGxlXoIkoiZ7wY/bjKU8qST13W1ogmTnCvk8MhsUPN9MvLZNP5wvYUsvaNK/tYuRJGPHObHKulGedFwpPCaXfzq+/AsHeq5aHfSP9ZTkkkjSC5iUFdijMqoMa/IMEbFxVWGw4nLP5m0LXXZMUCE9VEdE6m2Up32gZEx+HONRzX+gNvRjnKsZtXL7NgseocdnUZIR/3Mb4e+L86bEfoqkQflpTtwIiE6JX/mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2024121701 header.b=hdj5mGq9; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::138; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2024121701 header.b=hdj5mGq9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::138; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 99284 seconds by postgrey-1.37 at boromir; Sat, 18 Jan 2025 15:38:40 AEDT
Received: from mail.zytor.com (torg.zytor.com [IPv6:2607:7c80:54:3::138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZkPr1sTWz306d
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 15:38:38 +1100 (AEDT)
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 50I4YkBo262261
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 17 Jan 2025 20:34:46 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 50I4YkBo262261
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024121701; t=1737174897;
	bh=w1vtBdwCDfUdjXlAPq/H8CEoUqmusT1ScqFMMfS7dZ8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=hdj5mGq9LhBqQz1DGkEXyOAPg5UumXs4rYaXrAxe/XdXtsj44W9H6+brjFlKruZEu
	 KZw5piA42OHN/XcSeaUskoitHUnJNqT+XsxtkAneGSnIvuXW+n6ZC7eW8FnCimYSsG
	 Lq1HAj2fYTDCYOqRHD+qLXvSb6ZxhtiXDCdoJyIe1GRxYKC8axRGOudEZFGw1AbPA8
	 XfSMDwvu4q4o4HAn0vaClp5lq+a2D6iGDyVD9URdyKl9xLKY6kTXhchRX+IiLJk6MT
	 lQqfZZED15R6MYW2CL2TKc8zQ0Rfpn6iPT2QNmGS8gBb8X3N0roFy9uw8TLOeP93LY
	 mjPwqKCNYdQPg==
Date: Fri, 17 Jan 2025 20:34:45 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Eugene Syromyatnikov <evgsyr@gmail.com>
CC: Charlie Jenkins <charlie@rivosinc.com>, "Dmitry V. Levin" <ldv@strace.io>,
        Oleg Nesterov <oleg@redhat.com>, Mike Frysinger <vapier@gentoo.org>,
        Renzo Davoli <renzo@cs.unibo.it>,
        Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io,
        Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-snps-arc@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-arch@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/7=5D_syscall=2Eh=3A_add_syscall=5Fse?=
 =?US-ASCII?Q?t=5Farguments=28=29_and_syscall=5Fset=5Freturn=5Fvalue=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CACGkJdtAmtxsPiKYUzLLmfNGf6oJ9YS-25ZY9VvEEWhz37Qx6Q@mail.gmail.com>
References: <20250113170925.GA392@strace.io> <20250113171140.GC589@strace.io> <Z4hs0X8RhGTuevnn@ghost> <eecada37-9d0e-4e3c-9b70-fefb990835b2@zytor.com> <CACGkJdtAmtxsPiKYUzLLmfNGf6oJ9YS-25ZY9VvEEWhz37Qx6Q@mail.gmail.com>
Message-ID: <B5D44A2A-BF4F-4EEA-992D-0A06F2AE08CA@zytor.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On January 17, 2025 7:45:02 AM PST, Eugene Syromyatnikov <evgsyr@gmail=2Eco=
m> wrote:
>On Fri, Jan 17, 2025 at 2:03=E2=80=AFAM H=2E Peter Anvin <hpa@zytor=2Ecom=
> wrote:
>>
>> I link the concept of this patchset, but *please* make it clear in the
>> comments that this does not solve the issue of 64-bit kernel arguments
>> on 32-bit systems being ABI specific=2E
>
>Sorry, but I don't see how this is relevant; each architecture has its
>own ABI with its own set of peculiarities, and there's a lot of
>(completely unrelated) work needed in order to make an ABI that is
>architecture-agnostic=2E  All this patch set does is provides a
>consistent way to manipulate scno and args across architectures;  it
>doesn't address the fact that some architectures have mmap2/mmap_pgoff
>syscall, or that some have fadvise64_64 in addition to fadvise64, or
>the existence of clone2, or socketcall, or ipc; or that some
>architectures don't have open or stat;  or that scnos on different
>architectures or even different bit-widths within the "same"
>architecture are different=2E
>
>> This isn't unique to this patch in any way; the only way to handle it i=
s
>> by keeping track of each ABI=2E
>
>That's true, but this patch doesn't even try to address that=2E
>

I just want it noted in the comment, that's all=2E

