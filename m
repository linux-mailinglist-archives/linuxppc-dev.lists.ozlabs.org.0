Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D081B414
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:44:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swn9v25tZz3vxH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:44:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swn5b1DJYz3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:40:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swn5b0D2Bz4wcH;
	Thu, 21 Dec 2023 21:40:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>
In-Reply-To: <20231116122033.160964-1-kjain@linux.ibm.com>
References: <20231116122033.160964-1-kjain@linux.ibm.com>
Subject: Re: (subset) [PATCH 1/2] powerpc/hv-gpci: Add return value check in affinity_domain_via_partition_show function
Message-Id: <170315510012.2192823.4722890033079720737.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:38:20 +1100
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
Cc: disgoel@linux.ibm.com, atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, Disha Goel <disgoel@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Nov 2023 17:50:32 +0530, Kajol Jain wrote:
> To access hv-gpci kernel interface files data, the
> "Enable Performance Information Collection" option has to be set
> in hmc. Incase that option is not set and user try to read
> the interface files, it should give error message as
> operation not permitted.
> 
> Result of accessing added interface files with disabled
> performance collection option:
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/hv-gpci: Add return value check in affinity_domain_via_partition_show function
      https://git.kernel.org/powerpc/c/070b71f428facd9130319707db854ed8bd24637a

cheers
