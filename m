Return-Path: <linuxppc-dev+bounces-1889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE226996E38
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 16:38:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNwV34Rz0z3bbp;
	Thu, 10 Oct 2024 01:38:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728484683;
	cv=none; b=feWodECogTveYVrlttqyHjUl5H/LigzDItqJhbW2BG6jeTAnuNoAJBwTT9EMCuBBqCz7uKzB54oAun4oLR8JKPzIKstzTQu/Ff7B7dPoQxiTQvh/XNLCsriy+rvfdHwL4H6jLQnJNxfT8qIwA5G6581krTHatTrUjQV8dzHP+FznSv/e6rpSyuJXJJ+k58BPADTwvFk5lq4gNd3IQrSLZkz3cxthcawo5RKJFtE/RkMBbalFFsBHh3v8yuzOUXOMODliMzIlJHWNKAQkNVNZgIvbnXZOCCFDB1ScEQj75aY2hEI3wRpsP1nx279UFw1E/FQ26Uxqz+5aX80xw3mwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728484683; c=relaxed/relaxed;
	bh=CrDsuNQehtYkMy8f/2dKNUAeKvP/+MxQoYbLhgrt6NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ON3bCqh06/zfE+E8bdtqJlepbxBPw1yfi04/kGco1bT0Chpe4CvvlXD5ECJgSQw8QagSEWkY5itr9etEHxEvco5xbrdD82hmyNSa7EKKw7hz+ykff594KaGB8TbG9lMbVHcX0Xk0SAhn7hi/tZ0xHvI0LQ+X/f5e260txYUH6cAre5Aej7qsLG8Sy2lwOZox+9WlmCoiviSxVkxILL73aX/oq0hBwTAbRZnMG5CoNHxIj01MFTAwrL6R3BQg0e6bB423PtfoQn2PtwZSD1s/scikFQQYJ7B0wFfcN806egvYOQ0rZy/J9sSj2wMSg+3QgPISfNmc8MCaJ/d5Dwn12g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNwV241Zyz3bbm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 01:38:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XNwTw0tTFz9sPd;
	Wed,  9 Oct 2024 16:37:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPYRDQSqjFFY; Wed,  9 Oct 2024 16:37:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XNwTw03Cdz9rvV;
	Wed,  9 Oct 2024 16:37:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E33838B77C;
	Wed,  9 Oct 2024 16:37:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5YCo0KwYOorb; Wed,  9 Oct 2024 16:37:55 +0200 (CEST)
Received: from [192.168.233.133] (unknown [192.168.233.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 33B378B770;
	Wed,  9 Oct 2024 16:37:54 +0200 (CEST)
Message-ID: <f9693d48-1018-460f-a1ff-5990bcf92b66@csgroup.eu>
Date: Wed, 9 Oct 2024 16:37:53 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] asm-generic: provide generic page_to_phys and
 phys_to_page implementations
To: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org
References: <20241009114334.558004-1-hch@lst.de>
 <20241009114334.558004-2-hch@lst.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241009114334.558004-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.5 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 09/10/2024 à 13:43, Christoph Hellwig a écrit :
> page_to_phys is duplicated by all architectures, and from some strange
> reason placed in <asm/io.h> where it doesn't fit at all.
> 
> phys_to_page is only provided by a few architectures despite having a lot
> of open coded users.
> 
> Provide generic versions in <asm-generic/memory_model.h> to make these
> helpers more easily usable.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/alpha/include/asm/io.h         |  1 -
>   arch/arc/include/asm/io.h           |  3 ---
>   arch/arm/include/asm/memory.h       |  6 ------
>   arch/arm64/include/asm/memory.h     |  6 ------
>   arch/csky/include/asm/page.h        |  3 ---
>   arch/hexagon/include/asm/page.h     |  6 ------
>   arch/loongarch/include/asm/page.h   |  3 ---
>   arch/m68k/include/asm/virtconvert.h |  3 ---
>   arch/microblaze/include/asm/page.h  |  1 -
>   arch/mips/include/asm/io.h          |  5 -----
>   arch/nios2/include/asm/io.h         |  3 ---
>   arch/openrisc/include/asm/page.h    |  2 --
>   arch/parisc/include/asm/page.h      |  1 -
>   arch/powerpc/include/asm/io.h       | 12 ------------

As far as I understand, this patch silently drops part of commit 
6bf752daca07 ("powerpc: implement CONFIG_DEBUG_VIRTUAL").

Can you please clarify ?

Christophe

