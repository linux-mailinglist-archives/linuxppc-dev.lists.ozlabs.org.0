Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 445B720CF57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 17:08:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wW8Y59fWzDqLh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 01:08:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=linux.com (client-ip=3.19.106.255; helo=gentwo.org;
 envelope-from=cl@linux.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
X-Greylist: delayed 490 seconds by postgrey-1.36 at bilbo;
 Tue, 30 Jun 2020 01:06:54 AEST
Received: from gentwo.org (gentwo.org [3.19.106.255])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wW6k1ksxzDqT5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 01:06:54 +1000 (AEST)
Received: by gentwo.org (Postfix, from userid 1002)
 id 2B0E33FF4E; Mon, 29 Jun 2020 14:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by gentwo.org (Postfix) with ESMTP id 291103EA72;
 Mon, 29 Jun 2020 14:58:40 +0000 (UTC)
Date: Mon, 29 Jun 2020 14:58:40 +0000 (UTC)
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@www.lameter.com
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
In-Reply-To: <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
Message-ID: <alpine.DEB.2.22.394.2006291456550.27163@www.lameter.com>
References: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
 <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@suse.de>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 24 Jun 2020, Srikar Dronamraju wrote:

> Currently Linux kernel with CONFIG_NUMA on a system with multiple
> possible nodes, marks node 0 as online at boot.  However in practice,
> there are systems which have node 0 as memoryless and cpuless.

Maybe add something to explain why you are not simply mapping the
existing memory to NUMA node 0 which is after all just a numbering scheme
used by the kernel and can be used arbitrarily?

This could be seen more as a bug in the arch code during the setup of NUMA
nodes. The two nodes are created by the firmwware / bootstrap code after
all. Just do not do it?

