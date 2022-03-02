Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EED54CA533
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:49:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7v8J3M9Bz3f6P
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 23:49:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7v530j0pz3bZL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 23:46:47 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4K7v536R9Jz4xvL; Wed,  2 Mar 2022 23:46:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7v532223z4xZ5;
 Wed,  2 Mar 2022 23:46:47 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20220201105305.155511-1-hbathini@linux.ibm.com>
References: <20220201105305.155511-1-hbathini@linux.ibm.com>
Subject: Re: [RESEND PATCH v2] powerpc/fadump: register for fadump as early as
 possible
Message-Id: <164622490722.2052779.3719204745248765355.b4-ty@ellerman.id.au>
Date: Wed, 02 Mar 2022 23:41:47 +1100
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
Cc: Kairui Song <kasong@redhat.com>, Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Michal Suchánek <msuchanek@suse.de>, Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Feb 2022 16:23:05 +0530, Hari Bathini wrote:
> Crash recovery (fadump) is setup in the userspace by some service.
> This service rebuilds initrd with dump capture capability, if it is
> not already dump capture capable before proceeding to register for
> firmware assisted dump (echo 1 > /sys/kernel/fadump/registered). But
> arming the kernel with crash recovery support does not have to wait
> for userspace configuration. So, register for fadump while setting
> it up itself. This can at worst lead to a scenario, where /proc/vmcore
> is ready afer crash but the initrd does not know how/where to offload
> it, which is always better than not having a /proc/vmcore at all due
> to incomplete configuration in the userspace at the time of crash.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/fadump: register for fadump as early as possible
      https://git.kernel.org/powerpc/c/607451ce0aa9bdff590db4d087173edba6d7a29d

cheers
