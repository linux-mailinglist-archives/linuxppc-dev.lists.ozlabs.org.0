Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4D470A207
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 23:49:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNL914hTyz3fPg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 07:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNL8T4tQrz3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 07:49:11 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4QNL8F1tK7z1sG8n;
	Fri, 19 May 2023 23:49:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4QNL8D5nw0z1qqlY;
	Fri, 19 May 2023 23:49:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id XyLPMARxDKv3; Fri, 19 May 2023 23:48:59 +0200 (CEST)
X-Auth-Info: UdoOlGJyC/tj1C8t/F+qwKRDlPRVzwm7sF3nVhFHfZv+Z8M1psgK2wdJJpzQJ6gi
Received: from igel.home (aftr-62-216-205-130.dynamic.mnet-online.de [62.216.205.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 19 May 2023 23:48:59 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 79E822C1CCF; Fri, 19 May 2023 23:48:59 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <6fc7f0e1-0dde-9b41-0d60-6b0bd65bb630@ghiti.fr> (Alexandre
	Ghiti's message of "Fri, 19 May 2023 13:08:12 +0200")
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
	<20230215143626.453491-2-alexghiti@rivosinc.com>
	<87wn1h5nne.fsf@igel.home>
	<4adb27d2-325d-3ce0-23b1-ec69a973b4bf@ghiti.fr>
	<87ttwi91g0.fsf@igel.home>
	<6fc7f0e1-0dde-9b41-0d60-6b0bd65bb630@ghiti.fr>
X-Yow: YOW!!  Up ahead!  It's a DONUT HUT!!
Date: Fri, 19 May 2023 23:48:59 +0200
Message-ID: <87sfbsvvp0.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mai 19 2023, Alexandre Ghiti wrote:

> I have tested the following patch successfully, can you give it a try
> while I make sure this is the only place I forgot to add the -fno-pie
> flag?
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fbdccc21418a..153864e4f399 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -23,6 +23,10 @@ ifdef CONFIG_FTRACE
>  CFLAGS_REMOVE_alternative.o = $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_cpufeature.o = $(CC_FLAGS_FTRACE)
>  endif
> +ifdef CONFIG_RELOCATABLE
> +CFLAGS_alternative.o += -fno-pie
> +CFLAGS_cpufeature.o += -fno-pie
> +endif
>  ifdef CONFIG_KASAN
>  KASAN_SANITIZE_alternative.o := n
>  KASAN_SANITIZE_cpufeature.o := n

I can confirm that this fixes the crash.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
