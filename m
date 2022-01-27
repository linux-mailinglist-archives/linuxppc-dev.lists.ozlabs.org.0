Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E04F49DADD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 07:37:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkrVg16gnz3bTD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 17:37:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nSaQA61T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=mika.westerberg@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nSaQA61T; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkrV20d9Gz2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 17:36:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643265418; x=1674801418;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qfCEG17eUg1nUtn5Bjyg0zcAkUJsBlQnqzVAjVIbB6I=;
 b=nSaQA61TbwMY4YkSv2MZVPM3YQYVIMKlfXPwVcIEh9FLwQeMWytKW9Rl
 RX0W7NsI4pZh9mS/ZvkOzFJZD84G1idx/UE9M1IMOPm9JAMho/AeyH8Dd
 tu4fWB2+xtnCh7U9xQF/4yLZY546TKRe/RQUbzJXdkahwbsMfyXGKs76i
 ZT/ncWcGFb6xhUcfEO/BzVq1ttH7Tmc1IcFdTsqbVnvwnOfKba7IE7ObV
 a2OKf9oNrjvsVKenNjovpHakEcuaLY+X2T0GTB4QvELXEYp9QhQVFr7S4
 amQoOAGbDW/R7HF1+ca4pTRitJ1h+ODUAkSwPaYtTvAdTOiWGsEushrqd g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="234139050"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="234139050"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 22:35:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="477753942"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 22:35:51 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 27 Jan 2022 08:35:27 +0200
Date: Thu, 27 Jan 2022 08:35:27 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 1/2] PCI/AER: Disable AER when link is in L2/L3 ready, L2
 and L3 state
Message-ID: <YfI9L01LI/0rZIuP@lahna>
References: <20220126071853.1940111-1-kai.heng.feng@canonical.com>
 <YfEqZMUS9jyiErmF@lahna>
 <CAAd53p7H3RApEHOzJYorD9VBnaPqYRkzE2g+8hAUXRToc=jbGg@mail.gmail.com>
 <YfI7u5XSlNlx2w4I@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfI7u5XSlNlx2w4I@lahna>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Joerg Roedel <jroedel@suse.de>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com,
 linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 08:29:22AM +0200, Mika Westerberg wrote:
> > For example, should we convert commit a697f072f5da8 ("PCI: Disable PTM
> > during suspend to save power") to PM hooks in PTM service?
> 
> Yes, I think that's the right thing to do. I wonder how it was not using
> the PM hooks in the first place.

Actually no. The reason it is not using PM hooks is that PTM is not a
port "service" so it needs to be dealt in the core.
