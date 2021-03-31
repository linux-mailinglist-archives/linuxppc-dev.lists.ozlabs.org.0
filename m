Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D046634F813
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9DF767YMz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:42:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=tFwPa4OA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=tFwPa4OA; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9DDk4yM8z3bqt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:41:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9DDk2zcQz9sWK; Wed, 31 Mar 2021 15:41:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617165718; bh=xEB8YrXTrZzJClBwZlO/5KcuKVA0lD/HaU5zKt86Kjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tFwPa4OARDAAmZnSmwLW2jCSkLcEhYDB+V108h12dCOyKgREs3KqJjs1x8lpfZCFq
 cAqg5ppoIMCiE+OEQlZV6xWrQLJVr8Ig1FebFUhrpu3T0zMA1q81dqB396nngFUWDC
 Ug2igxMFuh2iYs1pBHcDicYthU/0so8VOjN/1Bdzp9hHz0Bubt8wVcNh+JxS82oulY
 2l8T+czu51rL9WbJZAuKWsn1wXxlaFMNrL0g+JgYBTkUIPmr8myZgsQU4jucyTtic0
 Ip0bGC8t0B+6GOIfYRYES09ygytz/Z7njsNXOnLv1n9sEeAPKtlYqzO099tjKokgfc
 9/1+TY/Jjth4A==
Date: Wed, 31 Mar 2021 15:39:41 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 07/46] KVM: PPC: Book3S HV: Fix
 CONFIG_SPAPR_TCE_IOMMU=n default hcalls
Message-ID: <YGP9DVWXeM2O1A18@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-8-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-8-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:02:26AM +1000, Nicholas Piggin wrote:
> This config option causes the warning in init_default_hcalls to fire
> because the TCE handlers are in the default hcall list but not
> implemented.
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
