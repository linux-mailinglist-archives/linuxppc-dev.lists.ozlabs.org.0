Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE0B442CF2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:40:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7JQ3xZsz3dgT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:40:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Fd25rYz2yHq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Fc3qbrz4xcL;
 Tue,  2 Nov 2021 22:38:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <22831c9d17f948680a12c5292e7627288b15f713.1631817805.git.christophe.leroy@csgroup.eu>
References: <22831c9d17f948680a12c5292e7627288b15f713.1631817805.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/lib/sstep: Don't use __{get/put}_user() on kernel
 addresses
Message-Id: <163584791077.1845480.9899621375066111807.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:50 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Stan Johnson <userm57@yahoo.com>,
 Finn Thain <fthain@linux-m68k.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Sep 2021 20:43:36 +0200, Christophe Leroy wrote:
> In the old days, when we didn't have kernel userspace access
> protection and had set_fs(), it was wise to use __get_user()
> and friends to read kernel memory.
> 
> Nowadays, get_user() and put_user() are granting userspace access and
> are exclusively for userspace access.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/lib/sstep: Don't use __{get/put}_user() on kernel addresses
      https://git.kernel.org/powerpc/c/e28d0b675056d072f1f11fa644d0efbb016bb7ce

cheers
