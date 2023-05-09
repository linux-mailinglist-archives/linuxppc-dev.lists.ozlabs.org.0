Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2735E6FCF0D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 22:07:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QG8Mn02vJz3fXf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 06:07:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
X-Greylist: delayed 652 seconds by postgrey-1.36 at boromir; Wed, 10 May 2023 06:07:05 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QG8MF5Mcmz3cfg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 06:07:05 +1000 (AEST)
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 368ABC4E27
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 19:56:14 +0000 (UTC)
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 70DFB60005;
	Tue,  9 May 2023 19:55:53 +0000 (UTC)
Message-ID: <4adb27d2-325d-3ce0-23b1-ec69a973b4bf@ghiti.fr>
Date: Tue, 9 May 2023 21:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
Content-Language: en-US
To: Andreas Schwab <schwab@linux-m68k.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <87wn1h5nne.fsf@igel.home>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <87wn1h5nne.fsf@igel.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/9/23 21:07, Andreas Schwab wrote:
> That does not work with UEFI booting:
>
> Loading Linux 6.4.0-rc1-1.g668187d-default ...
> Loading initial ramdisk ...
> Unhandled exception: Instruction access fault
> EPC: ffffffff80016d56 RA: 000000008020334e TVAL: 0000007f80016d56
> EPC: ffffffff002d1d56 RA: 00000000004be34e reloc adjusted
> Unhandled exception: Load access fault
> EPC: 00000000fff462d4 RA: 00000000fff462d0 TVAL: ffffffff80016d56
> EPC: 00000000802012d4 RA: 00000000802012d0 reloc adjusted
>
> Code: c825 8e0d 05b3 40b4 d0ef 0636 7493 ffe4 (d783 0004)
> UEFI image [0x00000000fe65e000:0x00000000fe6e3fff] '/efi\boot\bootriscv64.efi'
> UEFI image [0x00000000daa82000:0x00000000dcc2afff]
>

I need more details please, as I have a UEFI bootflow and it works great 
(KASLR is based on a relocatable kernel and works fine in UEFI too).

Thanks,

Alex

