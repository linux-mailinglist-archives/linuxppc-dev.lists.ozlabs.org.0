Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 496F31E32B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 00:33:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WpdG73bRzDqL5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 08:33:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=L1hQtRDv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WpbW5bWTzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 08:31:35 +1000 (AEST)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9454F20899;
 Tue, 26 May 2020 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590532292;
 bh=i/LsJ/7HDxl1uraGohIpTv1UEEpLZgqDBmcvFSkYrRs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L1hQtRDvn7ylGIClnE51U8xDbKeptk9RRRcxjD8KvV0vnGtqXOx6okqH3wGQU2F4s
 AMxHim9tkh3trTRi+/Dihhe2jPHiIQ7YHpjVMePw/F7mtxQxe5ipm41gvPbE0O1/f+
 WqWQhzzVJGfznE1VeNIwnVlo+h9/gVYBJXg1JpOk=
Date: Tue, 26 May 2020 15:31:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
Message-ID: <20200526153128.448bfb43@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20200526110318.69006-1-eesposit@redhat.com>
References: <20200526110318.69006-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 26 May 2020 13:03:10 +0200 Emanuele Giuseppe Esposito wrote:
> There is currently no common way for Linux kernel subsystems to expose
> statistics to userspace shared throughout the Linux kernel; subsystems have
> to take care of gathering and displaying statistics by themselves, for
> example in the form of files in debugfs. For example KVM has its own code
> section that takes care of this in virt/kvm/kvm_main.c, where it sets up
> debugfs handlers for displaying values and aggregating them from various
> subfolders to obtain information about the system state (i.e. displaying
> the total number of exits, calculated by summing all exits of all cpus of
> all running virtual machines).
> 
> Allowing each section of the kernel to do so has two disadvantages. First,
> it will introduce redundant code. Second, debugfs is anyway not the right
> place for statistics (for example it is affected by lockdown)
> 
> In this patch series I introduce statsfs, a synthetic ram-based virtual
> filesystem that takes care of gathering and displaying statistics for the
> Linux kernel subsystems.
> 
> The file system is mounted on /sys/kernel/stats and would be already used
> by kvm. Statsfs was initially introduced by Paolo Bonzini [1].

What's the direct motivation for this work? Moving KVM stats out of
debugfs?

In my experience stats belong in the API used for creating/enumerating
objects, statsfs sounds like going in the exact opposite direction -
creating a parallel structure / hierarchy for exposing stats. I know
nothing about KVM but are you sure all the info that has to be exposed
will be stats?

In case of networking we have the basic stats in sysfs, under the
netdevice's kobject. But since we're not using sysfs much any more 
for config, new stats are added in netlink APIs. Again - same APIs
used for enumeration and config.

