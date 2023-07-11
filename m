Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5803274E312
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:14:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0NF12KsBz3c76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 11:14:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nfschina.com (client-ip=42.101.60.195; helo=mail.nfschina.com; envelope-from=yunchuan@nfschina.com; receiver=lists.ozlabs.org)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lists.ozlabs.org (Postfix) with SMTP id 4R0NDS3McTz30fn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 11:13:43 +1000 (AEST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id EFE6C602AC886;
	Tue, 11 Jul 2023 09:13:31 +0800 (CST)
Message-ID: <5ed0fff8-52dd-4059-797b-4275d54ae86b@nfschina.com>
Date: Tue, 11 Jul 2023 09:13:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next v2 01/10] net: wan: Remove unnecessary (void*)
 conversions
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: yunchuan <yunchuan@nfschina.com>
In-Reply-To: <23e98085-8f07-4ee2-8487-8e3b439b69f4@lunn.ch>
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
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, Dan Carpenter <dan.carpenter@linaro.org>, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/7/11 00:34, Andrew Lunn wrote:
> On Mon, Jul 10, 2023 at 02:39:33PM +0800, Su Hui wrote:
>> From: wuych <yunchuan@nfschina.com>
>>
>> Pointer variables of void * type do not require type cast.
>>
>> Signed-off-by: wuych <yunchuan@nfschina.com>
>> ---
>>   drivers/net/wan/fsl_ucc_hdlc.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
>> index 47c2ad7a3e42..73c73d8f4bb2 100644
>> --- a/drivers/net/wan/fsl_ucc_hdlc.c
>> +++ b/drivers/net/wan/fsl_ucc_hdlc.c
>> @@ -350,11 +350,11 @@ static int uhdlc_init(struct ucc_hdlc_private *priv)
>>   static netdev_tx_t ucc_hdlc_tx(struct sk_buff *skb, struct net_device *dev)
>>   {
>>   	hdlc_device *hdlc = dev_to_hdlc(dev);
>> -	struct ucc_hdlc_private *priv = (struct ucc_hdlc_private *)hdlc->priv;
>> -	struct qe_bd *bd;
>> -	u16 bd_status;
>> +	struct ucc_hdlc_private *priv = hdlc->priv;
>>   	unsigned long flags;
>>   	__be16 *proto_head;
>> +	struct qe_bd *bd;
>> +	u16 bd_status;
> When dealing with existing broken reverse Christmas tree, please don't
> make it worse with a change. But actually fixing it should be in a
> different patch.
>
> We want patches to be obviously correct. By removing the cast and
> moving variables around, it is less obvious it is correct, than having
> two patches.
Got it, thanks.
I will resend the v3 later  which remove the change of reverse Christmas 
tree.
So sorry for this!

Wu Yunchuan

>
>         Andrew
