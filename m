Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9EA1EFE0F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 18:33:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dp9P4KXGzDr0y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 02:33:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.221;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=Ai9snXC1; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dnyK0xvJzDqrs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 02:23:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591374209;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=cWFpO+MAHzb1ZR71OBEpJf12JIXs/s2TExyeBDxxrEs=;
 b=Ai9snXC1hATNxevhOWIZpYLeKXlzTVle9I3YLvSYTrO9rSvTzoF32HBq4iYNzN+3YC
 5E2xCcxiypZMJW/piALXaOw3sNGgk+oz8tMrM2KgD3tI3JKRTQLIXTvSYHAx+wAhPKtJ
 jL+fpQqBgUmt9lOQ+0LVHVq9zMFag7vp72h5yiLwG+UuMWxDttFo6+Lt6603goqD0oDB
 5Z5QblSHDbIjxpPg9Q/Rim2tMiPKr0kYlyIcvYGiT3OkMlxG3Jc9Rno7K4wCD8r1Rn1X
 Jg2YmMtFcEXMi5EMZzH3tVUrTKLLDHb7nqwuTIROG9yXh9P/UpCW2VamTCaFWEnzc4yR
 IM/w==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSI1Vi9hdbute3wuvmUTfEdg9AyQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:15f9:f3ba:c3bc:6875]
 by smtp.strato.de (RZmta 46.9.1 AUTH) with ESMTPSA id w06ffew55GNKGZu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 5 Jun 2020 18:23:20 +0200 (CEST)
Subject: Re: Boot issue with the latest Git kernel
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, jroedel@suse.de
References: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
 <067BBAB3-19B6-42C6-AA9F-B9F14314255C@xenosoft.de>
 <014e1268-dcce-61a3-8bcd-a06c43e0dfaf@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <7bf97562-3c6d-de73-6dbd-ccca275edc7b@xenosoft.de>
Date: Fri, 5 Jun 2020 18:23:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <014e1268-dcce-61a3-8bcd-a06c43e0dfaf@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, Christoph Hellwig <hch@lst.de>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04 June 2020 at 7:15 pm, Christophe Leroy wrote:
> Yes today's linux-next boots on my powerpc 8xx board.
>
> Christophe
Hello Christophe,

Thanks for testing.

I was able to perform a 'git bisect' [1] and identified the bad commit. 
[2] I reverted this commit and after that the kernel boots and works 
without any problems.

Could you please check this commit?

Thanks,
Christian


[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=50772#p50772
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2ba3e6947aed9bb9575eb1603c0ac6e39185d32a
