Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E52167D0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 09:54:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1F7k4NB4zDqn2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 17:54:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=AJjTWI5x; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1F5m6pp9zDqkL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 17:52:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594108341;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=qNfwcH9LfWaclr0Jyq7Q1GHfpiAsj+fNTGwreOU0xXU=;
 b=AJjTWI5xRtbFrrOkTGJsxweWxwWQvbttWvcZDsxgbokS2EE6St49iqBjhh+A/A0y0I
 y3fQuvAiumukjq3o3gigYRwwI7oTeApIB3DzYxZcF7oiAI0eUlGQWz5Uvz1920owjgUi
 dKpOZ4C1DsI9N+AZo9Sv5f9rRIeCTievbCBHWeDCGWp1t15WMT+0geOC/dhW311QwKTy
 1KR3t6LhzneyTF7eexAuHFNfv1Gw63i4AECgwLpXCivCyGADquvShsFD4Ft+DJ7AGu9k
 aGTdCF93X4ezsyA3478+Y4pgxK/p8y38frAr3iou2QM17pwWh1RnXJdmXmvyy0o+xFXf
 TeuA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSI1Vi9hdbute3wuvmUTfEdg9AyQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:15f9:f3ba:c3bc:6875]
 by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id 60686ew677qGleO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 7 Jul 2020 09:52:16 +0200 (CEST)
Subject: Re: FSL P5020/P5040: DPAA Ethernet issue with the latest Git kernel
To: Alexander Gordeev <agordeev@linux.ibm.com>
References: <56DB95B8-5F42-4837-ABA0-7E580FE04B73@xenosoft.de>
 <20200624082352.GA24934@oc3871087118.ibm.com>
 <004794fb-370c-c165-38e6-a451dc50c294@xenosoft.de>
 <20200625102223.GA3646@oc3871087118.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <4a08422d-86aa-ebb5-40a6-4e20467f5240@xenosoft.de>
Date: Tue, 7 Jul 2020 09:52:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200625102223.GA3646@oc3871087118.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 Madalin Bucur <madalin.bucur@oss.nxp.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25 June 2020 at 12:22 pm, Alexander Gordeev wrote:
> On Thu, Jun 25, 2020 at 01:01:52AM +0200, Christian Zigotzky wrote:
> [...]
>> I compiled a test kernel with the option "CONFIG_TEST_BITMAP=y"
>> yesterday. After that Skateman and I booted it and looked for the
>> bitmap tests with "dmesg | grep -i bitmap".
>>
>> Results:
>>
>> FSL P5020:
>>
>> [    0.297756] test_bitmap: loaded.
>> [    0.298113] test_bitmap: parselist: 14: input is '0-2047:128/256'
>> OK, Time: 562
>> [    0.298142] test_bitmap: parselist_user: 14: input is
>> '0-2047:128/256' OK, Time: 761
>> [    0.301553] test_bitmap: all 1663 tests passed
>>
>> FSL P5040:
>>
>> [    0.296563] test_bitmap: loaded.
>> [    0.296894] test_bitmap: parselist: 14: input is '0-2047:128/256'
>> OK, Time: 540
>> [    0.296920] test_bitmap: parselist_user: 14: input is
>> '0-2047:128/256' OK, Time: 680
>> [    0.299994] test_bitmap: all 1663 tests passed
> Thanks for the test! So it works as expected.
>
> I would suggest to compare what is going on on the device probing
> with and without the bisected commit.
>
> There seems to be MAC and PHY mode initialization issue that might
> resulted from the bitmap format change.
>
> I put Madalin and Sascha on CC as they have done some works on
> this part recently.
>
> Thanks!
>

Hi All,

The issue still exists [1] so we still need the dpaa patch [2]. Could 
you please check the problematic commit [3]?

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=50885#p50885
[2] https://forum.hyperion-entertainment.com/viewtopic.php?p=50982#p50982
[3] https://forum.hyperion-entertainment.com/viewtopic.php?p=50980#p50980
