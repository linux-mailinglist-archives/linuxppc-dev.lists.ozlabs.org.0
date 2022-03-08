Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 348204D16E9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:11:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZ100SN4z3bdL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:11:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ0c74r7z30G0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:10:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ0c0yctz4xcl;
 Tue,  8 Mar 2022 23:10:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <ec286d2cc6989668a96f14543275437d2f3f0e3a.1645099283.git.christophe.leroy@csgroup.eu>
References: <ec286d2cc6989668a96f14543275437d2f3f0e3a.1645099283.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/4] powerpc/ftrace: Don't use lmw/stmw in
 ftrace_regs_caller()
Message-Id: <164674129368.3322453.9191334445476386091.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:08:13 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Feb 2022 13:01:56 +0100, Christophe Leroy wrote:
> For the same reason as commit a85c728cb5e1 ("powerpc/32: Don't use
> lmw/stmw for saving/restoring non volatile regs"), don't use
> lmw/stmw in ftrace_regs_caller().
> 
> Use the same macros for PPC32 and PPC64.
> 
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/ftrace: Don't use lmw/stmw in ftrace_regs_caller()
      https://git.kernel.org/powerpc/c/9bdb2eec3dde4d66b71cb4bbaebde0caed2cf0e3
[2/4] powerpc/ftrace: Refactor ftrace_{regs_}caller
      https://git.kernel.org/powerpc/c/228216716cb5f9a19d70bfc40bdc0d6a7fb7e72f
[3/4] powerpc/ftrace: Regroup PPC64 specific operations in ftrace_mprofile.S
      https://git.kernel.org/powerpc/c/a5f04d1f2724db036ba4087873c0691881932bc9
[4/4] powerpc/ftrace: Use STK_GOT in ftrace_mprofile.S
      https://git.kernel.org/powerpc/c/2ca48dbb210767b9e7166d7d47febc8fcd1da6e1

cheers
