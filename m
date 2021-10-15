Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9FD42E7F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 06:37:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVtmT1KPXz3c59
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 15:37:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UGBBJEIe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVtlm3YLnz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 15:37:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UGBBJEIe; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVtlf1hz1z4xbL;
 Fri, 15 Oct 2021 15:37:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634272623;
 bh=gy6IOQq1/i045R/X3xzbUqQQYRLl5v+byr2Go9PBGx0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UGBBJEIei0/FmxdXzeDsBrNFu8QhOtzqfeV4lfTTbyRZi+9YRE6me9r8NzAhfz4s4
 L3DesDbRYKu789A0p3O+zYAGtMcze41SJvppc8xp26lv25lj9CHt58M7v9e6FxD4MF
 Yyl/JEmq1qIyUhMHvwdPfRq0aAUPLTUZH7+YGWwXiZUmuVgCUgx6SojZBSzNrCqFtg
 Lius0aDSA3WdR+eL1PkhYKJrpYnW3CiOMXeK0ekXMBF+KdeM68ArSxUwZf9c0WWWZz
 sAtfAAhW4Cm52C3YM5oa90SF4J/GsSwGCz55TIy2jSoP3r2qWOZhGMPdeTEf4plpSB
 2MwWV0YyRx/dg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, tyreld@linux.vnet.ibm.com
Subject: Re: [PATCH] ibmvscsi: use GFP_KERNEL with dma_alloc_coherent in
 initialize_event_pool
In-Reply-To: <bbab1043-ee3a-6d5b-7ff5-ea5ed84e9fb8@linux.ibm.com>
References: <1547089149-20577-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <bbab1043-ee3a-6d5b-7ff5-ea5ed84e9fb8@linux.ibm.com>
Date: Fri, 15 Oct 2021 15:36:56 +1100
Message-ID: <878ryuykd3.fsf@mpe.ellerman.id.au>
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
Cc: brking@linux.vnet.ibm.com, james.bottomley@hansenpartnership.com,
 linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> Just stumbled upon this trivial little patch that looks to have gotten lost in
> the shuffle. Seems it even got a reviewed-by from Brian [1].
>
> So, uh I guess after almost 3 years...ping?

It's marked "Changes Requested" here:

  https://patchwork.kernel.org/project/linux-scsi/patch/1547089149-20577-1-git-send-email-tyreld@linux.vnet.ibm.com/


If it isn't picked up in a few days you should probably do a resend so
that it reappears in patchwork.

cheers
