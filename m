Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B047D1229A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 12:19:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cbHn249nzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 22:19:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cbDx2wWQzDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 22:16:25 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 03:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="389789917"
Received: from pbroex-mobl1.ger.corp.intel.com ([10.251.85.107])
 by orsmga005.jf.intel.com with ESMTP; 17 Dec 2019 03:16:12 -0800
Message-ID: <1a68db2aee382a1b0472cf0b81a809bc089e622d.camel@linux.intel.com>
Subject: Re: [PATCH] drivers: char: tpm: remove unneeded MODULE_VERSION() usage
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>, 
 linux-kernel@vger.kernel.org
Date: Tue, 17 Dec 2019 13:16:11 +0200
In-Reply-To: <20191216084230.31412-1-info@metux.net>
References: <20191216084230.31412-1-info@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: jgg@ziepe.ca, peterhuewe@gmx.de, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-12-16 at 09:42 +0100, Enrico Weigelt, metux IT consult wrote:
> Remove MODULE_VERSION(), as it isn't needed at all: the only version
> making sense is the kernel version.

Take the following line away:

> See also: https://lkml.org/lkml/2017/11/22/480

And just before SOB:

Link: https://lkml.org/lkml/2017/11/22/480
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

You have some extra cruft there. It should be:

Signed-off-by: Enrico Weigelt <info@metux.net>

/Jarkko

