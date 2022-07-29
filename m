Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1EE5850A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:14:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSfk3Pgcz3fcJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:14:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSZ36bbvz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSZ35wn0z4xG2;
	Fri, 29 Jul 2022 23:10:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20c0ee7f99dbf0dbf8658df6b39f84753e6db1ef.1657204631.git.christophe.leroy@csgroup.eu>
References: <20c0ee7f99dbf0dbf8658df6b39f84753e6db1ef.1657204631.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 1/2] powerpc/perf: Use PVR rather than oprofile field to determine CPU version
Message-Id: <165909975658.253830.11461450313523332819.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:36 +1000
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-kernel@vger.kernel.org, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 7 Jul 2022 16:37:17 +0200, Christophe Leroy wrote:
> From: Rashmica Gupta <rashmica.g@gmail.com>
> 
> Currently the perf CPU backend drivers detect what CPU they're on using
> cur_cpu_spec->oprofile_cpu_type.
> 
> Although that works, it's a bit crufty to be using oprofile related fields,
> especially seeing as oprofile is more or less unused these days.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/perf: Use PVR rather than oprofile field to determine CPU version
      https://git.kernel.org/powerpc/c/ec3eb9d941a98f4c0dac263110729680a734279b
[2/2] powerpc: Remove remaining parts of oprofile
      https://git.kernel.org/powerpc/c/62ccae78820b25a0ac64bb0f648388ec834fcb3c

cheers
