Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC361235F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 15:53:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N018v5G7Jz3cJy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 00:53:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oM7Uxau9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oM7Uxau9;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N017v6SZQz3bnH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 00:52:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1667051547;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=JHo3CqXhxV+eNnczTAWNPspXFkLgd4TmDNFZlDkEhck=;
    b=oM7Uxau904IJM8Ct8EXNk87wkEqh9+OEjUt0E5FsgIcZdoy5enFODBQvQ9Whntq60O
    9ZOrRQZrDZsLsYpfstfAjrAajgM6zI1nY0ZxinqOA6rlcBU2PxaVqAOZRpvrqe8Ltu1w
    XdqEsqZXHgRxqK+A9slmnAUz4vKudMfY8geGnlG926KY5/UpT0Ju8aJPNtlx/D9vVcRs
    5r4GI0fpL5GhP5BBX+LU5HrqVHlJYtj+kjPoP71dGOgqINSBlT6ag3nXIatVOjrz4Ws3
    /ZhZ5MuTZFPLKRSMFA+jRcg+Tdi9E0OT0PVc4qfPoXg3xv5UyzqdG/RlnmBI5rWZluTo
    lLIw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiEvXc9hs8kjZ941ahBf5BGSq/kPw=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:ad48:9665:7f13:82e1]
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id e28afdy9TDqPD1B
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 29 Oct 2022 15:52:25 +0200 (CEST)
Message-ID: <b2d2af43-f5e4-dc3e-d57b-a33c942c964f@xenosoft.de>
Date: Sat, 29 Oct 2022 15:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <87y1tfl1pt.fsf@mpe.ellerman.id.au>
 <BCDB3B67-48A1-45E6-806D-2501C7EA6D8C@xenosoft.de>
 <fe06590f-6db6-f5cc-72ec-e635f66f3d3b@xenosoft.de>
In-Reply-To: <fe06590f-6db6-f5cc-72ec-e635f66f3d3b@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com, rmclure@linux.ibm.com, mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29 October 2022 at 01:44 pm, Christian Zigotzky wrote:
> On 17 October 2022 at 09:53 am, Christian Zigotzky wrote:
>>> On 17. Oct 2022, at 02:43, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>> Previously BIG_ENDIAN && GENERIC_CPU would use -mcpu=power5, now it 
>>> uses
>>> -mcpu=power4.
>> Maybe this is the issue. We will wait and not release the RC1 for 
>> testing because it is a risk for our testers to test these new 
>> kernels because of this issue.
>>
>>>
>>> cheers
>>>
>>>
> I compiled the RC2 of kernel 6.0 today.
Typo: I mean the RC2 of kernel 6.1.
>
> After the first boot of the RC2, the file system was immediately to 
> 100% used.  This is the same issue we have seen with the git kernel 3 
> weeks ago.
>
> The Cyrus+ and Nemo boards are affected.
>
> I wrote 3 weeks ago:
>
> Hi All,
>
> I successfully compiled the latest git kernel with the first PowerPC 
> updates yesterday.
>
> Unfortunately this kernel is really dangerous. Many things for example 
> Network Manager and LightDM don't work anymore and produced several 
> gigabyte of config files till the partition has been filled.
>
> I deleted some files like the resolv.conf that had a size over 200 GB!
>
> Unfortunately, MintPPC was still damaged. For example LightDM doesn't 
> work anymore and the MATE desktop doesn't display any icons anymore 
> because Caja wasn't able to reserve memory anymore.
>
> In this case, bisecting isn't an option and I have to wait some weeks. 
> It is really difficult to find the issue if the userland will damaged 
> again and again.
>
> Cheers,
> Christian
>
> ---
>
> Maybe there is an issue in my kernel configs. Could you please check 
> the configs? Please find attached the configs. Could you please test 
> the RC2 on your FSL and pasemi machines?
>
> Thanks,
> Christian
>

