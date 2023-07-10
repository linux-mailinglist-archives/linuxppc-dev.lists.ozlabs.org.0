Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FA674CEF9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 09:48:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qzx2F5HKFz3c5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 17:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nfschina.com (client-ip=42.101.60.195; helo=mail.nfschina.com; envelope-from=yunchuan@nfschina.com; receiver=lists.ozlabs.org)
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lists.ozlabs.org (Postfix) with SMTP id 4Qzx1k0MmBz30M1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 17:47:52 +1000 (AEST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 211DA602E666D;
	Mon, 10 Jul 2023 15:47:45 +0800 (CST)
Message-ID: <27537aa7-8a2d-8b9f-4a74-4b7dd2463cf3@nfschina.com>
Date: Mon, 10 Jul 2023 15:47:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next v2 01/10] net: wan: Remove unnecessary (void*)
 conversions
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: yunchuan <yunchuan@nfschina.com>
In-Reply-To: <45519aec-6ec8-49e5-b5b2-1b52d336288c@kadam.mountain>
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
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/7/10 15:29, Dan Carpenter wrote:
> On Mon, Jul 10, 2023 at 02:39:33PM +0800, Su Hui wrote:
>> From: wuych <yunchuan@nfschina.com>
>          ^^^^^
> This doesn't look like a real name.

Hi, Dan,

My full name is wuyunchan， but that is too long.
So I use the wuych as simplification.
I will change it to my full name, thanks for your adivce!
>
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
> Don't move the other variables around.  That's unrelated to the cast.
> (Same applies to all the other patches).

I want to move the declarations to be reverse xmas tree.
Maybe moving them is more better?

wuych

>
> regards,
> dan carpenter
>
