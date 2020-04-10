Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7C1A445D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 11:16:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zC7D74QLzDrNg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 19:16:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=cmss.chinamobile.com (client-ip=221.176.66.79;
 helo=cmccmta1.chinamobile.com; envelope-from=tangbin@cmss.chinamobile.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cmss.chinamobile.com
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by lists.ozlabs.org (Postfix) with ESMTP id 48zC5B2QrpzDqlV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 19:14:26 +1000 (AEST)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.15]) by
 rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee15e9038cfc4b-02bfa;
 Fri, 10 Apr 2020 17:13:51 +0800 (CST)
X-RM-TRANSID: 2ee15e9038cfc4b-02bfa
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.21.224] (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee85e9038ce8b0-29025;
 Fri, 10 Apr 2020 17:13:51 +0800 (CST)
X-RM-TRANSID: 2ee85e9038ce8b0-29025
Subject: Re: usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
To: Markus Elfring <Markus.Elfring@web.de>, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
 <be8cd229-884a-40e6-3363-7c4680a51b30@web.de>
 <0b718268-d330-dfc1-aca3-3dd3203363d7@cmss.chinamobile.com>
 <aa7006c9-8b83-5f30-86a6-8d60d290f824@web.de>
From: Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <a4738b42-b297-766c-56bf-94a91bc82767@cmss.chinamobile.com>
Date: Fri, 10 Apr 2020 17:15:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aa7006c9-8b83-5f30-86a6-8d60d290f824@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Markus:

On 2020/4/10 16:30, Markus Elfring wrote:
>> Hardware experiments show that the negative return value is not just "-EPROBE_DEFER".
> How much will this specific error code influence our understanding
> of the discussed software situation?
>
 From my superficial knowledge, I think we should not  think about it 
too complicated. The return value is just zero or negative, and for 
these negative return value, such as 
"-ENODEV"、"-ENXIO"、"-ENOENT"、“EPROBE_DEFER”，may be the same 
effect。But“-EPROBE_DEFER”has another  importment function: Driver 
requested deferred probing，which is used in cases where the dependency 
resource is not ready during the driver initialization process.
>>>> +        ret = udc_controller->irq ? : -ENODEV;
>>> Will it be clearer to specify values for all cases in such a conditional operator
>>> (instead of leaving one case empty)?
>> I don't know what you mean of "instead of leaving one case empty".
> I suggest to reconsider also the proposed specification “… ? : …”.

What you mean is the way I'm written？

I have provided two ways of patching, both functional can be verified on 
hardware.

Thanks for your patience.

Tang Bin



