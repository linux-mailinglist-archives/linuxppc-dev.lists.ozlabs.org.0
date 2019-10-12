Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2AED4ED0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 11:58:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46r0dh1nHvzDqdk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 20:58:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmx.de
 (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.b="RqMmW15n"; 
 dkim-atps=neutral
X-Greylist: delayed 354 seconds by postgrey-1.36 at bilbo;
 Sat, 12 Oct 2019 20:57:08 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46r0bm5dmXzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 20:57:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1570874216;
 bh=8pjS8qqP1wCmF9jdsKwpdm/zvDW8dZCWsbuGTUYmHnw=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=RqMmW15nAnwDzmqoV69UQ31LUDWSB3+1ius8qxvPVxJZjqo+LkXWxnFhaJyhA5+1o
 rAUb4PHSn2t62guJ5ypEWfFuIMPxkOBaPkX6zqnxm1F+Ooi3Yl5KdOg+lbyqxT/x9M
 XE/2+gbrDyCu10eskjggqIzZx0e53WfhbHbw6iXE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.179.223]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1iAOLl3LOK-008rpL; Sat, 12
 Oct 2019 11:50:13 +0200
Subject: Re: [PATCH v2 23/29] parisc: Move EXCEPTION_TABLE to RO_DATA segment
To: Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-24-keescook@chromium.org>
From: Helge Deller <deller@gmx.de>
Message-ID: <8b3c27ec-9880-5957-a802-ca740d9ad6c5@gmx.de>
Date: Sat, 12 Oct 2019 11:50:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191011000609.29728-24-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OW210CNt72Zupg9+ou7uinpWv/FzSz2oE2Zp/PdnIFvmfis7zNJ
 P3Rp9iclPc+rsBMguDEUPJQm8Yn1SvGGtGHcdrp+KJhkV5wbrDyLG2gmCL/OgLYlrwnF1m9
 LNy0UJ3GCHEE7hTl/1RD6xsBIN/bKRXCoTcyxTI5LmvAywZVxlNm8MA7F9Ig8LsAryEJ8IL
 JZhR1dSDqg/a+ayH7Komw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2DZxdbNNvEg=:V973EefSV0sBTurrSjbpxV
 jQU+km6Ejqf5pxHtwKH72vB1tf1djYUa7BoNFYOuy6oMLBBc2lKFD8L7pTaXTQZRSMi7YOEA4
 EsoiosLuvi+P6S2qUIA3rMNLKLCtB7Z7DL7pA8787EJbeIufopjEz1q3t6YzFG+2/r1IQYa9i
 82ZBst9/aQtMBtEfkxmz26lOBOtdrM6+FyHg7hRquaU6Hf0xVlsnpq1dlWObn8A/jAJY2tTpt
 f3SBm7cgKsaDIo8NxBH8ctmTTQAJobJexlwckYnO845TnyZra38aOlLgtmE1LTYE58Wq4s0Wi
 8afqskdLbWAMGqSD2giNPXccRNVXi2oRAW++dx+0Bi7Ei+qIbZyvMzySB+re1x8PSd0+SXJdX
 3P5CjoblTIyQ+nq+V1Lx0vEr4kl+R6CMWpPD1dDTTX1D/9Y+9fRpRWkQqI9nBbz3rc2NF5qDr
 vkAbdhGVFeRtVZ3bIY99TphUJxLLxgs7tUTlMSzKm1fUtlivBnHHZZRGbjYUxDAHD0CnstdGe
 hUDaENugdUv2H2CBpMdA2XuIP/jshIVlyW/10k42jBUI1t7fsdn568K1ve/ogZavkD3zN3z5m
 z4UQ76AUypepNWO95jhVyw/6CMNqb85RDzRfcNNur5/Ip3pebOpqw3/jlpiMonfJXYjAGTvx1
 aqQyZomZbrsMcPOnAF3a9tMP/rlAA8/7LWacN9CcLH6aJhFMCtIx81Q8tnobGwuegXbmozNuT
 3Du7JQC2DH7FmNYWF/9UY2qWoPzt2WlmQaZD/6c0cAib9GFfwrM3OWUnKgofKJoAbTRXzazG7
 0hGzT3/xBez+/Q5Tv2td/wn9qH976aIT7//6piXoJxi/m1h+D3hqqXhu77qTkALJHVc2luO+C
 fo81h6PMwN8mH+yM40zDYaoJ9HrXyOdaFUCEJLczjAdyMaJLmNCD/bwGfu4WbwSG5tVTRQZtH
 x+LA9tWE85sFzgzgvZoSR44HK2VylRGPkyf0Y9R0Z86nVTEHsjrGpM9GsXcodBYdg3YZikZvI
 6jNEAr1gasikBjqNDQvni+yDf2sC3zVcbCdKY3GO9d0PcSy2F9PZDHndjzsbDaS0d+S1ZmJa4
 XXXYg9qfihxhuKn3gMbaOW3UvvBG4czf5OT7j1v2jQ7C6Vme2+oEkbP5Y/WNns5dzjpnpF8KC
 jg0WPXmnbIlBw3mgSDAAMQuvOQq+Tel0H2cwMi5xi1+4vEpEBVLBpPX6kGfIglgNCM/fIbcpa
 Vv0brossOBLeOafr315YQXWtHfxOwBASnCSDKzA==
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Arnd Bergmann <arnd@arndb.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11.10.19 02:06, Kees Cook wrote:
> Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   arch/parisc/kernel/vmlinux.lds.S | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)


Acked-by: Helge Deller <deller@gmx.de>  # parisc

Helge

>
> diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlin=
ux.lds.S
> index 12b3d7d5e9e4..53e29d88f99c 100644
> --- a/arch/parisc/kernel/vmlinux.lds.S
> +++ b/arch/parisc/kernel/vmlinux.lds.S
> @@ -19,6 +19,7 @@
>   				*(.data..vm0.pte)
>
>   #define CC_USING_PATCHABLE_FUNCTION_ENTRY
> +#define RO_EXCEPTION_TABLE_ALIGN	8
>
>   #include <asm-generic/vmlinux.lds.h>
>
> @@ -129,9 +130,6 @@ SECTIONS
>
>   	RO_DATA(8)
>
> -	/* RO because of BUILDTIME_EXTABLE_SORT */
> -	EXCEPTION_TABLE(8)
> -
>   	/* unwind info */
>   	.PARISC.unwind : {
>   		__start___unwind =3D .;
>

