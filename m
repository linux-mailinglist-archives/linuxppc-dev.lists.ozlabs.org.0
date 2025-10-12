Return-Path: <linuxppc-dev+bounces-12780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB2BD0082
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Oct 2025 10:26:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cktqp5KSbz3cb1;
	Sun, 12 Oct 2025 19:26:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.80 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760257606;
	cv=pass; b=Gx0IVoBeEPJm4x8qI6QUpQDo1So9BJirvr9p5YJnyVT0LxazTlg1pgihU+non6gyPMQm9Rci3DscwVlIy58XiOqXxjuedDMUlbgfSs7IEV1BL7pCKYbUW4i32YD2pyyCr9X/2XhZrygKACgMXvCuvoUbqzmm7ZUcmncPr+wdbZKbGjLxiu2sDOgyJiAcrIPsGyyyPWDRET5xN4g3kkv41KqLJ60DBLkou36YwWrWYmdawC9ct/saqr9Dmc0Wz6K0HKm+6eqiA0tTX5XpUJ2WZ+uhEzqIdLZ0eHDCZELBHZ4SGQcA+podtLNWexacB5T+C46zPHKWfD2BMtwW9+/3wA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760257606; c=relaxed/relaxed;
	bh=9c0sKfGS7NQ99KLDwQHBbXcZ94VEUGg5GDwz27796Mw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DQ5K1yYZpSY9SKf4Kbm22LVNotajQFMS44X8Bqt3HMnmFkGHpOQVTuMlalHz0vM1vW4GWCoZV6oJHX7iaPG7LteyDtKVY0lFfvM2rUF/DsBJemKrPPgSInv3YyZUyWshGPomFtQFcxtQyppZGhPxILgEL6BIBDWqg5INoz1UTN5nEWDHSHX0BFL5JfAr6P3adMwDi+nLU6apDemisqhynb2igOm1WR8sH9qj7623FoD5MjnW1aEF0h5oVX6s7YhvECHFhtJN+zwYkNz4oaBpaacVv92USlb+xsFU/37t+3qAb6DNKL+WZzw4LupiFEaswl/ftr9pcyDfqZQdRqIf8g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=cv9xUd0U; dkim-atps=neutral; spf=pass (client-ip=85.215.255.80; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=cv9xUd0U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.80; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cktqm4R6hz3cZt
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Oct 2025 19:26:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760257593; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=e20jC772tPtOhzcydNtV1vv10wpT7jPlARmKXu60u1jc72cB4s8brtRfV8AvEgVOTh
    QYnRcMYug0PPzzItrqy+DCsrvvwXaJasSlaKpztuoGomma0dClvFBC735QwqBWAAoBy+
    Rmo8k5I+5TLl6E34uCE11TPHpKtJx2kvR+YQPRl7XZX47CNBGbs2gctyjDbaKRFnO5o8
    8b3Y67Pz1aw5ilYG2pTWMqqoHU+h6VgSw7b/pqrz4ikDArvkN/nhthvx8BDUYvzh6+x+
    aEGFXYKjYNC+ejp3rep2V7O7RD4wu+T36Fn6HQhAMRTAsPJAx1L5P2AyM3iTT5qWX/Wp
    AY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760257593;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=9c0sKfGS7NQ99KLDwQHBbXcZ94VEUGg5GDwz27796Mw=;
    b=rGonAidCoY0ZM8Bx4zfHqVVzAJ5LNjVvdaJFfJjohAb6aQO/WeaB3JS8dC6LrIHU/z
    jT/aKQ9i9ThyxJlTgFfAQdYJOBaXh4pq06r6JyRqsi6ZM2ToHG9nH2xuotI3bdtPfAab
    uUszcVYLXa4fWNG0/ZhPlCdpxZnefJOJTkjr99Up/luHxrVFf0WFvgJARuw90MyNq7iX
    91XdGeOTghlOJDWTHOzKGAfCogznOSLmORM/lAkZfTNmY3sGJEChSn7vYAAS5fBZg85S
    T/sX+Wpq5ehoIucc6zGr/OWqDQsHK7tN2/GEtNFWRbU27sOJ4QhkU74xjDdFKxEeFoDO
    3oDw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760257593;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=9c0sKfGS7NQ99KLDwQHBbXcZ94VEUGg5GDwz27796Mw=;
    b=cv9xUd0UkCQGc1sojCJJLsZyK4RGULQBmc4Pn+nFKKa1AnwDoxmpPSmiTrWMbFgkIs
    8I7qvjF987TIyzExnpEsGZYfqZbhlV0fWjgO6kOrqUOVyhC2xJw4zPhMKtSePjOFCAOQ
    hqvWo0EhtCxITnA0hLPGQ6o289EbV7lyKjCWQXmrljNcNnvTgXKaplkNa6T8w4WtLIci
    OTGrVfvPpcod2fOpR5lm5ay7IEjzcr+0ccOeTvzTAm7OtKfNsk6LWof0fq2U5O6AIzQ1
    qUD8WSC6YB2kPfmFO9aa9+8gxfd23h+iR+jc+2Y1KqfXWBFk1lpqrRQOGKN4vpRWpRfN
    SzOA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+m6Xc="
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e2886619C8QXIPX
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 12 Oct 2025 10:26:33 +0200 (CEST)
Message-ID: <53520ba7-c97e-4622-ba75-a827f9a28ae4@xenosoft.de>
Date: Sun, 12 Oct 2025 10:26:32 +0200
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
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org
References: <iv63quznjowwaib5pispl47gibevmmbbhl67ow2abl6s7lziuw@23koanb5uy22>
 <10994220-B194-4577-A04B-EBC5DF8F622F@xenosoft.de>
 <6ed8f4f0-8c8f-435e-a8df-2dc51773d9fe@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <6ed8f4f0-8c8f-435e-a8df-2dc51773d9fe@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12 October 2025 at 09:47 am, Christian Zigotzky wrote:
> On 11 October 2025 at 09:34 pm, Christian Zigotzky wrote:
>> Hello Mani,
>>
>>> On 11. October 2025 at 07:36 pm, Manivannan Sadhasivam 
>>> <mani@kernel.org> wrote:
>>>
>>> Hi Lukas,
>>>
>>> Thanks for looping me in. The referenced commit forcefully enables 
>>> ASPM on all
>>> DT platforms as we decided to bite the bullet finally.
>>>
>>> Looks like the device (0000:01:00.0) doesn't play nice with ASPM 
>>> even though it
>>> advertises ASPM capability.
>> It’s the XFX AMD Radeon HD6870.
>>
>>> Christian, could you please test the below change and see if it 
>>> fixes the issue?
>> I will test it tomorrow.
>>
>> Thanks,
>> Christian
> I compiled the latest git kernel with your patch but unfortunately it 
> doesn't solve the boot issue.
>
I have created a reverting patch for the RC1: 
https://github.com/chzigotzky/kernels/commit/88150a30aeaf903d5ed44b8514350232666de715 


