Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7F4D16F4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:12:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZ2F4x4xz3cdl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:12:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ0h28rbz3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:10:44 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ0j1GKCz4xxt;
 Tue,  8 Mar 2022 23:10:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220120121931.517974-1-ganeshgr@linux.ibm.com>
References: <20220120121931.517974-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v5] powerpc/mce: Avoid using irq_work_queue() in realmode
Message-Id: <164674128785.3322453.5070052156048774113.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:08:07 +1100
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Jan 2022 17:49:31 +0530, Ganesh Goudar wrote:
> In realmode mce handler we use irq_work_queue() to defer
> the processing of mce events, irq_work_queue() can only
> be called when translation is enabled because it touches
> memory outside RMA, hence we enable translation before
> calling irq_work_queue and disable on return, though it
> is not safe to do in realmode.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mce: Avoid using irq_work_queue() in realmode
      https://git.kernel.org/powerpc/c/cc15ff3275694fedc33cd3d53212a43eec7aa0bc

cheers
