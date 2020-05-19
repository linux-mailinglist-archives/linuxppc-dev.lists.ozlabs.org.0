Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AF91D8EFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 07:05:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R3jg2QtTzDqvw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 15:05:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R3gy4JqhzDqml
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:03:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49R3gj4NXMz9txlm;
 Tue, 19 May 2020 07:03:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xB-gRUDv0aBm; Tue, 19 May 2020 07:03:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49R3gj3Krfz9txll;
 Tue, 19 May 2020 07:03:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6FFAB8B7A7;
 Tue, 19 May 2020 07:03:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id geU-rV9M2-aj; Tue, 19 May 2020 07:03:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E2C28B767;
 Tue, 19 May 2020 07:03:45 +0200 (CEST)
Subject: Re: [PATCH v8 12/30] powerpc: Use a function for reading instructions
To: Michael Ellerman <mpe@ellerman.id.au>, Jordan Niethe <jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-13-jniethe5@gmail.com>
 <a7005edf-cdda-4aec-b7b0-fd9f45776147@csgroup.eu>
 <CACzsE9qBXBsv0s25DWugjWUaTUZfYpHyONW5ryE4dnLKP5P7cA@mail.gmail.com>
 <877dx84liy.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <08df818c-b602-1a20-7eb4-a3e1f78188c3@csgroup.eu>
Date: Tue, 19 May 2020 07:03:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <877dx84liy.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/05/2020 à 06:05, Michael Ellerman a écrit :
> Jordan Niethe <jniethe5@gmail.com> writes:
>> On Sun, May 17, 2020 at 4:39 AM Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>>
>>> Le 06/05/2020 à 05:40, Jordan Niethe a écrit :
>>>> Prefixed instructions will mean there are instructions of different
>>>> length. As a result dereferencing a pointer to an instruction will not
>>>> necessarily give the desired result. Introduce a function for reading
>>>> instructions from memory into the instruction data type.
>>>
>>>
>>> Shouldn't this function be used in mmu_patch_addis() in mm/nohash/8xx.c ?
>>>
>>> Christophe
> 
>> Yes, that would be a good idea.
> 
>> mpe here is a fix, along with one I'll
>> post for [PATCH v8 11/30] powerpc: Use a datatype for instructions.
> 
> I didn't fold this in because I'd prefer one of you send me a patch on
> top of the series that converts that code to use the new type.
> 
> That way it can be tested separately from this big series.
> 

All this code is going away with the series implementing the use of 
hugepages for kernel mappings on 8xx 
(https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=176094) 
that I hope will go in 5.8, so there is no point in sending a patch to 
change that I guess.

Is there anything special I need to do to secure the merging of that 
series in 5.8 ?

Christophe
