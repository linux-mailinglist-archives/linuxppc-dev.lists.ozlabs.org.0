Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F291AA954
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 16:05:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492PJT0BqvzDqw1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 00:05:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492PGJ2lmrzDqsm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 00:03:36 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2AC1DAB3D;
 Wed, 15 Apr 2020 14:03:31 +0000 (UTC)
Date: Wed, 15 Apr 2020 16:03:29 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: CVE-2020-11669: Linux kernel 4.10 to 5.1: powerpc: guest can
 cause DoS on POWER9 KVM hosts
Message-ID: <20200415140329.GC25468@kitsune.suse.cz>
References: <2ff92392-30ec-d5c4-84c9-e6ba24f6b154@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ff92392-30ec-d5c4-84c9-e6ba24f6b154@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: oss-security@lists.openwall.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 15, 2020 at 10:52:53PM +1000, Andrew Donnellan wrote:
> The Linux kernel for powerpc from v4.10 to v5.1 has a bug where the
> Authority Mask Register (AMR), Authority Mask Override Register (AMOR) and
> User Authority Mask Override Register (UAMOR) are not correctly saved and
> restored when the CPU is going into/coming out of idle state.
> 
> On POWER9 CPUs, this means that a CPU may return from idle with the AMR
> value of another thread on the same core.
> 
> This allows a trivial Denial of Service attack against KVM hosts, by booting
> a guest kernel which makes use of the AMR, such as a v5.2 or later kernel
> with Kernel Userspace Access Prevention (KUAP) enabled.
> 
> The guest kernel will set the AMR to prevent userspace access, then the
> thread will go idle. At a later point, the hardware thread that the guest
> was using may come out of idle and start executing in the host, without
> restoring the host AMR value. The host kernel can get caught in a page fault
> loop, as the AMR is unexpectedly causing memory accesses to fail in the
> host, and the host is eventually rendered unusable.

Hello,

shouldn't the kernel restore the host registers when leaving the guest?

I recall some code exists for handling the *AM*R when leaving guest. Can
the KVM guest enter idle without exiting to host?

Thanks

Michal
