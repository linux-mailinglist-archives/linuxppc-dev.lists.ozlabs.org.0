Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F972C5E5E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 00:59:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Chvqq0J4mzDrWQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 10:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chvnz66YjzDrHP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 10:57:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iaVDaTTE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Chvny6rTWz9s0b;
 Fri, 27 Nov 2020 10:57:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606435063;
 bh=gJxZj9SbCLJ/E0fyYnnEPeo7x14uVr1mz+5f/wlZY1I=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iaVDaTTEOLWD5vohJt5b2zT/Ca5t7BrIsBzKUdElkeLFjvCbFHEq1EsOWb2ej9DZZ
 Pmt3qT1pRQXCLX9lrxL8lkSTh+97P3EswBq6RM3WICeXNDST6lPRfUZBniu5SNTXT7
 PS1h8j+L6WbLnVTaoTPNnxZHuV/E7mBKosIF+5mA5stA9HkJQRviwdlFK15x5gnhgc
 XO4npI2tvNk+kyqzci5zv7QkkLm+v97Q9Ux5i7ytMFbLWotH93MXzvGolzIYuQs7OM
 mQ3lvtQXAEEbHuFhMuC8BHuQT0XXVKpZd6vop3iAhU6KEUC9JWsignakscrAaH5XIL
 Ti1hWreJ2CawQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net 1/2] ibmvnic: Ensure that SCRQ entry reads are
 correctly ordered
In-Reply-To: <2da3e517-f1dd-95c9-11db-a6c62bf61978@linux.ibm.com>
References: <1606238776-30259-1-git-send-email-tlfalcon@linux.ibm.com>
 <1606238776-30259-2-git-send-email-tlfalcon@linux.ibm.com>
 <87o8jmyosh.fsf@mpe.ellerman.id.au>
 <2da3e517-f1dd-95c9-11db-a6c62bf61978@linux.ibm.com>
Date: Fri, 27 Nov 2020 10:57:39 +1100
Message-ID: <87lfeny8lo.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: cforno12@linux.ibm.com, ljp@linux.vnet.ibm.com, ricklind@linux.ibm.com,
 dnbanerg@us.ibm.com, drt@linux.vnet.ibm.com, brking@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Falcon <tlfalcon@linux.ibm.com> writes:
> On 11/24/20 11:43 PM, Michael Ellerman wrote:
>> Thomas Falcon <tlfalcon@linux.ibm.com> writes:
>>> Ensure that received Subordinate Command-Response Queue (SCRQ)
>>> entries are properly read in order by the driver. These queues
>>> are used in the ibmvnic device to process RX buffer and TX completion
>>> descriptors. dma_rmb barriers have been added after checking for a
>>> pending descriptor to ensure the correct descriptor entry is checked
>>> and after reading the SCRQ descriptor to ensure the entire
>>> descriptor is read before processing.
>>>
>>> Fixes: 032c5e828 ("Driver for IBM System i/p VNIC protocol")
>>> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
>>> ---
>>>   drivers/net/ethernet/ibm/ibmvnic.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
>>> index 2aa40b2..489ed5e 100644
>>> --- a/drivers/net/ethernet/ibm/ibmvnic.c
>>> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
>>> @@ -2403,6 +2403,8 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
>>>   
>>>   		if (!pending_scrq(adapter, adapter->rx_scrq[scrq_num]))
>>>   			break;
>>> +		/* ensure that we do not prematurely exit the polling loop */
>>> +		dma_rmb();
>> I'd be happier if these comments were more specific about which read(s)
>> they are ordering vs which other read(s).
>>
>> I'm sure it's obvious to you, but it may not be to a future author,
>> and/or after the code has been refactored over time.
>
> Thank you for reviewing! I will submit a v2 soon with clearer comments 
> on the reads being ordered here.

Thanks.

cheers
