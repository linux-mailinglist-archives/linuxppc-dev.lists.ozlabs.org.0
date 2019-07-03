Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE05E583
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 15:30:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f26C1J8GzDqGJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:30:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="rUe2uflj"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f1tW2G1lzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 23:20:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45f1tQ3cLGz9v01x;
 Wed,  3 Jul 2019 15:19:58 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=rUe2uflj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iKri1vSda-LR; Wed,  3 Jul 2019 15:19:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45f1tQ2YQzz9v01w;
 Wed,  3 Jul 2019 15:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562159998; bh=jgQROG+UEH6/opA6KH5Z7+riscQwAjL4quybFcDWmgk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rUe2ufljgQWRO0cVg4/ZfJuTFMKu/q27D4zizFbvQKzj72busF8AJLTiuA7789/mJ
 Bhn3nszxOJm9oNl8AR3cwwDd0eyy09eNtdu2vh7UJkq1EEsJ9MfMo1OevAs4uNyN5i
 1UgsFWWcKDnFg8xNDQc5WySBFMZ3ddFXKDt8yAdQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C860F8B815;
 Wed,  3 Jul 2019 15:19:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id y3m8qO8lx4v5; Wed,  3 Jul 2019 15:19:59 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 81E668B811;
 Wed,  3 Jul 2019 15:19:59 +0200 (CEST)
Subject: Re: [PATCH 09/30] macintosh: Use kmemdup rather than duplicating its
 implementation
To: Fuqian Huang <huangfq.daxian@gmail.com>
References: <20190703131452.25085-1-huangfq.daxian@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d8ef6578-d879-9222-3feb-92264b8275ec@c-s.fr>
Date: Wed, 3 Jul 2019 15:19:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703131452.25085-1-huangfq.daxian@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/07/2019 à 15:14, Fuqian Huang a écrit :
> kmemdup is introduced to duplicate a region of memory in a neat way.
> Rather than kmalloc/kzalloc + memset, which the programmer needs to
> write the size twice (sometimes lead to mistakes), kmemdup improves
> readability, leads to smaller code and also reduce the chances of mistakes.
> Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.

s/memset/memcpy/

> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>   drivers/macintosh/adbhid.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
> index 75482eeab2c4..5d14bebfb58f 100644
> --- a/drivers/macintosh/adbhid.c
> +++ b/drivers/macintosh/adbhid.c
> @@ -789,7 +789,8 @@ adbhid_input_register(int id, int default_id, int original_handler_id,
>   
>   	switch (default_id) {
>   	case ADB_KEYBOARD:
> -		hid->keycode = kmalloc(sizeof(adb_to_linux_keycodes), GFP_KERNEL);
> +		hid->keycode = kmemdup(adb_to_linux_keycodes,
> +			sizeof(adb_to_linux_keycodes), GFP_KERNEL);
>   		if (!hid->keycode) {
>   			err = -ENOMEM;
>   			goto fail;
> @@ -797,8 +798,6 @@ adbhid_input_register(int id, int default_id, int original_handler_id,
>   
>   		sprintf(hid->name, "ADB keyboard");
>   
> -		memcpy(hid->keycode, adb_to_linux_keycodes, sizeof(adb_to_linux_keycodes));
> -
>   		switch (original_handler_id) {
>   		default:
>   			keyboard_type = "<unknown>";
> 
