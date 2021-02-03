Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1659630E160
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 18:47:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW8KM1JvPzDxV7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 04:47:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=VnGV5Ki1; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DW8J464XQzDwxD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 04:46:44 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8B01220B7192;
 Wed,  3 Feb 2021 09:46:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8B01220B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612374401;
 bh=3RICIW6ifzknABr+efjv9dnif1PvuEM7vXwzp3I9uVk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VnGV5Ki16nGyG3QUZJWQdHCAoC9+Yhc9TlgiDzQpGOKycF5QkederFZHOZYJJ8slr
 woSSRz8xuZhkVFjEzfi+5M9o3WEZIGtPWrDXd08IPVQVi4b+IUxQrpFIeNwXFDZT3x
 kQOB8ZbFSbPOREgVwvK77c8ZRNoycRwlegERH3RE=
Subject: Re: [PATCH 2/2] ima: Free IMA measurement buffer after kexec syscall
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <20210121173003.18324-1-nramas@linux.microsoft.com>
 <20210121173003.18324-2-nramas@linux.microsoft.com>
 <87bldg1u3s.fsf@manicouagan.localdomain>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <15fb8c53-2aa0-dc5e-123d-87fee78aacb5@linux.microsoft.com>
Date: Wed, 3 Feb 2021 09:46:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87bldg1u3s.fsf@manicouagan.localdomain>
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
 gregkh@linuxfoundation.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/22/21 2:31 PM, Thiago Jung Bauermann wrote:
> 
> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> 
>> IMA allocates kernel virtual memory to carry forward the measurement
>> list, from the current kernel to the next kernel on kexec system call,
>> in ima_add_kexec_buffer() function.  This buffer is not freed before
>> completing the kexec system call resulting in memory leak.
>>
>> Add ima_buffer field in "struct kimage" to store the virtual address
>> of the buffer allocated for the IMA measurement list.
>> Free the memory allocated for the IMA measurement list in
>> kimage_file_post_load_cleanup() function.
>>
>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>> Suggested-by: Tyler Hicks <tyhicks@linux.microsoft.com>
>> Fixes: 7b8589cc29e7 ("ima: on soft reboot, save the measurement list")
> 
> Good catch.
> 
> Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> 

Thanks Thiago.

  -lakshmi

