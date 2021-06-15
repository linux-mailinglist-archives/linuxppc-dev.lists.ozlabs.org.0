Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF63A77B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:11:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zy02RfHz3cCw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:11:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3zxf2pVkz2xYt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:11:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G3zxZ6l8PzB9cj;
 Tue, 15 Jun 2021 09:10:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xd2TKTQK8ov2; Tue, 15 Jun 2021 09:10:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G3zxZ5qcLzB9VY;
 Tue, 15 Jun 2021 09:10:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B8BD8B7A5;
 Tue, 15 Jun 2021 09:10:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Tr_kw5KW1-Uj; Tue, 15 Jun 2021 09:10:58 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C5F38B7A3;
 Tue, 15 Jun 2021 09:10:58 +0200 (CEST)
Subject: Re: [PATCH 6/7] powerpc/uaccess: Add unsafe_clear_user()
To: Christoph Hellwig <hch@infradead.org>
References: <b813c1f4d3dab2f51300eac44d99029aa8e57830.1623739212.git.christophe.leroy@csgroup.eu>
 <67eedb69ca81e5a4b16459a4c61f99e64cb42675.1623739212.git.christophe.leroy@csgroup.eu>
 <YMhOYKM5+s0wUoeP@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1940d0cc-1aea-07d0-95e6-8d63047e4d9e@csgroup.eu>
Date: Tue, 15 Jun 2021 09:10:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMhOYKM5+s0wUoeP@infradead.org>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/06/2021 à 08:53, Christoph Hellwig a écrit :
> On Tue, Jun 15, 2021 at 06:41:02AM +0000, Christophe Leroy wrote:
>> Implement unsafe_clear_user() for powerpc.
>> It's a copy/paste of unsafe_copy_to_user() with value 0 as source.
>>
>> It may be improved in a later patch by using 'dcbz' instruction
>> to zeroize full cache lines at once.
> 
> Please add this to common code insted of making it powerpc specific.
> 

A common version is added in previous patch.

Just like unsafe_copy_to_user(), unsafe_clear_user() needs to be arch defined.

unsafe_copy_to_user() has both an x86 implementation and a powerpc implementation, why do different ?

I can't see how it could be not powerpc specific. At the end we want to use 'dcbz' to zeroize full 
cachelines at once, even if at the time being that's a simple write of 0.
