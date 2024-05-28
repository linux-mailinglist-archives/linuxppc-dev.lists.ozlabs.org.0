Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF238D259C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 22:16:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WroMD5S+;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=YB8Mmlg7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vpk8d3BLhz7BK4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 06:08:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WroMD5S+;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=YB8Mmlg7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.20; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vpk7r4Wt8z79JB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 06:07:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1716926826; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=prAfQplooWGuBdgukGkN4tSOpYUEaOKleUx4yb24LKJAcd8IdB9HeksyvGaoFEE28l
    kS80JirnMOJ5i1ACiecjEI2SxQfSw8dlYFSD8414512bj8ua4sKGPNaKdQcRfCZR0XqY
    kQ0mJTrRUvN0dDBOdmQN+M/x+v4iJj1X15vfIncl5w0exGW5XGOGkrI9C9OwypT9VFkC
    qMSauv2unf5gAQ/WDEk0AuwMNQpNuQN0SG4Pqm5BKik+QFfEJFyMreOPq3X7u62lAnGs
    tdsdXpukDYxJzR7adB/7q4ZUXV9QQ3pxwlMX7CPIL2S70bS+6xyUuFZXnpKJ8XHD2XS6
    tyNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1716926826;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=yCKRlpm/qR+yNi7buU6p/j7aITIjXiRgGxLTM8JuBq8=;
    b=KFbLXDgfkmwUwHR6cx8yJxyrxWIbSMGPvijy5TllgXk6lZxK8wYgNdsMJJkGa6BT3q
    xMQPTXJSLiBM8JXGnQTO/sSRCHJA+6JtfyD9Skm83cQnFPdH8nclNVm+6GPe45vu9qve
    Y5+PLmNktSHMARzpiB+S2oYx/2Zmj4aEx3293rUYQDkmJtTFbUW1MPqyZOuV11+a5f33
    UAbPlMz6ElLGZluojhD4wRB1Xe5Kz4PNaMs2jq4yxDtr+dqPHsq+monF07UIfPANjxuP
    DZJCctRtSdgHMNTodfDwI9HFbM7E5unodNnYDtrJg8a/fw0YwqIPZFOOI9JHfsrJxvQb
    8iUg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1716926826;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=yCKRlpm/qR+yNi7buU6p/j7aITIjXiRgGxLTM8JuBq8=;
    b=WroMD5S+nrj3+hQqr2t7+3bZsJmVSSLeaNWN7OljnguXXjUUNxVz3qo4NxB4zesONc
    SIUyApMrAIdhMvgIq3DUz5N82g2k7diYgRKFd08jhZorbSsAHy6qMqtbKwUTLADNEZJ+
    nH1tWP4tDx9pERPJFDf9eaJqxjN3yyPLih9BPayFGuZbkAuTZh8WXAvGpK8Dt1KBjRIb
    XJOSLnPASYCZnyOIp1FTki91RXp2GXmXjDclbha4Aa1OuwNXNRdo4BGsGQf+r+ziPUvX
    Ne8r9F50sx7Dm8PEyEMSeidilhBe6W2eMrtB31KD0hzuUH65qSR4t8X8ofIvl0rzZWtT
    mLyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1716926826;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=yCKRlpm/qR+yNi7buU6p/j7aITIjXiRgGxLTM8JuBq8=;
    b=YB8Mmlg7aqnyGG8ar3Jh6rBS2wsBjhIQrG/u4fTUF4YypNrXTgyEOBs7I+snT20YQU
    HBRLuVO5cP5KJpo8FFAA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43J0jbX3mI+xFkDym0uJ5XGq77oKNN8JZYXQINw=="
Received: from [IPV6:2a01:599:812:7116:d3f:4849:4ccd:c8e2]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e092ae04SK75rbQ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 28 May 2024 22:07:05 +0200 (CEST)
Message-ID: <613e5c88-7ffb-4c1c-a0a7-3f6f7b736050@xenosoft.de>
Date: Tue, 28 May 2024 22:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Xorg doesn't start and some other issues with the RC1 of kernel 6.10
Content-Language: en-US
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
In-Reply-To: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28.05.24 22:00, Christian Zigotzky wrote:
> Hi All,
>
> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
> with the VirtIO GPU and with some Radeon cards.
>
> Another error message: Failed to start Setup Virtual Console.
>
> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>
> Tested with FSL P5040, FSL P5020, and PASEMI boards.
>
> Could you please test Xorg on your PowerPC machines?
>
> Thanks,
> Christian
Another issue: 
https://www.skateman.nl/wp-content/uploads/2024/05/Kernel6.10-RC1.jpg

-- Christian
