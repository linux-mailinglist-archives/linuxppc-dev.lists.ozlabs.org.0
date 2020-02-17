Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD6161602
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 16:22:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Lnlv425rzDqhl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 02:22:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.48.182; helo=7.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 7.mo2.mail-out.ovh.net (7.mo2.mail-out.ovh.net [188.165.48.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Lnjx644QzDqbg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 02:20:33 +1100 (AEDT)
Received: from player730.ha.ovh.net (unknown [10.110.115.178])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 2E7D61C9188
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 16:20:26 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id C715FF4F826F;
 Mon, 17 Feb 2020 15:20:23 +0000 (UTC)
Subject: Re: QEMU/KVM snapshot restore bug
To: dftxbs3e <dftxbs3e@free.fr>, linuxppc-dev@lists.ozlabs.org,
 Greg Kurz <groug@kaod.org>
References: <7544eb90-71a6-3709-c530-9c83beb943a7@free.fr>
 <06cc1954-9bf5-0178-668e-130411ea1b13@kaod.org>
 <49161ca3-941a-4f8b-f0ef-cce49ab0f9cd@free.fr>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <90b5fff0-45dc-9722-db81-2ade45b5aebd@kaod.org>
Date: Mon, 17 Feb 2020 16:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <49161ca3-941a-4f8b-f0ef-cce49ab0f9cd@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12626404506230819737
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeftddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/17/20 3:48 AM, dftxbs3e wrote:
> On 2/16/20 7:16 PM, Cédric Le Goater wrote:
>>
>> I think this is fixed by commit f55750e4e4fb ("spapr/xive: Mask the EAS when 
>> allocating an IRQ") which is not in QEMU 4.1.1. The same problem should also 
>> occur with LE guests. 
>>
>> Could you possibly regenerate the QEMU rpm with this patch ? 
>>
>> Thanks,
>>
>> C.
> 
> Hello!
> 
> I applied the patch and reinstalled the RPM then tried to restore the
> snapshot I created previously and it threw the same error.
> 
> Do I need to re-create the snapshot and/or restart the machine? 

yes. The problem is at the source.

> I have
> important workloads running so that'll be possible only in a few days if
> needed.
OK. 

Thanks,

C. 
