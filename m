Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5619634AEAE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 19:41:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6W5d2BPKz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 05:41:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6W5J2DWQz3btd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 05:41:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6W571F7Rz9txcv;
 Fri, 26 Mar 2021 19:40:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Wu7mniZUHuh3; Fri, 26 Mar 2021 19:40:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6W57006Hz9txct;
 Fri, 26 Mar 2021 19:40:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF6D08B8CF;
 Fri, 26 Mar 2021 19:41:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6XkiR1gRNkaA; Fri, 26 Mar 2021 19:41:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5DE808B8C7;
 Fri, 26 Mar 2021 19:41:00 +0100 (CET)
Subject: Re: VDSO ELF header
To: Dmitry Safonov <0x7f454c46@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Laurent Dufour <ldufour@linux.ibm.com>
References: <c45ae4f8-1cbc-c687-b6a2-9a431fafc85c@linux.ibm.com>
 <9366c258-127f-f105-abd1-6baa9a6745c5@csgroup.eu>
 <5b03e966-2cfd-5f0c-c48d-dea5e0001833@linux.ibm.com>
 <30c51951-332b-7aa8-13ba-44a0b6ae3498@linux.ibm.com>
 <87blb6gpkj.fsf@mpe.ellerman.id.au>
 <c7e0568f-786b-2c1c-fb6d-cd804bc1b539@csgroup.eu>
 <e8c2b4b5-f0b6-945e-4a42-c2308dd719a2@gmail.com>
 <3ce8811a-9216-6164-cdf2-974b13e400d3@csgroup.eu>
 <edf2547f-4705-764b-dadd-3ec1d2a6b8b3@gmail.com>
 <4904769a-be42-cdd2-1d97-8b1889f7f723@csgroup.eu>
 <46e49770-04ee-2455-f2f7-b3915ceea38a@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ec257b8b-d611-bbf4-86f3-bb0b758dbeaf@csgroup.eu>
Date: Fri, 26 Mar 2021 19:40:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <46e49770-04ee-2455-f2f7-b3915ceea38a@gmail.com>
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



Le 26/03/2021 à 18:11, Dmitry Safonov a écrit :
> On 3/26/21 5:07 PM, Christophe Leroy wrote:
>> No, the problem is that user access has to be allowed for the flush()
>>
>> A hacky solution would be to call user_access_begin() , will test that
>> later
> 
> Yeah, cool.
> 
> Will it be fine if I send the vvar patch with your Tested-by?
> 

Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

With the user access fixed on the flush, it sigreturn_vdso selftest is a success. I'll send a patch 
for it in the coming days.

What is the status of your series which adds generic vdso_base tracking ?

Christophe
