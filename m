Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8F9697C18
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:45:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGyTQ70KJz3fb1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:44:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRH3tLdz3cKG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:07 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRH1kdRz4x5Z;
	Wed, 15 Feb 2023 23:43:07 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20230120093215.19496-1-fbarrat@linux.ibm.com>
References: <20230120093215.19496-1-fbarrat@linux.ibm.com>
Subject: Re: [PATCH] powerpc/powernv/ioda: Skip unallocated resources when mapping to PE
Message-Id: <167646484730.1421441.15709212919487322071.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:47 +1100
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
Cc: andrew@aj.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Jan 2023 10:32:15 +0100, Frederic Barrat wrote:
> pnv_ioda_setup_pe_res() calls opal to map a resource with a PE. However,
> the code assumes the resource is allocated and it uses the resource
> address to find out the segment(s) which need to be mapped to the
> PE. In the unlikely case where the resource hasn't been allocated, the
> computation for the segment number is garbage, which can lead to
> invalid memory access and potentially a kernel crash, such as:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/ioda: Skip unallocated resources when mapping to PE
      https://git.kernel.org/powerpc/c/e64e71056f323a1e178dccf04d4c0f032d84436c

cheers
