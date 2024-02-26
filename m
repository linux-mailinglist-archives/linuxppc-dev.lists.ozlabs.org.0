Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD938669DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 07:03:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjqmX1X1nz3vlk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:03:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjqkp1S1lz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 17:01:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tjqkl1pblz4wnr;
	Mon, 26 Feb 2024 17:01:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20240207035220.339726-1-npiggin@gmail.com>
References: <20240207035220.339726-1-npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/pseries: Add a clear modifier to ibm,pa/pi-features parser
Message-Id: <170892700815.3915597.4499374118995867850.b4-ty@ellerman.id.au>
Date: Mon, 26 Feb 2024 16:56:48 +1100
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 07 Feb 2024 13:52:18 +1000, Nicholas Piggin wrote:
> When a new ibm,pa/pi-features bit is introduced that is intended to
> apply to existing systems and features, it may have an "inverted"
> meaning (i.e., bit clear => feature available; bit set => unavailable).
> Depending on the nature of the feature, this may give the best
> backward compatibility result where old firmware will continue to
> have that bit clear and therefore the feature available.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/pseries: Add a clear modifier to ibm,pa/pi-features parser
      https://git.kernel.org/powerpc/c/8b338061065b1871fc9ec53bd772321c15363123
[2/2] powerpc/pseries: Set CPU_FTR_DBELL according to ibm,pi-features
      https://git.kernel.org/powerpc/c/6e9de2054eb417d6e05561b19c825c29b424b475

cheers
