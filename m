Return-Path: <linuxppc-dev+bounces-5801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C52A26F8E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 11:50:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnKrc6hdWz2xKd;
	Tue,  4 Feb 2025 21:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738666208;
	cv=none; b=MXi+6/7O73Wian2tiAQ5/kKqiKvVFRko7ay9OyaVINzy20WTTzPQfaQf1EueSW19j4/Ipo0/Drmpwk0NfyydtU/IKUOrYKMRv2q6mWKsFvE8jvphJy1AcHXftpY6ydqCUYzBC++RWwozAAM5aVPj7J0/SzU5OaMLsPqVuMWNnmUgoYNHmlAm1KFXFDDL9czdOiZYm2YK5H6LJ2R1K6qtQEHRxZFZKyk/wjSWDQnc7lBbWmnCxZZjQMWZfVUIs0JOATn+SiYIBSh9CpHprwux1Ca/3jFWcnZWKf0IuTAKl1pKuC2ou8JY7wvaKUzE1KjP1NceMHgVWoE9E8VuXAGi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738666208; c=relaxed/relaxed;
	bh=NeGqeAkVd58QOieHg7z9vQ4aKrZGCj0r4/xkUB+AmGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6foyu1bPZBUweQAmOJ1DU5tO7L3zOef++OAHsL+EQ3VdhgLEkCxBA+yc1T8fiTZW+g+etwQxkfedvK85J7W9kdjQ/ZEPPqFDn0mX3L+ns8NokDlHLbiH6Gj1AjraroaOSou+uYDp9nWFpvSrLQlc/N4dFNx614t8FHKTJ7yFxvClxMiMkT9DFBw2Thm7HYkLb21HHUpWnCv3YBC22E15EnriY3TkNUo04Pfjb+1u5mGG4Sp5+KK5f2ZsFuwVtQXoJy7vWBXtpOioScle86p3+inW+OZLBZvbFFD1lXhdvET7XIOI8yyxZiwyKJcYe2U2Orq2NuFF0ReBcwwRIC8Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnKrb6gwxz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 21:50:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YnKMG2FKcz9sSt;
	Tue,  4 Feb 2025 11:28:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nakPMojepx3o; Tue,  4 Feb 2025 11:28:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YnKMG1Gs0z9sSs;
	Tue,  4 Feb 2025 11:28:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 072108B765;
	Tue,  4 Feb 2025 11:28:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NK-EmQCOU3lI; Tue,  4 Feb 2025 11:28:09 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E9F88B763;
	Tue,  4 Feb 2025 11:28:09 +0100 (CET)
Message-ID: <1394492b-0e18-4b47-b5d7-3b8744eeb897@csgroup.eu>
Date: Tue, 4 Feb 2025 11:28:09 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] powerpc/time: Export boot_tb and log initial
 timebase at boot
To: Kajol Jain <kjain@linux.ibm.com>, maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, disgoel@linux.ibm.com,
 hbathini@linux.ibm.com, adubey@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, aboorvad@linux.ibm.com
References: <20250204063948.643852-1-kjain@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250204063948.643852-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 04/02/2025 à 07:39, Kajol Jain a écrit :
> From: Aboorva Devarajan <aboorvad@linux.ibm.com>
> 
> - Export `boot_tb` for external use, this is useful in perf vpa-dtl
>    interface, where `boot_tb` can be used to convert raw timebase
>    values to it's relative boot timestamp.

A modification of boot_tb can be catastrophic. I would not export it as 
is as it doesn't need to be modified, would be better to provide it 
through an accessor, for instance a function called get_boot_tb()

By the way, it is only modified by time_init() which is an __init 
function, so boot_tb should be marked __ro_after_init instead of 
__read_mostly, then in that case it would be more acceptable to export it.

> 
> - Log the initial timebase at `time_init` as it is a useful
>    information which can be referred to as needed.
> 
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/time.h | 1 +
>   arch/powerpc/kernel/time.c      | 4 +++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 9bdd8080299b..b6fc5df01d53 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -23,6 +23,7 @@ extern u64 decrementer_max;
>   extern unsigned long tb_ticks_per_jiffy;
>   extern unsigned long tb_ticks_per_usec;
>   extern unsigned long tb_ticks_per_sec;
> +extern u64 boot_tb;
>   extern struct clock_event_device decrementer_clockevent;
>   extern u64 decrementer_max;
>   
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 0727332ad86f..6e8548f0e48f 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -137,7 +137,8 @@ EXPORT_SYMBOL_GPL(rtc_lock);
>   
>   static u64 tb_to_ns_scale __read_mostly;
>   static unsigned tb_to_ns_shift __read_mostly;
> -static u64 boot_tb __read_mostly;
> +u64 boot_tb __read_mostly;
> +EXPORT_SYMBOL_GPL(boot_tb);
>   
>   extern struct timezone sys_tz;
>   static long timezone_offset;
> @@ -943,6 +944,7 @@ void __init time_init(void)
>   	tb_to_ns_shift = shift;
>   	/* Save the current timebase to pretty up CONFIG_PRINTK_TIME */
>   	boot_tb = get_tb();
> +	pr_debug("%s: timebase at boot: %llu\n", __func__, (unsigned long long)boot_tb);
>   
>   	/* If platform provided a timezone (pmac), we correct the time */
>   	if (timezone_offset) {


