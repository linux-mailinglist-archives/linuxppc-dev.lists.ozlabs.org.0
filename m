Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95930DA16
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:48:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW1gP3k1zzF15M
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:48:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW09m3M69zDwv6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09l0HL9z9vFR; Wed,  3 Feb 2021 22:40:42 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michal Suchanek <msuchanek@suse.de>
In-Reply-To: <20210120132838.15589-1-msuchanek@suse.de>
References: <20210120132838.15589-1-msuchanek@suse.de>
Subject: Re: [PATCH] powerpc: Fix build error in paravirt.h
Message-Id: <161235200842.1516112.5240192209581561083.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:42 +1100 (AEDT)
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
Cc: Juergen Gross <jgross@suse.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Paul Mackerras <paulus@samba.org>,
 Waiman Long <longman@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 Jan 2021 14:28:38 +0100, Michal Suchanek wrote:
> ./arch/powerpc/include/asm/paravirt.h:83:44: error: implicit declaration
> of function 'smp_processor_id'; did you mean 'raw_smp_processor_id'?
> 
> smp_processor_id is defined in linux/smp.h but it is not included.
> 
> The build error happens only when the patch is applied to 5.3 kernel but
> it only works by chance in mainline.

Applied to powerpc/next.

[1/1] powerpc: Fix build error in paravirt.h
      https://git.kernel.org/powerpc/c/9899a56f1eca964cd0de21008a9fa1523a571231

cheers
