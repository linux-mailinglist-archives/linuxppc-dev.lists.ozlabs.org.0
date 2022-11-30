Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB7A63D20E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:34:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMYts5tMLz3fS0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:34:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYqf3CYtz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:31:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqd3FGjz4xND;
	Wed, 30 Nov 2022 20:31:25 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Chen Lifu <chenlifu@huawei.com>, npiggin@gmail.com, linux-kernel@vger.kernel.org, zhengzucheng@huawei.com, christophe.leroy@csgroup.eu, nick.child@ibm.com, benh@kernel.crashing.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221103070122.340773-1-chenlifu@huawei.com>
References: <20221103070122.340773-1-chenlifu@huawei.com>
Subject: Re: [PATCH v3 -next] powerpc/powermac: Fix symbol not declared warnings
Message-Id: <166980025492.3017288.18013184822257737231.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:14 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 3 Nov 2022 15:01:22 +0800, Chen Lifu wrote:
> 1. ppc_override_l2cr and ppc_override_l2cr_value are only used in
>     l2cr_init() function, remove them and used *l2cr directly.
> 2. has_l2cache is not used outside of the file, so mark it static and
>     do not initialise statics to 0.
> 
> Fixes the following warning:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powermac: Fix symbol not declared warnings
      https://git.kernel.org/powerpc/c/59dc2d94bc12dac53a5d2368ad97ca24e7cc5682

cheers
