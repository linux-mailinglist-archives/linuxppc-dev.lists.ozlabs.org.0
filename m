Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895863D224
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZ052W0mz3g1l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:38:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYqp2wbkz3bfV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:31:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqn6plFz4xYQ;
	Wed, 30 Nov 2022 20:31:33 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Disha Goel <disgoel@linux.vnet.ibm.com>
In-Reply-To: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
References: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] Remove unused macros from asm-offset
Message-Id: <166980023498.3017288.13262429077014011611.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:23:54 +1100
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Sep 2022 16:27:34 +0530, Disha Goel wrote:
> The kvm code was refactored to convert some of kvm assembly routines to C.
> This includes commits which moved code path for the kvm guest entry/exit
> for p7/8 from aseembly to C. As part of the code changes, usage of some of
> the macros were removed. But definitions still exist in the assembly files.
> Commits are listed below:
> 
> Commit 2e1ae9cd56f8 ("KVM: PPC: Book3S HV: Implement radix prefetch workaround by disabling MMU")
> Commit 9769a7fd79b6 ("KVM: PPC: Book3S HV: Remove radix guest support from P7/8 path")
> Commit fae5c9f3664b ("KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path")
> Commit 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore in C")
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/kvm: Remove unused macros from asm-offset
      https://git.kernel.org/powerpc/c/2223552256dfc48435e0699dbe1e9b8d2cd56b06
[2/2] powerpc/kvm: Remove unused references for MMCR3/SIER2/SIER3 registers
      https://git.kernel.org/powerpc/c/4ac9d3187cc7ccba25f76a3faef3e08a366f77b9

cheers
