Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5768BE642
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 16:42:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYgwm4spSz3d8N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 00:42:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYgw02bP3z3cCM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 00:41:52 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VYgvw102Bz4x0x; Wed,  8 May 2024 00:41:48 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYgvt194nz4x23;
	Wed,  8 May 2024 00:41:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20240326055413.186534-1-sourabhjain@linux.ibm.com>
References: <20240326055413.186534-1-sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v18 0/6] powerpc/crash: Kernel handling of CPU and memory hotplug
Message-Id: <171509287314.62008.11812494124513471250.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 00:41:13 +1000
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 26 Mar 2024 11:24:07 +0530, Sourabh Jain wrote:
> Commit 247262756121 ("crash: add generic infrastructure for crash
> hotplug support") added a generic infrastructure that allows
> architectures to selectively update the kdump image component during CPU
> or memory add/remove events within the kernel itself.
> 
> This patch series adds crash hotplug handler for PowerPC and enable
> support to update the kdump image on CPU/Memory add/remove events.
> 
> [...]

Applied to powerpc/topic/kdump-hotplug.

[1/6] crash: forward memory_notify arg to arch crash hotplug handler
      https://git.kernel.org/powerpc/c/118005713e35a1893c6ee47ab2926cca277737de
[2/6] crash: add a new kexec flag for hotplug support
      https://git.kernel.org/powerpc/c/79365026f86948b52c3cb7bf099dded92c559b4c
[3/6] powerpc/kexec: move *_memory_ranges functions to ranges.c
      https://git.kernel.org/powerpc/c/f5f0da5a7b18fab383bac92044fd8f4f288c9d38
[4/6] PowerPC/kexec: make the update_cpus_node() function public
      https://git.kernel.org/powerpc/c/0857beff9c1ec8bb421a8b7a721da0f34cc886c0
[5/6] powerpc/crash: add crash CPU hotplug support
      https://git.kernel.org/powerpc/c/b741092d59761b98781fcb4f3f521312ed8d5006
[6/6] powerpc/crash: add crash memory hotplug support
      https://git.kernel.org/powerpc/c/849599b702ef8977fcd5b2f27c61ef773c42bb88

cheers
