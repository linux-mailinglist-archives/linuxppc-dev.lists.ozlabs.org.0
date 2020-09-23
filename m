Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47357274DB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 02:15:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwzG23GDSzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 10:15:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwz9m2d50zDqMM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 10:11:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=JxiasQgk; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4Bwz9m0BF2z9sTC; Wed, 23 Sep 2020 10:11:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1600819884; bh=m9GHPNW/2K3Mjvs2CsrXbfRUodKWSPQ095s2qLR2VpQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JxiasQgk2Gc0tHgASYaAjH9YcNwSlENF2bedN0m/hNvUQ4nh1PLeMl8IJFFcBe9T+
 T6uIdkVEupvrvzoJcsqIC4wUOsJCdW5BwhOhmPYuDTczeSJofcrlRyGEJieedte9d2
 7bDtvUX2LV6MzYLX+VDzrkHOqRgALIrhNABqG9cCAdExw0MfrZDTYz2oYoEQAWX8mq
 12zvrJtvh+2wbTPQeejoUZVtPzsdP1Ga8Isrk2xk95FTy2Nf7l4WBMpIqB6no92tfE
 qM/8MXmTYst/0Tz9sLQtOLZU7ZiBVtamNJ00F8IiYojbpA413Yy6SzOWIDsLu6MVp2
 hJpGCP03732wg==
Date: Wed, 23 Sep 2020 10:08:32 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Subject: Re: [PATCH] KVM: PPC: Book3S: Remove redundant initialization of
 variable ret
Message-ID: <20200923000832.GC531519@thinks.paulus.ozlabs.org>
References: <20200919071230.125798-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200919071230.125798-1-jingxiangfeng@huawei.com>
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

On Sat, Sep 19, 2020 at 03:12:30PM +0800, Jing Xiangfeng wrote:
> The variable ret is being initialized with '-ENOMEM' that is meaningless.
> So remove it.
> 
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Thanks, applied.

Paul.
