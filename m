Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D2F697B9A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:17:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGxtC06Jnz3f3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:17:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGxs636Myz3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:16:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGxs575mQz4x5Z;
	Wed, 15 Feb 2023 23:16:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20230204172206.7662-1-rdunlap@infradead.org>
References: <20230204172206.7662-1-rdunlap@infradead.org>
Subject: Re: [PATCH] powerpc/kexec_file: fix implicit decl error
Message-Id: <167646340183.1415779.1023703853117043648.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:16:41 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 4 Feb 2023 09:22:06 -0800, Randy Dunlap wrote:
> kexec (PPC64) code calls memory_hotplug_max(). Add the header declaration
> for it from <asm/mmzone.h>. Using <linux/mmzone.h> does not work since
> the #include for <asm/mmzone.h> depends on CONFIG_NUMA=y, which is not
> set in this kernel config file.
> 
> Fixes this build error/warning:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/kexec_file: fix implicit decl error
      https://git.kernel.org/powerpc/c/97e45d469eb180a7bd2809e4e079331552c73e42

cheers
