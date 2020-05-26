Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 395AC1E2401
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 16:22:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WbkZ1nb7zDqLf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 00:21:58 +1000 (AEST)
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
 header.s=20171124 header.b=mwjDL+wW; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WbcN49BFzDqBx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 00:16:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZEZ1+yG3T0vEd58X58pERPcfzN4dbTvcTqCMRc8b9RQ=; b=mwjDL+wWgCxatP4XIvGOhsucBR
 sYYetvGOeYtDiCDaYnPMf19gGi5la/8GEIhcC3Me4+QEzKqUEPzQ8E2INyTB3j6c8qBAew7S/s4g3
 Yr6FjMBwCT5Re5vMGbX/NZ4MqVfNEmWtY8VJFGpTnXQwMYyiIMn+3pRNonmA+TDQxhQI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jdaNB-003HxR-V6; Tue, 26 May 2020 16:16:05 +0200
Date: Tue, 26 May 2020 16:16:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 7/7] [not for merge] netstats: example use of stats_fs
 API
Message-ID: <20200526141605.GJ768009@lunn.ch>
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526110318.69006-8-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526110318.69006-8-eesposit@redhat.com>
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

On Tue, May 26, 2020 at 01:03:17PM +0200, Emanuele Giuseppe Esposito wrote:
> Apply stats_fs on the networking statistics subsystem.
> 
> Currently it only works with disabled network namespace
> (CONFIG_NET_NS=n), because multiple namespaces will have the same
> device name under the same root source that will cause a conflict in
> stats_fs.

Hi Emanuele

How do you atomically get and display a group of statistics?

If you look at how the netlink socket works, you will see code like:

                do {
                        start = u64_stats_fetch_begin_irq(&cpu_stats->syncp);
                        rx_packets = cpu_stats->rx_packets;
                        rx_bytes = cpu_stats->rx_bytes;
			....
                } while (u64_stats_fetch_retry_irq(&cpu_stats->syncp, start));

It will ensure that rx_packets and rx_bytes are consistent with each
other. If the value of the sequence counter changes while inside the
loop, the loop so repeated until it does not change.

In general, hardware counters in NICs are the same.  You tell it to
take a snapshot of the statistics counters, and then read them all
back, to give a consistent view across all the statistics.

I've not looked at this new code in detail, but it looks like you have
one file per statistic, and assume each statistic is independent of
every other statistic. This independence can limit how you use the
values, particularly when debugging. The netlink interface we use does
not have this limitation.

	     Andrew
