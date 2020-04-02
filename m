Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 290AB19C8E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 20:37:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tWyS2mkYzDrdC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 05:37:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=sDk1SEu9; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tWvn1ZGmzDrL5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 05:35:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48tWvg1mkHz9v0Dy;
 Thu,  2 Apr 2020 20:35:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=sDk1SEu9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vGOZxJA0GbEI; Thu,  2 Apr 2020 20:35:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48tWvg0JMhz9v0Dw;
 Thu,  2 Apr 2020 20:35:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585852511; bh=xsC8tyWdt4REunwIPC9Ykpfqa7PmWmLgFHcC/3QwWiI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sDk1SEu9KbD6+CPdF0zQdsnvsipGxinh4BheDbsyX0gJNOiz0wAI5K5LR+I3/MHti
 35Ooqvvfdd3pLQjLA0XRgV6pk+vqfu0AWlt+UcxdPIGsv/3guu0uVJqZMMdK3Fj+Mc
 IwU+7wszU6q2Km78BzOoHqXbJI3ksTWTIYia0lfk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E3E978B940;
 Thu,  2 Apr 2020 20:35:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yvBrCbyn7qgh; Thu,  2 Apr 2020 20:35:10 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE3238B925;
 Thu,  2 Apr 2020 20:35:09 +0200 (CEST)
Subject: Re: [PATCH RESEND 1/4] uaccess: Add user_read_access_begin/end and
 user_write_access_begin/end
To: Al Viro <viro@zeniv.linux.org.uk>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
 <20200402162942.GG23230@ZenIV.linux.org.uk>
 <67e21b65-0e2d-7ca5-7518-cec1b7abc46c@c-s.fr>
 <20200402175032.GH23230@ZenIV.linux.org.uk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <24095989-57be-332c-f08c-acb1672c7e6f@c-s.fr>
Date: Thu, 2 Apr 2020 20:35:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402175032.GH23230@ZenIV.linux.org.uk>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 keescook@chromium.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 airlied@linux.ie, hpa@zytor.com, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, daniel@ffwll.ch, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/04/2020 à 19:50, Al Viro a écrit :
> On Thu, Apr 02, 2020 at 07:03:28PM +0200, Christophe Leroy wrote:
> 
>> user_access_begin() grants both read and write.
>>
>> This patch adds user_read_access_begin() and user_write_access_begin() but
>> it doesn't remove user_access_begin()
> 
> Ouch...  So the most generic name is for the rarest case?
>   

I can add another patch at the end of the series to rename 
user_access_begin() to user_full_access_begin().

Would it suit you ?

Christophe
