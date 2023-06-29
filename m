Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C2B741E00
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 04:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qs24W2RZqz30XX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 12:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nfschina.com (client-ip=42.101.60.195; helo=mail.nfschina.com; envelope-from=yunchuan@nfschina.com; receiver=lists.ozlabs.org)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lists.ozlabs.org (Postfix) with SMTP id 4Qs2406y6fz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 12:10:53 +1000 (AEST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 23C4C604D34EE;
	Thu, 29 Jun 2023 10:10:39 +0800 (CST)
Message-ID: <72784932-8390-4f82-fbaa-5086804025df@nfschina.com>
Date: Thu, 29 Jun 2023 10:10:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next 00/10] Remove unnecessary (void*) conversions
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: yunchuan <yunchuan@nfschina.com>
In-Reply-To: <ecd70c28-1629-4b6c-96fc-a0b8f8713a04@lunn.ch>
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
Cc: irusskikh@marvell.com, kernel-janitors@vger.kernel.org, linux@armlinux.org.uk, edumazet@google.com, iyappan@os.amperecomputing.com, anthony.l.nguyen@intel.com, quan@os.amperecomputing.com, Hao Lan <lanhao@huawei.com>, qiang.zhao@nxp.com, f.fainelli@gmail.com, jesse.brandeburg@intel.com, xeb@mail.ru, intel-wired-lan@lists.osuosl.org, yangyingliang@huawei.com, kuba@kernel.org, pabeni@redhat.com, yisen.zhuang@huawei.com, ansuelsmth@gmail.com, steve.glendinning@shawell.net, keyur@os.amperecomputing.com, mostrows@earthlink.net, salil.mehta@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux@rempel-privat.de, olteanv@gmail.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/6/28 22:39, Andrew Lunn wrote:
> On Wed, Jun 28, 2023 at 04:37:43PM +0200, Andrew Lunn wrote:
>>> Hi, Hao Lan,
>>>
>>> Sorry for that, I just compiled these patches in the mainline branch.
>>> I know now, it's also necessary to compile patches in net and net-next
>>> branch.
>>> Thanks for your reply!
>> net-next is also closed at the moment due to the merge window. Please
>> wait two weeks before reposting, by which time net-next will be open
>> again.

Hi, Andrew Lunn,

Understand, and thanks for your reminding!

> Your email threading also seems to be broken, there is no
> threading. That might cause pathworks an issue.
Sometimes it doesn't work, but I also receive email from email list.
So I can read your email from email list although something is broken.
Thanks again！

wuych

>
> 	Andrew
