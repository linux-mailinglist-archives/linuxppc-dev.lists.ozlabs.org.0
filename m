Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5627198000
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 18:25:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DCgJ35c8zDr75
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 02:25:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Hz2kNPw8"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DCdC1SK4zDr6t
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 02:23:08 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46DCd22nPsz9v10G;
 Wed, 21 Aug 2019 18:23:02 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Hz2kNPw8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id siRRwpmUyLes; Wed, 21 Aug 2019 18:23:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46DCd21mbWz9v101;
 Wed, 21 Aug 2019 18:23:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566404582; bh=wWdX8V4tIprKm649TEcouwLIFdqYRK6BpqVXUuesDfw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Hz2kNPw8kypCKKMqUsyyE9SrZHd98U+RnX5kqTU51CPZlG0dYfXV8U/V7bacGGirI
 rqS5K1krZijWYdSSh8ROW+vrhLMuQJJT2GgePex84dQQAGP7yaTPpdz3q7V6q2gwfR
 VY1ohX4i+tEwdmTfr/ZwB5YGquj/yAdfaVaXTp2E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C2E28B7F9;
 Wed, 21 Aug 2019 18:23:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6PsZAIo-yA6X; Wed, 21 Aug 2019 18:23:04 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82BDF8B7F8;
 Wed, 21 Aug 2019 18:23:04 +0200 (CEST)
Subject: Re: [PATCH] powerpc/vdso64: inline __get_datapage()
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <6662919bd80773aaf339e85b14af1ea1ddbfd841.camel@kernel.crashing.org>
 <20190821092959.16066-1-santosh@fossix.org>
 <20190821114423.GC31406@gate.crashing.org>
 <b7cc5d77-dfca-1cf7-f316-636a4f603b04@c-s.fr>
 <20190821121517.GD31406@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <6108a7ed-b4f9-f02f-ca63-1d663bda4990@c-s.fr>
Date: Wed, 21 Aug 2019 18:23:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821121517.GD31406@gate.crashing.org>
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/08/2019 à 14:15, Segher Boessenkool a écrit :
> On Wed, Aug 21, 2019 at 01:50:52PM +0200, Christophe Leroy wrote:
>> Do you have any idea on how to avoid that bcl/mflr stuff ?
> 
> Do a load from some fixed address?  Maybe an absolute address, even?
> lwz r3,-12344(0)  or similar (that address is in kernel space...)
> 
> There aren't many options, and certainly not many *good* options!
> 

IIUC, the VDSO is seen by apps the same way as a dynamic lib. Couldn't 
the relocation be done only once when the app loads the VDSO as for a 
regular .so lib ?

It looks like it is what others do, at least x86 and arm64, unless I 
misunderstood their code.

Christophe
