Return-Path: <linuxppc-dev+bounces-3382-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE29D03B2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjF4dp1z3bqZ;
	Sun, 17 Nov 2024 23:25:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846337;
	cv=none; b=inXO8ZqccXxhmBNecMWMOn7V69RDMpUmZSP2GrFyQ40ui2SnYwv+hjFkoQ1AX3nJM56E1Coa5cHHtRf/sSSCwDEz1dYzlg2JmCGZGKl5fcmPpAZMYO9IeaizzGjjA9pUj1OXyNWbyvnPOEnYNh9GCAyDYoNESTmrU1PllEyie/PtggIgqqEYaKEZFSndxDfW7v14ZF/Z3GV41psGwLseH85E9VLdAOUbhh+zeCyq7Tc9zYfoEnwmmto3OEoL8KBXj+IvM+Wjw+VP+WddYlxR92doYRKMeMtVNwqdpjRFJHXOSCNdJ5lpTvxFobkpNk2Inwh7StR4zTC11LE39LFjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846337; c=relaxed/relaxed;
	bh=svz/+d/BJbQJVr4DFdXqf+eDPKB8KH697JjZEyodgdM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ec4j7AZcwy9T3IFutUQ6o+sDEBvRxKEcbBGzUReOWqNsl54hU1G315VdLDyGfQDiN3S8NOKOTZPJ6gGxO+pJivEyE4+eVufkYTydDO4o65/OYtCCiXSmcZQ0HjhtW4SH/lDKNQS1LvADKvH5p3WLjMKd3LHLSja2C1nbzj9i6sS5HOkQCBx1aj1iLApexOQsWN/hX9Gnd1p4KefJ+QoTtBY3U2hpgviGx+YiqMVE1V+OjugAlKMrRJffW6Fi/BTrpst+0IBYljZrLdFyS08PKkbra34ao0CoAPlDbWSnokWi4egCPIKcr2SIFaJHEUX4JGmqfZV0GNejwxzcJ7dB4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Yhfn3sOt; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Yhfn3sOt;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjC3L3zz3bnc
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846332;
	bh=svz/+d/BJbQJVr4DFdXqf+eDPKB8KH697JjZEyodgdM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yhfn3sOtyEA0XnfnDCm2IXtldZDpbHEtVH2KhJmZIGo4M37GpbIOn1yBDho+Et1As
	 tM7DlcTqTjUQEtu2++BkGsPrjKoBygEgwgq9KGzNSZh1nd4D9gGz+pOB9JOLQPgmmE
	 Njq8Lxr1pwOx931dne9hEyIsAN+N6zLn7/FhtDRbbtXI8OGtxUgrNJCg/Q3pjeSLw9
	 GwQRlcSwZmnmqRIXOymUMPKkGJKCw2p3HSXhvAU6CEDaX9WWq/Q+/owGIIsIszVmi7
	 zm4zpIuyV8z/nPzqusVsuuU0ddC95ElmY0Rti9mwxOtpB0colXNfbr9YekS1TH/NR7
	 xsPV+41XUhC6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj83FZvz4xfW;
	Sun, 17 Nov 2024 23:25:32 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: geoff@infradead.org, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: linux-hardening@vger.kernel.org
In-Reply-To: <ZxMV3YvSulJFZ8rk@mail.google.com>
References: <ZxMV3YvSulJFZ8rk@mail.google.com>
Subject: Re: [PATCH][next] powerpc/ps3: replace open-coded sysfs_emit function
Message-Id: <173184539744.890800.11374052691484660203.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 19 Oct 2024 15:13:49 +1300, Paulo Miguel Almeida wrote:
> sysfs_emit() helper function should be used when formatting the value
> to be returned to user space.
> 
> This patch replaces open-coded sysfs_emit() in sysfs .show() callbacks
> 
> 

Applied to powerpc/next.

[1/1] powerpc/ps3: replace open-coded sysfs_emit function
      https://git.kernel.org/powerpc/c/2866949ec889cf383c481119c617b9cead733070

cheers

