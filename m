Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0F834F828
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:57:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9DZK5Ytrz3c46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:57:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=sW6QAytA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=sW6QAytA; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9DYw0fc7z2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:56:51 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9DYv0L95z9sWK; Wed, 31 Mar 2021 15:56:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617166611; bh=19OgOaq+ZIMbNNJbMDGP6fgCyFoh4TXBEgpOg6Gntdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sW6QAytAhYBDzhZRB+xjJ3hkwA45lb45zqexsOLJuVZW3X+tXr6cy/VxO0vmc1ixs
 0qox4x1fRmH7Wp5G/yZZTeLK1cND/jboBMbvbijwgWbcKiXyKB4r6UiXn2aN1WuQYU
 6v8hsXXmFm1GX4mrFHu1+EAN4jRPkvJhH5md/tvZq8PkplTS6MFXfYDX1KdRxGLOAh
 v9gM6rH6RogyRcQ/Gmg3cM8tywFcqLP7cAVo1ZF9F13RUFhOLeAAfkFbHTcjDb2hAv
 1iRG3BFvJ3IPgEjVhm67qh8RTqKPWummxdGN/zM+uilB90v7db9lLd9BFYN+RWuQ2S
 qacEqKjBhHtGQ==
Date: Wed, 31 Mar 2021 15:56:45 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 10/46] KVM: PPC: Book3S HV: Ensure MSR[ME] is always
 set in guest MSR
Message-ID: <YGQBDbDfFJuImaTg@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-11-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-11-npiggin@gmail.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:02:29AM +1000, Nicholas Piggin wrote:
> Rather than add the ME bit to the MSR at guest entry, make it clear
> that the hypervisor does not allow the guest to clear the bit.
> 
> The ME set is kept in guest entry for now, but a future patch will
> warn if it's not present.
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
