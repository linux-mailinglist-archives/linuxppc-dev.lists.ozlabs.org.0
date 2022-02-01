Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB44A5FEF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 16:24:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp7yd13C5z3cm5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 02:24:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JWTGkwHe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JWTGkwHe; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp7xy2b5Rz2x9g
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 02:24:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643729046; x=1675265046;
 h=message-id:date:mime-version:to:cc:references:from:
 subject:in-reply-to:content-transfer-encoding;
 bh=nnvMf1Uwhyx5N3Z7IQ73CHGKH93ytUmyyUjp9Bh+6So=;
 b=JWTGkwHe6AUObGMrH5kpaQ1VwWY4swjzApdmW0rDNA+rMNE8IbxtJFZW
 YAH2XFxuz5X8YfPILq6TU+v7lYXwVi7Ldnk+oiuWCxBgRBo+NkzzuMKkh
 vPV0jScJcWDX7oau43oFz/CT4No8n1Xqx6dhkccpLBQ2G7Y7eX0VdcOnR
 rA2HBY1tiQ/W/wtPvXQPGD0+E2m3KS5Qzb725T0CXUp63y5KO2eN5uljQ
 IAbfQxr22cMqiu/IllYjYHj6OfkFUJ/W9uCufVpFDz68O7EBi4bNuFaOS
 y8fqi8h4gbKGE/A0782yy1jTY8RO8iVV9REOn6RulQxrkXmimbK240mnF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247663708"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="247663708"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 07:23:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="497377097"
Received: from kssimha-mobl1.amr.corp.intel.com (HELO [10.212.228.15])
 ([10.212.228.15])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 07:23:00 -0800
Message-ID: <4d19936f-fc8a-8e86-95b2-67a4ab2e2b7f@intel.com>
Date: Tue, 1 Feb 2022 07:22:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220122005637.28199-1-nayna@linux.ibm.com>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [RFC PATCH 0/2] powerpc/pseries: add support for local secure
 storage called Platform Keystore(PKS)
In-Reply-To: <20220122005637.28199-1-nayna@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Greg KH <gregkh@linuxfoundation.org>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, Douglas Miller <dougmill@linux.vnet.ibm.com>,
 George Wilson <gcwilson@linux.ibm.com>, "Weiny, Ira" <ira.weiny@intel.com>,
 gjoyce@ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/21/22 16:56, Nayna Jain wrote:
> Nayna Jain (2):
>   pseries: define driver for Platform Keystore
>   pseries: define sysfs interface to expose PKS variables

Hi Folks,

There another feature that we might want to consider in the naming here:

> https://lore.kernel.org/all/20220127175505.851391-1-ira.weiny@intel.com/

Protection Keys for Supervisor pages is also called PKS.  It's also not
entirely impossible that powerpc might want to start using this code at
some point, just like what happened with the userspace protection keys[1].

I don't think it's the end of the world either way, but it might save a
hapless user or kernel developer some confusion if we can avoid
including two "PKS" features in the kernel.  I just wanted to make sure
we were aware of the other's existence. :)

1.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm/pkeys.h
