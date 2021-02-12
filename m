Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D6E319787
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:37:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcF2S17d2zDwsV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:37:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDf71rJ9zDwlR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:19:59 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDf63D5dz9sVs; Fri, 12 Feb 2021 11:19:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@ozlabs.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1612680192-43116-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1612680192-43116-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] powerpc/xive: Assign boolean values to a bool variable
Message-Id: <161308904033.3606979.1053940851108095108.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:19:58 +1100 (AEDT)
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

On Sun, 7 Feb 2021 14:43:12 +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warnings:
> 
> ./arch/powerpc/kvm/book3s_xive.c:1856:2-17: WARNING: Assignment of 0/1
> to bool variable.
> 
> ./arch/powerpc/kvm/book3s_xive.c:1854:2-17: WARNING: Assignment of 0/1
> to bool variable.

Applied to powerpc/next.

[1/1] powerpc/xive: Assign boolean values to a bool variable
      https://git.kernel.org/powerpc/c/c9df3f809cc98b196548864f52d3c4e280dd1970

cheers
