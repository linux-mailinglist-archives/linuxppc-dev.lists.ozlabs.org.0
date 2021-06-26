Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 717283B4E39
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:45:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr9b1hk7z3fjg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:45:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2h0rrFz3bwl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:39:08 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2f467Jz9ssD; Sat, 26 Jun 2021 20:39:06 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linux-nvdimm@lists.01.org,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210513092349.285021-1-vaibhav@linux.ibm.com>
References: <20210513092349.285021-1-vaibhav@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/papr_scm: Make 'perf_stats' invisible if
 perf-stats unavailable
Message-Id: <162470384261.3589875.458542871782512158.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:22 +1000
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 13 May 2021 14:53:49 +0530, Vaibhav Jain wrote:
> In case performance stats for an nvdimm are not available, reading the
> 'perf_stats' sysfs file returns an -ENOENT error. A better approach is
> to make the 'perf_stats' file entirely invisible to indicate that
> performance stats for an nvdimm are unavailable.
> 
> So this patch updates 'papr_nd_attribute_group' to add a 'is_visible'
> callback implemented as newly introduced 'papr_nd_attribute_visible()'
> that returns an appropriate mode in case performance stats aren't
> supported in a given nvdimm.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/papr_scm: Make 'perf_stats' invisible if perf-stats unavailable
      https://git.kernel.org/powerpc/c/ed78f56e1271f108e8af61baeba383dcd77adbec

cheers
