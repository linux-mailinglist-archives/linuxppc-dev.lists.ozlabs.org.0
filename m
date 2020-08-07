Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C523ED4F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 14:27:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNPl558FWzDqvn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 22:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Fzw9Kjih; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNPgW41qqzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 22:24:39 +1000 (AEST)
Received: from quaco.ghostprotocols.net (unknown [186.208.79.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5949E221E2;
 Fri,  7 Aug 2020 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596803077;
 bh=/GgOd66VU6It9tCPbdyCpLG2AEPoEOUp7gJQnQW+iM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fzw9KjihbZZ0PNWv49nMj/vF1ycShKjtwzxN2EsGGWw9Y9aYCzM6hCW/uOKJeDjAY
 EPkWIUxDCX3XKqQvgcTy5EO6T4IDs7jbHYY2h396tXgyPXFSPP1NJORcUS8TytLB5t
 jWU1wfLBJsk1Kg01WNROdP6+SuiN7ItlmOMIRfJA=
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id B9D4040481; Fri,  7 Aug 2020 09:24:34 -0300 (-03)
Date: Fri, 7 Aug 2020 09:24:34 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V6 0/2] tools/perf: Add extended regs support for powerpc
Message-ID: <20200807122434.GD2456573@kernel.org>
References: <1596795079-23601-1-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596795079-23601-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 jolsa@kernel.org, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, Aug 07, 2020 at 06:11:17AM -0400, Athira Rajeev escreveu:
> Patch set to add perf tools support for perf extended register capability
> in powerpc. 
> 
> Patch 1/2 adds extended regs for power9 ( mmcr0, mmcr1 and mmcr2 )
> to sample_reg_mask in the tool side to use with `-I?`.
> Patch 2/2 adds extended regs for power10 ( mmcr3, sier2, sier3)
> to sample_reg_mask in the tool side.
> 
> Ravi bangoria found an issue with `perf record -I` while testing the
> changes. The same issue is currently being worked on here:
> https://lkml.org/lkml/2020/7/19/413 and will be resolved once fix
> from Jin Yao is merged.
> 
> This includes the perf tools side changes to support extended regs.
> kernel side changes are sent as separate patchset.

Thanks, applied.

- Arnaldo
