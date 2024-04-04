Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E946F8981B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 08:56:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=wetzel-home.de header.i=@wetzel-home.de header.a=rsa-sha256 header.s=wetzel-home header.b=mhkEJjAi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9C8D4lRTz3vZF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 17:56:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=wetzel-home.de header.i=@wetzel-home.de header.a=rsa-sha256 header.s=wetzel-home header.b=mhkEJjAi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wetzel-home.de (client-ip=2a03:4000:40:5b2::1; helo=ns2.wdyn.eu; envelope-from=alexander@wetzel-home.de; receiver=lists.ozlabs.org)
Received: from ns2.wdyn.eu (ns2.wdyn.eu [IPv6:2a03:4000:40:5b2::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9C7S00zZz3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 17:55:47 +1100 (AEDT)
Message-ID: <5cbb1668-1640-4a5d-b6a8-ed0e5840b9ee@wetzel-home.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wetzel-home.de;
	s=wetzel-home; t=1712213733;
	bh=/TkSoJVhwN0sFa9XmDOyKapqxmji/XCgpaNo1YUh5MY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mhkEJjAi8tugEdCRcm1yf39ytSuvVtyOezlR1jntHq0B2m3i9GCfRSh9RxMW7cYJd
	 3tvtox0qhFFoCV6B0QP4LrVGHYgQfF/sD3Qt+EW2KbhI6VvI8pBhvxgufc7BKLK94h
	 O+vHqg0FV/kBEnDV7hbd4ggD2HVFOYxuq6NVZATY=
Date: Thu, 4 Apr 2024 08:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scsi: sg: Avoid race in error handling & drop bogus
 warn
To: Bart Van Assche <bvanassche@acm.org>, dgilbert@interlog.com
References: <81266270-42F4-48F9-9139-8F0C3F0A6553@linux.ibm.com>
 <20240401191038.18359-1-Alexander@wetzel-home.de>
 <bc800bdd-6563-40ba-bc8d-e98b87748c15@acm.org>
Content-Language: en-US, de-DE
From: Alexander Wetzel <alexander@wetzel-home.de>
In-Reply-To: <bc800bdd-6563-40ba-bc8d-e98b87748c15@acm.org>
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org, stable@vger.kernel.org, sachinp@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04.04.24 01:24, Bart Van Assche wrote:
> On 4/1/24 12:10 PM, Alexander Wetzel wrote:
>> @@ -301,11 +302,12 @@ sg_open(struct inode *inode, struct file *filp)
>>       /* This driver's module count bumped by fops_get in <linux/fs.h> */
>>       /* Prevent the device driver from vanishing while we sleep */
>> -    retval = scsi_device_get(sdp->device);
>> +    device = sdp->device;
>> +    retval = scsi_device_get(device);
>>       if (retval)
>>           goto sg_put;
> 
> Are all the sdp->device -> device changes essential? Isn't there a
> preference to minimize patches that will end up in the stable trees?
> 

Only the very last change is essential:
-       scsi_device_put(sdp->device);
-       goto sg_put;
+       kref_put(&sdp->d_ref, sg_device_destroy);
+       scsi_device_put(device);
+       return retval;

Not using a (required) local variable and de-referencing it again and 
looks strange for anyone reading the code. While the additional lines in 
the patch are trivial to review...

Alexander
