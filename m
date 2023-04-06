Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3346D8BF5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 02:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsMy30Hz4z3fV0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 10:36:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsMxb6c6gz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 10:36:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PsMxY1hyzz4x91;
	Thu,  6 Apr 2023 10:36:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Sathvika Vasireddy <sv@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Fabiano Rosas <farosas@linux.ibm.com>, Kautuk Consul <kconsul@linux.vnet.ibm.com>
In-Reply-To: <20230327113320.3407491-1-kconsul@linux.vnet.ibm.com>
References: <20230327113320.3407491-1-kconsul@linux.vnet.ibm.com>
Subject: Re: [PATCH v5] KVM: PPC: Book3S HV: kvmppc_hv_entry: remove .global scope
Message-Id: <168074126986.3672916.9668279446750796507.b4-ty@ellerman.id.au>
Date: Thu, 06 Apr 2023 10:34:29 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Mar 2023 07:33:20 -0400, Kautuk Consul wrote:
> kvmppc_hv_entry isn't called from anywhere other than
> book3s_hv_rmhandlers.S itself. Removing .global scope for
> this function and annotating it with SYM_CODE_START_LOCAL
> and SYM_CODE_END.
> 
> 

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV: kvmppc_hv_entry: remove .global scope
      https://git.kernel.org/powerpc/c/5f4f53d28cde2cc7be96f657229c8603da578500

cheers
