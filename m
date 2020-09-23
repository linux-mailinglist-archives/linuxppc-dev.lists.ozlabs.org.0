Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E68274DC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 02:20:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwzNB4zpDzDqXv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 10:20:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwz9m532CzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 10:11:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=pg5/vc5Q; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4Bwz9m2YXVz9sTS; Wed, 23 Sep 2020 10:11:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1600819884; bh=G+N3yoVOI9E8o3gp3+ye5hXZh0Mpi9UiooyzPlfEfIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pg5/vc5QVcKPX6kMXt5hXEMpr8+byLdCFxI04s1KLynA2TTkSOnWN2brWIgQ7g/th
 3dv3j362BM9ADcvHuL0LVDlVx/qw//O+dv7KKYynsZhrhkv7oxVzg1jtVSVSOvjlRg
 41Hw/D0p66YLV+mVPuGBEq6ICWZarSxwPduzp7m4192Tuj0BkAMnmvDgT+kHov+7BJ
 HnPJe2YrUZooVMJV/oPZEgyfvZXzOMiJxha/MYlrls1zTL+jwsVaWrQw2PV+NrNKif
 rXMWddkQaBymNHcag8s2QSH+rHn1b1SyGMnMUyCfTqfSZGZGz4qH4gB38wzrNYxNpz
 1itAeN1Jrnlgg==
Date: Wed, 23 Sep 2020 10:09:05 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next v2] KVM: PPC: Book3S HV: XIVE: Convert to
 DEFINE_SHOW_ATTRIBUTE
Message-ID: <20200923000905.GD531519@thinks.paulus.ozlabs.org>
References: <20200919012925.174377-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200919012925.174377-1-miaoqinglang@huawei.com>
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
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 09:29:25AM +0800, Qinglang Miao wrote:
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Thanks, applied.

Paul.
