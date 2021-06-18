Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5057E3AC24E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:28:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mBK6l07z3fW0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:28:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4J2TZ7z3c3p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:56 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4H053yz9sf8; Fri, 18 Jun 2021 14:22:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, jniethe5@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
References: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 01/12] powerpc: Rework PPC_RAW_xxx() macros for
 prefixed instructions
Message-Id: <162398829178.1363949.13507267049091295423.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:31 +1000
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

On Thu, 20 May 2021 10:23:00 +0000 (UTC), Christophe Leroy wrote:
> At the time being, we have PPC_RAW_PLXVP() and PPC_RAW_PSTXVP() which
> provide a 64 bits value, and then it gets split by open coding to
> format it into a 'struct ppc_inst' instruction.
> 
> Instead, define a PPC_RAW_xxx_P() and a PPC_RAW_xxx_S() to be used
> as is.

Applied to powerpc/next.

[01/12] powerpc: Rework PPC_RAW_xxx() macros for prefixed instructions
        https://git.kernel.org/powerpc/c/148a047602462ab04bff20f3529a255b0439d3df
[02/12] powerpc/opcodes: Add shorter macros for registers for use with PPC_RAW_xx()
        https://git.kernel.org/powerpc/c/07cd18320ed816dec8ff6f58a2d8b33294dcceba
[03/12] powerpc/lib/code-patching: Use PPC_RAW_() macros
        https://git.kernel.org/powerpc/c/8804d5beef9189fd2eae5aee14e1628436742e02
[04/12] powerpc/signal: Use PPC_RAW_xx() macros
        https://git.kernel.org/powerpc/c/1c9debbc2eb5391277ae6aa7d95f821e0c28613d
[05/12] powerpc/modules: Use PPC_RAW_xx() macros
        https://git.kernel.org/powerpc/c/47b04699d0709f5ff12a8aa0b3050a6246eb570e
[06/12] powerpc/security: Use PPC_RAW_BLR() and PPC_RAW_NOP()
        https://git.kernel.org/powerpc/c/e7304597560176d8755e2ae4abb599d0c4efe4f2
[07/12] powerpc/ftrace: Use PPC_RAW_MFLR() and PPC_RAW_NOP()
        https://git.kernel.org/powerpc/c/5a03e1e9728edce8f87e3e0bad6d4cd66329b129
[08/12] powerpc/ebpf64: Use PPC_RAW_MFLR()
        https://git.kernel.org/powerpc/c/e08021f8dbd256f480b7e172aa4e894219c901f2
[09/12] powerpc/ebpf32: Use _Rx macros instead of __REG_Rx ones
        https://git.kernel.org/powerpc/c/e0ea08c0cacf9370e3fd3ee8bb7456c61e79db66
[10/12] powerpc/lib/feature-fixups: Use PPC_RAW_xxx() macros
        https://git.kernel.org/powerpc/c/ef909ba954145e35c9e21352133e5e99c64ab3f4
[11/12] powerpc/traps: Start using PPC_RAW_xx() macros
        https://git.kernel.org/powerpc/c/deefd0ae990a689089ea1e4f5ad41799d63d4fd9
[12/12] powerpc: Replace PPC_INST_NOP by PPC_RAW_NOP()
        https://git.kernel.org/powerpc/c/f30becb5e9ec086257162f78be491c0920c616b7

cheers
