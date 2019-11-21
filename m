Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28B105232
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 13:20:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JdtS0FrQzDr2y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 23:20:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::8;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="mXnTgG9/"; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (unknown
 [IPv6:2a01:238:20a:202:5301::8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JdqQ2SBQzDr2k
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 23:17:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574338643;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=AxkjqpX58AUIucsroDUl2nypkVTcNCP8/zSs6m4uJM0=;
 b=mXnTgG9/mAfqUbEueMZymxGmGEN+JfOGRfoWUEGv9qlDvBTQsaNK6qgzQrFwqiNcRD
 +Woqtawq7PaeXc6NpXhN4oukd13k8rcJ+6USTCoLBnwTuS+lZ8t1HDJEDVUqC6wDROzq
 5jUYWmS2PI0O1ZQMnEQF4Oo+CJ2W03G9z4DqIwsH44721MVlQ73ItyWC0aNZ24ePgXbV
 DGRGcmr1k/sNtLZTiS652KNBc9tMKtwUSSCzQq/BPeCUVdETIQnM8qKARaG0DtUM+TD0
 tEMZ13W9rKUZbwdbyqAoQFs12d3GokpQgYyecZ5TJPoKlZM/CgZbv7Cf/z8QLNonoIhP
 LXiw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgBcsBrTF1qGB6TwVFx4Pq4s7A="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:bd57:573a:d50f:b5]
 by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id q007c8vALCGdiTu
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 21 Nov 2019 13:16:39 +0100 (CET)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
To: Christoph Hellwig <hch@lst.de>
References: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
 <20191121072943.GA24024@lst.de>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
Date: Thu, 21 Nov 2019 13:16:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121072943.GA24024@lst.de>
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

On 21 November 2019 at 08:29 am, Christoph Hellwig wrote:
> On Sat, Nov 16, 2019 at 08:06:05AM +0100, Christian Zigotzky wrote:
>> /*
>>   *  DMA addressing mode.
>>   *
>>   *  0 : 32 bit addressing for all chips.
>>   *  1 : 40 bit addressing when supported by chip.
>>   *  2 : 64 bit addressing when supported by chip,
>>   *      limited to 16 segments of 4 GB -> 64 GB max.
>>   */
>> #define   SYM_CONF_DMA_ADDRESSING_MODE CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
>>
>> Cyrus config:
>>
>> CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
>>
>> I will configure “0 : 32 bit addressing for all chips” for the RC8. Maybe this is the solution.
> 0 means you are going to do bounce buffering a lot, which seems
> generally like a bad idea.
>
> But why are we talking about the sym53c8xx driver now?  The last issue
> you reported was about video4linux allocations.
>
Both drivers have the same problem. They don't work if we have more than 
3.5GB RAM. I try to find a solution until your have a good solution. I 
have already a solution for V4L but I still need one for the sym53c8xx 
driver.
