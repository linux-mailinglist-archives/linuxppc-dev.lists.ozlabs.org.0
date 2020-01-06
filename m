Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B31317CC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 19:55:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s4Sg5v8zzDq9l
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 05:54:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zytor.com (client-ip=198.137.202.136; helo=mail.zytor.com;
 envelope-from=hpa@zytor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=zytor.com header.i=@zytor.com header.b="ZMVxUZ9J"; 
 dkim-atps=neutral
X-Greylist: delayed 3192 seconds by postgrey-1.36 at bilbo;
 Tue, 07 Jan 2020 05:53:23 AEDT
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s4Qq6fVPzDq9l
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 05:53:23 +1100 (AEDT)
Received: from carbon-x1.hos.anvin.org
 ([IPv6:2601:646:8600:3280:1098:42a1:36db:233c])
 (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 006HxLts2985803
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 6 Jan 2020 09:59:21 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 006HxLts2985803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2019122001; t=1578333565;
 bh=uFGtgLW/eUGZosJDUZ4/JsFg07VyLBe7Sl07+mpDDgQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZMVxUZ9JlU6up34Nb4pGcpMjDZpUuWN8ck9Y4jYgVb+4bZERRqJiFzIJhbIfziB1k
 ZNW7gtaTuWxOa78mC5Z+zWvyvNL35mkSsEZQpPBJS0ncqNieAs6YCfbCKRbkrwQtVp
 RcNn3KAZoKEYAi4ef6eQLTWSuxUbKuM7RXuWfbUO5ZflxcLL1hn2UBbGPOSqDE+xOY
 wijrfyuPLvBiBZoiKnCdjHJ9U/s6x0xqbbT7g3nNy9Gk9o9TiqnutL8djSuCUX49Qi
 Oy4XDW1jzUdxSDSG813dTCGe2xdRD1rCCDjOpb+PwCTaq1SfwtxgOn+n2Mp0OYFc4L
 +gnXlUsMkLtVw==
Subject: Re: [PATCH v3 02/22] compat: provide compat_ptr() on all architectures
To: Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20200102145552.1853992-1-arnd@arndb.de>
 <20200102145552.1853992-3-arnd@arndb.de>
From: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <e2c7b4d7-587e-f71c-f0df-810e8d9869f2@zytor.com>
Date: Mon, 6 Jan 2020 09:59:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200102145552.1853992-3-arnd@arndb.de>
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, oprofile-list@lists.sf.net,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Robert Richter <rric@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-01-02 06:55, Arnd Bergmann wrote:
> In order to avoid needless #ifdef CONFIG_COMPAT checks,
> move the compat_ptr() definition to linux/compat.h
> where it can be seen by any file regardless of the
> architecture.
> 
> Only s390 needs a special definition, this can use the
> self-#define trick we have elsewhere.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/include/asm/compat.h   | 17 -----------------
>  arch/mips/include/asm/compat.h    | 18 ------------------
>  arch/parisc/include/asm/compat.h  | 17 -----------------
>  arch/powerpc/include/asm/compat.h | 17 -----------------
>  arch/powerpc/oprofile/backtrace.c |  2 +-
>  arch/s390/include/asm/compat.h    |  6 +-----
>  arch/sparc/include/asm/compat.h   | 17 -----------------
>  arch/x86/include/asm/compat.h     | 17 -----------------
>  include/linux/compat.h            | 18 ++++++++++++++++++
>  9 files changed, 20 insertions(+), 109 deletions(-)
> 

For x86:

Reviewed-by: H. Peter Anvin <hpa@zytor.com>

It still suffers from the zero-one-infinity rule failure of the compat
architecture as a whole, but that is a very different problem. In this case
"compat" is obviously meaning "a 32-on-64 ABI" and simply centralizes a common
API, which is a Good Thing[TM].

	-hpa

