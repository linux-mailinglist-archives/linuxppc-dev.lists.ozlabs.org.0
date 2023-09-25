Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 588057ACDAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 03:44:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rv5Jv2Z15z3c5f
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 11:44:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rv5JN0H76z30f8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 11:44:01 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0Vsjl30y_1695606232;
Received: from 30.240.112.49(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Vsjl30y_1695606232)
          by smtp.aliyun-inc.com;
          Mon, 25 Sep 2023 09:43:54 +0800
Message-ID: <f70e93c6-ba5b-a71c-4b82-33b279c76b0e@linux.alibaba.com>
Date: Mon, 25 Sep 2023 09:43:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: Questions: Should kernel panic when PCIe fatal error occurs?
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>, Bjorn Helgaas <helgaas@kernel.org>
References: <20230920230257.GA280837@bhelgaas>
 <d84b6d17-7fe9-222a-c874-798af4d9faea@linux.alibaba.com>
 <2e5870e416f84e8fad8340061ec303e2@AcuMS.aculab.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <2e5870e416f84e8fad8340061ec303e2@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, Linux PCI <linux-pci@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lenb@kernel.org" <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/9/21 21:20, David Laight wrote:
> ...
> I've got a target to generate AER errors by generating read cycles
> that are inside the address range that the bridge forwards but
> outside of any BAR because there are 2 different sized BARs.
> (Pretty easy to setup.)
> On the system I was using they didn't get propagated all the way
> to the root bridge - but were visible in the lower bridge.

So how did you observe it? If the error message does not propagate
to the root bridge, I think no AER interrupt will be trigger.

> It would be nice for a driver to be able to detect/clear such
> a flag if it gets an unexpected ~0u read value.
> (I'm not sure an error callback helps.)

IMHO, a general model is that error detected at endpoint should be
routed to upstream port for example: RCiEP route error message to RCEC,
so that the AER port service could handle the error, the device driver
only have to implement error handler callback.

> 
> OTOH a 'nebs compliant' server routed any kind of PCIe link error
> through to some 'system management' logic that then raised an NMI.
> I'm not sure who thought an NMI was a good idea - they are pretty
> impossible to handle in the kernel and too late to be of use to
> the code performing the access.

I think it is the responsibility of the device to prevent the spread of
errors while reporting that errors have been detected. For example, drop
the current, (drain submit queue) and report error in completion record.
Both NMI and MSI are asynchronous interrupts.

> 
> In any case we were getting one after 'echo 1 >xxx/remove' and
> then taking the PCIe link down by reprogramming the fpga.
> So the link going down was entirely expected, but there seemed
> to be nothing we could do to stop the kernel crashing.
> 
> I'm sure 'nebs compliant' ought to contain some requirements for
> resilience to hardware failures!

How the kernel crash after a link down? Did the system detect a surprise
down error?

Best Regards,
Shuai
