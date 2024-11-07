Return-Path: <linuxppc-dev+bounces-2960-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D49BFECE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 08:11:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkYCX4t5Lz3bk1;
	Thu,  7 Nov 2024 18:11:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730963496;
	cv=none; b=QOzxhTvMTF6iqE/+C9bwUhgTBe6VDCQ/C9Vt0+A33+Xqlu3bxE/Raneq9aQkI8GTONQ9Qazw7e8eqR51E6AKN/+Eo7bIpjd6/c+o/7tM8JkIc45LVHHSIC4haOeXUS4DVkz597JiEFxVXVMKFZGNXnQ9GWKtS1gMFWnRIDT3aIvBUAvU7hLDbWUvVKuM7Jf/njSNZ/Gw8raurHTzG2Nkv6qyufY3dkn/KpqUkNp98tpaUz/szSEPaQgCZjNwGJeV8OxxWWc07DSviZtTFg2bC7Z9a+2pVf760l5Ran9pDPI3+YZpq/yKcIiKGK1a3WMJM0r9VXIV7sseQh4EakAuxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730963496; c=relaxed/relaxed;
	bh=GpLIFVWN5gATLV42VRAls+WEd25FgordcYXrWIv/Y2s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=no6Pjj9ysoqmD+wMzJ35zU/aVdOxSHqQK/2vh7cPhuyuvltHCmlECpruQoUIo6DVj5pirh9rudjzTsRhh7CsCf5Wb1V0DeTj0f9qnMXmYu+2o/h1W8I3lo8pKfc1o8HlWT+OPfBeLQGF9dEQDMu5NuXVqko7En0JVpkFAkRrJb+7w8rxxxZcL3qyUtWWi4pEa+FEdyIKTQUW/d7I7bpggtq/yYpCTY5HPDC4MuErpoBDytVuuCC6++hQ903tK9O9jgPp3XD8q5KPyN1F9ZuwqhXkaNoN7vovkSuSC/V3zzWPDjxAPikHrL/F4cMfZlLpz3KBstN48hx52dbLhnXf2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OvlLcUC8; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OvlLcUC8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkYCW45tZz30f4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 18:11:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C8EE5C20F1;
	Thu,  7 Nov 2024 07:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8657FC4CECC;
	Thu,  7 Nov 2024 07:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730963491;
	bh=Azs9pasN3x08hUEU2+s+v/pYHL4/7i1ADPdf0X65eZ0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=OvlLcUC8BJcDPd9trNaPvUnHzWZZjTZs2zO3o6wdhnNl3LYw579jbROt1ZQKJHQS/
	 Cr4QFh1KEFk6BId0hdq0f0W1Sw9NhdKoY4Ao4T9yu7t/GDXULg/ai/RDIN4jc0s33r
	 Ovm7B3d2/yglQkxD5h5oY3eYMF1DwOhtj05xK/i3dIwK+AEmGUaVuM6GMqu1aQpntf
	 9lmmJ93IwaQukeXA73uOft1bW4eCXg1q5mR7MZN6SJm0j0WW1pIuTE+aqa3vqNGNTP
	 HQs7tzLxI9mPs3r5TzIieVvyDfC5HbzK7x9HriS9QSJYtekmo0vtkmKU7IPI1uFtFF
	 2kpQEdGzXHzKw==
Message-ID: <6fa97654-19f6-4c5b-8db5-e76aafcf4227@kernel.org>
Date: Thu, 7 Nov 2024 08:11:27 +0100
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
Subject: Re: [PATCH] tty:hvc:Fix incorrect formatted output
From: Jiri Slaby <jirislaby@kernel.org>
To: liujing <liujing@cmss.chinamobile.com>, mpe@ellerman.id.au
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20241107054704.3247-1-liujing@cmss.chinamobile.com>
 <bc49f1de-8cce-404d-927a-ebe606c99026@kernel.org>
Content-Language: en-US
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <bc49f1de-8cce-404d-927a-ebe606c99026@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Also please fix the subject. See:
git log --oneline drivers/tty/hvc/hvc_opal.c

On 07. 11. 24, 8:10, Jiri Slaby wrote:
> On 07. 11. 24, 6:47, liujing wrote:
>> The termno parameter is defined as an unsigned int
>> in hvc_opal_probe function,
> 
> "The termno parameter is defined as an unsigned int in hvc_opal_probe()."
> 
> We place () after function names, then "function" is not needed.
> 
>  > So when it output should be modified to %u format.
> 
> I cannot parse this. Perhaps:
> "So when it is output, a %u specifier should be used for formatting."
> ? But feel free to use your own words, but somehow spell (or chatgpt) 
> check it.
> 
>> Signed-off-by: liujing <liujing@cmss.chinamobile.com>
>>
>> diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
>> index 095c33ad10f8..1d2e7f2ce088 100644
>> --- a/drivers/tty/hvc/hvc_opal.c
>> +++ b/drivers/tty/hvc/hvc_opal.c
>> @@ -199,7 +199,7 @@ static int hvc_opal_probe(struct platform_device 
>> *dev)
>>           /* Instanciate now to establish a mapping index==vtermno */
>>           hvc_instantiate(termno, termno, ops);
>>       } else {
>> -        pr_err("hvc_opal: Device %pOF has duplicate terminal number 
>> #%d\n",
>> +        pr_err("hvc_opal: Device %pOF has duplicate terminal number 
>> #%u\n",
>>                  dev->dev.of_node, termno);
> 
> There are more occurrences of this. Care to fix them all?
> 
> thanks,

-- 
js
suse labs


