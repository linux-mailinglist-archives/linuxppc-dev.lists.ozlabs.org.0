Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA234974A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 17:49:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5rfm6m8Fz30RJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 03:49:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5rfS359qz30GS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 03:49:00 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F5rfJ1LMLz9v0Tr;
 Thu, 25 Mar 2021 17:48:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8E2yADwbS1pf; Thu, 25 Mar 2021 17:48:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F5rfH6SkKz9v0Tq;
 Thu, 25 Mar 2021 17:48:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B00F28B864;
 Thu, 25 Mar 2021 17:48:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0v7QB_g-sjej; Thu, 25 Mar 2021 17:48:56 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A779B8B862;
 Thu, 25 Mar 2021 17:48:54 +0100 (CET)
Subject: Re: VDSO ELF header
To: Laurent Dufour <ldufour@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <c45ae4f8-1cbc-c687-b6a2-9a431fafc85c@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9366c258-127f-f105-abd1-6baa9a6745c5@csgroup.eu>
Date: Thu, 25 Mar 2021 17:46:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c45ae4f8-1cbc-c687-b6a2-9a431fafc85c@linux.ibm.com>
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

Hi Laurent

Le 25/03/2021 à 17:11, Laurent Dufour a écrit :
> Hi Christophe,
> 
> Since v5.11 and the changes you made to the VDSO code, it no more exposing the ELF header at the 
> beginning of the VDSO mapping in user space.
> 
> This is confusing CRIU which is checking for this ELF header cookie 
> (https://github.com/checkpoint-restore/criu/issues/1417).

How does it do on other architectures ?

> 
> I'm not an expert in loading and ELF part and reading the change you made, I can't identify how this 
> could work now as I'm expecting the loader to need that ELF header to do the relocation.

I think the loader is able to find it at the expected place.

> 
>  From my investigation it seems that the first bytes of the VDSO area are now the vdso_arch_data.
> 
> Is the ELF header put somewhere else?
> How could the loader process the VDSO without that ELF header?
> 

Like most other architectures, we now have the data section as first page and the text section 
follows. So you will likely find the elf header on the second page.

Done in this commit: https://github.com/linuxppc/linux/commit/511157ab641eb6bedd00d62673388e78a4f871cf


Christophe
