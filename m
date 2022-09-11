Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D275B4F6B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Sep 2022 16:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQX2J6qJJz3bqW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 00:20:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=MlnzI02B;
	dkim=pass (2048-bit key; unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim header.b=kdSlI7Jf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.wdc.com (client-ip=68.232.143.124; helo=esa2.hgst.iphmx.com; envelope-from=prvs=2461b4889=damien.lemoal@opensource.wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=MlnzI02B;
	dkim=pass (2048-bit key; unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim header.b=kdSlI7Jf;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Mon, 12 Sep 2022 00:19:59 AEST
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQX1W6QHkz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 00:19:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1662905999; x=1694441999;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1ZeosKCdRqJre/8DiboNXUF0h0xy40H1IiMlnXbs1ts=;
  b=MlnzI02Bhp+0+V0YT73CX3YxAJRuLxK0yaPz1qk5y0DyURHu+UiD5hi2
   KZfwZycAV+WoQluPGiwoSh1zzN12ho8xAPhP/ZWk/CMzZ9xFITpqUSNWg
   rzDKlmqc4RPM2esI6A7v3RdUFEIG/0UPf3qpLjsZlbQsOrOKQGnVFM7jy
   vPYn6mGB7Gj/espwQKpK0zKqb/2KAM4HjAPlgrqOZx8wxr/4MpBwTzA1l
   0veFBF7jgUe7B/DpygWVRjUoHxDgBjVk3Cg/s9Mp5sSLpaMMGTUvGmxlj
   UqPAFEFB+Tl4VB9cTKsbBBxtxKgUltHtIVZEo9AMtV0ytHSCHokvKF5da
   g==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; 
   d="scan'208";a="315342048"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 22:18:47 +0800
IronPort-SDR: athynTdSGO/ayMxB8S/uzbj7H+IZz+Dvxkk9F9wg1jRcCrkawWd4UM97yslrydjLcbN6X4VkQS
 B5niI2feqAcGTQ+/B0lypVI1OwN7gxYB0+c6fJkBI+BYfJmun8uG3Dt4VmpMeSzDJvupcmfx2h
 ANzNgk2eUahR3/o81I+vmU7kk9ICBfuCoYj6Pb7xsH+Fdh1JcaZLitHMAr90NKng/93Ajp8N9j
 KkAa6uCU70Rg7dBxWqgyjGp+5OYw78e0nvQwI9MSW+QRrdTXhfhB7K2HYfDVVs5E0JgJ0nLmuZ
 HO29c/p9XZbIW9ao8OGQf77P
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2022 06:39:03 -0700
IronPort-SDR: Oh3byTZwVTvvZii2Mieyiwomk850Z+WYsx1bkxte1JkLVuOe8LSzVv83h3RQovjwQxquO4tiVg
 NwtWCpRDuCLI3K5VqVpbWcopygdbD17S52sBwzC55NeuT2s7D+0BwFZvIezj+4m1jzKxqCI8wX
 2KmkYMCAecXOih5tF0iA57KVoWHac6WZV/t2yf1nfotd8eR7B98t2ObDf+Q2kK8F9uBiMiBCD8
 R7tS6KoWKo7I+BCsXlUKHMxbcgBpcztstPIaX9j3jvJHLi6YDUgeqCr4ed98dfy6/ZDfd27BZT
 exQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2022 07:18:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQX064fbjz1Rwt8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Sep 2022 07:18:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1662905926; x=1665497927; bh=1ZeosKCdRqJre/8DiboNXUF0h0xy40H1IiM
	lnXbs1ts=; b=kdSlI7JfbyNofSBTMTKFN6RtIxo1BV8rLcx+MwPlgcLnZz6eg2Y
	QEEDd7Ld4w9xSFBXMfgd62zaobXpdJr5/p9V0wdugxPhMdWaqFYQ9sKtZKOkE2Ow
	ZRQCeh7q6MllILQyLuMtoHpbskyN9pA+3oRVhRJr8oKhZd9fv67b+mggdVO9o4Q8
	EZrW4l8m4dAWZeBY9ucTg/UKhpMJjwdvU9XYg7ADuFMYGZHrldLsNfAwOVzcKdgs
	FDBSZlNu9+coEGMgHAPdUpjzUCLLD0eukFrfd8aqig+3NTNIYdn+2BywadIXTwvi
	ND6JTFxc/atNoyfkTWVJNj/uFKG6VWuyhfw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xv8gfb6WrcJi for <linuxppc-dev@lists.ozlabs.org>;
	Sun, 11 Sep 2022 07:18:46 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQX024lcsz1RvLy;
	Sun, 11 Sep 2022 07:18:42 -0700 (PDT)
Message-ID: <99d7c533-f19e-a52a-e532-2a07cd78e9b9@opensource.wdc.com>
Date: Sun, 11 Sep 2022 23:18:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v2] powerpc: select HAVE_PATA_PLATFORM in PPC instead of
 creating a PPC dependency
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>
References: <20220909090343.21886-1-lukas.bulwahn@gmail.com>
 <21359abe-c3c9-4aa8-8ebf-75ff64cb1935@www.fastmail.com>
 <2379456e-4f18-d619-10bf-022327de0463@csgroup.eu>
 <4b33bffc-2b6d-46b4-9f1d-d18e55975a5a@www.fastmail.com>
 <0ad5f339-de31-2849-34a1-928ae65cc696@opensource.wdc.com>
 <c4f3d527-7e70-4077-b40b-129144d79374@www.fastmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <c4f3d527-7e70-4077-b40b-129144d79374@www.fastmail.com>
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/09/11 21:41, Arnd Bergmann wrote:
> On Sun, Sep 11, 2022, at 1:54 PM, Damien Le Moal wrote:
>> On 2022/09/09 20:31, Arnd Bergmann wrote:
>>>  
>>>  config PATA_PLATFORM
>>> -	tristate "Generic platform device PATA support"
>>> -	depends on EXPERT || PPC || HAVE_PATA_PLATFORM
>>> +	tristate "Generic platform device PATA support" if EXPERT || HAVE_PATA_PLATFORM
>>
>> Shouldn't this be:
>>
>> 	tristate "Generic platform device PATA support" if EXPERT || PPC
>>
>> ?
>>
>> And while at it, it would be nice to add "|| COMPILE_TEST" too.
> 
> The idea was that this can be selected by CONFIG_PATA_OF_PLATFORM
> in any configuration that has CONFIG_OF enabled. Since PPC
> has CONFIG_OF enabled unconditionally, there is no need to
> make this option visible separately.
> 
> Same for compile-testing: since CONFIG_OF can be enabled on
> any architecture, PATA_OF_PLATFORM is already covered by
> allmodconfig builds anywhere. The separate HAVE_PATA_PLATFORM
> is only needed for machines that want the non-OF pata-platform
> module (sh, m68k-mac, mips-sibyte arm-s3c-simtec).

Got it. Thanks for the details.

> 
>        Arnd

-- 
Damien Le Moal
Western Digital Research

