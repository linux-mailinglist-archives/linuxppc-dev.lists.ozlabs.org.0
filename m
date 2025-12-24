Return-Path: <linuxppc-dev+bounces-14988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 021D9CDBDEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 10:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbnPQ3VTPz2yFd;
	Wed, 24 Dec 2025 20:58:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766570282;
	cv=none; b=bKWJqtpLeYChEXB/tzFx9PYHdwfU946/effm9CXovxFLTlOiwlAAO52IiYOQcdnE88O8vfApTW+Sm17QmYICmOI1jthgmlXK0/WhYSCXDdM+rSLmtOqDwInbWt7vWnmSIF+IXphW1kfDMzMLU6mgEZiV2lzrBhxCTowDj8vioXFM++pYfDpUJc1p4kOU9/7VxGRGi1+vXKmvxm8TOw39zM/qIZJAWFFN3gcarRY3CMGYcnY/FH+aClsomxTItD4Cmxjx1+7iHLmXObEF0YJhq2+Y3fSSEJJccmPRRILzCaTpzpQEZS+nMZ3jEhV9ujtepTrOVMHiDlWOcxyOJlKBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766570282; c=relaxed/relaxed;
	bh=WfkwIUndPf5NosSKZVyYpNoJHEamE5/8+2de1Hxc9Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EkmndRtxbEG+cJg9nlLO517D1d4qDa1dS4xt8hR68Kqmyp8I/xoR1B9Tga30pFYPPw9+bFpOSPuSpLH7nd0aBokq+SIY/U5JnKxNdTlOdCLOzVcwXoQcnJQF1ylBHLsxwzUzvyoHEHxYM333FVJ7S63UYxwlSuD8TCo4kNYN5pOFTR1y1J+mkmqKAgcGeI3tdbBUCXqrbwsGfvL1XyQbOq3nxdtTeG6wn2M83z/A2dtVNo1/aqOZtTwCZiACnVFM//diRpxafy8hhcaMXsoo7LxHBRXHsOn7cq3j0Gdcb81o0W71gGB1OxCjCfRUKbYp2tpzPFrcsht7p360Mu5Glw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gb5PbBVU; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gb5PbBVU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbnPN5T0Wz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 20:58:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DDB7060122;
	Wed, 24 Dec 2025 09:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA49C4CEFB;
	Wed, 24 Dec 2025 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766570277;
	bh=GDocZyPYLNOfvPS96az5y2sVAvnPHMzlj7hWvcLsYL4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gb5PbBVURfbRBMlGSWyxUHFAdnebipYcJ+w9UFDOfUXT52pngzBniIwXvSQzkNBsR
	 seCNOOiXHhG5h6IQuUJLkpRJk9oU/qB1MFb6UazCDkUe9/p/qrprdAyfnvCsR5j+FD
	 qPiCunScPELKB9LYAdEydEgn5CXajGF19ybDO5lgc+XTkLUtFQjXjkdIgfuu2AzQ2q
	 rNeEdNu2dN2gA1sQHAmgcIKu0lAovsFUYgmV8cVBSQAqZSrw27oap8fXiy50P5zizu
	 UjgFmMGZCXZGrBbGraYiRjJbeC154krIzkQpk8cgIHzigz6CrUD80/QqTlGvweKAUP
	 smobeYokgJYcw==
Message-ID: <ad465fd1-4b5a-4fa1-b4fc-1ca7bd6fe5b4@kernel.org>
Date: Wed, 24 Dec 2025 10:57:52 +0100
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
Subject: Re: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, ioana.ciornei@nxp.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Su Hui <suhui@nfschina.com>
References: <20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn>
 <cce0a0ca-9ea1-437a-a857-17a2bfa28791@kernel.org>
 <aUucPsDoPQJE5Ucj@stanley.mountain>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <aUucPsDoPQJE5Ucj@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 24/12/2025 à 08:54, Dan Carpenter a écrit :
> On Tue, Dec 23, 2025 at 04:34:44PM +0100, Christophe Leroy (CS GROUP) wrote:
>>
>>
>> Le 22/12/2025 à 08:49, Haoxiang Li a écrit :
>>> If device_add() fails, call put_device() to drop the device
>>> reference and do the cleanp.
>>>
>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fb767348e-d89c-416e-acea-1ebbff3bea20%40stanley.mountain%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cfd3865935a164c2083cc08de42c1b5a5%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639021596902232212%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=j5%2BqptzXvrxcnaaH3PIDorAYMexoPmf3PWi5GbpVD9s%3D&reserved=0
>>> Signed-off-by: Su Hui <suhui@nfschina.com>
>>> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
>>> ---
>>>    drivers/bus/fsl-mc/fsl-mc-bus.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
>>> index 25845c04e562..90a2107a9905 100644
>>> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
>>> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
>>> @@ -896,7 +896,8 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
>>>    		dev_err(parent_dev,
>>>    			"device_add() failed for device %s: %d\n",
>>>    			dev_name(&mc_dev->dev), error);
>>> -		goto error_cleanup_dev;
>>> +		put_device(&mc_dev->dev)
>>
>> This change has obviously not been tested, not even built.
>>
> 
> Yeah, it doesn't build.
> 
>> And by droping the goto, the kfree() are not done anymore, leaking
>> mc_bus/mc_dev p kzalloced areas.
>>
> 
> Calling put_device() triggers fsl_mc_device_release() which does the
> free.

Ok, then this needs to be said in the commit message.

By the way I'm a bit puzzled by the device_add() doc versus the 
put_device(), because it looks like device_add() already calls 
put_device() in its error path, see 
https://elixir.bootlin.com/linux/v6.19-rc2/source/drivers/base/core.c#L3716

> 
> regards,
> dan carpenter
> 
>>> +		return error;
>>>    	}
>>>    	dev_dbg(parent_dev, "added %s\n", dev_name(&mc_dev->dev));


