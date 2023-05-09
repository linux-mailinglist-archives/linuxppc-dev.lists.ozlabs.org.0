Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 312216FCE59
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 21:14:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QG7BB0VZbz3fQK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 05:14:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
X-Greylist: delayed 342 seconds by postgrey-1.36 at boromir; Wed, 10 May 2023 05:13:44 AEST
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QG79h4d3Yz3fLj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 05:13:44 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4QG72v0NH2z1r2sF;
	Tue,  9 May 2023 21:07:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4QG72t5sZZz1qqlS;
	Tue,  9 May 2023 21:07:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id yso-XuuckmCF; Tue,  9 May 2023 21:07:49 +0200 (CEST)
X-Auth-Info: w4NQfO3soUsw8RkOB5e7u4hvvdQvUWQgRbXNQVjJq0PodgIkJvk8KeWFGS7X8Z2g
Received: from igel.home (aftr-62-216-205-77.dynamic.mnet-online.de [62.216.205.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  9 May 2023 21:07:49 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 463252C1D3C; Tue,  9 May 2023 21:07:49 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <20230215143626.453491-2-alexghiti@rivosinc.com> (Alexandre
	Ghiti's message of "Wed, 15 Feb 2023 15:36:24 +0100")
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
	<20230215143626.453491-2-alexghiti@rivosinc.com>
X-Yow: I want EARS!  I want two ROUND BLACK EARS to make me feel warm 'n
 secure!!
Date: Tue, 09 May 2023 21:07:49 +0200
Message-ID: <87wn1h5nne.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

That does not work with UEFI booting:

Loading Linux 6.4.0-rc1-1.g668187d-default ...
Loading initial ramdisk ...
Unhandled exception: Instruction access fault
EPC: ffffffff80016d56 RA: 000000008020334e TVAL: 0000007f80016d56
EPC: ffffffff002d1d56 RA: 00000000004be34e reloc adjusted
Unhandled exception: Load access fault
EPC: 00000000fff462d4 RA: 00000000fff462d0 TVAL: ffffffff80016d56
EPC: 00000000802012d4 RA: 00000000802012d0 reloc adjusted

Code: c825 8e0d 05b3 40b4 d0ef 0636 7493 ffe4 (d783 0004)
UEFI image [0x00000000fe65e000:0x00000000fe6e3fff] '/efi\boot\bootriscv64.efi'
UEFI image [0x00000000daa82000:0x00000000dcc2afff]

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
