Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F881E5266
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 19:34:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470B7p6GxQzDqsh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 04:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470B5L3HThzDqSS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 04:32:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="b4k6pMTq"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 470B5L2NWwz8t3H
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 04:32:38 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 470B5L1xbhz9sPq; Sat, 26 Oct 2019 04:32:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="b4k6pMTq"; dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by ozlabs.org (Postfix) with ESMTP id 470B5K3Pgxz9sPc;
 Sat, 26 Oct 2019 04:32:37 +1100 (AEDT)
Received: from [10.137.112.111] (unknown [131.107.147.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id 842D42010AC6;
 Fri, 25 Oct 2019 10:32:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 842D42010AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1572024755;
 bh=iHY0BIhRWj4FzzaW9EX78Sx4D3Z7kMMY/gOg/k9uflQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=b4k6pMTqdO0i5AHVntdRqb4yi/qWfuDe297Y4pVfsE9IwlqDobrs/tLPUl+9ivN5b
 zC09JHzsrtGqzkxAf1TyRDOKYDtFhWkiwt8kKCn6n+8juEF+oUKh/Xre6rTa7V7oqx
 gXpCwzYTGfcDpRGf+rPMrMDWxHAqu7BtE/1yEZ+s=
Subject: Re: [PATCH v9 5/8] ima: make process_buffer_measurement() generic
To: Nayna Jain <nayna@linux.vnet.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
References: <20191024034717.70552-1-nayna@linux.ibm.com>
 <20191024034717.70552-6-nayna@linux.ibm.com>
 <1ae56786-4d5c-ba8e-e30c-ced1e15ccb9c@linux.microsoft.com>
 <24cf44d5-a1f0-f59e-9884-c026b1ee2d3b@linux.vnet.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <8a97301a-0e25-2718-bd81-d778cb58e1d3@linux.microsoft.com>
Date: Fri, 25 Oct 2019 10:32:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <24cf44d5-a1f0-f59e-9884-c026b1ee2d3b@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Prakhar Srivastava <prsriva02@gmail.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/25/2019 10:24 AM, Nayna Jain wrote:
> 
> On 10/24/19 10:20 AM, Lakshmi Ramasubramanian wrote:
>> On 10/23/19 8:47 PM, Nayna Jain wrote:
>>
>> Hi Nayna,
>>
>>> +void process_buffer_measurement(const void *buf, int size,
>>> +                const char *eventname, enum ima_hooks func,
>>> +                int pcr)
>>>   {
>>>       int ret = 0;
>>>       struct ima_template_entry *entry = NULL;
>>
>>> +    if (func) {
>>> +        security_task_getsecid(current, &secid);
>>> +        action = ima_get_action(NULL, current_cred(), secid, 0, func,
>>> +                    &pcr, &template);
>>> +        if (!(action & IMA_MEASURE))
>>> +            return;
>>> +    }
>>
>> In your change set process_buffer_measurement is called with NONE for 
>> the parameter func. So ima_get_action (the above if block) will not be 
>> executed.
>>
>> Wouldn't it better to update ima_get_action (and related functions) to 
>> handle the ima policy (func param)?
> 
> 
> The idea is to use ima-buf template for the auxiliary measurement 
> record. The auxiliary measurement record is an additional record to the 
> one already created based on the existing policy. When func is passed as 
> NONE, it represents it is an additional record. I am not sure what you 
> mean by updating ima_get_action, it is already handling the ima policy.
>

I was referring to using "func" in process_buffer_measurement to 
determine ima action. In my opinion, process_buffer_measurement should 
be generic.

ima_get_action() should instead determine the required ima action, 
template, pcr, etc. based on "func" passed to it.

thanks,
  -lakshmi

