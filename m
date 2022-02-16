Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D81B34B87AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 13:30:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzHP52Yf6z3clg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 23:30:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzHNL3pt1z2xrG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:30:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzHNL4Hw3z4xdL;
 Wed, 16 Feb 2022 23:30:10 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <68932ec2ba6b868d35006b96e90f0890f3da3c05.1638273868.git.christophe.leroy@csgroup.eu>
References: <68932ec2ba6b868d35006b96e90f0890f3da3c05.1638273868.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/32: Remove remaining .stabs annotations
Message-Id: <164501434587.521186.16713102586513485319.b4-ty@ellerman.id.au>
Date: Wed, 16 Feb 2022 23:25:45 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 30 Nov 2021 13:04:49 +0100, Christophe Leroy wrote:
> STABS debug format has been superseded long time ago by DWARF.
> 
> Remove the few remaining .stabs annotations from old 32 bits code.
> 
> 

Applied to powerpc/next.

[1/2] powerpc/32: Remove remaining .stabs annotations
      https://git.kernel.org/powerpc/c/12318163737cd8808d13faa6e2393774191a6182
[2/2] powerpc/32: Remove _ENTRY() macro
      https://git.kernel.org/powerpc/c/27e21e8f128a56d3462f0fe2fd3a59c02cc002b1

cheers
