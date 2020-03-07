Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3417CD19
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 10:02:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ZJRK2hv8zDr9B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 20:02:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ZJPn0DxBzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 20:01:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=rLdYlKcb; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48ZJPm6wDVz8tF1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 20:01:32 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48ZJPm67yhz9sPk; Sat,  7 Mar 2020 20:01:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=rLdYlKcb; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48ZJPm3Rn8z9sPJ
 for <linuxppc-dev@ozlabs.org>; Sat,  7 Mar 2020 20:01:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48ZJPh5nKWzB09bK;
 Sat,  7 Mar 2020 10:01:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=rLdYlKcb; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YjQ79p_AmCTJ; Sat,  7 Mar 2020 10:01:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48ZJPh4mYfzB09bJ;
 Sat,  7 Mar 2020 10:01:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583571688; bh=3wF1uoMh2XQX42L0mI+Hcc5AlA4h7HEwVDLgAO2jbBg=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=rLdYlKcboetf5a3Zy5CLEEQ1gSxaj1aNdYkfp0UBo5JiAel8/jdN+CTjUseK9uQ55
 o7SjUp/wxsLy/SUn3y2zGWwPSmcz4iN0PWll3T2ebk3JTPsqLiJ7wElDZya765gTFR
 +MCZPTEhXL4Kbnr+xAHRVZxT1wTPFNcDomyTc1k8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 47D1E8B785;
 Sat,  7 Mar 2020 10:01:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tiuwRBZICa_F; Sat,  7 Mar 2020 10:01:29 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D5018B776;
 Sat,  7 Mar 2020 10:01:28 +0100 (CET)
Subject: Re: ppc32 panic on boot on linux-next
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Nick Desaulniers <ndesaulniers@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <CAKwvOdk=eFqRqN0KO1en9wH-NhcvwXbx_ntmUtf8h_xZSd-qKw@mail.gmail.com>
 <3702b680-a0fc-20dc-027b-518b880f9a41@c-s.fr>
Message-ID: <c084a429-9ea1-7126-f057-8647a2e0dfac@c-s.fr>
Date: Sat, 7 Mar 2020 10:00:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3702b680-a0fc-20dc-027b-518b880f9a41@c-s.fr>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/03/2020 à 09:42, Christophe Leroy a écrit :
> 
> 
> Le 06/03/2020 à 20:05, Nick Desaulniers a écrit :
>> As a heads up, our CI went red last night, seems like a panic from
>> free_initmem?  Is this a known issue?
> 
> Thanks for the heads up.
> 
> No such issue with either 8xx or book3s/32.
> 
> I've now been able to reproduce it with bamboo QEMU.
> 
> Reverting 2efc7c085f05 makes it disappear. I'll investigate.
> 

Ok, I found the problem. virt_to_kpte() lacks a NULL pmd check. I'll 
send a patch for that.

However, if there is no PMD I guess this area is mapped through some 
kind of block mapping. Therefore it should bail out of the function through:

	if (v_block_mapped(address))
		return 0;


Can someone who knows BOOKE investigate that ?

Christophe
