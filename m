Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA7C13F007
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 19:19:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zCC63Z8bzDqY7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 05:19:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=an21Zn8e; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9hC3bqYzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:11:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47z9h201DnzB09bM;
 Thu, 16 Jan 2020 18:10:58 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=an21Zn8e; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fxXYyxiPaNf4; Thu, 16 Jan 2020 18:10:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47z9h13T7rzB09bJ;
 Thu, 16 Jan 2020 18:10:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579194657; bh=5dtLXCtNKGhJUQyd/wyCEmRm5b3WNzV1TRxotmvC19s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=an21Zn8ekLwlkmLLwGUJ15DgXxS8YZPshkBR8zCZ5jZ0ByHP6o/trkyfznQDPYJnx
 uJWVkrERxG3Kw8oPV65QW6TmRkOsR0PiHDheousGkkAynKSx7vuTVhsbwSxO3kx320
 ak0whw8aBoaPy3GBBA9Xi5OnSMboeIpHVspGPsi0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B2BCC8B82A;
 Thu, 16 Jan 2020 18:10:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HIp8mPxk5uIM; Thu, 16 Jan 2020 18:10:58 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A39238B82C;
 Thu, 16 Jan 2020 18:10:57 +0100 (CET)
Subject: Re: z constraint in powerpc inline assembly ?
To: Segher Boessenkool <segher@kernel.crashing.org>,
 David Laight <David.Laight@aculab.com>
References: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
 <e9af1690e51a4d89a8a5c0927eb8430a@AcuMS.aculab.com>
 <20200116162151.GR3191@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0c217c4c-51cb-d5f3-237e-4fb4e2f6532c@c-s.fr>
Date: Thu, 16 Jan 2020 18:10:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200116162151.GR3191@gate.crashing.org>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/01/2020 à 17:21, Segher Boessenkool a écrit :
> Christophe uses a very primitive 32-bit cpu, not even superscalar.  A
> loop doing adde is pretty much optimal, probably wants some unrolling
> though.

You mean the mpc8xx , but I'm also using the mpc832x which has a e300c2 
core and is capable of executing 2 insns in parallel if not in the same 
Unit.

Christophe
