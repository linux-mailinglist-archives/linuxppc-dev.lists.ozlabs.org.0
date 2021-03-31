Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7278934F5FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:15:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97dw5cvgz3fRV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:15:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XV6nSyz3bv3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:18 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XV2DJJz9sWk; Wed, 31 Mar 2021 12:10:18 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, Davidlohr Bueso <dave@stgolabs.net>
In-Reply-To: <20210309015950.27688-1-dave@stgolabs.net>
References: <20210309015950.27688-1-dave@stgolabs.net>
Subject: Re: [PATCH 0/3] powerpc/qspinlock: Some tuning updates
Message-Id: <161715296824.226945.611747739649915060.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:28 +1100
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
Cc: peterz@infradead.org, will@kernel.org, linux-kernel@vger.kernel.org,
 mingo@redhat.com, paulus@samba.org, longman@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 8 Mar 2021 17:59:47 -0800, Davidlohr Bueso wrote:
> A few updates while going through the powerpc port of the qspinlock.
> 
> Patches 1 and 2 are straightforward, while patch 3 can be considered
> more of an rfc as I've only tested on a single machine, and there
> could be an alternative way if it doesn't end up being nearly a
> universal performance win.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/spinlock: Define smp_mb__after_spinlock only once
      https://git.kernel.org/powerpc/c/2bf3604c415c9d75311141b8eb6ac8780ef74420
[2/3] powerpc/spinlock: Unserialize spin_is_locked
      https://git.kernel.org/powerpc/c/66f60522138c2e0d8a3518edd4979df11a2d7525
[3/3] powerpc/qspinlock: Use generic smp_cond_load_relaxed
      https://git.kernel.org/powerpc/c/deb9b13eb2571fbde164ae012c77985fd14f2f02

cheers
