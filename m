Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9706B4CA532
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7v7t56Nzz3f59
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 23:49:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7v516NNJz3bcm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 23:46:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7v5031kJz4xvK;
 Wed,  2 Mar 2022 23:46:44 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>, Russell Currey <ruscur@russell.cc>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Guo Zhengkui <guozhengkui@vivo.com>
In-Reply-To: <20220223075426.20939-1-guozhengkui@vivo.com>
References: <20220223075426.20939-1-guozhengkui@vivo.com>
Subject: Re: [PATCH] powerpc/module_64: fix array_size.cocci warning
Message-Id: <164622488602.2052779.922464247956478447.b4-ty@ellerman.id.au>
Date: Wed, 02 Mar 2022 23:41:26 +1100
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
Cc: kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 23 Feb 2022 15:54:23 +0800, Guo Zhengkui wrote:
> Fix following coccicheck warning:
> ./arch/powerpc/kernel/module_64.c:432:40-41: WARNING: Use ARRAY_SIZE.
> 
> ARRAY_SIZE(arr) is a macro provided by the kernel. It makes sure that arr
> is an array, so it's safer than sizeof(arr) / sizeof(arr[0]) and more
> standard.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/module_64: fix array_size.cocci warning
      https://git.kernel.org/powerpc/c/8a0edc72bec25fa62450bfef1a150483558e1289

cheers
