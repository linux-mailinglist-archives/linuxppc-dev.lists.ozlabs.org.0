Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A94F2D3985
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 05:17:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrP024ff7zDqjk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 15:17:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrNyW1BY4zDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 15:16:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Gz4ZDncc; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4CrNyV6X4sz9sWC; Wed,  9 Dec 2020 15:16:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1607487362; bh=jqtZFI7KL7v46Pp3s+SsaUNEfvanCrhY8vPaiiWNGA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gz4ZDnccQU+sPGtfKTwUSUDh7N8XvvpczzIgXv7JISlKiCzQVqCAsPdlSuW+A7Gfq
 z3R4wyUqc6eGJLQBgNIDCiX2+BI9szVsYjR6Os8lqeX9UJKJznIYJWYBf0JPIZnJLC
 KssI9r/eaho7i1UpIa7ghOfnnVWGZyfNgPvwuJXjkKIpM7LFDKwGQMFtcuRD68a/rJ
 Xce8SAKlRLtnF1dthsJO5EC29H3Y95tsH9VFY1OE7fCMLRyJenZI3K7KVUMwQS4FBI
 GG3HUXbionHOVT/NF7hwYoVg8bafbns0Ie8Wmbd+1GYDQx968Qysh4+liKDdnguWJd
 GKRGvDE+l9Yww==
Date: Wed, 9 Dec 2020 15:15:42 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v1 1/2] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE (nested case only)
Message-ID: <20201209041542.GA29825@thinks.paulus.ozlabs.org>
References: <20201019112642.53016-1-bharata@linux.ibm.com>
 <20201019112642.53016-2-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019112642.53016-2-bharata@linux.ibm.com>
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 19, 2020 at 04:56:41PM +0530, Bharata B Rao wrote:
> Implements H_RPT_INVALIDATE hcall and supports only nested case
> currently.
> 
> A KVM capability KVM_CAP_RPT_INVALIDATE is added to indicate the
> support for this hcall.

I have a couple of questions about this patch:

1. Is this something that is useful today, or is it something that may
become useful in the future depending on future product plans?  In
other words, what advantage is there to forcing L2 guests to use this
hcall instead of doing tlbie themselves?

2. Why does it need to be added to the default-enabled hcall list?

There is a concern that if this is enabled by default we could get the
situation where a guest using it gets migrated to a host that doesn't
support it, which would be bad.  That is the reason that all new
things like this are disabled by default and only enabled by userspace
(i.e. QEMU) in situations where we can enforce that it is available on
all hosts to which the VM might be migrated.

Thanks,
Paul.
