Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8BF366C43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:13:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLZv4PRNz30FX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:13:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLVQ4Shkz303k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:18 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLVP1Cj4z9vFq; Wed, 21 Apr 2021 23:09:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20210408074504.248211-2-maddy@linux.ibm.com>
References: <20210408074504.248211-1-maddy@linux.ibm.com>
 <20210408074504.248211-2-maddy@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/perf: Add platform specific check_attr_config
Message-Id: <161901049871.1961279.17170059383027204088.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:18 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 8 Apr 2021 13:15:04 +0530, Madhavan Srinivasan wrote:
> Add platform specific attr.config value checks. Patch
> includes checks for both power9 and power10.

Applied to powerpc/next.

[2/2] powerpc/perf: Add platform specific check_attr_config
      https://git.kernel.org/powerpc/c/d8a1d6c58986d8778768b15dc5bac0b4b082d345

cheers
