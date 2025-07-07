Return-Path: <linuxppc-dev+bounces-10135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CFDAFAD15
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 09:30:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbG993F2dz30Qk;
	Mon,  7 Jul 2025 17:30:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751873405;
	cv=none; b=QNawwHKxaJqaAs3PNMRZaTX1BCc6hZZu/BAKlXaucibLfgvzoemxUPEjwxV3abHJYtBE5p39s1UM7Hgdch//JzJV38I6AWqExzZUT2XKVUcoX7ia938gOz+jqBApdl8V7dXzO2uZ0fIfxT/IAQrkFKvGAxFLB9+QpPXDz/da9ao0fFa205SGLqirAYYo7KQKsISHpR1dvb/llINzPh8ybHDMTODCr332XYqzM88TIp1j9xx04+UJ/PjSbxTyBjLztWXEK0DzSQIWaDnTsHK72E3epNGt8wl9T7hFhm20HYTObRLpWlk/emxlgIe33jDAM4lcve6p7We6JB6iNySnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751873405; c=relaxed/relaxed;
	bh=SgHhczf2ifzxrUFGbjDujXcq2nk5lxdaLNpSvEngRs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnWri6hk1oAgXlTFLZqbUDNQ4L+4UUgAED8wSfsuxblR6TrUCquW4FvNXTMGUe/QXkL48tzkkwc/UqLEwWLvwuoPomQuETpRDQsKZbXnwSV023n55sEPuQ4FPIPfU9aa7v/Gidal9lWj4JJqX7xE5raickTjwLH67ew3jgsqHoWVVPB4RTHHnFblztwHrGi7qufgN/U1LRECtE9EFNmmDAFtlSb9HaZIN1OCVhUz249xCvdBgDIBFZddWQlZ3+CLpeL6DG8SVky0eVL3dUifJq47HQDrdQe98sCY2JlfP1Pu/iM6Y3Ne+canoOJqhliIzbBYYthOhREixnlQshDRbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JxewOZOD; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JxewOZOD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbG98341Xz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 17:30:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77EE2A53513;
	Mon,  7 Jul 2025 07:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E470FC4CEE3;
	Mon,  7 Jul 2025 07:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751873401;
	bh=19mVquuSJbVgHFLg2tRfuKAmjj2Sd+p6RVzFJGGEWuQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JxewOZODxOPTY+AWx8UuQriv75/Rfv3CNNl2EDLgmVhmc2J7E7oVz8DoZuk5vIkze
	 RTwnULiR4XmNfbmU+bRORYuAoQMf4Rt6/j0nIBRp4OcFOmi5z8/75e4aFcBJ9ht/Op
	 GLz6Nj4s3xW1bxktUNZLkwPE3I95a+HPX38AN3/O0Bny9sWZ3J8Mc9pVR3OAJx9sQb
	 sLg01YuuPyIHuQX4bmzfwJ3Hfh1I2xv98uuIWMlqnHhW9wnAbLGZA5HlARWPn3zEoO
	 1mChMc3zwYthZV7TLNK1u/bllo1pSKzLHAlbxOv+E9ZoqWVhFWMTgbiuoGEcXcNrP8
	 CKx5CCHFHuQ7g==
Message-ID: <a6b94b73-a8b9-4e0c-87c2-c4196c6b7d74@kernel.org>
Date: Mon, 7 Jul 2025 09:29:55 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/9] powerpc/pseries: Add papr-hvpipe char driver for
 HVPIPE interfaces
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
 hbabu@us.ibm.com
References: <20250702221444.879256-1-haren@linux.ibm.com>
 <20250702221444.879256-4-haren@linux.ibm.com>
 <6ce5e5d2-0e6c-47a7-b1c8-7e03372c62bb@kernel.org>
 <63fca7415789098240700fc19a78b88f4fb5ca70.camel@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <63fca7415789098240700fc19a78b88f4fb5ca70.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07/07/2025 08:53, Haren Myneni wrote:
> On Thu, 2025-07-03 at 08:58 +0200, Krzysztof Kozlowski wrote:
>> On 03/07/2025 00:14, Haren Myneni wrote:
>>> +static struct miscdevice papr_hvpipe_dev = {
>>> +	.minor	=	MISC_DYNAMIC_MINOR,
>>> +	.name	=	"papr-hvpipe",
>>> +	.fops	=	&papr_hvpipe_ops,
>>> +};
>>> +
>>> +static int __init papr_hvpipe_init(void)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (!of_find_property(rtas.dev, "ibm,hypervisor-pipe-capable",
>>
>> Where did you document the ABI? Anyway, so you just run it on x86 and
>> every other arch? Why you cannot use proper devices and device driver
>> matching/binding?
> 
> HVPIPE is a new feature and is docucmented in new version of PAPR.  
> This feature is available only on powerpc and not applicable to other
> archs. Following the same interfaces available in the existing misc
> driver code for RTAS calls such as ibm,get/set-system-parameter (papr-
> sysparm.c), ibm,get-indices, ibm,get-dynamic-sensor (papr-indices.c)
> and etc. 


I speak about the ABI, not the feature. Where is the new ABI documented?

Best regards,
Krzysztof

