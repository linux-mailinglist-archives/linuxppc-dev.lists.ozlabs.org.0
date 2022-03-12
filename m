Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EB14D6E2D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 11:32:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFzdb17Qgz3cFx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 21:32:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFzbd1Y2bz30CT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 21:30:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFzbc2DdTz4xcq;
 Sat, 12 Mar 2022 21:30:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, tyreld@linux.ibm.com,
 Hangyu Hua <hbh25y@gmail.com>, paulus@samba.org
In-Reply-To: <20220302021959.10959-1-hbh25y@gmail.com>
References: <20220302021959.10959-1-hbh25y@gmail.com>
Subject: Re: [PATCH v2] powerpc: kernel: fix refcount leak in format_show()
Message-Id: <164708098533.827774.691952258403804628.b4-ty@ellerman.id.au>
Date: Sat, 12 Mar 2022 21:29:45 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022 10:19:59 +0800, Hangyu Hua wrote:
> Refcount leak will happen when format_show returns failure in multiple
> cases. Unified management of of_node_put can fix this problem.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: kernel: fix refcount leak in format_show()
      https://git.kernel.org/powerpc/c/d601fd24e6964967f115f036a840f4f28488f63f

cheers
