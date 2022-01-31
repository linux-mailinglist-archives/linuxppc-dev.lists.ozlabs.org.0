Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA54A4A79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 16:22:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnWyb01vpz3bbP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 02:22:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NXQ2vh5W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NXQ2vh5W; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnWxs02bHz2ywb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 02:21:50 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id q8so12754749oiw.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 07:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=oVZWckNIPsWHeKbXJ2sFvACBl5okPcSAEIsKC6XhxDU=;
 b=NXQ2vh5WqJcNrwvi+uhxOeXRwL3TuQvr8zI74nXKNlbA4THVcrFQe20l84a2F3rCSl
 fb+2O3VmewcReatZ19klOskQ2upf6qljRrD6n2B9Y4PhroYWW+XOfsdsfB3MZuirxQ9t
 X+vPYa1ikH13JYbnSKqVdMeH1jmxa4D6k59/FHZubOFHJbDfNxiaB8VfMIjtaMgLtJV+
 3A2GEeuqlrodVHjFD7y9lvjUf+N31nBGTmFabP1WX1nvXw95IBSd2qgNRGX0BxRvAmns
 3J8DZp0qcC/r7rrsLbS0TgQNcR7BR3VDw0NU5D6j9PO9dXHpEDeoVqLmRligf9NcdWA6
 MSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=oVZWckNIPsWHeKbXJ2sFvACBl5okPcSAEIsKC6XhxDU=;
 b=R8ZB/ZVAEw6MhDSy4PR33ZbGPbUxZrVArRxFMtNDWwpO90NA97+PFG4obSme+txzvv
 Oul/HeVNuG3/FcOq6dfwB70N+SqveXGl6Q84afk31VsKJxicd7RK2/EqvFHwuCJnCyDL
 3+I0EBZ/MaBBKLs5r6ShXCr8Q1hiMdjIyUuNF/zXVzb+pk7tx0JLrEVRZxUxPQGbLG7X
 MhQaK+7KJP4fHoefUiJTiJ6syht5ngnM8zrqISySgLtAWOUoKuTZn1hrALrJF2vlvbY5
 hcFZUKpKFbpQeMnXqfWrViL3DBfREL3P/FsOApYx9kApVuIN8ajjs3Rfmf/7ZCmmZhea
 mcqA==
X-Gm-Message-State: AOAM533YcQ9hj7mt6tsQFZnixwmOuLa90konmwT5/ekclM8kQLhSc3Ao
 wuBuMZk+0Boc0YX7hp4nAOw=
X-Google-Smtp-Source: ABdhPJwZ2DsfGoZh9WlCulrelJMyxXaQWZM7t1bPVVjVsAMl6JMrpJ5ac6K1xcqWaqkMGtPCEBWrHw==
X-Received: by 2002:a05:6808:211f:: with SMTP id
 r31mr12780920oiw.194.1643642506160; 
 Mon, 31 Jan 2022 07:21:46 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id d65sm9789045otb.17.2022.01.31.07.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 07:21:44 -0800 (PST)
Message-ID: <c78df469-1a9f-5778-24d1-8f08a6bf5bcc@roeck-us.net>
Date: Mon, 31 Jan 2022 07:21:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>
References: <87mtjc2lhe.ffs@tglx>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
In-Reply-To: <87mtjc2lhe.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Ashok Raj <ashok.raj@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@kaod.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/31/22 03:27, Thomas Gleixner wrote:
> On Sun, Jan 30 2022 at 09:12, Guenter Roeck wrote:
>> On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
>> This patch results in the following runtime warning when booting x86
>> (32 bit) nosmp images from NVME in qemu.
>>
>> [   14.825482] nvme nvme0: 1/0/0 default/read/poll queues
>> ILLOPC: ca7c6d10: 0f 0b
>> [   14.826188] ------------[ cut here ]------------
>> [   14.826307] WARNING: CPU: 0 PID: 7 at drivers/pci/msi/msi.c:1114 pci_irq_get_affinity+0x80/0x90
> 
> This complains about msi_desc->affinity being NULL.
> 
>> git bisect bad f48235900182d64537c6e8f8dc0932b57a1a0638
>> # first bad commit: [f48235900182d64537c6e8f8dc0932b57a1a0638] PCI/MSI: Simplify pci_irq_get_affinity()
> 
> Hrm. Can you please provide dmesg and /proc/interrupts from a
> kernel before that commit?
> 

Sure. Please see http://server.roeck-us.net/qemu/x86/.
The logs are generated with with v5.16.4.

Guenter
