Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE01F0B76
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 15:35:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49fy6n2ZnSzDqCD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 23:34:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.82;
 helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=an8vQdvs; 
 dkim-atps=neutral
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49fxyD5XgVzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jun 2020 23:27:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591536444;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=pDuQHVQrkqpyDWr6DQSl8TYlVTDnrb/sfmWvheyLuTc=;
 b=an8vQdvsb5o/YhvCuIrAoxGYMc7kyTVB0eVx3wypQE0rZIaq5bKt/fSAItcYdI13gB
 xrlkTZITncy8l0Ck/ielbTJA+SzKQugIT3bJg7txX04FDYBtjdbm3//ueo4UvXeCkJAa
 U22efhtbyafX25eeV27AkATvolK5NDYma+5+nMLVj3/yLMJIoiZ44KB4Gl6iqLUCjVH2
 +WQ9n3tqpHxzaOrd99dZEfgDsiLTRqSBQXsILgbXq0JA0tS2LfVNQQZAcUiXDHrtEel6
 NovroIQJhWqi045UQMCnejWMS1yR0Xf57NBI3QDbAww9izwLmhsn9LoPAWb/6poQGbPQ
 gH4A==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSI1Vi9hdbute3wuvmUTfEdg9AyQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:15f9:f3ba:c3bc:6875]
 by smtp.strato.de (RZmta 46.9.1 AUTH) with ESMTPSA id w06ffew57DRGLzm
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 7 Jun 2020 15:27:16 +0200 (CEST)
Subject: Re: Boot issue with the latest Git kernel
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, jroedel@suse.de
References: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
 <067BBAB3-19B6-42C6-AA9F-B9F14314255C@xenosoft.de>
 <014e1268-dcce-61a3-8bcd-a06c43e0dfaf@csgroup.eu>
 <7bf97562-3c6d-de73-6dbd-ccca275edc7b@xenosoft.de>
Message-ID: <4dcedace-f3e6-1258-86fc-665666955946@xenosoft.de>
Date: Sun, 7 Jun 2020 15:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7bf97562-3c6d-de73-6dbd-ccca275edc7b@xenosoft.de>
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

Hi All,

It seems, someone has fixed the boot issue. The latest Git kernel boots 
on my PowerPC machines.

Thanks,
Christian


On 05 June 2020 at 6:23 pm, Christian Zigotzky wrote:
> On 04 June 2020 at 7:15 pm, Christophe Leroy wrote:
>> Yes today's linux-next boots on my powerpc 8xx board.
>>
>> Christophe
> Hello Christophe,
>
> Thanks for testing.
>
> I was able to perform a 'git bisect' [1] and identified the bad 
> commit. [2] I reverted this commit and after that the kernel boots and 
> works without any problems.
>
> Could you please check this commit?
>
> Thanks,
> Christian
>
>
> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=50772#p50772
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2ba3e6947aed9bb9575eb1603c0ac6e39185d32a

