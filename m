Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB13136F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 19:06:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FrT034cxzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 03:06:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=afaerber@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FrQ2371gzDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2019 03:03:53 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91664ACC4;
 Fri, 31 May 2019 17:03:49 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
 <d086216f-f3fc-c88a-3891-81e84e8bdb01@suse.de>
 <VI1PR04MB5134BFA391D8FF013762882FEC190@VI1PR04MB5134.eurprd04.prod.outlook.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Openpgp: preference=signencrypt
Organization: SUSE Linux GmbH
Message-ID: <19cc3230-33b0-e465-6317-590780b33efa@suse.de>
Date: Fri, 31 May 2019 19:03:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB5134BFA391D8FF013762882FEC190@VI1PR04MB5134.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Madalin-cristian Bucur <madalin.bucur@nxp.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Camelia Alexandra Groza <camelia.groza@nxp.com>,
 Mian Yousaf Kaukab <yousaf.kaukab@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Laurentiu,

Am 31.05.19 um 18:46 schrieb Laurentiu Tudor:
>> -----Original Message-----
>> From: Andreas Färber <afaerber@suse.de>
>> Sent: Friday, May 31, 2019 7:15 PM
>>
>> Hi Laurentiu,
>>
>> Am 30.05.19 um 16:19 schrieb laurentiu.tudor@nxp.com:
>>> This patch series contains several fixes in preparation for SMMU
>>> support on NXP LS1043A and LS1046A chips. Once these get picked up,
>>> I'll submit the actual SMMU enablement patches consisting in the
>>> required device tree changes.
>>
>> Have you thought through what will happen if this patch ordering is not
>> preserved? In particular, a user installing a future U-Boot update with
>> the DTB bits but booting a stable kernel without this patch series -
>> wouldn't that regress dpaa then for our customers?
>>
> 
> These are fixes for issues that popped out after enabling SMMU. 
> I do not expect them to break anything.

That was not my question! You're missing my point: All your patches are
lacking a Fixes header in their commit message, for backporting them, to
avoid _your DT patches_ breaking the driver on stable branches!

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
