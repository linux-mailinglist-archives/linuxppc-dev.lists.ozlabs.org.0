Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DBFEB60F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 18:24:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473scx66v7zF67M
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 04:24:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473sZZ4YY0zF4MT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 04:22:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="r9G79qhH"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 473sZZ3k4Vz8t9t
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 04:22:14 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 473sZZ322Mz9sPd; Fri,  1 Nov 2019 04:22:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="r9G79qhH"; dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by ozlabs.org (Postfix) with ESMTP id 473sZY72qRz9sP3;
 Fri,  1 Nov 2019 04:22:13 +1100 (AEDT)
Received: from [10.137.112.108] (unknown [131.107.174.108])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8794120B7192;
 Thu, 31 Oct 2019 10:22:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8794120B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1572542532;
 bh=lGGAmFcY9SA4jmgoRVD92VXxiStVLCF3ODqAcpuQBN8=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=r9G79qhHEiU1XZa3cy6omxvf9PHpey4azvnm8fkhQ56IbemOVR4aMas5KpQ74vrGa
 gN/hYNlyYLqn7foHZF33hQ/GhuwMoTRHFUKFGTGSFa5ns1Sih4BTJEnPqkV8xR09Qg
 2BW81Ycq2VA8LtG28wfkvkEdAJjDAEPHTQWi2Low=
Subject: Re: [PATCH v10 5/9] ima: make process_buffer_measurement() generic
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
References: <1572492694-6520-1-git-send-email-zohar@linux.ibm.com>
 <1572492694-6520-6-git-send-email-zohar@linux.ibm.com>
 <de6077ad-6d45-ef99-3ba7-79b3c48ae944@linux.microsoft.com>
Message-ID: <cadb8196-6bfb-2832-229f-24f67befdf78@linux.microsoft.com>
Date: Thu, 31 Oct 2019 10:22:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <de6077ad-6d45-ef99-3ba7-79b3c48ae944@linux.microsoft.com>
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
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/31/19 10:02 AM, Lakshmi Ramasubramanian wrote:

> On 10/30/19 8:31 PM, Mimi Zohar wrote:
> 
>>   void ima_kexec_cmdline(const void *buf, int size)
>>   {
>> -    u32 secid;
>> -
>> -    if (buf && size != 0) {
>> -        security_task_getsecid(current, &secid);
>> +    if (buf && size != 0)
> 
> Open brace { is missing in the above if statement.

My mistake -
I now see that the braces {} have been removed in the if statement since 
there is only line body  the call to process_buffer_measurement()

  -lakshmi

> 
>>           process_buffer_measurement(buf, size, "kexec-cmdline",
>> -                       current_cred(), secid);
>> -    }
>> +                       KEXEC_CMDLINE, 0);
>>   }
> 
>   -lakshmi

