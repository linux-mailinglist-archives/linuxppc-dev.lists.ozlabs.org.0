Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0B2D5FD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 16:36:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsJ1N6TLbzDr3L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 02:36:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsDyJ3Mp8zDqwM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 00:18:46 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0FC0572F9FAB;
 Thu, 10 Dec 2020 14:18:39 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Dec
 2020 14:18:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004e78d135d-1f16-425f-ace0-9971b92d29de,
 35DF0118C1BD2D4E469FA4C27706E890450E7B32) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 09/13] powerpc/xive: Remove P9 DD1 flag
 XIVE_IRQ_FLAG_SHIFT_BUG
To: Greg Kurz <groug@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-10-clg@kaod.org> <20201208183906.1740c594@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c2251500-b03f-ac1c-8298-3a2d2c50953e@kaod.org>
Date: Thu, 10 Dec 2020 14:18:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208183906.1740c594@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 15312e56-b65a-4e56-9985-6a562132133c
X-Ovh-Tracer-Id: 2319072336630156186
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehuedtheeghfdvhedtueelteegvdefueektdefiefhffffieduuddtudfhgfevtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/8/20 6:39 PM, Greg Kurz wrote:
> On Tue, 8 Dec 2020 16:11:20 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> This flag was used to support the PHB4 LSIs on P9 DD1 and we have
>> stopped supporting this CPU when DD2 came out. See skiboot commit:
>>
>>   https://github.com/open-power/skiboot/commit/0b0d15e3c170
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Just a minor suggestion in case you need to post a v2. See below.
> 
>>  arch/powerpc/include/asm/opal-api.h     | 2 +-
>>  arch/powerpc/include/asm/xive.h         | 2 +-
>>  arch/powerpc/kvm/book3s_xive_native.c   | 3 ---
>>  arch/powerpc/kvm/book3s_xive_template.c | 3 ---
>>  arch/powerpc/sysdev/xive/common.c       | 8 --------
>>  arch/powerpc/sysdev/xive/native.c       | 2 --
>>  6 files changed, 2 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
>> index 1dffa3cb16ba..48ee604ca39a 100644
>> --- a/arch/powerpc/include/asm/opal-api.h
>> +++ b/arch/powerpc/include/asm/opal-api.h
>> @@ -1091,7 +1091,7 @@ enum {
>>  	OPAL_XIVE_IRQ_TRIGGER_PAGE	= 0x00000001,
>>  	OPAL_XIVE_IRQ_STORE_EOI		= 0x00000002,
>>  	OPAL_XIVE_IRQ_LSI		= 0x00000004,
>> -	OPAL_XIVE_IRQ_SHIFT_BUG		= 0x00000008,
>> +	OPAL_XIVE_IRQ_SHIFT_BUG		= 0x00000008, /* P9 DD1.0 workaround */
> 
> Maybe you can even comment the entire line so that any future
> tentative to use that flag breaks build ?

This file is "copied" from OPAL. I think it is best to keep them
in sync.

> 
>>  	OPAL_XIVE_IRQ_MASK_VIA_FW	= 0x00000010,
>>  	OPAL_XIVE_IRQ_EOI_VIA_FW	= 0x00000020,
>>  };
>> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
>> index d332dd9a18de..ff805885a028 100644
>> --- a/arch/powerpc/include/asm/xive.h
>> +++ b/arch/powerpc/include/asm/xive.h
>> @@ -60,7 +60,7 @@ struct xive_irq_data {
>>  };
>>  #define XIVE_IRQ_FLAG_STORE_EOI	0x01
>>  #define XIVE_IRQ_FLAG_LSI	0x02
>> -#define XIVE_IRQ_FLAG_SHIFT_BUG	0x04
>> +#define XIVE_IRQ_FLAG_SHIFT_BUG	0x04 /* P9 DD1.0 workaround */
> 
> Same here, with an extra cleanup to stop using it when initializing 
> xive_irq_flags[] in common.c.

Yes. Since this is an internal flag, we can simply remove it.

