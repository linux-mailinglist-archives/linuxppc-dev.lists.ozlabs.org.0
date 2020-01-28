Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D027314B3D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 12:58:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486Q9Q1jr7zDqLq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 22:58:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Q6b5RyczDqHJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 22:55:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gWsMxHUR; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 486Q6V2LqGz9sNF;
 Tue, 28 Jan 2020 22:55:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1580212533;
 bh=MpHFi4OUxb+RLUqPq8i8z8tgCvvnh/pa/tf3O7Ge6fY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gWsMxHURlpx686fwXAh2vgtJx0pDdvohiEbSIvcFTMAFxaTlWftoU7X5IU/2WfOjh
 fgXGo1rrIX2MzDep+Mpk6x3HLBPQCJ0BgeJCYzin4REnYbcfyj/Pdr+uCL98uBhU8j
 wAualP1ppZKytFTZRTm9MZyJSj/7Q/Z6Bw6TZ5/9/p+7Bg2uCczAEPG66JJNLnkIWc
 2DZ9oTSn/NssPGBdJxjZZv6sEdsRCKCsEfcpiRut1T1pJlR5pMtMxceISVVVBQlObW
 87pEpga1UpvrXmT7biQDx23pc/QZSyZCXOnMIsQKkTxrOMoRfUI3Elb0BVBdKAdMA6
 5mXHBgv68fWGg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [FSL P5020 P5040 PPC] Onboard SD card doesn't work anymore after
 the 'mmc-v5.4-2' updates
In-Reply-To: <de35b0fc-9e24-2989-58f6-ade0585db1a0@xenosoft.de>
References: <20200108093903.57620-1-hdegoede@redhat.com>
 <20200108093903.57620-2-hdegoede@redhat.com>
 <61bc9265-ece0-eeb6-d4a1-4631138ecf29@intel.com>
 <8d67882d-04a8-0607-be4e-c1430b7fda21@redhat.com>
 <84a32714-ba08-74a0-0c76-3c36db44dd68@intel.com>
 <93446e09-5f12-800a-62fa-bf3ecea7273d@redhat.com>
 <399ac7d5-2518-799a-595e-f6b6878cf4ab@intel.com>
 <a9ab8946-c599-5f83-7527-2387a9e82e8a@xenosoft.de>
 <CAPDyKFoydOuSE=Eaq168=2_Ycouo7hzyw+RZXhGq7q4D4Qe8TQ@mail.gmail.com>
 <8736c5hyhr.fsf@mpe.ellerman.id.au>
 <de35b0fc-9e24-2989-58f6-ade0585db1a0@xenosoft.de>
Date: Tue, 28 Jan 2020 22:55:29 +1100
Message-ID: <87d0b3hk26.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Julian Margetson <runaway@candw.ms>, Christoph Hellwig <hch@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, "contact@a-eon.com" <contact@a-eon.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> On 24 January 2020 at 12:42 pm, Michael Ellerman wrote:
>> Ulf Hansson <ulf.hansson@linaro.org> writes:
>>> On Thu, 16 Jan 2020 at 12:18, Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>>>> Hi All,
>>>>
>>>> We still need the attached patch for our onboard SD card interface
>>>> [1,2]. Could you please add this patch to the tree?
>>> No, because according to previous discussion that isn't the correct
>>> solution and more importantly it will break other archs (if I recall
>>> correctly).
>>>
>>> Looks like someone from the ppc community needs to pick up the ball.
>> That's a pretty small community these days :) :/
>>
>> Christian can you test this please? I think I got the polarity of all
>> the tests right, but it's Friday night so maybe I'm wrong :)
>>
>> cheers
> Michael,
>
> Thanks a lot for the new patch! I compiled the RC7 of kernel 5.5 with 
> your patch again yesterday and the kernel works without any problems 
> with our onboard SD cards. [1]

Thanks for testing.

cheers
