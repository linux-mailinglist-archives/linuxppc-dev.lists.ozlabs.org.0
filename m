Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 576F8290637
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 15:23:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCRfl6cgxzDqWd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 00:23:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCRYC1TMhzDqMW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 00:18:22 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CCRY41Zymz9vBmK;
 Fri, 16 Oct 2020 15:18:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WcPndnQa-D6T; Fri, 16 Oct 2020 15:18:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CCRY40LN6z9vBmJ;
 Fri, 16 Oct 2020 15:18:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FD298B849;
 Fri, 16 Oct 2020 15:18:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LwNT5LCO5_Ue; Fri, 16 Oct 2020 15:18:17 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 39B498B83E;
 Fri, 16 Oct 2020 15:18:17 +0200 (CEST)
Subject: Re: [PATCH 1/8] powerpc/uaccess: Add unsafe_copy_from_user
To: Christoph Hellwig <hch@infradead.org>,
 "Christopher M. Riedl" <cmr@codefail.de>
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-2-cmr@codefail.de>
 <20201016065403.GA9343@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <479b67b8-0caf-ebcb-433d-5739d71bdadf@csgroup.eu>
Date: Fri, 16 Oct 2020 15:18:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201016065403.GA9343@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/10/2020 à 08:54, Christoph Hellwig a écrit :
> On Thu, Oct 15, 2020 at 10:01:52AM -0500, Christopher M. Riedl wrote:
>> Implement raw_copy_from_user_allowed() which assumes that userspace read
>> access is open. Use this new function to implement raw_copy_from_user().
>> Finally, wrap the new function to follow the usual "unsafe_" convention
>> of taking a label argument. The new raw_copy_from_user_allowed() calls
>> __copy_tofrom_user() internally, but this is still safe to call in user
>> access blocks formed with user_*_access_begin()/user_*_access_end()
>> since asm functions are not instrumented for tracing.
> 
> Please also add a fallback unsafe_copy_from_user to linux/uaccess.h
> so this can be used as a generic API.
> 

I guess this can be done in a separate patch independant of that series ?

Christophe
