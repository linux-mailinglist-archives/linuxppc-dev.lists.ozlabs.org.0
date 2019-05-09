Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9885F18593
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 08:53:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4503vf68BRzDqQY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 16:53:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.47.167; helo=11.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at bilbo;
 Thu, 09 May 2019 16:52:13 AEST
Received: from 11.mo5.mail-out.ovh.net (11.mo5.mail-out.ovh.net
 [46.105.47.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4503tP1mq0zDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 16:52:09 +1000 (AEST)
Received: from player772.ha.ovh.net (unknown [10.108.42.239])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 91EDA22D657
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 08:34:37 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 2D78A586DDA2;
 Thu,  9 May 2019 06:34:30 +0000 (UTC)
Subject: Re: [PATCH v5 00/16] KVM: PPC: Book3S HV: add XIVE native
 exploitation mode
To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
References: <20190410170448.3923-1-clg@kaod.org>
 <20190429080506.GA9070@sathnaga86.in.ibm.com>
 <827f230f-1b56-db89-be21-1b2dbd44ef08@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b8f9f7d1-087d-fa74-b834-fd57ad03adf4@kaod.org>
Date: Thu, 9 May 2019 08:34:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <827f230f-1b56-db89-be21-1b2dbd44ef08@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14554789574445534182
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeggddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Satheesh,

>> Xive(both ic-mode=dual and ic-mode=xive) guest fails to boot with 
>> guest memory > 64G, till 64G it boots fine.
>>
>> Note: xics(ic-mode=xics) guest with the same configuration boots fine
> 
> Indeed. The guest hangs because IPIs are not correctly received. The guest 
> sees the EQ page as being filled with zeroes and discards the interrupt 
> whereas the host, KVM and QEMU, sees the correct entries.
> 
> I haven't spotted anything bizarre from guest side. Do we have a 64GB 
> frontier somewhere in KVM ? 

The issue was an erroneous assignment of the EQ page address in QEMU.

I pushed the fix in my QEMU branch : 

  https://github.com/legoater/qemu/commits/xive-next

Thanks,

C.