Thanks,

C. 

> 
>>  #define XIVE_IRQ_FLAG_MASK_FW	0x08
>>  #define XIVE_IRQ_FLAG_EOI_FW	0x10
>>  #define XIVE_IRQ_FLAG_H_INT_ESB	0x20
>> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
>> index 9b395381179d..170d1d04e1d1 100644
>> --- a/arch/powerpc/kvm/book3s_xive_native.c
>> +++ b/arch/powerpc/kvm/book3s_xive_native.c
>> @@ -37,9 +37,6 @@ static u8 xive_vm_esb_load(struct xive_irq_data *xd, u32 offset)
>>  	 * ordering.
>>  	 */
>>  
>> -	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
>> -		offset |= offset << 4;
>> -
>>  	val = in_be64(xd->eoi_mmio + offset);
>>  	return (u8)val;
>>  }
>> diff --git a/arch/powerpc/kvm/book3s_xive_template.c b/arch/powerpc/kvm/book3s_xive_template.c
>> index 4ad3c0279458..ece36e024a8f 100644
>> --- a/arch/powerpc/kvm/book3s_xive_template.c
>> +++ b/arch/powerpc/kvm/book3s_xive_template.c
>> @@ -61,9 +61,6 @@ static u8 GLUE(X_PFX,esb_load)(struct xive_irq_data *xd, u32 offset)
>>  	if (offset == XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
>>  		offset |= XIVE_ESB_LD_ST_MO;
>>  
>> -	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
>> -		offset |= offset << 4;
>> -
>>  	val =__x_readq(__x_eoi_page(xd) + offset);
>>  #ifdef __LITTLE_ENDIAN__
>>  	val >>= 64-8;
>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>> index 411cba12d73b..a9259470bf9f 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
>> @@ -200,10 +200,6 @@ static notrace u8 xive_esb_read(struct xive_irq_data *xd, u32 offset)
>>  	if (offset == XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
>>  		offset |= XIVE_ESB_LD_ST_MO;
>>  
>> -	/* Handle HW errata */
>> -	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
>> -		offset |= offset << 4;
>> -
>>  	if ((xd->flags & XIVE_IRQ_FLAG_H_INT_ESB) && xive_ops->esb_rw)
>>  		val = xive_ops->esb_rw(xd->hw_irq, offset, 0, 0);
>>  	else
>> @@ -214,10 +210,6 @@ static notrace u8 xive_esb_read(struct xive_irq_data *xd, u32 offset)
>>  
>>  static void xive_esb_write(struct xive_irq_data *xd, u32 offset, u64 data)
>>  {
>> -	/* Handle HW errata */
>> -	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
>> -		offset |= offset << 4;
>> -
>>  	if ((xd->flags & XIVE_IRQ_FLAG_H_INT_ESB) && xive_ops->esb_rw)
>>  		xive_ops->esb_rw(xd->hw_irq, offset, data, 1);
>>  	else
>> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
>> index 5f1e5aed8ab4..0310783241b5 100644
>> --- a/arch/powerpc/sysdev/xive/native.c
>> +++ b/arch/powerpc/sysdev/xive/native.c
>> @@ -64,8 +64,6 @@ int xive_native_populate_irq_data(u32 hw_irq, struct xive_irq_data *data)
>>  		data->flags |= XIVE_IRQ_FLAG_STORE_EOI;
>>  	if (opal_flags & OPAL_XIVE_IRQ_LSI)
>>  		data->flags |= XIVE_IRQ_FLAG_LSI;
>> -	if (opal_flags & OPAL_XIVE_IRQ_SHIFT_BUG)
>> -		data->flags |= XIVE_IRQ_FLAG_SHIFT_BUG;
>>  	if (opal_flags & OPAL_XIVE_IRQ_MASK_VIA_FW)
>>  		data->flags |= XIVE_IRQ_FLAG_MASK_FW;
>>  	if (opal_flags & OPAL_XIVE_IRQ_EOI_VIA_FW)
> 

