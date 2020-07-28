Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D015230058
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 05:42:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BG2YX5xhyzDr3M
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 13:42:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BG11j3MCHzDqtS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 12:33:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=b8dl2+d2; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BG11g1SSpz8t64
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 12:33:11 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BG11f3W9Gz9sTQ; Tue, 28 Jul 2020 12:33:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=piliu@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=b8dl2+d2; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BG11d4P4Yz9sSn
 for <linuxppc-dev@ozlabs.org>; Tue, 28 Jul 2020 12:33:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595903582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2Dgok5d4kIn9F8q0n3JSRWupAQ4Bqg6yV879GUqY3s=;
 b=b8dl2+d2XxzznEWcT9Ge1YO7QgML6zUWf7ROfxnCoi/OducbiTYSQ152uVhRFIemeI3yP1
 pgIvTrkQvSxAI/OU5cOaZM5pgK75+G1QuA51TI/5WslzH/HRbJjf622TvNQQW3S7MGPUl+
 wQ+Kv8utiXIfVqQtvixtCDHgbSoIu44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-9BMR-vUtOkSbC6hRJHCq1Q-1; Mon, 27 Jul 2020 22:32:58 -0400
X-MC-Unique: 9BMR-vUtOkSbC6hRJHCq1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FA4D800688;
 Tue, 28 Jul 2020 02:32:56 +0000 (UTC)
Received: from [10.72.8.32] (ovpn-8-32.pek2.redhat.com [10.72.8.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC21A5F1EA;
 Tue, 28 Jul 2020 02:32:45 +0000 (UTC)
Subject: Re: [RESEND PATCH v5 00/11] ppc64: enable kdump support for
 kexec_file_load syscall
To: Hari Bathini <hbathini@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
From: piliu <piliu@redhat.com>
Message-ID: <23911b9d-7534-031c-6f98-80f90439c834@redhat.com>
Date: Tue, 28 Jul 2020 10:32:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <159579157320.5790.6748078824637688685.stgit@hbathini>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: kernel test robot <lkp@intel.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Vivek Goyal <vgoyal@redhat.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/27/2020 03:36 AM, Hari Bathini wrote:
> Sorry! There was a gateway issue on my system while posting v5, due to
> which some patches did not make it through. Resending...
> 
> This patch series enables kdump support for kexec_file_load system
> call (kexec -s -p) on PPC64. The changes are inspired from kexec-tools
> code but heavily modified for kernel consumption.
> 
> The first patch adds a weak arch_kexec_locate_mem_hole() function to
> override locate memory hole logic suiting arch needs. There are some
> special regions in ppc64 which should be avoided while loading buffer
> & there are multiple callers to kexec_add_buffer making it complicated
> to maintain range sanity and using generic lookup at the same time.
> 
> The second patch marks ppc64 specific code within arch/powerpc/kexec
> and arch/powerpc/purgatory to make the subsequent code changes easy
> to understand.
> 
> The next patch adds helper function to setup different memory ranges
> needed for loading kdump kernel, booting into it and exporting the
> crashing kernel's elfcore.
> 
> The fourth patch overrides arch_kexec_locate_mem_hole() function to
> locate memory hole for kdump segments by accounting for the special
> memory regions, referred to as excluded memory ranges, and sets
> kbuf->mem when a suitable memory region is found.
> 
> The fifth patch moves walk_drmem_lmbs() out of .init section with
> a few changes to reuse it for setting up kdump kernel's usable memory
> ranges. The next patch uses walk_drmem_lmbs() to look up the LMBs
> and set linux,drconf-usable-memory & linux,usable-memory properties
> in order to restrict kdump kernel's memory usage.
> 
> The seventh patch updates purgatory to setup r8 & r9 with opal base
> and opal entry addresses respectively to aid kernels built with
> CONFIG_PPC_EARLY_DEBUG_OPAL enabled. The next patch setups up backup
> region as a kexec segment while loading kdump kernel and teaches
> purgatory to copy data from source to destination.
> 
> Patch 09 builds the elfcore header for the running kernel & passes
> the info to kdump kernel via "elfcorehdr=" parameter to export as
> /proc/vmcore file. The next patch sets up the memory reserve map
> for the kexec kernel and also claims kdump support for kdump as
> all the necessary changes are added.
> 
> The last patch fixes a lookup issue for `kexec -l -s` case when
> memory is reserved for crashkernel.
> 
> Tested the changes successfully on P8, P9 lpars, couple of OpenPOWER
> boxes, one with secureboot enabled, KVM guest and a simulator.
> 
> v4 -> v5:
> * Dropped patches 07/12 & 08/12 and updated purgatory to do everything
>   in assembly.
I guess you achieve this by carefully selecting instruction to avoid
relocation issue, right?

Thanks,
Pingfan

