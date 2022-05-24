Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2BF53285E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 12:58:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6rlV1RqDz3fVK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:58:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6rfh6Gzqz3bl8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 20:54:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6rfh119Lz4yT3;
 Tue, 24 May 2022 20:54:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: akpm@linux-foundation.org, bharata@linux.ibm.com, linuxram@us.ibm.com,
 Felix.Kuehling@amd.com, mpe@ellerman.id.au, paulus@samba.org,
 benh@kernel.crashing.org, maciej.szmigiero@oracle.com, maz@kernel.org,
 david@redhat.com, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 liam.howlett@oracle.com, apopple@nvidia.com
In-Reply-To: <20220414062103.8153-1-xiam0nd.tong@gmail.com>
References: <20220414062103.8153-1-xiam0nd.tong@gmail.com>
Subject: Re: [RESEND][PATCH] KVM: PPC: Book3S HV: fix incorrect NULL check on
 list iterator
Message-Id: <165338950780.1711920.5897036006589907982.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 20:51:47 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Apr 2022 14:21:03 +0800, Xiaomeng Tong wrote:
> The bug is here:
> 	if (!p)
>                 return ret;
> 
> The list iterator value 'p' will *always* be set and non-NULL by
> list_for_each_entry(), so it is incorrect to assume that the iterator
> value will be NULL if the list is empty or no element is found.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV: fix incorrect NULL check on list iterator
      https://git.kernel.org/powerpc/c/300981abddcb13f8f06ad58f52358b53a8096775

cheers
