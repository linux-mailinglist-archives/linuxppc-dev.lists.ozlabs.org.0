Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBC6217F89
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 08:27:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1q8f6tvqzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 16:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1q6h1HCwzDr4m
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 16:25:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=DMQ/ZVwE; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B1q6h0r74z9ChD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 16:25:16 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B1q6h0SSXz9sRR; Wed,  8 Jul 2020 16:25:16 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=DMQ/ZVwE; 
 dkim-atps=neutral
X-Greylist: delayed 43122 seconds by postgrey-1.36 at bilbo;
 Wed, 08 Jul 2020 16:25:12 AEST
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.167])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B1q6c1Ssnz9sQt
 for <linuxppc-dev@ozlabs.org>; Wed,  8 Jul 2020 16:25:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594189504;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=LwXOm3GoiiFAy2Z6IFkCQlwukVhqgk5eWn+uep+4q5Y=;
 b=DMQ/ZVwEt5pZ1rieWqSKJbKVM/vabaubEdAIfoELsHGrzsQZtsCdaDx67ixRQ4ziHT
 DObKhN7gCU2X2j8wuZYZ2fLkOiZZLoQEN1QB1v1rtkoplNDjPgQVMIFBNlYYw8gb5Jji
 3jBoK/KLM7VDZLzCqTU66LhIq311c+RVqRhIUq5pmSFsD3s28Y7zfywryIZvwz62EWDy
 GKu0P+G180PAtNBYaZgZku8AdbYbA+K0YzB1cmw7/LIKwb0CzSRAcoNN1AUCPfqrIW7g
 ge7LUACiRySPfFepeWmBlINO7pC3n4FRbjvxhBO4IoCnbdHV2K6Zfs+fB0BxdT7OO1rm
 5xrQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSI1Vi9hdbute3wuvmUTfEdg9AyQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:15f9:f3ba:c3bc:6875]
 by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id 60686ew686P0qMX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 8 Jul 2020 08:25:00 +0200 (CEST)
Subject: Re: FSL P5020/P5040: DPAA Ethernet issue with the latest Git kernel
To: "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>
References: <AM6PR04MB3976584920CFDC269D859DBBEC660@AM6PR04MB3976.eurprd04.prod.outlook.com>
 <4E3069C3-B777-4460-A781-84214C4539DA@xenosoft.de>
 <AM6PR04MB3976996912A9342D7BB7C1FFEC670@AM6PR04MB3976.eurprd04.prod.outlook.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <a81e9b59-ef64-d503-68a1-caf2f99fbbb6@xenosoft.de>
Date: Wed, 8 Jul 2020 08:25:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM6PR04MB3976996912A9342D7BB7C1FFEC670@AM6PR04MB3976.eurprd04.prod.outlook.com>
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
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Camelia Alexandra Groza <camelia.groza@nxp.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08 July 2020 at 08:03 am, Madalin Bucur (OSS) wrote:
>> From: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Sent: Tuesday, July 7, 2020 9:26 PM
>> To: Madalin Bucur (OSS) <madalin.bucur@oss.nxp.com>
>> Cc: mad skateman <madskateman@gmail.com>; Camelia Alexandra Groza <camelia.groza@nxp.com>;
>> linuxppc-dev@ozlabs.org; netdev@vger.kernel.org; R.T.Dickinson <rtd2@xtra.co.nz>;
>> Darren Stevens <darren@stevens-zone.net>
>> Subject: Re: FSL P5020/P5040: DPAA Ethernet issue with the latest Git kernel
>>
>>
>> On 7. Jul 2020, at 17:53, Madalin Bucur (OSS) <mailto:madalin.bucur@oss.nxp.com> wrote:
>> Was DPAA functional before commit A?
>> How about after commit A and before commit B?
>> The DPAA Ethernet works from  the kernel 5.6-rc4 [1] till the Git kernel from the
>> 11 of June [2]. It doesn’t work since the commit “fix bitmap_parse” [3].
>> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=49936#p49936
>> [2] https://forum.hyperion-entertainment.com/viewtopic.php?p=50848#p50848
>> [3] https://forum.hyperion-entertainment.com/viewtopic.php?p=50980#p50980
> Hi,
>
> can you please try to disable the network manager (see [1]), then boot with
> the latest kernel, that does not work, and setup the interfaces manually?
>
> Madalin
>
> [1] https://help.ubuntu.com/community/NetworkManager#Stopping_and_Disabling_NetworkManager
>
@Skateman
I will compile the latest Git kernel after the 17th. Could you please 
test it without the NetworkManager?

Thanks
