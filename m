Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8007824067D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 15:14:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQGdF1NmYzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 23:14:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQGb06q60zDqMw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 23:12:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=L7vJvYft; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQGb00LF5z9sPB;
 Mon, 10 Aug 2020 23:12:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597065132;
 bh=SWGA3xns0cZf3gu/kE+GwGglOFuMwcwftttIL6V0KBw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L7vJvYft6Vek2NkXCZJXraNyudPe4WZoLO/JLJwcGyebMMop3Zu6zM7JtIJiF5K83
 Ad2DSc03dOE6DtFY9VNHeIGr1N0iwaUERIIyrZ9bd+yvml9mq4sYAYSxXtIiTyYUA2
 NYl0GycWB+ecMFsfxXtC+lsmHOM/NzSKP+wHZzuC1QbyOpae4Zkjs8ee8Kdl2rWG4f
 O7+s3eHVIFxt9VCab31rIS9LOCFs7TpfGvIGxRSVrFE1DxJ3wUlLAZ2jEiVlc8M5/T
 bOiLWZ6B7WmrLf1tmkenQrFRYn4RE+K0Tc8RNhZCHmDI2RSa9OxYD+zTvGJXpz19Ty
 wC9N+X8rKKbZg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Subject: Re: [PATCH] powerpc/papr_scm: Make access mode of 'perf_stats'
 attribute file to '0400'
In-Reply-To: <20200807123146.11037-1-vaibhav@linux.ibm.com>
References: <20200807123146.11037-1-vaibhav@linux.ibm.com>
Date: Mon, 10 Aug 2020 23:12:08 +1000
Message-ID: <87wo26abmf.fsf@mpe.ellerman.id.au>
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> The newly introduced 'perf_stats' attribute uses the default access
> mode of 0444 letting non-root users access performance stats of an
> nvdimm and potentially force the kernel into issuing large number of
> expensive HCALLs. Since the information exposed by this attribute
> cannot be cached hence its better to ward of access to this attribute
> from non-root users.
>
> Hence this patch updates the access-mode of 'perf_stats' sysfs
> attribute file to 0400 to make it only readable to root-users.

Or should we ratelimit it?

Fixes: ??

> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

cheers

