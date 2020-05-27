Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5D1E5060
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 23:20:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XNyQ592xzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 07:19:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=6LlhV+r1; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XNvr4X88zDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 07:17:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e7tiZMIiYuTbb+03A1KtQnZH+j3s8ttBBXpLw45dAS0=; b=6LlhV+r1K7qAycippK72vCEiPn
 c0NM4ZjQCpKRVzGcyTa9buhlm2plrnI2+LoPj8rGLnzkAaEhBdDOH6GhSkIyt4RSrRmo2k/KhZwHP
 m6wfFs/dCwrLP9yBfZx7nVTzQ9gsQi2SPB1cmp4AI3lsnCf4AM+6SZ+A19c0HtPu+LYk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1je3QV-003SEI-M8; Wed, 27 May 2020 23:17:27 +0200
Date: Wed, 27 May 2020 23:17:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
Message-ID: <20200527211727.GB818296@lunn.ch>
References: <20200526110318.69006-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526110318.69006-1-eesposit@redhat.com>
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

On Tue, May 26, 2020 at 01:03:10PM +0200, Emanuele Giuseppe Esposito wrote:
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
> 
> Statsfs offers a generic and stable API, allowing any kind of
> directory/file organization and supporting multiple kind of aggregations
> (not only sum, but also average, max, min and count_zero) and data types
> (boolean, unsigned/signed and custom types). The implementation, which is
> a generalization of KVM’s debugfs statistics code, takes care of gathering
> and displaying information at run time; users only need to specify the
> values to be included in each source.
> 
> Statsfs would also be a different mountpoint from debugfs, and would not
> suffer from limited access due to the security lock down patches. Its main
> function is to display each statistics as a file in the desired folder
> hierarchy defined through the API. Statsfs files can be read, and possibly
> cleared if their file mode allows it.
> 
> Statsfs has two main components: the public API defined by
> include/linux/statsfs.h, and the virtual file system which should end up in
> /sys/kernel/stats.
> 

Hi Emanuele

> The API has two main elements, values and sources. Kernel subsystems like
> KVM can use the API to create a source, add child sources/values/aggregates
> and register it to the root source (that on the virtual fs would be
> /sys/kernel/statsfs).

Another issue i see with networking is that statistic counters can be
dynamic. They can come and go. One of the drivers i work on has extra
statistics available when a fibre interface is used, compared to a
copper interface. And this happens at run time. The netlink API has no
problems with this. It is a snapshot of what counters are currently
available. There is no state in the API.

In my humble opinion, networking is unlikely to adopt your approach.
You probably want to look around for other subsystems which have
statistics, and see if you can cover their requirements, and get them
on board.

   Andrew
