Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0209216DEA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 15:38:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1NnR47s0zDqG8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 23:38:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Njz1lGFzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 23:35:48 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B1Njq1JYkz9tyDq;
 Tue,  7 Jul 2020 15:35:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hCWgdyVLIS1v; Tue,  7 Jul 2020 15:35:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B1Njq0G6Sz9tyDp;
 Tue,  7 Jul 2020 15:35:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D994F8B7E3;
 Tue,  7 Jul 2020 15:35:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WKBcZEmXlIcl; Tue,  7 Jul 2020 15:35:44 +0200 (CEST)
Received: from [10.25.210.22] (po15451.idsi0.si.c-s.fr [10.25.210.22])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB8578B7D7;
 Tue,  7 Jul 2020 15:35:44 +0200 (CEST)
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
To: Giuseppe Sacco <giuseppe@sguazz.it>, linuxppc-dev@lists.ozlabs.org
References: <89e412a76350b28f791bb8a2b6f9647a034f6fc8.camel@sguazz.it>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <04544f16-fb20-54b9-e56e-47d45af03b6c@csgroup.eu>
Date: Tue, 7 Jul 2020 15:35:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <89e412a76350b28f791bb8a2b6f9647a034f6fc8.camel@sguazz.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 07/07/2020 à 14:58, Giuseppe Sacco a écrit :
> Hello,
> I am testing linux on a quite old hardware, an Apple PowerBook G4
> "Titanium IV". I used to run Debian on this machine, so I upgraded the
> old operating system to the latest software and found that new kernels
> do not boot.
> I rebuilt natively (on the powerbook) a few kernels and found that
> 5.4.50 still works fine, while 5.6.19 and 5.7.7 stop after printing:
> 
> pmac32_cpufreq: registering PowerMac CPU frequency driver
> pmac32_cpufreq: Low: 667 MHz, High: 867 Mhz, Boot: 667 MHz
> 
> no more output is printed. I waited 5 minutes and then powered off the
> machine using the power button. Rebooting with old kernel works.
> 
> So, I am looking for help. How may I better investigate the problem?
> How may I crossbuild the kernel on a faster machine (amd64) in order to
> try git-bisect without waiting ages?
> 

To crossbuild, use cross tools at 
https://mirrors.edge.kernel.org/pub/tools/crosstool/

Can you tell which defconfig you use or provide your .config

Christophe
