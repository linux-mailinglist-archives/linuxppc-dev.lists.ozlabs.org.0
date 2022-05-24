Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C3532851
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 12:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6rh400Bhz3dtl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:55:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6rfZ1Dnzz30Hf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 20:53:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6rfX1zQrz4xbt;
 Tue, 24 May 2022 20:53:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org
In-Reply-To: <20220506070747.16309-1-bagasdotme@gmail.com>
References: <20220506070747.16309-1-bagasdotme@gmail.com>
Subject: Re: [PATCH RESEND] KVM: powerpc: remove extraneous asterisk from
 rm_host_ipi_action comment
Message-Id: <165338950668.1711920.11760808136343682711.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 20:51:46 +1000
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
Cc: Anders Roxell <anders.roxell@linaro.org>, kvm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Fabiano Rosas <farosas@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Suresh Warrier <warrier@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 6 May 2022 14:07:47 +0700, Bagas Sanjaya wrote:
> kernel test robot reported kernel-doc warning for rm_host_ipi_action():
> 
> >> arch/powerpc/kvm/book3s_hv_rm_xics.c:887: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Host Operations poked by RM KVM
> 
> Since the function is static, remove the extraneous (second) asterisk at
> the head of function comment.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: powerpc: remove extraneous asterisk from rm_host_ipi_action comment
      https://git.kernel.org/powerpc/c/d53c36e6c83863fde4a2748411c31bc4853a0936

cheers
