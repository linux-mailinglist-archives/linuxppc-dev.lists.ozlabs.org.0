Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AA5D9DA5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 23:46:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tm826mnPzDqLf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 08:46:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.73.241; helo=10.mo69.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 10.mo69.mail-out.ovh.net (10.mo69.mail-out.ovh.net
 [46.105.73.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tm660ZRVzDr4Y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 08:44:26 +1100 (AEDT)
Received: from player759.ha.ovh.net (unknown [10.109.146.168])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 2D0556ACD8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 23:44:20 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id 56850B179636;
 Wed, 16 Oct 2019 21:44:06 +0000 (UTC)
Date: Wed, 16 Oct 2019 23:44:03 +0200
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v2 0/6] KVM: PPC: Book3S: HV: XIVE: Allocate less VPs in
 OPAL
Message-ID: <20191016234403.77cdf150@bahia.lan>
In-Reply-To: <156958521220.1503771.2119482814236775333.stgit@bahia.lan>
References: <156958521220.1503771.2119482814236775333.stgit@bahia.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10318872647401970107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrjeehgdduieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: kvm@vger.kernel.org, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 27 Sep 2019 13:53:32 +0200
Greg Kurz <groug@kaod.org> wrote:

> This brings some fixes and allows to start more VMs with an in-kernel
> XIVE or XICS-on-XIVE device.
> 
> Changes since v1 (https://patchwork.ozlabs.org/cover/1166099/):
> - drop a useless patch
> - add a patch to show VP ids in debugfs
> - update some changelogs
> - fix buggy check in patch 5
> - Cc: stable 
> 
> --
> Greg
> 
> ---
> 
> Greg Kurz (6):
>       KVM: PPC: Book3S HV: XIVE: Set kvm->arch.xive when VPs are allocated
>       KVM: PPC: Book3S HV: XIVE: Ensure VP isn't already in use
>       KVM: PPC: Book3S HV: XIVE: Show VP id in debugfs
>       KVM: PPC: Book3S HV: XIVE: Compute the VP id in a common helper
>       KVM: PPC: Book3S HV: XIVE: Make VP block size configurable
>       KVM: PPC: Book3S HV: XIVE: Allow userspace to set the # of VPs
> 
> 
>  Documentation/virt/kvm/devices/xics.txt |   14 +++
>  Documentation/virt/kvm/devices/xive.txt |    8 ++
>  arch/powerpc/include/uapi/asm/kvm.h     |    3 +
>  arch/powerpc/kvm/book3s_xive.c          |  142 ++++++++++++++++++++++++-------
>  arch/powerpc/kvm/book3s_xive.h          |   17 ++++
>  arch/powerpc/kvm/book3s_xive_native.c   |   40 +++------
>  6 files changed, 167 insertions(+), 57 deletions(-)
> 

Ping ?

Cheers,

--
Greg
