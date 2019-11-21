Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F295C10523E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 13:24:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jdz95dyyzDr3b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 23:24:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p02-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5302::10;
 helo=mo6-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="OHNp8aBN"; 
 dkim-atps=neutral
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jdwr6vWDzDr39
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 23:22:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574338933;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=bshxsySaQL89IBapcTw7rIhhAV9yvH+q6m8w6XoYDuE=;
 b=OHNp8aBNwiHomYfi71YcukSfYmVLydFZgAoCl8/NJR5NhDshx3HIHk0Tey+kisnjdQ
 iw/Wej/8acX6YjHViqzV7FvdADwzDO2qr0+rvGhqe86qCN81n3Rg8EsY4j1O4QX7SIYZ
 eN1jRLJ1ivcDfOGVWXabmoeIzGs5P60QMBzAYSTawDs0VMTs3YX3Oga35/ascuO0cbDV
 pFoC5g3QcuWqEGuIsHKR3Ujh/VnOXhfrGhngO4hBdYfKefjtTznZA3SAnY16QVEPYJyI
 vUtQjUiJnTh/QC2r3i4EEgbo5ESsgt1ZAgcouC0Ay84+o8abr6lMX9DMG7JxW/3lRytp
 PJfg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgBcsBrTF1qGB6TwVFx4Pq4s7A="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:bd57:573a:d50f:b5]
 by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id q007c8vALCLOiWS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 21 Nov 2019 13:21:24 +0100 (CET)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Christoph Hellwig <hch@lst.de>
References: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
 <20191121072943.GA24024@lst.de>
 <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
Message-ID: <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
Date: Thu, 21 Nov 2019 13:21:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
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
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net,
 mad skateman <madskateman@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, paulus@samba.org, rtd2@xtra.co.nz,
 "contact@a-eon.com" <contact@a-eon.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21 November 2019 at 01:16 pm, Christian Zigotzky wrote:
> On 21 November 2019 at 08:29 am, Christoph Hellwig wrote:
>> On Sat, Nov 16, 2019 at 08:06:05AM +0100, Christian Zigotzky wrote:
>>> /*
>>>   *  DMA addressing mode.
>>>   *
>>>   *  0 : 32 bit addressing for all chips.
>>>   *  1 : 40 bit addressing when supported by chip.
>>>   *  2 : 64 bit addressing when supported by chip,
>>>   *      limited to 16 segments of 4 GB -> 64 GB max.
>>>   */
>>> #define   SYM_CONF_DMA_ADDRESSING_MODE 
>>> CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
>>>
>>> Cyrus config:
>>>
>>> CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
>>>
>>> I will configure “0 : 32 bit addressing for all chips” for the RC8. 
>>> Maybe this is the solution.
>> 0 means you are going to do bounce buffering a lot, which seems
>> generally like a bad idea.
>>
>> But why are we talking about the sym53c8xx driver now?  The last issue
>> you reported was about video4linux allocations.
>>
> Both drivers have the same problem. They don't work if we have more 
> than 3.5GB RAM. I try to find a solution until you have a good 
> solution. I have already a solution for V4L but I still need one for 
> the sym53c8xx driver.
OK, you mean that "0" is a bad idea but maybe it works until you have a 
solution. ;-)

