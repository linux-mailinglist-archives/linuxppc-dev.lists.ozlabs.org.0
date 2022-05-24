Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE595328E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:26:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sMX2fmTz3fJC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:26:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7w38h6z3cgj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:56 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7w0qdqz4xYX;
 Tue, 24 May 2022 21:15:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Oscar Salvador <osalvador@suse.de>
In-Reply-To: <20220411074934.4632-1-osalvador@suse.de>
References: <20220411074934.4632-1-osalvador@suse.de>
Subject: Re: [PATCH] powerpc/numa: Associate numa node to its cpu earlier
Message-Id: <165339058296.1718562.9706325672681890967.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:42 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Michal Hocko <mhocko@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Apr 2022 09:49:34 +0200, Oscar Salvador wrote:
> powerpc is the only platform that do not rely on
> cpu_up()->try_online_node() to bring up a numa node,
> and special cases it, instead, deep in its own machinery:
> 
> dlpar_online_cpu
>  find_and_online_cpu_nid
>   try_online_node
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/numa: Associate numa node to its cpu earlier
      https://git.kernel.org/powerpc/c/48b63961c84671df4c4a4451c40057e34b26df1a

cheers
