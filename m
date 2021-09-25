Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAEA4181E6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 14:24:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGp4g0Rvvz30J9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 22:24:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGp4D50sqz2yMG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Sep 2021 22:24:26 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HGp441jPBz9sW7;
 Sat, 25 Sep 2021 14:24:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3IbZzqePKhm; Sat, 25 Sep 2021 14:24:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HGp440gRfz9sW6;
 Sat, 25 Sep 2021 14:24:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFB3C8B76D;
 Sat, 25 Sep 2021 14:24:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nRAI_tahIF8c; Sat, 25 Sep 2021 14:24:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.8])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F1E38B763;
 Sat, 25 Sep 2021 14:24:19 +0200 (CEST)
Subject: Re: ppc32 doesn't boot when linkaddr=0x00900000
To: cp <carlojpisani@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <CA+QBN9AFNSf3+U4iMhwZx7c69MLk-BtSbVODBEA97ObYWRczbQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a2d5790b-dad3-f4a6-dbe1-ef33cbb13ff2@csgroup.eu>
Date: Sat, 25 Sep 2021 14:24:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CA+QBN9AFNSf3+U4iMhwZx7c69MLk-BtSbVODBEA97ObYWRczbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: paulus@samba.org, torvalds@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 25/09/2021 à 11:49, cp a écrit :
> hi
> I am new to this list. Hope this is the right place to ask.
> 
> I am working with a PPC405GP board, and as far as I understand, the
> support for ppc40x platforms like Acadia and Walnut were dropped with
> kernel 5.8.0, so this seems like a pretty straightforward question,
> but extensive experiments from kernel 4.11 to kernel 5.7.19 haven't
> shown a really clear, up-to-date answer.
> 
> In k4.11 .. k5.7.19, when the kernel size is bigger than 8 MB, the
> final kernel doesn't boot but rather arch/powerpc/boot/main.c dies
> before the first message from the kernel shows up.
> 
> Why?

That's the fourth time I receive your email. Please give us time to 
analyse it, there is no point in sending it again and again unless you 
have additional information to provide.

Christophe
