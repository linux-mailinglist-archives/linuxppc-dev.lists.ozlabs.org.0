Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2044BFAF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 15:35:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K31sf0Mq9z3cQj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 01:35:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K31s96xJzz2xWc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 01:34:37 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4K31sB1kW9z4xcZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 01:34:38 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4K31sB1gV8z4xsk; Wed, 23 Feb 2022 01:34:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4K31s96wfsz4xcZ
 for <linuxppc-dev@ozlabs.org>; Wed, 23 Feb 2022 01:34:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K31s551FPz9sSX;
 Tue, 22 Feb 2022 15:34:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BBVc7YtMM4J0; Tue, 22 Feb 2022 15:34:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K31s54G4tz9sSK;
 Tue, 22 Feb 2022 15:34:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 831AA8B778;
 Tue, 22 Feb 2022 15:34:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id p_SR_u5RjvBv; Tue, 22 Feb 2022 15:34:33 +0100 (CET)
Received: from [192.168.7.78] (unknown [192.168.7.78])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C1A68B764;
 Tue, 22 Feb 2022 15:34:33 +0100 (CET)
Message-ID: <4029503f-dbc4-cb68-5f40-771e8d0bfbc6@csgroup.eu>
Date: Tue, 22 Feb 2022 15:34:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] powerpc: Handle prefixed instructions in
 show_user_instructions()
Content-Language: fr-FR
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@ozlabs.org
References: <20200602052728.18227-1-jniethe5@gmail.com>
 <20200602052728.18227-3-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200602052728.18227-3-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/06/2020 à 07:27, Jordan Niethe a écrit :
> Currently prefixed instructions are treated as two word instructions by
> show_user_instructions(), treat them as a single instruction. '<' and
> '>' are placed around the instruction at the NIP, and for prefixed
> instructions this is placed around the prefix only. Make the '<' and '>'
> wrap the prefix and suffix.
> 
> Currently showing a prefixed instruction looks like:
> fbe1fff8 39200000 06000000 a3e30000 <04000000> f7e40000 ebe1fff8 4e800020
> 
> Make it look like:
> 0xfbe1fff8 0x39200000 0x06000000 0xa3e30000 <0x04000000 0xf7e40000> 0xebe1fff8 0x4e800020 0x00000000 0x00000000

Is it really needed to have the leading 0x ?

And is there a reason for that two 0x00000000 at the end of the new line 
that we don't have at the end of the old line ?

This is initially split into 8 instructions per line in order to fit in 
a 80 columns screen/terminal.

Could you make it such that it still fits within 80 cols ?

Same for patch 4 on show_user_instructions()

Christophe
