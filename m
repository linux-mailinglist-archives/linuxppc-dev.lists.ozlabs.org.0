Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA8D5F4470
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:40:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhf2t6Yvyz3f2K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:40:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1L23rVz301m
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1K3Njnz4xGt;
	Wed,  5 Oct 2022 00:38:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: cgel.zte@gmail.com, fbarrat@linux.ibm.com
In-Reply-To: <20220906072006.337099-1-ye.xingchen@zte.com.cn>
References: <20220906072006.337099-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ocxl: Remove the unneeded result variable
Message-Id: <166488996048.779920.14294683333465677232.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:26:00 +1100
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
Cc: ajd@linux.ibm.com, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 6 Sep 2022 07:20:06 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Return the value opal_npu_spa_clear_cache() directly instead of storing
> it in another redundant variable.
> 
> 

Applied to powerpc/next.

[1/1] ocxl: Remove the unneeded result variable
      https://git.kernel.org/powerpc/c/5e4952656bca1b5d8c2be36682dc66d844797ad2

cheers
