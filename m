Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 658DF6A0D53
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 16:52:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMyFc290dz3cdT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 02:52:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ot7dJ9+w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ot7dJ9+w;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMyDg0hwTz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 02:51:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gcaOWdjkRuwLLoyj6ZoLjXSkHlPAfZqEuB5/VEUD0fI=; b=Ot7dJ9+wvbJRfG4duiWBJQO6Oa
	9LJgmKjMl5QrQb+AQ0DQmlwvXHBYSmEL2hkbvYXUZlxWKIaJ/GGwOcY4UZHicVUC/VU4zv4QvdJZs
	779PJrDbLbfJlM6N2sP6Rw+j3ylct3XmdyAq4NXqp5hcpl+mSInonIDo1xaWZ/7lHcHB8zFfEqsen
	UVY3sqGaaodSgnmFduiFHL9w1zZY8EaoWBoCYEl8rsQ099UofjDxTP2zjkeNTid0TwCdCDiBQskw/
	z2J/tdaDa161SfEFmeYt3z+joic2U4Djt1isuaRUGUZg7VBk6uyGRGAbboHo194hRZCFOREMXFtAz
	HSDHCsBg==;
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVDs6-00H8rh-Eb; Thu, 23 Feb 2023 15:51:02 +0000
Message-ID: <7e5c3c59-68c1-eb45-d462-bb093aee5da3@infradead.org>
Date: Thu, 23 Feb 2023 07:51:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] macintosh: via-pmu-led: *********************************
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20230223014151.19270-1-rdunlap@infradead.org>
 <877cw8bvzv.fsf@mpe.ellerman.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <877cw8bvzv.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Elimar Riesebieter <riesebie@lxtec.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/23/23 00:56, Michael Ellerman wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
>> LEDS_TRIGGER_DISK depends on ATA, so selecting LEDS_TRIGGER_DISK
>> when ATA is not set/enabled causes a Kconfig warning:
>>
>> WARNING: unmet direct dependencies detected for LEDS_TRIGGER_DISK
>>   Depends on [n]: NEW_LEDS [=y] && LEDS_TRIGGERS [=y] && ATA [=n]
>>   Selected by [y]:
>>   - ADB_PMU_LED_DISK [=y] && MACINTOSH_DRIVERS [=y] && ADB_PMU_LED [=y] && LEDS_CLASS [=y]
>>
>> Fix this by making ADB_PMU_LED_DISK depend on ATA.
> 
> Should it just depend on LEDS_TRIGGER_DISK ?

Hmph. Yes, good idea. Thanks.

> 
>> Seen on both PPC32 and PPC64.
>>
>> Fixes: 0e865a80c135 ("macintosh: Remove dependency on IDE_GD_ATA if ADB_PMU_LED_DISK is selected")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Elimar Riesebieter <riesebie@lxtec.de>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> ---
>>  drivers/macintosh/Kconfig |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff -- a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
>> --- a/drivers/macintosh/Kconfig
>> +++ b/drivers/macintosh/Kconfig
>> @@ -86,6 +86,7 @@ config ADB_PMU_LED
>>  
>>  config ADB_PMU_LED_DISK
>>  	bool "Use front LED as DISK LED by default"
>> +	depends on ATA
>>  	depends on ADB_PMU_LED
>>  	depends on LEDS_CLASS
>>  	select LEDS_TRIGGERS

-- 
~Randy
