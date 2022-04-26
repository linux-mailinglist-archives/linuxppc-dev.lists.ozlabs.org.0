Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FF50FC1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 13:43:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kng4d18cbz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 21:43:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Kng485hZgz2xnR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 21:43:02 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 23QBccrP019162;
 Tue, 26 Apr 2022 06:38:38 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 23QBcZpU019161;
 Tue, 26 Apr 2022 06:38:35 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 26 Apr 2022 06:38:35 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH] KVM: powerpc: remove extraneous asterisk from
 rm_host_ipi_action comment
Message-ID: <20220426113835.GM25951@gate.crashing.org>
References: <20220426074750.71251-1-bagasdotme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426074750.71251-1-bagasdotme@gmail.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: Anders Roxell <anders.roxell@linaro.org>, kernel test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 stable@vger.kernel.org, kvm@vger.kernel.org,
 Suresh Warrier <warrier@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 26, 2022 at 02:47:51PM +0700, Bagas Sanjaya wrote:
> kernel test robot reported kernel-doc warning for rm_host_ipi_action():
> 
> arch/powerpc/kvm/book3s_hv_rm_xics.c:887: warning: This comment
> starts with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> 
> Since the function is static, remove the extraneous (second) asterisk at
> the head of function comment.
> 
> Link: https://lore.kernel.org/linux-doc/202204252334.Cd2IsiII-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Suresh Warrier <warrier@linux.vnet.ibm.com>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>

Please do not Cc: me on random patches, I get enough mail already :-)


Segher
