Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679A34F5FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:14:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97db24x1z3fM4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:14:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XV0nhDz3c5N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:18 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XT5f6Sz9sj0; Wed, 31 Mar 2021 12:10:17 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20210323205056.52768-1-danielhb413@gmail.com>
References: <20210323205056.52768-1-danielhb413@gmail.com>
Subject: Re: [PATCH v2 0/1] show 'last online CPU' error in dlpar_cpu_offline()
Message-Id: <161715298116.226945.13918560930368268088.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:41 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Mar 2021 17:50:55 -0300, Daniel Henrique Barboza wrote:
> changes in v2 after Michael Ellerman review:
> - moved the verification code from dlpar_cpu_remove() to
>   dlpar_cpu_offline(), while holding cpu_add_remove_lock
> - reworded the commit message and code comment
> v1 link:
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210305173845.451158-1-danielhb413@gmail.com/
> 
> [...]

Applied to powerpc/next.

[1/1] hotplug-cpu.c: show 'last online CPU' error in dlpar_cpu_offline()
      https://git.kernel.org/powerpc/c/d19b3ad02c2d1a9a697b7059e32fa2d97a420b15

cheers
