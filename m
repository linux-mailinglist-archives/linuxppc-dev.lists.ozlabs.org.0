Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9EE89D18B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 06:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDCrP0xvkz3dWh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 14:38:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDCqw5jp9z30fh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 14:37:48 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VDCqt32GMz4x1R;
	Tue,  9 Apr 2024 14:37:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VDCqt2DB9z4wbr;
	Tue,  9 Apr 2024 14:37:46 +1000 (AEST)
From: Michael Ellerman <michaele@au1.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 2/2] MAINTAINERS: Make cxl obsolete
In-Reply-To: <20240409031027.41587-2-ajd@linux.ibm.com>
References: <20240409031027.41587-1-ajd@linux.ibm.com>
 <20240409031027.41587-2-ajd@linux.ibm.com>
Date: Tue, 09 Apr 2024 14:37:43 +1000
Message-ID: <87bk6jb17s.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: fbarrat@linux.ibm.com, ukrishn@linux.ibm.com, manoj@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> The cxl driver is no longer actively maintained and we intend to remove it
> in a future kernel release. Change its status to obsolete, and update the
> sysfs ABI documentation accordingly.
>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  Documentation/ABI/{testing => obsolete}/sysfs-class-cxl | 3 +++
>  MAINTAINERS                                             | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>  rename Documentation/ABI/{testing => obsolete}/sysfs-class-cxl (99%)

This is a good start, but I suspect if there are any actual users they
are not going to be monitoring the status of cxl in the MAINTAINERS file :)

I think we should probably modify Kconfig so that anyone who's using cxl
on purpose has some chance to notice before we remove it.

Something like the patch below. Anyone who has an existing config and
runs oldconfig will get a prompt, eg:

  Deprecated support for IBM Coherent Accelerators (CXL) (DEPRECATED_CXL) [N/m/y/?] (NEW)

Folks who just use defconfig etc. won't notice any change which is a
pity. We could also change the default to n, but that risks breaking
someone's machine. Maybe we do that in a another releases time.

cheers

diff --git a/drivers/misc/cxl/Kconfig b/drivers/misc/cxl/Kconfig
index 5efc4151bf58..e3fd3fcaf62a 100644
--- a/drivers/misc/cxl/Kconfig
+++ b/drivers/misc/cxl/Kconfig
@@ -9,11 +9,18 @@ config CXL_BASE
 	select PPC_64S_HASH_MMU
 
 config CXL
-	tristate "Support for IBM Coherent Accelerators (CXL)"
+	def_bool y
+	depends on DEPRECATED_CXL
+
+config DEPRECATED_CXL
+	tristate "Deprecated support for IBM Coherent Accelerators (CXL)"
 	depends on PPC_POWERNV && PCI_MSI && EEH
 	select CXL_BASE
 	default m
 	help
+	  The cxl driver is no longer actively maintained and we intend to
+	  remove it in a future kernel release.
+
 	  Select this option to enable driver support for IBM Coherent
 	  Accelerators (CXL).  CXL is otherwise known as Coherent Accelerator
 	  Processor Interface (CAPI).  CAPI allows accelerators in FPGAs to be
