Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB57F6294
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 16:20:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=UNpDTejU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbhd44qWLz3dk2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 02:20:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=UNpDTejU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=embeddedor.com (client-ip=44.202.169.37; helo=omta038.useast.a.cloudfilter.net; envelope-from=gustavo@embeddedor.com; receiver=lists.ozlabs.org)
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sbhc92Q10z3dL4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 02:19:35 +1100 (AEDT)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id 62kur0OgrWcCI6BSorzZ35; Thu, 23 Nov 2023 15:17:58 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 6BSmr9RCk8vT06BSmrwmMS; Thu, 23 Nov 2023 15:17:56 +0000
X-Authority-Analysis: v=2.4 cv=ffi+dmcF c=1 sm=1 tr=0 ts=655f6d24
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=yGeM7+xMb5a5VK1DGQx1ew==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=voM4FWlXAAAA:8 a=Z-Vhp2_sRgHxayNbR2cA:9 a=QEXdDO2ut3YA:10 a=S5ubAB1OdGcA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=IC2XNlieTeVoXbcui8wp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DfoX0Dt0luLgH9VYNQaGBNqfL1ZfpE45KJwTEoR2wsE=; b=UNpDTejUMIHRskqqYblHEVbLLr
	KV0qB31HmvsqgAjuXBsuYPBHaz/sqVwukLQB4/iXbX4ic+YzE2qM4Uodl2KkBykeaQ3+L/FmcxpRm
	K22sSLS6TqEoI+Hngu28fDMTNzsD2IvW2aYgBXnstLXpzln4Pn7PUUlBy3CYINQ8vaDLIx5FKeFyH
	gbHvdQ/lLh6qRKtOzV1royE79WtYz19A87IQigEQhUurJe+3V6M9hvgFRJyINSJWaXpHqBgVL7+6q
	4kHRGTyEyYsaSzk1mhvfrcW7C2zUjz2+XlMvJYBWXstC63hvGcRgGwbfSM6KDXfuTlX7Yebf2+MUB
	R2aC94Og==;
Received: from 187.184.157.122.cable.dyn.cableonline.com.mx ([187.184.157.122]:25973 helo=[192.168.0.25])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r6BSl-001fV9-2k;
	Thu, 23 Nov 2023 09:17:55 -0600
Message-ID: <c7fb16c0-ce17-465e-8624-2ee39b545a11@embeddedor.com>
Date: Thu, 23 Nov 2023 09:17:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/lib: Avoid array bounds warnings in vec ops
Content-Language: en-US
To: Naveen N Rao <naveen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20231120235436.1569255-1-mpe@ellerman.id.au>
 <i4zq3tg6gwaptnuoq2ainowffvkols2k5x7rads473zn55r27y@cvdy5yvkmj2p>
 <87pm02jt2g.fsf@mail.lhotse>
 <ab6uj2olygi3edqkjn73kfxvx6igtxotkp3m35j4ikn3ztm2eg@ixkpj2f47ri2>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <ab6uj2olygi3edqkjn73kfxvx6igtxotkp3m35j4ikn3ztm2eg@ixkpj2f47ri2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.157.122
X-Source-L: No
X-Exim-ID: 1r6BSl-001fV9-2k
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.157.122.cable.dyn.cableonline.com.mx ([192.168.0.25]) [187.184.157.122]:25973
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLtmy4BmxhzlUWSGM0Wmhmv60krh1qEHMlVnwGJc5olA9m5OkNNlaYAwQci3TKjCx8lS4p5Hu/qFuNdaFYk0uMBQUHDWFLogALp/Ls/XejGqbb2cCq5L
 tOQOU32jO0yG/bsf0Bqrb3b1tTguelobLrRuCgR49l2XPQBBrNq7aWe+Gnl873c/CZJzlWwCTF5nMtp9H0HqVbjxFaT+K3Gq6EylH3QH9VvN3e3L9g9xhDc/
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>> To be honest I don't know how paranoid we want to get, we could end up
>> putting WARN's all over the kernel :)
>>
>> In this case I guess if the size is too large we overflow the buffer on
>> the kernel stack, so we should at least check the size.
>>
>> But does it need a WARN? I'm not sure. If we had a case that was passing
>> a out-of-bound size hopefully we would notice in testing? :)
> 
> You're right, a simpler check should suffice. I will send an updated
> patch.

This[1] patch indeed also makes those -Wstringop-overflow warnings go away. :)

I'm not subscribed to the list but here are my

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Build-tested-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thank you guys!
--
Gustavo

[1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2023-November/265936.html
