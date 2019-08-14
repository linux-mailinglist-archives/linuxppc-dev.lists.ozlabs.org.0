Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FAA8CBE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 08:26:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467fj46qNBzDql6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:25:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="avbdMWC6"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467fg366CjzDqNk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:23:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467ffy4tKYz9vBn1;
 Wed, 14 Aug 2019 08:23:54 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=avbdMWC6; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id a4nZaAJs1IUV; Wed, 14 Aug 2019 08:23:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467ffy3jSmz9vBn0;
 Wed, 14 Aug 2019 08:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565763834; bh=riZMoyaCD1+ZQ3eW9ssk+3+aGprxE6J0aY0oTm8WUHk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=avbdMWC6gc6VxruvxXJGtYUHAYWYzSiS4yb5QNH+51hPcJHVoUSm6e/d/DNpYKicI
 vS8BErZ65r9GgWrakVITqUbxe3MQx1YDyYqkEDsIDZE0uQCzGij7OUCEWw2XfNC49T
 7TCdqwMlO5wSet+PmpAdKey3vLAnVDf8FPuOq+Uc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 828FD8B780;
 Wed, 14 Aug 2019 08:23:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ApWTthVaOqfG; Wed, 14 Aug 2019 08:23:55 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FC4F8B761;
 Wed, 14 Aug 2019 08:23:55 +0200 (CEST)
Subject: Re: [PATCH v1 10/10] powerpc/mm: refactor ioremap_range() and use
 ioremap_page_range()
To: Christoph Hellwig <hch@infradead.org>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
 <bd784c8091cbf41231a862f73b52fd2a356ec8f1.1565726867.git.christophe.leroy@c-s.fr>
 <20190814054941.GC27497@infradead.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3f866bc8-7cc3-cb09-92f3-016dfb906526@c-s.fr>
Date: Wed, 14 Aug 2019 08:23:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814054941.GC27497@infradead.org>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/08/2019 à 07:49, Christoph Hellwig a écrit :
> Somehow this series is missing a cover letter.
> 
> While you are touching all this "fun" can you also look into killing
> __ioremap?  It seems to be a weird non-standard version of ioremap_prot
> (probably predating ioremap_prot) that is missing a few lines of code
> setting attributes that might not even be applicable for the two drivers
> calling it.
> 

ocm_init_node() [arch/powerpc/platforms/4xx/ocm.c] calls __ioremap() 
with _PAGE_EXEC set while ioremap_prot() clears _PAGE_EXEC

Christophe
