Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E391E34F80D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:39:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9D9j6Zfpz3bxw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:39:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=u5Hl5IUF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=u5Hl5IUF; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9D9K27pjz3bts
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:39:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9D9K0dlFz9sWK; Wed, 31 Mar 2021 15:39:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617165541; bh=EfjObLQOzMXhjT6h30t44ilURVoqwn+72w7vsZQ14NE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u5Hl5IUFtZg2NE2FCeBPxG16fPFNmRtf76YZsbwqPpYv+nKyGO6NIxazFxhJbqiIp
 g869jUeobY4be8RflEfGsxfmvIQxgu3MdgDPZczNzFINBmROSU/Pn01jC4onvtkmYx
 cOUDkfcDS/xey1jpa2Edc4nG/MoadStt7b4WNpRLVleVa1wJMeoMuqUcihRJkyaGJp
 gE7cdZhbglNBFrrkPeNPA63DbHygQ6zI1FP+UirXJSSiDsqggEGV3DzYgwcoJ1e43N
 VPkWQO+4nGYrsaibtXqnVpZmkwsZaDIztS+27izwNzhIVLEPr6QXiow5iVmV/RVnMN
 8Atfm0Jd2Pi3A==
Date: Wed, 31 Mar 2021 15:38:54 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 06/46] KVM: PPC: Book3S HV: remove unused
 kvmppc_h_protect argument
Message-ID: <YGP83mTXY/LQzAR8@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-7-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-7-npiggin@gmail.com>
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

On Tue, Mar 23, 2021 at 11:02:25AM +1000, Nicholas Piggin wrote:
> The va argument is not used in the function or set by its asm caller,
> so remove it to be safe.
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
