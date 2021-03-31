Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A57234F60B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:16:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97gn3cTdz3frm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:16:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XZ4HTQz3c5s
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:22 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XZ00p8z9srY; Wed, 31 Mar 2021 12:10:21 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1615793724-97015-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1615793724-97015-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] powerpc/pci: fix warning comparing pointer to 0
Message-Id: <161715297797.226945.2209943629327029406.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:37 +1100
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Mar 2021 15:35:24 +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warning:
> 
> ./arch/powerpc/platforms/maple/pci.c:37:16-17: WARNING comparing pointer
> to 0.

Applied to powerpc/next.

[1/1] powerpc/pci: fix warning comparing pointer to 0
      https://git.kernel.org/powerpc/c/7a0fdc19f2415683f403abee7bb87085d0c624ad

cheers
