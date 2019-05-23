Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA0728635
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 20:59:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458zLy29FxzDqdc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 04:59:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="dJuJaIP9"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458zKj2jBdzDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 04:58:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458zKd3HMlzB09Zg;
 Thu, 23 May 2019 20:58:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dJuJaIP9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uerfZO1uIocw; Thu, 23 May 2019 20:58:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458zKd20PmzB09Zf;
 Thu, 23 May 2019 20:58:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558637893; bh=/pJKg62Qcc7neDqGxc6BXb9I0aurpmtVSccNASUHRI0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dJuJaIP9S9dlQCOcNfUe0l057Y1+FA/bbTmVtpyrsJiiLhso3ah/GSy55EGpnA1l6
 W2/aLhqVRkIZgHC9TfMEji7kWaZuZDIB8FnAv30dF11/wwcNbKH81Ve1KlOq7tr4TX
 LKepxwKV/weTlthSb/uDFsoV9+AHhvFf/zi2hJ48=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 545F88B875;
 Thu, 23 May 2019 20:58:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id piQvM3Hqxltm; Thu, 23 May 2019 20:58:13 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DB828B869;
 Thu, 23 May 2019 20:58:12 +0200 (CEST)
Subject: Re: [BISECTED] kexec regression on PowerBook G4
To: Aaro Koskinen <aaro.koskinen@iki.fi>
References: <20190521221859.GC3621@darkstar.musicnaut.iki.fi>
 <90f3557b-400b-60b5-9ff8-d5605adeee79@c-s.fr>
 <a8f8a0d7-1737-4c83-4587-8d4dc87c3ecb@c-s.fr>
 <20190522201310.GB456@darkstar.musicnaut.iki.fi>
 <20190522223335.Horde.JIF8kbX8AwL8wErArEvEcg1@messagerie.si.c-s.fr>
 <20190522211724.GC456@darkstar.musicnaut.iki.fi>
 <a3619327-14ba-ff34-913f-cf3384284c9a@c-s.fr>
 <20190523172717.GA5234@darkstar.musicnaut.iki.fi>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <dc24cfa0-cefa-3245-a9aa-5493b094ffac@c-s.fr>
Date: Thu, 23 May 2019 20:58:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523172717.GA5234@darkstar.musicnaut.iki.fi>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/05/2019 à 19:27, Aaro Koskinen a écrit :
> Hi,
> 
> On Thu, May 23, 2019 at 07:33:38AM +0200, Christophe Leroy wrote:
>> Ok, the Oops confirms that the error is due to executing the kexec control
>> code which is located outside the kernel text area.
>>
>> My yesterday's proposed change doesn't work because on book3S/32, NX
>> protection is based on setting segments to NX, and using IBATs for kernel
>> text.
>>
>> Can you try the patch I sent out a few minutes ago ?
>> (https://patchwork.ozlabs.org/patch/1103827/)
> 
> It now crashes with "BUG: Unable to handle kernel instruction fetch"
> and the faulting address is 0xef13a000.
> 

Ok.

Can you try with both changes at the same time, ie the mtsrin(...) and 
the change_page_attr() ?

I suspect that allthough the HW is not able to check EXEC flag, the SW 
will check it before loading the hash entry.

Christophe
