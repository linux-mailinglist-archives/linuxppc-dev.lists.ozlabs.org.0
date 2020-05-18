Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F3D1D7AB2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 16:07:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qgng06sWzDqcF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 00:07:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qghw2LWdzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 00:03:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49Qghb3wQZz9txcb;
 Mon, 18 May 2020 16:03:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ecDUsfEJPyZz; Mon, 18 May 2020 16:03:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49Qghb2R4dz9txcV;
 Mon, 18 May 2020 16:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30A788B7A5;
 Mon, 18 May 2020 16:03:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dT-3nH1wsufZ; Mon, 18 May 2020 16:03:18 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7ABCC8B76A;
 Mon, 18 May 2020 16:03:17 +0200 (CEST)
Subject: Re: [Regression 5.7-rc1] Random hangs on 32-bit PowerPC (PowerBook6,7)
To: Rui Salvaterra <rsalvaterra@gmail.com>
References: <CALjTZvZ69v3Z=8MY28F+p8v8_Z5e+7NrH0PAJ7TGD9kh6Ab7bw@mail.gmail.com>
 <3729805f-2638-6f0e-55fa-bd7d5c173899@csgroup.eu>
 <CALjTZvZ0gjZOpx7GuJ4ccawqpyOjr4N_C7UCQQHrrFR1Ojrh4g@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d4f02b20-8b3e-fd88-6857-c2e4dc7786da@csgroup.eu>
Date: Mon, 18 May 2020 14:03:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CALjTZvZ0gjZOpx7GuJ4ccawqpyOjr4N_C7UCQQHrrFR1Ojrh4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On 05/18/2020 01:25 PM, Rui Salvaterra wrote:
> Hi, Christophe,
> 
> On Mon, 18 May 2020 at 12:50, Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> Can you provide your .config, tell which GCC version you are using, and
>> tell a bit more about your config: amount of RAM, is there swap, etc ...
> 
> Ok, so this laptop has 1.5 GiB of RAM, with swap on zram (zstd
> compression, no backing device, no additional swap devices). I'm
> cross-compiling on my dual-core Power Mac G5 (since it's much faster
> than the iBook), running Debian ppc64, with GCC 9.3.0. Both 5.6 (good)
> and 5.7-rc1 (bad) configs are attached.
> 

Can you try reverting 697ece78f8f749aeea40f2711389901f0974017a ? It may 
have broken swap.

Christophe
