Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E936E56E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 14:13:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qqfQ662hzDqfS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 22:13:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.77.114; helo=8.mo7.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at bilbo;
 Fri, 19 Jul 2019 22:11:47 AEST
Received: from 8.mo7.mail-out.ovh.net (8.mo7.mail-out.ovh.net [46.105.77.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qqcM1SlyzDqsl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 22:11:43 +1000 (AEST)
Received: from player692.ha.ovh.net (unknown [10.108.42.192])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 627C312A66A
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 14:05:22 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id 514347FD5E9F;
 Fri, 19 Jul 2019 12:05:19 +0000 (UTC)
Subject: Re: Crash in kvmppc_xive_release()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Greg Kurz <groug@kaod.org>
References: <87k1cf8q3w.fsf@concordia.ellerman.id.au>
 <3c152700-81de-9b34-e8a7-70b341a92197@kaod.org>
 <87woge6zj9.fsf@concordia.ellerman.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bd3c3c39-8114-0692-9263-6d78ed007dde@kaod.org>
Date: Fri, 19 Jul 2019 14:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87woge6zj9.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12826814690217528217
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieejgdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19/07/2019 13:20, Michael Ellerman wrote:
> Cédric Le Goater <clg@kaod.org> writes:
>> On 18/07/2019 14:49, Michael Ellerman wrote:
>>> Anyone else seen this?
>>>
>>> This is running ~176 VMs on a Power9 (1 per thread), host crashes:
>>
>> This is beyond the underlying limits of XIVE. 
>>
>> As we allocate 2K vCPUs per VM, that is 16K EQs for interrupt events. The overall
>> EQ count is 1M. I let you calculate what is our max number of VMs ...
> 
> We need to fix it somehow, people will expect to be able to run a VM per
> thread.

we are limited by two spaces : VP space (1 << 19) system overall and 
EQ space (1 << 20 per chip, this one we could increase). But one of 
the big issue is the way we allocate the XIVE VPs in the XIVE devices.
As we have no idea of how much vCPUs we should provision for, we take 
the max: 2048 ...

If we had the maxcpu of the VM (from QEMU) or at least some hints on 
a rough figure, lets say a power of 2 [ 32 - 4096 ] CPUs, we would 
fragment less our VP space and increase a lot our #VMs per system.

It could be a kernel global, sysfs or what ever, a new KVM PPC control
on the VM to tune maxcpu, or a KVM device creation parameter. we 
could also register multiple KVM devices each having its maximum :
tiny (5), small (6), normal (8), big (11, default legacy), huge (12),
and create from QEMU the one we think fits the best.

I have to think this over. 

Nevertheless, I am trying to increase by 2 or 4 the XIVE spaces for
POWER10. 

C.
