Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1A1E5088
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 23:30:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XPBm1GgwzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 07:30:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=e27RQsyj; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XP7R13pDzDqCC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 07:27:46 +1000 (AEST)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9BB422078C;
 Wed, 27 May 2020 21:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590614864;
 bh=HUaCb3PCCc2Pw/hRjP9hPvQCIfIdC6bqDipqt+IXdOU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e27RQsyjYiPcLJYK/eWYlxTA6Bn/y9CgNn3E+9GG9h7m/a5G1frb/+wAOfPx/3NE5
 gAW7R0FZcXgWATLm2Kr9E7RUabkNwvrP/VCkwQjepQzJGb/QKMmOyRYKTiSGdUTuRr
 2S31ZwxZjPaH1lEr34iVlwoqokOeCs+hilL79l5o=
Date: Wed, 27 May 2020 14:27:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
Message-ID: <20200527142741.77e7de37@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <af2ba926-73bc-26c3-7ce7-bd45f657fd85@redhat.com>
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526153128.448bfb43@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <6a754b40-b148-867d-071d-8f31c5c0d172@redhat.com>
 <20200527132321.54bcdf04@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <af2ba926-73bc-26c3-7ce7-bd45f657fd85@redhat.com>
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Andrew Lunn <andrew@lunn.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 linux-fsdevel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 May 2020 23:07:53 +0200 Paolo Bonzini wrote:
> > Again, I have little KVM knowledge, but BPF also uses a fd-based API,
> > and carries stats over the same syscall interface.  
> 
> Can BPF stats (for BPF scripts created by whatever process is running in
> the system) be collected by an external daemon that does not have access
> to the file descriptor?  For KVM it's of secondary importance to gather
> stats in the program; it can be nice to have and we are thinking of a
> way to export the stats over the fd-based API, but it's less useful than
> system-wide monitoring.  Perhaps this is a difference between the two.

Yes, check out bpftool prog list (bpftool code is under tools/bpf/ in
the kernel tree). BPF statistics are under a static key, so you may not
see any on your system. My system shows e.g.:

81: kprobe  name abc  tag cefaa9376bdaae75  gpl run_time_ns 80941 run_cnt 152
	loaded_at 2020-05-26T13:00:24-0700  uid 0
	xlated 512B  jited 307B  memlock 4096B  map_ids 66,64
	btf_id 16

In this example run_time_ns and run_cnt are stats.

The first number on the left is the program ID. BPF has an IDA, and
each object gets an integer id. So admin (or CAP_BPF, I think) can
iterate over the ids and open fds to objects of interest.

> Another case where stats and configuration are separate is CPUs, where
> CPU enumeration is done in sysfs but statistics are exposed in various
> procfs files such as /proc/interrupts and /proc/stats.

True, but I'm guessing everyone is just okay living with the legacy
procfs format there. Otherwise I'd guess the stats would had been added
to sysfs. I'd be curious to hear the full story there.
