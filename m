Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9CC7EE957
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 23:37:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qqzsyJdv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWZfK14plz3dHP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 09:37:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qqzsyJdv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWZdP1VYQz307y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 09:36:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700174176;
	bh=619MFD5HlhmkV/puC4bSDr4aMr+FQn2SRzvXZ6sYxCA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qqzsyJdvolW2YxZYZTkG1448LfEOGc32lf7NLfOpJ4ZNfAp9kx/129Er+HjZ9qa8K
	 8ulo7DqY0FVp4v4PeFelKFN5jAINfrY99qnLDJ6ZvPePwBnwdv4uJfIjdLxs3NFEn+
	 kxoiPHccqBzNRzoWzdOzdjChPlXnC0LK+cBBkWubPvtRKntcwBBgac6bYdmPeDdC/Y
	 0Jnbycu/HUsBrPIztK+A+YkOwvtmZwNOldya/uyYpAGPcEZyLpGdRws5ln02qDKdX+
	 8rbJfLyusXmKnNxPcNivsRS6Bms7uS+bsNTBz+yRQTCBbWTgxBNj6omagizYaqM6q9
	 95ctACmYwToaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SWZdD3HDsz4xGQ;
	Fri, 17 Nov 2023 09:36:16 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/hv-gpxi: Fix access permission of hv-gpci
 interface files
In-Reply-To: <20231116122033.160964-2-kjain@linux.ibm.com>
References: <20231116122033.160964-1-kjain@linux.ibm.com>
 <20231116122033.160964-2-kjain@linux.ibm.com>
Date: Fri, 17 Nov 2023 09:36:11 +1100
Message-ID: <87msvd72ck.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, Disha Goel <disgoel@linux.vnet.ibm.com>, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kajol Jain <kjain@linux.ibm.com> writes:
> Fix access permission of the hv-gpci topology information
> interface files from 0444 to 0400 (admin read only).

Please explain why they should be 0400.

Also typo in subject, "hv-gpxi".

cheers

> Fixes: 71f1c39647d8 ("powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show processor bus topology information")
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/perf/hv-gpci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
> index 27f18119fda1..303d160319e8 100644
> --- a/arch/powerpc/perf/hv-gpci.c
> +++ b/arch/powerpc/perf/hv-gpci.c
> @@ -890,7 +890,7 @@ static struct device_attribute *sysinfo_device_attr_create(int
>  			return NULL;
>  
>  		sysfs_attr_init(&attr->attr);
> -		attr->attr.mode = 0444;
> +		attr->attr.mode = 0400;
>  
>  		switch (sysinfo_interface_group_index) {
>  		case INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR:
> -- 
> 2.39.3
