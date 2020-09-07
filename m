Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A932606E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 00:25:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BljXZ2QBbzDqMW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 08:25:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=dCQM0mMb; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BljVw4zX6zDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 08:24:08 +1000 (AEST)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FC482177B;
 Mon,  7 Sep 2020 22:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599517445;
 bh=Zw8k17EFrc+/63emBncYD49Ff5pxZKxzzOMgy+BQJLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dCQM0mMbBmsuXq6UiB6gfFobsHNxnlX3Kk4wLQa8AevAHky7abtJqi/+ADi5VCech
 AimdyxuYXf0XIhdZP91Xjk4gQYYSIVwEHMDANE0DH5RqXC/Vxo1TxhoENe+na8hCS9
 KpNgXEXwD6oqJYWh/Feb1GZ86rYfY8DK9ZhM4KRM=
Date: Mon, 7 Sep 2020 18:24:03 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.8 14/53] ibmvnic fix NULL tx_pools and rx_tools
 issue at do_reset
Message-ID: <20200907222403.GQ8670@sasha-vm>
References: <20200907163220.1280412-1-sashal@kernel.org>
 <20200907163220.1280412-14-sashal@kernel.org>
 <20200907141026.093fc160@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200907141026.093fc160@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Mingming Cao <mmc@linux.vnet.ibm.com>,
 Dany Madden <drt@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 07, 2020 at 02:10:26PM -0700, Jakub Kicinski wrote:
>On Mon,  7 Sep 2020 12:31:40 -0400 Sasha Levin wrote:
>> [ Upstream commit 9f13457377907fa253aef560e1a37e1ca4197f9b ]
>
>> @@ -2024,10 +2033,14 @@ static int do_reset(struct ibmvnic_adapter *adapter,
>>  		} else {
>>  			rc = reset_tx_pools(adapter);
>>  			if (rc)
>> +				netdev_dbg(adapter->netdev, "reset tx pools failed (%d)\n",
>> +						rc);
>>  				goto out;
>>
>>  			rc = reset_rx_pools(adapter);
>>  			if (rc)
>> +				netdev_dbg(adapter->netdev, "reset rx pools failed (%d)\n",
>> +						rc);
>>  				goto out;
>>  		}
>>  		ibmvnic_disable_irqs(adapter);
>
>Hi Sasha!
>
>I just pushed this to net:
>
>8ae4dff882eb ("ibmvnic: add missing parenthesis in do_reset()")
>
>You definitely want to pull that in if you decide to backport this one.

Will do, thanks!

-- 
Thanks,
Sasha
