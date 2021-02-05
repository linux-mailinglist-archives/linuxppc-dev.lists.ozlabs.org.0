Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8687310EE6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 18:41:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXN500r9CzDwly
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 04:41:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=pPLebMnD; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DXN2Z20bZzDwjk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 04:39:17 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 72E6C20B6C40;
 Fri,  5 Feb 2021 09:39:15 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 72E6C20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612546755;
 bh=HhOAZD2n7Y5nUjPEAl7h3S686KemCI0DTcFZcZkv6EE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pPLebMnDJH4+oF4Wosz3wKn0HGUpcCKpETnQ1382bqaeKGAtD2BOGcDKevTLA55e1
 OsELd4GAKcCiA8pcT8fsjjgjrB1yeYfQGMhblNCu/1Du7oGfzkI/SrvdaYJ40LueW4
 55pH9N2No/AMCipLzCvfMU/IaRxxL8Mlth5qxzbU=
Subject: Re: [PATCH v2 1/2] ima: Free IMA measurement buffer on error
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210204174951.25771-1-nramas@linux.microsoft.com>
 <YB0YdqbbdAdbEOQw@kroah.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <7000d128-272e-3654-8480-e46bf7dfad74@linux.microsoft.com>
Date: Fri, 5 Feb 2021 09:39:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YB0YdqbbdAdbEOQw@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: sashal@kernel.org, dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org,
 zohar@linux.ibm.com, tyhicks@linux.microsoft.com, ebiederm@xmission.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/5/21 2:05 AM, Greg KH wrote:
> On Thu, Feb 04, 2021 at 09:49:50AM -0800, Lakshmi Ramasubramanian wrote:
>> IMA allocates kernel virtual memory to carry forward the measurement
>> list, from the current kernel to the next kernel on kexec system call,
>> in ima_add_kexec_buffer() function.  In error code paths this memory
>> is not freed resulting in memory leak.
>>
>> Free the memory allocated for the IMA measurement list in
>> the error code paths in ima_add_kexec_buffer() function.
>>
>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>> Suggested-by: Tyler Hicks <tyhicks@linux.microsoft.com>
>> Fixes: 7b8589cc29e7 ("ima: on soft reboot, save the measurement list")
>> ---
>>   security/integrity/ima/ima_kexec.c | 1 +
>>   1 file changed, 1 insertion(+)
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
> 
> </formletter>
> 

Thanks for the info Greg.

I will re-submit the two patches in the proper format.

  -lakshmi

