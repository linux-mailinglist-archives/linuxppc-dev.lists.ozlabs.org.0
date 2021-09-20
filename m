Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E0D410FAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 08:55:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCb0Z1n7rz2yLg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 16:55:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pe8Cdnx9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pe8Cdnx9; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCZzx4Lwdz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 16:54:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632120872;
 bh=sKJ1ZZvj6Y2zZJAcAw+KKAZDUfVIHmtBo2h4dr4ZmvI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pe8Cdnx9kOtbP6ZTXdyDPryDhI7SNmk2ykKtZhPbcH93nSZ0dYBYroarhFBX9cee4
 eM6Myc6RKA3IQZvCIpG9TjCmojOdKc9xUSEjejWnxD5VO5m0H5mrR7jUDCVD3593w1
 VHQRrosiZbaJ1vHVBg6GRwDiDNOZz408uQmXxVz7Zu6mT+n4xioYXGcWDw2h3UnY74
 yXDGwtZAHNaQRYlEK8f5eFPPjOCQl8ssxQIh72Iduz4V6gW/IKfwyTwsLrCdf+N2XJ
 2zenSGCxJ5C8oTKxeeQigEKawcI1ySH6eHOrUz4qnEKKZfNCrwH8L9hCwYEJMmDund
 aaHq2F446v53g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCZzq6x2Mz9sW4;
 Mon, 20 Sep 2021 16:54:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] powerpc/perf: Add instruction and data address
 registers to extended regs
In-Reply-To: <YTz+5JxjH45ER5N1@kernel.org>
References: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <bd5a9388-483d-91ca-b371-ab92ae4c08bc@linux.ibm.com>
 <BAA2B1EE-36BA-495A-B507-EC3C996199D8@linux.vnet.ibm.com>
 <YTz+5JxjH45ER5N1@kernel.org>
Date: Mon, 20 Sep 2021 16:54:28 +1000
Message-ID: <87lf3rivob.fsf@mpe.ellerman.id.au>
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
Cc: kajoljain <kjain@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Jiri Olsa <jolsa@kernel.org>,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnaldo Carvalho de Melo <acme@kernel.org> writes:
> Em Mon, Sep 06, 2021 at 08:13:13AM +0530, Athira Rajeev escreveu:
>> > On 02-Sep-2021, at 1:04 PM, kajoljain <kjain@linux.ibm.com> wrote:
>> > On 6/20/21 8:15 PM, Athira Rajeev wrote:
>> >> Patch set adds PMU registers namely Sampled Instruction Address Register
>> >> (SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
>> >> in PowerPC. These registers provides the instruction/data address and
>> >> adding these to extended regs helps in debug purposes.
>> >> 
>> >> Patch 1/2 adds SIAR and SDAR as part of the extended regs mask.
>> >> Patch 2/2 includes perf tools side changes to add the SPRs to
>> >> sample_reg_mask to use with -I? option.
>> >> 
>> >> Athira Rajeev (2):
>> >>  powerpc/perf: Expose instruction and data address registers as part of
>> >>    extended regs
>> >>  tools/perf: Add perf tools support to expose instruction and data
>> >>    address registers as part of extended regs
>> >> 
>> > 
>> > Patchset looks good to me.
>> > 
>> > Reviewed-By: kajol Jain<kjain@linux.ibm.com>
>> 
>> Hi Arnaldo,
>> 
>> Requesting for your review on this patchset.
>
> So, this touches the kernel, usually I get a patchkit when the kernel
> bits landed, is that the case by now?

Not yet, I'd like some changes to the kernel patch.

cheers
